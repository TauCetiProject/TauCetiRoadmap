module

public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.SplitTorus.Scheme
public import TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum
public import TauCeti.AlgebraicGeometry.LineBundle.Class
public import TauCeti.AlgebraicGeometry.ProjectiveSpectrum.PolynomialQuotient
public import TauCeti.AlgebraicGeometry.ProjectiveSpectrum.TwistingSheaf.LocalTriviality
public import TauCeti.AlgebraicGeometry.Sites.Big.StructureSheaf
public import TauCeti.RingTheory.GradedAlgebra.HomogeneousLocalization.Dehomogenization
public import TauCeti.RingTheory.RegularLocalRing.Basic

/-!
# Purity for flat cohomology and the conjectures of Gabber: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states, against the
pinned Mathlib and Tau Ceti, the headline theorems of the roadmap that are statable there, each
with `sorry`, together with the few definitions their statements need: Cohen presentations,
complete intersections and the virtual dimension (README §1.1), the inclusion of an open subscheme
as a morphism of the small étale site and the abelian sheaf `V ↦ Hom_S(V, G)` on the small étale
site of a commutative group `G` over a scheme `S` (§6.3), the class of the twisting sheaf `𝒪(1)` on
the projective spectrum of a quotient of a polynomial ring (§7.8), tori over a scheme (§7.12c), the
sheaf `𝔾_m` on the small étale site, obtained from Tau Ceti's big-site sheaf
`AlgebraicGeometry.Scheme.Gm` (README Convention 7), and fields of dimension at most one (§8.2(d)).
The punctured spectrum of a local ring and restriction of finite étale schemes to it
are Tau Ceti's `TauCeti.IsLocalRing.puncturedSpectrum` and `TauCeti.IsLocalRing.restrictPunctured`.

The stated headlines are Zariski–Nagata purity in virtual dimension `≥ 2` and `≥ 3`
(Česnavičius–Scholze, *Purity for flat cohomology*, Theorem 3.3.1; README §1.8), Gabber's
conjecture on the local Picard group of complete intersections of dimension `≥ 3` and the
vanishing of the local Picard group of a regular local ring (*loc. cit.* Theorem 7.2.1; README
§7.6; the vanishing for complete intersections of dimension `≥ 4` is `localCI_parafactorial` of
DeformationAndDerivedPatchingAlgebra §6.9 and is not restated), the Picard groups of global
complete intersections (*loc. cit.* Corollary 7.2.3; README §7.8), and Gabber's étale-depth
bound `H^i_𝔪(R, G) = 0` for `i < vdim(R)` for every commutative finite étale `R`-group `G`
(*loc. cit.* Theorem 6.2.4, and Theorem 3.2.4 for `G` of order invertible in `R`;
README §§1.6, 6.3), on the small étale site, where Mathlib's
`CategoryTheory.Sheaf.cohomologyPresheaf` has restriction maps;
purity for the torsion of `H²(−, 𝔾_m)` of Noetherian schemes whose local rings along the removed
closed subset are complete intersections of dimension `≥ 4` or regular of dimension `≥ 2`
(*loc. cit.* Theorem 1.1.4, the case `T = 𝔾_m` of Theorem 7.2.8(b); README §7.14); Česnavičius's
purity for the Brauer group, `H²_ét(U_R, 𝔾_m) = 0` for a strictly henselian regular local ring `R`
of dimension `≥ 2` and its global form for locally Noetherian schemes (Česnavičius, *Purity for the
Brauer group*, Theorems 1.3 and 1.1; README §§8.1, 8.7); and Česnavičius's purity for tori: for
a torus `T` over a henselian regular local ring `R` of dimension `≥ 2` whose residue field has
dimension at most one, `H¹_ét(U_R, T) = H²_ét(U_R, T) = 0`, and for a torus `T` over a scheme `X`
and an open `U ⊆ X` with quasi-compact inclusion along whose complement `X` is regular of
dimension `≥ 2`, restriction `H^q_ét(X, T) → H^q_ét(U, T)` is bijective for `q ≤ 2` and injective
for `q = 3` (*loc. cit.* Theorems 1.4 and 6.1; README §§8.3, 8.6);
together with three classical inputs the roadmap proves: Katz's theorem on Frobenius-fixed vectors
over an algebraically closed field (README §5.6), Auslander's freeness criterion through
endomorphisms (§7.2) and the factoriality of regular local rings (§7.4). The fundamental-group
clauses of Theorem 3.3.1 are equivalent, through Tau Ceti's Galois category of finite étale schemes
over a connected scheme and Mathlib's `CategoryTheory.PreGaloisCategory.functorToContAction`
(SGA 1, Exposé V, 6.9–6.10), to the clauses on the restriction functor stated here, and are not
restated.

The following headline theorems are not statable at the pinned libraries.

* Purity for flat cohomology of complete intersections and of regular local rings
  (*loc. cit.* Theorems 6.2.3 and 6.2.7; README §§6.2, 6.5) and global purity (Theorem 7.1.2;
  §7.1). They need fppf cohomology with supports, or at least restriction maps on fppf cohomology
  of a scheme along an open immersion. Mathlib's `CategoryTheory.Sheaf.cohomologyPresheaf`
  requires its input sheaf to take values in `AddCommGrpCat.{v}`, `v` the universe of the site's
  morphisms, with a sheafification instance at that coefficient universe, which the big fppf site
  lacks at the pin (its output universe `w′` is a separate parameter); and `CategoryTheory.Sheaf.H`
  has no restriction maps. The coefficients exist: for a commutative group `G` over `S`,
  `homPresheaf G` is a sheaf on the big fppf site of `S`, Mathlib's fppf topology being
  subcanonical. Small-étale cohomology, which has restriction maps, computes fppf cohomology only
  for smooth `G` (SchemeAndStackFoundations §2.10), and finite flat `G` such as `μ_p` and `α_p`
  in characteristic `p` are not smooth (last item).
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
* Purity for torsors and gerbes under finite locally free groups (Theorem 7.1.3; §7.3): Tau Ceti has
  torsors under a sheaf of groups on a site (`CategoryTheory.Sheaf.Torsor`), and a group `G` over `X`
  gives such a sheaf `Hom(−, G)` (`CategoryTheory.yonedaGrpObj`) on the big fppf site of `X`, which is
  subcanonical (`CategoryTheory.GrothendieckTopology.subcanonical_over`); but neither pin restricts
  torsors along a morphism of sites, such as the inclusion of `X ∖ Z` into `X`, and neither has
  gerbes.
* Gabber's conjecture on the local Brauer group (Theorem 7.2.5; §7.12): there is no Brauer group of
  Azumaya algebras on a scheme. Its cohomological form `H²(R, 𝔾_m)_tors ≅ H²(U_R, 𝔾_m)_tors` is the
  case `X = Spec R`, `U = U_R` of `etaleCohomology_two_gm_torsion_purity`.
* The description of `H²(X, 𝔾_m)` as an intersection over codimension-one points and the residue
  sequences (Česnavičius, Theorems 1.2 and 6.2; §§8.9, 8.10, 8.15, 8.16): the maps
  `H²(X, 𝔾_m) → H²(𝒪_{X,x}, 𝔾_m) → H²(K, 𝔾_m)` are pullbacks along `Spec 𝒪_{X,x} → X` and
  `Spec K → X`, which are not morphisms of the small étale site of `X`, and the pins have no pullback
  of small-étale cohomology along a morphism of schemes.
* Purity for groups of multiplicative type (Theorems 7.2.8–7.2.9; §§7.14, 7.15): these are
  statements on fppf cohomology of a group `T` of multiplicative type (README §7.12c) that need not
  be smooth, which small-étale cohomology does not compute. Over `R = 𝔽_p⟦x⟧` every étale
  `R`-scheme is reduced, so `μ_p` has only the trivial section there and `H¹_ét(R, μ_p) = 0`, while
  `H¹_fppf(R, μ_p) = R^×/R^{×p}` contains the nonzero class of `1 + x`; restriction maps on fppf
  cohomology are what the first item lacks. For tori, which are smooth, Česnavičius's
  Theorems 1.4 and 6.1 are stated here. The degree-two torsion clause of Theorem 7.2.8(b) for
  `T = 𝔾_m`, which the source states separately as Theorem 1.1.4, is
  `etaleCohomology_two_gm_torsion_purity`.
-/

universe u v

@[expose] public section

namespace TauCetiRoadmap.PurityForFlatCohomology

noncomputable section

open AlgebraicGeometry CategoryTheory IsLocalRing

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

/-- **Zariski–Nagata purity in virtual dimension `≥ 2`.** For a Noetherian local ring `R` of
virtual dimension at least `2`, restriction of finite étale schemes over `Spec R` to the punctured
spectrum `Spec R ∖ {𝔪}` (Tau Ceti `TauCeti.IsLocalRing.restrictPunctured`) is fully faithful, and
the punctured spectrum is connected. Česnavičius–Scholze, Theorem 3.3.1(a). README §1.8. -/
theorem zariskiNagata_full_faithful_connected (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (h : 2 ≤ virtualDimension R) :
    (TauCeti.IsLocalRing.restrictPunctured R).Full ∧
      (TauCeti.IsLocalRing.restrictPunctured R).Faithful ∧
      ConnectedSpace (TauCeti.IsLocalRing.puncturedSpectrum R) := by
  sorry

/-- **Zariski–Nagata purity in virtual dimension `≥ 3`.** For a Noetherian local ring `R` of
virtual dimension at least `3`, restriction of finite étale schemes over `Spec R` to the punctured
spectrum is an equivalence of categories. No excellence, normality or complete-intersection
hypothesis is made. Česnavičius–Scholze, Theorem 3.3.1(b). README §1.8. -/
theorem zariskiNagata_isEquivalence (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (h : 3 ≤ virtualDimension R) :
    (TauCeti.IsLocalRing.restrictPunctured R).IsEquivalence := by
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

/-! ## Layer 6: Purity for complete intersections and regular local rings -/

/-- The inclusion `U → X` of an open subscheme, an open immersion and hence étale, as a morphism of
the small étale site of `X` from `U` to the terminal object `X`. Restriction of étale cohomology from
`X` to `U` is the map of cohomology presheaves along it; for `U` the punctured spectrum `U_R` of a
local ring (Tau Ceti `TauCeti.IsLocalRing.puncturedSpectrum`) it is restriction from `Spec R` to
`U_R`. README §6.3. -/
def openEtaleHom {X : Scheme.{u}} (U : X.Opens) :
    Scheme.Etale.mk U.ι ⟶ Scheme.Etale.mk (𝟙 X) :=
  (Scheme.Etale.forget _).preimage (Over.homMk U.ι (by simp))

open MonObj in
/-- The presheaf `T ↦ Hom_S(T, G)` on schemes over `S` of a commutative group `G` over `S` (a
commutative group object of `Over S`), with the pointwise group law of `Hom(T, G)` (Mathlib's
`CategoryTheory.Hom.commGroup`) written additively; restriction along `T′ → T` is precomposition,
a homomorphism by `CategoryTheory.MonObj.comp_one` and `CategoryTheory.MonObj.comp_mul`.
README §6.3. -/
def homPresheaf {S : Scheme.{u}} (G : Over S) [GrpObj G] [IsCommMonObj G] :
    (Over S)ᵒᵖ ⥤ AddCommGrpCat.{u} where
  obj T := AddCommGrpCat.of (Additive (T.unop ⟶ G))
  map f := AddCommGrpCat.ofHom
    { toFun := fun x ↦ Additive.ofMul (f.unop ≫ x.toMul)
      map_zero' := MonObj.comp_one f.unop
      map_add' := fun x y ↦ MonObj.comp_mul f.unop x.toMul y.toMul }
  map_id T := by
    refine AddCommGrpCat.hom_ext (AddMonoidHom.ext fun x ↦ ?_)
    exact congrArg Additive.ofMul (Category.id_comp (Additive.toMul x))
  map_comp f g := by
    refine AddCommGrpCat.hom_ext (AddMonoidHom.ext fun x ↦ ?_)
    exact congrArg Additive.ofMul (Category.assoc g.unop f.unop (Additive.toMul x))

/-- The abelian sheaf on the small étale site of `S` of a commutative group `G` over `S`: the
sheafification of the restriction of `homPresheaf G` to the small étale site. That restriction is
already a sheaf, a representable functor being a sheaf for the fpqc topology and étale covers being
fpqc covers, so the value on an étale `V → S` is `Hom_S(V, G)`. For smooth `G` its cohomology is the
fppf cohomology of `G` (SchemeAndStackFoundations §2.10). README §6.3. -/
def smallEtaleSheaf {S : Scheme.{u}} (G : Over S) [GrpObj G] [IsCommMonObj G] :
    Sheaf S.smallEtaleTopology AddCommGrpCat.{u} :=
  (presheafToSheaf S.smallEtaleTopology AddCommGrpCat.{u}).obj
    ((Scheme.Etale.forget S).op ⋙ homPresheaf G)

/-- **Gabber's étale-depth bound.** For a Noetherian local ring `R` and a commutative finite étale
`R`-group `G`, `H^i_𝔪(R, G) = 0` for `i < vdim(R)`. Through the long exact sequence of étale
cohomology with supports in the closed point this says: restriction
`H^i_ét(Spec R, G) → H^i_ét(U_R, G)` to the punctured spectrum is injective for `i < vdim(R)` and
bijective for `i + 1 < vdim(R)`. `G` is finite étale, so étale and fppf cohomology agree. No
complete-intersection or excellence hypothesis is made, and the order of `G` need not be invertible
in `R`; for the constant group `ℤ/n` the sheaf is the constant sheaf `ℤ/n`. Česnavičius–Scholze,
Theorem 6.2.4; for `G` of order invertible in `R`, Theorem 3.2.4. README §§1.6, 6.3. -/
theorem etaleDepth_ge_virtualDimension (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (G : Over (Spec (CommRingCat.of R))) [GrpObj G] [IsCommMonObj G]
    [IsFinite G.hom] [Etale G.hom] (i : ℕ) :
    ((i : ℤ) < virtualDimension R → Function.Injective
      (((smallEtaleSheaf G).cohomologyPresheaf i).map
        (openEtaleHom (TauCeti.IsLocalRing.puncturedSpectrum R)).op)) ∧
    ((i : ℤ) + 1 < virtualDimension R → Function.Bijective
      (((smallEtaleSheaf G).cohomologyPresheaf i).map
        (openEtaleHom (TauCeti.IsLocalRing.puncturedSpectrum R)).op)) := by
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
    (x : TauCeti.AlgebraicGeometry.LineBundleClass (TauCeti.IsLocalRing.puncturedSpectrum R))
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
    Subsingleton
      (TauCeti.AlgebraicGeometry.LineBundleClass (TauCeti.IsLocalRing.puncturedSpectrum R)) := by
  sorry

section GlobalCompleteIntersection

attribute [local instance] MvPolynomial.gradedAlgebra

/-- The class `[𝒪(1)]` in the Picard group (Tau Ceti `LineBundleClass`) of
`X = Proj (k[X₀, …, Xₙ] ⧸ I)` for a homogeneous ideal `I` and a field `k`: the twisting sheaf
`𝒪(1)` (Tau Ceti `AlgebraicGeometry.Proj.twistingSheaf`) is invertible because the standard
charts `D₊(Xⱼ)`, cut out by the degree-one classes of the coordinates, cover `X`. README §7.8. -/
def classTwistingSheafOne {k : Type u} [Field k] {n : ℕ}
    (I : HomogeneousIdeal (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k)) :
    TauCeti.AlgebraicGeometry.LineBundleClass (Proj I.quotientGrading) :=
  TauCeti.AlgebraicGeometry.LineBundleClass.mk
    ⟨Proj.twistingSheaf I.quotientGrading 1,
      Proj.isInvertible_twistingSheaf_of_iSup_eq_top
        (fun j : ULift.{u} (Fin (n + 1)) ↦ Ideal.Quotient.mk I.toIdeal (MvPolynomial.X j.down))
        (fun j ↦ I.mk_X_mem_quotientGrading j.down)
        (by
          rw [← I.iSup_basicOpen_eq_top]
          exact Equiv.ulift.surjective.iSup_comp fun j ↦
            Proj.basicOpen I.quotientGrading (Ideal.Quotient.mk I.toIdeal (MvPolynomial.X j)))
        1⟩

/-- **Picard groups of global complete intersections of dimension `≥ 2`.** Let `k` be a field and
`X = Proj (k[X₀, …, Xₙ] ⧸ (f₁, …, f_c))` for forms `fᵢ` of positive degree forming a regular
sequence, so that `X ⊂ ℙⁿ_k` is a global complete intersection of dimension `n − c`. If
`n − c ≥ 2`, the quotient `Pic(X) / ℤ·[𝒪(1)]` is torsion free. Česnavičius–Scholze,
Corollary 7.2.3. README §7.8. -/
theorem picard_globalCompleteIntersection_torsion_eq_one {k : Type u} [Field k] {n : ℕ}
    (I : HomogeneousIdeal (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k))
    (fs : List (MvPolynomial (Fin (n + 1)) k)) (hhom : ∀ f ∈ fs, ∃ d, 0 < d ∧ f.IsHomogeneous d)
    (hreg : RingTheory.Sequence.IsWeaklyRegular (MvPolynomial (Fin (n + 1)) k) fs)
    (hI : I.toIdeal = Ideal.ofList fs) (hdim : fs.length + 2 ≤ n)
    (y : TauCeti.AlgebraicGeometry.LineBundleClass (Proj I.quotientGrading) ⧸
      Subgroup.zpowers (classTwistingSheafOne I))
    (hy : IsOfFinOrder y) :
    y = 1 := by
  sorry

/-- **Picard groups of global complete intersections of dimension `≥ 3`** (Grothendieck–Lefschetz).
For a field `k` and a global complete intersection `X = Proj (k[X₀, …, Xₙ] ⧸ (f₁, …, f_c))` as above
with `n − c ≥ 3`, `Pic(X)` is free of rank one with generator `[𝒪(1)]`: the map `ℤ → Pic(X)`,
`m ↦ [𝒪(1)]^m`, is bijective. SGA 2, Exposé XII, Corollaire 3.7; Česnavičius–Scholze,
Corollary 7.2.3. README §7.8. -/
theorem picard_globalCompleteIntersection_bijective_zpow {k : Type u} [Field k] {n : ℕ}
    (I : HomogeneousIdeal (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k))
    (fs : List (MvPolynomial (Fin (n + 1)) k)) (hhom : ∀ f ∈ fs, ∃ d, 0 < d ∧ f.IsHomogeneous d)
    (hreg : RingTheory.Sequence.IsWeaklyRegular (MvPolynomial (Fin (n + 1)) k) fs)
    (hI : I.toIdeal = Ideal.ofList fs) (hdim : fs.length + 3 ≤ n) :
    Function.Bijective (fun m : ℤ ↦ classTwistingSheafOne I ^ m) := by
  sorry

end GlobalCompleteIntersection

/-- A group `T` over a scheme `X` is a **torus** if it is étale-locally a split torus: there are
étale morphisms `fᵢ : Spec Aᵢ → X`, jointly surjective, such that every base change
`T ×_X Spec Aᵢ` is isomorphic, as a group over `Spec Aᵢ`, to the split torus `Spec Aᵢ[ℤ^{rᵢ}]` of
some rank `rᵢ` (Tau Ceti `TauCeti.SplitTorus.groupScheme`), the rank depending on `i`. Through the
étale-local splitting of tori (SGA 3, Exposé X, 4.5) and refinement of an étale cover by affine
opens, this is the torus of SGA 3, Exposé IX, 1.1, defined there through fpqc covers.
README §7.12c. -/
def IsTorus {X : Scheme.{u}} (T : Grp (Over X)) : Prop :=
  ∃ (I : Type u) (A : I → CommRingCat.{u}) (f : ∀ i, Spec (A i) ⟶ X),
    (∀ i, Etale (f i)) ∧ (∀ x : X, ∃ i, x ∈ Set.range (f i).base) ∧
    ∀ i, ∃ r : ℕ, Nonempty ((Over.pullback (f i)).mapGrp.obj T ≅
      TauCeti.SplitTorus.groupScheme (A i) (ULift.{u} (Fin r)))

/-- The sheaf `𝔾_m : V ↦ Γ(V, 𝒪_V)ˣ` (written additively) on the small étale site of a scheme `S`:
the sheafification of the restriction to the small étale site of Tau Ceti's sheaf
`AlgebraicGeometry.Scheme.Gm S` on the big fpqc site over `S`. That restriction is already a sheaf,
étale covers being fpqc covers, so the sheafification map is an isomorphism and the value on an
étale `V → S` is `Γ(V, 𝒪_V)ˣ`. It is the Lean form of SchemeAndStackFoundations §2.9's `GmEtale`;
its cohomology `H^i_ét(V, 𝔾_m)` with restriction maps is `(gmSmallEtale S).cohomologyPresheaf i`.
README Convention 7. -/
def gmSmallEtale (S : Scheme.{u}) : Sheaf S.smallEtaleTopology AddCommGrpCat.{u} :=
  (presheafToSheaf S.smallEtaleTopology AddCommGrpCat.{u}).obj
    ((Scheme.Etale.forget S).op ⋙ (Scheme.Gm S).obj)

/-- **Purity for the torsion of `H²(−, 𝔾_m)`.** Let `X` be a Noetherian scheme and `U ⊆ X` open such
that every local ring `𝒪_{X,z}` at a point `z ∉ U` is either a complete intersection of dimension
`≥ 4` or regular of dimension `≥ 2`. Then restriction `H²_ét(X, 𝔾_m) → H²_ét(U, 𝔾_m)` is a bijection
between the torsion subgroups: it is injective on torsion classes, and every torsion class on `U` is
the restriction of a torsion class on `X`. On a Noetherian scheme a class killed by a locally
constant positive integer is killed by one integer, since there are finitely many connected
components. Česnavičius–Scholze, Theorem 1.1.4, the case `T = 𝔾_m` of Theorem 7.2.8(b).
README §7.14. -/
theorem etaleCohomology_two_gm_torsion_purity (X : Scheme.{u}) [IsNoetherian X] (U : X.Opens)
    (hZ : ∀ z : X, z ∉ U →
      (IsCompleteIntersection (X.presheaf.stalk z) ∧ 4 ≤ ringKrullDim (X.presheaf.stalk z)) ∨
      (IsRegularLocalRing (X.presheaf.stalk z) ∧ 2 ≤ ringKrullDim (X.presheaf.stalk z))) :
    (∀ x, IsOfFinAddOrder x →
        ((gmSmallEtale X).cohomologyPresheaf 2).map (openEtaleHom U).op x = 0 → x = 0) ∧
      ∀ y, IsOfFinAddOrder y → ∃ x, IsOfFinAddOrder x ∧
        ((gmSmallEtale X).cohomologyPresheaf 2).map (openEtaleHom U).op x = y := by
  sorry

/-! ## Layer 8: Purity for the Brauer group and for tori on regular schemes -/

/-- **Purity for the Brauer group of a punctured spectrum.** For a strictly henselian regular local
ring `R` (henselian with separably closed residue field) of dimension at least `2`, the étale
cohomology `H²_ét(U_R, 𝔾_m)` of the punctured spectrum vanishes. Česnavičius, *Purity for the
Brauer group*, Theorem 1.3 (= Theorem 5.3). README §8.1. -/
theorem etaleCohomology_two_gm_puncturedSpectrum_subsingleton (R : Type u) [CommRing R]
    [IsRegularLocalRing R] [HenselianLocalRing R] [IsSepClosed (IsLocalRing.ResidueField R)]
    (h : 2 ≤ ringKrullDim R) :
    Subsingleton (((gmSmallEtale (Spec (CommRingCat.of R))).cohomologyPresheaf 2).obj
      (Opposite.op (Scheme.Etale.mk (TauCeti.IsLocalRing.puncturedSpectrum R).ι))) := by
  sorry

/-- A field `k` is **of dimension at most one** if `H^i_ét(k, G) = 0` for every `i ≥ 2` and every
commutative finite étale `k`-group `G`, and, when `k` has positive characteristic, also
`H²_ét(K, 𝔾_m) = 0` for every finite separable extension `K/k`. The cohomology is that of
`smallEtaleSheaf G` and of `gmSmallEtale` at the terminal object `Spec k`, resp. `Spec K`, of the
small étale site. Česnavičius, *Purity for the Brauer group*, Definition A.1. README §8.2(d). -/
def IsOfDimLEOne (k : Type u) [Field k] : Prop :=
  (∀ (G : Over (Spec (CommRingCat.of k))) [GrpObj G] [IsCommMonObj G] [IsFinite G.hom]
      [Etale G.hom] (i : ℕ), 2 ≤ i →
      Subsingleton (((smallEtaleSheaf G).cohomologyPresheaf i).obj
        (Opposite.op (Scheme.Etale.mk (𝟙 (Spec (CommRingCat.of k))))))) ∧
  (ringChar k ≠ 0 → ∀ (K : Type u) [Field K] [Algebra k K] [FiniteDimensional k K]
      [Algebra.IsSeparable k K],
      Subsingleton (((gmSmallEtale (Spec (CommRingCat.of K))).cohomologyPresheaf 2).obj
        (Opposite.op (Scheme.Etale.mk (𝟙 (Spec (CommRingCat.of K)))))))

/-- **Tori on the punctured spectrum of a henselian regular local ring.** For a henselian regular
local ring `R` of dimension at least `2` whose residue field is of dimension at most one and an
`R`-torus `T`, `H¹_ét(U_R, T) = H²_ét(U_R, T) = 0`. For strictly henselian `R` and `T = 𝔾_m` this is
`Pic(U_R) = 0` together with `etaleCohomology_two_gm_puncturedSpectrum_subsingleton`. Česnavičius,
*Purity for the Brauer group*, Theorem 1.4 (proved in §5.4). README §8.3. -/
theorem etaleCohomology_torus_puncturedSpectrum_subsingleton (R : Type u) [CommRing R]
    [IsRegularLocalRing R] [HenselianLocalRing R]
    (hk : IsOfDimLEOne (IsLocalRing.ResidueField R)) (h : 2 ≤ ringKrullDim R)
    (T : Grp (Over (Spec (CommRingCat.of R)))) [IsCommMonObj T.X] (hT : IsTorus T)
    (q : ℕ) (hq : 1 ≤ q ∧ q ≤ 2) :
    Subsingleton (((smallEtaleSheaf T.X).cohomologyPresheaf q).obj
      (Opposite.op (Scheme.Etale.mk (TauCeti.IsLocalRing.puncturedSpectrum R).ι))) := by
  sorry

/-- **Purity for tori along regular closed subsets of codimension `≥ 2`.** Let `X` be a scheme, `T`
an `X`-torus and `U ⊆ X` an open subscheme whose inclusion is quasi-compact, such that every local
ring `𝒪_{X,z}` at a point `z ∉ U` is regular of dimension `≥ 2`; no regularity is assumed on `U`.
Then restriction `H^q_ét(X, T) → H^q_ét(U, T)` is bijective for `q ≤ 2` and injective for `q = 3`.
Tori are smooth, so this is also fppf cohomology. Česnavičius, *Purity for the Brauer group*,
Theorem 6.1. README §8.6. -/
theorem etaleCohomology_torus_purity (X : Scheme.{u}) (T : Grp (Over X)) [IsCommMonObj T.X]
    (hT : IsTorus T) (U : X.Opens) [QuasiCompact U.ι]
    (hZ : ∀ z : X, z ∉ U → IsRegularLocalRing (X.presheaf.stalk z) ∧
      2 ≤ ringKrullDim (X.presheaf.stalk z)) :
    (∀ q ≤ 2, Function.Bijective
      (((smallEtaleSheaf T.X).cohomologyPresheaf q).map (openEtaleHom U).op)) ∧
    Function.Injective (((smallEtaleSheaf T.X).cohomologyPresheaf 3).map (openEtaleHom U).op) := by
  sorry

/-- **Purity for the Brauer group of regular schemes.** Let `X` be a locally Noetherian scheme and
`U ⊆ X` open such that every local ring `𝒪_{X,z}` at a point `z ∉ U` is regular of dimension `≥ 2`;
no regularity is assumed on `U`. Then restriction `H²_ét(X, 𝔾_m) → H²_ét(U, 𝔾_m)` is bijective and
`H³_ét(X, 𝔾_m) → H³_ét(U, 𝔾_m)` is injective. Česnavičius, *Purity for the Brauer group*,
Theorem 1.1 (= Theorem 6.1 for `T = 𝔾_m`). README §8.7. -/
theorem etaleCohomology_gm_purity_regular (X : Scheme.{u}) [IsLocallyNoetherian X] (U : X.Opens)
    (hZ : ∀ z : X, z ∉ U → IsRegularLocalRing (X.presheaf.stalk z) ∧
      2 ≤ ringKrullDim (X.presheaf.stalk z)) :
    Function.Bijective (((gmSmallEtale X).cohomologyPresheaf 2).map (openEtaleHom U).op) ∧
      Function.Injective (((gmSmallEtale X).cohomologyPresheaf 3).map (openEtaleHom U).op) := by
  sorry

end

end TauCetiRoadmap.PurityForFlatCohomology
