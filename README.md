Net::PayPal
===========

Perl interface to PayPal's REST API for creating, processing and managing payments.

### Installation ###

    cpanm Net::PayPal

Synopsis
--------

```perl
    use Net::PayPal;

    my $paypal = Net::PayPal->new(
        client_id => $client_id,
        secret    => $client_secret
    );

    my $payment = $paypal->cc_payment({
        cc_number       => '4353185781082049',
        cc_type         => 'visa',
        cc_expire_month => 3,
        cc_expire_year  => 2018,
        amount          => 19.95,
    }) or die $paypal->error;

    if ($payment->{state} eq 'approved') {
        say 'Thank you for your payment!';
    }
```

WARNING
-------

Since as of this writing (March 10th, 2013) PayPal's REST api was still
in BETA state it's fair to consider Net::PayPal is an ALPHA software,
meaning any part of this module may change in subsequent releases. In
the meantime any suggestions and feedback and contributions are welcome.

Consult CHANGES file in the root folder of the distribution before
upgrading

Description
-----------

Net::PayPal implements PayPal's REST API. Visit
http://developer.paypal.com for further information.

To start using Net::PayPal the following actions must be completed to
gain access to API endpoints:

1. Sign up for a developer account by visiting http://developer.paypal.com.
It is free!

2. Under "Applications" tab (after signing into developer.paypal.com)
make note of secret and client_id. You will need these two
identifiers to interact with PayPal's API server

3. Create Net::PayPal instance using secret and "client_id"
identifiers.

Author
------

Sherzod B. Ruzmetov <sherzodr@cpan.org>

COPYRIGHT AND LICENSE
---------------------

Copyright (C) 2013-2014 Sherzod B. Ruzmetov.

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself, either Perl version 5.14.2 or, at
your option, any later version of Perl 5 you may have available.

