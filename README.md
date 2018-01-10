# LJ_PageBook

可翻页的book

主要使用UIPageViewController实现

主要内容在BookViewController内，模板在storyboard里面 

强调一点：instantiateViewController还没有绘制.view的图层 这个时候self.view里面是空的 当调用.view的时候才会加载图层 这里应该用的是懒加载

喜欢的请点❤  拜托 拜托！！

