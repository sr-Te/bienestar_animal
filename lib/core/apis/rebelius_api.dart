// ignore_for_file: constant_identifier_names

const URL = 'dev.rebeliuslab.xyz';

const ORG = 'organizations';

const LOGIN = 'auth/login';
const LOGOUT = 'auth/logout';
const USERS = 'users';

const PROMISE = 'core-promises';
const COMMITMENT = 'commitments';
const SPACE = 'spaces';

class RebeliusApi {
  // Org
  static Uri org(int id) => Uri.http(URL, '$ORG/$id');

  // User
  static Uri logIn() => Uri.http(URL, LOGIN);
  static Uri logOut() => Uri.http(URL, LOGOUT);
  static Uri user(int id) => Uri.http(URL, '$USERS/$id');

  // Promises
  static Uri promises() => Uri.http(URL, PROMISE);
  static Uri promise(int id) => Uri.http(URL, '$PROMISE/$id');

  // Commitments
  static Uri commitments() => Uri.http(URL, COMMITMENT);
  static Uri commitment(int id) => Uri.http(URL, '$COMMITMENT/$id');

  // Spaces
  static Uri spaces() => Uri.http(URL, SPACE);
  static Uri space(int id) => Uri.http(URL, '$SPACE/$id');
}
