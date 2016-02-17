# Examples
```
berry:~/Downloads $ cdef -readdefaultuti public.png
public.png -> com.apple.Preview
berry:~/Downloads $ cdef -readalluti public.png
public.png -> com.pixelmatorteam.pixelmator
public.png -> com.tapbots.TweetbotMac
public.png -> com.omnigroup.OmniGraffle6.MacAppStore
public.png -> com.apple.ColorSyncUtility
public.png -> com.apple.Preview
berry:~/Downloads $ cdef -readdefaulturl http
http -> com.apple.Safari
berry:~/Downloads $ cdef -writedefaulturl http com.google.chrome
berry:~/Downloads $ 
```

See the list of UTIs here: https://developer.apple.com/library/ios/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html#//apple_ref/doc/uid/TP40009259-SW1
