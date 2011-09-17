###########################################################
#
# mp3val
#
###########################################################
#
# MP3VAL_VERSION, MP3VAL_SITE and MP3VAL_SOURCE define
# the upstream location of the source code for the package.
# MP3VAL_DIR is the directory which is created when the source
# archive is unpacked.
# MP3VAL_UNZIP is the command used to unzip the source.
# It is usually "zcat" (for .gz) or "bzcat" (for .bz2)
#
# You should change all these variables to suit your package.
# Please make sure that you add a description, and that you
# list all your packages' dependencies, seperated by commas.
#
# If you list yourself as MAINTAINER, please give a valid email
# address, and indicate your irc nick if it cannot be easily deduced
# from your name or email address.  If you leave MAINTAINER set to
# "NSLU2 Linux" other developers will feel free to edit.
#
MP3VAL_SITE=http://downloads.sourceforge.net/mp3val/
MP3VAL_VERSION=0.1.8
MP3VAL_SOURCE=mp3val-$(MP3VAL_VERSION)-src.tar.gz
MP3VAL_DIR=mp3val-$(MP3VAL_VERSION)-src
MP3VAL_UNZIP=zcat
MP3VAL_MAINTAINER=NSLU2 Linux <nslu2-linux@yahoogroups.com>
MP3VAL_DESCRIPTION=A little utility used to read and modify the ID3 tags of MP3 files.
MP3VAL_SECTION=audio
MP3VAL_PRIORITY=optional
MP3VAL_DEPENDS=ncurses
MP3VAL_SUGGESTS=
MP3VAL_CONFLICTS=

#
# MP3VAL_IPK_VERSION should be incremented when the ipk changes.
#
MP3VAL_IPK_VERSION=1

#
# MP3VAL_CONFFILES should be a list of user-editable files
#MP3VAL_CONFFILES=/opt/etc/mp3val.conf /opt/etc/init.d/SXXmp3val

#
# MP3VAL_PATCHES should list any patches, in the the order in
# which they should be applied to the source code.
#
#MP3VAL_PATCHES=$(MP3VAL_SOURCE_DIR)/configure.patch

#
# If the compilation of the package requires additional
# compilation or linking flags, then list them here.
#
MP3VAL_CPPFLAGS=-I$(STAGING_INCLUDE_DIR)/ncurses
MP3VAL_LDFLAGS=

#
# MP3VAL_BUILD_DIR is the directory in which the build is done.
# MP3VAL_SOURCE_DIR is the directory which holds all the
# patches and ipkg control files.
# MP3VAL_IPK_DIR is the directory in which the ipk is built.
# MP3VAL_IPK is the name of the resulting ipk files.
#
# You should not change any of these variables.
#
MP3VAL_BUILD_DIR=$(BUILD_DIR)/mp3val
MP3VAL_SOURCE_DIR=$(SOURCE_DIR)/mp3val
MP3VAL_IPK_DIR=$(BUILD_DIR)/mp3val-$(MP3VAL_VERSION)-ipk
MP3VAL_IPK=$(BUILD_DIR)/mp3val_$(MP3VAL_VERSION)-$(MP3VAL_IPK_VERSION)_$(TARGET_ARCH).ipk

.PHONY: mp3val-source mp3val-unpack mp3val mp3val-stage mp3val-ipk mp3val-clean mp3val-dirclean mp3val-check

#
# This is the dependency on the source code.  If the source is missing,
# then it will be fetched from the site using wget.
#
$(DL_DIR)/$(MP3VAL_SOURCE):
	$(WGET) -P $(@D) $(MP3VAL_SITE)/$(@F) || \
	$(WGET) -P $(@D) $(SOURCES_NLO_SITE)/$(@F)

#
# The source code depends on it existing within the download directory.
# This target will be called by the top level Makefile to download the
# source code's archive (.tar.gz, .bz2, etc.)
#
mp3val-source: $(DL_DIR)/$(MP3VAL_SOURCE) $(MP3VAL_PATCHES)

#
# This target unpacks the source code in the build directory.
# If the source archive is not .tar.gz or .tar.bz2, then you will need
# to change the commands here.  Patches to the source code are also
# applied in this target as required.
#
# This target also configures the build within the build directory.
# Flags such as LDFLAGS and CPPFLAGS should be passed into configure
# and NOT $(MAKE) below.  Passing it to configure causes configure to
# correctly BUILD the Makefile with the right paths, where passing it
# to Make causes it to override the default search paths of the compiler.
#
# If the compilation of the package requires other packages to be staged
# first, then do that first (e.g. "$(MAKE) <bar>-stage <baz>-stage").
#
# If the package uses  GNU libtool, you should invoke $(PATCH_LIBTOOL) as
# shown below to make various patches to it.
#
$(MP3VAL_BUILD_DIR)/.configured: $(DL_DIR)/$(MP3VAL_SOURCE) $(MP3VAL_PATCHES) make/mp3val.mk
	rm -rf $(BUILD_DIR)/$(MP3VAL_DIR) $(@D)
	$(MP3VAL_UNZIP) $(DL_DIR)/$(MP3VAL_SOURCE) | tar -C $(BUILD_DIR) -xvf -
	if test -n "$(MP3VAL_PATCHES)" ; \
		then cat $(MP3VAL_PATCHES) | \
		patch -d $(BUILD_DIR)/$(MP3VAL_DIR) -p0 ; \
	fi
	if test "$(BUILD_DIR)/$(MP3VAL_DIR)" != "$(@D)" ; \
		then mv $(BUILD_DIR)/$(MP3VAL_DIR) $(@D) ; \
	fi
	touch $@

mp3val-unpack: $(MP3VAL_BUILD_DIR)/.configured

#
# This builds the actual binary.
#
$(MP3VAL_BUILD_DIR)/.built: $(MP3VAL_BUILD_DIR)/.configured
	rm -f $@
	$(MAKE) -f $(@D)/Makefile.linux -C $(@D) mp3val\
		prefix=/opt \
		$(TARGET_CONFIGURE_OPTS) \
		CXXFLAGS="$(STAGING_CPPFLAGS) $(MP3VAL_CPPFLAGS)" \
		LDFLAGS="$(STAGING_LDFLAGS) $(MP3VAL_LDFLAGS)" \
		;
	touch $@

#
# This is the build convenience target.
#
mp3val: $(MP3VAL_BUILD_DIR)/.built

#
# If you are building a library, then you need to stage it too.
#
#$(MP3VAL_BUILD_DIR)/.staged: $(MP3VAL_BUILD_DIR)/.built

#mp3val-stage: $(MP3VAL_BUILD_DIR)/.staged

#
# This rule creates a control file for ipkg.  It is no longer
# necessary to create a seperate control file under sources/mp3val
#
$(MP3VAL_IPK_DIR)/CONTROL/control:
	@install -d $(@D)
	@rm -f $@
	@echo "Package: mp3val" >>$@
	@echo "Architecture: $(TARGET_ARCH)" >>$@
	@echo "Priority: $(MP3VAL_PRIORITY)" >>$@
	@echo "Section: $(MP3VAL_SECTION)" >>$@
	@echo "Version: $(MP3VAL_VERSION)-$(MP3VAL_IPK_VERSION)" >>$@
	@echo "Maintainer: $(MP3VAL_MAINTAINER)" >>$@
	@echo "Source: $(MP3VAL_SITE)/$(MP3VAL_SOURCE)" >>$@
	@echo "Description: $(MP3VAL_DESCRIPTION)" >>$@
	@echo "Depends: $(MP3VAL_DEPENDS)" >>$@
	@echo "Suggests: $(MP3VAL_SUGGESTS)" >>$@
	@echo "Conflicts: $(MP3VAL_CONFLICTS)" >>$@

#
# This builds the IPK file.
#
# Binaries should be installed into $(MP3VAL_IPK_DIR)/opt/sbin or $(MP3VAL_IPK_DIR)/opt/bin
# (use the location in a well-known Linux distro as a guide for choosing sbin or bin).
# Libraries and include files should be installed into $(MP3VAL_IPK_DIR)/opt/{lib,include}
# Configuration files should be installed in $(MP3VAL_IPK_DIR)/opt/etc/mp3val/...
# Documentation files should be installed in $(MP3VAL_IPK_DIR)/opt/doc/mp3val/...
# Daemon startup scripts should be installed in $(MP3VAL_IPK_DIR)/opt/etc/init.d/S??mp3val
#
# You may need to patch your application to make it use these locations.
#
$(MP3VAL_IPK): $(MP3VAL_BUILD_DIR)/.built
	rm -rf $(MP3VAL_IPK_DIR) $(BUILD_DIR)/mp3val_*_$(TARGET_ARCH).ipk
	$(MAKE) $(MP3VAL_IPK_DIR)/CONTROL/control
	install -d $(MP3VAL_IPK_DIR)/opt/bin $(MP3VAL_IPK_DIR)/opt/share/doc/mp3val
	install -m 755 $(MP3VAL_BUILD_DIR)/mp3val $(MP3VAL_IPK_DIR)/opt/bin/mp3val
	install -m 644 $(MP3VAL_BUILD_DIR)/manual.html $(MP3VAL_IPK_DIR)/opt/share/doc/mp3val/manual.html
#	install -d $(MP3VAL_IPK_DIR)/opt/etc/init.d
#	install -m 755 $(MP3VAL_SOURCE_DIR)/rc.mp3val $(MP3VAL_IPK_DIR)/opt/etc/init.d/SXXmp3val
#	sed -i -e '/^#!/aOPTWARE_TARGET=${OPTWARE_TARGET}' $(MP3VAL_IPK_DIR)/opt/etc/init.d/SXXmp3val
#	install -m 755 $(MP3VAL_SOURCE_DIR)/postinst $(MP3VAL_IPK_DIR)/CONTROL/postinst
#	sed -i -e '/^#!/aOPTWARE_TARGET=${OPTWARE_TARGET}' $(MP3VAL_IPK_DIR)/CONTROL/postinst
#	install -m 755 $(MP3VAL_SOURCE_DIR)/prerm $(MP3VAL_IPK_DIR)/CONTROL/prerm
#	sed -i -e '/^#!/aOPTWARE_TARGET=${OPTWARE_TARGET}' $(MP3VAL_IPK_DIR)/CONTROL/prerm
#	if test -n "$(UPD-ALT_PREFIX)"; then \
		sed -i -e '/^[ 	]*update-alternatives /s|update-alternatives|$(UPD-ALT_PREFIX)/bin/&|' \
			$(MP3VAL_IPK_DIR)/CONTROL/postinst $(MP3VAL_IPK_DIR)/CONTROL/prerm; \
	fi
	echo $(MP3VAL_CONFFILES) | sed -e 's/ /\n/g' > $(MP3VAL_IPK_DIR)/CONTROL/conffiles
	cd $(BUILD_DIR); $(IPKG_BUILD) $(MP3VAL_IPK_DIR)

#
# This is called from the top level makefile to create the IPK file.
#
mp3val-ipk: $(MP3VAL_IPK)

#
# This is called from the top level makefile to clean all of the built files.
#
mp3val-clean:
	rm -f $(MP3VAL_BUILD_DIR)/.built
	-$(MAKE) -C $(MP3VAL_BUILD_DIR) clean

#
# This is called from the top level makefile to clean all dynamically created
# directories.
#
mp3val-dirclean:
	rm -rf $(BUILD_DIR)/$(MP3VAL_DIR) $(MP3VAL_BUILD_DIR) $(MP3VAL_IPK_DIR) $(MP3VAL_IPK)
#
#
# Some sanity check for the package.
#
mp3val-check: $(MP3VAL_IPK)
	perl scripts/optware-check-package.pl --target=$(OPTWARE_TARGET) $(MP3VAL_IPK)
