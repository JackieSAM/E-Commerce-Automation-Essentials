from selenium import webdriver
from selenium.webdriver.support.ui import Select
import time
import csv
driver=webdriver.Chrome(executable_path="C:\\Users\\Foxin\\Desktop\\chromedriver.exe")
f = open("amazon_price.csv","r")
reader =csv.reader(f)
linksr = []
for row in reader:
    linksr.append(row)
newest = [i[0] for i in linksr]


prices = []
for i in newest:
    driver.get(i)
    price1=driver.find_element_by_class_name('fancybox').get_attribute('href')
    #price2=
    print(price1)
    prices.append(price1)

new_links = []
for x in prices:
    x=x.split(',')
    new_links.append(x)

file = open('real_prices.csv', 'w+' , newline='', encoding="utf-8")
writer=csv.writer(file)
for n in new_links:
    writer.writerows([n])



