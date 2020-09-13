#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <algorithm>
#include <map>
#include <sstream>
#include <fstream>
#include <QFileDialog>
#include <QDir>
#include <QJsonDocument>
#include <QJsonObject>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->setStyleSheet("background-color: #9396cb;");
       QFontDatabase::addApplicationFont(":/fonts/IOStyle.ttc");
    mytable = this->centralWidget()->findChild<QTableWidget*>("pogTable");
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::exportJson(std::string outfile) {
    std::map<std::string, std::string> themap = {};
    std::stringstream jsn("{", std::ios_base::app | std::ios_base::out);

    for(int i = 0; i < mytable->rowCount(); i++) {
        auto  col0 = mytable->item(i,0);//->text().toStdString();
        auto  col1 = mytable->item(i,1);//->text().toStdString();

        if(col0 && col1) {
            auto v1 = col0->text().toStdString();
            auto v2 = col1->text().toStdString();

            if(v2!="invalid")
                jsn << "\"" << v1 << "\": \"" << v2<< "\",";
        }
    }
    jsn.seekp(-1, std::ios_base::end);
    jsn << "}";

    std::ofstream outFil(outfile);
    outFil << jsn.str();
    outFil.close();

    std::cout<<"export "<< jsn.str() << std::endl;
}
void MainWindow::on_addButton_clicked()
{
    std::cout<<"we adding"<<std::endl;
    mytable->insertRow(mytable->rowCount());
}

void MainWindow::on_pogTable_itemChanged(QTableWidgetItem *item)
{
    QString changed = item->text().toLower().replace("\"", "'");

    item->setText(changed);

    if(!std::count(whitelist.begin(),whitelist.end(),changed.toStdString()) ) {
        std::cout<<"this dude really thought '"<<changed.toStdString()<<"' was a valid key lmao"<<std::endl;
        QString newtxt("invalid");
        item->setText(newtxt.toLower());
    }


    std::cout<<"we changing to "<< changed.toStdString() << std::endl;

}




void MainWindow::on_expButton_clicked()
{
    auto out = QFileDialog::getSaveFileName(this, "Choose save location", QDir::homePath(), "*.gdk");
    exportJson(out.toStdString());
}

void MainWindow::on_impButton_clicked()
{
    auto out = QFileDialog::getOpenFileName(this, "Select GDK File", QDir::homePath(), "*.gdk");
       QFile fileobj(out);
       fileobj.open(QIODevice::ReadOnly);
       QString val = fileobj.readAll();
       fileobj.close();
       QJsonDocument d = QJsonDocument::fromJson(val.toUtf8());
       QJsonObject json = d.object();
       int counter = 0;
       mytable->setRowCount(0);
       foreach(const QString& key, json.keys()) {
           mytable->insertRow(mytable->rowCount());

           QJsonValue value = json.value(key);
           std::cout<< key.toStdString() << " " << value.toString().toStdString() << " " << counter <<std::endl;
           mytable->setItem(counter, 0, new QTableWidgetItem(key));
           mytable->setItem(counter, 1, new QTableWidgetItem(value.toString()));

           counter++;
       }
}

void MainWindow::on_removeButton_clicked()
{
    QItemSelection selection( mytable->selectionModel()->selection() );

    QList<int> rows;
    foreach( const QModelIndex & index, selection.indexes() ) {
       rows.append( index.row() );
    }

    std::sort(rows.begin(), rows.end());

    int prev = -1;
    for( int i = rows.count() - 1; i >= 0; i -= 1 ) {
       int current = rows[i];
       if( current != prev ) {
          mytable->model()->removeRows( current, 1 );
          prev = current;
       }
    }
}
