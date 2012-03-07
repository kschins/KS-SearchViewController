KS-SearchViewController
======================

By Kasey Schindler - [@kschins](http://twitter.com/kschins)  
[kaseyschindler.com](http://kaseyschindler.com)

About
-----
KS-SearchViewController is a view controller with a search bar implemented and built into the header of a UITableView. By default, the search bar is "hidden" like search bars across the UI implemented by Apple. The user must scroll down to reveal the search bar. When user taps search bar the table below is disabled with a dark overlay. 

Usage
-----
Add both KS_SearchViewController.h and KS_SearchViewController.m to your project. Import the header file where you want to init the view controller. 

You will need to pass a mutable array to this view controller if you want data loaded initially otherwise initialize the NSMutableArray and fill it with contents when the search view controller loads. The method below needs to be implemented:  

	- (void)doSearch:(NSString *)searchText;

Compatibility
-------------
iOS 5 as project uses ARC.

License
-------
Copyright (c) 2012 Kasey Schindler

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

