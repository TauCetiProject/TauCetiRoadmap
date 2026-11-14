module

import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.Torsion.Structure
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.WeilPairing.Basic

/-!
# Modularity of elliptic curves over totally real fields: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states, against the
pinned Mathlib and Tau Ceti, the roadmap's headline theorems whose objects exist at the pins, each
with `sorry`. It is the roadmap's acceptance test, not a catalogue of its targets; the API, Checks
and worked examples of every section stay in the README.

Stated here:

* `realCyclotomic_isCMField` (README §1.1): over a totally real number field `k`, the cyclotomic
  field `k(μ_n)`, `n > 2`, is a CM field whose maximal real subfield is `k(ζ + ζ⁻¹)`.
* `three_five_switch` (README §2.3): for every elliptic curve over a number field there are
  infinitely many j-invariants of elliptic curves with the same symplectic Galois module of
  five-torsion and mod-three image containing `SL₂(𝔽₃)`.

Not statable at the pins, with the missing carrier:

* The totally real modularity theorem (README §4.4), the all-place comparison for a modular
  elliptic curve (§4.2), the non-CM case by descent (§4.1) and the CM case by quadratic automorphic
  induction (§4.3): neither library has cuspidal automorphic representations of `GL₂(𝔸_K)` over a
  number field `K`, their attached `ℓ`-adic Galois representations (the Hilbert attachment), the
  local Langlands correspondence for `GL₂` with its Weil–Deligne parameters and conductors, or
  quadratic automorphic induction of algebraic Hecke characters.
* Change of coefficient prime (§2.1), weight-two lifting for summands of abelian varieties (§2.2)
  and the mod-three and mod-five seeds (§§2.4–2.5): modularity and residual modularity of a Galois
  representation of a totally real field are defined through the same missing Hilbert attachment;
  the compatible-system carrier is also absent.
* Reflection descent, the descended character systems, their integral lattices, congruence chain
  and elliptic endpoints (§§1.2–1.6): the cyclic covers of the family of quadratic twists, their
  twists, the étale cohomology `H¹` of a curve of higher genus with `ℤ_ℓ` and `ℚ̄_ℓ` coefficients,
  and the Jacobians carrying the rotation idempotents are absent.
* The specialization and the three lifts over the real cyclotomic field (§§3.1–3.3): they need both
  the covers and the Hilbert attachment.
-/

namespace TauCetiRoadmap.EllipticCurveModularityTotallyReal

open NumberField
open scoped WeierstrassCurve

/-! ## Layer 1: Reflection descent over the real cyclotomic subfield -/

/-- **The real cyclotomic subfield over a totally real base** (README §1.1). Let `k` be a totally
real number field, `n > 2`, `M` a cyclotomic extension `k(μ_n)` and `ζ ∈ M` a primitive `n`-th
root of unity. Then `M` is a CM field, and its maximal real subfield is `L = k(ζ + ζ⁻¹)`; in
particular `[M : L] = 2` and the character of `M/L` is `−1` at every complex conjugation.
(Le Hung, *A geometric prime switch for elliptic curves over totally real and CM fields*, §3.2,
p. 6, uses the case `n = 3p`; over `k = ℚ` the first half is
`IsCyclotomicExtension.Rat.isCMField`.) -/
theorem realCyclotomic_isCMField {k M : Type*} [Field k] [NumberField k] [IsTotallyReal k]
    [Field M] [NumberField M] [Algebra k M] {n : ℕ} (hn : 2 < n)
    [IsCyclotomicExtension {n} k M] {ζ : M} (hζ : IsPrimitiveRoot ζ n) :
    IsCMField M ∧
      (IntermediateField.adjoin k {ζ + ζ⁻¹}).toSubfield = maximalRealSubfield M := by
  sorry

/-! ## Layer 2: Totally real lifting and the elliptic seed -/

/-- **The 3–5 switch over a number field** (README §2.3). Let `W` be an elliptic curve over a
number field `K` and `K̄ = AlgebraicClosure K`. The set of `j ∈ K` that are the j-invariant of an
elliptic curve `W'` over `K` with

* an additive isomorphism `α : W[5](K̄) ≃ W'[5](K̄)` commuting with the action of every
  `σ ∈ Gal(K̄/K)` and preserving the Weil pairing, `e₅(α P, α Q) = e₅(P, Q)`, and
* mod-three image containing `SL₂(𝔽₃)`: in every `ZMod 3`-basis of `W'[3](K̄)`, every matrix of
  determinant one is the matrix of some `σ ∈ Gal(K̄/K)`,

is infinite. (Freitas–Le Hung–Siksek, *Elliptic curves over real quadratic fields are modular*,
Lemma 6.1 and its proof, p. 10; the source states existence, and infinitude follows from Hilbert
irreducibility on the fixed-pairing twist of `X(5)`, a projective line, and finiteness of the
j-map.) -/
theorem three_five_switch {K : Type*} [Field K] [NumberField K]
    [DecidableEq (AlgebraicClosure K)] (W : WeierstrassCurve K) [W.IsElliptic] :
    {j : K | ∃ (W' : WeierstrassCurve K) (_ : W'.IsElliptic), W'.j = j ∧
      (∃ α : AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point ((5 : ℕ) : ℤ) ≃+
          AddSubgroup.torsionBy (W'⁄(AlgebraicClosure K)).toAffine.Point ((5 : ℕ) : ℤ),
        (∀ (σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K) P,
          α (Multiplicative.toAdd (W.torsionGaloisAction ((5 : ℕ) : ℤ) σ) P) =
            Multiplicative.toAdd (W'.torsionGaloisAction ((5 : ℕ) : ℤ) σ) (α P)) ∧
        ∀ P Q, TauCeti.Isogeny.weilPairing (W'⁄(AlgebraicClosure K)) 5 (by norm_num) (α P) (α Q) =
          TauCeti.Isogeny.weilPairing (W⁄(AlgebraicClosure K)) 5 (by norm_num) P Q) ∧
      ∀ b : Module.Basis (Fin 2) (ZMod 3)
          (AddSubgroup.torsionBy (W'⁄(AlgebraicClosure K)).toAffine.Point ((3 : ℕ) : ℤ)),
        ∀ g : Matrix.SpecialLinearGroup (Fin 2) (ZMod 3),
          ∃ σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K, ∀ P,
            b.equivFun (Multiplicative.toAdd (W'.torsionGaloisAction ((3 : ℕ) : ℤ) σ) P) =
              (g : Matrix (Fin 2) (Fin 2) (ZMod 3)).mulVec (b.equivFun P)}.Infinite := by
  sorry

end TauCetiRoadmap.EllipticCurveModularityTotallyReal
