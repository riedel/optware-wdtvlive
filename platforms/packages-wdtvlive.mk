PERL_MAJOR_VER = 5.10

SPECIFIC_PACKAGES = \
	ipkg-opt \
	$(PACKAGES_REQUIRE_LINUX26) \

ifneq ($(HOST_MACHINE),mips)

BROKEN_PACKAGES = \
	$(PACKAGES_ONLY_WORK_ON_LINUX24) \
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
	clamav \
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
	  moc\
	ftpd-topfield \
	gambit-c \
	id3lib \
	 castget \
	glib \
	 finch \
	 gnokii \
	 ncmpc \
	 libopensync\
	  msynctool\
	  obexftp\
	 pango\
	 silc-client\
	 syslog-ng\
	 tshark\
	phoneme-advanced\
	php-apache\
	php-fcgi\
	php-thttpd\
	picolisp\
	pkgconfig\
	gconv-modules \
	 snownews\
	ghostscript \
	gdb \
	go-lang \
	gift-ares \
	gift-opennap \
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
	liblcms\
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
	mpc \
	mpg123 \
	mp3blaster \
	msort\
	mt-daapd \
	mutt \
	myrapbook\
	netatalk\
	nget \
	nfs-utils \
	openldap \
	 gnupg1 \
	 gnupg \
	php \
	  appweb \
	  eaccelerator \
	puppy \
	python24 \
	  clearsilver \
	python25 \
	  boost \
	   mkvtoolnix \
	   player \
	   srecord\
	   uncia\
	python26 \
	python27\
	python3\
	python \
	  $(PYTHON_PACKAGES)\
	  bacula\
	  dbus-python \
	  py-setuptools \
	   distcc \
	  newt \
	  svn \
	qemacs\
	quagga\
	oleo\
	pal\
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
	tcl \
         eggdrop \
	xau \
	 fixesext \
	 recordext \
	 renderext \
	  xrender\
	 ice \
	  sm\
	 qemu \
	 sdl \
	 x11\
	  xt\
	   xaw\
	  xcursor\
	  xdpyinfo\
	  xext\
	   xmu\
	  xfixes\
	  xft\
	  xpm\
	  xterm\
	  xtst\
	 xauth\
	imagemagick \
	inetutils \
	qemu-libc-i386 \
	quickie\
	quilt\
	recode\
	rhtvision\
	rsstail\
	sablevm\
	samba2\
	scli\
	ser\
	slrn\
	swi-prolog\
	texinfo\
	tcsh\
	transmissiond\
	xmail \
	xmlrpc-c\
	  rtorrent\
	xvid \
	x264 \
	yougrabber \
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
	ssam\
	stunnel\
	streamripper\
	syx\
	tinyscheme\
	tnftpd\
	tinyproxy\
	unfs3\
	utf8proc\
	util-linux\
	wavpack\

ALSA-OSS_CPPFLAGS+=-U_FILE_OFFSET_BITS

ZOO_CPPFLAGS+=-U_FILE_OFFSET_BITS
POLIPO_CPPFLAGS+=-U_FILE_OFFSET_BITS

X264_CPPFLAGS+=-fPIC
endif

RTORRENT_VERSION := 0.8.2
RTORRENT_IPK_VERSION := 2

ARIA2_PATCHES += $(SOURCE_DIR)/aria2/IPV6_V6ONLY-wdtv.patch
