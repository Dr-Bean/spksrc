### Python wheel rules
#   Invoke make to make a cross-compiled wheel for a python module.
#   Rename to generic format, and move wheels to an intermediary location
#    for processing by spksrc.wheel.mk
# You can do some customization through python-cc.mk

# Python module targets
ifeq ($(strip $(CONFIGURE_TARGET)),)
CONFIGURE_TARGET = nope
endif
ifeq ($(strip $(COMPILE_TARGET)),)
COMPILE_TARGET = compile_python_wheel
endif
ifeq ($(strip $(INSTALL_TARGET)),)
INSTALL_TARGET = install_python_wheel
endif


# Resume with standard spksrc.cross-cc.mk
include ../../mk/spksrc.cross-cc.mk

# Fetch python variables
-include $(WORK_DIR)/python-cc.mk

# Python module variables
PYTHONPATH = $(PYTHON_LIB_NATIVE):$(INSTALL_DIR)$(INSTALL_PREFIX)/$(PYTHON_LIB_DIR)/site-packages/


### Python wheel rules
compile_python_wheel:
	@$(RUN) PYTHONPATH=$(PYTHONPATH) $(HOSTPYTHON) -c "import setuptools;__file__='setup.py';exec(compile(open(__file__).read().replace('\r\n', '\n'), __file__, 'exec'))" bdist_wheel -d $(WORK_DIR)/wheels/cross

install_python_wheel:
	@mkdir -p $(WORK_DIR)/wheels/inter
	@cd $(WORK_DIR)/wheels/cross && for w in *.whl; do cp -f $$w $(WORK_DIR)/wheels/inter/`echo $$w | cut -d"-" -f -2`-py2.py3-none-any.whl; done ; \

all: install
