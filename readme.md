# FogBugz Outlook Plugin

> Outlook Plugin deeply integrates FogBugz case management into your standard email workflow.
> It adds a **Case from Message** button to the MS Outlook toolbar; just click it to turn
> the contents of the current email into a new FogBugz case.

## Requirements

This source code uses various tools / libraries.
You need to obtain a license for each of the following applications / components
before you can compile the sourcecode into a working application:

1. **Embarcadero Delphi**, version 2007 and up: http://www.embarcadero.com/products/delphi
2. **Developer Express VCL components**: http://www.devexpress.com/Products/VCL/
3. **Add-in Express VCL**: http://www.add-in-express.com/add-in-delphi/
4. **GDIplus.dll**, comes with most versions of Windows
5. **libeay32.dll**: library that is used for ssl connections.
6. **libssl32.dll**: library that is used for ssl connections.

* [1] is the compiler.
* [2] is a set of controls that is used to make the application look pretty. This includes nice edit controls, skinning controls and a layoutcontrol.   
* [3] is a set of controls that is used to hook into Outlook, add the button to the ribbon and various menu's and add an extra tab in the settings screen.
* [5] and [6] are part of the OpenSSL Windows binaries that can be downloaded from http://www.slproweb.com/products/Win32OpenSSL.html

## How-to

Extract all sourdce in a directory, while maintaining the directory structure
The .dpr files are the project files and there are two of them:

1. FBPlugin.dpr is the project for the Outlook plugin
2. FBNewCase.dpr is a project that creates a stand-alone application for submitting cases. Mostly used for debugging purposes.

Both projects can be opened and compiled at once into a working dll or exe.
The dll must be registered to make it work in Outlook. You can create an installer
with InnoSetup (http://www.jrsoftware.org/isinfo.php).
The project file for InnoSetup is in the `_Installer` folder.

## Background

I created this plugin because I needed it myself. Because it turned out to be very usefull
for me I thought others might want to use it too, so I created the installer and wrote
a blog about it. This blog still receives about 500 pageviews a month, but I don't know
how many readers actually download and use the plugin. Since the plugin works for me and
has all the functionality I need, I don't really have the urge to update it or add new
features. That's too bad, since there are probably a lot of good ideas out there.
At the request of the nice folks at FogCreek and some people that e-mailed me
I release the source, hoping that someone will pick it up.


## License

Copyright (c) 2009 Birger Jansen

> **Disclaimer**: This is the source code for the FogBugz Outlook Plugin. It is distributed
> in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
> warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
