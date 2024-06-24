import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/app_error_interface.dart';

abstract class AuthError implements AppError {}

class FirebaseUserException extends AuthError {
  FirebaseUserException(this.firebaseAuthException);

  final FirebaseAuthException firebaseAuthException;

  @override
  String get message => statusMessage(firebaseAuthException.code);

  String statusMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return 'Email já em uso.';
      case 'claims-too-large':
        return 'O payload de declarações fornecido para setCustomUserClaims() excede o tamanho máximo permitido de 1.000 bytes.';
      case 'email-already-exists':
        return 'O e-mail fornecido já está em uso por outro usuário. Cada usuário precisa ter um e-mail exclusivo.';
      case 'id-token-expired':
        return 'O token de código do Firebase provisionado expirou.';
      case 'id-token-revoked':
        return 'O token de ID do Firebase foi revogado.';
      case 'insufficient-permission':
        return 'A credencial usada para inicializar o SDK Admin não tem permissão para acessar o recurso solicitado do Authentication. Consulte Configurar um projeto do Firebase para ver a documentação sobre como gerar uma credencial com as permissões apropriadas e usá-la na autenticação dos SDKs Admin.';
      case 'internal-error':
        return 'O servidor do Authentication encontrou um erro inesperado ao tentar processar a solicitação. A mensagem de erro incluirá a resposta do servidor de autenticação com informações adicionais. Se o erro persistir, informe o problema ao nosso canal de suporte de Relatório do bug.';
      case 'invalid-argument':
        return 'Um argumento inválido foi fornecido a um método do Authentication. A mensagem de erro precisa conter informações adicionais.';
      case 'invalid-claims':
        return 'Os atributos de declaração personalizados fornecidos para setCustomUserClaims() são inválidos.';
      case 'invalid-continue-uri':
        return 'O URL de confirmação precisa ser uma string de URL válida.';
      case 'invalid-creation-time':
        return 'O horário da criação precisa ser um string de data UTC válido.';
      case 'invalid-credential':
        return 'A credencial usada para autenticar os SDKs Admin não pode ser usada para executar a ação desejada. Determinados métodos de autenticação, como createCustomToken() e verifyIdToken(), requerem que o SDK seja inicializado com uma credencial de certificado em oposição a um token de atualização ou uma credencial padrão do aplicativo. Consulte Inicializar o SDK para ver a documentação sobre como autenticar os Admin SDKs com uma credencial de certificado.';
      case 'invalid-disabled-field':
        return 'O valor fornecido para a propriedade do usuário disabled é inválido. Precisa ser um valor booleano.';
      case 'invalid-display-name':
        return 'O valor fornecido para a propriedade do usuário displayName é inválido. Precisa ser uma string não vazia.';
      case 'invalid-dynamic-link-domain':
        return 'O domínio de link dinâmico fornecido não está configurado ou autorizado para o projeto atual.';
      case 'invalid-email':
        return 'O valor fornecido para a propriedade do usuário email é inválido. Precisa ser um endereço de e-mail de string.';
      case 'invalid-email-verified':
        return 'O valor fornecido para a propriedade do usuário emailVerified é inválido. Precisa ser um valor booleano.';
      case 'invalid-hash-algorithm':
        return 'O algoritmo de hash precisa corresponder a uma das strings na lista de algoritmos compatíveis.';
      case 'invalid-hash-block-size':
        return 'O tamanho do bloco de hash precisa ser um número válido.';
      case 'invalid-hash-derived-key-length':
        return 'O tamanho da chave derivada do hash precisa ser um número válido.';
      case 'invalid-hash-key':
        return 'A chave de hash precisa ter um buffer de byte válido.';
      case 'invalid-hash-memory-cost':
        return 'O custo da memória hash precisa ser um número válido.';
      case 'invalid-hash-parallelization':
        return 'O carregamento em paralelo do hash precisa ser um número válido.';
      case 'invalid-hash-rounds':
        return 'O arredondamento de hash precisa ser um número válido.';
      case 'invalid-hash-salt-separator':
        return 'O campo do separador de "salt" do algoritmo de geração de hash precisa ser um buffer de byte válido.';
      case 'invalid-id-token':
        return 'O token de código informado não é um token de código do Firebase válido.';
      case 'invalid-last-sign-in-time':
        return 'O último horário de login precisa ser um string de data UTC válido.';
      case 'invalid-page-token':
        return 'O token de próxima página fornecido em listUsers() é inválido. Precisa ser uma string não vazia válida.';
      case 'invalid-password':
        return 'O valor fornecido para a propriedade do usuário password é inválido. Precisa ser uma string com pelo menos seis caracteres.';
      case 'invalid-password-hash':
        return 'O hash da senha precisa ser um buffer de byte válido.';
      case 'invalid-password-salt':
        return 'O "salt" da senha precisa ser um buffer de byte válido';
      case 'invalid-phone-number':
        return 'O valor fornecido para phoneNumber é inválido. Ele precisa ser uma string de identificador compatível com o padrão E.164 não vazio.';
      case 'invalid-photo-url':
        return 'O valor fornecido para a propriedade do usuário photoURL é inválido. Precisa ser um URL de string.';
      case 'invalid-provider-data':
        return 'O providerData precisa ser uma matriz válida de objetos UserInfo.';
      case 'invalid-provider-id':
        return 'O providerId precisa ser um string de identificador de provedor compatível válido.';
      case 'invalid-oauth-responsetype':
        return 'Apenas um responseType do OAuth deve ser definido como verdadeiro.';
      case 'invalid-session-cookie-duration':
        return 'A duração do cookie da sessão precisa ser um número válido em milissegundos entre 5 minutos e 2 semanas.';
      case 'invalid-uid':
        return 'O uid fornecido precisa ser uma string não vazia com no máximo 128 caracteres.';
      case 'invalid-user-import':
        return 'O registro do usuário a ser importado é inválido.';
      case 'maximum-user-count-exceeded':
        return 'O número máximo permitido de usuários a serem importados foi excedido.';
      case 'missing-android-pkg-name':
        return 'Um nome de pacote Android precisa ser fornecido para a instalação do app Android.';
      case 'missing-continue-uri':
        return 'Um URL de confirmação válido precisa ser fornecido na solicitação.';
      case 'missing-hash-algorithm':
        return 'É necessário fornecer o algoritmo de geração de hash e seus parâmetros para importar usuários com hashes de senha.';
      case 'missing-ios-bundle-id':
        return 'A solicitação não tem um ID do pacote.';
      case 'missing-uid':
        return 'Um identificador uid é necessário para a operação atual.';
      case 'missing-oauth-client-secret':
        return 'A chave secreta do cliente de configuração do OAuth é necessária para ativar o fluxo de código do OIDC.';
      case 'operation-not-allowed':
        return 'O provedor de login fornecido está desativado para o projeto do Firebase. Ative-o na seção Método de login do Console do Firebase.';
      case 'phone-number-already-exists':
        return 'O phoneNumber fornecido já está sendo usado por um usuário existente. É necessário que cada usuário tenha um phoneNumber exclusivo.';
      case 'project-not-found':
        return 'Nenhum projeto do Firebase foi encontrado com a credencial usada para inicializar os Admin SDKs. Consulte Configurar um projeto do Firebase para ver a documentação sobre como gerar uma credencial para seu projeto e usá-la na autenticação dos Admin SDKs.';
      case 'reserved-claims':
        return 'Uma ou mais declarações de usuário personalizadas fornecidas para setCustomUserClaims() são reservadas. Por exemplo, não use as declarações específicas do OIDC, como sub, iat, iss, exp, aud, auth_time etc., como chaves para declarações personalizadas.';
      case 'session-cookie-expired':
        return 'O cookie da sessão do Firebase fornecido expirou.';
      case 'session-cookie-revoked':
        return 'O cookie da sessão do Firebase foi revogado.';
      case 'too-many-requests':
        return 'O número de solicitações excede o máximo permitido.';
      case 'uid-already-exists':
        return 'O uid fornecido já está sendo usado por um usuário existente. É necessário que cada usuário tenha um uid exclusivo.';
      case 'unauthorized-continue-uri':
        return 'O domínio da URL de confirmação não está na lista de permissões. Acesse o Console do Firebase para colocar o domínio na lista de permissões.';
      case 'user-not-found':
        return 'Não há registro de usuário existente correspondente ao identificador fornecido.';
      default:
        return 'Código de erro não reconhecido: $errorCode';
    }
  }
}
