### Wheel rules
#   Create or copy a requirements.txt file containing all the needed wheels;
#   Pick up cross-compiled wheels, or build/download pure-python wheels;
#   Rename to a generic format and move wheels to wheelhouse in preparation 
#    for processing by spksrc.copy.mk.

# Targets are executed in the following order:
#  wheel_msg_target
#  pre_wheel_target   (override with PRE_WHEEL_TARGET)
#  build_wheel_target (override with WHEEL_TARGET)
#  post_wheel_target  (override with POST_WHEEL_TARGET)
# Variables:
#  WHEELS             List of wheels to go through

WHEEL_COOKIE = $(WORK_DIR)/.$(COOKIE_PREFIX)wheel_done

ifeq ($(strip $(PRE_WHEEL_TARGET)),)
PRE_WHEEL_TARGET = pre_wheel_target
else
$(PRE_WHEEL_TARGET): wheel_msg_target
endif
ifeq ($(strip $(WHEEL_TARGET)),)
WHEEL_TARGET = build_wheel_target
else
$(WHEEL_TARGET): $(PRE_WHEEL_TARGET)
endif
ifeq ($(strip $(POST_WHEEL_TARGET)),)
POST_WHEEL_TARGET = post_wheel_target
else
$(POST_WHEEL_TARGET): $(WHEEL_TARGET)
endif


wheel_msg_target:
	@$(MSG) "Processing wheels of $(NAME)"

pre_wheel_target: wheel_msg_target
	@if [ -n "$(WHEELS)" ] ; then \
		mkdir -p $(WORK_DIR)/wheels/inter ; \
		if [ -f "$(WHEELS)" ] ; then \
			$(MSG) "Using existing requirements file" ; \
			cp -f $(WHEELS) $(WORK_DIR)/wheels/inter/requirements.txt ; \
		else \
			$(MSG) "Creating requirements file" ; \
			rm -f $(WORK_DIR)/wheels/inter/requirements.txt ; \
			for wheel in $(WHEELS) ; \
			do \
				echo $$wheel >> $(WORK_DIR)/wheels/inter/requirements.txt ; \
			done \
		fi ; \
	fi

build_wheel_target: $(PRE_WHEEL_TARGET)
	@export LD= LDSHARED= CPP= NM= CC= AS= RANLIB= CXX= AR= STRIP= OBJDUMP= READELF= CFLAGS= CPPFLAGS= CXXFLAGS= LDFLAGS= && \
	  $(PIP) -vvv wheel --no-deps -w $(WORK_DIR)/wheels/inter -f $(WORK_DIR)/wheels/inter -r $(WORK_DIR)/wheels/inter/requirements.txt ; \

post_wheel_target: $(WHEEL_TARGET)
	@mkdir -p $(STAGING_INSTALL_PREFIX)/share/wheelhouse
	cp $(WORK_DIR)/wheels/inter/requirements.txt $(STAGING_INSTALL_PREFIX)/share/wheelhouse/requirements.txt
	@cd $(WORK_DIR)/wheels/inter && \
	  for w in *.whl; do \
		cp -f $$w $(STAGING_INSTALL_PREFIX)/share/wheelhouse/`echo $$w | cut -d"-" -f -2`-py2.py3-none-any.whl; \
	  done ; \


ifeq ($(wildcard $(WHEEL_COOKIE)),)
wheel: $(WHEEL_COOKIE)

$(WHEEL_COOKIE): $(POST_WHEEL_TARGET)
	$(create_target_dir)
	@touch -f $@
else
wheel: ;
endif

