<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="StudentIntraduction.aspx.cs" Inherits="StudentIntraduction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<!DOCTYPE html>
<html >

<!--<![endif]-->
<head>

<link rel='stylesheet' id='custom-style-css'  href='https://www.geeksforgeeks.org/wp-content/themes/iconic-one/css/gfg.min.css?ver=5.6' type='text/css' media='all' />
</head>

<body>
    <header id="masthead" class="site-header" role="banner">
    <nav id="site-navigation" class="themonic-nav" role="navigation">
			
			<div class="menu-iconic-container"><ul id="menu-top" class="nav-menu">
<li id="menu-item-141975" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-141975"><a>
Welcome to Online study center</a>
</li>
</ul></div>		</nav><!-- #site-navigation -->
		<div class="clear"></div>
	</header><!-- #masthead -->
	<div id="main" class="wrapper">
<div class="leftSideBarParent">
<table>
<tr>
<img src="images/Sriram1.jpg" /></tr>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<tr>
<asp:Label ID="Label1" runat="server" Text="Welcome to SriRama Tutorials" 
        Font-Bold="True" Height="30px"></asp:Label>
         <div class="divclass"> 
				<a  title="Medium" style="background-repeat: repeat"><span class="articleRating alignright level-3"  style="width:170px">SriRama Tutorials</span></a>
				</div>
</tr>
</table>
  </div>
	<div id="primary" class="site-content" style="width:700px">
                <article id="post-152831" class="post-152831 post type-post status-publish format-standard sticky hentry category-articles tag-interview-preparation tag-placement-preparation">
				<header class="entry-header">
                <div class="divclass"> 
				<a  title="Medium"><span class="articleRating alignright level-3"  style="width:660px">~ ~ ~ ~ ~ ~ Educational Websites for Taking Online Courses ~ ~ ~ ~ ~</span></a>
				</div>
						<h2 class="entry-title">
				<a title="Permalink to Must Do Coding Questions for Companies like Amazon, Microsoft, Adobe, &#8230;" rel="bookmark">There are all sorts of online courses you can take to improve your knowledge and skills</a>
			    </h2>
                
				</header>		
		        <div class="entry-summary">
				<!-- Ico nic One home page thumbnail with custom excerpt -->
                <div class="excerpt-thumb">
                </div>
			    <p style="width:675px">Back in the day, if you wanted to learn something new, you'd go to school for it. Today, not only are educational institutions offering their full programs and individual courses online, but experts in almost every field imaginable are creating their own programs and courses online to share their knowledge with their worldwide audiences.

                Both educational institutions and individual experts who want to offer their courses online need somewhere to host it and get it out to people who want to learn, which is why there are now so many platforms that are completely dedicated to offering online courses. Some focus on tighter niches like green technology while others include courses in a wide variety of fields.

                Whatever you're interested in learning, chances are you can almost certainly find a course about it from the educational course sites listed below. From beginner levels all the way to intermediate and advanced, there's bound to be something for everybody.<span class="read-more"></span></p>
		        </div><!-- .entry-summary -->
		        <!-- .entry-meta -->
	            </article><!-- #post -->
                <div class="divclass" > 
				<a  title="Medium" href="DisplayAvailableCourse.aspx"><span  class="articleRating alignright level-3"  style="width:200px">Course Details</span></a>
				</div>
                </div></div>
</body>
</html>
</asp:Content>


