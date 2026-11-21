# Roadmap: information-theoretic cryptography

**Summary.** This roadmap proves the basic theorems of cryptography that hold against an
adversary of unlimited power: perfect secrecy of a cipher, Shannon's bound on the key, and
perfectly private secret sharing. Every statement is about random variables with finitely or
countably many values, finite fields and polynomials. A cipher has a key, a message and a
ciphertext space, the key is drawn from a probability law, and a secret-sharing scheme hands each
party a share computed from the secret and a random string drawn from a probability law on a
finite set. No adversary, running time, negligible function or complexity class appears anywhere.

The headline theorems:

- *Perfect secrecy and the one-time pad.* A cipher is perfectly secure for a key law when every
  ciphertext is equally likely under every message. If the key is independent of the message,
  perfect security makes the message independent of the ciphertext; conversely, for a key
  independent of the message, independence of message and ciphertext forces perfect security
  when every message has positive probability. The one-time pad
  `m ↦ m + k` over a finite group is perfectly secure exactly for the uniform key law.
- *Shannon's bound.* If a cipher with countably many keys is perfectly secure for a key law, the
  messages inject into the keys of positive probability; in particular `|M| ≤ |K|`. In entropy
  form: whenever the message is independent of the ciphertext, `H(M) ≤ H(K)`.
- *Which access structures can be realized.* For finitely many parties and at least two secrets,
  a family of sets of parties is realized by a perfectly private secret-sharing scheme (every set
  of the family recovers the secret with probability one, every other set has a share
  distribution independent of the secret) if and only if it is closed under supersets and does
  not contain the empty set. If `B` is authorized and `B` minus a party `j` is not, the share of
  `j` takes at least as many values as the secret.
- *Linear schemes.* Over a finite field, Shamir's scheme with `t` random coefficients and distinct
  nonzero evaluation points realizes the sets of more than `t` parties, and the scheme of any
  monotone span program realizes the sets it accepts.

The entropy of a variable with finitely many values is that of the roadmap
ProbabilisticAndMetricNumberTheory, and the submodularity of entropy comes from the roadmap
EntropyAndSourceCoding. Mathlib supplies
independence of random variables, uniform laws on finite types, product measures, Lagrange
interpolation and spans of vectors.

Layer 1 below treats ciphers: perfect security, its characterization by independence, the
one-time pad, and Shannon's bound in counting and entropy form. Layer 2 defines distribution
schemes and what it means to realize a family of sets, proves the share-size bound, builds
schemes for unions and intersections of realized families, and characterizes the realizable
families. Layer 3 proves that Shamir's scheme and the schemes of monotone span programs realize
their families. Layers 1 and 2 are independent; Layer 3 uses only the definitions of Layer 2.

## Conventions

- **Probability.** Probability is measure-theoretic. A key law is a probability measure `κ` on the
  key type; a random variable, or label, is a measurable map on a probability space `(Ω, μ)`. A
  finite type that carries a label or a random string has a σ-algebra in which singletons are
  measurable, so every subset is measurable. Uniform laws are Mathlib's
  `ProbabilityTheory.uniformOn Set.univ`, and products of laws are Mathlib's
  `MeasureTheory.Measure.prod`. Independence of two labels is Mathlib's
  `ProbabilityTheory.IndepFun`, and `HasLaw X κ μ` (Mathlib's `ProbabilityTheory.HasLaw`) says that
  `X` has law `κ` under `μ`.
- **Ciphers.** A Shannon cipher over `(K, M, C)` is `ShannonCipher K M C`: maps
  `enc : K → M → C` and `dec : K → C → M` with `dec k (enc k m) = m` for all `k`, `m`. Encryption
  is deterministic; all randomness is in the key. Perfect security is a property of a cipher
  together with a key law, which need not be uniform.
- **Entropy.** `labelEntropy μ X` is the sum over the values `a` of `Real.negMulLog (μ (X = a))`,
  in nats, for a label `X` into a finite type: the finite-label entropy of
  ProbabilisticAndMetricNumberTheory §5.1a, copied verbatim into `Suggested.lean` from
  EntropyAndSourceCoding §1.1. A fair bit has entropy `log 2`.
- **Distribution schemes.** Parties form a type `P`, secrets a type `S`. A distribution scheme
  `DistributionScheme P S` has a finite type `Rand` of random strings with a probability law, a
  finite share type `Share i` for each party, and the map `share s r i`. Sets of parties are
  finite sets `Finset P`, and a family of them is a `Set (Finset P)`; an access structure is an
  upper set for inclusion (Mathlib's `IsUpperSet`) not containing `∅`. Correctness on a set
  holds with probability one for every secret; privacy compares the laws of the shares of a set
  for every two secrets. No probability law on the secrets is assumed.
- **Fields and polynomials.** Linear schemes are over a finite field `F`. Shamir's polynomial
  with secret `s` and random coefficients `a₀, …, a_(t−1)` is `s + ∑ a_j X^(j+1)`, of degree at
  most `t`; the number `t` of random coefficients is one less than the threshold, so that no
  natural-number subtraction occurs. A monotone span program is a matrix with rows indexed by a
  finite type `ι`, columns `Fin (b + 1)` and a labelling `ρ : ι → P` of the rows by parties; the
  target vector is the first unit vector, written `Pi.single 0 1`.

## Layer 1: Shannon ciphers and perfect secrecy

### 1.1 Shannon ciphers and perfect security

Define `ShannonCipher K M C` as in the conventions and `IsPerfectlySecure E κ` for a key law `κ`:
for all messages `m₀`, `m₁` and every ciphertext `c`,
`κ {k | E.enc k m₀ = c} = κ {k | E.enc k m₁ = c}` (Boneh–Shoup, Definition 2.1, p. 8, for the
uniform key law; the definition here allows any key law).

API, proved here:

- Counting form: for the uniform law on a finite nonempty key type, `E` is perfectly secure if and
  only if, for every ciphertext `c`, the number of keys `k` with `E.enc k m = c` does not depend
  on `m` (Boneh–Shoup, Theorem 2.1, pp. 8–9).
- Events form: `E` is perfectly secure for `κ` if and only if, for every set `A` of ciphertexts,
  `κ {k | E.enc k m ∈ A}` does not depend on `m`, when the key type is finite (Boneh–Shoup,
  Theorem 2.3, p. 10, for the uniform key law); the event is a finite disjoint union of events
  `E.enc k m = c`.

**Checks.**
- On `K = M = C = ZMod 3` with `E.enc k m = m + k` and the key law giving mass `1/2` to `0` and
  `1`, the probability of `E.enc k m = 0` is `1/2`, `0`, `1/2` for `m = 0, 1, 2`: not perfectly
  secure.
- A cipher that ignores the key, `E.enc k m = m`, is not perfectly secure when there are two
  messages: the event `E.enc k m = m₀` has probability `1` for `m = m₀` and `0` otherwise. A
  definition that compared the maps `k ↦ E.enc k m₀` and `k ↦ E.enc k m₁` themselves, rather
  than their laws, would reject the one-time pad of 1.3.

*Needs:* Mathlib `MeasureTheory.Measure`, `ProbabilityTheory.uniformOn`,
`MeasureTheory.measure_biUnion_finset`.

### 1.2 Perfect security as independence

Let `(Ω, μ)` be a probability space, `K` a finite type and `M` a type, both with measurable
singletons, `E` a cipher over `(K, M, C)` and `κ` a key law. Let `Kv : Ω → K` be a key with
`HasLaw Kv κ μ`, `Mv : Ω → M` a measurable message independent of `Kv`, and `Cv = E.enc Kv Mv`
the ciphertext.

- `indepFun_enc_of_isPerfectlySecure`: if `M` is finite and `E` is perfectly secure for `κ`, then
  `Mv` and `Cv` are independent (Boneh–Shoup, Theorem 2.4, first part, p. 11, for the uniform
  key law; the proof there uses only that the law of `E.enc k m` under `κ` does not depend on
  `m`).
- `isPerfectlySecure_of_indepFun`: if `C` has measurable singletons, every message has positive
  probability, and `Mv` and `Cv` are independent, then `E` is perfectly secure for `κ`
  (Boneh–Shoup, Theorem 2.4, second part, p. 11). Here `M` need not be finite (positive
  probability of every message forces it to be countable): the route below fixes one message at
  a time.

Route: for a message `m` and a measurable set `A` of ciphertexts,
`μ (Mv = m, Cv ∈ A) = μ (Mv = m, E.enc Kv m ∈ A) = μ (Mv = m) · κ {k | E.enc k m ∈ A}` by the
independence of key and message. Under perfect security the last factor equals
`μ (Cv ∈ A) = ∑_m' μ (Mv = m') · κ {k | E.enc k m' ∈ A}`, which gives independence on the
sets `{Mv = m} ∩ {Cv ∈ A}`; summing over the finitely many `m` in a set of messages gives the
product formula for all measurable sets. Conversely, independence of `Mv` and `Cv` gives
`μ (Mv = m) · κ {k | E.enc k m = c} = μ (Mv = m) · μ (Cv = c)`, and dividing by
`μ (Mv = m) > 0` shows that `κ {k | E.enc k m = c} = μ (Cv = c)` for every `m`.

**Checks.**
- Finiteness of the key type is needed in the first statement: take `K = C = ℝ`, `M = Bool`,
  `E.enc k m = k + 2` for `m = true` and `E.enc k m = k` for `m = false`, decryption by testing
  whether `c − k = 2`, and the uniform key law on `[0, 1]`. Every event `E.enc k m = c` is at most
  one key, of probability `0`, so the cipher is perfectly secure; but for a fair message
  independent of the key, almost surely `Cv ≤ 1` exactly when `Mv = false`, so `Mv` and `Cv` are
  dependent.
- Independence of key and message is needed in the first statement: for the one-time pad over
  `ZMod 3` with `Kv = Mv` uniform, the key law is uniform and the cipher is perfectly secure, but
  `Cv = 2 Mv` determines `Mv`: `μ (Mv = 0, Cv = 0) = 1/3`, while `μ (Mv = 0) μ (Cv = 0) = 1/9`.
- Positive probability of every message is needed in the converse: with `K = M = Bool`,
  `C = Bool × Bool`, `E.enc k m = (k, m)`, `E.dec k c = c.2`, a uniform key and `Mv` constant,
  `Mv` is independent of everything, but the event `E.enc k m = (true, false)` has probability
  `1/2` for `m = false` and `0` for `m = true`.
- Independence of key and message is needed in the converse: for the one-time pad over `ZMod 2`,
  take `Mv` and `W` independent with `μ (Mv = 0) = μ (W = 0) = 3/4` and `Kv = W − Mv`. Then
  `Cv = W` is independent of `Mv`, every message has positive probability, but the key law gives
  `Kv = 0` probability `5/8`, so by 1.3 the cipher is not perfectly secure for it.

*Needs:* 1.1; Mathlib `ProbabilityTheory.IndepFun`, `ProbabilityTheory.HasLaw`,
`ProbabilityTheory.indepFun_iff_measure_inter_preimage_eq_mul`.

### 1.3 The one-time pad

Define `oneTimePad G` for an additive group `G`: keys, messages and ciphertexts are elements of
`G`, `enc k m = m + k` and `dec k c = c − k` (Boneh–Shoup, Example 2.1, p. 6, and Example 2.4,
p. 7). Prove `isPerfectlySecure_oneTimePad_iff`: for a finite additive group `G` and a key law
`κ` that is a probability measure, `oneTimePad G` is perfectly secure for `κ` if and only if `κ`
is the uniform law (Boneh–Shoup, Theorem 2.2, p. 9, and Example 2.7, p. 10, prove the direction
from the uniform law for bit strings and for `ZMod n`; the converse is proved here).

Route: `{k | m + k = c}` is the single key `−m + c`. Perfect security therefore says that
`κ {−m + c} = κ {c}` for all `m` and `c`, that is, `κ` gives every element the same mass; a
probability measure on a finite type with measurable singletons is determined by the masses of
the singletons (Mathlib `MeasureTheory.Measure.ext_of_singleton`), and equal masses summing to
`1` are those of the uniform law.

**Checks.**
- Bit strings of length `L` with exclusive or are the case `G = Fin L → ZMod 2`.
- On `ZMod 2` the key law `(3/4, 1/4)` fails: the event `0 + k = 0` has probability `3/4` and the
  event `1 + k = 0` has probability `1/4`.
- The hypothesis that `κ` is a probability measure is needed: the zero measure satisfies every
  equality of perfect security and is not the uniform law.
- The group need not be commutative: on the symmetric group of three letters written additively
  the same argument applies, and an exhaustive search over the key laws with masses in
  `{0, 1, 2, 3}`, normalized, finds exactly the uniform law perfectly secure.

*Needs:* 1.1; Mathlib `ProbabilityTheory.uniformOn`, `ProbabilityTheory.uniformOn_univ`,
`MeasureTheory.Measure.ext_of_singleton`.

### 1.4 Shannon's bound

Prove `exists_injective_of_isPerfectlySecure`: if `K` is countable, `κ` is a probability measure
on `K` and `E` is perfectly secure for `κ`, there is an injective map `f : M → K` with
`κ {f m} ≠ 0` for every `m`. Consequently `|M|` is at most the number of keys of positive
probability, and `|M| ≤ |K|` when `K` is finite (Boneh–Shoup, Theorem 2.5, p. 12, for finite
`K` and the uniform key law; the general key law and countable `K` are handled by the same
argument, written out here). No measurability of the events `E.enc k m = c` is needed: the route
uses only monotonicity and countable subadditivity of `κ`, which hold for all sets.

Route: a probability measure on a countable type gives some key `k₀` positive mass, by countable
subadditivity. Fix a message `m₀` and let `c = E.enc k₀ m₀`; then `κ {k | E.enc k m₀ = c} > 0`,
so by perfect security `κ {k | E.enc k m = c} > 0` for every `m`, and by countable subadditivity
again some key `f m` of positive mass has `E.enc (f m) m = c`. Then `m = E.dec (f m) c`, so `f`
is injective. If `M` is empty the empty map serves.

**Checks.**
- The bound is attained: the one-time pad over `ZMod n` with the uniform key has `n` messages
  and `n` keys of positive probability.
- The converse fails: `E.enc k m = m` on `K = Fin 5`, `M = C = Bool` has more keys than messages
  and is not perfectly secure (1.1).
- Countability is needed: with `K = M = C = ℝ`, `E.enc k m = m + k` and `κ` the uniform law on
  `[0, 1]`, every event `E.enc k m = c` is a single key of measure `0`, so all equalities of
  perfect security hold, but no key has positive mass.
- The zero measure, which every cipher satisfies trivially, is excluded by the hypothesis that
  `κ` is a probability measure.

*Needs:* 1.1; Mathlib `MeasureTheory.measure_iUnion_null_iff` (countable subadditivity in the
form used above). (Proved here for general key laws.)

### 1.5 The entropy form

Copy `labelEntropy` verbatim from EntropyAndSourceCoding §1.1 (where it is copied from
ProbabilisticAndMetricNumberTheory §5.1a). Prove `labelEntropy_le_labelEntropy_of_indepFun`: let
`K`, `M` and `C` be finite types with measurable singletons, `E` a cipher over `(K, M, C)`, and
`Kv`, `Mv` measurable labels on a probability space with ciphertext `Cv = E.enc Kv Mv`. If `Mv`
and `Cv` are independent, then `H(Mv) ≤ H(Kv)`. No independence of key and message is assumed;
with 1.2, perfect security for the law of a key independent of the message gives the hypothesis.
The statement is given for finite `C` because the route uses the entropy of the ciphertext.
(Proved here.)

Route:

- `H((Mv, Cv)) = H(Mv) + H(Cv)` by independence. Write `p_a = μ (Mv = a)` and `q_c = μ (Cv = c)`;
  `Cv` is measurable, being a function of the measurable pair `(Kv, Mv)` with values in the
  finite type `K × M`, whose singletons are measurable. Independence and measurable singletons
  give `μ (Mv = a, Cv = c) = p_a q_c`, and Mathlib's `Real.negMulLog_mul` gives
  `negMulLog (p_a q_c) = q_c negMulLog p_a + p_a negMulLog q_c`; summing over `a` and `c`
  and using `∑ p_a = ∑ q_c = 1` gives the identity. (ProbabilisticAndMetricNumberTheory Layer 5,
  finite-label entropy, §5.1a, lists the same identity for independent labels.)
- `(Mv, Cv) = g ∘ (Kv, Cv)` with `g (k, c) = (E.dec k c, c)`, by correctness. Entropy does not
  increase under a map of labels: the mass of each value of `g ∘ Z` is the sum of the masses of
  the values of `Z` in its fibre, and `negMulLog (x + y) ≤ negMulLog x + negMulLog y` for
  `x, y ≥ 0`, because `−x log (x + y) ≤ −x log x` for `x > 0`. Hence
  `H((Mv, Cv)) ≤ H((Kv, Cv))`.
- `H((Kv, Cv)) ≤ H(Kv) + H(Cv)`: apply the submodularity theorem of EntropyAndSourceCoding
  §1.1, labelEntropy_subLabel_union_add_inter_le, to the family of two labels indexed by `Bool`
  formed by `Kv` and `Cv` composed with the bijections `Fintype.equivFin` onto `Fin |K|` and
  `Fin |C|` (so that the family has value types in one universe, as that theorem requires), with
  `S = {true}` and `T = {false}`. The joint label of `∅` takes one value, so its entropy is
  `negMulLog 1 = 0`, and the joint labels of `{true}`, `{false}` and `{true, false}` are `Kv`,
  `Cv` and `(Kv, Cv)` composed with bijections of the value types. A bijection of value types
  permutes the masses, which leaves the entropy unchanged.
- Combining the three, `H(Mv) + H(Cv) ≤ H(Kv) + H(Cv)`.

**Checks.**
- For the one-time pad over a finite group with a uniform key independent of the message, both
  sides are `log |G|` when the message is uniform, and the inequality is strict for a fair bit
  message on `ZMod 4`: `log 2 < log 4`.
- Key and message may be dependent: on `ZMod 2` with `Kv = Mv` a fair bit, `Cv = 0` is constant,
  hence independent of `Mv`, and `H(Mv) = H(Kv) = log 2`.
- Measurable singletons on `C` are needed: if `C` carried the trivial σ-algebra, every label into
  `C` would be independent of `Mv`; with `Kv` constant, `Mv` a fair bit and `E.enc k m = m`, the
  conclusion would read `log 2 ≤ 0`.

*Needs:* 1.1; ProbabilisticAndMetricNumberTheory §5.1a (the finite-label entropy);
EntropyAndSourceCoding §1.1 (the copied definition `labelEntropy`, and submodularity,
labelEntropy_subLabel_union_add_inter_le); Mathlib `Real.negMulLog`, `Real.negMulLog_mul`,
`ProbabilityTheory.IndepFun`, `Fintype.equivFin`.

### Examples

The one-time pad over `ZMod n` and over bit strings; the key-ignoring cipher; the key law
`(3/4, 1/4)` on `ZMod 2`; the cipher `(k, m) ↦ (k, m)` with a constant message; the real line
with the uniform law on `[0, 1]` as a key law with no atoms.

### Dependencies

ProbabilisticAndMetricNumberTheory §5.1a and EntropyAndSourceCoding §1.1 (for 1.5 only); Mathlib
measures, independence, uniform laws and `Real.negMulLog`. No other layer.

## Layer 2: secret-sharing schemes and access structures

### 2.1 Distribution schemes, correctness and privacy

Define `DistributionScheme P S` as in the conventions (Beimel, Definition 1, pp. 3–4, with finite
share domains), `sharesOn D B s r` for the shares of the parties of `B`, and:

- `IsCorrectOn D B`: there is a map `recon` from the share vectors of `B` to `S` such that, for
  every secret `s`, `recon (sharesOn D B s r) = s` for almost every `r` (Beimel, Definition 2,
  correctness, p. 4);
- `IsPrivateOn D T`: for all secrets `s₁`, `s₂` and every share vector `v` of `T`, the random
  strings with `sharesOn D T s₁ r = v` and those with `sharesOn D T s₂ r = v` have the same
  probability (Beimel, Definition 2, perfect privacy, p. 4);
- `Realizes D 𝒜`: `IsCorrectOn D B` for every `B ∈ 𝒜` and `IsPrivateOn D T` for every finite set
  `T ∉ 𝒜` (Beimel, Definition 2, p. 4, where `𝒜` is an access structure and `|S| ≥ 2`; neither
  is assumed in the definition here).

API, proved here:

- A set that is both correct and private exists only when `S` has at most one element: a share
  vector of positive probability under `s₁` has positive probability under `s₂` by privacy, and
  `recon` sends it to both.
- Correctness and privacy pass to the image of the scheme under a bijection of the secrets.
- For a probability law `π` on the secrets with every secret of positive probability, privacy on
  `T` is equivalent to the independence of the secret and the shares of `T` under the joint law
  (Beimel, Claim 1, p. 6); the computation is that of 1.2.

**Checks.**
- The scheme in which party `i` receives the secret and every other party a fixed share realizes
  the family of sets containing `i`.
- Two parties, `S = Rand = ZMod 2` with the uniform law, and shares `(r, s + r)` realize the
  family `{{0, 1}}`: each share alone is a uniform bit whatever `s` is. A definition of privacy
  that asked for equal shares rather than equal laws would reject this scheme.
- With one secret every family is realized by a scheme with constant shares, including the
  family `{{0}}` on two parties, which is not an upper set.

*Needs:* Mathlib `MeasureTheory.Measure`, `MeasureTheory.ae_iff`, `IsUpperSet`.

### 2.2 The share-size bound

Prove `card_le_card_share`: if `D` realizes `𝒜`, `B ∈ 𝒜` and `B.erase j ∉ 𝒜`, then
`|S| ≤ |Share j|` (Beimel, Lemma 2, p. 19, for a party of a minimal authorized set of an access
structure; the statement here assumes neither monotonicity nor minimality of `B`). The
hypotheses force `j ∈ B`, since otherwise `B.erase j = B`.

Route: let `B' = B.erase j` and fix a secret `s₀` and a random string `r₀` of positive mass
(there is one, since `Rand` is finite and the law is a probability measure). The share vector
`v = sharesOn D B' s₀ r₀` has positive probability under `s₀`, hence under every secret `s` by
privacy on `B'`, so for each `s` there is a random string `r_s` of positive mass with
`sharesOn D B' s r_s = v`. Correctness on `B` holds at every random string of positive mass. If
`share s r_s j = share s' r_s' j`, the shares of `B` agree, so `s = s'`; thus
`s ↦ share s r_s j` is injective.

**Checks.**
- Shamir's scheme (3.1) attains the bound: its shares and secrets are elements of `F`.
- The hypothesis `B.erase j ∉ 𝒜` is needed: for three parties, give parties `0` and `1` the
  shares of the two-party scheme of 2.1 over `ZMod 3` (shares `r` and `s + r`) and party `2` the
  one-element share type; the scheme realizes `{B | {0, 1} ⊆ B}`, and party `2`, which lies in the
  authorized set `{0, 1, 2}`, has one possible share for three secrets.

*Needs:* 2.1; Mathlib `Fintype.card_le_of_injective`, `MeasureTheory.ae_iff`.

### 2.3 Unions and intersections

Define `orScheme D₁ D₂`: random strings `Rand₁ × Rand₂` with the product law, share of party `i`
the pair of its shares in both schemes for the same secret. For a finite additive group `G` of
secrets, define `andScheme D₁ D₂`: random strings `G × Rand₁ × Rand₂` with the product of the
uniform law and the two laws; for the random string `(u, r₁, r₂)` and the secret `s`, party `i`
receives its share of `u` in `D₁` and its share of `−u + s` in `D₂`.

- `realizes_orScheme`: if `D₁` realizes `𝒜₁` and `D₂` realizes `𝒜₂`, then `orScheme D₁ D₂`
  realizes `𝒜₁ ∪ 𝒜₂`.
- `realizes_andScheme`: under the same hypotheses, `andScheme D₁ D₂` realizes `𝒜₁ ∩ 𝒜₂`.

(Beimel, §3.4, pp. 9–10, for secrets in `ℤ/m`; the statement here allows any finite group.)

Route: correctness of a union comes from either component, almost everywhere for the product law
because a null set of one factor has a null preimage. A set outside `𝒜₁ ∪ 𝒜₂` is private for
both schemes, and its share law is the product of two laws independent of the secret
(`MeasureTheory.Measure.prod_prod`). For the intersection, a set in both families recovers `u`
and `−u + s`, hence `s = u + (−u + s)`. A set `T` outside `𝒜₁` has, for each `u`, a share law in
`D₁` that does not depend on `u`; summing over `u` with weight `1/|G|`, the law of the pair of
shares is the product of that law with the average over `u` of the law of the `D₂`-shares of
`−u + s`, and `u ↦ −u + s` is a bijection of `G`, so the average does not depend on `s`. A set
outside `𝒜₂` is treated the same way with the roles of the two components exchanged.

**Checks.**
- The intersection of the schemes of 2.1 that give the secret to party `0` and to party `1` is,
  up to relabelling the shares, the two-party scheme with shares `(u, −u + s)` for a uniform `u`,
  and realizes the family `{B | {0, 1} ⊆ B}`.
- The uniform law on the first coordinate is needed: if `u` were always `0`, party `1` alone
  would receive `s` in that intersection.
- An exhaustive check over `ZMod 5` with three parties, taking for `D₁` and `D₂` all 81 ordered
  pairs of nine Shamir schemes (3.1) on subsets of the parties, the other parties receiving a
  constant share, confirms both statements.

*Needs:* 2.1; Mathlib `MeasureTheory.Measure.prod`, `MeasureTheory.Measure.prod_prod`,
`ProbabilityTheory.uniformOn`.

### 2.4 Realizable families

Prove `exists_realizes_iff`: for a finite type `P` of parties and a finite type `S` of secrets
with `|S| ≥ 2`, a family `𝒜` of sets of parties is realized by some distribution scheme if and
only if `𝒜` is an upper set and `∅ ∉ 𝒜` (Beimel, §3.3, p. 9, for one-bit secrets, and §3.4,
p. 10, the remark deriving it from the union and intersection constructions; the converse
direction is proved here).

Route, "only if": if `B ∈ 𝒜`, `B ⊆ C` and `C ∉ 𝒜`, then `C` is private and also correct, since
the shares of `C` contain those of `B`, which contradicts the first API bullet of 2.1; and `∅` is
private for every scheme, since its share vector is constant, so `∅ ∈ 𝒜` would make it both.
Route, "if": transport `S` to `ZMod |S|` by a bijection. For a party `i`, the scheme of 2.1
that gives `i` the secret realizes `{B | i ∈ B}`; by 2.3 the intersection over the members of a
nonempty `B₀` realizes `{B | B₀ ⊆ B}`, and the union over the finitely many members `B₀` of `𝒜`
realizes `𝒜`, because `𝒜` is an upper set. The empty family is realized by a scheme with
constant shares.

**Checks.**
- With two parties, two secrets, two equally likely random strings and one-bit shares, an
  exhaustive search finds exactly five realized families, the five upper sets of nonempty
  subsets of `{0, 1}`: none, `{{0, 1}}`, `{{0}, {0, 1}}`, `{{1}, {0, 1}}` and all three.
- `|S| ≥ 2` is needed (third Check of 2.1).
- Finitely many parties are needed for "if": with `P = ℕ` and `𝒜` the sets of at least two
  parties, each party's share is a function on the finite set `S × Rand`, so two parties `i ≠ j`
  induce the same partition of it; then `{i}` determines the share of `j`, so `{i}` is correct
  because `{i, j}` is, and it is also private, which the first API bullet of 2.1 forbids.

*Needs:* 2.1, 2.3; Mathlib `IsUpperSet`, `ZMod`, `Fintype.equivFin`.

### Examples

The scheme giving the secret to one party; the two-party scheme `(r, s + r)`; a redundant party
with a one-element share type; the families on two parties.

### Dependencies

Mathlib measures, product measures, uniform laws and `IsUpperSet`. 2.4 uses 2.3, and both use
2.1. No other layer.

## Layer 3: linear schemes

### 3.1 Shamir's threshold scheme

Define `shamirPoly s a`, the polynomial `s + ∑_{j < t} a_j X^(j+1)` over a field `F`, and, for a
finite field `F`, evaluation points `α : P → F` and `t ≥ 0`, `shamirScheme F α t`: random
strings `a : Fin t → F` with the uniform law, every share type `F`, and share of party `i` the
value `shamirPoly s a` at `α i`. Prove `realizes_shamirScheme`: if `α` is injective and
`α i ≠ 0` for every `i`, then `shamirScheme F α t` realizes `{B | t < |B|}` (Beimel, §3.1,
pp. 7–8, with threshold `t + 1`).

API, proved here:

- Reconstruction: for `t < |B|`, the secret is the value at `0` of the Lagrange interpolant of
  the shares on the nodes `α i`, `i ∈ B` (Mathlib `Lagrange.interpolate`), that is
  `s = ∑_{i ∈ B} y_i ∏_{j ∈ B, j ≠ i} α_j / (α_j − α_i)`.
- Privacy in counted form: for `|T| ≤ t`, every share vector of `T` arises from exactly
  `|F|^(t − |T|)` random strings, whatever the secret.
- Over a field of `q` elements, injective nonzero points exist only for at most `q − 1` parties.

Route: `shamirPoly s a` has degree less than `t + 1`, so for `t < |B|` it equals its Lagrange
interpolant on `B` (Mathlib `Lagrange.eq_interpolate`), whose value at `0` is `s`. For `|T| ≤ t`,
the share vector of `T` is `s · 1 + V a`, where `V` is the `|T| × t` matrix with entries
`α_i^(j+1)`. Its first `|T|` columns form the matrix `diag(α_i)` times a Vandermonde matrix on the
distinct points `α_i`, which is invertible (Mathlib `Matrix.det_vandermonde_ne_zero_iff`) because
the `α_i` are distinct and nonzero. So `a ↦ V a` is a surjective linear map, and for each `s` and
each share vector `v` the random strings with `s · 1 + V a = v` form a coset of its kernel, of
dimension `t − |T|`, whatever `s` is.

**Checks.**
- Over `ZMod 5` with `α = 1, 2, 3`, `t = 1`, secret `4` and `a₀ = 2`, the shares are `1, 3, 0`;
  parties `1` and `2` reconstruct `2 · 1 + 4 · 3 = 14 = 4` with the coefficients
  `α₂/(α₂ − α₁) = 2` and `α₁/(α₁ − α₂) = −1 = 4`.
- `α i ≠ 0` is needed: with `t = 1` and `α i = 0`, party `i` receives `s` itself, and `{i}` is not
  private. For `t = 0` the condition does not matter, since every share is `s` and every nonempty
  set is authorized.
- Injectivity of `α` is needed: with `t = 1` and `α i = α j` for `i ≠ j`, the set `{i, j}` is in
  the family but its two shares coincide and do not determine `s`.
- Over `ZMod 5` with `t = 2` and `T = {i, j}`, each of the `25` share vectors of `T` has
  probability `1/25` for every secret. Exhaustive checks over `ZMod 2`, `ZMod 3`, `ZMod 5` with up
  to three parties and `t ≤ 3` confirm the statement for all injective nonzero `α`.

*Needs:* 2.1; Mathlib `Polynomial`, `Lagrange.interpolate`, `Lagrange.eq_interpolate`,
`Lagrange.degree_interpolate_lt`, `Matrix.det_vandermonde_ne_zero_iff`,
`ProbabilityTheory.uniformOn`.

### 3.2 Monotone span programs

For a field `F`, a matrix `M` with rows indexed by a finite type `ι` and columns `Fin (b + 1)`,
and a labelling `ρ : ι → P` of the rows by parties, define `MspAccepts M ρ B`: the first unit
vector lies in the span of the rows labelled by members of `B` (Beimel, Definition 4, p. 11).
For a finite field define `mspScheme M ρ`: random strings `r : Fin b → F` with the uniform law;
the share of party `j` is the vector of entries of `M (s, r)` in the rows labelled by `j`, where
`(s, r)` is `Fin.cons s r`. Prove `realizes_mspScheme`: `mspScheme M ρ` realizes
`{B | MspAccepts M ρ B}` (Beimel, Claim 2, p. 12; the family accepted by a monotone span program
is an upper set not containing `∅`, so no hypothesis on it is needed).

Route: if `w M_B = e₁` for a row vector `w`, the shares `M_B (s, r)` give `w M_B (s, r) = s`.
If `e₁` is not in the row span of `M_T`, there is a vector `z` with `M_T z = 0` and first
coordinate `1`; the translation `r ↦ r + (s' − s) z'`, with `z'` the last `b` coordinates of `z`,
is a bijection of `Fin b → F` that carries the random strings producing a share vector `v` for
the secret `s` onto those producing `v` for `s'`.

**Checks.**
- Over a field of odd characteristic, the rows `(1, 1)`, `(0, 1)`, `(1, 2)` labelled by parties
  `1`, `2`, `3` accept exactly the sets of at least two parties; party `2` receives `r` alone.
  Over `ZMod 2` the row `(1, 2) = (1, 0)` makes party `3` alone authorized.
- The rows `(1, 1)` and `(2, 2)` over `ZMod 3`, labelled by two parties, do not accept the pair:
  the shares `s + r` and `2(s + r)` carry no information about `s`.
- Shamir's scheme is the program with the row `(1, α_i, …, α_i^t)` for party `i`; the accepted
  sets are those of more than `t` parties when the `α_i` are distinct and nonzero, by the
  invertibility of Vandermonde matrices (Mathlib `Matrix.det_vandermonde_ne_zero_iff`).
- An exhaustive check over `ZMod 2` and `ZMod 3` of all programs with at most three rows, at most
  three columns and two parties (171902 programs) confirms the statement.

*Needs:* 2.1; Mathlib `Submodule.span`, `Matrix.mulVec`, `Fin.cons`,
`ProbabilityTheory.uniformOn`.

### Examples

Shamir's scheme over `ZMod 5`; a two-out-of-three program of rows `(1, 1)`, `(0, 1)`, `(1, 2)`.

### Dependencies

2.1 (definitions only); Mathlib Lagrange interpolation, spans and matrices. 3.1 and 3.2 are
independent of each other.

## Scope and ownership

This roadmap owns perfect security of Shannon ciphers with arbitrary key laws, its
characterization by independence, the one-time pad over finite groups, Shannon's bound in
counting and entropy form, distribution schemes and their correctness and privacy, the share-size
bound, the union and intersection constructions, the characterization of realizable families,
Shamir's scheme and the schemes of monotone span programs.

Already in the libraries and therefore not targets: Lagrange interpolation over a field and the
linear bijection between polynomials of bounded degree and their values at distinct points
(`Mathlib/LinearAlgebra/Lagrange.lean`); Vandermonde determinants
(`Mathlib/LinearAlgebra/Vandermonde.lean`); independence of random variables, uniform laws on
finite sets and product measures. The pinned Mathlib and Tau Ceti have no cipher, perfect
security, secret-sharing scheme or span program.

Stated by other roadmaps and consumed here:

- ProbabilisticAndMetricNumberTheory §5.1a owns the finite-label entropy; 1.5 uses it. The
  additivity of entropy for independent labels, which that section lists, enters the route of
  1.5 as a one-line computation and is not a target here.
- EntropyAndSourceCoding §1.1 owns the submodularity of entropy for families of labels and holds
  the copy of the definition of entropy used here; 1.5 uses that theorem and copies that
  definition verbatim.

Not treated here: universal hash families, the leftover hash lemma, privacy amplification and
information-theoretic message authentication codes built from universal hashing; no universal
family is defined. Also outside the scope: every computational notion (adversaries with running
times, negligible functions, pseudorandomness, computational ciphers and semantic security),
public-key cryptography, entropy lower bounds on share sizes beyond 2.2 and information ratios of
specific access structures, statistical and computational secret sharing, multiparty computation,
error-correcting codes (Reed–Solomon codes among them, although Shamir's share vector is one of
their codewords), and monotone formulae as objects (the union and intersection constructions of
2.3 are what they compose).

## Exact supplier contracts

### From Mathlib

- `Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean`: `MeasureTheory.Measure`.
  `Mathlib/MeasureTheory/Measure/Basic.lean`: `MeasureTheory.measure_biUnion_finset` (additivity
  over a finite family of pairwise disjoint measurable sets).
  `Mathlib/MeasureTheory/OuterMeasure/Basic.lean`: `MeasureTheory.measure_iUnion_null_iff` (a
  countable union is null exactly when every member is).
  `Mathlib/MeasureTheory/OuterMeasure/AE.lean`: `MeasureTheory.ae_iff` (a property holds almost
  everywhere when its failure set is null).
- `Mathlib/MeasureTheory/Measure/Dirac/Basic.lean`: `MeasureTheory.Measure.ext_of_singleton` (two
  measures on a countable type with measurable singletons that agree on singletons are equal).
- `Mathlib/MeasureTheory/Measure/Prod.lean`: `MeasureTheory.Measure.prod` and
  `MeasureTheory.Measure.prod_prod` (the product measure of a rectangle is the product of the
  measures).
- `Mathlib/Probability/UniformOn.lean`: `ProbabilityTheory.uniformOn`,
  `ProbabilityTheory.uniformOn_univ` (on a finite type, the uniform law of a set is its count
  divided by the number of elements), and the instance
  `ProbabilityTheory.instIsProbabilityMeasure_uniformOn_univ` (the uniform law on a finite
  nonempty type is a probability measure).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.IndepFun` and
  `ProbabilityTheory.indepFun_iff_measure_inter_preimage_eq_mul` (independence is the product
  formula on preimages of measurable sets). `Mathlib/Probability/HasLaw.lean`:
  `ProbabilityTheory.HasLaw` (a variable is almost everywhere measurable and its image measure is
  the given law).
- `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean`: `Real.negMulLog` (`x ↦ −x log x`) and
  `Real.negMulLog_mul` (`negMulLog (x y) = y negMulLog x + x negMulLog y`).
- `Mathlib/LinearAlgebra/Lagrange.lean`: `Lagrange.interpolate` (the interpolant on a finite set
  of nodes), `Lagrange.degree_interpolate_lt` (its degree is less than the number of nodes for
  injective nodes), `Lagrange.eq_interpolate` (a polynomial of degree less than the number of
  injective nodes equals its interpolant).
  `Mathlib/LinearAlgebra/Vandermonde.lean`: `Matrix.det_vandermonde_ne_zero_iff` (over a domain,
  a Vandermonde determinant is nonzero exactly when the points are distinct).
- `Mathlib/Algebra/Polynomial/Basic.lean` and companions: `Polynomial`, `Polynomial.C`,
  `Polynomial.X`, `Polynomial.eval`.
- `Mathlib/LinearAlgebra/Span/Defs.lean`: `Submodule.span`. `Mathlib/Data/Matrix/Mul.lean`:
  `Matrix.mulVec`. `Mathlib/Data/Fin/Tuple/Basic.lean`: `Fin.cons`.
- `Mathlib/Order/Defs/Unbundled.lean`: `IsUpperSet`. `Mathlib/Data/Fintype/Card.lean`:
  `Fintype.card_le_of_injective`. `Mathlib/Data/Fintype/EquivFin.lean`: `Fintype.equivFin`.
  `Mathlib/Data/ZMod/Defs.lean`: `ZMod`.

### From Tau Ceti

Nothing is consumed.

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

- §5.1a (Layer 5, finite-label entropy): the finite-label entropy
  `H(X) = ∑_a negMulLog (μ (X = a))` of a measurable label into a finite type with its discrete
  σ-algebra on a probability space.

### From TauCetiRoadmap.EntropyAndSourceCoding

- §1.1: the definition `labelEntropy`, copied verbatim, and the theorem
  labelEntropy_subLabel_union_add_inter_le,
  `H(X_(S ∪ T)) + H(X_(S ∩ T)) ≤ H(X_S) + H(X_T)` for a family of measurable labels into finite
  types with measurable singletons on a probability space and finite sets `S`, `T` of indices.

## References

- Dan Boneh and Victor Shoup, *A Graduate Course in Applied Cryptography*, version 0.6 (January
  2023), from Dan Boneh's page at Stanford (crypto.stanford.edu/~dabo/cryptobook/, the file of
  version 0.6); the definition, theorem, example and page numbers above are those of that version.
- Amos Beimel, *Secret-sharing schemes: a survey*, the author's copy (36 pages)
  from his page at Ben-Gurion University; the definition, claim, lemma, section and page numbers
  above are those of that copy.
- Attributions made in prose, as these sources give them: Claude E. Shannon (perfect secrecy and
  the bound on the key); Adi Shamir (the threshold scheme, 1979) and G. R. Blakley; M. Ito,
  A. Saito and T. Nishizeki (schemes for every access structure, 1987); J. Benaloh and
  J. Leichter (the union and intersection constructions); E. F. Brickell and M. Karchmer and
  A. Wigderson (monotone span programs and their schemes).
