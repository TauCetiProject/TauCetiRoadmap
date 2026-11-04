module

public import Mathlib
public import TauCeti.Algebra.Lie.AdjointAction.Frobenius
public import TauCeti.RingTheory.Derivation.Localization

/-!
# p-curvature, Cartier descent and rank-one algebraic solutions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need, all with real bodies on
native carriers. The API around each target, the special cases and the Checks stay in the README.

Headline theorems stated here (README target, Lean name):

* 0.1, `add_pow_eq_jacobson` (Jacobson's formula, on `jacobsonLie`).
* 0.2, the class `RestrictedLieAlgebra`.
* 0.3, `iterate_leibniz`, `pPow_smul` (Hochschild's formula), `ad_pPow`, `pPow_add`, and the
  restricted structure on `Derivation R A A` (an instance on `pPow`).
* 1.4, `rankOne_pCurvature_eq`: Jacobson's formula in rank one, as an identity of
  `R`-linear endomorphisms of `A`, which needs no connection carrier.
* 2.0, `apply_eq_zero_of_mem_frobeniusImage` and `kaehlerD_eq_zero_iff` (on `frobeniusImage`).
* 2.3, `exists_unit_horizontal_iff` (rank one in one variable, on a bare local ring).
* 4.1, `exists_intCast_eq_of_forall_pow_sub_mem` (Kronecker's theorem).
* 4.3, `honda` (on `RatFunc`, with `ratFuncD`, `ratFuncPCurvature`, `ratFuncOfInt` and
  `ratFuncMod`).

Not statable at the pins, with the carrier each lacks:

* 1.1–1.3 and 1.5 (the `p`-curvature of a connection, Katz's structure theorem, functoriality,
  nilpotence) and 2.1–2.2 (Cartier descent and its consequences): they lack the ordinary
  connection carrier of CrystallineCohomology CR.1.3 and the evaluation on derivations of
  FormalConnectionsOpers §2.1, neither of which is declared at the pins.
* 3.1–3.2 (the easy direction) and 4.4 (the Kummer trivialisation): they lack, in addition,
  schemes of finite presentation over a finitely generated `ℤ`-domain with their reductions at
  closed points, and the connection carrier on them.
-/

@[expose] public section

namespace TauCetiRoadmap.PCurvature

open Polynomial

/-! ## Layer 0: restricted Lie algebras and the `p`-th power of a derivation -/

section Jacobson

variable (R : Type*) [CommRing R] (p : ℕ)

/-- **Layer 0.1.** Jacobson's Lie polynomial `Λ_p(x, y) = Σ_{0<i<p} s_i(x, y)` in the free Lie
algebra on `x = of 0` and `y = of 1`, where `i • s_i(x, y)` is the coefficient of `t ^ (i - 1)` in
`ad(t x + y) ^ (p - 1) (x)`: the sum runs over the words `z` of length `p - 1`, and the word with
`i - 1` letters `x` carries the natural-number representative of `i⁻¹` modulo `p` (it is `0` for
`i = p`, where `ad(x) ^ (p - 1) (x)` vanishes anyway). -/
noncomputable def jacobsonLie : FreeLieAlgebra R (Fin 2) :=
  ∑ z : Fin (p - 1) → Fin 2,
    (((((Finset.univ.filter fun j => z j = 0).card + 1 : ℕ) : ZMod p)⁻¹).val) •
      (List.ofFn z).foldr (fun i v => ⁅FreeLieAlgebra.of R i, v⁆) (FreeLieAlgebra.of R 0)

section Associative

attribute [local instance 100] LieRing.ofAssociativeRing

/-- **Layer 0.1. Jacobson's formula** (Jacobson 1937; Katz 1970, (5.2.4)–(5.2.5)): in an
associative algebra of characteristic `p`, `(a + b) ^ p = a ^ p + b ^ p + Λ_p(a, b)`. -/
theorem add_pow_eq_jacobson [Fact p.Prime] {A : Type*} [Ring A] [Algebra R A] [CharP A p]
    (a b : A) :
    (a + b) ^ p = a ^ p + b ^ p + FreeLieAlgebra.lift R ![a, b] (jacobsonLie R p) := by
  sorry

end Associative

end Jacobson

/-- **Layer 0.2.** A restricted Lie algebra in Jacobson's sense: a `p`-map that is `p`-homogeneous,
is compatible with the adjoint action, and satisfies Jacobson's formula. -/
class RestrictedLieAlgebra (R L : Type*) [CommRing R] [LieRing L] [LieAlgebra R L] (p : ℕ) where
  /-- The `p`-map `x ↦ x^[p]`. -/
  pMap : L → L
  pMap_smul (c : R) (x : L) : pMap (c • x) = c ^ p • pMap x
  ad_pMap (x : L) : LieAlgebra.ad R L (pMap x) = LieAlgebra.ad R L x ^ p
  pMap_add (x y : L) :
    pMap (x + y) = pMap x + pMap y + FreeLieAlgebra.lift R ![x, y] (jacobsonLie R p)

section Derivations

variable {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]
  (p : ℕ) [Fact p.Prime] [CharP A p]

/-- **Layer 0.3** (Katz 1970, (5.0)). In characteristic `p` the `p`-th iterate of a derivation
satisfies the Leibniz rule. -/
theorem iterate_leibniz (D : Derivation R A A) (a b : A) :
    D^[p] (a * b) = a * D^[p] b + b * D^[p] a := by
  sorry

/-- **Layer 0.3.** The `p`-th power `D^[p]` of a derivation, as a derivation. -/
noncomputable def pPow (D : Derivation R A A) : Derivation R A A :=
  Derivation.mk' ((D : Module.End R A) ^ p) fun a b => by
    simp only [Module.End.pow_apply, Derivation.coeFn_coe, smul_eq_mul]
    exact iterate_leibniz p D a b

/-- **Layer 0.3** (Hochschild's formula; Katz 1970, Proposition 5.3, Deligne). For `a : A`,
`(a D) ^ p = a ^ p D ^ p + (a D)^{p-1}(a) D`. -/
theorem pPow_smul (a : A) (D : Derivation R A A) :
    pPow p (a • D) = a ^ p • pPow p D + ((⇑(a • D))^[p - 1] a) • D := by
  sorry

/-- **Layer 0.3.** `ad (D ^ p) = (ad D) ^ p` on derivations. -/
theorem ad_pPow (D : Derivation R A A) :
    LieAlgebra.ad R (Derivation R A A) (pPow p D) = LieAlgebra.ad R (Derivation R A A) D ^ p := by
  sorry

/-- **Layer 0.3.** Jacobson's formula for the `p`-th power of a sum of derivations. -/
theorem pPow_add (D E : Derivation R A A) :
    pPow p (D + E) =
      pPow p D + pPow p E + FreeLieAlgebra.lift R ![D, E] (jacobsonLie R p) := by
  sorry

/-- **Layer 0.3.** Derivations of a commutative algebra of characteristic `p` form a restricted
Lie algebra (Katz 1970, (5.0)); the homogeneity `(c • D) ^ p = c ^ p • D ^ p` for `c : R` is the
obligation `pMap_smul` of the instance. -/
noncomputable instance : RestrictedLieAlgebra R (Derivation R A A) p where
  pMap := pPow p
  pMap_smul c D := by ext a; simp [pPow, _root_.smul_pow]
  ad_pMap := ad_pPow p
  pMap_add := pPow_add p

/-! ## Layer 1: the `p`-curvature -/

/-- **Layer 1.4** (Jacobson's formula in rank one; Katz 1970, (5.0.4)). For a form
`ω : Der_R(A) →ₗ[A] A`, the `p`-curvature of `D + ω(D)` on `A`, computed in `Module.End R A`, is
multiplication by `ω(D) ^ p + D^{p-1}(ω(D)) - ω(D^p)`. -/
theorem rankOne_pCurvature_eq (ω : Derivation R A A →ₗ[A] A) (D : Derivation R A A) :
    ((D : Module.End R A) + LinearMap.mulLeft R (ω D)) ^ p -
        ((pPow p D : Module.End R A) + LinearMap.mulLeft R (ω (pPow p D))) =
      LinearMap.mulLeft R (ω D ^ p + D^[p - 1] (ω D) - ω (pPow p D)) := by
  sorry

end Derivations

/-! ## Layer 2: Cartier descent -/

section Cartier

variable (R A : Type*) [CommRing R] [CommRing A] [Algebra R A] (p : ℕ)

/-- **Layer 2.0.** The image of the relative Frobenius `A ⊗_{R, Frob} R → A`, `a ⊗ r ↦ r a ^ p`:
the `R`-subalgebra generated by the `p`-th powers. -/
def frobeniusImage : Subalgebra R A :=
  Algebra.adjoin R (Set.range fun a : A => a ^ p)

variable {R A} [Fact p.Prime] [CharP A p]

/-- **Layer 2.0.** Every derivation vanishes on `frobeniusImage R A p`. -/
theorem apply_eq_zero_of_mem_frobeniusImage (D : Derivation R A A) {a : A}
    (ha : a ∈ frobeniusImage R A p) : D a = 0 := by
  sorry

/-- **Layer 2.0.** For `A` smooth over a ring `R` of characteristic `p`, the kernel of
`d : A → Ω¹_{A/R}` is `frobeniusImage R A p` (degree `0` of the Cartier isomorphism of
DerivedDeRhamCohomology §3.6). -/
theorem kaehlerD_eq_zero_iff [CharP R p] [Algebra.Smooth R A] (a : A) :
    KaehlerDifferential.D R A a = 0 ↔ a ∈ frobeniusImage R A p := by
  sorry

/-- **Layer 2.3** (Cartier in rank one and one variable). Over a local ring of characteristic
`p`, with a derivation `D` such that `D ^ p = 0` and an `x` with `D x = 1`, the connection
`D + a` has a horizontal unit if and only if its `p`-curvature `a ^ p + D^{p-1}(a)` vanishes. -/
theorem exists_unit_horizontal_iff [IsLocalRing A] (D : Derivation R A A)
    (hD : ∀ y, D^[p] y = 0) (x : A) (hx : D x = 1) (a : A) :
    (∃ y : Aˣ, D y + a * y = 0) ↔ a ^ p + D^[p - 1] a = 0 := by
  sorry

end Cartier

/-! ## Layer 4: rank one over open subsets of the affine line -/

section RankOne

/-- **Layer 4.3.** The derivation `d/dx` of `K(x)`, extended from `K[x]` by Tau Ceti's
`Derivation.extendOfIsLocalization`. -/
noncomputable def ratFuncD (K : Type*) [Field K] : Derivation K (RatFunc K) (RatFunc K) :=
  Derivation.extendOfIsLocalization (nonZeroDivisors K[X])
    ((Algebra.linearMap K[X] (RatFunc K)).compDer (Polynomial.derivative' (R := K)))

/-- **Layer 4.3.** The rank-one `p`-curvature `a ^ p + a^{(p-1)}` of `d/dx + a` on `κ(x)`,
`p = char κ`. -/
noncomputable def ratFuncPCurvature {κ : Type*} [Field κ] (a : RatFunc κ) : RatFunc κ :=
  a ^ ringChar κ + (ratFuncD κ)^[ringChar κ - 1] a

open NumberField IsDedekindDomain

/-- **Layer 4.1** (Kronecker's theorem, from Chebotarev). An algebraic integer whose reduction
lies in the prime field at almost every prime is a rational integer. -/
theorem exists_intCast_eq_of_forall_pow_sub_mem (L : Type*) [Field L] [NumberField L] (c : 𝓞 L)
    (h : ∀ᶠ P in (Filter.cofinite : Filter (HeightOneSpectrum (𝓞 L))),
      c ^ ringChar (𝓞 L ⧸ P.asIdeal) - c ∈ P.asIdeal) :
    ∃ n : ℤ, c = n := by
  sorry

variable (K : Type*) [Field K] [NumberField K]

/-- **Layer 4.3.** The rational function `P / Q` over `K`, for `P Q : (𝓞 K)[X]`. -/
noncomputable def ratFuncOfInt (P Q : (𝓞 K)[X]) : RatFunc K :=
  algebraMap K[X] (RatFunc K) (P.map (algebraMap (𝓞 K) K)) /
    algebraMap K[X] (RatFunc K) (Q.map (algebraMap (𝓞 K) K))

/-- **Layer 4.3.** The reduction of `P / Q` at a prime `𝔭` of `𝓞 K`, in `κ(𝔭)(x)`; it is `0` at
the finitely many primes where the reduction of `Q` vanishes. -/
noncomputable def ratFuncMod (P Q : (𝓞 K)[X]) (v : HeightOneSpectrum (𝓞 K)) :
    RatFunc (v.asIdeal.ResidueField) :=
  algebraMap _ (RatFunc _) (P.map (algebraMap (𝓞 K) v.asIdeal.ResidueField)) /
    algebraMap _ (RatFunc _) (Q.map (algebraMap (𝓞 K) v.asIdeal.ResidueField))

/-- **Layer 4.3. Honda's theorem over a number field** (Honda 1981, §1, over `ℚ`;
Bostan–Caruso–Roques 2024, Theorem 3.6). The connection `d + a dx`, `a = P / Q ∈ K(x)`, has
vanishing `p`-curvature at almost every prime of `K` if and only if `n a` is a logarithmic
derivative `f' / f` for some `n ≥ 1`. -/
theorem honda (P Q : (𝓞 K)[X]) (hQ : Q ≠ 0) :
    (∀ᶠ v in (Filter.cofinite : Filter (HeightOneSpectrum (𝓞 K))),
      ratFuncPCurvature (ratFuncMod K P Q v) = 0) ↔
    ∃ (n : ℕ) (f : RatFunc K), 0 < n ∧ f ≠ 0 ∧
      (n : RatFunc K) * ratFuncOfInt K P Q = ratFuncD K f / f := by
  sorry

end RankOne

end TauCetiRoadmap.PCurvature
