/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.15.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QIcon>
#include <QtWidgets/QApplication>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QLabel *title;
    QTableWidget *pogTable;
    QPushButton *addButton;
    QPushButton *removeButton;
    QPushButton *expButton;
    QPushButton *impButton;
    QStatusBar *statusbar;
    QMenuBar *menubar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(400, 500);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        title = new QLabel(centralwidget);
        title->setObjectName(QString::fromUtf8("title"));
        title->setGeometry(QRect(60, 10, 280, 40));
        QFont font;
        font.setFamily(QString::fromUtf8("Iowan Old Style"));
        font.setPointSize(30);
        font.setBold(false);
        font.setWeight(50);
        title->setFont(font);
        title->setAlignment(Qt::AlignCenter);
        pogTable = new QTableWidget(centralwidget);
        if (pogTable->columnCount() < 2)
            pogTable->setColumnCount(2);
        QFont font1;
        font1.setFamily(QString::fromUtf8("Iowan Old Style"));
        font1.setPointSize(15);
        QTableWidgetItem *__qtablewidgetitem = new QTableWidgetItem();
        __qtablewidgetitem->setFont(font1);
        pogTable->setHorizontalHeaderItem(0, __qtablewidgetitem);
        QTableWidgetItem *__qtablewidgetitem1 = new QTableWidgetItem();
        __qtablewidgetitem1->setFont(font1);
        pogTable->setHorizontalHeaderItem(1, __qtablewidgetitem1);
        if (pogTable->rowCount() < 1)
            pogTable->setRowCount(1);
        pogTable->setObjectName(QString::fromUtf8("pogTable"));
        pogTable->setGeometry(QRect(5, 80, 390, 301));
        pogTable->setAutoFillBackground(true);
        pogTable->setFrameShape(QFrame::Box);
        pogTable->setFrameShadow(QFrame::Raised);
        pogTable->setRowCount(1);
        pogTable->setColumnCount(2);
        pogTable->horizontalHeader()->setMinimumSectionSize(19);
        pogTable->horizontalHeader()->setDefaultSectionSize(186);
        pogTable->verticalHeader()->setMinimumSectionSize(21);
        addButton = new QPushButton(centralwidget);
        addButton->setObjectName(QString::fromUtf8("addButton"));
        addButton->setGeometry(QRect(0, 40, 35, 35));
        QIcon icon;
        icon.addFile(QString::fromUtf8(":/images/plus.png"), QSize(), QIcon::Normal, QIcon::On);
        addButton->setIcon(icon);
        addButton->setIconSize(QSize(35, 35));
        removeButton = new QPushButton(centralwidget);
        removeButton->setObjectName(QString::fromUtf8("removeButton"));
        removeButton->setGeometry(QRect(40, 40, 35, 35));
        QIcon icon1;
        icon1.addFile(QString::fromUtf8(":/images/minus.png"), QSize(), QIcon::Normal, QIcon::On);
        removeButton->setIcon(icon1);
        removeButton->setIconSize(QSize(35, 35));
        expButton = new QPushButton(centralwidget);
        expButton->setObjectName(QString::fromUtf8("expButton"));
        expButton->setGeometry(QRect(210, 400, 120, 35));
        expButton->setIconSize(QSize(35, 35));
        impButton = new QPushButton(centralwidget);
        impButton->setObjectName(QString::fromUtf8("impButton"));
        impButton->setGeometry(QRect(70, 400, 120, 35));
        impButton->setIconSize(QSize(35, 35));
        MainWindow->setCentralWidget(centralwidget);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 400, 22));
        MainWindow->setMenuBar(menubar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "KeyMapper", nullptr));
        title->setText(QCoreApplication::translate("MainWindow", "GD KeyMap Editor", nullptr));
        QTableWidgetItem *___qtablewidgetitem = pogTable->horizontalHeaderItem(0);
        ___qtablewidgetitem->setText(QCoreApplication::translate("MainWindow", "Key", nullptr));
        QTableWidgetItem *___qtablewidgetitem1 = pogTable->horizontalHeaderItem(1);
        ___qtablewidgetitem1->setText(QCoreApplication::translate("MainWindow", "Mapping", nullptr));
        addButton->setText(QString());
        removeButton->setText(QString());
        expButton->setText(QCoreApplication::translate("MainWindow", "Export KeyMap", nullptr));
        impButton->setText(QCoreApplication::translate("MainWindow", "Import KeyMap", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
