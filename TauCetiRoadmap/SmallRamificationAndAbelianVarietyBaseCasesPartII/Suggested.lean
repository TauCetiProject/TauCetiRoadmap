module

public import Mathlib
public import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic
public import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
public import TauCeti.AlgebraicGeometry.Cohomology.Basic

/-!
# Small ramification and low-degree Hodge vanishing, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The local-model predicates below use
native schemes, Witt vectors and generic-fibre isomorphisms. The Hodge theorem
uses native relative differentials, sheaf exterior powers and Zariski cohomology.
The geometric K3 bad-prime theorem expands the five native conditions of
K3SurfacesAndSymplecticBoundedness §1.1 on the geometric base change; it does
not introduce another K3 predicate.

The following headline theorems are not statable at the pins:
* Layer 1: the higher-weight torsion ramification and strict different bounds
  lack the Fontaine–Laffaille category and its torsion crystalline realization.
* Layer 2: the exhaustive finite seven-primary and rational seven-adic
  cyclotomic filtrations lack the torsion crystalline essential-image predicate
  and the rational crystalline predicate with its Hodge–Tate weight interval.
* Layer 3: the vanishing of odd low étale cohomology and the full scalar Tate
  action in degree two lack geometric rational étale cohomology with Galois action.
-/

@[expose] public section

namespace TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCasesPartII

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

/-! ## Layer 0: Unramified local models and cohomology -/

/-- A rational scheme has Witt good reduction at p if its scalar extension to
Frac(W(algebraicClosure(F_p))) is isomorphic over that field to the generic
fibre of a smooth proper scheme over W(algebraicClosure(F_p)). No model is chosen.
Fontaine, Theorem 1, Remark (a), author preprint p. 3. -/
def hasWittGoodReductionAt {X : Scheme.{0}} (f : X ⟶ Spec (.of ℚ))
    (p : ℕ) [Fact p.Prime] : Prop :=
  let W := WittVector p (AlgebraicClosure (ZMod p))
  let K := FractionRing W
  let b := Spec.map (CommRingCat.ofHom (algebraMap W K))
  ∃ (a : ℚ →+* K) (Y : Scheme.{0}) (g : Y ⟶ Spec (.of W)),
    Smooth g ∧ IsProper g ∧
      ∃ e : pullback f (Spec.map (CommRingCat.ofHom a)) ≅ pullback g b,
        e.hom ≫ pullback.snd g b =
          pullback.snd f (Spec.map (CommRingCat.ofHom a))

/-- Witt good reduction at every rational prime, including two, with independent
scheme-model witnesses and generic-fibre identifications at the different primes. -/
def hasEverywhereWittGoodReduction {X : Scheme.{0}} (f : X ⟶ Spec (.of ℚ)) : Prop :=
  ∀ (p : ℕ) (hp : p.Prime),
    letI : Fact p.Prime := ⟨hp⟩
    hasWittGoodReductionAt f p

/-! ## Layer 3: Low-degree cohomology and Hodge vanishing -/

/-- For a smooth proper rational scheme with everywhere Witt good reduction,
H^j(X, Ω^i) vanishes when i ≠ j and i + j ≤ 3. Projectivity and geometric
connectedness are not hypotheses. Fontaine, Theorem 1 and Remark (a), p. 3. -/
theorem lowDegreeHodgeVanishing {X : Scheme.{0}} (f : X ⟶ Spec (.of ℚ))
    [Smooth f] [IsProper f] (hX : hasEverywhereWittGoodReduction f)
    (i j : ℕ) (hij : i ≠ j) (hdegree : i + j ≤ 3) :
    letI : X.Over (Spec (.of ℚ)) := ⟨f⟩
    Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      ((SheafOfModules.exteriorPower X.sheaf i).obj (X.relativeDifferentials ℚ)) j) := by
  sorry

/-! ## Layer 4: K3 bad reduction and geometric examples -/

/-- A smooth proper rational scheme whose geometric base change satisfies the
five K3 conditions has a prime with no smooth proper Witt-ring model.
The conditions are those of K3SurfacesAndSymplecticBoundedness §1.1.
Fontaine, Theorem 1 and Remark (a), p. 3; Schröer, Proposition 5.5 proof, p. 16. -/
theorem geometricK3_hasBadWittPrime {X : Scheme.{0}}
    (f : X ⟶ Spec (.of ℚ)) [Smooth f] [IsProper f] :
    let a := Spec.map (CommRingCat.ofHom (algebraMap ℚ (AlgebraicClosure ℚ)))
    let Xbar := pullback f a
    let fbar := pullback.snd f a
    letI : Xbar.Over (Spec (.of (AlgebraicClosure ℚ))) := ⟨fbar⟩
    (SmoothOfRelativeDimension 2 fbar ∧ IsProper fbar ∧
      GeometricallyIntegral fbar ∧
      Nonempty (((SheafOfModules.exteriorPower Xbar.sheaf 2).obj
        (Xbar.relativeDifferentials (AlgebraicClosure ℚ))) ≅
          SheafOfModules.unit Xbar.ringCatSheaf) ∧
      Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
        (SheafOfModules.unit Xbar.ringCatSheaf) 1)) →
    ∃ (p : ℕ) (hp : p.Prime),
      letI : Fact p.Prime := ⟨hp⟩
      ¬ hasWittGoodReductionAt f p := by
  sorry

end TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCasesPartII
