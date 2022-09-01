XCODE_USER_TEMPLATES_DIR=~/Library/Developer/Xcode/Templates
PROJECT_TEMPLATES=./Cinnamon\ -\ Project\ Templates

install:
	mkdir -p $(XCODE_USER_TEMPLATES_DIR)
	rm -R -f $(XCODE_USER_TEMPLATES_DIR)/$(PROJECT_TEMPLATES) 
	cp -R -f $(PROJECT_TEMPLATES) $(XCODE_USER_TEMPLATES_DIR)
	echo "Installed templates"

uninstall:
	rm -R -f $(XCODE_USER_TEMPLATES_DIR)/$(PROJECT_TEMPLATES)
	echo "Uninstalled templates"
