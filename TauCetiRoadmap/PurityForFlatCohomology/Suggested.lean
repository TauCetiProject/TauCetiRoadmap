module

public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Scheme.Basic
public import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
public import TauCeti.AlgebraicGeometry.AffineGroupScheme.MultiplicativeType
public import TauCeti.AlgebraicGeometry.AffineGroupScheme.Torus
public import TauCeti.AlgebraicGeometry.LineBundle.Class
public import TauCeti.RingTheory.RegularLocalRing.Basic

/-!
# Purity for flat cohomology and the conjectures of Gabber: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states, against the
pinned Mathlib and Tau Ceti, the headline theorems of the roadmap that are statable there, each
with `sorry`, together with the few definitions their statements need: the punctured spectrum of a
semilocal ring (README §0.1), Cohen presentations, complete intersections and the virtual
dimension (§1.1), pullback of finite étale schemes (§1.8), and diagonalizable groups, groups of
multiplicative type and tori over a base scheme (§§7.12a, 7.12c). The stated headlines are
Zariski–Nagata purity in virtual dimension `≥ 2` and `≥ 3` (Česnavičius–Scholze, *Purity for flat
cohomology*, Theorem 3.3.1; README §1.8), Gabber's conjecture on the local Picard group of
complete intersections of dimension `≥ 3` and the vanishing of the local Picard group of a regular
local ring (*loc. cit.* Theorem 7.2.1; README §7.6; the vanishing for complete intersections of
dimension `≥ 4` is `localCI_parafactorial` of DeformationAndDerivedPatchingAlgebra §6.9 and is not
restated), together with three classical inputs the roadmap proves: Katz's theorem on
Frobenius-fixed vectors over an algebraically closed field (README §5.6), Auslander's freeness
criterion through endomorphisms (§7.2) and the factoriality of regular local rings (§7.4).
It also states the basic theory of groups of multiplicative type over a base on which the purity
statements for such groups rest (SGA 3, Exposés VIII–X; README §§7.12a–7.12c, 7.12e): the
structure, base change, points and homomorphisms of the diagonalizable group `D_S(M)`, its
smoothness, étaleness, flatness and kernels, the étale-local and fpqc-local characterisations of
groups of multiplicative type, their structure morphisms and base change, the smoothness of tori,
their agreement over a field with the Tau Ceti predicates, the Cartier-dual criterion for finite
groups, and the closedness of subgroups, the kernels and the largest subtorus of a group of
multiplicative type.

The following headline theorems are not statable at the pinned libraries.

* Purity for flat cohomology of complete intersections and of regular local rings
  (*loc. cit.* Theorems 6.2.3 and 6.2.7; README §§6.2, 6.5), Gabber's étale-depth bound and its
  extension to all finite étale coefficients (Theorems 3.2.4 and 6.2.4; §§1.6, 6.3) and global
  purity (Theorem 7.1.2; §7.1). They need fppf (and étale) cohomology with supports, or at least
  restriction maps on fppf cohomology of a scheme along an open immersion. Mathlib's
  `CategoryTheory.Sheaf.cohomologyPresheaf` requires its input sheaf to take values in
  `AddCommGrpCat.{v}`, `v` the universe of the site's morphisms, with a sheafification instance at
  that coefficient universe, which the big fppf and étale sites lack at the pin (its output universe
  `w′` is a separate parameter); `CategoryTheory.Sheaf.H` has no restriction maps; and there is no functor from commutative
  group schemes to abelian fppf sheaves.
* The crystalline key formula with supports over perfect schemes (Theorem 4.1.8, (4.1.8.2);
  §2.1): it needs, in addition, the crystalline Dieudonné module of a finite locally free group
  over a perfect scheme, which PrismaticCohomologyPartIII §6.0 constructs.
* The supports, nilpotent invariance and consequences of `p`-adic continuity for flat cohomology
  of animated rings (Corollaries 5.2.9, 5.2.10, 5.3.7 and 5.3.8; §§3.2–3.4), excision along
  finitely generated ideals (Theorem 5.4.4 and Corollary 5.4.5; §3.5) and fpqc hyperdescent and
  descent modulo `p` (Theorem 5.5.2 and Corollary 5.5.3; §3.6): there are no animated rings, no
  points of a group scheme with values in an animated ring and no fppf cohomology over them.
* The key formula and purity for perfectoid rings (Theorems 6.1.1 and 6.1.2; §§5.9, 5.10) and
  `p`-complete arc descent of flat cohomology (Theorem 5.5.1; §5.8): they need, in addition,
  prismatic Dieudonné modules of finite locally free group schemes and the `p`-complete arc site.
* Purity for torsors and gerbes under finite locally free groups (Theorem 7.1.3; §7.3): there are
  no torsors under, or gerbes banded by, a finite locally free group scheme over a scheme.
* Gabber's conjecture on the local Brauer group (Theorem 7.2.5; §7.12) and purity for the
  Brauer group of regular schemes with the codimension-one and residue descriptions
  (Česnavičius, *Purity for the Brauer group*, Theorems 1.1–1.3; §§8.1, 8.7, 8.10, 8.16): there is
  no Brauer group of Azumaya algebras on a scheme and no étale cohomology of `𝔾_m` with
  restriction maps.
* Purity for groups of multiplicative type and for tori (Theorems 7.2.8–7.2.9; Česnavičius,
  Theorems 1.4 and 6.1; §§7.14, 7.15, 8.3, 8.6): the groups are defined below (§7.12c), but the
  statements need the fppf and étale cohomology of a group over a scheme with restriction maps, as
  in the first item.
* The character sheaf of a group over a scheme and the anti-equivalence between groups of
  multiplicative type and twisted constant sheaves of finite type (SGA 3, Exposé X, §5; §7.12d),
  with the correspondence between subgroups of multiplicative type and quotients of the character
  sheaf and the cocharacter sheaf of a torus (§7.12e(b)–(c)): abelian sheaves on the big étale site
  of a scheme exist, but there is no constant sheaf of a group on it at the pin (Mathlib builds
  constant sheaves by sheafification, missing at that coefficient universe as in the first item), so
  twisted constant sheaves are not available. The consequences of §7.12e that need no sheaves are
  stated.
* Picard groups of global complete intersections (Corollary 7.2.3; §7.8): the grading on the
  quotient of a polynomial ring by a homogeneous ideal exists
  (`TauCeti.GradedAlgebra.gradedAlgebraQuotientPiece`), so the global complete intersection is
  available as a `Proj`, but its twisting line bundle `𝒪(1)` and that bundle's class in
  `TauCeti.AlgebraicGeometry.LineBundleClass` are not.
* The fundamental-group clauses of Theorem 3.3.1: finite étale schemes over a connected scheme are
  not given the structure of a Galois category with a fibre functor.
-/

universe u v

@[expose] public section

namespace TauCetiRoadmap.PurityForFlatCohomology

noncomputable section

open AlgebraicGeometry CategoryTheory IsLocalRing
open scoped CategoryTheory.MonObj

/-! ## Layer 0: Punctured spectra, flat cohomology with supports and Hartogs extension -/

/-- The **punctured spectrum** of a semilocal ring `R`: the open subscheme of `Spec R`
complementary to the zero locus of the Jacobson radical, that is, `Spec R` with its finitely
many closed points removed (Česnavičius, *Purity for the Brauer group*, §1.5). For a local ring
it is `Spec R ∖ {𝔪}`, the punctured spectrum of LocalPurity §1.1. README §0.1. -/
def puncturedSpectrum (R : Type u) [CommRing R] : (Spec (.of R)).Opens where
  carrier := (PrimeSpectrum.zeroLocus (Ring.jacobson R : Set R))ᶜ
  is_open' := (PrimeSpectrum.isClosed_zeroLocus _).isOpen_compl

/-! ## Layer 1: Virtual dimension, étale depth and Zariski–Nagata purity -/

/-- A **Cohen presentation** of a local ring `(R, 𝔪)`: a regular local ring with a surjection
onto the `𝔪`-adic completion of `R`. By Cohen's structure theorem every Noetherian local ring has
one (Česnavičius–Scholze §3.2.1). README §1.1. -/
structure CohenPresentation (R : Type u) [CommRing R] [IsLocalRing R] where
  /-- The regular local ring of the presentation. -/
  ring : Type u
  /-- Its ring structure. -/
  [commRing : CommRing ring]
  /-- It is a regular local ring. -/
  [isRegularLocalRing : IsRegularLocalRing ring]
  /-- The map onto the `𝔪`-adic completion of `R`. -/
  toCompletion : ring →+* AdicCompletion (maximalIdeal R) R
  /-- The map is surjective. -/
  surjective : Function.Surjective toCompletion

attribute [instance] CohenPresentation.commRing CohenPresentation.isRegularLocalRing

/-- A local ring is a **complete intersection** if its `𝔪`-adic completion is the quotient of a
regular local ring by an ideal generated by a regular sequence (Bruns–Herzog, Definition 2.3.1;
Česnavičius–Scholze §1.4): the absolute local complete intersection of
DeformationAndDerivedPatchingAlgebra §3.4 in Lean form, whose theory (independence of the regular
presentation, Cohen–Macaulayness, the flat-local criterion) that roadmap owns. It is used only for
Noetherian local rings; for a non-Noetherian one the value is not used. README §1.1. -/
def IsCompleteIntersection (R : Type u) [CommRing R] [IsLocalRing R] : Prop :=
  ∃ (P : CohenPresentation R) (rs : List P.ring),
    RingTheory.Sequence.IsWeaklyRegular P.ring rs ∧ RingHom.ker P.toCompletion = Ideal.ofList rs

/-- The **virtual dimension** of a local ring `R`: for a Cohen presentation `B ↠ R̂` with kernel
`I`, the integer `dim B − μ(I)`, where `dim B` is the minimal number of generators of the maximal
ideal of the regular ring `B` and `μ(I)` that of `I`. It does not depend on the presentation
(SGA 2, Exposé XIV, Proposition 5.2), so the infimum over all presentations is this common value;
it may be negative. It is used only for Noetherian local rings; for a non-Noetherian one the value
is not used. Česnavičius–Scholze (3.2.1.1). README §1.1. -/
def virtualDimension (R : Type u) [CommRing R] [IsLocalRing R] : ℤ :=
  sInf {n : ℤ | ∃ P : CohenPresentation R,
    n = ((maximalIdeal P.ring).spanFinrank : ℤ) - ((RingHom.ker P.toCompletion).spanFinrank : ℤ)}

/-- Pullback of finite étale schemes along a morphism `f : Y ⟶ X`, as Mathlib's
`MorphismProperty.Over.pullback` for the property "finite and étale": the restriction functor
`FEt.pullback` of LocalPurity §1.1, restated here because a roadmap's file does not import another
roadmap's module. README §1.8. -/
def finiteEtalePullback {X Y : Scheme.{u}} (f : Y ⟶ X) :
    MorphismProperty.Over (@IsFinite ⊓ @Etale : MorphismProperty Scheme.{u}) ⊤ X ⥤
      MorphismProperty.Over (@IsFinite ⊓ @Etale : MorphismProperty Scheme.{u}) ⊤ Y := by
  letI : (@IsFinite ⊓ @Etale : MorphismProperty Scheme.{u}).IsStableUnderBaseChange :=
    MorphismProperty.IsStableUnderBaseChange.inf
  exact MorphismProperty.Over.pullback (@IsFinite ⊓ @Etale) ⊤ f

/-- **Zariski–Nagata purity in virtual dimension `≥ 2`.** For a Noetherian local ring `R` of
virtual dimension at least `2`, pullback from finite étale schemes over `Spec R` to finite étale
schemes over the punctured spectrum is fully faithful, and the punctured spectrum is connected.
Česnavičius–Scholze, Theorem 3.3.1(a). README §1.8. -/
theorem zariskiNagata_full_faithful_connected (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (h : 2 ≤ virtualDimension R) :
    (finiteEtalePullback (puncturedSpectrum R).ι).Full ∧
      (finiteEtalePullback (puncturedSpectrum R).ι).Faithful ∧
      ConnectedSpace (puncturedSpectrum R) := by
  sorry

/-- **Zariski–Nagata purity in virtual dimension `≥ 3`.** For a Noetherian local ring `R` of
virtual dimension at least `3`, pullback from finite étale schemes over `Spec R` to finite étale
schemes over the punctured spectrum is an equivalence of categories. No excellence, normality or
complete-intersection hypothesis is made. Česnavičius–Scholze, Theorem 3.3.1(b). README §1.8. -/
theorem zariskiNagata_isEquivalence (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (h : 3 ≤ virtualDimension R) :
    (finiteEtalePullback (puncturedSpectrum R).ι).IsEquivalence := by
  sorry

/-! ## Layer 5: Perfectoid rings: Dieudonné modules and the key formula -/

/-- **Katz: Frobenius-fixed vectors over an algebraically closed field.** For an algebraically
closed field `K` of characteristic `p` and a finite-dimensional `K`-vector space `M` with a
bijective Frobenius-semilinear endomorphism `F`, `M` has a basis of `F`-fixed vectors;
equivalently `M^{F=1} ⊗_{𝔽_p} K → M` is an isomorphism. Katz, *p-adic properties of modular
schemes and modular forms*, Proposition 4.1.1 (field case); Česnavičius–Scholze, proof of
Claim 4.2.10.1. README §5.6. -/
theorem frobeniusSemilinear_exists_fixed_basis (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [CharP K p] [IsAlgClosed K]
    (M : Type v) [AddCommGroup M] [Module K M] [FiniteDimensional K M]
    (F : M →ₛₗ[frobenius K p] M) (hF : Function.Bijective F) :
    ∃ b : Module.Basis (Fin (Module.finrank K M)) K M, ∀ i, F (b i) = b i := by
  sorry

/-! ## Layer 7: Global purity and the conjectures of Gabber -/

/-- **Auslander's freeness criterion.** Over a regular local ring `R`, a finitely generated
reflexive module `M` whose endomorphism module is isomorphic to a finite direct sum of copies of
`M` is free. Auslander, *On the purity of the branch locus*, Theorem 1.3, as invoked in
Česnavičius–Scholze, proof of Theorem 7.1.3. README §7.2. -/
theorem free_of_endomorphisms_iso_pi (R : Type u) [CommRing R] [IsRegularLocalRing R]
    (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.IsReflexive R M]
    (r : ℕ) (h : Nonempty ((M →ₗ[R] M) ≃ₗ[R] (Fin r → M))) :
    Module.Free R M := by
  sorry

/-- **Regular local rings are factorial** (Auslander–Buchsbaum). A regular local ring is a unique
factorization domain; it is a domain by `TauCeti.IsRegularLocalRing.isDomain`. Applied to the
strict henselization, which is again regular, it gives geometric factoriality. SGA 2, Exposé XI,
Théorème 3.13(i). README §7.4. -/
theorem isRegularLocalRing_uniqueFactorizationMonoid (R : Type u) [CommRing R]
    [IsRegularLocalRing R] : UniqueFactorizationMonoid R := by
  sorry

/-- **Gabber's conjecture on the local Picard group.** For a Noetherian local ring `R` that is a
complete intersection of dimension at least `3`, the Picard group of the punctured spectrum is
torsion free. Česnavičius–Scholze, Theorem 7.2.1. README §7.6. -/
theorem localPicard_torsion_eq_one (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (hR : IsCompleteIntersection R) (hdim : 3 ≤ ringKrullDim R)
    (x : TauCeti.AlgebraicGeometry.LineBundleClass (puncturedSpectrum R))
    (hx : IsOfFinOrder x) :
    x = 1 := by
  sorry

/-- **The local Picard group of a regular local ring vanishes.** For a regular local ring `R`,
every line bundle on the punctured spectrum is trivial (Auslander–Buchsbaum: `R` is factorial, so a
line bundle on `U_R` is a Weil divisor class of `R`): the regular clause of Česnavičius–Scholze,
Theorem 7.2.1. The clause for complete intersections of dimension `≥ 4` (SGA 2, Exposé XI,
Théorème 3.13(ii)) is `localCI_parafactorial` of DeformationAndDerivedPatchingAlgebra §6.9 and is
not restated. README §7.6. -/
theorem localPicard_subsingleton (R : Type u) [CommRing R] [IsRegularLocalRing R] :
    Subsingleton (TauCeti.AlgebraicGeometry.LineBundleClass (puncturedSpectrum R)) := by
  sorry

/-- The **diagonalizable group** `D_S(M)` of a finitely generated commutative group `M` over a
scheme `S`: the base change along `S → Spec ℤ` of the group `Spec ℤ[M]`, so that over an affine
open `Spec A ⊂ S` it is `Spec A[M]` with every element of `M` group-like. SGA 3, Exposé VIII, 1.1.
README §7.12a. -/
def diagonalizableGroup (S : Scheme.{u}) (M : TauCeti.FGCommGrpCat.{u}) : Grp (Over S) :=
  (Over.pullback (specULiftZIsTerminal.from S)).mapGrp.obj
    (TauCeti.DiagonalizableGroup.groupScheme (ULift.{u} ℤ) M)

/-- The homomorphism `D_S(M) → D_S(N)` induced by a homomorphism `φ : N → M`; on coordinate rings it
is the map `A[N] → A[M]` induced by `φ`. README §7.12a. -/
def diagonalizableGroupMap (S : Scheme.{u}) {M N : TauCeti.FGCommGrpCat.{u}} (φ : N ⟶ M) :
    diagonalizableGroup S M ⟶ diagonalizableGroup S N :=
  (Over.pullback (specULiftZIsTerminal.from S)).mapGrp.map
    (TauCeti.DiagonalizableGroup.groupSchemeMap (ULift.{u} ℤ) φ)

/-- The diagonalizable group `D_S(M)` is commutative. README §7.12a. -/
theorem isCommMonObj_diagonalizableGroup (S : Scheme.{u}) (M : TauCeti.FGCommGrpCat.{u}) :
    IsCommMonObj (diagonalizableGroup S M).X := by
  sorry

/-- The structure morphism of `D_S(M)` is affine, faithfully flat and locally of finite
presentation. SGA 3, Exposé VIII, 2.1. README §7.12a. -/
theorem diagonalizableGroup_affine_faithfullyFlat_finitePresentation (S : Scheme.{u})
    (M : TauCeti.FGCommGrpCat.{u}) :
    IsAffineHom (diagonalizableGroup S M).X.hom ∧ Flat (diagonalizableGroup S M).X.hom ∧
      Surjective (diagonalizableGroup S M).X.hom ∧
      LocallyOfFinitePresentation (diagonalizableGroup S M).X.hom := by
  sorry

/-- Over an affine base `Spec R`, `D_S(M)` is the Tau Ceti group `Spec R[M]`. README §7.12a. -/
theorem diagonalizableGroup_spec_iso (R : Type u) [CommRing R] (M : TauCeti.FGCommGrpCat.{u}) :
    Nonempty (diagonalizableGroup (Spec (CommRingCat.of R)) M ≅
      TauCeti.DiagonalizableGroup.groupScheme R M) := by
  sorry

/-- The formation of `D_S(M)` commutes with base change along every morphism `S′ → S`.
README §7.12a. -/
theorem diagonalizableGroup_pullback_iso {S S' : Scheme.{u}} (f : S' ⟶ S)
    (M : TauCeti.FGCommGrpCat.{u}) :
    Nonempty ((Over.pullback f).mapGrp.obj (diagonalizableGroup S M) ≅
      diagonalizableGroup S' M) := by
  sorry

/-- The points of `D_S(M)` with values in a scheme `T` over `S` are the group homomorphisms from
`M` to the units of `Γ(T, 𝒪_T)`. SGA 3, Exposé VIII, 1.1. README §7.12a. -/
theorem diagonalizableGroup_points_equiv (S : Scheme.{u}) (M : TauCeti.FGCommGrpCat.{u})
    (T : Over S) :
    Nonempty ((T ⟶ (diagonalizableGroup S M).X) ≃* (M →* (Γ(T.left, ⊤))ˣ)) := by
  sorry

/-- **Homomorphisms of diagonalizable groups over a connected base.** Over a connected scheme `S`,
every group homomorphism `D_S(M) → D_S(N)` is induced by a unique homomorphism `N → M`. SGA 3,
Exposé VIII, 1.6. README §7.12a. -/
theorem diagonalizableGroupMap_bijective (S : Scheme.{u}) [ConnectedSpace S]
    (M N : TauCeti.FGCommGrpCat.{u}) :
    Function.Bijective (fun φ : N ⟶ M ↦ diagonalizableGroupMap S φ) := by
  sorry

/-- **Homomorphisms of diagonalizable groups.** Over an arbitrary scheme `S`, the group
homomorphisms `D_S(M) → D_S(N)` are the locally constant functions from `S` to the homomorphisms
`N → M`, the homomorphism induced by `φ` being the constant function `φ`. SGA 3, Exposé VIII, 1.5.
README §7.12a. -/
theorem diagonalizableGroupHom_equiv_locallyConstant (S : Scheme.{u})
    (M N : TauCeti.FGCommGrpCat.{u}) :
    ∃ e : (diagonalizableGroup S M ⟶ diagonalizableGroup S N) ≃ LocallyConstant S (N →* M),
      ∀ φ : N ⟶ M, e (diagonalizableGroupMap S φ) = LocallyConstant.const S φ.hom.hom := by
  sorry

/-- **Smoothness of diagonalizable groups.** `D_S(M)` is smooth over `S` iff the order of the
torsion subgroup of `M` is invertible on `S`. SGA 3, Exposé VIII, 2.1. README §7.12b. -/
theorem smooth_diagonalizableGroup_iff (S : Scheme.{u}) (M : TauCeti.FGCommGrpCat.{u}) :
    Smooth (diagonalizableGroup S M).X.hom ↔
      IsUnit ((Nat.card (CommGroup.torsion M) : Γ(S, ⊤))) := by
  sorry

/-- **Étaleness of diagonalizable groups.** Over a nonempty scheme `S`, `D_S(M)` is étale over `S`
iff `M` is finite of order invertible on `S`. SGA 3, Exposé VIII, 2.1. README §7.12b. -/
theorem etale_diagonalizableGroup_iff (S : Scheme.{u}) [Nonempty S]
    (M : TauCeti.FGCommGrpCat.{u}) :
    Etale (diagonalizableGroup S M).X.hom ↔ Finite M ∧ IsUnit ((Nat.card M : Γ(S, ⊤))) := by
  sorry

/-- **Kernels of homomorphisms of diagonalizable groups.** For every homomorphism `φ : N → M`, the
kernel of `D_S(φ) : D_S(M) → D_S(N)`, the fibre product with the unit section of `D_S(N)`, is
`D_S(M ⧸ φ(N))`, embedded through the quotient map. No injectivity of `φ` is assumed. SGA 3,
Exposé VIII, 3.1. README §7.12b. -/
theorem isPullback_diagonalizableGroupMap_quotient (S : Scheme.{u})
    {M N : TauCeti.FGCommGrpCat.{u}} (φ : N ⟶ M) :
    IsPullback
      (diagonalizableGroupMap S
        (TauCeti.FGCommGrpCat.ofHom (QuotientGroup.mk' φ.hom.hom.range))).hom.hom
      (CartesianMonoidalCategory.toUnit _) (diagonalizableGroupMap S φ).hom.hom
      η[(diagonalizableGroup S N).X] := by
  sorry

/-- For an injective homomorphism `φ : N → M`, the induced homomorphism `D_S(M) → D_S(N)` is
flat. SGA 3, Exposé VIII, 3.2. README §7.12b. -/
theorem flat_diagonalizableGroupMap_of_injective (S : Scheme.{u})
    {M N : TauCeti.FGCommGrpCat.{u}} (φ : N ⟶ M) (hφ : Function.Injective φ.hom.hom) :
    Flat ((Grp.forget (Over S)).map (diagonalizableGroupMap S φ)).left := by
  sorry

/-- For an injective homomorphism `φ : N → M`, the induced homomorphism `D_S(M) → D_S(N)` is
surjective. SGA 3, Exposé VIII, 3.2. README §7.12b. -/
theorem surjective_diagonalizableGroupMap_of_injective (S : Scheme.{u})
    {M N : TauCeti.FGCommGrpCat.{u}} (φ : N ⟶ M) (hφ : Function.Injective φ.hom.hom) :
    Surjective ((Grp.forget (Over S)).map (diagonalizableGroupMap S φ)).left := by
  sorry

/-- A group over `S` is **diagonalizable** if it is isomorphic to `D_S(M)` for some finitely
generated commutative group `M`. README §7.12c. -/
def IsDiagonalizable {S : Scheme.{u}} (G : Grp (Over S)) : Prop :=
  ∃ M : TauCeti.FGCommGrpCat.{u}, Nonempty (G ≅ diagonalizableGroup S M)

/-- A group over `S` is **of multiplicative type** (of finite type) if it becomes diagonalizable
after base change to the members of some fppf cover of `S`, the character group being allowed to
vary with the member. SGA 3, Exposé IX, 1.1. README §7.12c. -/
def IsMultiplicativeType {S : Scheme.{u}} (G : Grp (Over S)) : Prop :=
  ∃ 𝒰 : Scheme.Cover.{u} Scheme.fppfPrecoverage S,
    ∀ i, IsDiagonalizable ((Over.pullback (𝒰.f i)).mapGrp.obj G)

/-- A group over `S` is a **torus** if after base change to the members of some fppf cover of `S`
it becomes isomorphic to `D(M)` for a torsion-free, hence free, finitely generated group `M`.
SGA 3, Exposé IX, 1.1. README §7.12c. -/
def IsTorus {S : Scheme.{u}} (G : Grp (Over S)) : Prop :=
  ∃ 𝒰 : Scheme.Cover.{u} Scheme.fppfPrecoverage S, ∀ i, ∃ M : TauCeti.FGCommGrpCat.{u},
    IsMulTorsionFree M ∧
      Nonempty ((Over.pullback (𝒰.f i)).mapGrp.obj G ≅ diagonalizableGroup (𝒰.X i) M)

/-- **Groups of multiplicative type are étale-locally diagonalizable.** SGA 3, Exposé X, 4.5.
README §7.12c. -/
theorem isMultiplicativeType_iff_exists_etaleCover {S : Scheme.{u}} (G : Grp (Over S)) :
    IsMultiplicativeType G ↔ ∃ 𝒰 : Scheme.Cover.{u} Scheme.etalePrecoverage S,
      ∀ i, IsDiagonalizable ((Over.pullback (𝒰.f i)).mapGrp.obj G) := by
  sorry

/-- Diagonalizability fpqc-locally on the base already gives multiplicative type, so the fppf
definition agrees with the fpqc definition of SGA 3. SGA 3, Exposé IX, 1.1, and Exposé X, 4.5.
README §7.12c. -/
theorem isMultiplicativeType_iff_exists_fpqcCover {S : Scheme.{u}} (G : Grp (Over S)) :
    IsMultiplicativeType G ↔ ∃ 𝒰 : Scheme.Cover.{u} Scheme.fpqcPrecoverage S,
      ∀ i, IsDiagonalizable ((Over.pullback (𝒰.f i)).mapGrp.obj G) := by
  sorry

/-- Being of multiplicative type is stable under base change along every morphism `S′ → S`.
README §7.12c. -/
theorem IsMultiplicativeType.pullback {S S' : Scheme.{u}} (f : S' ⟶ S) {G : Grp (Over S)}
    (hG : IsMultiplicativeType G) : IsMultiplicativeType ((Over.pullback f).mapGrp.obj G) := by
  sorry

/-- A group of multiplicative type is commutative. README §7.12c. -/
theorem IsMultiplicativeType.isCommMonObj {S : Scheme.{u}} {G : Grp (Over S)}
    (hG : IsMultiplicativeType G) : IsCommMonObj G.X := by
  sorry

/-- The structure morphism of a group of multiplicative type is affine, faithfully flat and locally
of finite presentation. README §7.12c. -/
theorem IsMultiplicativeType.affine_faithfullyFlat_finitePresentation {S : Scheme.{u}}
    {G : Grp (Over S)} (hG : IsMultiplicativeType G) :
    IsAffineHom G.X.hom ∧ Flat G.X.hom ∧ Surjective G.X.hom ∧
      LocallyOfFinitePresentation G.X.hom := by
  sorry

/-- A torus is smooth over its base. README §7.12c. -/
theorem IsTorus.smooth {S : Scheme.{u}} {G : Grp (Over S)} (hG : IsTorus G) :
    Smooth G.X.hom := by
  sorry

/-- Over a field, multiplicative type in the sense of README §7.12c agrees with the Tau Ceti
predicate on affine groups of finite type. -/
theorem isMultiplicativeType_iff_multiplicativeTypeAffineGroupSchemeProperty (k : Type u)
    [Field k] (G : TauCeti.FiniteTypeAffineGroupSchemeCat (CommRingCat.of k)) :
    IsMultiplicativeType G.obj.obj ↔ TauCeti.multiplicativeTypeAffineGroupSchemeProperty k G := by
  sorry

/-- Over a field, tori in the sense of README §7.12c agree with the Tau Ceti predicate on affine
groups of finite type. -/
theorem isTorus_iff_torusAffineGroupSchemeProperty (k : Type u) [Field k]
    (G : TauCeti.FiniteTypeAffineGroupSchemeCat (CommRingCat.of k)) :
    IsTorus G.obj.obj ↔ TauCeti.torusAffineGroupSchemeProperty k G := by
  sorry

/-- **Finite groups of multiplicative type.** A commutative finite locally free group over
`Spec R` is of multiplicative type iff its Cartier dual is étale. README §7.12c. -/
theorem isMultiplicativeType_iff_etale_cartierDual (R : Type u) [CommRing R]
    (G : TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)) :
    IsMultiplicativeType G.obj.obj ↔
      Etale (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G).obj.obj.X.hom := by
  sorry

/-- **Kernels of homomorphisms of groups of multiplicative type** are of multiplicative type: if
`K → G` realizes `K` as the fibre product of `u : G → G′` with the unit section of `G′`, then `K`
is of multiplicative type. SGA 3, Exposé VIII, §3, descended along an étale cover splitting `G`
and `G′`. README §7.12e. -/
theorem isMultiplicativeType_of_isKernel {S : Scheme.{u}} {G G' K : Grp (Over S)}
    (hG : IsMultiplicativeType G) (hG' : IsMultiplicativeType G') (u : G ⟶ G') (i : K ⟶ G)
    (h : IsPullback i.hom.hom (CartesianMonoidalCategory.toUnit K.X) u.hom.hom η[G'.X]) :
    IsMultiplicativeType K := by
  sorry

/-- **Subgroups of multiplicative type are closed.** A homomorphism of groups of multiplicative
type whose underlying morphism of schemes is a monomorphism is a closed immersion. README §7.12e. -/
theorem isClosedImmersion_of_mono {S : Scheme.{u}} {H G : Grp (Over S)}
    (hH : IsMultiplicativeType H) (hG : IsMultiplicativeType G) (u : H ⟶ G)
    [Mono u.hom.hom.left] : IsClosedImmersion u.hom.hom.left := by
  sorry

/-- **The largest subtorus.** A group of multiplicative type `G` has a closed subtorus through which
every homomorphism from a torus to `G` factors uniquely; its character sheaf is the quotient of that
of `G` by its torsion. README §7.12e. -/
theorem exists_largestSubtorus {S : Scheme.{u}} {G : Grp (Over S)}
    (hG : IsMultiplicativeType G) :
    ∃ (T : Grp (Over S)) (i : T ⟶ G), IsTorus T ∧ IsClosedImmersion i.hom.hom.left ∧
      ∀ (T' : Grp (Over S)) (i' : T' ⟶ G), IsTorus T' → ∃! f : T' ⟶ T, f ≫ i = i' := by
  sorry

end

end TauCetiRoadmap.PurityForFlatCohomology
