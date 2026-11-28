import Mathlib

/-!
# Information-theoretic cryptography: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Probability is measure-theoretic throughout. A key law is a probability measure on the key type,
and perfect security compares the probabilities of the events `{k | E.enc k m = c}` for different
messages `m`. A distribution scheme carries a finite type of random strings with a σ-algebra in
which singletons are measurable, a probability measure on it, and finite share types. The entropy
`labelEntropy` of a label into a finite type, in nats, is the finite-label entropy of
ProbabilisticAndMetricNumberTheory §5.1a; its definition is copied verbatim from
EntropyAndSourceCoding §1.1, because a roadmap's Lean file does not import another roadmap.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset Polynomial

namespace TauCetiRoadmap.InformationTheoreticCryptography

/-! ## Layer 1: Shannon ciphers and perfect secrecy -/

/-- 1.1 A Shannon cipher over `(K, M, C)`: an encryption map, a decryption map, and correctness
`dec k (enc k m) = m`. -/
structure ShannonCipher (K M C : Type*) where
  /-- 1.1 Encryption of a message under a key. -/
  enc : K → M → C
  /-- 1.1 Decryption of a ciphertext under a key. -/
  dec : K → C → M
  /-- 1.1 Decryption undoes encryption. -/
  dec_enc : ∀ k m, dec k (enc k m) = m

/-- 1.1 Perfect security of a cipher for the key law `κ`: for all messages `m₀`, `m₁` and every
ciphertext `c`, the events `E.enc k m₀ = c` and `E.enc k m₁ = c` have the same probability. -/
def IsPerfectlySecure {K M C : Type*} [MeasurableSpace K] (E : ShannonCipher K M C)
    (κ : Measure K) : Prop :=
  ∀ m₀ m₁ c, κ {k | E.enc k m₀ = c} = κ {k | E.enc k m₁ = c}

/-- 1.2 For a perfectly secure cipher, a key with law `κ` independent of the message makes the
message independent of the ciphertext. -/
theorem indepFun_enc_of_isPerfectlySecure {Ω K M C : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] [Fintype K] [MeasurableSpace K]
    [MeasurableSingletonClass K] [Fintype M] [MeasurableSpace M] [MeasurableSingletonClass M]
    [MeasurableSpace C] (E : ShannonCipher K M C) {κ : Measure K}
    (hE : IsPerfectlySecure E κ) {Kv : Ω → K} {Mv : Ω → M} (hK : HasLaw Kv κ μ)
    (hM : Measurable Mv) (hKM : IndepFun Kv Mv μ) :
    IndepFun Mv (fun ω => E.enc (Kv ω) (Mv ω)) μ := by
  sorry

/-- 1.2 Conversely, if the key has law `κ` and is independent of a message that takes every
value with positive probability, and the message is independent of the ciphertext, then the
cipher is perfectly secure for `κ`. -/
theorem isPerfectlySecure_of_indepFun {Ω K M C : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] [Fintype K] [MeasurableSpace K]
    [MeasurableSingletonClass K] [MeasurableSpace M] [MeasurableSingletonClass M]
    [MeasurableSpace C] [MeasurableSingletonClass C] (E : ShannonCipher K M C) {κ : Measure K}
    {Kv : Ω → K} {Mv : Ω → M} (hK : HasLaw Kv κ μ) (hM : Measurable Mv)
    (hKM : IndepFun Kv Mv μ) (hpos : ∀ m, μ (Mv ⁻¹' {m}) ≠ 0)
    (h : IndepFun Mv (fun ω => E.enc (Kv ω) (Mv ω)) μ) : IsPerfectlySecure E κ := by
  sorry

/-- 1.3 The one-time pad over an additive group `G`: `enc k m = m + k`, `dec k c = c - k`. -/
def oneTimePad (G : Type*) [AddGroup G] : ShannonCipher G G G where
  enc k m := m + k
  dec k c := c - k
  dec_enc k m := add_sub_cancel_right m k

/-- 1.3 The one-time pad over a finite additive group is perfectly secure for a key law `κ` if and
only if `κ` is the uniform law. -/
theorem isPerfectlySecure_oneTimePad_iff {G : Type*} [AddGroup G] [Fintype G]
    [MeasurableSpace G] [MeasurableSingletonClass G] (κ : Measure G) [IsProbabilityMeasure κ] :
    IsPerfectlySecure (oneTimePad G) κ ↔ κ = uniformOn Set.univ := by
  sorry

/-- 1.4 Shannon's bound: if a cipher with countably many keys is perfectly secure for a key law
`κ`, the messages inject into the keys of positive probability. -/
theorem exists_injective_of_isPerfectlySecure {K M C : Type*} [Countable K] [MeasurableSpace K]
    (E : ShannonCipher K M C) (κ : Measure K) [IsProbabilityMeasure κ]
    (hE : IsPerfectlySecure E κ) :
    ∃ f : M → K, Function.Injective f ∧ ∀ m, κ {f m} ≠ 0 := by
  sorry

section CopiedFromEntropyAndSourceCoding

variable {Ω : Type*} [MeasurableSpace Ω]

/-- 1.5 The entropy, in nats, of a label `X : Ω → A` into a finite type:
`∑ a, negMulLog (μ (X = a))`. Copied verbatim from EntropyAndSourceCoding §1.1, which copies it
from ProbabilisticAndMetricNumberTheory §5.1a. -/
def labelEntropy {A : Type*} [Fintype A] (μ : Measure Ω) (X : Ω → A) : ℝ :=
  ∑ a, Real.negMulLog (μ.real (X ⁻¹' {a}))

end CopiedFromEntropyAndSourceCoding

/-- 1.5 The entropy form of Shannon's bound: if the message is independent of the ciphertext,
then the entropy of the message is at most the entropy of the key. -/
theorem labelEntropy_le_labelEntropy_of_indepFun {Ω K M C : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] [Fintype K] [MeasurableSpace K]
    [MeasurableSingletonClass K] [Fintype M] [MeasurableSpace M] [MeasurableSingletonClass M]
    [Fintype C] [MeasurableSpace C] [MeasurableSingletonClass C] (E : ShannonCipher K M C)
    {Kv : Ω → K} {Mv : Ω → M} (hK : Measurable Kv) (hM : Measurable Mv)
    (h : IndepFun Mv (fun ω => E.enc (Kv ω) (Mv ω)) μ) :
    labelEntropy μ Mv ≤ labelEntropy μ Kv := by
  sorry

/-! ## Layer 2: secret-sharing schemes and access structures -/

/-- 2.1 A distribution scheme for parties `P` and secrets `S`: a finite type of random strings
with a probability law, a finite share type for each party, and the map sending a secret and a
random string to the vector of shares. -/
structure DistributionScheme (P S : Type) where
  /-- 2.1 The random strings. -/
  Rand : Type
  [instFintypeRand : Fintype Rand]
  [instMeasurableSpaceRand : MeasurableSpace Rand]
  [instMeasurableSingletonClassRand : MeasurableSingletonClass Rand]
  /-- 2.1 The law of the random string. -/
  law : Measure Rand
  [instIsProbabilityMeasureLaw : IsProbabilityMeasure law]
  /-- 2.1 The share type of each party. -/
  Share : P → Type
  [instFintypeShare : ∀ i, Fintype (Share i)]
  /-- 2.1 The shares of all parties for a secret and a random string. -/
  share : S → Rand → (i : P) → Share i

attribute [instance] DistributionScheme.instFintypeRand
  DistributionScheme.instMeasurableSpaceRand DistributionScheme.instMeasurableSingletonClassRand
  DistributionScheme.instIsProbabilityMeasureLaw DistributionScheme.instFintypeShare

namespace DistributionScheme

variable {P S : Type}

/-- 2.1 The shares held by the parties of a finite set `B`. -/
def sharesOn (D : DistributionScheme P S) (B : Finset P) (s : S) (r : D.Rand) :
    (i : B) → D.Share i :=
  fun i => D.share s r i

/-- 2.1 Correctness on `B`: some map recovers the secret from the shares of `B` with
probability one, for every secret. -/
def IsCorrectOn (D : DistributionScheme P S) (B : Finset P) : Prop :=
  ∃ recon : ((i : B) → D.Share i) → S, ∀ s, ∀ᵐ r ∂D.law, recon (D.sharesOn B s r) = s

/-- 2.1 Perfect privacy on `T`: every vector of shares of `T` has the same probability for every
two secrets. -/
def IsPrivateOn (D : DistributionScheme P S) (T : Finset P) : Prop :=
  ∀ s₁ s₂ (v : (i : T) → D.Share i),
    D.law {r | D.sharesOn T s₁ r = v} = D.law {r | D.sharesOn T s₂ r = v}

/-- 2.1 The scheme realizes the family `𝒜`: it is correct on every member of `𝒜` and perfectly
private on every finite set of parties outside `𝒜`. -/
def Realizes (D : DistributionScheme P S) (𝒜 : Set (Finset P)) : Prop :=
  (∀ B ∈ 𝒜, D.IsCorrectOn B) ∧ ∀ T ∉ 𝒜, D.IsPrivateOn T

/-- 2.2 The share-size bound: if `B` is authorized and `B` without `j` is not, the share type of
`j` has at least as many elements as the set of secrets. -/
theorem card_le_card_share [DecidableEq P] [Fintype S] (D : DistributionScheme P S)
    {𝒜 : Set (Finset P)} (hD : D.Realizes 𝒜) {j : P} {B : Finset P} (hB : B ∈ 𝒜)
    (hB' : B.erase j ∉ 𝒜) : Fintype.card S ≤ Fintype.card (D.Share j) := by
  sorry

/-- 2.3 The union scheme: share the secret independently with both schemes. -/
def orScheme (D₁ D₂ : DistributionScheme P S) : DistributionScheme P S where
  Rand := D₁.Rand × D₂.Rand
  law := D₁.law.prod D₂.law
  Share i := D₁.Share i × D₂.Share i
  share s r i := (D₁.share s r.1 i, D₂.share s r.2 i)

/-- 2.3 The intersection scheme over a finite additive group: draw `u` uniformly, share `u` with
the first scheme and `-u + s` with the second. -/
def andScheme {G : Type} [AddGroup G] [Fintype G] [MeasurableSpace G]
    [MeasurableSingletonClass G] (D₁ D₂ : DistributionScheme P G) : DistributionScheme P G where
  Rand := G × D₁.Rand × D₂.Rand
  law := (uniformOn (Set.univ : Set G)).prod (D₁.law.prod D₂.law)
  Share i := D₁.Share i × D₂.Share i
  share s r i := (D₁.share r.1 r.2.1 i, D₂.share (-r.1 + s) r.2.2 i)

/-- 2.3 The union scheme realizes the union of the realized families. -/
theorem realizes_orScheme {D₁ D₂ : DistributionScheme P S} {𝒜₁ 𝒜₂ : Set (Finset P)}
    (h₁ : D₁.Realizes 𝒜₁) (h₂ : D₂.Realizes 𝒜₂) : (D₁.orScheme D₂).Realizes (𝒜₁ ∪ 𝒜₂) := by
  sorry

/-- 2.3 The intersection scheme realizes the intersection of the realized families. -/
theorem realizes_andScheme {G : Type} [AddGroup G] [Fintype G] [MeasurableSpace G]
    [MeasurableSingletonClass G] {D₁ D₂ : DistributionScheme P G} {𝒜₁ 𝒜₂ : Set (Finset P)}
    (h₁ : D₁.Realizes 𝒜₁) (h₂ : D₂.Realizes 𝒜₂) : (D₁.andScheme D₂).Realizes (𝒜₁ ∩ 𝒜₂) := by
  sorry

/-- 2.4 With finitely many parties and at least two secrets, a family of finite sets of parties is
realized by some distribution scheme if and only if it is an upper set not containing `∅`. -/
theorem exists_realizes_iff [Fintype P] [Fintype S] (hS : 1 < Fintype.card S)
    (𝒜 : Set (Finset P)) :
    (∃ D : DistributionScheme P S, D.Realizes 𝒜) ↔ IsUpperSet 𝒜 ∧ ∅ ∉ 𝒜 := by
  sorry

end DistributionScheme

/-! ## Layer 3: linear schemes -/

/-- 3.1 Shamir's polynomial `s + ∑_{j < t} a_j X^(j+1)` for the secret `s` and the random
coefficients `a`. -/
def shamirPoly {F : Type} [Field F] {t : ℕ} (s : F) (a : Fin t → F) : F[X] :=
  C s + ∑ j : Fin t, C (a j) * X ^ (j.1 + 1)

/-- 3.1 Shamir's scheme with `t` uniform random coefficients: party `i` receives the value of
Shamir's polynomial at `α i`. -/
def shamirScheme {P : Type} (F : Type) [Field F] [Finite F] [MeasurableSpace F]
    [MeasurableSingletonClass F] (α : P → F) (t : ℕ) : DistributionScheme P F where
  Rand := Fin t → F
  instFintypeRand := Fintype.ofFinite _
  law := uniformOn Set.univ
  Share _ := F
  instFintypeShare _ := Fintype.ofFinite _
  share s a i := (shamirPoly s a).eval (α i)

/-- 3.1 With distinct nonzero evaluation points, Shamir's scheme with `t` random coefficients
realizes the family of sets of more than `t` parties. -/
theorem realizes_shamirScheme {P F : Type} [Field F] [Finite F] [MeasurableSpace F]
    [MeasurableSingletonClass F] {α : P → F} (hα : Function.Injective α) (hα₀ : ∀ i, α i ≠ 0)
    (t : ℕ) : (shamirScheme F α t).Realizes {B | t < #B} := by
  sorry

/-- 3.2 A monotone span program with rows labelled by `ρ` accepts `B` when the rows labelled by
members of `B` span the first unit vector. -/
def MspAccepts {P F ι : Type} [Field F] {b : ℕ} (M : Matrix ι (Fin (b + 1)) F) (ρ : ι → P)
    (B : Finset P) : Prop :=
  Pi.single 0 1 ∈ Submodule.span F (Set.range fun x : {x // ρ x ∈ B} => M x)

/-- 3.2 The linear scheme of a monotone span program: with `b` uniform random field elements `r`,
party `j` receives the entries of `M (s, r)` in the rows labelled by `j`. -/
def mspScheme {P F ι : Type} [Field F] [Finite F] [MeasurableSpace F]
    [MeasurableSingletonClass F] [Finite ι] {b : ℕ} (M : Matrix ι (Fin (b + 1)) F)
    (ρ : ι → P) : DistributionScheme P F where
  Rand := Fin b → F
  instFintypeRand := Fintype.ofFinite _
  law := uniformOn Set.univ
  Share j := {x // ρ x = j} → F
  instFintypeShare _ := Fintype.ofFinite _
  share s r _ x := M.mulVec (Fin.cons s r) x.1

/-- 3.2 The scheme of a monotone span program realizes the family of sets the program accepts. -/
theorem realizes_mspScheme {P F ι : Type} [Field F] [Finite F] [MeasurableSpace F]
    [MeasurableSingletonClass F] [Finite ι] {b : ℕ} (M : Matrix ι (Fin (b + 1)) F)
    (ρ : ι → P) : (mspScheme M ρ).Realizes {B | MspAccepts M ρ B} := by
  sorry

end TauCetiRoadmap.InformationTheoreticCryptography
