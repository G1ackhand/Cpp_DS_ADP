package OpenSSL::safe::installdata;

use strict;
use warnings;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(
    @PREFIX
    @libdir
    @BINDIR @BINDIR_REL_PREFIX
    @LIBDIR @LIBDIR_REL_PREFIX
    @INCLUDEDIR @INCLUDEDIR_REL_PREFIX
    @APPLINKDIR @APPLINKDIR_REL_PREFIX
    @ENGINESDIR @ENGINESDIR_REL_LIBDIR
    @MODULESDIR @MODULESDIR_REL_LIBDIR
    @PKGCONFIGDIR @PKGCONFIGDIR_REL_LIBDIR
    @CMAKECONFIGDIR @CMAKECONFIGDIR_REL_LIBDIR
    $VERSION @LDLIBS
);

our @PREFIX                     = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0' );
our @libdir                     = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0' );
our @BINDIR                     = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/apps' );
our @BINDIR_REL_PREFIX          = ( 'apps' );
our @LIBDIR                     = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0' );
our @LIBDIR_REL_PREFIX          = ( '' );
our @INCLUDEDIR                 = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/include', '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/include' );
our @INCLUDEDIR_REL_PREFIX      = ( 'include', './include' );
our @APPLINKDIR                 = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/ms' );
our @APPLINKDIR_REL_PREFIX      = ( 'ms' );
our @ENGINESDIR                 = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/engines' );
our @ENGINESDIR_REL_LIBDIR      = ( 'engines' );
our @MODULESDIR                 = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/providers' );
our @MODULESDIR_REL_LIBDIR      = ( 'providers' );
our @PKGCONFIGDIR               = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0' );
our @PKGCONFIGDIR_REL_LIBDIR    = ( '.' );
our @CMAKECONFIGDIR             = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0' );
our @CMAKECONFIGDIR_REL_LIBDIR  = ( '.' );
our $VERSION                    = '3.4.0';
our @LDLIBS                     =
    # Unix and Windows use space separation, VMS uses comma separation
    $^O eq 'VMS'
    ? split(/ *, */, ' ')
    : split(/ +/, ' ');

1;
