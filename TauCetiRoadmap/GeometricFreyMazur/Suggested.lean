module

public import Mathlib
public import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Basic

/-!
# Geometric Frey–Mazur: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: full torsion monodromy and geometric
Frey–Mazur over one-variable function fields. The definition of gonality below is
CanonicalModelsAndGonality §1.1's, with the same body, repeated only so that these
headlines elaborate; that roadmap's Layers 1 and 9 own its theory and proper-model comparison.

The following headline theorems are not statable at the pins:
* The compact and filling-sensitive cusped systole asymptotics and surviving witness
  lack the scalar-level modular curve, its marked triangle quotient and compact metric.
* Signed reconstruction, Heegner and three-bicusp repulsion lack framed modular
  points, CM/cusp strata and ordinary/conjugate Hecke loci.
* The overlap dichotomy and big-diagonal multiplicity bound lack the modular
  fourfold, graph strata, tube geometry and weighted projection cycles.
* The Heegner, anti-Heegner and p-weighted bicusp multiplicity bounds lack
  modular analytic cycles, their stratum multiplicities and canonical degrees.
* Wreath-pullback ramification decay and complex bounded-gonality rigidity lack
  the quotient surface, scheme symmetric powers and normalized pencil pullback.
* Uniform geometric rigidity lacks the algebraic modular surface and Hecke loci.
* Geometric Frey–Mazur over the original open base lacks the relative elliptic-scheme
  and finite étale torsion-isomorphism carriers. Its function-field form is stated below.
* Bounded-genus rigidity, the rational/elliptic-curve classification and the
  known-curve minimal-model theorem lack the quotient surface, cyclic quotient
  resolution, strict-transform curve classes and contraction carrier.
-/

@[expose] public section

namespace TauCetiRoadmap.GeometricFreyMazur

open scoped WeierstrassCurve

attribute [local instance] AddSubgroup.torsionBy.zmodModule

/-- Gonality as defined in CanonicalModelsAndGonality §1.1: the infimum of the degrees
`[K : k(f)]` over transcendental `f`. On a one-variable function field every such degree is
finite and positive and the infimum is attained; over algebraically closed constants it is the
gonality of the smooth proper model. Outside one-variable function fields the value is zero;
the headline theorems require a one-variable function field. -/
noncomputable def gonality (k K : Type*) [Field k] [Field K] [Algebra k K] : ℕ :=
  sInf {n : ℕ | ∃ f : K, Transcendental k f ∧
    Module.finrank (IntermediateField.adjoin k {f}) K = n}

/-! ## Layer 9: Actual torsion, descent and characteristic-zero fields -/

open scoped Classical in
/-- For a nonisotrivial elliptic curve over an algebraically closed characteristic-zero
constant field's one-variable function field of gonality less than N, every
prime p with 5 < p and 800N < 7p has full determinant-one geometric torsion image.
The action is expressed on geometric points killed by p, without choosing a basis. -/
theorem full_monodromy (N : ℕ) (k K : Type u) [Field k] [IsAlgClosed k] [CharZero k]
    [Field K] [Algebra k K] [Algebra (RatFunc k) K] [IsScalarTower k (RatFunc k) K]
    [FunctionField k K] (hK : gonality k K < N) (W : WeierstrassCurve K) [W.IsElliptic]
    (hW : W.j ∉ Set.range (algebraMap k K)) (p : ℕ) (hp : p.Prime) (hp5 : 5 < p)
    (hpN : 800 * N < 7 * p) :
    ∀ g : AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ) ≃+
          AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ),
      LinearMap.det (g.toAddMonoidHom.toZModLinearMap p) = 1 →
      ∃ σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K,
        ∀ P : AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ),
          (g P : (W⁄(AlgebraicClosure K)).toAffine.Point) =
            WeierstrassCurve.Affine.Point.map (W' := W) σ.toAlgHom P := by
  sorry

open scoped Classical in
/-- Geometric Frey–Mazur over one-variable function fields (BT16 Theorem 2, stated there
for a fixed constant field), with the threshold made independent of the constant field as in
README §9.5: `M` is chosen before `k` and `K`. An actual Galois-equivariant additive
isomorphism of geometric p-torsion for two nonisotrivial elliptic curves gives an isogeny
over the original function field. -/
theorem geometric_frey_mazur (N : ℕ) :
    ∃ M : ℕ, ∀ (k K : Type u) [Field k] [IsAlgClosed k] [CharZero k] [Field K] [Algebra k K]
      [Algebra (RatFunc k) K] [IsScalarTower k (RatFunc k) K] [FunctionField k K],
      gonality k K < N →
      ∀ (W W' : WeierstrassCurve K) [W.IsElliptic] [W'.IsElliptic],
        W.j ∉ Set.range (algebraMap k K) → W'.j ∉ Set.range (algebraMap k K) →
      ∀ p : ℕ, p.Prime → M < p →
      ∀ e : AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ) ≃+
            AddSubgroup.torsionBy (W'⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ),
        (∀ (σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K)
            (P Q : AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ)),
            (Q : (W⁄(AlgebraicClosure K)).toAffine.Point) =
              WeierstrassCurve.Affine.Point.map (W' := W) σ.toAlgHom P →
            (e Q : (W'⁄(AlgebraicClosure K)).toAffine.Point) =
              WeierstrassCurve.Affine.Point.map (W' := W') σ.toAlgHom (e P)) →
      Nonempty (TauCeti.Isogeny W.toAffine W'.toAffine) := by
  sorry

end TauCetiRoadmap.GeometricFreyMazur
