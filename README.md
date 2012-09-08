# Mutt

## packages needed by Debian
* Packages needed
<pre>
getmail4                              mail retriever with support for POP3, IMAP4 and SDPS
procmail                              Versatile e-mail processor
mutt                                  text-based mailreader supporting MIME, GPG, PGP and threading
mutt-patched                          Mutt Mail User Agent with extra patches
mutt-vc-query                         vCard query utility for mutt
notmuch-mutt                          thread-based email index, search and tagging (Mutt interface)
libnotify-bin                         sends desktop notifications to a notification daemon (Utilities)
</pre>


## check new mail and send desktop notify
### $` crontab -e`
> `*/3 * * * * $HOME/.mutt/check-new-mail.sh`


## use getmail to get new mail
### expamles/msmtprc
> msmtp is used to send emails from either account via the commandline
or Mutt.

## use procmail to filter mails
### expamles/procmailrc
> procmail is used to filter mails to different mail dirs

## Mail query
Mail query is a little C app I wrote which reads your existing mail for
addresses and presents them in a format such that mutt can use them for
tab completion. Given a small enough mailbox, it's usably fast.

It is available in its own [repo][].

[repo]: https://github.com/pbrisbin/mail-query

## Notmuch

Notmuch support is fully integrated in mutt-kz. Search with `,s`.

## Mutt

Mutt accesses the mailboxes under the two synced folders in `~/Mail` and
uses `folder-hook`s to adjust the appropriate settings (`from`,
`sendmail`, etc) depending on what folder you're in.

Be sure to review all settings and `man muttrc` for anything you don't
understand.


