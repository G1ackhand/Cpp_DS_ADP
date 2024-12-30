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

our @PREFIX                     = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build' );
our @libdir                     = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build/lib' );
our @BINDIR                     = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build/bin' );
our @BINDIR_REL_PREFIX          = ( 'bin' );
our @LIBDIR                     = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build/lib' );
our @LIBDIR_REL_PREFIX          = ( 'lib' );
our @INCLUDEDIR                 = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build/include' );
our @INCLUDEDIR_REL_PREFIX      = ( 'include' );
our @APPLINKDIR                 = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build/include/openssl' );
our @APPLINKDIR_REL_PREFIX      = ( 'include/openssl' );
our @ENGINESDIR                 = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build/lib/engines-3' );
our @ENGINESDIR_REL_LIBDIR      = ( 'engines-3' );
our @MODULESDIR                 = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build/lib/ossl-modules' );
our @MODULESDIR_REL_LIBDIR      = ( 'ossl-modules' );
our @PKGCONFIGDIR               = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build/lib/pkgconfig' );
our @PKGCONFIGDIR_REL_LIBDIR    = ( 'pkgconfig' );
our @CMAKECONFIGDIR             = ( '/Users/g1/Desktop/G1/study/cpp/ds-al-cpp/libs/openssl-3.4.0/build/lib/cmake/OpenSSL' );
our @CMAKECONFIGDIR_REL_LIBDIR  = ( 'cmake/OpenSSL' );
our $VERSION                    = '3.4.0';
our @LDLIBS                     =
    # Unix and Windows use space separation, VMS uses comma separation
    $^O eq 'VMS'
    ? split(/ *, */, ' ')
    : split(/ +/, ' ');

1;
