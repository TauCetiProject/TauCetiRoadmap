import Mathlib
import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower
import TauCeti.Algebra.Category.ModuleCat.Sheaf.TensorProduct.Closed
import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.LineBundle.Functoriality

/-!
# K3SurfacesAndSymplecticBoundedness: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: invariance under field extension,
vanishing of one-forms and vector fields, the Hodge diamond, finite freeness of
the Picard group, Picard-rank bounds, bounded rank-revealing extensions, the
wild-prime bound, rank-22 Picard faithfulness and the universal bound on finite
automorphism subgroups.
This is the arbitrary-field and all-characteristic Part II of K3Surfaces.
Its geometric algebraic specialization and complex/Betti inputs are consumed from
K3Surfaces Conventions, K0, K0.A and K1–K2 through the adapter in README §1.3.
The definitions specialize native exterior powers, cohomology, schemes and
line-bundle classes; they do not supply any geometric theorem as data.

The remaining headline theorems are not statable at the pins:
* §§1.3 and 1.6: projectivity and the quartic construction lack the standard
  projective-space structure morphism and relative hypersurface carrier.
  The abstract Proj scheme itself is available.
* §§1.4–1.5 and §§4.1–4.4: surface Riemann–Roch, the numerical Picard kernel,
  the geometric Picard lattice, specialization and the saturated cycle map
  lack geometric divisor intersection numbers and the integral étale cycle map.
  Picard finite freeness and the rank inequalities themselves are stated below.
* §§2.1–2.2 and §§2.4–2.7: relative Picard representability, the closedness
  operator on one-forms, integral crystalline ranks, deformation spaces and
  polarized lifts lack the relative Picard space, exterior differential,
  de Rham–Witt/crystalline cohomology and marked formal deformation carriers.
  The Hodge diamond and the vanishings of §2.3 are stated below.
* §1.3: the specialization adapter to the geometric algebraic/analytic
  presentations lacks the standard projective-space structure morphism
  and scheme analytification carriers.
* §3.1: integral geometric étale invariants lack integral étale cohomology
  with its comparison maps; the complex and integral Betti inputs are
  K3Surfaces K1–K2, rather than further headline targets here.
* §§5.3–5.4: finite étale polarized automorphism schemes and the infinite
  symplectic Wehler action lack the ample-line predicate, polarized
  automorphism scheme and pullback action on canonical forms.
* §6.0b: numerical restriction and determinant laws for general regular
  Jacobians lack the genus-one surface fibration, regular Jacobian and
  geometric numerical divisor lattice with its intersection pairing.
* §§6.0–6.3a: supersingular discriminants, height/rank comparisons, genus-one
  pencils, tame fixed-point counts and wild fixed-locus alternatives lack the
  geometric Picard pairing, formal Brauer group and K3 quotient/resolution
  carriers. The wild-prime bound of §6.4 and the rank-22 Picard faithfulness
  of §6.4a are stated below on the native automorphism group and line-bundle
  classes.
* §6.5: the faithful action on integral étale cohomology lacks the integral
  étale automorphism representation. The universal finite-subgroup bound of
  §6.6, whose statement needs only the automorphism group, is stated below.
* §6.7d: the tame involution lift and its genus-one pencil lack the marked
  equivariant deformation carrier and geometric Picard specialization map.
* §§6.8a–6.11: invariant-dimension bounds, the tame Mathieu character,
  Mukai's bound and tame M₂₃ containment lack the K3 cohomology action,
  quotient correspondence and Mathieu permutation model.
* §§7.2–7.7: primitive openness, ample-power vanishing, cubic embeddings and
  the finite-type covering family lack the relative Picard space, ampleness
  and surface Hilbert-scheme carriers.
* §§8.1–8.5: separated Deligne–Mumford moduli, coarse spaces, dimension-19
  smoothness and finite-field finiteness lack the polarized K3 family
  groupoid and algebraic-stack/coarse-space carriers.

The general congruence input of §4.5 is supplied by
NoncommutativeAndEquivariantIwasawa §0.1.
-/

namespace TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

universe u

/-! ## Layer 1: Native surfaces and the K3 predicate -/

/-- The sheaf of relative differential p-forms is the p-th exterior power of
relative Kähler differentials for the specified structure morphism. -/
noncomputable def differentialForms (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (p : ℕ) : X.Modules :=
  letI : X.Over (Spec (.of k)) := ⟨f⟩
  (SheafOfModules.exteriorPower X.sheaf p).obj (X.relativeDifferentials k)

/-- A K3 surface over k is smooth of relative dimension two, proper and
geometrically integral, with trivial canonical sheaf and H¹(O) = 0.
Canonical triviality is existence of an isomorphism, with none chosen.
Huybrechts, Chapter 1, Definition 1.1, p.7. -/
def IsK3 (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) : Prop :=
  SmoothOfRelativeDimension 2 f ∧ IsProper f ∧ GeometricallyIntegral f ∧
    Nonempty (differentialForms k f 2 ≅ SheafOfModules.unit X.ringCatSheaf) ∧
    Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (SheafOfModules.unit X.ringCatSheaf) 1)

/-- The unpolarized K3 condition is preserved and reflected by every field
extension, including inseparable extensions. Huybrechts, Chapter 17, §2.1. -/
theorem isK3_fieldExtension_iff (k K : Type u) [Field k] [Field K] [Algebra k K]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) :
    IsK3 K (pullback.snd f (Spec.map (CommRingCat.ofHom (algebraMap k K)))) ↔
      IsK3 k f := by
  sorry

/-! ## Layer 2: Picard spaces, vanishing and lifting -/

/-- Every K3 surface over every field has no global regular one-forms or vector
fields, and H² of its tangent sheaf vanishes as well. The tangent sheaf is the
internal-Hom dual of the cotangent sheaf. Lang–Nygaard, Theorems 1.1 and 1.3,
Corollary 1.2, pp.171–173; Deligne, Proposition 1.1(b), p.59. -/
theorem IsK3.noVectorFields (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (hX : IsK3 k f) :
    Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (differentialForms k f 1) 0) ∧
    Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (SheafOfModules.dual (R := X.sheaf) (differentialForms k f 1)) 0) ∧
    Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (SheafOfModules.dual (R := X.sheaf) (differentialForms k f 1)) 2) := by
  sorry

/-- The coherent Hodge numbers of a K3 surface in every characteristic are
1 at (0,0), (2,0), (0,2), (2,2), 20 at (1,1), and zero elsewhere;
all these cohomology spaces are finite-dimensional. Deligne, Proposition 1.1,
pp.59–60; Huybrechts, Chapter 1, Remark 2.5. -/
theorem IsK3.hodgeNumbers (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (hX : IsK3 k f) (p q : ℕ) :
    letI : X.Over (Spec (.of k)) := ⟨f⟩
    Module.Finite k (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (differentialForms k f p) q) ∧
    Module.finrank k (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (differentialForms k f p) q) =
      (match p, q with
      | 0, 0 | 2, 0 | 0, 2 | 2, 2 => 1
      | 1, 1 => 20
      | _, _ => 0) := by
  sorry

/-! ## Layer 4: Picard lattices and arithmetic rank boundedness -/

/-- The geometric Picard rank is the integral rank of the native line-bundle
class group after base change to the algebraic closure of the ground field. -/
noncomputable def geometricPicardRank (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) : ℕ :=
  Module.finrank ℤ (Additive (TauCeti.AlgebraicGeometry.LineBundleClass
    (pullback f (Spec.map (CommRingCat.ofHom (algebraMap k (AlgebraicClosure k)))))))

/-- The Picard group of every K3 surface is a finite free abelian group.
Huybrechts, Chapter 1, Proposition 2.4 and Chapter 17, §2. -/
theorem IsK3.picardGroup_finiteFree (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (hX : IsK3 k f) :
    Module.Free ℤ (Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) ∧
    Module.Finite ℤ (Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) := by
  sorry

/-- Arithmetic Picard rank is positive and at most geometric Picard rank;
the latter is at most 22, and at most 20 in characteristic zero.
Huybrechts, Chapter 17, §§2.1–2.2, pp.365–366. -/
theorem IsK3.picardRank_bounds (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (hX : IsK3 k f) :
    1 ≤ Module.finrank ℤ (Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) ∧
    Module.finrank ℤ (Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) ≤
      geometricPicardRank k f ∧
    geometricPicardRank k f ≤ 22 ∧
    (ringChar k = 0 → geometricPicardRank k f ≤ 20) := by
  sorry

/-- A finite separable subextension of the algebraic closure of universally
bounded degree realizes the geometric Picard rank, over every ground field.
Huybrechts, Chapter 17, Lemma 2.6, p.367. -/
theorem IsK3.boundedPicardDescent (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (hX : IsK3 k f) :
    ∃ K : IntermediateField k (AlgebraicClosure k),
      FiniteDimensional k K ∧ Algebra.IsSeparable k K ∧
      Module.finrank k K ≤ Nat.card (Matrix.GeneralLinearGroup (Fin 22) (ZMod 3)) ∧
      Module.finrank ℤ (Additive (TauCeti.AlgebraicGeometry.LineBundleClass
        (pullback f (Spec.map (CommRingCat.ofHom (algebraMap k K)))))) =
        geometricPicardRank k f := by
  sorry

/-! ## Layer 6: Finite symplectic actions and universal bounds -/

/-- The wild-prime bound: if a finite subgroup of the automorphism group of a K3
surface over a field of characteristic p > 0 has order divisible by p, then
p ≤ 11. The automorphism group is that of the structure morphism in the over
category; no symplectic hypothesis is needed. Dolgachev–Keum, Theorem 2.1,
pp.4–10; Keum, p.3. -/
theorem IsK3.wildPrime_le_eleven (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (hX : IsK3 k f)
    (G : Subgroup (Aut (Over.mk f))) [Finite G]
    (hp : ringChar k ≠ 0) (hdvd : ringChar k ∣ Nat.card G) :
    ringChar k ≤ 11 := by
  sorry

/-- Rank-22 Picard faithfulness: on a K3 surface over an algebraically closed
field of positive characteristic whose group of line-bundle classes has rank 22,
an automorphism whose pullback fixes every line-bundle class is the identity.
No finite-order assumption is made. Rudakov–Shafarevich, §8, Proposition 3;
Keum, §6, pp.19–20. -/
theorem IsK3.picardFaithful_of_rank22 (k : Type u) [Field k] [IsAlgClosed k]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) (hX : IsK3 k f) (hp : ringChar k ≠ 0)
    (h22 : Module.finrank ℤ (Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) = 22)
    (g : Aut (Over.mk f))
    (hg : ∀ a, TauCeti.AlgebraicGeometry.LineBundleClass.pullback g.hom.left a = a) :
    g = 1 := by
  sorry

/-- The universal finite-subgroup bound: every finite subgroup of the
automorphism group of a K3 surface over any field has order at most the larger
of |GL₂₂(𝔽₃)| and |GL₂₂(𝔽₅)|, through the faithful action on rank-22 integral
ℓ-adic cohomology and the odd-prime congruence injection. Keum, Theorem 1.4,
p.3; Huybrechts, Chapter 17, proof of Lemma 2.6, p.367. -/
theorem IsK3.finiteSubgroup_card_le (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (hX : IsK3 k f)
    (G : Subgroup (Aut (Over.mk f))) [Finite G] :
    Nat.card G ≤ max (Nat.card (Matrix.GeneralLinearGroup (Fin 22) (ZMod 3)))
      (Nat.card (Matrix.GeneralLinearGroup (Fin 22) (ZMod 5))) := by
  sorry

end TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness
