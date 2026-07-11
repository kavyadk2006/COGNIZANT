<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--
    Hands-On 9 Accessibility Audit

    Initial Lighthouse Issues (Sample)
    - Missing labels for search input
    - Missing ARIA attributes
    - Missing alt text
    - Heading hierarchy
    - Low colour contrast

    Fixes
    - Added labels
    - Added aria-label
    - Added aria-live
    - Added tabindex
    - Added semantic HTML
    - Improved contrast

    Colour Contrast
    Before : #999999
    After  : #1f2937

    Browser Support
    CSS Grid is supported in Chrome, Edge, Firefox and Safari.
    Verified using https://caniuse.com
    -->

    <title>Student Portal</title>

    <link rel="stylesheet" href="style.css">
</head>

<body>

<header>

    <h1>Student Portal</h1>

    <nav aria-label="Main navigation">

        <a href="#" aria-current="page">Home</a>
        <a href="#">Courses</a>
        <a href="#">Profile</a>

    </nav>

</header>

<main>

<section class="search-section">

<h2>Available Courses</h2>

<label for="search">
Search Courses
</label>

<input
id="search"
type="text"
placeholder="Search Course"
onkeyup="searchCourse()">

<p
id="resultCount"
role="status"
aria-live="polite">
5 Courses Found
</p>

</section>

<section
class="course-container"
id="courseContainer">

<div
class="card"
tabindex="0"
onclick="enroll('Java Programming')"
onkeydown="cardKey(event,'Java Programming')">

<h3>Java Programming</h3>

<p>Code : CS101</p>

<p>Credits : 4</p>

<p>Grade : A</p>

</div>

<div
class="card"
tabindex="0"
onclick="enroll('Python Programming')"
onkeydown="cardKey(event,'Python Programming')">

<h3>Python Programming</h3>

<p>Code : CS102</p>

<p>Credits : 4</p>

<p>Grade : A</p>

</div>

<div
class="card"
tabindex="0"
onclick="enroll('Web Development')"
onkeydown="cardKey(event,'Web Development')">

<h3>Web Development</h3>

<p>Code : CS103</p>

<p>Credits : 3</p>

<p>Grade : A</p>

</div>

<div
class="card"
tabindex="0"
onclick="enroll('Database Management')"
onkeydown="cardKey(event,'Database Management')">

<h3>Database Management</h3>

<p>Code : CS104</p>

<p>Credits : 4</p>

<p>Grade : B+</p>

</div>

<div
class="card"
tabindex="0"
onclick="enroll('Software Engineering')"
onkeydown="cardKey(event,'Software Engineering')">

<h3>Software Engineering</h3>

<p>Code : CS105</p>

<p>Credits : 4</p>

<p>Grade : A+</p>

</div>

</section>

</main>

<script src="script.js"></script>

</body>
</html>