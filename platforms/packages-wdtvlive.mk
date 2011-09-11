PERL_MAJOR_VER = 5.10

SPECIFIC_PACKAGES = \
	ipkg-opt \
	$(PACKAGES_REQUIRE_LINUX26) \

ifneq ($(HOST_MACHINE),mips)

BROKEN_PACKAGES = \
	$(PACKAGES_ONLY_WORK_ON_LINUX24) \

BROKEN_PACKAGES = \
	aget \
	aspell \
	atftp \
	atk \
	avahi \
	 samba34 \
	 samba35 \
	bitchx \
	bsdgames \
	bind \
	connect \
	cpio \
	bluez2-libs \
	 bluez2-utils \
	cairo \
	calc \
	dansguardian\
	dcraw\
	ecl \
	emacs \
	emacs22 \
	esniper \
	esound \
	 libao\
	 ivorbis-tools\
	 vorbis-tools\
	ettercap-ng \
	ffmpeg \
	 fuppes \
	 libdlna \
	  ushare\
	 motion \
	 mpd \
	 sox \
	 mt-daapd-svn\
	 transcode\
	 vlc\
	ficy \
	flac \
	  mkvtoolnix \
	  moc\
	ftpd-topfield \
	gambit-c \
	id3lib \
	 castget \
	phoneme-advanced\
	php\
	 appweb\
	 eaccelerator\
	php-apache\
	php-fcgi\
	php-thttpd\
	picolisp\
	pkgconfig\
	ghostscript \
	gdb \
	go-lang \
	gift-ares \
	haproxy \
	haserl \
	ipac-ng\
	ircd-hybrid\
	jove\
	knock\
	launchtool\
	ldconfig\
	libcapi\
	libcdio\
	libdvb\
	libgc\
	 w3m\
	libmad\
	 madplay\
	libnsl\
	  postfix\
	libol\
	mdadm\
	motor \
	minidlna\
	mlocate\
	moblock\
	mpg123 \
	mp3blaster \
	msort\
	mt-daapd \
	mutt \
	myrapbook\
	netatalk\
	nget \
	nfs-utils \
	puppy \
	qemacs\
	quagga\
	palantir\
	kismet \
	libbt \
	liba52 \
	libijs \
	  gutenprint \
	littlesmalltalk\
	lua \
		lighttpd\
		luarocks\
		nmap\
	lm-sensors\
	ntop \
      gnu-smalltalk \
      gconv-modules \
      gnupg\
	tcl \
         eggdrop \
	 \
	 x11\
	  xt\
	   xaw\
	  xcursor\
	  xdpyinfo\
	  xext\
	   xmu\
	    xauth\
	  xfixes\
	  xft\
	   pango\
	  xpm\
	  xterm\
	  xtst\
	  fixesext\
	  ice\
	   sm\
	  sdl\
	   qemu\
	  recordext\
	  renderext\
	   xrender\
	inetutils \
	modutils\
	qemu-libc-i386 \
	quickie\
	quilt\
	py-duplicity\
	py-gdchart2\
	py-rdiff-backup\
	py-zope-interface\
	rhtvision\
	rsstail\
	sablevm\
	samba2\
	scli\
	ser\
	slrn\
	syslog-ng\
	swi-prolog\
	texinfo\
	tcsh\
	transmissiond\
	xmlrpc-c\
	  rtorrent\
	xvid \
	x264 \
	$(ASTERISK_PACKAGES)\
	$(ERLANG_PACKAGES)\
	perl\
	 openser\
	 opensips\
	slsc\
	squeak\
	smartmontools\
	uemacs\
	upx\
	ulogd\
	uncia\
	ssam\
	stunnel\
	streamripper\
	syx\
	tinyscheme\
	tnftpd\
	unfs3\
	utf8proc\
	util-linux\
	wavpack\
	
#WRAPPER ESCAPE
BROKEN_PACKAGES += \
	py-psycopg2
#CPPFLAGS for HOSTCOMPILE
BROKEN_PACKAGES += \
	clearsilver\

#CROSSPROBLEM
BROKEN_PACKAGES += \
	py-bittorrent\

# SOURCE missing
BROKEN_PACKAGES += \
	py-bluez

#-lsane missing
BROKEN_PACKAGES += \
	hplip

#empty strip
BROKEN_PACKAGES += \
	bacula\
	mailman\
	py-simplejson\

BROKEN_PACKAGES += \
	player\

XXX=	python27\
	python3\
	python \
	  $(PYTHON_PACKAGES)\
	  dbus-python \
	  py-setuptools \
	   distcc \
	  newt \
	  svn \
	python24 \
	  clearsilver \
	python25 \
	  boost \
	   player \
	   srecord\
	   uncia\
ALSA-OSS_CPPFLAGS+=-U_FILE_OFFSET_BITS

ZOO_CPPFLAGS+=-U_FILE_OFFSET_BITS
POLIPO_CPPFLAGS+=-U_FILE_OFFSET_BITS

IMAGEMAGICK_CPPFLAGS+=-U_FILE_OFFSET_BITS

X264_CPPFLAGS+=-fPIC
endif

RTORRENT_VERSION := 0.8.2
RTORRENT_IPK_VERSION := 2

ARIA2_PATCHES += $(SOURCE_DIR)/aria2/IPV6_V6ONLY-wdtv.patch
