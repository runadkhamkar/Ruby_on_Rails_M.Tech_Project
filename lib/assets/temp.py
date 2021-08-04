import cv2,sys
import pytesseract

print("in python3 "+sys.argv[1])
img_cv = cv2.imread(r'1.png')
pytesseract.pytesseract.tesseract_cmd='tesseract'
img_rgb = cv2.cvtColor(img_cv, cv2.COLOR_BGR2RGB)
text=pytesseract.image_to_string(img_rgb)
text=text.split("\n")
text=[i for i in text if(len(i)>0 and i!=' ')]
text=text[:-1]
sep='-'
text=sep.join(text)

f=open("new.txt","w")
f.write(text)
f.close()
print("bye")