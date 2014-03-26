using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BRDHCTestUnits
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void testEmail()
        {
        }

        [TestMethod]
        public void Withdraw_ValidAmount_ChangesBalance()
        {
            // arrange
            double currentBalance = 10.0;
            double withdrawal = 1.0;
            double expected = 9.0;
            var account = new clsTest("JohnDoe", currentBalance);
            // act
            account.Withdraw(withdrawal);
            double actual = account.m_balance;
            // assert
            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        [ExpectedException(typeof(Exception))]
        public void Withdraw_AmountMoreThanBalance_Throws()
        {
            // arrange
            var account = new clsTest("John Doe", 10.0);
            // act
            account.Withdraw(1.0);
            // assert is handled by the ExcpectedException
        }
    }
}
