% =================================================
% Class: project_report.cls
% Description: Book Template for IT FITM KMUTNB Project
% Date: 2025/05/18
% =================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{itfitmbook}[2025/05/18 Book Template for IT FITM KMUTNB Project]

% --------------------------------------------------
% Basic Class and Paper Setup
% --------------------------------------------------
\LoadClass[12pt,a4paper,oneside]{book}
\RequirePackage[a4paper,top=1.5in,bottom=1in,left=1.5in,right=1in]{geometry}

% --------------------------------------------------
% Font and Encoding
% --------------------------------------------------
\RequirePackage{lastpage}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{adjustbox}
\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\RequirePackage{setspace}
\RequirePackage{parskip}

\RequirePackage{csquotes}
\setlength{\parindent}{0pt}

% Thai Font Setup
\newcommand{\setTHSarabunFont}{
  \setmainfont[
    Path=Font/,
    UprightFont=*,
    BoldFont=* Bold,
    ItalicFont=* Italic,
    BoldItalicFont=* BoldItalic,
    Script=Thai,
    Language=Thai
  ]{THSarabunNew}
}

% Thai Line Breaking
\XeTeXlinebreaklocale "th"
\XeTeXlinebreakskip = 0pt plus 2pt minus 1pt

% --------------------------------------------------
% TOC, LOF, and Section Format
% --------------------------------------------------
\RequirePackage{titlesec}
\RequirePackage{tocloft}

% Remove default TOC, LOF, LOT titles
\renewcommand{\contentsname}{}
\renewcommand{\listfigurename}{}
\renewcommand{\listtablename}{}

% Adjust TOC, LOF, LOT spacing and font
\renewcommand{\cftbeforechapskip}{0pt}
\renewcommand{\cftchapindent}{0pt}
\renewcommand{\cftchapnumwidth}{0pt}
\renewcommand{\cftchapfont}{\normalfont \fontsize{16}{16}\selectfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

\renewcommand{\cftsecindent}{2.5em}
\renewcommand{\cftsecnumwidth}{2em}
\renewcommand{\cftsecfont}{\normalfont \fontsize{16}{16}\selectfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

\renewcommand{\cftfigindent}{0.7em}
\renewcommand{\cftfignumwidth}{2em}
\renewcommand{\cftfigfont}{\normalfont \fontsize{16}{16}\selectfont}
\renewcommand{\cftfigpagefont}{\normalfont}
\renewcommand{\cftfigleader}{\cftdotfill{\cftdotsep}}

\renewcommand{\cfttabindent}{0.7em}
\renewcommand{\cfttabnumwidth}{2em}
\renewcommand{\cfttabfont}{\normalfont \fontsize{16}{16}\selectfont}
\renewcommand{\cfttabpagefont}{\normalfont}
\renewcommand{\cfttableader}{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{\cftnodots}

% Custom Thai TOC
\newcommand{\customTOCthai}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{สารบัญ}

    \setlength{\headheight}{0.5cm}

    % ตั้งระดับการแสดงสารบัญ
    \setcounter{tocdepth}{1}   % แสดงถึง section เท่านั้น

    % บันทึกเลขหน้าปัจจุบัน (หน้าแรกของสารบัญ)
    \newcounter{tocstartpage}
    \setcounter{tocstartpage}{\value{page}}

    % --- การตั้งค่า Header สำหรับหน้าสารบัญด้วย fancyhdr ---
    \fancyhf{} % ล้างค่า header และ footer ทั้งหมด
    \fancyhead[C]{%
        {\centering \fontSixTeen \textbf{สารบัญ}%
        % เพิ่ม "(ต่อ)" หากสารบัญมีหลายหน้า
        \ifnum\value{page}>\value{tocstartpage}
            \ \textbf{(ต่อ)}%
        \fi
        \par}
        \vspace{0.5em} % เว้นระยะเล็กน้อยหลังหัวข้อ "สารบัญ"
        {\noindent \hfill \fontSixTeen หน้า\par} % คำว่า "หน้า" ที่มุมขวาบน
        \vspace*{0.5cm} % เว้นระยะ 0.5 cm หลังจาก "หน้า" ก่อนเนื้อหาสารบัญ
    }
    \pagestyle{fancy}
    \setlength{\footskip}{0.5in}
    \fancyfoot[C]{\thepage}

    % --- การปรับแต่งการแสดงผลรายการในสารบัญ ---
    \renewcommand{\@pnumwidth}{2em}    % ความกว้างของกล่องสำหรับเลขหน้า
    \renewcommand{\@tocrmarg}{2.5em}    % ระยะห่างระหว่างชื่อหัวข้อกับเลขหน้า (ด้านขวา)

    % สร้างสารบัญ
    \@starttoc{toc}
}

\newcommand{\customLOFthai}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{สารบัญภาพ}

    \setlength{\headheight}{0.8cm} % Set due to the "หน้า" line

    % Save the current page number (first page of LOF)
    \newcounter{lofstartpage}
    \setcounter{lofstartpage}{\value{page}}

    % --- Header settings for LOF pages with fancyhdr ---
    \fancyhf{} % Clear all header and footer settings
    \fancyhead[C]{%
        {\centering \fontSixTeen \textbf{สารบัญภาพ}%
        % Add "(ต่อ)" if LOF spans multiple pages
        \ifnum\value{page}>\value{lofstartpage}
            \ \textbf{(ต่อ)}%
        \fi
        \par}
        \vspace{0.5cm} % Small space after "สารบัญภาพ"
        {\noindent \fontSixTeen ภาพที่\hfill หน้า\par} % "หน้า" on the top right
    }
    \setlength{\footskip}{0.4in}
    \fancyfoot[C]{\thepage} % Page number in the footer
    \pagestyle{fancy} % Apply the fancy page style

    % --- Adjust display of items in LOF ---
    \renewcommand{\@pnumwidth}{2em}     % Width for page number box
    \renewcommand{\@tocrmarg}{2.5em}     % Space between item title and page number (right)

    % Generate the list of figures
    \@starttoc{lof} % Use the internal LaTeX command for LOF to ensure proper hook
}

\newcommand{\customLOTthai}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{สารบัญตาราง}

    \setlength{\headheight}{0.8cm} % Set due to the "หน้า" line

    % Save the current page number (first page of LOT)
    \newcounter{lotstartpage}
    \setcounter{lotstartpage}{\value{page}}

    % --- Header settings for LOT pages with fancyhdr ---
    \fancyhf{} % Clear all header and footer settings
    \fancyhead[C]{%
        {\centering \fontSixTeen \textbf{สารบัญตาราง}%
        % Add "(ต่อ)" if LOT spans multiple pages
        \ifnum\value{page}>\value{lotstartpage}
            \ \textbf{(ต่อ)}%
        \fi
        \par}
        \vspace{0.5cm} % Small space after "สารบัญตาราง"
        {\noindent \fontSixTeen ตารางที่\hfill หน้า\par} % "หน้า" on the top right
    }
    \fancyfoot[C]{\thepage} % Page number in the footer
    \pagestyle{fancy} % Apply the fancy page style

    % --- Adjust display of items in LOT ---
    \renewcommand{\@pnumwidth}{2em}     % Width for page number box
    \renewcommand{\@tocrmarg}{2.5em}     % Space between item title and page number (right)

    % Generate the list of tables
    \@starttoc{lot} % Use the internal LaTeX command for LOT to ensure proper hook
}

% Arabic page numbering for main content
\newcommand{\customTOCarabic}{
  \pagenumbering{arabic}
  \renewcommand{\thepage}{\arabic{page}}
  \pagestyle{fancy}
}

% Section title formatting
\titleformat{\section}
  {\normalfont\bfseries}
  {\thesection}{0.5cm}{}

\titleformat{\subsection}[hang]
  {\normalfont\bfseries}
  {\hspace*{1cm}\thesubsection}{0.5cm}{}


% --------------------------------------------------
% Header, Footer, Page Numbering
% --------------------------------------------------
\RequirePackage{fancyhdr}
\RequirePackage{emptypage}

\setlength{\headheight}{15.07054pt}
\addtolength{\topmargin}{-3.07054pt}
\setlength{\footskip}{0.3in}

% Thai alphabet page numbers
\newcommand{\thaialph}[1]{%
  \ifcase#1\or ก\or ข\or ค\or ง\or จ\or ฉ\or ช\or ซ\or ฌ\or ญ%
  \else \textbf{?}\fi}

% Thai page style
\newcommand{\thaiPageStyle}{%
  \renewcommand{\thepage}{\fontsize{16}{16}\selectfont \thaialph{\value{page}}}
  \fancyhf{}
  \fancyhead[C]{\leftmark}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \pagestyle{fancy}
}

% Plain page style (uses Thai style too)
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[C]{\leftmark}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% Top-right Arabic page
\newcommand{\arabicPageTopRight}{
  \fancyhf{}
  \fancyhead[R]{\fontsize{16}{16}\selectfont\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \pagestyle{fancy}
}

% --------------------------------------------------
% Chapter Title Format
% --------------------------------------------------
\newcommand{\chapterTitle}[2]{%
  \cleardoublepage
  \thispagestyle{plain}

  \refstepcounter{chapter} % สร้าง anchor ให้บท

  \chapter*{}
  \addcontentsline{toc}{chapter}{บทที่ \thechapter\hspace{0.6em}#2}

  \vspace*{-2cm}
  \begin{center}
    \fontTwenty{\textbf{บทที่ \thechapter \\ #2}} % ใช้ \thechapter แทน #1 เพื่อให้ sync กับ counter
  \end{center}

  \setcounter{section}{0}
  \renewcommand{\thesection}{\thechapter.\arabic{section}}

  \renewcommand{\thefigure}{\thechapter-\arabic{figure}}
  \setcounter{figure}{0}
  \renewcommand{\thetable}{\thechapter-\arabic{table}}
  \setcounter{table}{0}

  \arabicPageTopRight
}

% --------------------------------------------------
% Code and Tables
% --------------------------------------------------
\RequirePackage[most]{tcolorbox}
\tcbset{sharp corners}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{tabularx}
\RequirePackage{ragged2e}
\RequirePackage{caption}

% Define a new caption font that is bold and 16pt
\DeclareCaptionFont{bold16pt}{\bfseries\fontsize{16}{16}\selectfont}

% Setup for Figures (centered label and text)
\captionsetup[figure]{
  font={normalsize},
  labelfont={bold16pt},
  labelsep=quad,
  justification=centering,
  singlelinecheck=false
}

% Setup for Tables (raggedright label and text)
\captionsetup[table]{
  font={normalsize},
  labelfont={bold16pt},
  labelsep=quad,
  justification=raggedright,
  singlelinecheck=false
}

% --------------------------------------------------
% Index and Glossary
% --------------------------------------------------
\RequirePackage{glossaries}
\makeglossaries

% --------------------------------------------------
% Hyperref
% --------------------------------------------------
\RequirePackage{hyperref} % ต้องมีแพ็กเกจนี้
\hypersetup{
    colorlinks=true,
    linkcolor=black,    % สีของลิงก์ภายในเอกสาร
    urlcolor=blue,      % สีของ URL
    citecolor=blue,     % สีของอ้างอิง
    }

\renewcommand\UrlFont{\normalfont}

% --------------------------------------------------
% Font Sizes (Custom Commands)
% --------------------------------------------------
\newcommand{\fontSixTeen}{\fontsize{16}{16}\selectfont}
\newcommand{\fontEighteen}{\fontsize{18}{18}\selectfont}
\newcommand{\fontTwenty}{\fontsize{20}{20}\selectfont}
\newcommand{\fontTwentyFour}{\fontsize{24}{24}\selectfont}

% Hair space
\newrobustcmd{\hrsp}{\ifmmode\mskip1mu\else\kern0.0625em\fi}

% --------------------------------------------------
% List Environments Customization
% --------------------------------------------------
\usepackage{enumitem}

% Default settings for all enumerate environments
\setlist[enumerate]{
  noitemsep,
  topsep=0pt,
  partopsep=0pt,
  parsep=0pt,
}




% --- Custom Enumerate List Definition ---
\newlist{mycustomenum2}{enumerate}{4} % Change '1' to '2' to allow for 2 levels

% Level 1: 1)
\setlist[mycustomenum2,1]{
    label=\arabic*),
    leftmargin=1.7cm,
    labelwidth=0.7cm,
    labelsep=0cm,
    itemindent=0cm,
    listparindent=0cm,
    align=parleft,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 2: 1.1)
\setlist[mycustomenum2,2]{ % Define settings for the second level
    label=\arabic{mycustomenum2i}.\arabic*), % Combines parent counter (mycustomenum2i) with current counter
    leftmargin=0.9cm, % Adjust margin for nesting
    labelwidth=0.9cm,
    labelsep=0cm,
    itemindent=0cm,
    listparindent=0cm,
    align=parleft,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 2: 1.1)
\setlist[mycustomenum2,3]{ % Define settings for the second level
    label=\arabic{mycustomenum2i}.\arabic{mycustomenum2ii}.\arabic*), 
    leftmargin=1.2cm, % Adjust margin for nesting
    labelwidth=1.2cm,
    labelsep=0cm,
    itemindent=0cm,
    listparindent=0cm,
    align=parleft,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 2: 1.1.1)
\setlist[mycustomenum2,4]{ % Define settings for the second level
    label=\arabic{mycustomenum2i}.\arabic{mycustomenum2ii}.\arabic{mycustomenum2iii}.\arabic*), 
    leftmargin=1.5cm, % Adjust margin for nesting
    labelwidth=1.5cm,
    labelsep=0cm,
    itemindent=0cm,
    listparindent=0cm,
    align=parleft,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Custom enumerate environment 'mycustomenum' up to 3 levels
\newlist{mycustomenum}{enumerate}{5}

% Level 1: 1.2.1
\setlist[mycustomenum,1]{
    label=.\arabic*,
    leftmargin=2.3cm,
    labelwidth=1.3cm,
    labelsep=0cm,
    itemindent=0cm,
    listparindent=0cm,
    align=parleft,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 2: 1.2.1.1
\setlist[mycustomenum,2]{
    label*=.\arabic*,
    leftmargin=1.7cm,
    itemindent=0cm,
    labelsep=0.5cm,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 3: 1.2.1.1.1
\setlist[mycustomenum,3]{
    label*=.\arabic*,
    leftmargin=1.9cm,
    itemindent=0cm,
    labelsep=0.5cm,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 4: 1.2.1.1.1.1
\setlist[mycustomenum,4]{
    label*=.\arabic*,
    leftmargin=2.1cm,
    itemindent=0cm,
    labelsep=0.5cm,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 5: 1.2.1.1.1.1.1
\setlist[mycustomenum,5]{
    label*=.\arabic*,
    leftmargin=2.3cm,
    itemindent=0cm,
    labelsep=0.5cm,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}


% itemize %

% Default settings for all itemize environments
\setlist[itemize]{
  noitemsep,
  topsep=0pt,
  partopsep=0pt,
  parsep=0pt,
}


% Custom itemize environment 'mycustomitem' up to 3 levels
\newlist{mycustomitem2}{itemize}{1}

% Level 1: ใช้ขีด (-)
\setlist[mycustomitem2,1]{
    label=--, % ใช้ขีด (dash)
    leftmargin=3.1cm,
    labelwidth=0.7cm,
    labelsep=0cm,
    itemindent=0cm,
    listparindent=0cm,
    align=parleft,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}



% Custom itemize environment 'mycustomitem' up to 3 levels
\newlist{mycustomitem}{itemize}{6}

% Level 1: ใช้ขีด (-)
\setlist[mycustomitem,1]{
    label=--, % ใช้ขีด (dash)
    leftmargin=1.7cm,
    labelwidth=0.7cm,
    labelsep=0cm,
    itemindent=0cm,
    listparindent=0cm,
    align=parleft,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 2: ใช้ขีด (-)
\setlist[mycustomitem,2]{
    label=--, % ใช้ขีด (dash)
    leftmargin=0.8cm,
    itemindent=0cm,
    labelsep=0.5cm,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 3: ใช้ขีด (-)
\setlist[mycustomitem,3]{
    label=--, % ใช้ขีด (dash)
    leftmargin=0.8cm,
    itemindent=0cm,
    labelsep=0.5cm,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 4: ใช้ขีด (-)
\setlist[mycustomitem,4]{
    label=--, % ใช้ขีด (dash)
    leftmargin=0.8cm,
    itemindent=0cm,
    labelsep=0.5cm,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 5: ใช้ขีด (-)
\setlist[mycustomitem,5]{
    label=--, % ใช้ขีด (dash)
    leftmargin=0.8cm,
    itemindent=0cm,
    labelsep=0.5cm,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}

% Level 6: ใช้ขีด (-)
\setlist[mycustomitem,6]{
    label=--, % ใช้ขีด (dash)
    leftmargin=0.8cm,
    itemindent=0cm,
    labelsep=0.5cm,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    before=\setlength{\parskip}{0pt},
    after=\setlength{\parskip}{0pt}
}


% ตัวอย่างเวลากำหนดเองใน .tex
  %\begin{mycustomitem}[leftmargin=0cm,itemindent=4.8cm]
  %    \item ด้วยการพัฒนาผลิตภัณฑ์แบบบ้านอย่างต่อเนื่อง ใช้วัสดุก่อสร้างที่มีคุณภาพมาตรฐาน พัฒนาการบริการที่ดีทั้งก่อนและหลังส่งมอบสินค้า
  %    \item ข้อย่อยลึก
  %\end{mycustomitem}

% --------------------------------------------------
% Bib
% --------------------------------------------------
\RequirePackage{lipsum}
\RequirePackage[american]{babel}
\RequirePackage{csquotes}
\RequirePackage[style=apa,sortcites=true,sorting=nyt,backend=biber,giveninits=false]{biblatex}
\DeclareLanguageMapping{american}{american-apa}

\makeatletter
\renewbibmacro*{name:apa:family-given}[5]{%
  \mkbibnamegiven{#2}~\mkbibnamefamily{#1}%
  \iffieldundef{suffix}{}{% เช็คว่ามี suffix หรือไม่
    \setunit{\namepunct}%
    \printfield{suffix}%
  }%
}
\makeatother

\AtEndPreamble{
  \addbibresource{Project_999_Bibliography.bib}

  % เปลี่ยนชื่อ Bibliography เป็น บรรณานุกรม
  \DeclareNameAlias{sortname}{given-family}
  
  \DefineBibliographyStrings{english}{%
    bibliography = {บรรณานุกรม},
  }

    \setlength{\headsep}{0.5in}

  % ไม่แสดง header ในหน้าบรรณานุกรม
    \defbibheading{mybibheading}{
      \clearpage
      \phantomsection
      \addcontentsline{toc}{chapter}{บรรณานุกรม}
      
      % Save the current page number as the start of the bibliography
      \newcounter{bibstartpage}
      \setcounter{bibstartpage}{\value{page}}
     
      % Main title for the first page of bibliography
      \begin{center}
        \fontTwenty{\textbf{บรรณานุกรม}}
      \end{center}
      
      % Set up fancyhdr for subsequent pages
      \fancyhf{} % Clear all existing headers/footers (good starting point)
      \fancyfoot{} % **Add this line to explicitly clear the footer**

      % Page number at top right and "บรรณานุกรม (ต่อ)" in the next line, centered
      \fancyhead[R]{%
          \ifnum\value{page}>\value{bibstartpage}
                \raggedleft \fontsize{16}{16}\selectfont\thepage \\ % เลขหน้าชิดขวา
                \vspace*{0.5em} % ระยะห่างระหว่างเลขหน้ากับ "บรรณานุกรม (ต่อ)"
                \centering \fontTwenty \textbf{บรรณานุกรม (ต่อ)} % "บรรณานุกรม (ต่อ)" อยู่ตรงกลาง       
          \fi
      }
      \pagestyle{fancy} % Apply the fancy page style
      \begingroup
        \renewcommand*{\bibfont}{\fontSixTeen \selectfont}
    }
}



% --------------------------------------------------
% Appendix Title Page
% --------------------------------------------------
\newcommand{\appendixTitlePage}{
    \clearpage
    \fancyhf{}
    \arabicPageTopRight
    \thispagestyle{empty} % No headers or footers on this page
    \phantomsection
    \addcontentsline{toc}{chapter}{ภาคผนวก} % Add to TOC
    \vspace*{3.5in} % Push content to the vertical center
    \begin{center}
        \fontTwentyFour{\textbf{ภาคผนวก}} % "ภาคผนวก" in bold, 24pt font
    \end{center}
    \vspace*{\fill} % Push content to the vertical center
    \clearpage % Start new page after this title page
}

% --------------------------------------------------
% Individual Appendix Title Page
% --------------------------------------------------
\newcommand{\appendixChapterTitle}[2]{%
    \cleardoublepage % Ensures it starts on a right-hand page (if applicable)
    \thispagestyle{plain} % No headers or footers on this specific title page, but allows page number if needed later
    \refstepcounter{chapter} % สร้าง anchor ให้บท

    \phantomsection
    \addcontentsline{toc}{chapter}{ภาคผนวก #1: #2} % Add to TOC: e.g., ภาคผนวก ก: ชื่อภาคผนวก

    % --- Reset and reformat counters for this specific appendix ---
    \setcounter{section}{0} % Reset section counter to 0
    \renewcommand{\thesection}{#1.\arabic{section}} % Format as e.g., ก.1, ข.2

    \setcounter{figure}{0} % Reset figure counter to 0
    \renewcommand{\thefigure}{#1-\arabic{figure}} % Format as e.g., ก-1, ข-2

    \setcounter{table}{0} % Reset table counter to 0
    \renewcommand{\thetable}{#1-\arabic{table}} % Format as e.g., ก-1, ข-2
    % ------------------------------------------------------------

    \vspace*{3.5in} % Push content to the vertical center
    \begin{center}
        \fontSixTeen{\textbf{ภาคผนวก #1. \\ #2}} % "ภาคผนวก ก." and "ชื่อภาคผนวก" in bold, 24pt
    \end{center}
    \vspace*{\fill} % Push content to the vertical center
    \clearpage % Start the actual appendix content on a new page
}




% --------------------------------------------------
% Set Defaults on Document Start
% --------------------------------------------------
\AtBeginDocument{
  \setTHSarabunFont
  \fontsize{16}{16}\selectfont
  \thaiPageStyle
}

% --------------------------------------------------
% Line Spacing
% --------------------------------------------------
%\setstretch{1.1}

\endinput
