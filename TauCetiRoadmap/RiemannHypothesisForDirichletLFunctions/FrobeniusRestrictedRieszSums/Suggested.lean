import Mathlib

/-!
# Frobenius-restricted Riesz sums: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, with the few
definitions they need.

An abelian host is modelled as an intermediate field `E` of a cyclotomic field `L = ℚ(ζ_N)`
(every finite abelian extension of `ℚ` is one, by the theorem of Kronecker and Weber), with the
Artin map `art_N : (ℤ/N)ˣ → Gal(E/ℚ)`, `a ↦ σ_a|_E`, read through Mathlib's
`IsCyclotomicExtension.Rat.galEquivZMod`. The Frobenius cosets, the primitive Dirichlet character
`χ*` of a character `χ` of `Gal(E/ℚ)`, and complex conjugation `c = art_N(−1)` are defined from it
as in 0.2 and 0.4 (e). The Riesz remainder `G_κ` is that of the Conventions, with Mathlib's
`DirichletCharacter.LFunction` and `Real.eulerMascheroniConstant`.

* The difference of the Frobenius-restricted Riesz sum and its main term is the character
  average (1.2): `frobRieszSum_sub_main`.
* The averaged Frobenius-restricted inequality on a cyclic host at the scale `x` and the
  square-root bound for the weighted family sum at `x` are equivalent up to factors `x^{O(ε)}`
  (1.9, 1.10): `frobeniusInequality_iff_cyclicBound` (both directions, with one threshold `x₁`
  chosen before the host, the tops, the thick set, the weights and the constant `C`) and
  `frobeniusInequality_of_cyclicBound` (the consequence stated in 1.10). The cyclic host is the
  fixed field of the subgroup `H_n(ψ, {q, d})` of 0.4; its places, the subgroups `A` and `A₀`,
  the thick places and the kept characters are those of 0.4–0.6, the inertia group `I_d` being
  `{1, σ_d}` under the hypotheses; a coset law is a function on the cosets of `A₀`.
* Sets of integers with no relation of length `L` and nearly linear size exist (0.8):
  `exists_noRelation`.

The other targets of the roadmap (the structure of the cyclic hosts in 0.4, the selection of tops
in 0.7, the combinatorics of thick sets and Frobenius orbits in 0.8a and 0.8b, the admissible
pairs of 0.9, and the estimates 1.4–1.8 on the way to 1.9) are steps of the routes to these
headlines, not headlines, and are not stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.FrobeniusRestrictedRieszSums

open IsCyclotomicExtension.Rat

/-! ## Layer 0: Abelian CM hosts and their Frobenius data -/

/-- The Artin map `art_N : (ℤ/N)ˣ → Gal(E/ℚ)`, `a ↦ σ_a|_E`, of a subfield `E` of the cyclotomic
field `L = ℚ(ζ_N)`, where `σ_a(ζ_N) = ζ_N^a` (0.2). -/
noncomputable def artinMap (N : ℕ) [NeZero N] {L : Type*} [Field L] [NumberField L]
    [IsCyclotomicExtension {N} ℚ L] (E : IntermediateField ℚ L) : (ZMod N)ˣ →* Gal(E/ℚ) :=
  haveI := IsCyclotomicExtension.isAbelianGalois {N} ℚ L
  (AlgEquiv.restrictNormalHom E).comp (galEquivZMod N L).symm.toMonoidHom

/-- The Frobenius coset `Fr(p^i) = art_N{a : a ≡ p^i (mod N′)}` of a prime power `n = p^i`, where
`N = p^v N′` with `p ∤ N′` (0.2); for `n` not a prime power its value is not used. -/
noncomputable def frobCoset (N : ℕ) [NeZero N] {L : Type*} [Field L] [NumberField L]
    [IsCyclotomicExtension {N} ℚ L] (E : IntermediateField ℚ L) (n : ℕ) : Finset Gal(E/ℚ) :=
  haveI := Classical.decEq Gal(E/ℚ)
  (Finset.univ.filter fun a : (ZMod N)ˣ =>
    ZMod.castHom (Nat.ordCompl_dvd N n.minFac) (ZMod (ordCompl[n.minFac] N)) (a : ZMod N) = n).image
    (artinMap N E)

/-- The inertia group `I_p = art_N{a : a ≡ 1 (mod N′)}` at a prime `p`, where `N = p^v N′` with
`p ∤ N′` (0.2). -/
noncomputable def inertia (N : ℕ) [NeZero N] {L : Type*} [Field L] [NumberField L]
    [IsCyclotomicExtension {N} ℚ L] (E : IntermediateField ℚ L) (p : ℕ) : Finset Gal(E/ℚ) :=
  haveI := Classical.decEq Gal(E/ℚ)
  (Finset.univ.filter fun a : (ZMod N)ˣ =>
    ZMod.castHom (Nat.ordCompl_dvd N p) (ZMod (ordCompl[p] N)) (a : ZMod N) = 1).image
    (artinMap N E)

/-- The primitive Dirichlet character `χ*` inducing `χ ∘ art_N`, for a character `χ` of
`Gal(E/ℚ)` (0.2). -/
noncomputable def primitiveChar (N : ℕ) [NeZero N] {L : Type*} [Field L] [NumberField L]
    [IsCyclotomicExtension {N} ℚ L] {E : IntermediateField ℚ L} (χ : Gal(E/ℚ) →* ℂˣ) :
    DirichletCharacter ℂ
      (DirichletCharacter.conductor (MulChar.ofUnitHom (χ.comp (artinMap N E)))) :=
  DirichletCharacter.primitiveCharacter (MulChar.ofUnitHom (χ.comp (artinMap N E)))

/-- `(L′/L)(1, κ)` for a Dirichlet character `κ` of nonzero level; the value `0` at level `0` is
never used, conductors of characters of nonzero level being nonzero. -/
noncomputable def logDerivLAtOne {m : ℕ} (κ : DirichletCharacter ℂ m) : ℂ :=
  if h : m = 0 then 0 else
    haveI : NeZero m := ⟨h⟩
    logDeriv (DirichletCharacter.LFunction κ) 1

/-- The Riesz remainder of a primitive Dirichlet character `κ` (Conventions):
`G_κ(y) = Σ_{n ≤ y} Λ(n) κ(n) (y/n − 1) + y·(L′/L)(1, κ)` for `κ ≠ 1`, and
`G_1(y) = Σ_{n ≤ y} Λ(n) (y/n − 1) − y log y + (1 + γ) y` for the character modulo `1`. -/
noncomputable def rieszRemainder {m : ℕ} (κ : DirichletCharacter ℂ m) (y : ℝ) : ℂ :=
  if m = 1 then
    (∑ n ∈ Finset.Icc 1 ⌊y⌋₊, ((ArithmeticFunction.vonMangoldt n * (y / n - 1) : ℝ) : ℂ)) -
      ((y * Real.log y : ℝ) : ℂ) + (((1 + Real.eulerMascheroniConstant) * y : ℝ) : ℂ)
  else
    (∑ n ∈ Finset.Icc 1 ⌊y⌋₊,
      (ArithmeticFunction.vonMangoldt n : ℂ) * κ n * ((y / n - 1 : ℝ) : ℂ)) + y * logDerivLAtOne κ

/-- Sets of integers with no relation of length `L` (0.8): no pairwise distinct `s₁, s₂, s₃ ∈ T`
and integers `i ≠ j` with `0 < |i|, |j| ≤ L` and `j(s₂ − s₁) = i(s₃ − s₁)`. -/
def NoRelation (L : ℕ) (T : Set ℤ) : Prop :=
  ∀ s₁ ∈ T, ∀ s₂ ∈ T, ∀ s₃ ∈ T, s₁ ≠ s₂ → s₁ ≠ s₃ → s₂ ≠ s₃ → ∀ i j : ℤ, i ≠ j →
    0 < |i| → |i| ≤ L → 0 < |j| → |j| ≤ L → j * (s₂ - s₁) ≠ i * (s₃ - s₁)

/-- Sets without short relations (0.8): there is an absolute constant `C` such that for all
integers `M, L ≥ 2` there is a nonempty `T ⊂ ℤ ∩ [0, M/(4L))` with no relation of length `L` and
`|T| ≥ M·exp(−C·(log M · log L)^{1/2})/L`; when `M ≥ 4L`, moreover `|T| ≤ M/(4L)`. -/
theorem exists_noRelation : ∃ C : ℝ, ∀ M L : ℕ, 2 ≤ M → 2 ≤ L → ∃ T : Finset ℤ, T.Nonempty ∧
    (∀ s ∈ T, 0 ≤ s ∧ (s : ℝ) < M / (4 * L)) ∧ NoRelation L T ∧
    (M : ℝ) * Real.exp (-C * Real.sqrt (Real.log M * Real.log L)) / L ≤ T.card ∧
    (4 * L ≤ M → (T.card : ℝ) ≤ M / (4 * L)) := by
  sorry

/-- The modulus `N_n(ψ, {q, d}) = lcm(2^{n+2}, f)·q·d` of the cyclic host of a character of
conductor `f` (0.4). -/
def hostLevel (f n q d : ℕ) : ℕ := Nat.lcm (2 ^ (n + 2)) f * q * d

/-- For `p ∣ N`, the units modulo `N` whose residue modulo `p` is a square; for an odd prime `p`,
the kernel of `a ↦ (a/p)` (0.4). -/
def residueSquares {N p : ℕ} (hp : p ∣ N) : Subgroup (ZMod N)ˣ :=
  (powMonoidHom 2 : (ZMod p)ˣ →* (ZMod p)ˣ).range.comap (ZMod.unitsMap hp)

section CyclicHost

variable {f : ℕ} (ψ : DirichletCharacter ℂ f) (n q d : ℕ)

/-- The hypotheses of 0.4 on an auxiliary pair `(q, d)` for a character of conductor `f`: primes
`q ≠ d` with `q ≡ 3 (mod 4)`, `d ≡ 7 (mod 8)`, `q, d ∤ f`, `(−d/q) = 1` and `(−d/ℓ) = 1` for every
odd prime `ℓ ∣ f`. -/
def IsAuxiliaryPair (f q d : ℕ) : Prop :=
  q.Prime ∧ d.Prime ∧ q ≠ d ∧ q % 4 = 3 ∧ d % 8 = 7 ∧ ¬ q ∣ f ∧ ¬ d ∣ f ∧
    jacobiSym (-d) q = 1 ∧ ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → ℓ ∣ f → jacobiSym (-d) ℓ = 1

/-- The subgroup `H_n(ψ, {q, d})` of `(ℤ/N)ˣ`, `N = N_n(ψ, {q, d})`, of the `a` with
`a ≡ ±1 (mod 2^{n+2})`, `ψ(a) = 1`, `(a/q) = 1` and `(a/d) = 1` (0.4). -/
noncomputable def cyclicHostSubgroup : Subgroup (ZMod (hostLevel f n q d))ˣ :=
  (Subgroup.zpowers (-1 : (ZMod (2 ^ (n + 2)))ˣ)).comap
      (ZMod.unitsMap (((Nat.dvd_lcm_left _ _).mul_right q).mul_right d)) ⊓
    (ψ.toUnitHom.comp (ZMod.unitsMap (((Nat.dvd_lcm_right _ _).mul_right q).mul_right d))).ker ⊓
    residueSquares ((Dvd.intro_left _ rfl : q ∣ Nat.lcm (2 ^ (n + 2)) f * q).mul_right d) ⊓
    residueSquares (Dvd.intro_left _ rfl : d ∣ hostLevel f n q d)

variable [NeZero (hostLevel f n q d)] (L : Type*) [Field L] [NumberField L]
  [IsCyclotomicExtension {hostLevel f n q d} ℚ L]

/-- The cyclic host `E = E_n(ψ, {q, d}) = ℚ_n·ℚ(ψ)·ℚ(√−q)·ℚ(√−d)`, the fixed field of
`H_n(ψ, {q, d})` in `ℚ(ζ_N)` (0.4). -/
noncomputable def cyclicHost : IntermediateField ℚ L :=
  IntermediateField.fixedField
    ((cyclicHostSubgroup ψ n q d).map (galEquivZMod (hostLevel f n q d) L).symm.toMonoidHom)

/-- The places `Φ = Gal(E/K) = ker χ_{−d}` of the cyclic host, `K = ℚ(√−d)` (0.4 (ii)). -/
noncomputable def cyclicHostPlaces : Subgroup Gal(cyclicHost ψ n q d L/ℚ) :=
  (residueSquares (Dvd.intro_left _ rfl : d ∣ hostLevel f n q d)).map
    (artinMap (hostLevel f n q d) (cyclicHost ψ n q d L))

/-- The subgroup `A = Gal(E/ℚ(√−q, √−d)) = ker χ_{−q} ∩ ker χ_{−d}` (0.4). -/
noncomputable def cyclicHostA : Subgroup Gal(cyclicHost ψ n q d L/ℚ) :=
  (residueSquares ((Dvd.intro_left _ rfl : q ∣ Nat.lcm (2 ^ (n + 2)) f * q).mul_right d) ⊓
    residueSquares (Dvd.intro_left _ rfl : d ∣ hostLevel f n q d)).map
    (artinMap (hostLevel f n q d) (cyclicHost ψ n q d L))

/-- The subgroup `A₀ = ker(ψ|_A)` (0.4). -/
noncomputable def cyclicHostA₀ : Subgroup Gal(cyclicHost ψ n q d L/ℚ) :=
  (residueSquares ((Dvd.intro_left _ rfl : q ∣ Nat.lcm (2 ^ (n + 2)) f * q).mul_right d) ⊓
    residueSquares (Dvd.intro_left _ rfl : d ∣ hostLevel f n q d) ⊓
    (ψ.toUnitHom.comp (ZMod.unitsMap (((Nat.dvd_lcm_right _ _).mul_right q).mul_right d))).ker).map
    (artinMap (hostLevel f n q d) (cyclicHost ψ n q d L))

/-- The thick places `cσ_d u₀𝒯` of a translate `u₀` (0.6 (b)), with `σ_d` the nontrivial element
of the inertia group `I_d`. -/
def thickPlaces (𝒯 : Finset Gal(cyclicHost ψ n q d L/ℚ)) (u₀ : Gal(cyclicHost ψ n q d L/ℚ)) :
    Set Gal(cyclicHost ψ n q d L/ℚ) :=
  {g | ∃ σ ∈ inertia (hostLevel f n q d) (cyclicHost ψ n q d L) d, σ ≠ 1 ∧ ∃ s ∈ 𝒯,
    g = artinMap (hostLevel f n q d) (cyclicHost ψ n q d L) (-1) * σ * u₀ * s}

/-- The kept characters (0.5 (iii)): the characters of `Gal(E/ℚ)` trivial on `A₀`, on `I_q` and
on `I_d`; `χ ↦ χ*` maps them bijectively onto the cyclic family `𝒦(ψ)`. -/
def keptCharacters : Set (Gal(cyclicHost ψ n q d L/ℚ) →* ℂˣ) :=
  {χ | cyclicHostA₀ ψ n q d L ≤ χ.ker ∧
    (∀ σ ∈ inertia (hostLevel f n q d) (cyclicHost ψ n q d L) q, χ σ = 1) ∧
    ∀ σ ∈ inertia (hostLevel f n q d) (cyclicHost ψ n q d L) d, χ σ = 1}

end CyclicHost

/-! ## Layer 1: Frobenius-restricted Riesz sums -/

/-- The Frobenius-restricted Riesz sum (1.1)
`ℛ(a, τ, w) = Σ_{n≥1} Λ(n)·mean_{g∈Fr(n)} 2·𝟙[g ∉ Φ]·(a/n − w(cgτ))₊`, with `c = art_N(−1)`;
only the values of `w` on `Φ` enter when `c ∉ Φ`. -/
noncomputable def frobRieszSum (N : ℕ) [NeZero N] {L : Type*} [Field L] [NumberField L]
    [IsCyclotomicExtension {N} ℚ L] (E : IntermediateField ℚ L)
    (Φ : Subgroup Gal(E/ℚ)) (a : ℝ) (τ : Gal(E/ℚ)) (w : Gal(E/ℚ) → ℝ) : ℝ :=
  haveI := Classical.decPred (· ∈ Φ)
  ∑' n : ℕ, ArithmeticFunction.vonMangoldt n * ((frobCoset N E n).card : ℝ)⁻¹ *
    ∑ g ∈ frobCoset N E n, if g ∈ Φ then 0 else 2 * max (a / n - w (artinMap N E (-1) * g * τ)) 0

/-- The main term (1.1)
`𝔐(a, w) = a·(log a − 1 − γ + (L′/L)(1, χ_K) − |Φ|^{−1} Σ_{τ′∈Φ} log w(τ′))`, for the character
`χ_K` of `Gal(E/ℚ)` with kernel `Φ`. -/
noncomputable def frobRieszMain (N : ℕ) [NeZero N] {L : Type*} [Field L] [NumberField L]
    [IsCyclotomicExtension {N} ℚ L] {E : IntermediateField ℚ L}
    (Φ : Subgroup Gal(E/ℚ)) (χK : Gal(E/ℚ) →* ℂˣ) (a : ℝ) (w : Gal(E/ℚ) → ℝ) : ℂ :=
  haveI := Classical.decPred (· ∈ Φ)
  a * ((Real.log a - 1 - Real.eulerMascheroniConstant : ℝ) +
    logDerivLAtOne (primitiveChar N χK) -
    ((Nat.card Φ : ℝ)⁻¹ * ∑ τ' : Φ, Real.log (w τ') : ℝ))

/-- The character average (1.2)
`ℭ(a, τ, w) = |Φ|^{−1} Σ_{g ∈ G∖Φ} Σ_{χ} conj χ(g)·w(cgτ)·G_{χ*}(a/w(cgτ))`. -/
noncomputable def frobRieszCharAverage (N : ℕ) [NeZero N] {L : Type*} [Field L] [NumberField L]
    [IsCyclotomicExtension {N} ℚ L] {E : IntermediateField ℚ L} (Φ : Subgroup Gal(E/ℚ)) (a : ℝ)
    (τ : Gal(E/ℚ)) (w : Gal(E/ℚ) → ℝ) : ℂ :=
  haveI := Classical.decPred (· ∈ Φ)
  (Nat.card Φ : ℂ)⁻¹ * ∑ g ∈ Finset.univ.filter (· ∉ Φ), ∑ᶠ χ : Gal(E/ℚ) →* ℂˣ,
    starRingEnd ℂ (χ g) * w (artinMap N E (-1) * g * τ) *
      rieszRemainder (primitiveChar N χ) (a / w (artinMap N E (-1) * g * τ))

/-- The difference of the Frobenius-restricted Riesz sum and its main term is the character
average (1.2): for every abelian CM host `E ⊃ K` (`K` imaginary quadratic, `Φ = Gal(E/K)`), every
`a > 0`, `τ ∈ Φ` and `w : Φ → (0, ∞)`, `ℛ(a, τ, w) − 𝔐(a, w) = ℭ(a, τ, w)`. -/
theorem frobRieszSum_sub_main (N : ℕ) [NeZero N] {L : Type*} [Field L] [NumberField L]
    [IsCyclotomicExtension {N} ℚ L] (E : IntermediateField ℚ L)
    (K : IntermediateField ℚ E) (hK : Module.finrank ℚ K = 2) [NumberField.IsTotallyComplex K]
    (χK : Gal(E/ℚ) →* ℂˣ) (hχK : χK.ker = K.fixingSubgroup) {a : ℝ} (ha : 0 < a)
    {τ : Gal(E/ℚ)} (hτ : τ ∈ K.fixingSubgroup) {w : Gal(E/ℚ) → ℝ}
    (hw : ∀ τ' ∈ K.fixingSubgroup, 0 < w τ') :
    (frobRieszSum N E K.fixingSubgroup a τ w : ℂ) - frobRieszMain N K.fixingSubgroup χK a w =
      frobRieszCharAverage N K.fixingSubgroup a τ w := by
  sorry

section CyclicHost

variable {f : ℕ} {ψ : DirichletCharacter ℂ f} {n q d : ℕ} [NeZero (hostLevel f n q d)]
  {L : Type*} [Field L] [NumberField L] [IsCyclotomicExtension {hostLevel f n q d} ℚ L]

variable (ψ n q d L) in
/-- Cyclic host data at the scale `x` (1.7): a nonempty set of tops `Φ_top ⊂ A` with a symmetric
coset law `ν` (a probability on the cosets of `A₀` in `A`) and precision `η_top` (0.7); a thick
set `𝒯 ⊂ A₀`; reals `b, b′, X′, ϑ, s_th > 0` with `b′X′ ≤ xb`; an integer `m ≥ 1`; top weights
`a_τ > 0` with `|a_τ/b − x| ≤ 1`; for every translate `u₀ ∈ A₀` and `1 ≤ j ≤ m` a weight
`w_{u₀,j}`, positive on `Φ`, in `[b, b + ϑ + 1]` at the thick places of `u₀` and at most `2b′` at
the other places; and the prime number theorem with saving `s_th` beyond `X′/3`. -/
structure ScaleData (x : ℝ) where
  /-- The tops `Φ_top`. -/
  tops : Finset Gal(cyclicHost ψ n q d L/ℚ)
  /-- The coset law `ν`, read on the cosets of `A₀`. -/
  ν : Gal(cyclicHost ψ n q d L/ℚ) ⧸ cyclicHostA₀ ψ n q d L → ℝ
  /-- The precision `η_top`. -/
  ηtop : ℝ
  /-- The thick set `𝒯`. -/
  thick : Finset Gal(cyclicHost ψ n q d L/ℚ)
  /-- The scale `b` of the thick weights. -/
  b : ℝ
  /-- The bound `b′` of the thin weights. -/
  b' : ℝ
  /-- The thin scale `X′`. -/
  X' : ℝ
  /-- The width `ϑ` of the thick weights. -/
  ϑ : ℝ
  /-- The thin-scale saving `s_th`. -/
  sth : ℝ
  /-- The number `m` of steps. -/
  m : ℕ
  /-- The top weights `a_τ`. -/
  aTop : Gal(cyclicHost ψ n q d L/ℚ) → ℝ
  /-- The weights `w_{u₀,j}`. -/
  w : Gal(cyclicHost ψ n q d L/ℚ) → ℕ → Gal(cyclicHost ψ n q d L/ℚ) → ℝ
  three_le_x : 3 ≤ x
  tops_nonempty : tops.Nonempty
  tops_subset : ∀ τ ∈ tops, τ ∈ cyclicHostA ψ n q d L
  ν_nonneg : ∀ ξ, 0 ≤ ν ξ
  ν_sum : haveI := Classical.decEq (Gal(cyclicHost ψ n q d L/ℚ) ⧸ cyclicHostA₀ ψ n q d L)
    haveI := Classical.decPred (· ∈ cyclicHostA ψ n q d L)
    ∑ ξ ∈ (Finset.univ.filter (· ∈ cyclicHostA ψ n q d L)).image (QuotientGroup.mk ·), ν ξ = 1
  ν_symm : ∀ α ∈ cyclicHostA ψ n q d L, ν (QuotientGroup.mk α⁻¹) = ν (QuotientGroup.mk α)
  ηtop_nonneg : 0 ≤ ηtop
  hasCosetLaw : ∀ α ∈ cyclicHostA ψ n q d L,
    haveI := Classical.decEq (Gal(cyclicHost ψ n q d L/ℚ) ⧸ cyclicHostA₀ ψ n q d L)
    |((tops.filter fun τ => (QuotientGroup.mk τ : _ ⧸ cyclicHostA₀ ψ n q d L) =
      QuotientGroup.mk α).card : ℝ) - ν (QuotientGroup.mk α) * tops.card| ≤ ηtop * tops.card
  thick_subset : ∀ s ∈ thick, s ∈ cyclicHostA₀ ψ n q d L
  pos : 0 < b ∧ 0 < b' ∧ 0 < X' ∧ 0 < ϑ ∧ 0 < sth
  b'X'_le : b' * X' ≤ x * b
  one_le_m : 1 ≤ m
  aTop_spec : ∀ τ ∈ tops, 0 < aTop τ ∧ |aTop τ / b - x| ≤ 1
  w_pos : ∀ u₀ ∈ cyclicHostA₀ ψ n q d L, ∀ j ∈ Finset.Icc 1 m,
    ∀ τ' ∈ cyclicHostPlaces ψ n q d L, 0 < w u₀ j τ'
  w_thick : ∀ u₀ ∈ cyclicHostA₀ ψ n q d L, ∀ j ∈ Finset.Icc 1 m,
    ∀ τ' ∈ thickPlaces ψ n q d L thick u₀, b ≤ w u₀ j τ' ∧ w u₀ j τ' ≤ b + ϑ + 1
  w_thin : ∀ u₀ ∈ cyclicHostA₀ ψ n q d L, ∀ j ∈ Finset.Icc 1 m,
    ∀ τ' ∈ cyclicHostPlaces ψ n q d L, τ' ∉ thickPlaces ψ n q d L thick u₀ → w u₀ j τ' ≤ 2 * b'
  saving : ∀ χ : Gal(cyclicHost ψ n q d L/ℚ) →* ℂˣ, ∀ y ≥ X' / 3,
    ‖rieszRemainder (primitiveChar (hostLevel f n q d) χ) y‖ ≤ sth * y

variable {x : ℝ}

/-- The averaged sum of the `m` differences (1.7)
`𝔄 = mean_{u₀∈A₀} Σ_{τ∈Φ_top} Σ_{j=1}^m (ℛ − 𝔐)(a_τ, τ, w_{u₀,j})`, with `χ_K = χ_{−d}` the
character with kernel `Φ`. -/
noncomputable def ScaleData.averagedSum (D : ScaleData ψ n q d L x)
    (χK : Gal(cyclicHost ψ n q d L/ℚ) →* ℂˣ) : ℝ :=
  haveI := Classical.decPred (· ∈ cyclicHostA₀ ψ n q d L)
  (Nat.card (cyclicHostA₀ ψ n q d L) : ℝ)⁻¹ *
    ∑ u₀ ∈ Finset.univ.filter (· ∈ cyclicHostA₀ ψ n q d L), ∑ τ ∈ D.tops,
    ∑ j ∈ Finset.Icc 1 D.m,
      ((frobRieszSum (hostLevel f n q d) _ (cyclicHostPlaces ψ n q d L) (D.aTop τ) τ
          (D.w u₀ j) : ℂ) -
        frobRieszMain (hostLevel f n q d) (cyclicHostPlaces ψ n q d L) χK (D.aTop τ)
          (D.w u₀ j)).re

/-- The coefficient `ν̂(χ) = Σ_{αA₀ ∈ A/A₀} ν(αA₀)·χ(α)` of a character trivial on `A₀` (1.6). -/
noncomputable def ScaleData.cosetLawCoeff (D : ScaleData ψ n q d L x)
    (χ : Gal(cyclicHost ψ n q d L/ℚ) →* ℂˣ) : ℂ :=
  haveI := Classical.decPred (· ∈ cyclicHostA ψ n q d L)
  (Nat.card (cyclicHostA₀ ψ n q d L) : ℂ)⁻¹ *
    ∑ α ∈ Finset.univ.filter (· ∈ cyclicHostA ψ n q d L), (D.ν (QuotientGroup.mk α) : ℂ) * χ α

/-- The weighted family sum `𝔜_ν(x) = Σ_{κ∈𝒦(ψ)} ν̂(κ)·Re G_κ(x)` (1.7), written over the kept
characters `χ_κ` (0.5 (iii)); `ν̂` is real for a symmetric coset law. -/
noncomputable def ScaleData.familySum (D : ScaleData ψ n q d L x) : ℝ :=
  ∑ᶠ (χ) (_ : χ ∈ keptCharacters ψ n q d L), (D.cosetLawCoeff χ).re *
    (rieszRemainder (primitiveChar (hostLevel f n q d) χ) x).re

/-- The hypotheses of 1.9 other than (i), for parameters `k, a, B₀, N_c`, `ε` and `C′`: the
precision `η_top ≤ x^{−1/2}`; 1.8 (i)–(v) with `A` the subgroup `A` of the host; the cost condition
`2f·(3(x + 1)(ϑ + 1) + (x + 1)b·s_th) ≤ b`, `f = |Φ|`; and (ii): `|G_{χ*}(x)| ≤ x^{1/2+ε}` and
`|(L′/L)(1, χ*)| ≤ C′ log x` for every non-kept character `χ` trivial on `A₀`. -/
def ScaleData.BoundHyp (D : ScaleData ψ n q d L x) (ε C' : ℝ) (k : ℕ) (a B₀ Nc : ℝ) : Prop :=
  D.ηtop ≤ x ^ (-(1 / 2 : ℝ)) ∧ 0 < a ∧ 0 < B₀ ∧ 0 < Nc ∧ 1 ≤ k ∧
    x ^ (1 / 2 - ε) ≤ D.m ∧ (D.m : ℝ) ≤ x ^ (1 / 2 + ε) ∧
    x * D.m ≤ k ∧ (k : ℝ) ≤ (Nat.card (cyclicHostA ψ n q d L) : ℝ) ^ 2 * x ^ (1 / 2 + ε) ∧
    x ^ (-ε) * Nat.card (cyclicHostA ψ n q d L) ≤ D.tops.card ∧
    x ^ (-ε) * Nat.card (cyclicHostA ψ n q d L) ≤ D.thick.card ∧
    a ≤ 2 * x * D.b ∧ B₀ ≤ 2 * Nat.card (cyclicHostA ψ n q d L) * D.m * D.b * x ^ ε ∧
    Nc ≤ D.thick.card * k * D.b * x ^ (2 * ε) / (Nat.card (cyclicHostA ψ n q d L) : ℝ) ^ 2 ∧
    2 * Nat.card (cyclicHostPlaces ψ n q d L) *
      (3 * (x + 1) * (D.ϑ + 1) + (x + 1) * D.b * D.sth) ≤ D.b ∧
    ∀ χ : Gal(cyclicHost ψ n q d L/ℚ) →* ℂˣ, cyclicHostA₀ ψ n q d L ≤ χ.ker →
      χ ∉ keptCharacters ψ n q d L →
      ‖rieszRemainder (primitiveChar (hostLevel f n q d) χ) x‖ ≤ x ^ (1 / 2 + ε) ∧
        ‖logDerivLAtOne (primitiveChar (hostLevel f n q d) χ)‖ ≤ C' * Real.log x

/-- The averaged Frobenius-restricted inequality (1.9 (i)) with exponent constant `C`:
`𝔄 ≤ x^{Cε}·(|Φ_top|·a·(1 + m²/k) + m·(B₀ + N_c))`. -/
def ScaleData.FrobeniusInequality (D : ScaleData ψ n q d L x)
    (χK : Gal(cyclicHost ψ n q d L/ℚ) →* ℂˣ) (C ε : ℝ) (k : ℕ) (a B₀ Nc : ℝ) : Prop :=
  D.averagedSum χK ≤
    x ^ (C * ε) * (D.tops.card * a * (1 + (D.m : ℝ) ^ 2 / k) + D.m * (B₀ + Nc))

end CyclicHost

/-- The averaged inequality and the window bound are equivalent (1.9, 1.10). Let `ψ` be a
primitive Dirichlet character of order `o`, `C′ ≥ 0` and `ε ∈ (0, 1]`. There is `x₁ ≥ 3` such
that for every `x ≥ x₁`, every cyclic host of `ψ` (0.4) and all cyclic host data at `x` (1.7)
satisfying the hypotheses of 1.9 other than (i): if the averaged inequality (i) holds with some
`C ≥ 0`, then `𝔜_ν(x) ≤ x^{1/2+(C+6)ε}` (1.9); and always
`𝔄 ≤ m b (δ_th/2)|Φ_top|·max(0, 𝔜_ν(x)) + (3o + 3)·m b|Φ_top|·x^{1/2+ε}` (1.10). -/
theorem frobeniusInequality_iff_cyclicBound {f : ℕ} (ψ : DirichletCharacter ℂ f)
    (hψ : ψ.IsPrimitive) {C' ε : ℝ} (hC' : 0 ≤ C') (hε₀ : 0 < ε) (hε₁ : ε ≤ 1) :
    ∃ x₁ : ℝ, 3 ≤ x₁ ∧ ∀ x ≥ x₁, ∀ (n q d : ℕ) [NeZero (hostLevel f n q d)] (L : Type)
      [Field L] [NumberField L] [IsCyclotomicExtension {hostLevel f n q d} ℚ L],
      IsAuxiliaryPair f q d → ∀ χK : Gal(cyclicHost ψ n q d L/ℚ) →* ℂˣ,
      χK.ker = cyclicHostPlaces ψ n q d L → ∀ (D : ScaleData ψ n q d L x) (k : ℕ) (a B₀ Nc : ℝ),
      D.BoundHyp ε C' k a B₀ Nc →
      (∀ C : ℝ, 0 ≤ C → D.FrobeniusInequality χK C ε k a B₀ Nc →
        D.familySum ≤ x ^ (1 / 2 + (C + 6) * ε)) ∧
      D.averagedSum χK ≤ D.m * D.b * ((D.thick.card / Nat.card (cyclicHostA ψ n q d L) : ℝ) / 2) *
          D.tops.card * max 0 D.familySum +
        (3 * orderOf ψ + 3) * D.m * D.b * D.tops.card * x ^ (1 / 2 + ε) := by
  sorry

/-- The averaged inequality from the window bound (1.10, consequence): under the hypotheses of
1.9 other than (i), if moreover `a ≥ xb/2` and `𝔜_ν(x) ≤ x^{1/2+C″ε}` with `C″ ≥ 1`, then (i) of
1.9 holds with `C = C″ + 2`, for `x ≥ x₁′(ψ, C′, C″, ε)`. -/
theorem frobeniusInequality_of_cyclicBound {f : ℕ} (ψ : DirichletCharacter ℂ f)
    (hψ : ψ.IsPrimitive) {C' C'' ε : ℝ} (hC' : 0 ≤ C') (hC'' : 1 ≤ C'') (hε₀ : 0 < ε)
    (hε₁ : ε ≤ 1) :
    ∃ x₁' : ℝ, ∀ x ≥ x₁', ∀ (n q d : ℕ) [NeZero (hostLevel f n q d)] (L : Type)
      [Field L] [NumberField L] [IsCyclotomicExtension {hostLevel f n q d} ℚ L],
      IsAuxiliaryPair f q d → ∀ χK : Gal(cyclicHost ψ n q d L/ℚ) →* ℂˣ,
      χK.ker = cyclicHostPlaces ψ n q d L → ∀ (D : ScaleData ψ n q d L x) (k : ℕ) (a B₀ Nc : ℝ),
      D.BoundHyp ε C' k a B₀ Nc → x * D.b / 2 ≤ a → D.familySum ≤ x ^ (1 / 2 + C'' * ε) →
      D.FrobeniusInequality χK (C'' + 2) ε k a B₀ Nc := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.FrobeniusRestrictedRieszSums
