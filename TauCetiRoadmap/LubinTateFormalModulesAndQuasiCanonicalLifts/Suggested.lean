module

import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.FormalGroup.Basic
import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import TauCeti.RingTheory.FormalGroup.Hom
import TauCeti.RingTheory.FormalGroup.ZSMul

/-!
# Lubin–Tate formal modules and quasi-canonical lifts: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the simple
definitions they need: the formal-module structure of README §0.1 on Tau Ceti's formal-group
endomorphisms `TauCeti.FormalGroupHom`, and the Lubin–Tate predicates of §1.1.

Stated here:

* the Lubin–Tate theorem: a Lubin–Tate series is the action of `π` in a formal `O`-module
  structure on a formal group law, which is the only formal group law of which the series is an
  endomorphism (§1.3), and the Lubin–Tate interpolation of homomorphisms (§1.2);
* the degree and splitting of the Lubin–Tate division fields in a primitive root (§2.3);
* the explicit reciprocity law `Art_K(π^r u)(t) = [u⁻¹]_f(t)` on the roots of the iterates of a
  Lubin–Tate polynomial, with `[u⁻¹]_f(t)` computed as the value at `t` of any polynomial
  congruent to `[u⁻¹]_f` modulo the iterate, and the norm group `π^ℤ · U(K, m)` of the division
  field (§2.5), both under Tau Ceti's arithmetic local Artin map;
* the Lubin–Tate structure of the formal group of an elliptic curve over `W(𝔽_(p²))` whose
  reduction has trace of Frobenius `2sp`, `s = ±1` (§4.4).

Not statable at the pins, with what each lacks:

* the freeness of rank `h` of the `π`-adic Tate module of a formal `O_K`-module of height `h`
  (§2.2) and the isomorphism `Gal(K_π/K) ≅ O_K^×` (§2.4): Tau Ceti's evaluated points
  `FormalGroup.TopNilpotentPoint` live on one complete linearly topologized algebra at a time, and
  the module `G(𝔪_(K̄))`, the union of the point modules of the integer rings of the finite
  subextensions of `K̄` with its Galois action, is a construction of §0.2;
* the universal deformation of a formal `O_K`-module of finite height over `B[[t₁,…,t_(h−1)]]`
  (§3.6): Tau Ceti's `TauCeti.FormalGroupHom` and `TauCeti.FormalGroupIso` exist, but the marked
  deformation functor of formal `O_K`-modules on complete local `B`-algebras is a construction of
  §3.1;
* Honda's functional-equation integrality and the unramified type `p − sT²` (§§4.2–4.3): the
  Frobenius-skew power-series ring `O_σ[[T]]` is absent;
* the classification of quasi-canonical lifts, their fields of moduli as ring class fields with
  degrees `q₀^(s−1)(q₀+1)` and `q₀^s`, and the uniformizer property of their moduli (§§6.3–7.2):
  the lattice quotients of formal modules, their Frobenius-twisted markings and their fields of
  moduli are constructions of Layers 5–6;
* the BKO tower comparisons and the trace-compatible square of formal traces (§§8.4–9.3): they need
  the quasi-canonical fields of Layer 7 and the formal traces on evaluated points of §9.1.
-/

namespace TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts

open PowerSeries ValuativeRel

/-! ## Layer 0: Formal modules, points and analytic logarithms -/

section FormalModules

/-- A *formal `A`-module* structure on a formal group law `F` over an `A`-algebra `R` (README
§0.1; LT65, §1; VZ07, Definition 1.1): `F` is commutative, and `a ↦ [a]` is a map from `A` to the
endomorphisms of `F` which is a unital ring homomorphism for the formal sum `F([a], [b])` and
composition, and whose linear coefficient is the image of `a` in `R`. -/
structure FormalModule (A : Type*) [CommRing A] {R : Type*} [CommRing R] [Algebra A R]
    (F : FormalGroup R) where
  /-- The formal group law is commutative. -/
  isComm : F.IsComm
  /-- The endomorphism `[a]` of `F`. -/
  act : A → TauCeti.FormalGroupHom F F
  /-- The linear coefficient of `[a]` is the image of `a` in `R`. -/
  coeff_one_act (a : A) : coeff 1 (act a).toPowerSeries = algebraMap A R a
  /-- `[1]` is the identity. -/
  act_one : act 1 = TauCeti.FormalGroupHom.id F
  /-- `[a b] = [a] ∘ [b]`. -/
  act_mul (a b : A) : act (a * b) = (act a).comp (act b)
  /-- `[a + b] = F([a], [b])`. -/
  act_add (a b : A) : (act (a + b)).toPowerSeries =
    MvPowerSeries.subst ![(act a).toPowerSeries, (act b).toPowerSeries] F.toPowerSeries

end FormalModules

/-! ## Layer 1: The Lubin–Tate construction -/

section Predicates

variable {O : Type*} [CommRing O] [IsLocalRing O]

/-- A *Lubin–Tate series* for `π` and `q` (LT65, §1, condition (1)): a power series with zero
constant term, linear coefficient `π`, and reduction `X ^ q` modulo the maximal ideal. -/
def IsLubinTateSeries (π : O) (q : ℕ) (f : PowerSeries O) : Prop :=
  constantCoeff f = 0 ∧ coeff 1 f = π ∧ PowerSeries.map (IsLocalRing.residue O) f = X ^ q

/-- A *Lubin–Tate polynomial* for `π` and `q`: a monic polynomial of degree `q` with zero constant
term, linear coefficient `π`, and reduction `X ^ q` modulo the maximal ideal; for example
`π X + X ^ q`. -/
def IsLubinTatePolynomial (π : O) (q : ℕ) (f : Polynomial O) : Prop :=
  f.Monic ∧ f.natDegree = q ∧ f.coeff 0 = 0 ∧ f.coeff 1 = π ∧
    f.map (IsLocalRing.residue O) = Polynomial.X ^ q

end Predicates

section Construction

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Finite (IsLocalRing.ResidueField O)]

/-- **The Lubin–Tate theorem** (LT65, Theorem 1, pp.382–383). Let `O` be a discrete valuation ring
with finite residue field of cardinality `q` and `π` a uniformizer. For a Lubin–Tate series `f` for
`π` there is a formal group law `F_f` over `O` with a formal `O`-module structure whose action of
`π` is `f`, and `F_f` is the only formal group law over `O` of which `f` is an endomorphism. -/
theorem exists_formalModule_of_isLubinTateSeries {π : O} (hπ : Irreducible π)
    {f : PowerSeries O} (hf : IsLubinTateSeries π (Nat.card (IsLocalRing.ResidueField O)) f) :
    ∃ (F : FormalGroup O) (ρ : FormalModule O F), (ρ.act π).toPowerSeries = f ∧
      ∀ (G : FormalGroup O) (φ : TauCeti.FormalGroupHom G G), φ.toPowerSeries = f → G = F := by
  sorry

/-- **Lubin–Tate interpolation of homomorphisms** (LT65, Lemma 1, pp.381–382, in arity one). For
Lubin–Tate series `f` and `g` for the same uniformizer `π` and every `a ∈ O` there is a unique power
series `φ = a X + ⋯` over `O` with `f ∘ φ = φ ∘ g`; it is the homomorphism `[a]_(f,g)`. -/
theorem existsUnique_lubinTate_intertwiner {π : O} (hπ : Irreducible π)
    {f g : PowerSeries O}
    (hf : IsLubinTateSeries π (Nat.card (IsLocalRing.ResidueField O)) f)
    (hg : IsLubinTateSeries π (Nat.card (IsLocalRing.ResidueField O)) g) (a : O) :
    ∃! φ : PowerSeries O, constantCoeff φ = 0 ∧ coeff 1 φ = a ∧
      PowerSeries.subst φ f = PowerSeries.subst g φ := by
  sorry

end Construction

/-! ## Layer 2: Torsion, Tate modules and the Artin comparison -/

section DivisionFields

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]

/-- **Primitive-root presentation of the Lubin–Tate division fields** (LT65, Theorem 2,
pp.383–384; README §2.3). Let `K` be a nonarchimedean local field, of either characteristic, with
residue cardinality `q`, `π` a uniformizer and `f` a Lubin–Tate polynomial for `π`. If `t ∈ K̄` is a
root of the iterate `f^{∘m}`, `m ≥ 1`, but not of `f^{∘(m−1)}`, then
`[K(t) : K] = (q − 1) q ^ (m − 1)` and every root of `f^{∘m}` lies in `K(t)`. -/
theorem finrank_adjoin_primitive_lubinTate_root {π : 𝒪[K]} (hπ : Irreducible π)
    {f : Polynomial 𝒪[K]} (hf : IsLubinTatePolynomial π (Nat.card 𝓀[K]) f)
    {m : ℕ} (hm : 1 ≤ m) {t : AlgebraicClosure K}
    (ht : Polynomial.aeval t ((f.comp)^[m] Polynomial.X) = 0)
    (ht' : Polynomial.aeval t ((f.comp)^[m - 1] Polynomial.X) ≠ 0) :
    Module.finrank K (IntermediateField.adjoin K {t}) =
        (Nat.card 𝓀[K] - 1) * Nat.card 𝓀[K] ^ (m - 1) ∧
      ∀ s : AlgebraicClosure K, Polynomial.aeval s ((f.comp)^[m] Polynomial.X) = 0 →
        s ∈ IntermediateField.adjoin K {t} := by
  sorry

/-- **The explicit Lubin–Tate reciprocity law** (LT65, §2, Theorem 3 and its proof, pp.385–387).
With `K`, `π` and `f` as above, `ϖ ∈ Kˣ` equal to `π`, `r ∈ ℤ` and `u ∈ O_K^×`: let `φ` be the
series `[u⁻¹]_f`, characterized by zero constant term, linear coefficient `u⁻¹` and
`f ∘ φ = φ ∘ f`, and let `P` be a polynomial congruent to `φ` modulo the iterate `f^{∘m}` in
`O_K[[X]]`. Then every lift `σ` to the absolute Galois group of the arithmetic Artin symbol
`Art_K(ϖ^r u)` sends each root `t` of `f^{∘m}` to `P(t)`, the value `[u⁻¹]_f(t)`. -/
theorem artinMap_apply_lubinTate_root {π : 𝒪[K]} (hπ : Irreducible π)
    {f : Polynomial 𝒪[K]} (hf : IsLubinTatePolynomial π (Nat.card 𝓀[K]) f)
    (ϖ : Kˣ) (hϖ : (ϖ : K) = π) (r : ℤ) (u : 𝒪[K]ˣ)
    {φ : PowerSeries 𝒪[K]} (hφ₀ : constantCoeff φ = 0) (hφ₁ : coeff 1 φ = ((u⁻¹ : 𝒪[K]ˣ) : 𝒪[K]))
    (hφ : PowerSeries.subst φ (f : PowerSeries 𝒪[K]) = PowerSeries.subst (f : PowerSeries 𝒪[K]) φ)
    (m : ℕ) {P : Polynomial 𝒪[K]}
    (hP : (P : PowerSeries 𝒪[K]) - φ ∈
      Ideal.span {(((f.comp)^[m] Polynomial.X : Polynomial 𝒪[K]) : PowerSeries 𝒪[K])})
    (σ : Field.absoluteGaloisGroup K)
    (hσ : (σ : Field.absoluteGaloisGroupAbelianization K) =
      TauCeti.ClassFieldTheory.artinMap K (ϖ ^ r * Units.map (algebraMap 𝒪[K] K).toMonoidHom u))
    {t : AlgebraicClosure K} (ht : Polynomial.aeval t ((f.comp)^[m] Polynomial.X) = 0) :
    (show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from σ) t = Polynomial.aeval t P := by
  sorry

/-- **The norm group of the Lubin–Tate division fields** (LT65, §2, Theorem 3 and its corollary,
pp.385–387). With `K`, `π` and `f` as above, `ϖ ∈ Kˣ` equal to `π`, and `m ≥ 0`: every lift to the
absolute Galois group of the arithmetic Artin symbol `Art_K(x)` fixes every root of `f^{∘m}` if and
only if `x ∈ ⟨ϖ⟩ · U(K, m)`, that is, the norm group of `K(f^{∘m} = 0)/K` is
`π^ℤ · U(K, m)`, where `U(K, 0) = O_K^×` and `U(K, m) = 1 + 𝔪_K^m` only for `m ≥ 1`. -/
theorem artinMap_fixes_lubinTate_roots_iff {π : 𝒪[K]} (hπ : Irreducible π)
    {f : Polynomial 𝒪[K]} (hf : IsLubinTatePolynomial π (Nat.card 𝓀[K]) f)
    (ϖ : Kˣ) (hϖ : (ϖ : K) = π) (m : ℕ) (x : Kˣ) :
    (∀ σ : Field.absoluteGaloisGroup K,
        (σ : Field.absoluteGaloisGroupAbelianization K) = TauCeti.ClassFieldTheory.artinMap K x →
        ∀ t : AlgebraicClosure K, Polynomial.aeval t ((f.comp)^[m] Polynomial.X) = 0 →
          (show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from σ) t = t) ↔
      x ∈ Subgroup.zpowers ϖ ⊔ TauCeti.unitFiltration K m := by
  sorry

end DivisionFields

/-! ## Layer 4: Honda theory and the elliptic comparisons -/

section Elliptic

/-- **The supersingular elliptic formal group is Lubin–Tate** (H70, Theorem 9 and Lemma 4.2;
BKO21, Lemma 5.1, with the sign `p − sT²` of README §4.3). Let `p` be prime, `O = W(𝔽_(p²))` and
`W` a Weierstrass curve over `O` with unit discriminant whose reduction has `p² + 1 − 2sp` points
over `𝔽_(p²)`, `s = ±1`. Then multiplication by `s p` on the formal group law of `W` is a
Lubin–Tate series for `s p`, its reduction being the `p²`-power Frobenius, and the formal group law
carries a formal `O`-module structure whose action of `s p` is that multiplication; by the
Lubin–Tate theorem this is the Lubin–Tate formal `O`-module for `s p`. -/
theorem isLubinTateSeries_zsmulSeries_formalGroup (p : ℕ) [Fact p.Prime] (s : ℤ)
    (hs : s = 1 ∨ s = -1) (W : WeierstrassCurve (WittVector p (GaloisField p 2)))
    (hΔ : IsUnit W.Δ)
    (ha : (Nat.card (W.map (IsLocalRing.residue (WittVector p (GaloisField p 2)))).toAffine.Point
      : ℤ) = p ^ 2 + 1 - 2 * s * p) :
    IsLubinTateSeries ((s * p : ℤ) : WittVector p (GaloisField p 2)) (p ^ 2)
        (W.formalGroup.zsmulSeries (s * p)) ∧
      ∃ ρ : FormalModule (WittVector p (GaloisField p 2)) W.formalGroup,
        (ρ.act ((s * p : ℤ) : WittVector p (GaloisField p 2))).toPowerSeries =
          W.formalGroup.zsmulSeries (s * p) := by
  sorry

end Elliptic

end TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts
