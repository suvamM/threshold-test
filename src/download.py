#!/usr/bin/env python
# import urllib, tarfile
import urllib2, ssl, tarfile

	
def download(url, path):
	"""Copy the contents of a file from a given URL to a local file in the directory given by 'path'.
	"""
	ctx = ssl.create_default_context()
	ctx.check_hostname = False
	ctx.verify_mode = ssl.CERT_NONE
	webFile = urllib2.urlopen(url, context=ctx)
	print 'Downloading tar file...'
	localFile = open(path+url.split('/')[-1], 'w')
	localFile.write(webFile.read())
	webFile.close()
	localFile.close()

def untar(fname, path=''):
	""" Extract files from tar file into directory specified by path.
	"""
	if (fname.endswith('tar.gz')):
		print 'Extracting contents...'
		tar = tarfile.open(fname)
		tar.extractall(path)
		tar.close()
	else:
		print 'Error Not a tar file.'




if __name__ == '__main__':

	url = 'http://5harad.com/data/NC-stops-2009-2014.tar.gz'
	path = '../data/'
	#download(url, path)
	
	fname = 'orig-data.tar.gz'
	untar(path+fname, path)

 
