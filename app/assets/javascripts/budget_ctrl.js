(function() {
 "use strict";


  angular.module("app").controller("budgetCtrl", function($scope, $http) { 

    $scope.setup = function() {
      $http.get("/api/v1/incomes.json").then(function(response) {
        $scope.incomes = response.data;
        for(var i = 0; i < $scope.incomes.length; i++) {
          $scope.incomes[i].income_start_date = new Date($scope.incomes[i].income_start_date)
        }
        for(var i = 0; i < $scope.incomes.length; i++) {
          $scope.incomes[i].income_end_date = new Date($scope.incomes[i].income_end_date)
        }
      });

      $http.get("/api/v1/expenses.json").then(function(response) {
        $scope.expenses = response.data;
        for(var i = 0; i < $scope.expenses.length; i++) {
          $scope.expenses[i].expense_start_date = new Date($scope.expenses[i].expense_start_date)
        }
        for(var i = 0; i < $scope.expenses.length; i++) {
          $scope.expenses[i].expense_end_date = new Date($scope.expenses[i].expense_end_date)
        } 
      });

      $http.get("/api/v1/income_types.json").then(function(response) {
        $scope.incomeTypes = response.data;
      });

      $http.get("/api/v1/expense_types.json").then(function(response) {
        $scope.expenseTypes = response.data;
      });

      $http.get("/api/v1/frequencies.json").then(function(response) {
        $scope.frequencies = response.data;
      });

      $http.get("/api/v1/starting_balances.json").then(function(response){
        $scope.starting_balance = response.data
      });
    };

    //Balance Functions

    $scope.updateBalance = function(balance) {
      http.put("/api/v1/starting_balances/" + balance.id + ".json", balance).then(
        function(response){
          $scope.alert = response.data
        });
      }


    // Incomes Functions

    $scope.addIncomeRow = function(){
        $scope.showNewIncomeBox = !$scope.showNewIncomeBox;
      }

    $scope.addIncome = function(income) {
      $http.post("/api/v1/incomes.json", income).success(function(response){
        $scope.incomes.push(income);
        $scope.showNewIncomeBox = false;
        income = {};
      })
      .error(function(response){
        $scope.alert = response.data
      });
    }

    $scope.updateIncome = function(income) {
      $http.put("/api/v1/incomes/" + income.id + ".json", income).then(function(response){
        $scope.alert = response.data
      });
    }

    $scope.deleteIncome = function(income) {
      $http.delete("/api/v1/incomes/" + income.id + ".json").then(function(response){
        $scope.alert = response.data
      });
      for(var i = 0; i < $scope.incomes.length; i++) {
        if (income === $scope.incomes[i]) {
          $scope.incomes.splice($scope.incomes.indexOf(income), 1)
        }
      }
    } 

    // Expenses Functions

    $scope.addExpenseRow = function(){
      $scope.showNewExpenseBox = !$scope.showNewExpenseBox;
      }

    $scope.addExpense = function(expense) {
      $http.post("/api/v1/expenses.json", expense).success(function(response){
        $scope.expenses.push(expense);
        $scope.showNewExpenseBox = false;
        $scope.expense = {};
      })
      .error(function(response){
        $scope.alert = response.data
      });
    }

    $scope.updateExpense = function(expense) {
      $http.put("/api/v1/expenses/" + expense.id + ".json", expense).then(function(response){
        $scope.alert = response.data
      });
    }

    $scope.deleteExpense = function(expense) {
      $http.delete("/api/v1/expenses/" + expense.id + ".json").then(function(response){
        $scope.alert = response.data
      });
      for(var i = 0; i < $scope.expenses.length; i++) {
        if (expense === $scope.expenses[i]) {
          $scope.expenses.splice($scope.expenses.indexOf(expense), 1)
        }
      }
    } 

    window.scope = $scope;

  });

}());
