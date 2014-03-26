using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsTest
/// </summary>
public class clsTest
{
    public double m_balance;
    public string name;
    public clsTest(string _name, double _balance)
    {
        name = _name;
        m_balance = _balance;
    }

    public void Withdraw(double amount)
    {
        if (m_balance >= amount)
        {
            m_balance -= amount;
        }
        else
        {
            throw new Exception();
        }
    }
}