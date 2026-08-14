import Mathlib

/-!
# Modular curves, following Katz–Mazur: representative signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`. What
is recorded here are declarations which can already be stated using Mathlib's present
algebraic-geometry and Weierstrass APIs, so that contributors and reviewers converge on names and
signatures; discharging all of them finishes neither a layer nor the roadmap. `sorry` is expected in
this file — these are goals, not results — and nothing here is a `Prop`-typed placeholder standing
in for an object that does not exist yet.

The first seven declarations are unchanged from the previous branch. The rest seed the carrier and
variance boundaries which control the proof: relative divisors, finite flat group schemes, elliptic
curves, the two dual-isogeny constructions, groupoid-valued moduli problems, Chapter 5 regularity,
and the Chapter 6 cyclicity space. Further structure should be added as each supplier API becomes
concrete.
-/

namespace TauCetiRoadmap.ModularCurves

open AlgebraicGeometry CategoryTheory
open scoped Classical

/-! ## The projective Weierstrass model

For `W : WeierstrassCurve R`, the projective model is the cubic

`Y²Z + a₁XYZ + a₃YZ² = X³ + a₂X²Z + a₄XZ² + a₆Z³`

in `ℙ²_R`. Ellipticity is needed for smoothness, not for the construction of the closed
subscheme or its properness.
-/

/-- The projective scheme associated to a Weierstrass curve. -/
noncomputable def projModel {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    Scheme.{u} :=
  sorry

/-- The structure morphism of the projective Weierstrass model. -/
noncomputable def projModelOver {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    projModel W ⟶ Spec (CommRingCat.of R) :=
  sorry

/-- The projective Weierstrass model is proper over its base. -/
theorem isProper_projModelOver {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    IsProper (projModelOver W) :=
  sorry

/-- If the discriminant is a unit, the projective model is smooth of relative dimension one. -/
theorem smoothOfRelativeDimension_one_projModelOver {R : Type u} [CommRing R]
    (W : WeierstrassCurve R) [W.IsElliptic] :
    SmoothOfRelativeDimension 1 (projModelOver W) :=
  sorry

/-- The zero section `[0 : 1 : 0]`. -/
noncomputable def projModelZero {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    Spec (CommRingCat.of R) ⟶ projModel W :=
  sorry

/-- The zero section is a section of the structure morphism. -/
theorem projModelZero_comp {R : Type u} [CommRing R] (W : WeierstrassCurve R) :
    projModelZero W ≫ projModelOver W = 𝟙 (Spec (CommRingCat.of R)) :=
  sorry

/-- Over a field, sections of the projective model are the usual Weierstrass points. -/
noncomputable def projModelPointsEquiv {K : Type u} [Field K] (W : WeierstrassCurve K) :
    {g : Spec (CommRingCat.of K) ⟶ projModel W //
      g ≫ projModelOver W = 𝟙 (Spec (CommRingCat.of K))} ≃ W.toAffine.Point :=
  sorry

/-! ## Relative divisors and finite flat group schemes

The definitions below are opaque only because Mathlib does not yet have the final carriers. Their
arguments and outputs pin the base, variance, and base-change conventions used by the roadmap.
-/

/-- Relative effective Cartier divisors on a fixed relative curve. The definitive definition is
the Cartier condition together with flatness over the base; finiteness is a theorem. -/
noncomputable def RelEffCartierDivisor {S X : Scheme.{u}} (f : X ⟶ S) : Type (u + 1) :=
  sorry

namespace RelEffCartierDivisor

/-- Pullback of a relative effective Cartier divisor. -/
noncomputable def baseChange {S X T : Scheme.{u}} (f : X ⟶ S) (g : T ⟶ S)
    (D : RelEffCartierDivisor f) :
    RelEffCartierDivisor (Limits.pullback.snd f g) :=
  sorry

/-- The divisor cut out by a section of a smooth relative curve. -/
noncomputable def ofSection {S X : Scheme.{u}} (f : X ⟶ S) (P : S ⟶ X)
    [IsSeparated f] (hf : SmoothOfRelativeDimension 1 f) (hP : P ≫ f = 𝟙 S) :
    RelEffCartierDivisor f :=
  sorry

/-- The incidence locus over the base representing the condition `D₁ ≤ D₂`. Properness
of the relative curve ensures that the two divisors are finite locally free over the base. -/
noncomputable def incidenceLocus {S X : Scheme.{u}} {f : X ⟶ S}
    (hcurve : SmoothOfRelativeDimension 1 f) (hf : IsProper f)
    (D₁ D₂ : RelEffCartierDivisor f) : Over S :=
  sorry

/-- The equality locus over the base representing the condition `D₁ = D₂`. -/
noncomputable def equalityLocus {S X : Scheme.{u}} {f : X ⟶ S}
    (hcurve : SmoothOfRelativeDimension 1 f) (hf : IsProper f)
    (D₁ D₂ : RelEffCartierDivisor f) : Over S :=
  sorry

end RelEffCartierDivisor

/-- Finite locally free commutative group schemes over `S`. -/
noncomputable def FiniteFlatCommGroupScheme (S : Scheme.{u}) : Type (u + 1) :=
  sorry

namespace FiniteFlatCommGroupScheme

noncomputable def carrier {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) : Scheme.{u} :=
  sorry

noncomputable def structureMap {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) :
    carrier G ⟶ S :=
  sorry

/-- Sections of the structure morphism of a finite flat group scheme. -/
def Section {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) :=
  {s : S ⟶ carrier G // s ≫ structureMap G = 𝟙 S}

noncomputable def Hom {S : Scheme.{u}}
    (G H : FiniteFlatCommGroupScheme S) : Type (u + 1) :=
  sorry

noncomputable def Iso {S : Scheme.{u}}
    (G H : FiniteFlatCommGroupScheme S) : Type (u + 1) :=
  sorry

noncomputable def baseChange {S T : Scheme.{u}} (G : FiniteFlatCommGroupScheme S)
    (f : T ⟶ S) : FiniteFlatCommGroupScheme T :=
  sorry

/-- Cartier duality, as an object before its contravariant functoriality is installed. -/
noncomputable def cartierDual {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) :
    FiniteFlatCommGroupScheme S :=
  sorry

noncomputable def mulBy {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) (n : ℕ) : Hom G G :=
  sorry

noncomputable def zero {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) : Hom G G :=
  sorry

/-- Cartier duality commutes with base change through a canonical isomorphism. -/
noncomputable def cartierDualBaseChangeIso {S T : Scheme.{u}}
    (G : FiniteFlatCommGroupScheme S) (f : T ⟶ S) :
    Iso (baseChange (cartierDual G) f) (cartierDual (baseChange G f)) :=
  sorry

/-- A finite locally free commutative group scheme of constant rank `n` is killed by `n`. -/
theorem mulBy_eq_zero_of_finrank {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) (n : ℕ)
    (hrank : (structureMap G).finrank = fun _ ↦ n) :
    mulBy G n = zero G :=
  sorry

end FiniteFlatCommGroupScheme

/-- Bilinear morphisms from two finite flat commutative group schemes to `𝔾_m`. -/
noncomputable def GroupSchemePairing {S : Scheme.{u}}
    (G H : FiniteFlatCommGroupScheme S) : Type (u + 1) :=
  sorry

/-! ## Elliptic curves, torsion, and dual isogenies -/

/-- Smooth proper pointed genus-one curves with the pointed local-Weierstrass condition. -/
noncomputable def EllipticCurveGeom (S : Scheme.{u}) : Type (u + 1) :=
  sorry

namespace EllipticCurveGeom

noncomputable def carrier {S : Scheme.{u}} (E : EllipticCurveGeom S) : Scheme.{u} :=
  sorry

noncomputable def structureMap {S : Scheme.{u}} (E : EllipticCurveGeom S) : carrier E ⟶ S :=
  sorry

noncomputable def zero {S : Scheme.{u}} (E : EllipticCurveGeom S) : S ⟶ carrier E :=
  sorry

theorem zero_comp_structureMap {S : Scheme.{u}} (E : EllipticCurveGeom S) :
    zero E ≫ structureMap E = 𝟙 S :=
  sorry

noncomputable def baseChange {S T : Scheme.{u}} (E : EllipticCurveGeom S) (f : T ⟶ S) :
    EllipticCurveGeom T :=
  sorry

end EllipticCurveGeom

/-- An elliptic curve with its canonical commutative group structure. -/
noncomputable def EllipticCurve (S : Scheme.{u}) : Type (u + 1) :=
  sorry

namespace EllipticCurve

noncomputable def toGeom {S : Scheme.{u}} (E : EllipticCurve S) : EllipticCurveGeom S :=
  sorry

noncomputable def carrier {S : Scheme.{u}} (E : EllipticCurve S) : Scheme.{u} :=
  EllipticCurveGeom.carrier E.toGeom

/-- An elliptic curve as an object over its base. -/
noncomputable def toOver {S : Scheme.{u}} (E : EllipticCurve S) : Over S :=
  Over.mk (EllipticCurveGeom.structureMap E.toGeom)

noncomputable def baseChange {S T : Scheme.{u}} (E : EllipticCurve S) (f : T ⟶ S) :
    EllipticCurve T :=
  sorry

/-- Multiplication by a natural number as a scheme homomorphism. -/
noncomputable def mulBy {S : Scheme.{u}} (E : EllipticCurve S) (n : ℕ) :
    carrier E ⟶ carrier E :=
  sorry

/-- The finite-flat kernel `E[N]`, for nonzero `N`. -/
noncomputable def torsion {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    FiniteFlatCommGroupScheme S :=
  sorry

theorem torsion_finrank {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    (FiniteFlatCommGroupScheme.structureMap (torsion E N)).finrank = fun _ ↦ N ^ 2 :=
  sorry

/-- Homomorphisms of elliptic curves over a fixed base. The Picard dual is defined on this
carrier, not only on isogenies. -/
noncomputable def Hom {S : Scheme.{u}} (E E' : EllipticCurve S) : Type (u + 1) :=
  sorry

namespace Hom

noncomputable def toSchemeHom {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Hom E E') :
    carrier E ⟶ carrier E' :=
  sorry

/-- Pullback on `Pic⁰`, transported through elliptic autoduality. -/
noncomputable def picardDual {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Hom E E') :
    Hom E' E :=
  sorry

end Hom

end EllipticCurve

/-- Finite locally free surjective homomorphisms of elliptic curves. -/
noncomputable def Isogeny {S : Scheme.{u}} (E E' : EllipticCurve S) : Type (u + 1) :=
  sorry

namespace Isogeny

noncomputable def hom {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Isogeny E E') :
    E.carrier ⟶ E'.carrier :=
  sorry

noncomputable def toEllipticCurveHom {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') : EllipticCurve.Hom E E' :=
  sorry

noncomputable def kernel {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Isogeny E E') :
    FiniteFlatCommGroupScheme S :=
  sorry

/-- An isogeny has constant degree `n` when its kernel has constant finite-flat rank `n`. -/
def IsOfDegree {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Isogeny E E')
    (n : ℕ) : Prop :=
  (FiniteFlatCommGroupScheme.structureMap (kernel f)).finrank = fun _ ↦ n

/-- The dual obtained by factoring `[deg f]` through the quotient by `ker f`. -/
noncomputable def factorizationDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') (n : ℕ) (hdeg : IsOfDegree f n) : Isogeny E' E :=
  sorry

/-- The isogeny obtained by restricting the general Picard dual homomorphism. -/
noncomputable def picardDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') : Isogeny E' E :=
  sorry

theorem toEllipticCurveHom_picardDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') :
    toEllipticCurveHom (picardDual f) =
      EllipticCurve.Hom.picardDual (toEllipticCurveHom f) :=
  sorry

theorem picardDual_eq_factorizationDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') (n : ℕ) (hdeg : IsOfDegree f n) :
    picardDual f = factorizationDual f n hdeg :=
  sorry

/-- The unique public dual, introduced only after the two constructions have been compared. -/
noncomputable def dual {S : Scheme.{u}} {E E' : EllipticCurve S} (f : Isogeny E E') :
    Isogeny E' E :=
  picardDual f

/-- The Poincaré/Cartier–Nishi pairing for an isogeny and its dual. -/
noncomputable def kernelPairing {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') : GroupSchemePairing (kernel f) (kernel (dual f)) :=
  sorry

/-- Scheme-theoretic Cartier–Nishi perfection of the kernel pairing. -/
noncomputable def kernelDualEquivCartierDual {S : Scheme.{u}} {E E' : EllipticCurve S}
    (f : Isogeny E E') :
    FiniteFlatCommGroupScheme.Iso (kernel (dual f))
      (FiniteFlatCommGroupScheme.cartierDual (kernel f)) :=
  sorry

end Isogeny

/-! The relative Picard object below is deliberately owned here: the current Jacobian Challenge
contract supplies the general line-bundle and cohomology foundations but its Picard-scheme endpoint
is stated only over a field. -/

/-- The degree-zero relative Picard scheme of an elliptic curve, with its structure map to `S`. -/
noncomputable def picardZero {S : Scheme.{u}} (E : EllipticCurve S) : Over S :=
  sorry

/-- Elliptic autoduality, with the sign convention fixed in the roadmap. -/
noncomputable def ellipticCurveIsoPicardZero {S : Scheme.{u}} (E : EllipticCurve S) :
    E.toOver ≅ picardZero E :=
  sorry

/-- The Weil pairing on `E[N]`, after identifying the Picard and factorisation duals. -/
noncomputable def weilPairing {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    GroupSchemePairing (E.torsion N) (E.torsion N) :=
  sorry

/-! ## Drinfeld structures and the moduli carriers -/

/-- Katz–Mazur `A`-structures for a finite abelian group `A`. -/
noncomputable def AStructure {S : Scheme.{u}} (A : Type u) [Fintype A] [AddCommGroup A]
    (G : FiniteFlatCommGroupScheme S) : Type (u + 1) :=
  sorry

/-- Katz–Mazur `A`-generators. -/
noncomputable def AGenerator {S : Scheme.{u}} (A : Type u) [Fintype A] [AddCommGroup A]
    (G : FiniteFlatCommGroupScheme S) : Type (u + 1) :=
  sorry

noncomputable def GammaFullStructure {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    Type (u + 1) :=
  sorry

noncomputable def GammaOneStructure {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    Type (u + 1) :=
  sorry

noncomputable def BalancedGammaOneStructure {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    Type (u + 1) :=
  sorry

noncomputable def GammaZeroStructure {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] :
    Type (u + 1) :=
  sorry

/-- The groupoid of elliptic curves over a fixed base. -/
abbrev EllGroupoid (S : Scheme.{u}) := EllipticCurve S

noncomputable instance ellGroupoid (S : Scheme.{u}) : Groupoid (EllGroupoid S) :=
  sorry

/-- Groupoid-valued moduli problems over `Ell/R`. -/
noncomputable def ModuliProblem (R : CommRingCat.{u}) : Type (u + 1) :=
  sorry

namespace ModuliProblem

/-- The isomorphism-class presheaf associated to a groupoid-valued moduli problem. -/
noncomputable def isomClasses {R : CommRingCat.{u}} (P : ModuliProblem R)
    (T : Over (Spec R)) : Type (u + 1) :=
  sorry

/-- Data exhibiting a quotient in the sense of KM 7.1, including Q1 and the rigidified scheme
quotient condition Q2. It is not the objectwise orbit presheaf. -/
noncomputable def QuotientData {R : CommRingCat.{u}} (P : ModuliProblem R)
    (H : Type u) [Finite H] [Group H] : Type (u + 1) :=
  sorry

noncomputable def QuotientData.quotient {R : CommRingCat.{u}} {P : ModuliProblem R}
    {H : Type u} [Finite H] [Group H] (Q : QuotientData P H) : ModuliProblem R :=
  sorry

end ModuliProblem

/-! ## Chapter 5 and Chapter 6 interfaces -/

/-- The four Katz–Mazur regularity axioms, bundled with the nonemptiness and prime hypotheses
required by the Axiomatic Regularity Theorem. -/
noncomputable def RegularityAxioms (P : ModuliProblem (CommRingCat.of ℤ)) (p : ℕ)
    [Fact p.Prime] :
    Type (u + 1) :=
  sorry

/-- The universal deformation of an elliptic curve over an algebraically closed field of
characteristic `p`. -/
noncomputable def UniversalEllipticDeformation {k : Type u} [Field k] [IsAlgClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p]
    (E : EllipticCurve (Spec (CommRingCat.of k))) : Type (u + 1) :=
  sorry

/-- The Barsotti–Tate group `E[p∞]`. -/
noncomputable def EllipticCurve.pDivisibleGroup {S : Scheme.{u}} (E : EllipticCurve S) (p : ℕ)
    [Fact p.Prime] :
    Type (u + 1) :=
  sorry

/-- The groupoid of marked deformations of `E` over complete local noetherian `W(k)`-algebras. -/
noncomputable def EllipticDeformationGroupoid {k : Type u} [Field k] [IsAlgClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p]
    (E : EllipticCurve (Spec (CommRingCat.of k))) : Type (u + 1) :=
  sorry

noncomputable instance ellipticDeformationGroupoidGroupoid {k : Type u} [Field k] [IsAlgClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p]
    (E : EllipticCurve (Spec (CommRingCat.of k))) :
    Groupoid (EllipticDeformationGroupoid p E) :=
  sorry

/-- The groupoid of marked deformations of the Barsotti–Tate group `E[p∞]`. -/
noncomputable def PDivisibleDeformationGroupoid {k : Type u} [Field k] [IsAlgClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p]
    (E : EllipticCurve (Spec (CommRingCat.of k))) : Type (u + 1) :=
  sorry

noncomputable instance pDivisibleDeformationGroupoidGroupoid {k : Type u} [Field k]
    [IsAlgClosed k] (p : ℕ) [Fact p.Prime] [CharP k p]
    (E : EllipticCurve (Spec (CommRingCat.of k))) :
    Groupoid (PDivisibleDeformationGroupoid p E) :=
  sorry

/-- The Serre–Tate equivalence for marked deformation groupoids. Structured versions for the
three elementary level problems are separate declarations. -/
noncomputable def serreTateEquiv {k : Type u} [Field k] [IsAlgClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p]
    (E : EllipticCurve (Spec (CommRingCat.of k))) :
    EllipticDeformationGroupoid p E ≌ PDivisibleDeformationGroupoid p E :=
  sorry

/-- The parameter space of all degree-`N` quotient isogenies, before cyclicity is imposed. -/
noncomputable def NIsog {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Over S :=
  sorry

/-- The generator scheme `G×`. -/
noncomputable def generatorScheme {S : Scheme.{u}} (G : FiniteFlatCommGroupScheme S) : Over S :=
  sorry

/-- The cyclicity locus as an object over `[N-Isog]`, constructed only after KM Chapters 5–6. -/
noncomputable def cyclicityLocus {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Over (NIsog E N).left :=
  sorry

/-- The cyclicity locus is a closed subscheme of `[N-Isog]`. -/
theorem cyclicityLocus_isClosedImmersion {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ)
    [NeZero N] : IsClosedImmersion (cyclicityLocus E N).hom :=
  sorry

/-- The relative representing scheme for `[Γ₀(N)]`, defined from `cyclicityLocus` only after
the Chapter 5 regularity theorem and Chapter 6 isomorphism theorem. -/
noncomputable def GammaZero {S : Scheme.{u}} (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Over S :=
  sorry

/-!
## Interfaces still awaiting concrete supplier types

The opaque carriers above must be replaced by their mathematical structures, not retained as a
parallel public vocabulary. The next signatures to make concrete are:

1. the pointed local-Weierstrass atlas inside `EllipticCurveGeom`, the chartwise group law, and the
   explicit low-degree cohomology and base-change theorems for `𝒪_E(n[0])`;
2. the universal properties of incidence and equality loci, proper relative divisor implies finite
   locally free, and the subgroup-divisor criterion;
3. functorial Cartier duality, elliptic quotients, the relative Poincaré line bundle using the
   shared invertible-sheaf carrier, elliptic autoduality, both dual composition identities, the
   Cartier–Nishi pairing, alternation, scheme-theoretic perfection, and change of level;
4. exact order, its implication `[N]P=0`, cyclic subgroups, coprime product theorems for
   `A`-structures, and the balanced quotient-isogeny comparison;
5. the pseudofunctorial fields of `ModuliProblem` and the Q1/Q2 fields of `QuotientData`, including
   quantification over every representable étale rigidifier;
6. `Y₁(N)` with its visible `N≥4` hypothesis, `Y_full(N)` and `Y(ρ)` with their visible `N≥3`
   hypotheses, the determinant map and fixed-pairing fibres, and the frame-torsor construction;
7. the fields of `RegularityAxioms`, the Axiomatic Regularity Theorem, universal deformations,
   `p`-divisible groups, Serre–Tate theory, and the three prime-power calculations;
8. the generator-scheme rank criterion, the Axiomatic Isomorphism Theorem, the cyclicity locus,
   and only then the representing scheme for `[Γ₀(N)]`;
9. Katz–Mazur quotient problems, their comparison with fppf sheaf quotients of naive problems after
   inverting `N`, and the separate coarse-moduli construction through a finite étale Galois
   rigidifier.
-/

end TauCetiRoadmap.ModularCurves
