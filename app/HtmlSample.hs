-- Just ignore the quasiquote stuff for now, and that shamlet thing.
-- It will be explained later.
{-# LANGUAGE QuasiQuotes #-} -- GHC拡張: QuasiQuotesを有効化。Haskellの中に特定の構文を埋め込むことを可能にする。

import Text.Hamlet (shamlet)
import Text.Blaze.Html.Renderer.String (renderHtml)
import Data.Char (toLower)
import Data.List (sort)

-- Personというデータ型を定義。
-- この型は、名前（name）として文字列と、年齢（age）として整数を持つ。
data Person = Person
    { name :: String
    , age  :: Int
    }

main :: IO ()
main = putStrLn $ renderHtml [shamlet|
<p>Hello, my name is #{name person} and I am #{show $ age person}. -- <p>タグ内に、nameとageフィールドを持つpersonのデータを埋め込んでいる。
-- 新しい段落を作成。
<p>
    Let's do some funny stuff with my name: #
    <b>#{sort $ map toLower (name person)}
<p>Oh, and in 5 years I'll be #{show ((+) 5 (age person))} years old.
|]
  where
    person = Person "Michael" 26