
</head>

<body lang=EN-US link="#000000" vlink="#954F72" style='tab-interval:.5in'>

<div class=WordSection1>

<p class=MsoNormal style='mso-margin-top-alt:auto;margin-bottom:12.0pt'><b><span
style='font-size:24.0pt;font-family:"Segoe UI",sans-serif;color:#24292E'>Telco
Churn</span></b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;margin-bottom:12.0pt'><b><span
style='font-family:"Segoe UI",sans-serif;color:#24292E'>Story: 14% customers
left (483 of 3,333), </span></b><span style='font-family:"Segoe UI",sans-serif;
color:#24292E'>Can we use machine learning (ML) to help inform on why they may
have churned/left and reduce future churn?<b> </b></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;margin-bottom:12.0pt'><b><span
style='font-family:"Segoe UI",sans-serif;color:#24292E'>Approach:</span></b><span
style='font-family:"Segoe UI",sans-serif;color:#24292E'>&nbsp; Use exploratory
data analysis (EDA), visualizations ML to understanding data relating to Telco
churn. Demonstrate understanding of key churn data variables and provide
prediction model for churn.</span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b><span
style='font-family:"Segoe UI",sans-serif;color:#24292E'>Data</span></b><span
style='font-family:"Segoe UI",sans-serif;color:#24292E'> set from: <a
href="https://www.kaggle.com/pangkw/telco-churn/version/3"><span
style='color:#0366D6'>https://www.kaggle.com/pangkw/telco-churn/version/3</span></a></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
style='font-family:"Segoe UI",sans-serif;color:#24292E'>Understand using ML
which data features in the Telco churn are significant to predicting churn. The
data we have is 33 features with 3,333 rows/observations, of Telco data with
churn results. The data provided has <b>14% (483)</b> of the total records that
churned so this will be somewhat of a constraint in our ML research. First to
understand the data we will use tools such as R and excel to explore. </span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
style='font-family:"Segoe UI",sans-serif;color:#24292E'>The dependent variable
in our exercise is the Churn value of Yes or No, the independent variables
are the remaining data elements that may have an impact on the dependent
variable. One independent variable we can rule out is the Phone service data
element which is set to Yes in every record, indicating it would have no
impact on the Churn since it is the same value each time. What will be of key
importance to us is will one or more independent variables show more important
than the rest.</span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>Model
results</b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<span
style='mso-no-proof:yes'><!--[if gte vml 1]><v:shapetype id="_x0000_t75"
 coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
 filled="f" stroked="f">
 <v:stroke joinstyle="miter"/>
 <v:formulas>
  <v:f eqn="if lineDrawn pixelLineWidth 0"/>
  <v:f eqn="sum @0 1 0"/>
  <v:f eqn="sum 0 0 @1"/>
  <v:f eqn="prod @2 1 2"/>
  <v:f eqn="prod @3 21600 pixelWidth"/>
  <v:f eqn="prod @3 21600 pixelHeight"/>
  <v:f eqn="sum @0 0 1"/>
  <v:f eqn="prod @6 1 2"/>
  <v:f eqn="prod @7 21600 pixelWidth"/>
  <v:f eqn="sum @8 21600 0"/>
  <v:f eqn="prod @7 21600 pixelHeight"/>
  <v:f eqn="sum @10 21600 0"/>
 </v:formulas>
 <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
 <o:lock v:ext="edit" aspectratio="t"/>
</v:shapetype><v:shape id="Picture_x0020_1" o:spid="_x0000_i1041" type="#_x0000_t75"
 style='width:834pt;height:487.5pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="README_files/image001.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img border=0 width=1112 height=650
src="README_files/image002.jpg" v:shapes="Picture_x0020_1"><![endif]></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>Recommendations
and usage scenarios:</b></p>

<p class=MsoListParagraph style='text-indent:-.25in'><b>1.</b><b><span
style='font-size:7.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b>The models
could be used on new customers to understand if they may be more likely to
churn</p>

<p class=MsoListParagraph style='text-indent:-.25in'><b>2.</b><b><span
style='font-size:7.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b>The models
agree on many of the same data elements having significance to churn</p>

<p class=MsoListParagraph style='margin-left:1.0in;text-indent:-.25in'><b>a.</b><b><span
style='font-size:7.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></b>Understand
and promote those features that are significant factors to churn behavior.</p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>Follow
up and additional recommended work:</b></p>

<p class=MsoListParagraph style='text-indent:-.25in'>1.<span style='font-size:
7.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Principle Component Analysis (PCA)
code is included and working</p>

<p class=MsoListParagraph style='text-indent:-.25in'>2.<span style='font-size:
7.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Next step of combining the PCA and
sending PCA data in the Tree based models is a next step</p>

<p class=MsoListParagraph style='text-indent:-.25in'>3.<span style='font-size:
7.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Logistics regression code is
included. Model was run but accuracy was so low that it is not included in the
results</p>

<p class=MsoListParagraph style='margin-left:1.0in;text-indent:-.25in'>a.<span
style='font-size:7.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Accuracy
could be low because of the number of independent variables in the data. </p>

<p class=MsoListParagraph style='margin-left:1.0in;text-indent:-.25in'>b.<span
style='font-size:7.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Research
indicated that with so many independent variables the Tree based models would
be the best approach for machine learning.</p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>References:</b></p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'>1.<span style='font-size:7.0pt;line-height:105%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span class=SpellE>Cirillo</span>, A. (2017). <i>R Data Mining.</i>
Birmingham, UK. <span class=SpellE>Packt</span> Publishing</p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'>2.<span style='font-size:7.0pt;line-height:105%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>Lantz, B. (2015). <i>Machine Learning with R - Second Edition.</i>
Birmingham, UK. <span class=SpellE>Packt</span> Publishing</p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'>3.<span style='font-size:7.0pt;line-height:105%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span class=SpellE><span style='font-size:10.0pt;line-height:105%;
font-family:"Arial",sans-serif;color:#222222;background:white'>Schmuller</span></span><span
style='font-size:10.0pt;line-height:105%;font-family:"Arial",sans-serif;
color:#222222;background:white'>, J. (2018). <i>R Projects <span class=GramE>For</span>
Dummies</i>. Hoboken, NJ. John Wiley &amp; Sons Inc.</span></p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'>4.<span style='font-size:7.0pt;line-height:105%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>PCA example<b> </b><span class=MsoHyperlink><a
href="https://www.analyticsvidhya.com/blog/2016/03/practical-guide-principal-component-analysis-python/"><u><span
style='color:blue'>https://www.analyticsvidhya.com/blog/2016/03/practical-guide-principal-component-analysis-python/</span></u></a></span></p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'><b>5.</b><b><span style='font-size:7.0pt;line-height:105%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></b>Logistic regression <span class=GramE>sample <b>&nbsp;</b></span><span
class=MsoHyperlink><a
href="https://www.r-bloggers.com/how-to-perform-a-logistic-regression-in-r/"><u><span
style='color:blue'>https://www.r-bloggers.com/how-to-perform-a-logistic-regression-in-r/</span></u></a></span></p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'>6.<span style='font-size:7.0pt;line-height:105%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='font-size:10.0pt;line-height:105%;font-family:"Arial",sans-serif;
color:#222222;background:white'>Tree based modeling tutorial </span><span
class=MsoHyperlink><span style='font-size:10.0pt;line-height:105%;font-family:
"Arial",sans-serif;background:white'><a
href="https://www.analyticsvidhya.com/blog/2016/04/complete-tutorial-tree-based-modeling-scratch-in-python/"><u><span
style='color:blue'>https://www.analyticsvidhya.com/blog/2016/04/complete-tutorial-tree-based-modeling-scratch-in-python/</span></u></a></span></span><span
style='font-size:10.0pt;line-height:105%;font-family:"Arial",sans-serif;
color:#222222;background:white'>&nbsp;&nbsp; --- Tree base modeling tutorial</span></p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'>7.<span style='font-size:7.0pt;line-height:105%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>Titanic Tutorial for R uses cool examples and graphics for decision
trees: <span class=MsoHyperlink><a
href="https://trevorstephens.com/kaggle-titanic-tutorial/getting-started-with-r/"><u><span
style='color:blue'>https://trevorstephens.com/kaggle-titanic-tutorial/getting-started-with-r/</span></u></a></span></p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'>8.<span style='font-size:7.0pt;line-height:105%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>Example project from past practicum that I am using as a layout
reference. Please advise if this example has issues you would recommend
improvements on. </p>

<p class=MsoListParagraph><span class=MsoHyperlink><a
href="https://github.com/KeanuNotReeves/practicum-trad-projections"><u><span
style='color:blue'>https://github.com/KeanuNotReeves/practicum-trad-projections</span></u></a></span></p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'><span class=MsoHyperlink>9.</span><span class=MsoHyperlink><span
style='font-size:7.0pt;line-height:105%'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>Basic
R example for decision tree:&nbsp; <span class=MsoHyperlink><a
href="https://rpubs.com/SANPANDE/221595"><u><span style='color:blue'>https://rpubs.com/SANPANDE/221595</span></u></a></span></p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'>10.<span style='font-size:7.0pt;line-height:105%'>&nbsp; </span>My
<span class=SpellE>Github</span> for Practicum 2: <span class=MsoHyperlink><a
href="https://github.com/mdegrado/TelcoChurn"><u><span style='color:blue'>https://github.com/mdegrado/TelcoChurn</span></u></a></span>&nbsp;
- In Progress</p>

<p class=MsoListParagraph style='margin-bottom:8.0pt;text-indent:-.25in;
line-height:105%'>11.<span style='font-size:7.0pt;line-height:105%'>&nbsp; </span>My
<span class=SpellE>Gibhub</span> for Practicum 1: <span class=MsoHyperlink><a
href="https://github.com/mdegrado/Wine-reviews-analysis-and-visualization"><u><span
style='color:blue'>https://github.com/mdegrado/Wine-reviews-analysis-and-visualization</span></u></a></span>
</p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>Appendix</b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;</b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>

</body>

</html>
