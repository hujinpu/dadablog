# dadablog is a simple blog engine, is very friendly to github and rack protocol.

# How to use

`gem install dadablog`   [rubygems link](https://rubygems.org/gems/dadablog)

`dadablog create /path/to/your/blog/dir blog_title disqus_shortname`

`cd /path/to/your/blog/dir`

`sh server.sh start`

`git remote add origin git@github.com:youarname/yourgit.git`

`git push -u origin master`

**You should use github to save your articles.**

**And you should use github [post-receive-hooks](http://help.github.com/post-receive-hooks/) to post http://yoururl/update**

#TODO list:

* feed
* footer design
* page function