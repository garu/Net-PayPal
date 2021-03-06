use 5.014002;
use ExtUtils::MakeMaker;

my $has_color = -t STDOUT && eval 'use Term::ANSIColor; 1';

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Net::PayPal',
    VERSION_FROM => 'lib/Net/PayPal.pm',
    PREREQ_PM    => {
        'Cache::Cache'     => 0,
        'LWP::UserAgent'   => 0,
        'JSON'             => 0,
        'Crypt::SSLeay'    => 0,
        'Test::More'       => 0,
        'Crypt::CBC'       => 0,
        'Crypt::Blowfish'  => 0,
        'File::Spec'       => 0,
        'HTTP::Headers'    => 0,
        'HTTP::Request'    => 0,
    },
    (
        $] >= 5.005
        ? (
            ABSTRACT_FROM => 'lib/Net/PayPal.pm',
            AUTHOR        => 'Sherzod B. Ruzmetov <sherzodr@cpan.org>'
          )
        : ()
    ),
);


unless ($ENV{NET_PAYPAL_CLIENT_ID} && $ENV{NET_PAYPAL_SECRET}) {
    my $usage = <<'USAGE';
To run the tests you must set the following environmental variables:

    NET_PAYPAL_CLIENT_ID    - to the value of your client_id as provided by PayPal Developer Network
    NET_PAYPAL_SECRET       - to the value of your secret token as provided by PayPal Developer Network

Not setting the above variables will cause all the tests to skip!

USAGE

    print ($has_color ? color('bold red') . $usage . color('reset') : $usage);
}


