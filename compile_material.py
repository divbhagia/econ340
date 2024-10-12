from pypdf import PdfWriter

#####################################################
# Notes for Module I, III, IV
#####################################################

notes1 = "Notes/Module1-Intro-and-Describing-Data/Summation-Notation.pdf"
notes2 = "Notes/Module1-Intro-and-Describing-Data/Describing-Data.pdf"
notes3 = "Notes/Module3-Random-Variables/Random-Variables.pdf"
notes4 = "Notes/Module4-Sampling-and-Estimation/Sampling-and-Estimation.pdf"
notes5 = "Notes/Module4-Sampling-and-Estimation/CI-Example.pdf"
notes6 = "Notes/Module4-Sampling-and-Estimation/HT-Example.pdf"

# Combine all pdf files into a single file
pdfs = [notes1, notes2, notes3, notes4, notes5, notes6]
output = "Notes/Part1-Compiled-Notes.pdf"
merger = PdfWriter()
for pdf in pdfs:
    merger.append(pdf)
merger.write(output)
merger.close()

#####################################################
# Handouts
#####################################################

lecs = [i for i in range(1, 14)]
lecs_rmv = [5, 6, 7, 8]
lecs = [i for i in lecs if i not in lecs_rmv]

output = f"Lectures/Part1-Compiled-Handouts.pdf"
merger = PdfWriter()
# for each lecture number, compile the handouts
for i in lecs:
    # handout = f'Lectures/Lecture{i}/ClassHandout{i}.pdf'
    handout_filled = f"Lectures/Lecture{i}/ClassHandout{i}_Filled.pdf"
    # merger.append(handout)
    merger.append(handout_filled)
merger.write(output)
merger.close()

#####################################################
# Slides
#####################################################

lecs = [i for i in range(1, 14)]
lecs_rmv = [6, 7, 8]
lecs = [i for i in lecs if i not in lecs_rmv]

output = f"Lectures/Part1-Compiled-Slides.pdf"
merger = PdfWriter()
# for each lecture number, compile the handouts
for i in lecs:
    # handout = f'Lectures/Lecture{i}/ClassHandout{i}.pdf'
    slides = f"Lectures/Lecture{i}/Slides{i}.pdf"
    # merger.append(handout)
    merger.append(slides)
merger.write(output)
merger.close()

#####################################################
