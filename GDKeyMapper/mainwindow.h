#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFontDatabase>
#include <QTableWidget>
#include <vector>
QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_addButton_clicked();

    void on_pogTable_itemChanged(QTableWidgetItem *item);

    void on_pushButton_clicked();

private:
    QTableWidget* mytable;
    Ui::MainWindow *ui;
    std::vector<std::string> whitelist = {"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","k","l","z","x","c","v","b","n","m","Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M","1","2","3","4","5","6","7","8","9","0","!","@","#","$","%","^","&","*","(",")","[","]","\\",";","'",",",".","/","-","=","`","~","!","@","#","$","%","^","&","*","(",")","_","+","Q","W","E","R","T","Y","U","I","O","P","{","}","|","A","S","D","F","G","H","J","K","L",":","\"","Z","X","C","V","B","N","M","<",">","?", "up", "down", "left", "right", "delete", "escape", "enter", "f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8", "f9", "f10", "f11", "f12", "tab"};
    void exportJson(std::string outfile);
};
#endif // MAINWINDOW_H
