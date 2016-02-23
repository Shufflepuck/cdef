
`cdef` is a handy command-line tool to mess with your default applications.

I currently use it to:
- Change default browser to Chrome
- Change .xml handling from Xcode to TextMate

It uses: 
- URL
- UTI

Download it from the [Releases page](https://github.com/ftiff/cdef/releases)

Note: Please fork and Pull Request, or [create an issue](https://github.com/ftiff/cdef/issues)

# What are UTI? (Uniform Type Identifiers)

Uniform type identifiers (UTIs) provide a unified way to identify data handled within the system, such as documents, pasteboard data, and bundles. This chapter describes the concepts behind UTIs and shows how to specify them in your application bundles.

Have more information on [Apple's website](https://developer.apple.com/library/ios/documentation/FileManagement/Conceptual/understanding_utis/understand_utis_conc/understand_utis_conc.html#//apple_ref/doc/uid/TP40001319-CH202-CHDHIJDE)



# Examples

###Get the default application to open PNG files:
```
$ cdef -readdefaultuti public.png
public.png -> com.apple.Preview
```

###Get all applications that *can* open PNG files:
```
$ cdef -readalluti public.png
public.png -> com.pixelmatorteam.pixelmator
public.png -> com.tapbots.TweetbotMac
public.png -> com.omnigroup.OmniGraffle6.MacAppStore
public.png -> com.apple.ColorSyncUtility
public.png -> com.apple.Preview
```

###Get which application will open `http://` URLs:
```
$ cdef -readdefaulturl http
http -> com.apple.Safari
```

###Change your default browser to Chrome:
```
$ cdef -writedefaulturl http com.google.chrome
```
Note: This will prompt a dialog to ask the user to confirm the change to Chrome.

I use it in my deployments as a Casper policy that executes `/usr/bin/sudo -u#501 /usr/local/bin/cdef -writedefaulturl http com.google.chrome`

See the list of UTIs here: https://developer.apple.com/library/ios/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html#//apple_ref/doc/uid/TP40009259-SW1
