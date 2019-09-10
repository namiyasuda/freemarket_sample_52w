  // パスワード確認フォーム用
function CheckPassword(password_confirmation){
  // 入力値取得
  var input1 = password.value;
  var input2 = password_confirmation.value;
  // パスワード比較
  if(input1 != input2){
    password_confirmation.setCustomValidity("入力値が一致しません。");
  }else{
    password_confirmation.setCustomValidity('');
  }
}