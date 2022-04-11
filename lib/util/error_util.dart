/*
 * Copyright (c) 2022 The sky Authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_polarbear/data/data_exception.dart';

class ErrorUtil {

  ErrorUtil._();

  static String getMessage(BuildContext context, Object? error) {
    if (error is DataException) {
      switch(error.type) {
        case ErrorType.adminExist:
          return "账号已经存在!";
        case ErrorType.nameOrPasswordError:
          return "账号或密码错误!";
        case ErrorType.updateError:
          return "更新信息错误!";
        case ErrorType.other:
          return "处理异常!";
        case ErrorType.deleteError:
          return "删除信息错误!";
        case ErrorType.passwordError:
          return "密码错误!";
      }
    }
    return '处理异常';
  }
}
