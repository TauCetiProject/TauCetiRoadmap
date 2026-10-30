# Roadmap: Scholze’s functor and mod-p cohomology of the Lubin–Tate tower

**Summary.** Build the complete-local-coefficient form of Scholze’s geometric functor, its continuous-cohomology comparisons, and the mod-p multiplicity theory of the Lubin–Tate and Drinfeld towers. Starting from the perfectoid towers, their period maps, equivariant étale sites and smooth representation categories, prove the almost-finiteness and Frobenius arguments, the Cartan–Leray spectral sequence, Fust’s continuous-cohomology theorems, Ludwig’s Borel-quotient vanishing, and the quaternionic global argument. The end theorems are finite length of arithmetic Drinfeld cohomology over ℚ_p, finite geometric multiplicities over every finite extension of ℚ_p, finite length and higher-dimensional vanishing of residual Galois multiplicities, and finiteness of the smooth vectors on the Lubin–Tate side.

## Scope and ownership

This roadmap owns the equivariant-site limit and cohomology refinements in §0.1, the component-action convention comparison in §0.2, complete-local-coefficient cohomological finiteness in §0.3 and Layer 1, Fust’s full-group comparison for locally profinite groups and noncompact continuous induction in §2.1 (extending the compact-open derived-invariant comparison of SmoothRepresentationsOfLocalGroups §SR.0d.2), the continuous-cocycle consequence of Moore’s classification in §2.2, and the tower-specific comparisons and end theorems in Layers 2–6.

The basic Gross–Hopkins torsor, equivariant site, associated sheaf, mod-p functor and admissible O-torsion extension are stated by CompletedCohomologyAndLocalGlobalCompatibility §0.6; they are imported once. Layer 1 differs by allowing every complete noetherian local coefficient ring with finite residue field, and by supplying the strict-image, Frobenius, central-character and twist refinements. The torsor construction itself is not a second target here. Analytic-topology cohomological dimension is stated by HodgeTateAndCanonicalSubgroups §6.36; the local image estimate behind the primitive comparison is the contract gap:local-almost-finite-image of AInfCohomology §AI.3.1; admissibility and compact-group injectivity of the localised definite quaternionic module are stated by CompletedCohomologyAndLocalGlobalCompatibility §1.7(c)–(d); the coefficient-prime local comparison for the characteristic-zero point of §4.2 is HilbertModularVarietiesAndShimuraCurves R18.3.29(c). EndoscopicTransferAndUnitaryTraceComparison §§12.2–12.8, 12.11, 12.14, 12.19 and 12.21 owns the finite towers, period maps, perfectoid limits, EL duality, central quotients, arithmetic descent of the Drinfeld quotient and Stein-cover Mittag–Leffler input; arithmetic descent of the Lubin–Tate quotient is the contract gap:lubin-tate-arithmetic-descent of the same roadmap, recorded below.

The coefficient-linear compact–discrete and Schikhof dualities belong to PadicLocalLanglandsForGL2Qp §§0.1, 0.3. Smoothness, smooth admissibility and the derived smooth category belong to SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4, SR.0d.1–SR.0d.2; bounded O-torsion admissibility and finite-presentation calculus belong to ModpRepresentationsOfGL2OverLocalFields MP.0–MP.1. The generic finite-presentation and finite-length criteria are imported, rather than reproved as part of the tower application. PadicLocalLanglandsForGL2Qp Layers 2–3 and §§5.1–5.4, 6.7–6.8 owns the mod-p classification, Montréal functor, blocks, centres and abstract occurrence theorem. Layer 4 adds the specified global quaternionic instance and its characteristic-zero point.

Moore’s local rank-two covering classification belongs to KTheoryLowDegrees §11.5. Here its continuous-cochain dictionary and the odd-prime degree-two consequence are the targets; stable K₂ does not replace the rank-two theorem. Continuous cohomology, smooth discrete objects, profinite Shapiro maps, their quasi-isomorphism and finite-coefficient dévissage are already in the library as specified below. Continuous induction itself is Mathlib’s `ContRepresentation.coindV` with `ContRepresentation.coind`. Section 2.1 extends the Shapiro comparison to the noncompact, continuously split quotient and prodiscrete coefficients used by the period torsor.

The finite- and infinite-level connected-component theorem belongs to ProetaleCohomologyOfPAdicCurvesAndTowers §7.1; §0.2 here transports its action conventions and computes the scalar-height quotient. The arithmetic finite-presentation theorem for Drinfeld levels belongs to ProetaleCohomologyOfPAdicCurvesAndTowers §§7.2, 7.6–7.7. Its exact contract is recorded below. The passage from that theorem to geometric finite presentation by finite-group coinvariants belongs to §6.2 here. Characteristic-zero factorisation over blocks and Kisin rings belongs to PadicLocalLanglandsForGL2Qp, Part II; it consumes the mod-p end theorems of this roadmap. No finite-length theorem for arithmetic Drinfeld cohomology over arbitrary F is asserted: §6.1 gives the full general-F multiplicity theorem, while the arithmetic finite-length and geometric finite-length theorems have the ℚ_p and odd-prime hypotheses of their sources.

## Conventions

Let p be a prime, F/ℚ_p finite, O_F its integers, ϖ a uniformiser, and F̆ the completed maximal unramified extension. In the rank-r construction r≥1, G=GLᵣ(F) and D/F has invariant 1/r. The integer n≥0 denotes the tower level in the rank-two applications, not its rank. Write Ǧ=Dˣ, Ǧ₀=O_Dˣ and Ǧ_n=1+𝔪_Dⁿ for n≥1. At Lubin–Tate level zero use G₀=GL₂(O_F), and G_n=1+ϖⁿM₂(O_F) only for n≥1. The central quotient G′ is G/⟨ϖI₂⟩. Its generator has determinant ϖ².

The full towers retain all integer quasi-isogeny heights. Write M_∞ for the common Lubin–Tate/Drinfeld infinite level over C=ℂ_p, with EL duality and its action dictionary specified. `M⁽ϖ⁾_{n,K}` is the rank-two arithmetic Drinfeld level modulo the scalar subgroup ⟨ϖI₂⟩; `M_{n,C}` without the superscript is the geometric level without that quotient. The notation `LT⁽ϖ⁾_{n,K}` is its Lubin–Tate counterpart, using the centre of Dˣ. Arbitrary complete algebraically closed C/F̆ is allowed when no canonical Weil action is claimed.

Use a right G-action on the period torsor and a commuting left Dˣ-action. Associated sections satisfy f(xg)=π(g⁻¹)f(x), and Dˣ acts by (df)(x)=f(d⁻¹x). In these conventions zx=xz for a central scalar; in left-G/left-D notation the diagonal centre acts trivially. Let Art_F:W_Fᵃᵇ→Fˣ be inverse to geometric-normalised reciprocity, so Art_F(Φ_geo)=ϖ. Relative to an arithmetic-normalised Artin map, invert its Fˣ value. Thus the degree-zero action is through Nrd(d)Art_F(w)⁻¹. This is the common-central-character convention of DPS23, Lemmas 7.3–7.4, pp. 30–31 (DPS23 line 1387, line 1401).

Let L/ℚ_p be finite, O=O_L, ϖ_L a uniformiser and k=k_L its finite residue field. For general coefficients, (A,𝔪) is a nonzero complete separated noetherian commutative local ring with finite residue field of characteristic p. Smooth A-modules are discrete, have open point stabilisers and are elementwise 𝔪-power torsion. Admissibility means that Vᴷ[𝔪ⁱ] is finite over A/𝔪ⁱ for every compact open K and i≥1. For A=k this means finite-dimensional fixed spaces. The zero coefficient module is included; the zero ring is not a local coefficient ring under these conventions (SCH18, Definition 4.1, p. 18; SCH18 line 792).

Use continuous homogeneous cochains for group cohomology, on discrete or prodiscrete coefficients as indicated. A prodiscrete module is a separated inverse limit of discrete modules, with its inverse-limit topology. Strict exactness includes the induced topology on a kernel and the quotient topology on an image. For a torsion ℤ_p-module V its Pontryagin dual is Hom_cont,ℤ_p(V,ℚ_p/ℤ_p). For O-torsion coefficients use Hom_cont,O(V,L/O); a finite k-space has its k-linear dual. Each carries the contragredient action. A finite free O-lattice has lattice dual Hom_O(λ,O), before tensoring with L/O. These duals are distinguished from the algebraic dual of an infinite prodiscrete space.

For smooth characters χ₁,χ₂:ℚ_pˣ→k̄ˣ put I(χ₁,χ₂)=Ind_B^G(χ₂⊗χ₁ε⁻¹), with unnormalised smooth induction, upper triangular B, and ε the reduction of x↦x|x|. A pair is generic when χ₁χ₂⁻¹ is outside {1,ε,ε⁻¹}. Coefficients may be enlarged to contain its values. Continuous induction uses f(hg)=h f(g) and right translation. Almost mathematics is relative to the maximal ideal of O_C, or of `O_{C♭}` after tilting. Sites are taken in fixed universes with the cardinal cutoffs of DiamondsAndVStacks D0; colimits of levels and covers obey those cutoffs.

**Checks for conventions.**

- In ℚ₅ with δ(5)=1 and δ(2)=2 in 𝔽₅ˣ, replacing a torsor lift x by x·2 multiplies evaluation by 3. Acting by d=2 on S⁰(δ) multiplies it by 2; acting by w with Art(w)=2 multiplies it by 3. Hence the two actions have different inverses, and twisting by δ then δ⁻¹ has scalar 2·3=1.
- For the unramified 𝔽₅-valued character with δ(ϖ)=2 and trivial unit restriction, geometric Frobenius acts on S⁰(δ) by 3 and arithmetic Frobenius by 2; d=ϖ acts by 2. This fixes both the Frobenius direction and the inverse in the Galois factor.
- In rank two, v(det(ϖI₂))=2. Heights 0 and 1 remain distinct after the central quotient. In rank one the height shift is 1. No formula uses r=0 or the non-subgroup 1+M₂(O_F) as level zero.
- The Tate twist is fixed by the Kummer trace H²(ℙ¹_C,k(1))→k sending the class of a degree-one divisor to 1; degree-two divisors give 2, which is 0 when p=2. This is the algebraic trace of EtaleCohomologyFoundations §§0.9, 0.11 with n=p, legitimate because p is invertible on ℙ¹ over the characteristic-zero field C, transported to the analytic side by the proper comparison of ClassicalAdicEtaleCohomology §8.2.
- For a scalar weight u=2 over ℤ₅ the lattice-dual scalar is 1/2, so evaluation has scalar 1. With λ=O, Hom_O(λ,O)⊗L/O=L/O, whereas (L/O)⊗(L/O)=0. The latter cannot model the coefficient system.

## Exact supplier contracts

### From Mathlib

Use the following pinned declarations directly. Module paths are relative to the Mathlib package.

| Declaration | Module | Contract |
|---|---|---|
| `continuousCohomology`, `TopRep.homogeneousCochains` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` | Homology of continuous homogeneous cochains as topological modules; the group topology is retained. |
| `TopRep`, `TopRep.of`, `TopRep.coind₁`, `TopRep.res` | `Mathlib/RepresentationTheory/Continuous/TopRep.lean` | Topological modules with continuous individual operators, continuous-function coinduction and restriction. Joint continuity of the group action is an additional condition. |
| `ContRepresentation.trivial`, `ContRepresentation.toRepresentation` | `Mathlib/RepresentationTheory/Continuous/Basic.lean` | Trivial coefficients and the underlying algebraic representation. |
| `ContRepresentation.coindV`, `ContRepresentation.coind` | `Mathlib/RepresentationTheory/Continuous/Basic.lean` | Continuous coinduction along a continuous homomorphism φ:J→H: the submodule of `C(H,V)` of f with f(φ(j)h)=j·f(h), with the compact-open subspace topology and right-translation H-action. It carries no compact-support condition. |
| `Representation`, `Representation.invariants` | `Mathlib/RepresentationTheory/Basic.lean`, `Mathlib/RepresentationTheory/Invariants.lean` | Linear actions and their fixed submodules. |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` | Small Ext in an abelian category with the required derived-category/Ext hypotheses; it does not select the smooth category. |
| `ContinuousMap`, `LocallyConstant` | `Mathlib/Topology/ContinuousMap/Defs.lean`, `Mathlib/Topology/LocallyConstant/Basic.lean` | Continuous and locally constant section maps. |
| `Field.absoluteGaloisGroup` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` | Automorphisms of the algebraic closure with the Krull topology. |
| `Padic`, `PadicComplex` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean`, `Mathlib/NumberTheory/Padics/Complex.lean` | ℚ_p and the completion of its algebraic closure. |
| `Matrix.SpecialLinearGroup`, `Matrix.SpecialLinearGroup.isTopologicalGroup` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`, `Mathlib/Topology/Algebra/Group/Matrix.lean` | Determinant-one matrices with their subspace topology and topological-group structure. |
| `Matrix.SL2.commutator_eq_top` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | Perfection of SL₂(F) when a≠0 and a²≠1 for a chosen a∈F. Over ℚ_p take a=2, also when p=2 or 3. |
| `PontryaginDual` | `Mathlib/Topology/Algebra/PontryaginDual.lean` | Continuous multiplicative circle-valued characters; coefficient-linear duality is consumed from the supplier below. |
| `FiniteDimensional`, `Set.Finite` | `Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean`, `Mathlib/Basic/Finite/Defs.lean` | Finite-dimensional values and finite support, kept as separate conditions. |
| `LieGroup`, `IsAdicComplete` | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`, `Mathlib/RingTheory/AdicCompletion/Basic.lean` | Analytic group charts and algebraic separated adic completeness for §0.3. |
| `ZMod` | `Mathlib/Data/ZMod/Defs.lean`, `Mathlib/Topology/Instances/ZMod.lean` | Finite discrete coefficients, with the prime hypothesis explicit in the acceptance theorem. |

### From Tau Ceti

`TauCeti.IsSmoothDiscrete` and `TauCeti.ofDiscreteModule` in `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean` supply discreteness and open point stabilisers, and their comparison with jointly continuous discrete actions. `TauCeti.SmoothDiscreteTopRep` is the corresponding full subcategory. `TauCeti.trivialFp` in `TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialFp.lean` is the trivial discrete `ZMod p` coefficient object, with the universe lift required by the native continuous-cohomology complex; it is used directly in Suggested.lean.

`TauCeti.ContinuousCohomology.shapiroIso`, `TauCeti.ContinuousCohomology.quasiIso_shapiroCochainMap` and `TauCeti.ContinuousCohomology.shapiroIsoTopRep` in `TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro/AllDegrees.lean` supply the profinite-group, closed-subgroup, discrete-coefficient case. Their forward map is restriction followed by evaluation. No termwise isomorphism is assumed. `TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology` and `TauCeti.ContCohomology.explicitH2AddEquivContinuousCohomology` in `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean` identify explicit continuous one- and two-cocycles modulo coboundaries, with discrete coefficients and jointly continuous action, with Mathlib’s `continuousCohomology` in degrees one and two; degree two assumes local compactness of the group, which holds for SL₂(ℚ_p). The finite-coefficient reduction `TauCeti.ContinuousCohomology.finite_continuousCohomology_of_isOpen_of_normal_of_prime` in `TauCeti/RepresentationTheory/Homological/ContCohomology/Finiteness.lean` retains its compactness, normality, finite-coefficient and positive-degree input hypotheses.

### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

Section 0.6 supplies the full-rank Gross–Hopkins period torsor, equivariant étale site, basic mod-p sheaf and functor, admissible O-torsion extension, filtered-colimit comparison, admissibility, base-field independence and cohomological bounds. The period map at each compact open K is étale surjective with fibre G/K; at infinite level its diagonal identifies M_∞×G with `M_∞×_{ℙᵣ⁻¹}M_∞` by (x,h)↦(x,xh). The profinite K-torsor has base `M_{LT,K}`; the full G-torsor has base ℙᵣ⁻¹ (SCH18, §§1, 3, pp. 2–3, 10–11; SCH18 line 440).

Sections 1.5–1.7 supply the Shimura-curve and definite quaternionic towers, the ψ-isotypic λ-typical module and its coefficient-lifting/divisibility properties; §1.7(c)–(d) supply admissibility of `S_ψ(U^p,L/O)` and of its localisations, and their injectivity among smooth representations of the compact group at p with the prescribed central character. Section 3.7 supplies its noetherian Hecke algebra and residual localisation. Section 4.12 supplies the ψ,λ,𝔪-compatible comparison S¹(S)=Ĥ¹ and the rank-two Galois isotypy Ĥ¹=ρ_𝔪⊗N, with global non-Eisenstein hypotheses and exchanged quaternionic invariants. It uses §0.6 internally, so this supplier contract has one direction of supply.

**Checks for the imported period torsor.**

- At r=1 its base is ℙ⁰, and a fibre is Fˣ; at level K it is Fˣ/K. Taking K=O_Fˣ gives integer-valued heights, rather than one point.
- At K=GLᵣ(O_F), G/K is the set of O_F-lattices in Fʳ. In rank two the lattices O_F² and ϖO_F⊕O_F give two distinct points of the fibre.
- Simultaneous right translation of the two outputs of (x,h)↦(x,xh) is (x,h)↦(xg,g⁻¹hg). Translation of the second output alone is h↦hk. For g=(12), h=(23) in S₃, g⁻¹hg=(13)≠h; a translation-only dictionary fails.
- The Dˣ-action acts on x alone on M_∞×G. With K′ normal in K, descent over `M_{LT,K}` has finite fibre K/K′, not G/K′.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Sections 12.2–12.8 supply the full formal O_F- and special O_D-module towers, their quasi-isogeny heights, period maps, infinite-level moduli, commuting actions, effective Weil descent and perfectoid limits. Section 12.11 supplies the marked EL duality with the group dictionary. Section 12.14 supplies the rank-two scalar quotient, and §12.19 its arithmetic descent to F for the Drinfeld tower only. What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:lubin-tate-arithmetic-descent): For every finite F/ℚ_p and rank-two level n≥0 (level GL₂(O_F) at n=0, 1+ϖⁿM₂(O_F) for n≥1), the full-height Lubin–Tate level modulo the subgroup ϖ^ℤ of the centre of Dˣ descends effectively from F̆ to F by its Weil cocycle with height translation, compatibly with level maps, the Dˣ/ϖ^ℤ- and GL₂(O_F)-actions and base change to finite K/F; this is the Lubin–Tate counterpart of §12.19, defining `LT⁽ϖ⁾_{n,K}` (CDN23, §4.3.3, p. 48; CDN23 line 2021). Its geometric base change at n=0 is two open discs, one per height class, not two copies of Ω_F; an infinite-level isomorphism does not identify the finite Lubin–Tate and Drinfeld levels. Section 12.21 supplies perfectoid Stein exhaustions, the dense restriction maps and Mittag–Leffler cohomology needed for the inverse-limit topology. The equality of scalar actions and height shift v(det(ϖI₂))=2 must be preserved when transporting these objects.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Sections SR.0.1–SR.0.4 supply the smooth abelian categories, compact-open invariants, admissibility and central characters. Sections SR.0d.1–SR.0d.2 supply their Grothendieck/derived structure, injectives and derived invariants, including the continuous-cohomology comparison for compact open subgroups. Section 2.1 extends that comparison to the whole locally profinite group. Section SR.2.1 supplies smooth and compact induction. The continuous, noncompact-quotient induction comparison of §2.1 uses these carriers and adds the topological cochain comparison.

### From TauCetiRoadmap.ModpRepresentationsOfGL2OverLocalFields

MP.0/torsion-admissibility supplies admissibility for O-torsion representations. MP.0/finite-presentation, MP.0/finiteness-calculus and MP.0/amalgam-coherence supply exact-sequence, finite-index and finite-group coinvariant closure. MP.0/scalar-extension supplies finite residue endomorphism fields and reduction to absolute irreducibility for admissible irreducible representations. MP.1/central-ext supplies finite exceptional central-character/Ext support; MP.1/finite-type-presentation, MP.1/cosocle-length and MP.1/smooth-dual-length supply the criteria used in §§5.4 and 6.4. These are contracts on the smooth category, with the compact-dual topology retained when applied to cohomology.

### From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

Sections 0.1 and 0.3 supply coefficient-linear compact–discrete duality, biduality, the contragredient action, lattice/Schikhof duals and coefficient changes. Sections 2.1–2.7 supply irreducibles, locally admissible finite length, principal series and Steinberg representations, and the classification of irreducible mod-p representations of GL₂(ℚ_p) (§2.7). Layer 3 supplies the Montréal functor and its values on irreducibles. Sections 5.1–5.4 supply blocks, their Galois labels, projective envelopes and pseudo-deformation rings. Sections 6.7–6.8 supply finite-length residual fibres and the abstract occurrence argument. In the quaternionic application the central-character quotient of O[[K]] is used; projectivity is asserted in that fixed-character category.

### From TauCetiRoadmap.KTheoryLowDegrees

Section 11.5 supplies Moore’s local SL₂ covering theorem with root-of-unity kernel and norm-residue normalisation, including the rank-two symbol relations, for finite and profinite kernels with trivial action. Section 2.2 compares its finite discrete-kernel extensions with globally continuous cocycles and applies it to 𝔽_p. The proof does not import stable Steinberg relations as rank-two relations.

### From TauCetiRoadmap.ClassFieldTheory

Layer 5 supplies finite local Galois cohomology in degrees 0, 1, 2 and the norm-residue/Hilbert pairing. Layer 9 supplies the locally compact Weil group, its inertia exact sequence, dense map to the absolute Galois group, extension functoriality and local Weil reciprocity. Use its geometric transport specified in Conventions. For a finite discrete coefficient module and finite K/F, finite actions and continuous finite-valued Weil 1-cocycles extend to the absolute Galois group. These inputs give finite H⁰ and H¹ of W_K; no assertion about arbitrary Weil coefficients is used. For the unramified character δ(ϖ)=2 over 𝔽₅, the transported map gives δ(Art(Φ_geo))⁻¹=3, while arithmetic Frobenius gives 2; this is the same convention witness as §1.6.

### From TauCetiRoadmap.PerfectoidSpaces

P0.5–P0.13 and P0.29 supply almost modules, finite generation, scalar extension and almost sheaf cohomology. P2 supplies affinoid bases. P3.18–P3.22 supplies the étale site, tilting and almost acyclicity. P5 supplies finite-stage finite-étale descent. P8 supplies free-action quotient/torsor comparisons. The elementary-divisor/Frobenius rigidity theorem in §1.4 adds a result about almost finite module systems, rather than a second almost-module category.

### From TauCetiRoadmap.DiamondsAndVStacks

D0 supplies coherent topoi, coherent-site limits, filtered-colimit cohomology and Čech-to-derived comparison. D4 and D6 supply diamonds, gluing and the analytic diamond functor. The equivariant-site statements of §0.1 retain the qcqs and profinite hypotheses needed to apply D0.

### From TauCetiRoadmap.DiamondEtaleCohomology

C0, “Quasi-pro-étale comparison and continuity”, supplies fully faithful quasi-pro-étale pullback and torsion étale-cohomology continuity, including ECD17 Proposition 14.9. C0–C1 supplies geometric stalks and derived torsion sheaf cohomology. For a qcqs affinoid U and profinite S=lim S_a, use continuity on U×S=lim(U×S_a) with finite S_a. This contract includes p-primary torsion and does not use the prime-to-p shriek projection formula (ECD17, Proposition 14.9, p. 86; ECD17 line 3541).

### From TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration

Section IG.4.1 supplies the equivariant site of a continuous locally profinite action, with its pullback and slice functors. Section 0.1 here proves the closed-subgroup limit, invariant integral sheaf and torsor/cohomology comparisons on that carrier.

### From TauCetiRoadmap.PadicHodgeTheory

Section 2.7 supplies the primitive mod-p comparison for proper smooth spaces over C, with finite-dimensional source and the bound by twice the dimension, as imported there from AInfCohomology §AI.3.1. It is applied to ℙᵣ⁻¹_C in §1.5, together with the analytic-topology bound of HodgeTateAndCanonicalSubgroups §6.36. It does not state the local image estimate for strictly contained rational subsets; that estimate is the contract gap:local-almost-finite-image below.

### From TauCetiRoadmap.AInfCohomology

Section AI.3.1 proves the primitive comparison through local image estimates on toric charts, used inside its proof route. What AInfCohomology must provide (gap:local-almost-finite-image): For a smooth affinoid V over Spa(C,O_C), C complete algebraically closed of characteristic zero, with good coordinates (an étale map to a torus factoring as finite étale maps and rational embeddings), an 𝔽_p-local system L on V and a rational subset U strictly contained in V in the valuative sense of §1.3, the image of `Hⁱ(V_ét,L⊗O⁺/p)→Hⁱ(U_ét,L⊗O⁺/p)` is almost finitely generated over O_C for every i≥0 (SCH13, Lemma 5.6(ii), p. 31; SCH13 line 1432; SCH18, Lemma 3.5, p. 12; SCH18 line 505). Section 1.3 consumes the case L=𝔽_p.

**Checks for the local image estimate.**

- For U=∅ the image is zero in every degree, so the estimate holds trivially; for i>dim V the source is itself almost zero (SCH13, Lemma 5.6(i)).
- For V the closed unit disc and U the closed disc of radius |p|, U is a rational subset strictly contained in V; the estimate makes the image of the infinite-dimensional H¹ almost finitely generated, whereas for U=V the valuative condition fails at the Gauss point and no finiteness is asserted.
- For V a finite étale cover of the torus composed with a rational embedding, the good-coordinate hypothesis holds; an étale map to the torus that is not such a composite does not meet the stated hypothesis, and SCH18's remark that it can be dropped is used only through §1.3's covering argument.

### From TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

Section 6.36 supplies vanishing of the cohomology of every abelian sheaf in the analytic topology above the dimension, for a qcqs rigid space locally of finite type over a nonarchimedean field. It is applied to ℙᵣ⁻¹_C in §1.5 and to ℙ¹_C in §3.2, both qcqs of dimensions r−1 and 1 (SCH18 line 773; LUD17 line 1303).

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

Layer 0 supplies noetherian completed group algebras for compact p-adic Lie groups, their finite-free resolutions and the finite-index comparisons. Here A[[K]] is obtained from a Cohen power-series presentation and that noetherianity theorem, with A/𝔪ⁱ coefficients for the cohomology application.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Layer 1, especially §1.10, supplies a Cohen coefficient map and a finite-variable power-series surjection onto a complete noetherian local ring with perfect residue field, including p-torsion targets. For finite residue field k this gives W(k)[[x₁,…,x_s]]↠A. No coefficient embedding is assumed when p is a zero divisor.

### From TauCetiRoadmap.CompletedCohomologyPartII

Layer 3 supplies completed-tower continuous dual and coefficient-limit comparisons. Its compact-to-smooth admissibility direction is used together with the compact–discrete duality and noetherian algebra inputs above; the converse in §0.3 uses topological Nakayama.

### From TauCetiRoadmap.AdicSpacesPartII

R0.10–R0.18 supplies separatedness, smooth local charts, closures and the valuative criteria. What AdicSpacesPartII must provide (gap:temkin-good-germs): For a separated quasicompact analytic adic space V over a complete algebraically closed C, a maximal point whose closure is the full Riemann–Zariski space of its completed residue field has an affinoid neighbourhood containing that closure. This is the precise geometric input to the strict-image argument of SCH18, Corollary 3.6, pp. 12–13 (SCH18 line 551).

### From TauCetiRoadmap.EtaleCohomologyFoundations

Section 0.9 supplies the Kummer cycle classes and the projective bundle formula with degree-one point normalisation, for n invertible on the base and finite coefficients annihilated by n; over a separably closed field ℙᵐ has one Λ(−i) summand in degree 2i for 0≤i≤m. Section 0.11 supplies the normalised algebraic smooth trace, whose ℙ¹ trace sends c₁(O(1)) to 1. Over C of characteristic zero these apply with n=pᵃ, so H²(ℙ¹_C,ℤ/pᵃ(1))≃ℤ/pᵃ algebraically, and the class of a degree-d divisor has trace d.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

Sections 1.1, 1.3 and 1.5 supply torsion sheaf cohomology, descent and inverse-limit comparisons with their topologies. Section 8.2 supplies the proper algebraic comparison for proper schemes and arbitrary torsion coefficients, including p-torsion over C; applied to ℙ¹_C it identifies the algebraic and analytic H²(ℙ¹_C,k(1)) and carries the algebraic trace to the analytic one. What ClassicalAdicEtaleCohomology must provide (gap:arithmetic-stein-hochschild-serre): For a quasicompact or Stein rigid analytic space X over a finite extension K of ℚ_p and a torsion coefficient ring Λ, construct the continuous Hochschild–Serre spectral sequence from Gal_K acting on geometric étale cohomology to H⁎_ét(X,Λ), compatible with the prodiscrete Stein limits and strict low-degree sequences. This is the descent input of CDN23 Corollary 2.12 and Lemma 4.13 (CDN23 line 1289, line 1818).

### From TauCetiRoadmap.PerfectoidShimuraVarieties

Sections 1.13–1.15 supplies anticanonical Γ₀ towers and their perfectoid limits. What PerfectoidShimuraVarieties must provide (gap:height-zero-modular-uniformisation): Embed the height-zero Lubin–Tate tower at a supersingular point into the infinite-level perfectoid modular curve, compatibly with its Hodge–Tate map, level maps and GL₂(ℤ_p)-action. The full GL₂(ℚ_p) action moves heights; the compact action is the one used by Ludwig’s charts (LUD17, Theorem 3.11 and Corollary 3.13, pp. 20–22; LUD17 line 862).

### From TauCetiRoadmap.LocalGaloisDeformationRings

Section 3.4 supplies the fixed potentially semistable/type deformation conditions. What LocalGaloisDeformationRings must provide (gap:potentially-barsotti-tate-lifts): For p>2 and every finite K/ℚ_p, every continuous two-dimensional residual representation of Gal_K over a finite field of characteristic p has a potentially Barsotti–Tate lift after a finite coefficient extension. This existence input includes reducible residual representations and is used by the globalisation theorem in GK14, Theorem A.2, pp. 36–37 (GK14 line 1712).

### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems

Section 2.23 supplies potential realisation of prescribed local Galois data; §4.15 supplies residual potential modularity with its type, solvable-descent and prescribed-splitting conditions. Their solvable extensions and avoidance conditions are retained in §4.1 here. No assertion of local residual irreducibility is added to that contract.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

Sections 3.10–3.11 supply the Hilbert automorphic Galois representation with Hecke normalisation and its local dictionary. The local comparison at the coefficient prime is not taken from this roadmap: its Carayol section excludes places above the coefficient prime, and the comparison used in §4.2 is HilbertModularVarietiesAndShimuraCurves R18.3.29(c) below.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

Sections R17.3 and R17.4 supplies exchange of quaternionic invariants and solvable base change. Section R16.3 supplies the specified inertia/type multiplicity comparison used to select a supercuspidal characteristic-zero point. The scalar Hecke operator convention is S_v=N(v)⁻¹det(ρ̄(Frob_v)); the central ψ character and the cohomological Galois convention are transported together.

### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

R18.3 supplies the residual Hecke ideal and localised quaternionic coefficient modules; R18.4 supplies cohomological eigenspaces. R18.3.29(c) supplies the potentially semistable comparison at places above the coefficient prime for a parallel-weight eigenform with absolutely irreducible residual representation: the Frobenius-semisimplified Weil–Deligne representation at such a place corresponds to the local automorphic component. In §4.2 the residual hypothesis is global and holds because the residual image contains SL₂(k); the local residual representation at 𝔭 may be reducible. The supercuspidal component at 𝔭 is discrete series, so Carayol’s hypothesis (C) of R18.3.29 also holds there. Section 4.2 uses both the definite algebra split at p and the Shimura-curve algebra ramified at the distinguished p-place, with their invariants exchanged at one real place.

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.2 supplies the Bruhat–Tits building, its contractible metric realisation, oriented facets, facet stabilisers and finitely many facet orbits. Section 2.1 constructs the coefficient resolution and cohomology argument from these geometric inputs.

### From TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts

LT.2, “Lubin–Tate character” and “Artin comparison”, supplies the finite-level Lubin–Tate character and its reciprocity normalisation. Section 0.2 transports Strauch’s labels through the right-G/left-D convention; finite-level unit labels and all-height labels are distinguished.

### From TauCetiRoadmap.Chebotarev

Layer 10 supplies infinitely many places with prescribed Frobenius conjugacy class in a finite Galois extension, outside every specified finite set. Section 4.2 applies it to the composite residual/cyclotomic field and then chooses an auxiliary place away from the finite stabiliser orders.

### From TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers

Section 7.1 supplies Strauch’s finite-level geometric component labels and the full-height infinite component torsor under Fˣ, together with its determinant, reduced-norm and reciprocity actions. Its finite-level convention is det(g)Nrd(b)⁻¹χ_LT(τ)⁻¹; §0.2 transports the labels and left/right actions to Conventions. Sections 7.2 and 7.6–7.7 supply the equivariant semistable models, nearby-cycle finite-copresentation argument and arithmetic finite-presentation theorem: for every finite F/ℚ_p, finite K/F, rank-two level n≥0, a≥1 and q≥0, `Hᑫ_ét(M⁽ϖ⁾_{n,K},O_L/pᵃ)` is profinite with continuous G′-action and its Pontryagin dual is a smooth finitely presented O_L[G′]-module. Arithmetic H⁰ retains the Galois permutation of geometric components; it need not have the same dimension as geometric H⁰. Sections 5.4 and 6.2 consume §7.7 directly; smooth finite presentation of the geometric Galois multiplicity is proved here by the finite-Galois and Stein-limit argument (CDN23, Theorem 2.1 and Corollary 2.12; CDN23 line 923, line 1280).

## How to read the build

Layer 0 fixes the component and cohomological interfaces on the supplied torsor. Layer 1 extends coefficients and proves the technical almost/Frobenius results and action formulas. Layer 2 compares Sⁱ with continuous cochains and tower multiplicities. Layer 3 constructs Ludwig’s quotient and its vanishing theorem. Layer 4 provides the global instance needed for the local Galois criterion. Layer 5 turns finite support of multiplicities into arithmetic finite length. Layer 6 proves the general-F multiplicity theorem and the residual-Galois and smooth-vector consequences. Each subsection gives its statement, an API in mathematical prose where it defines an object, discriminating Checks and its direct statement/proof inputs. The headlines in §§0.3, 2.1 (noncompact Shapiro) and 2.2 have Lean declarations in Suggested.lean; the other headlines require the geometric carriers listed in its module docstring.

## Layer 0: equivariant descent, components and compact cohomology

### 0.1 Limit and cohomology comparisons on equivariant sites

For a locally profinite G acting continuously on a locally noetherian analytic adic space or a perfectoid space X, use the supplied site (X/G)_ét. Continuity means a cover by affinoids with open stabilisers and continuous action on each affinoid algebra. If X is qcqs and G profinite, prove that for every closed H₀≤G the topos for H₀ is the limit over open H containing H₀ and that Hⁱ((X/H₀)_ét,ℱ)=colim_H Hⁱ((X/H)_ét,ℱ) for the restrictions of any abelian sheaf on (X/G)_ét. For H₀=1 this recovers the ordinary étale cohomology of X (SCH18, Proposition 2.8, pp. 8–9; SCH18 line 318).

For open H, the contracted product identifies (X/H)_ét with the slice over X×ᴴG. Prove conservativity of pullback to X_ét on pointed sheaves. Over Spa(K,O_K), define the invariant integral sheaf on an equivariant object U by the G-invariants of the ordinary sheaf O⁺/ϖ on U. Its pullback is O⁺_X/ϖ. This is invariants of the quotient sheaf, not a quotient of invariant sections (SCH18, Proposition 2.9 and Lemmas 2.10–2.11, pp. 8–9; SCH18 line 335).

For a compatible finite-étale G/H-torsor tower X_H→X with G profinite and perfectoid tilde-limit X_∞, and a commuting locally profinite J-action, prove (X/J)_ét≃(X_∞/(G×J))_ét. Here X is locally noetherian analytic over ℚ_p; for J=1 the equivalence identifies the integral quotient sheaves modulo p. For qcqs X and compact K acting continuously, construct Hⁱ_cont(K,Hʲ(X_ét,𝒢))⇒Hⁱ⁺ʲ((X/K)_ét,𝒢), with discrete smooth K-action on Hʲ(X_ét,𝒢) (SCH18, Proposition 2.12, Lemmas 2.13 and 3.12, pp. 9–10, 17; SCH18 line 389, line 717).

The invariant-sheaf API consists of the following facts.

- Restriction sends an invariant section on U to its invariant restriction on every equivariant étale V→U; restrictions respect identities and composition.
- Pullback to the nonequivariant site identifies the sheaf with O⁺_X/ϖ and detects equality of its sheaf morphisms.
- For an open subgroup, the slice identification carries the invariant sheaf to the sheaf for that subgroup; for the torsor tower it agrees with the stated integral comparison.

One route spreads finite étale covers and actions from H₀ to an open H, applies coherent-topos limits, and then uses finite-group Cartan–Leray for open normal subgroups. Passing to the colimit produces continuous cochains. Every tower comparison is over its finite-level base.

**Checks.**

- For G=1, the site is X_ét and the spectral sequence has only its i=0 column; both sides equal Hʲ(X,𝒢).
- For C₂ acting trivially on X with trivial linearisation, the cohomology action is trivial. With sign linearisation over 𝔽₃ its generator acts by 2, so trivial geometry alone does not force trivial coefficient action.
- For a compact K in GLᵣ(F), the equivalence has base `M_{LT,K}`. Its fibre is K; replacing the base by ℙᵣ⁻¹ changes the group to GLᵣ(F).
- On an empty equivariant object the sheaf of modules has zero sections. On a point with trivial group its integral quotient sections are O_C/ϖ, not zero.

*Needs:* IgusaVarietiesAndTorsionConcentration §IG.4.1; CompletedCohomologyAndLocalGlobalCompatibility §0.6; PerfectoidSpaces P2, P3, P5; DiamondsAndVStacks D0; SmoothRepresentationsOfLocalGroups §SR.0d.2.

### 0.2 Connected components and the action dictionary

Fix a complete algebraically closed extension C of F̆; every component set in this subsection is that of the tower after base change to C. For r≥1 and m≥1 let K_m=1+ϖᵐMᵣ(O_F). Use ProetaleCohomologyOfPAdicCurvesAndTowers §7.1: the geometric height-zero components at Lubin–Tate level K_m form (O_F/ϖᵐ)ˣ, whereas the height-zero space over F̆ itself is connected for every m≥0. At K₀=GLᵣ(O_F) the geometric height-zero space is connected. After including every height the geometric component set is a torsor under Fˣ/(1+ϖᵐO_F), or Fˣ/O_Fˣ at m=0. Strauch’s original finite-level labels carry determinant, inverse reduced norm and inverse Lubin–Tate character. Prove the comparison with Conventions by transporting the labels and left/right actions together (STR08, Theorems 4.3–4.4, pp. 11–13; STR08 line 337, line 372, line 391).

Use the supplied infinite-level component torsor, with a chosen origin, to identify the topological component set with Fˣ. In the section convention, right g translates the label by det(g), left d by Nrd(d), and Weil w by Art_F(w)⁻¹. Evaluation of an equivariant function at label 1 then has (w,d)-action π(Nrd(d)Art_F(w)⁻¹). Through EL duality, rank two gives components Fˣ/ϖ²ℤ after the scalar quotient. Thus `H⁰_ét(M⁽ᵖ⁾_{Dr,∞},k)=C⁰(ℚ_pˣ/p²ℤ,k)`, and the unquotiented component functions are coinduced for the scalar height-shift action from C⁰(ℤ_pˣ⊔pℤ_pˣ,k) (CDN23, §0.2.1, (4.15)–(4.16), pp. 4, 44; DPS23, Lemma 7.4, p. 31; CDN23 line 1857; DPS23 line 1418).

Under this comparison, the supplied component-label API takes the following form.

- For m≥j≥1, level reduction carries a unit label to its reduction modulo ϖʲ and preserves the height.
- Changing the quasi-isogeny height translates the integer valuation by v(det(g)); unit labels retain the determinant and reduced-norm actions above.
- Weil descent translates by Art_F(w)⁻¹ and commutes with both group actions and every level map.
- Two infinite labels agree exactly when their heights and all finite unit reductions agree. The torsor origin and degree-zero character formula fix the convention.

**Checks.**

- For the unramified δ(ϖ)=2 over 𝔽₅, the geometric Frobenius scalar is 3 and the Dˣ-uniformiser scalar is 2, exactly as in the supplier reciprocity contract.
- For r=1, a character δ gives Dˣ-action δ(d) and Weil action δ(Art(w))⁻¹. At δ(2)=2 mod 5 these are 2 and 3, respectively.
- At m=0 the height-zero piece is an open (r−1)-ball and the full component labels are ℤ. For r=1 this is a point in each height, rather than one point for the whole tower.
- A scalar ϖIᵣ moves height by r. For r=2 its quotient keeps the two unit cosets; functions constant on each have two independent values. Quotienting by ϖℤ instead gives only one and fails this count.
- For r=1, F=ℚ₃ and m=1, the height-zero level over F̆ is the spectrum of the totally ramified quadratic Lubin–Tate extension of F̆, one connected component; after base change to C it has |𝔽₃ˣ|=2 components. Counting (O_F/ϖᵐ)ˣ over F̆ instead of over C gives 2 where the answer is 1. At m=0 both counts are 1.
- For F=ℚ₂ and m=1, (O_F/2)ˣ has one element. For m=2 it has two; the transition sends both to the one label at m=1.

*Needs:* ProetaleCohomologyOfPAdicCurvesAndTowers §7.1; EndoscopicTransferAndUnitaryTraceComparison §§12.2–12.8, 12.11, 12.14; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2; ClassFieldTheory Layer 9; the supplied period torsor.

### 0.3 Compact p-adic Lie groups and complete local coefficients

For a p-adic Lie group H and the smooth admissible A-modules of Conventions, prove that admissible objects form a Serre subcategory and that restriction to an open subgroup preserves admissibility. If H is compact and V is killed by 𝔪ⁱ, admissibility is equivalent to finite generation of V∨ over A[[H]]. Prove that every Hʲ_cont(H,V) is finite over A/𝔪ⁱ, hence is a finite set, for all j≥0 (SCH18, Lemma 3.13, Definition 4.1 and Theorem 4.3, pp. 17–18; FUST22, Lemma 6.2, p. 290; SCH18 line 727, line 792; FUST22 line 478).

The headline `compactLie_cohomology_finite` states this result on Mathlib’s finite-dimensional analytic `LieGroup` carrier, modelled on `Fin d → Padic p`, including d=0, with `IsAdicComplete` for algebraic 𝔪-adic completeness. Its simple native predicate `AdmissibleCompactInvariants` tests finite generation of the compact-open fixed submodules of a bounded coefficient object. Smoothness, the positive exponent j, annihilation by 𝔪ʲ, noetherianity, finite residue field and its characteristic are separate explicit binders. Use the discrete scalar topology on A in the `TopRep` model: this does not change the underlying A[G]-module or its group cochain complex.

Use the supplied compact–discrete duality with the contragredient A-action. A Cohen presentation makes A[[H]] a quotient of the completed group algebra for H×ℤ_pˢ over W(k), proving noetherianity. The equivalence of admissibility and finite generation reduces modulo 𝔪 and uses topological Nakayama in the converse direction. Finite free resolutions over (A/𝔪ⁱ)[[H]] dualise to the invariant-acyclic resolution whose H-invariants are finite. This extends the O/ϖ_Lⁱ and finite-field forms to arbitrary A/𝔪ⁱ; it does not assert finite cohomology for an unbounded torsion V without truncation.

The admissibility API consists of the following facts.

- Continuous equivariant A-linear isomorphisms preserve and reflect admissibility.
- Subobjects, quotients and extensions of admissible objects in the smooth category are admissible, for the stated complete-local coefficients and p-adic Lie group.
- For A=k the condition agrees with finite-dimensional compact-open invariants; for A=O it agrees with the supplied torsion-admissibility condition.
- For compact H, the dual finite-generation equivalence and reduction modulo 𝔪 commute with restriction to open subgroups; a general closed subgroup is not covered by this assertion.

**Checks.**

- A finite C_p with the discrete analytic structure has dimension d=0. With V=𝔽_p trivial, dim Hⁱ=1 in every degree i≥0; the theorem asserts degreewise finiteness, without a torsion-free or finite cohomological-dimension conclusion.
- For H=ℤ_p and trivial V=𝔽_p, H⁰=H¹=𝔽_p and Hʲ=0 for j≥2. The same holds for p=2.
- For V=C⁰(H,𝔽_p) with regular action, H⁰ is the constant functions 𝔽_p and Hʲ=0 for j>0 by Shapiro. The zero module has zero cohomology and is admissible.
- For its countable direct sum, H⁰ contains ⊕ℕ𝔽_p and is infinite. For an infinite-dimensional trivial module even the one-element compact group has infinite fixed space; smoothness does not imply admissibility.
- The trivial module 𝔽_p for any compact p-adic Lie group has a one-dimensional fixed space, whereas a countably infinite trivial sum does not. These distinguish both directions of the finite-generation criterion.
- For A=ℤ_p and V=ℚ_p/ℤ_p with trivial H=1, V[pⁱ] has pⁱ elements but H⁰=V is infinite. The bounded-exponent hypothesis in the cohomology finiteness statement is essential.

*Needs:* the smooth and derived categories of SmoothRepresentationsOfLocalGroups SR.0/SR.0d; PadicLocalLanglandsForGL2Qp §§0.1, 0.3; ModpRepresentationsOfGL2OverLocalFields MP.0/torsion-admissibility; NoncommutativeAndEquivariantIwasawa Layer 0; DeformationAndDerivedPatchingAlgebra Layer 1; CompletedCohomologyPartII Layer 3; `continuousCohomology`.

### Examples

The trivial torsor reproduces ordinary étale cohomology; a sign linearisation on a geometrically trivial C₂-action does not. The rank-one period fibre is Fˣ, while a height-zero fibre has only units. For rank two the scalar quotient keeps heights 0 and 1. Compact cohomology of a regular representation is acyclic above degree zero, whereas the countable trivial sum fails admissibility already in degree zero.

### Dependencies

Layer 0 uses the period/tower and equivariant-site suppliers, local Weil reciprocity, compact–discrete duality, Cohen presentations and noetherian Iwasawa algebras. Section 0.1 needs qcqs spaces for its coherent-topos argument. Section 0.2 uses finite-level Lubin–Tate labels and EL duality. Section 0.3 uses compactness only for the dual-algebra and finite-cohomology assertions; its open-restriction assertion is local on H.

## Layer 1: coefficients, almost finiteness and actions

### 1.1 The associated sheaf with complete local coefficients

Extend the supplied associated-sheaf construction to every smooth A[G]-module π, including non-admissible π. On an equivariant étale U→ℙᵣ⁻¹, its sections are continuous maps `|U×_{ℙᵣ⁻¹}M_∞|→π` which satisfy f(xg)=π(g⁻¹)f(x) and are invariant under the diagonal Dˣ-action on the pullback. On the ordinary étale site only the G-equivariance condition remains. Prove the sheaf property, A-linearity, exactness and commutation with filtered colimits. At a geometric point with chosen torsor lift x̃, evaluation gives the stalk π, and changing the lift to x̃g composes evaluation with π(g⁻¹) (SCH18, Proposition 3.1 and §4, pp. 10–11, 18–19; SCH18 line 451, line 808).

The API for this coefficient extension consists of these statements.

- A G-equivariant A-linear map u acts by f↦u∘f; restriction, identity, composition and the stalk evaluation commute with that map.
- Stalk evaluation is natural, detects exactness and detects equality of sheaf morphisms. Sections agree precisely when their equivariant functions agree at every point.
- For an A-module B, the sheaf tensor comparison `B⊗_Aℱ_π→ℱ_{B⊗_Aπ}` is an isomorphism; for two smooth modules the pointwise tensor map `ℱ_π⊗_Aℱ_π′→ℱ_{π⊗_Aπ′}` is an isomorphism. Their assertions are sheaf assertions, not sectionwise surjectivity of an unsheafified tensor presheaf.
- The trivial coefficient A gives the constant sheaf when A is elementwise 𝔪-power torsion; in particular this holds for A/𝔪ⁱ. Arbitrary A itself is not a smooth torsion coefficient object.
- Pullback to `M_{LT,K}` is the associated sheaf of π restricted to K. For K′ normal open in K, the sheaf attached to C⁰(K/K′,A/𝔪ⁱ) is the finite étale pushforward of A/𝔪ⁱ from level K′.
- Central action induced by π(z) agrees with the Dˣ-central action, and the construction commutes with coefficient and finite-level restrictions (DPS23, Lemma 7.3; DPS23 line 1387).

A route proves the stalk formula using finite-level local sections, then tests exactness and coefficient comparisons on geometric stalks and uses §0.1 for equivariant conservativity. Smoothness supplies all vectors in the stalk. Without smoothness, only the smooth vectors survive.

**Checks.**

- For r=2 and trivial π=𝔽_p, ℱ_π is constant and its global degree-zero sections are 𝔽_p. For r=1 evaluation at 1 identifies `C⁰_{Fˣ}(Fˣ,π)` with π; zero π gives the zero sheaf.
- For K=GLᵣ(O_F), K′=1+ϖMᵣ(O_F), the regular finite quotient coefficient produces the GLᵣ(k_F)-cover pushforward, with one coefficient value per fibre point, rather than its one-dimensional invariant subspace.
- For the discrete K-module of all functions K→𝔽_p, the stalk on the compact K-torsor is exactly C⁰(K,𝔽_p), a proper subspace. This example is a K-module, not a claimed G-module.
- With F=ℚ₅, r=1 and δ(2)=2, changing the lift by 2 has scalar 3. A rule using π(g) gives 2 and fails naturality under this change.
- For A=ℤ_p the trivial A-module A has elements killed by no p-power and is outside the torsion construction; A/pⁱ and ℚ_p/ℤ_p are inside. Thus the constant-coefficient assertion cannot silently take untruncated A as an object.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility §0.6; §0.1; SmoothRepresentationsOfLocalGroups §SR.0.2; DiamondEtaleCohomology C0–C1; `ContinuousMap`, `LocallyConstant`.

### 1.2 Cohomology and compact-dual functors

For complete algebraically closed C/F̆ define Sⁱ_C(π)=Hⁱ_ét(ℙᵣ⁻¹_C,ℱ_π). Prove that it is smooth for Dˣ by writing it as the colimit of equivariant cohomology for compact open subgroups of Dˣ. It is an A-linear cohomological δ-functor commuting with filtered colimits. At C=ℂ_p it carries the commuting Weil action from inertia and descent, and the long exact sequence is equivariant (SCH18, §3 and proof of Theorem 4.4, pp. 10–18, 19–20; SCH18 line 819).

For a compact object M in the dual category of locally admissible smooth O-torsion G-modules define Šⁱ(M)=Sⁱ(M∨)∨. Prove the homological δ-functor laws and commutation with projective limits whose dual filtered colimits lie in that category. It carries the continuous Gal_F-action obtained by dualising the locally admissible extension of §1.6, together with the commuting Dˣ-action. The topology and coefficient-linear dual are part of the category; no such assertion is made for arbitrary abstract inverse systems (DPS23, Lemma 7.1 and §7, pp. 29–30; DPS23 line 1330, line 1337).

- The map of Sⁱ induced by u:π→π′ comes from sheaf cohomology, respects identity and composition, and commutes with every connecting arrow.
- Coefficient-linear finite scalar extension, cup products and the associated-sheaf tensor comparison are compatible. A general tensor product is not declared to commute with higher cohomology without flatness/finiteness hypotheses.
- Šⁱ is covariant because its definition uses two contravariant duals. Its long sequence reverses cohomological degree at the connecting arrow; it is compatible with the bidual identifications and continuous maps.
- Before admissibility is imposed, C-dependence is allowed. After §1.5 the base-change comparison is an isomorphism for every inclusion C⊂C′.

**Checks.**

- At r=1 the base is a point, so S⁰=π and Sⁱ=0 for i>0. Both functors send zero coefficients to zero.
- At r=2 and π=𝔽_p, (S⁰,S¹,S²)=(𝔽_p,0,𝔽_p(−1)); Dˣ acts trivially. The Tate trace sends a degree-one divisor to 1 and a degree-two divisor to 2.
- The sequence 0→μ∘det→Ind_B^G(μ⊗μ)→St⊗μ∘det→0 gives a long exact cohomology sequence. It does not make S¹ an exact functor.
- For a rank-one central character ζ, naturality of π(z) and central Dˣ-action gives the same scalar ζ(z) on every Sⁱ. At ζ(2)=2 mod 5 the scalar is 2 in both constructions.

*Needs:* §1.1; §§0.1, 0.3; DiamondsAndVStacks D0; PadicLocalLanglandsForGL2Qp §§0.1, 0.3; EtaleCohomologyFoundations §§0.9, 0.11 and ClassicalAdicEtaleCohomology §8.2 for the trace normalisation; `PadicComplex`, `continuousCohomology`.

### 1.3 Almost finite images under strict restriction

Let C/ℚ_p be complete algebraically closed, V separated smooth and quasicompact over Spa(C,O_C), and U⊂V a quasicompact open strictly contained in V. Here strict containment means that for every maximal point Spa(K,O_K)→U and every open bounded valuation subring K⁺⊂K, the point extends to Spa(K,K⁺)→V. Prove that the image of Hⁱ(V_ét,O⁺/p)→Hⁱ(U_ét,O⁺/p) is almost finitely generated over O_C for every i≥0 (SCH18, Corollary 3.6, pp. 12–13; SCH18 line 511).

A route uses Temkin’s good-germ criterion to find affinoid neighbourhoods of the full closures of maximal points, then good-coordinate charts and nested strict rational subsets, on which the local image estimate of gap:local-almost-finite-image applies. Maps of the resulting Čech spectral sequences propagate almost finite images (SCH18, Lemma 3.5 and proof of Corollary 3.6, pp. 12–13; SCH18 line 505, line 530). Both smoothness and separatedness enter that route; no global toric coordinates or properness hypothesis replaces the strict containment condition.

**Checks.**

- For proper smooth V and U=V, the extension condition holds and this recovers almost finite cohomology. “Strict” here is the valuative condition and does not mean U≠V.
- For the closed unit disc and U=V the boundary valuation fails the extension condition. Its infinite-dimensional H¹_ét(V,𝔽_p) is not a counterexample to the theorem with strict containment.
- For concentric discs of radii |p| and 1, the smaller disc is strictly contained in the larger; its Gauss boundary has radius |p|<1. Reversing the radii gives no inclusion at all.
- For U empty, the restriction image is zero in every degree; no nonempty-cover hypothesis is smuggled into the finite-image statement.

*Needs:* AdicSpacesPartII R0.10–R0.18 and gap:temkin-good-germs; AInfCohomology gap:local-almost-finite-image; PerfectoidSpaces P0 and P3; the finite-image spectral-sequence argument on finite nested covers.

### 1.4 Frobenius rigidity for almost finite module systems

Let K be complete algebraically closed of characteristic p, O_K its valuation ring and π a pseudouniformiser. For k≥1 suppose M_k is an O_K/πᵏ-module, M₁ almost finitely generated, with `p_k:M_{k+1}→M_k` and `q_k:M_k→M_{k+1}`. Assume p_kq_k=π and exactness in the middle of `M₁→M_{k+1}→M_k`, where the first map is q_k⋯q₁. Assume compatible Frobenius scalar-extension isomorphisms `M_k⊗_{O_K/πᵏ,φ}O_K/πᵖᵏ≃M_{pk}`. Prove that for one finite r≥0 all M_kᵃ≃(O_Kᵃ/πᵏ)ʳ compatibly with reduction, multiplication by π and coordinate Frobenius (SCH13, Lemma 2.12 and its proof through p. 13; SCH13 line 516).

The proof uses the decreasing elementary-divisor vector γ(M) from the almost finite classification, with partial-sum majorisation; it is not an ordinary module length. Exactness bounds γ(M_k) by kγ(M₁), while Frobenius gives `γ(M_{pk})=pγ(M_k)`. Equality forces the almost exact reduction sequences. The inverse limit is almost finite flat; Frobenius invariance over the algebraically closed field trivialises its rational fibre and fixes the almost lattice (SCH13, Proposition 2.11 and Lemmas 2.12–2.13, pp. 10–13; SCH13 line 462, line 537, line 567).

The system API consists of the following facts.

- The chosen free almost-module identifications commute with every reduction p_k, multiplication map q_k and Frobenius scalar-extension isomorphism.
- A compatible isomorphism of systems preserves the conclusion and its rank; r is the dimension of the rational inverse-limit fibre.
- Elementary-divisor vectors obey the exact-sequence partial-sum majorisation and Frobenius scaling used above, with zero module assigned the empty vector.
- Reduction to any smaller positive exponent preserves the same r and the coordinate Frobenius. The almost-module category itself is supplied by PerfectoidSpaces P0.

**Checks.**

- For M_k=(O_K/πᵏ)ʳ with the standard maps, the elementary-divisor vector has r entries equal to k and Frobenius changes them to pk. The conclusion gives the same system.
- For the zero system the vector is empty and r=0. For rank one the sequence O_K/π→O_K/π²→O_K/π has kernel πO_K/π², exactly the image of multiplication by π.
- A constant family M_k=O_K/π has γ(M_p)=(1), while Frobenius scalar extension has vector (p); at p=2 the values 1 and 2 differ. It cannot carry the asserted Frobenius isomorphism.
- A non-algebraically-closed field admits nontrivial Frobenius local systems. The algebraic-closure hypothesis is what allows a basis with coordinate Frobenius, rather than only a Frobenius-stable rational object.

*Needs:* PerfectoidSpaces P0.5–P0.13, P0.29; the valuation-ring elementary-divisor and inverse-limit arguments specified in this subsection; tilting from PerfectoidSpaces P3 for the application K=C♭.

### 1.5 Finiteness with complete noetherian local coefficients

For an admissible A[GLᵣ(F)]-module π, prove that every Sⁱ_C(π) is an admissible A[Dˣ]-module, that C⊂C′ induces an isomorphism, and that Sⁱ_C(π)=0 for i>2(r−1). Prove the natural almost comparison `Sⁱ_C(π)⊗_{ℤ_p}O_C→Hⁱ_ét(ℙᵣ⁻¹_C,ℱ_π⊗_{ℤ_p}O⁺)`. For π killed by p this is the comparison with O_C/p and O⁺/p. For π admissible as an underlying 𝔽_p-representation, cohomology on the equivariant quotient by any compact open K⊂Dˣ is finite; if it is also injective as a smooth 𝔽_p[GLᵣ(O_F)]-module, Sⁱ=0 for i>r−1. For general A, the finite-quotient assertion is applied to each bounded 𝔪-torsion coefficient π[𝔪ʲ], with fixed j≥1 (SCH18, Theorems 3.2 and 4.4, pp. 11, 19–20; SCH18 line 481, line 808).

A route proves the strict-image argument for the regular compact representation by descending through the Drinfeld tower, then uses finite free dual resolutions and nested Čech covers. Section 1.4 and Artin–Schreier turn almost finite modules into finite compact-quotient cohomology. Analytic-topology dimension r−1 and local almost acyclicity give the bound 2(r−1), improved for the compact-injective coefficient. Dévissage through π[𝔪] proves the bounded case; the unbounded case uses filtered colimits, the Serre property and induction on cohomological degree. This coefficient-ring extension retains all r and all finite F/ℚ_p.

**Checks.**

- For r=1, S⁰=π and all positive degrees vanish. The Dˣ-admissibility conclusion is exactly admissibility for Fˣ.
- For r=2 and trivial 𝔽_p, degrees 0,1,2,3 give 𝔽_p,0,𝔽_p(−1),0. Thus the unconditional bound permits a nonzero degree-two term.
- For any admissible rank-two π there are no terms above degree 2. Principal series have an additional degree-two vanishing only after Layer 3; the trivial character is the negative control.
- With A=𝔽_p[ε]/ε² and trivial π=A in rank two, S²=A(−1) has 𝔽_p-dimension 2 and ε acts nontrivially. Reducing A first would give dimension 1 and erase the square-zero information.
- For π with unbounded 𝔪-torsion, each Sⁱ[𝔪ʲ]ᴷ is finite although Sⁱ need not be finite. With r=1 and π=ℚ_p/ℤ_p the full S⁰ is infinite and its pʲ-torsion has pʲ elements. With A=𝔽_p[[T]] and π=𝔽_p((T))/𝔽_p[[T]] trivial, π is killed by p and A-admissible but S⁰=π is infinite; π[Tʲ] has pʲ elements. Being killed by p alone therefore does not imply finite compact-quotient cohomology over general A.

*Needs:* §§0.1, 0.3 and 1.1–1.4; the period-torsor and O-torsion finiteness contract of CompletedCohomologyAndLocalGlobalCompatibility §0.6; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.11; PerfectoidSpaces P0, P3, P8; PadicHodgeTheory §2.7; HodgeTateAndCanonicalSubgroups §6.36.

### 1.6 Galois action, degree zero, central characters and twists

At C=ℂ_p and for every smooth A[GLᵣ(F)]-module π, the W_F-action on Sⁱ(π) from inertia and Weil descent is continuous and commutes with Dˣ. For admissible π prove that it extends uniquely to a continuous Gal_F-action, commuting with Dˣ (SCH18, Proposition 4.6). Prove the same for locally admissible π, the union of its admissible subrepresentations: Sⁱ commutes with that filtered colimit by §1.2, and uniqueness together with density of W_F in Gal_F makes every map of admissible subrepresentations Gal_F-equivariant, so the actions glue (DPS23, §7, p. 30; DPS23 line 1337). Admissibility is sufficient, not necessary: a continuous action of the profinite Gal_F on a discrete set has finite orbits, which excludes some non-admissible π (negative control below) but not all (positive control below). For admissible π and arbitrary r≥1 compute `S⁰(π)=π^{SLᵣ(F)}` by evaluation on the component labels, with (w,d)∈W_F×Dˣ acting through Nrd(d)Art_F(w)⁻¹. In particular the map `S⁰(π^{SLᵣ(F)})→S⁰(π)` is an isomorphism (SCH18, Propositions 4.6–4.7, p. 20, with the component convention of §0.2; SCH18 line 871, line 892; DPS23 line 1418).

Prove that a central character ζ of a smooth π is also the Dˣ-central character of Sⁱ(π), and for a character δ:Fˣ→Aˣ continuous for the 𝔪-adic topology obtain Sⁱ(π⊗δ∘det)≃Sⁱ(π)⊗(δ⁻¹⊠δ), the first factor through reciprocity and the second through reduced norm. Such δ is smooth when A is Artinian, but need not be in general (over A=ℤ_p, the character of ℚ_pˣ equal to the identity on ℤ_pˣ and 1 at p has trivial, non-open kernel on the units); π⊗δ∘det is still smooth, because a vector killed by 𝔪ʲ is fixed by its stabiliser intersected with det⁻¹δ⁻¹(1+𝔪ʲ), which is open. Since Aˣ is profinite, δ extends through the profinite completion of Fˣ, so δ⁻¹ is a continuous character of Gal_F. For every smooth π this isomorphism is W_F×Dˣ-equivariant; for locally admissible π both sides carry the Gal_F-actions above and it is Gal_F×Dˣ-equivariant. For r=2 and bounded 𝔪-power-torsion A, the admissible character δ∘det gives S¹(δ∘det)=0 and S²(δ∘det)=A(−1)⊗(δ⁻¹⊠δ), free of rank one over A, with the indicated Gal_F×Dˣ-action (DPS23, Lemmas 7.3–7.4; DPS23 line 1387, line 1401).

One route reduces to π killed by 𝔪ʲ and extends the Weil action on the compact-open invariants, which are finite by §1.5 for admissible π, so that both an open subgroup of inertia and a power of Frobenius act trivially. The character twist isomorphism is the cup product with the degree-zero character sheaf; twisting by δ⁻¹ gives its inverse. The equality of central actions follows from zx=xz and the inverse in the section-equivariance formula.

**Checks.**

- For the unramified δ(ϖ)=2 over 𝔽₅, Art(Φ_geo)=ϖ gives scalar 3 on the Galois factor, and Nrd(d)=ϖ gives scalar 2 on the Dˣ factor. Arithmetic Frobenius has scalar 2.
- For π=δ∘det, S⁰ has scalar δ(Nrd(d))δ(Art(w))⁻¹. At r=1 and δ(2)=2 mod 5 the Dˣ scalar is 2, whereas inverse reduced norm would give 3.
- A generic rank-two principal series has no SL₂(F)-invariants, so S⁰=0. A character has a one-dimensional S⁰ instead.
- Twisting by δ and then δ⁻¹ returns the identity; the two scalars at 2 mod 5 multiply to 1. Their central restrictions are δ(zʳ) and its inverse, as det(zIᵣ)=Nrd(z)=zʳ.
- For r=2 and trivial character, S¹=0 and S²=A(−1). The trace-normalised degree-one cycle has value 1; degree two has value 2, including its zero value in characteristic 2.
- Negative control for admissibility: r=1, A=k, π=k[t,t⁻¹] with O_Fˣ acting trivially and ϖ by multiplication by t. Then π is smooth, S⁰=π, and geometric Frobenius acts by t⁻¹, so the orbit {tⁿ : n∈ℤ} of 1 is infinite; O_Fˣ-invariants are all of π, so π is not admissible; it is not locally admissible either, since k[t,t⁻¹] has no nonzero finite-dimensional t-stable subspace. No continuous Gal_F-extension exists.
- Positive control: π=k[t,t⁻¹]/(tᵐ−1) with m≥1 has dimension m and is admissible; every Frobenius orbit has at most m elements, the W_F-action factors through ℤ/m, and it extends through Gal_F→Ẑ→ℤ/m. At m=1 this is the trivial character with orbit size 1.
- Non-admissible positive control: r=1, A=k and π the direct sum over m≥1 of k[t,t⁻¹]/(tᵐ−1) with O_Fˣ trivial and ϖ acting by t. Then the O_Fˣ-invariants of π are all of π, which is infinite-dimensional, so π is not admissible, but π is locally admissible; a vector supported in the summands m₁,…,m_s has Frobenius orbit of size at most lcm(m₁,…,m_s), and the action extends to Gal_F. The infinite trivial sum ⊕ℕk is a second such example, with singleton orbits. Hence admissibility is not necessary for the extension.
- Continuous non-smooth twist: F=ℚ₅, r=1, A=ℤ₅, δ(u)=u on ℤ₅ˣ and δ(5)=1. Its kernel on ℤ₅ˣ is trivial, so δ is not smooth. On π=ℤ/5 with trivial action, π⊗δ∘det is the smooth character t↦(unit part of t) mod 5, with value 2 at t=2. The twist formula gives S⁰ with Dˣ-scalar δ(2)=2 mod 5 at d=2 and Galois scalar 3 at Art(w)=2, the same values as the smooth twist by the reduction of δ; restricting to smooth δ would exclude this ℤ₅-valued input.

*Needs:* §§0.2 and 1.1–1.5; EndoscopicTransferAndUnitaryTraceComparison §12.7; ClassFieldTheory Layers 5 and 9; for the trace normalisation, the algebraic cycle classes and smooth trace of EtaleCohomologyFoundations §§0.9, 0.11 and the proper algebraic comparison of ClassicalAdicEtaleCohomology §8.2.

### Examples

For rank one over ℚ₅, the lift-change scalar 3 and Dˣ-central scalar 2 are both forced by the same associated-function formula. For rank two the trivial representation has S²=k(−1), whereas Ludwig’s principal series will have S²=0. For A=ℤ_p, the unbounded torsion coefficient ℚ_p/ℤ_p is treated by its finite truncations, while the untruncated module ℤ_p is outside the smooth torsion category.

### Dependencies

The statements of §§1.1–1.2 need only the associated torsor and sheaf-cohomology carriers. Their finiteness route additionally uses compact duality, the strict-image and Frobenius lemmas, coherent-topos limits, the local image estimate gap and the analytic-topology dimension bound of HodgeTateAndCanonicalSubgroups §6.36. The degree-zero action uses Strauch’s components and the stated geometric Artin convention; the rank-one witness is unchanged from Layer 0.

## Layer 2: continuous cohomology and tower comparison

### 2.1 Fust’s comparison, reductive finiteness and noncompact Shapiro

For a locally profinite group H, a commutative ring R and a smooth discrete R[H]-module V, prove the natural isomorphism `Hⁱ_cont(H,V)≃Extⁱ_{Sm_R(H)}(R,V)` for every i≥0. The Ext category is the full smooth category, with trivial representation R; a bare TopRep with discontinuous orbit maps is excluded. Compare iterated continuous-function cochains with continuous maps Hⁱ⁺¹→V using local compactness. The proof applies smooth vectors to the cochain resolution and proves its derived-invariant acyclicity (FUST22, Corollary 4.4, pp. 287–288; FUST22 line 358).

For a closed J≤H with a continuous section of H→J∖H and a topological R[J]-module V with jointly continuous action, continuous induction Ind_J^H V is Mathlib’s `ContRepresentation.coind` on `ContRepresentation.coindV`: the submodule of C(H,V) satisfying f(jh)=j f(h), with compact-open topology and right-translation action. Prove `continuousCohomology_coind_iso`: Hⁱ_cont(H,Ind_J^H V)≃Hⁱ_cont(J,V) as topological R-modules, for all i, by restriction and evaluation on cochains; H is Hausdorff, locally compact and totally disconnected, which gives the exponential law for the iterated cochain spaces. The section gives an inverse up to continuous cochain homotopy; no termwise cochain isomorphism is asserted. This covers prodiscrete V in the tower application. For J=1, the conversion from the native twisted coinduction is (Tf)(x)=x·f(x⁻¹), and T²=1 (FUST22, Lemma 2.1 and induction convention, p. 281; BW00, Chapter IX, Proposition 2.3; CDN23, proof of Corollary 3.13, p. 37; FUST22 line 100, line 107; CDN23 line 1555).

The induction API consists of the following facts.

- Membership in the imported carrier is the condition f(jh)=j f(h); evaluation at 1 is a continuous J-equivariant coefficient map.
- A continuous J-equivariant R-linear coefficient map induces postcomposition on induction, preserving identities, composition and the H-action.
- Restriction and evaluation give the Shapiro cochain map; a continuous quotient section gives an inverse up to continuous cochain homotopy. These maps induce mutually inverse cohomology maps, naturally in coefficients.
- On profinite groups and discrete smooth coefficients the induced map agrees with the supplied Shapiro map. Compact support modulo J is the separate compact-induction condition, not a condition on this continuous induction.

Let H be the F-points of a connected reductive group over any finite F/ℚ_p, and O the integers of a finite coefficient extension of ℚ_p. For every a≥1 and admissible smooth O/ϖ_Lᵃ[H]-module V, prove that Hⁱ_cont(H,V) is finite over O/ϖ_Lᵃ for every i. Construct the oriented-facet resolution of the trivial module from the contractible Bruhat–Tits building. It has finitely many facet orbits; stabiliser cohomology reduces to compact-open normal subgroups and finitely generated central quotients. Section 0.3 and the resulting double-complex spectral sequence give the conclusion (FUST22, Lemmas 6.2–6.6, pp. 290–295; FUST22 line 478, line 598).

For any finite k of characteristic p and absolutely irreducible smooth π of GL₂(ℚ_p), prove Hⁱ(SL₂(ℚ_p),π)=0 for every i if no character twist of π is 1, St or Ind_B^Gα, where α(diag(a,d)u)=ε(a)ε(d)⁻¹. The exclusions are stated as representations, including small-prime coincidences, rather than assuming a three-element block for every p. If the SL₂-centre acts nontrivially, central-element homotopy gives vanishing first. Otherwise extend to Z·SL₂ with the specified central character and use blockwise Ext orthogonality and exact adjunction (FUST22, Proposition 5.1 and Corollary 5.2, pp. 288–290; FUST22 line 399, line 434).

Finally, for an admissible smooth k-representation of GL₂(F) with a central character prove admissibility upon restriction to SL₂(F). For a compact open J in SL₂(F), a sufficiently small central subgroup acts trivially and its product with J is compact open in GL₂(F), since Fˣ/(Fˣ)² is finite. Then πᴶ is the fixed space of that product and is finite-dimensional. This is specific to the fixed-central-character assertion, not arbitrary closed-subgroup restriction (CDN23, proofs of Corollary 3.13 and Theorem 4.22; CDN23 line 1560, line 1930).

**Checks.**

- H⁰(H,V)=Vᴴ=Hom_H(R,V)=Ext⁰_H(R,V). For H=1 and zero V both sides are zero.
- For H=ℤ_p and V=𝔽_p, degrees 1 and 2 are 𝔽_p and 0 on both sides. For H=ℤ_p and regular V=C⁰(H,𝔽_p), positive degrees are zero.
- For H=C₂, J=1, V=𝔽₂, continuous induction has dimension 2, while V has dimension 1. Their degree-zero cohomology has dimension 1 on both sides, and every positive degree is 0 on both sides, since the induced module is coinduced from the trivial group; the unequal cochain terms exclude a termwise isomorphism.
- For H=S₃, J=1 and trivial coefficients, induction is the six-dimensional function module. Its invariant functions are the one-dimensional constants, giving the same degree-zero Shapiro result for a nonabelian group.
- For GL₂(F)→Fˣ the section t↦diag(t,1) has determinant t, including t=ϖ. Replacing it by tI₂ has determinant t² and is not a section.
- For supersingular π the SL₂ cohomology vanishes in every degree. For π=1 its degree-zero cohomology is k, so the excluded block is necessary. For p=2 or 3 the representation exclusions are interpreted before grouping them into blocks.
- The untwisting map satisfies T(Tf)(x)=x·(x⁻¹·f(x))=f(x). On a character with value 2 mod 5 at x, the two factors are 2 and 3; omitting the value action fails this check.

*Needs:* §0.3; `continuousCohomology`, `TopRep.coind₁`, `ContRepresentation.coindV`, `ContRepresentation.coind`, `CategoryTheory.Abelian.Ext`, `TauCeti.IsSmoothDiscrete`; SmoothRepresentationsOfLocalGroups §§SR.0d.1–SR.0d.2 and SR.2.1; PadicLocalLanglandsForGL2Qp §§2.1–2.7, 5.1–5.2; ReductiveGroupsPartII RG2.2; profinite Shapiro from Tau Ceti for the compact specialisation.

### 2.2 Moore’s covering calculation and continuous degree-two vanishing

For a nonarchimedean local field E and finite, or more generally profinite, abelian A with trivial SL₂(E)-action, use the supplied rank-two covering classification H²_top(SL₂(E),A)≃Hom_cont(μ(E),A). Moore states it for separable locally compact A; only finite discrete A is used here. Prove its comparison with continuous cochain H² when A is discrete: an extension with discrete kernel has a local continuous section; refine into disjoint clopen cosets of an open subgroup and translate sections to obtain a global continuous section. Changing it changes the cocycle by a continuous coboundary. Conversely a continuous cocycle gives the product-space extension with its prescribed open quotient and discrete kernel (MOO68, Theorems 10.3–10.4, printed pp. 51–53; MOO68 line 2054, line 2060).

Deduce H²_cont(SL₂(ℚ_p),𝔽_p)=0 for every odd p. This is the headline `moore_sl2_h2_vanishes` in Suggested.lean, on the actual determinant-one matrix group over `Padic p` and the trivial discrete additive `ZMod p` coefficient. The roots of unity in ℚ_p have order p−1, so a homomorphism into a group of exponent p is zero. Also H¹_cont(SL₂(ℚ_p),𝔽_p)=0 for every p, from perfection of this infinite-field group and the degree-one cocycle dictionary (CDN23, proof of Lemma 4.28, p. 49; CDN23 line 2045).

The continuous extension comparison respects zero cocycles, equivalence of extensions, Baer sum, pullback and pushout of the discrete kernel. It carries the split extension to the zero map on μ(E); the universal covering class is distinguished by its identity kernel map and root-symbol normalisation. Finite coefficient extensions of 𝔽_p follow by a finite direct-sum decomposition of the additive coefficient module.

**Checks.**

- At p=3 the order of μ(ℚ₃) is 2. For a map to additive 𝔽₃, 2a=0 forces a=0. At p=5 the equations are 4a=0 and 5a=0, again giving a=0.
- For E the unramified quadratic extension of ℚ₃, |μ(E)|=8 and Hom(μ(E),𝔽₃)=0. For the ramified E=ℚ₃(ζ₃), |μ(E)|=6 and that Hom is one-dimensional. For E=𝔽₃((t)), |μ(E)|=2 and it is zero. The ℚ_p vanishing cannot be extended to all ramified p-adic fields.
- At p=2, μ(ℚ₂)={±1} has order 2, so Hom(μ(ℚ₂),𝔽₂) has two elements. Hence degree-two cohomology is one-dimensional and the odd-prime theorem cannot include 2.
- Degree zero is 𝔽_p, and degree one is zero for all p. In the perfection input take a=2 in ℚ_p: a≠0 and a²−1=3≠0, even in ℚ₃. The finite fields 𝔽₂ and 𝔽₃ do not satisfy the same perfection claim.
- The metaplectic double cover is the pushout along μ(ℚ_p)→μ(ℚ_p)/μ(ℚ_p)². For odd p that quotient has order 2, so its 𝔽₂ class can be nonzero while its mod-p class vanishes.
- For a two-cocycle c, the extension product is (a,g)(b,h)=(a+b+c(g,h),gh). Comparing the two threefold products gives c(g,h)+c(gh,t)=c(h,t)+c(g,ht); changing a section by b(g) changes c by b(g)+b(h)−b(gh).

*Needs:* KTheoryLowDegrees §11.5; ClassFieldTheory Layer 5; the degree-one/two continuous-cocycle dictionary `TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology` and `TauCeti.ContCohomology.explicitH2AddEquivContinuousCohomology`, with the explicit low-degree complex of ProfiniteCohomology Layer 2; the clopen-section comparison specified here; `Matrix.SL2.commutator_eq_top`; §2.1 for the cochain conventions.

### 2.3 The Cartan–Leray spectral sequence with prodiscrete coefficients

For every rank r≥1, finite F/ℚ_p and admissible smooth A[G]-module π killed by pᵃ with a≥1, put the inverse-limit topology on Hʲ_ét(M_∞,π̲) using a Stein affinoid perfectoid exhaustion U_s. Prove Hʲ_ét(M_∞,π̲)=lim_s Hʲ_ét(U_s,π̲), with discrete terms and jointly continuous G-action, independently of the exhaustion. Construct the first-quadrant spectral sequence of Dˣ×W_F-modules Hⁱ_cont(G,Hʲ_ét(M_∞,π̲))⇒Sⁱ⁺ʲ(π), and prove that Hʲ_ét(M_∞,π̲)=0 for j≥2 (CDN23, Theorem 3.2 and Lemma 3.10, pp. 34–36; CDN23 line 1452, line 1509).

The period-torsor Čech nerve is M_∞×Gᵗ. Compare its étale/pro-étale cohomology with C⁰(Gᵗ,Hʲ_ét(M_∞,π̲)). For qcqs U and profinite S, write S as a limit of finite S_b and use arbitrary-torsion étale continuity to obtain the product cohomology comparison. Then pass through the compact-open exhaustions and the Mittag–Leffler limit. The Artin–Schreier description on the tilt gives H¹(U_s,𝔽_p)=O(U_s♭)/(1−φ) and zero higher groups; density of restrictions makes the quotient system Mittag–Leffler. The resulting maps commute with the alternating faces, including multiplication and action maps, not only with product projections (CDN23, proof of Theorem 3.2, (3.4)–(3.9); ECD17, Proposition 14.9; CDN23 line 1477, line 1501; ECD17 line 3541).

**Checks.**

- At r=1, M_∞ is the Fˣ-torsor over a point. H⁰=C⁰(Fˣ,π), Hʲ=0 for j≥1, and Shapiro gives E₂⁰⁰=π and E₂ⁱ⁰=0 for i>0. Its abutment is S⁰=π.
- For every r the degree-zero edge is S⁰(π)≃H⁰(G,H⁰(M_∞,π̲)). Evaluation using components gives exactly §1.6, including the inverse Artin factor.
- Zero π gives an identically zero spectral sequence. An exact sequence of admissible bounded-torsion coefficients gives compatible spectral-sequence maps and the same connecting arrows as Sⁱ.
- For S with two points, Hʲ(U×S,π̲)=Hʲ(U,π̲)⊕Hʲ(U,π̲); empty S gives zero, and one point gives Hʲ(U,π̲). These are the finite-stage values from which the profinite product is obtained.
- In the inhomogeneous convention, d⁰v(g)=gv−v and d¹c(g,h)=g c(h)−c(gh)+c(g). Substituting d⁰ gives ghv−gv−ghv+v+gv−v=0. This fixes the signs of the Čech-to-cochain comparison.

*Needs:* §§0.1, 1.1–1.2 and 2.1; the full period torsor; EndoscopicTransferAndUnitaryTraceComparison §12.21; DiamondEtaleCohomology C0–C1; DiamondsAndVStacks D0; PerfectoidSpaces P3.20–P3.22; the continuous cochain topology from `TopRep`.

### 2.4 Multiplicity coefficients and the five-term sequence

For the same π, identify Hʲ_ét(M_∞,π̲) with Hom_cont,ℤ_p(π∨,Hʲ_ét(M_∞,ℤ/pᵃ)), naturally in π and in tower symmetries. Here π∨ is profinite and is presented by its actual finite quotient modules. For a prodiscrete target V=lim V_s use the topology lim_s colim_i Hom(U_i,V_s), where π∨=lim U_i uses those finite quotients. This assertion does not impose such a finite-quotient presentation on an arbitrary noncompact prodiscrete source (CDN23, Corollary 3.11 and proof, p. 36; CDN23 line 1531).

Obtain the multiplicity spectral sequence with E₂ⁱʲ=Hⁱ(G,Hom_cont(π∨,Hʲ_ét(M_∞,ℤ/pᵃ))) and only rows j=0,1. With V_j=Hom_cont(π∨,Hʲ_ét(M_∞,ℤ/pᵃ)), its five-term sequence is

    0 → H¹(G,V₀) → S¹(π) → Hom_cont,G(π∨,H¹_ét(M_∞,ℤ/pᵃ))
      → H²(G,V₀) → S²(π).

Prove naturality and continuity of each map. The middle arrow has source S¹(π) and target the indicated continuous multiplicity space; it is not a definition identifying them unconditionally.

The multiplicity-coefficient API is functoriality in π with the double-dual variance, compatibility with finite quotient refinements, independence of the chosen cofinal quotient system, agreement of the coefficient isomorphism on each affinoid, and compatibility with the Dˣ and Weil actions.

**Checks.**

- For π=ℤ/pᵃ trivial, the coefficient term is Hʲ(M_∞,ℤ/pᵃ) and the spectral sequence is ordinary continuous Cartan–Leray.
- For π killed by p, take a=1. For a two-dimensional trivial π, the coefficient term is two copies of Hʲ(M_∞,𝔽_p), on both the tensor and Hom sides.
- For π=0, π∨=0 and every Hom term is zero. A contragredient character with scalar 2 mod 5 has scalar 3 on its dual; Hom from that dual restores the scalar 2.
- With a profinite source ∏ℕk and discrete target k, a continuous linear functional uses finitely many coordinates. The algebraic dual includes functionals not continuous for the product topology and would give a different multiplicity object.

*Needs:* §2.3; PadicLocalLanglandsForGL2Qp §0.3; EndoscopicTransferAndUnitaryTraceComparison §12.21; DiamondsAndVStacks D0; continuous Hom on profinite/prodiscrete coefficient modules.

### 2.5 Comparison in degree one

Let G=GL₂(F) and π be an admissible smooth k[G]-module with a central character. Identify Hom_cont,k(π∨,H⁰_ét(M_∞,k)) with continuous `Ind_{SL₂(F)}^Gπ`. The determinant section t↦diag(t,1) and §2.1 give Hⁱ(G,Hom_cont(π∨,H⁰))≃Hⁱ(SL₂(F),π), finite-dimensional. Deduce the natural exact sequence

    0 → H¹(SL₂(F),π) → S¹(π)
      → Hom_cont,k[G](π∨,H¹_ét(M_∞,k)) → H²(SL₂(F),π).

For F=ℚ_p and irreducible π, prove that the middle comparison is an isomorphism if no Jordan–Hölder factor after extension to k̄ is a character twist of 1, St or Ind_B^Gα from §2.1. In every case its kernel and cokernel are finite-dimensional. Finite residue endomorphism fields and scalar extension reduce this assertion to absolute irreducibility (CDN23, Corollary 3.13, pp. 36–37, and Theorem 4.22, p. 46; CDN23 line 1541, line 1555, line 1926).

**Checks.**

- For supersingular π over ℚ_p, H¹ and H² of SL₂ vanish, so the comparison is an isomorphism.
- For π=1, S¹=0; the multiplicity space injects into H²(SL₂(ℚ_p),k), which is zero for odd p. At p=2 that outer group has dimension [k:𝔽₂] over 𝔽₂ and the argument does not establish zero multiplicity.
- For π=δ∘det, SL₂ acts trivially and its H¹ is zero. Thus S¹ injects into the multiplicity space, and for odd p both vanish in the unquotiented infinite tower.
- For p≥5 the exceptional irreducibles lie in twists of {χ,St⊗χ,I(χ,χε)}. At p=2 or 3 use the representation exclusions themselves; no assertion of three distinct objects is made.

*Needs:* §§0.2, 1.6 and 2.1–2.4; ModpRepresentationsOfGL2OverLocalFields MP.0/scalar-extension; PadicLocalLanglandsForGL2Qp §§2.1–2.7, 5.1–5.2. The character vanishing Check additionally uses §2.2.

### Examples

The rank-one torsor collapses Cartan–Leray to Shapiro in degree zero. The two-point coefficient product fixes the continuity comparison without any prime-to-p projection formula. A supersingular rank-two coefficient gives an exact degree-one multiplicity identification. The trivial character has zero S¹, and its possible discrepancy is measured by the genuine SL₂ degree-two group, which changes from zero at odd p to one-dimensional mod 2.

### Dependencies

Fust’s comparison uses the smooth derived category and compact cohomology, while reductive finiteness also uses the building resolution. Noncompact Shapiro requires a continuous quotient section and joint continuity. The period-torsor spectral sequence needs the supplied Stein/Mittag–Leffler and étale continuity theorems; it is independent of the global and Ludwig arguments. Moore’s consequence uses the rank-two covering theorem, the continuous section dictionary and finite root-of-unity calculation.

## Layer 3: Ludwig’s Borel quotient and vanishing

### 3.1 The perfectoid Borel quotient

Fix F=ℚ_p and rank two. Construct M_∞/B(ℚ_p) in the category of preadic spaces from its quotient topology and invariant structure sheaf, and prove that it is perfectoid. Distinguish M_B=M_∞⁽⁰⁾/B(ℤ_p), the intermediate perfectoid limit of height-zero finite-level Borel quotients, from the final quotient. With G⁰={g:det(g)∈ℤ_pˣ} and B′=B∩G⁰, identify M_∞/B with M_∞⁽⁰⁾/B′. The final perfectoid charts are open subsets obtained from local sections of the level-zero Gross–Hopkins map, not a single globally étale map from M_B (LUD17, Theorem 3.11, Corollary 3.13 and Theorem 3.14, pp. 20–23; LUD17 line 862, line 916, line 922).

Factor the period map through q:M_∞→M_∞/B and π̄:M_∞/B→ℙ¹_C, and prove π̄ quasicompact. For every geometric point x and chosen lift y, identify its completed fibre with y×ℙ¹(ℚ_p), and prove it affinoid perfectoid, including higher-rank valuation points by the completed-fibre argument (LUD17, Propositions 3.15, 3.17 and 3.23 and Lemma 3.22, pp. 23–27; LUD17 line 958, line 972, line 1159).

For a smooth B-character χ:B→kˣ, construct the rank-one local system ℱ_χ on the quotient by B-equivariant continuous maps from the pulled-back B-torsor. Prove `π̄_*ℱ_χ≃ℱ_{Ind_B^Gχ}`, and Rⁱπ̄_*𝒢=0 for i>0 for every abelian étale sheaf 𝒢. Deduce Sⁱ(Ind_B^Gχ)≃Hⁱ_ét(M_∞/B,ℱ_χ) for all i. The fibre calculation and geometric stalks, rather than a prime-to-p proper-base-change assertion, prove the higher-direct-image vanishing (LUD17, Proposition 4.2, Lemma 4.3 and Proposition 4.4, pp. 28–30; LUD17 line 1230, line 1236, line 1252).

The quotient and local-system API includes the following facts.

- The quotient map identifies precisely B-orbits and is universal for B-invariant morphisms to preadic spaces; the invariant section description is compatible with restriction and gluing. Equality of descended maps is tested after q.
- The intermediate quotient M_∞⁽⁰⁾→M_B stays in height zero. The final B(ℚ_p)-quotient identifies all integer heights: inclusion of height zero induces M_∞⁽⁰⁾/B′≃M_∞/B, and no integer-valued height descends through q. M_B is the limit of the height-zero finite-level Borel quotients, compatibly with their transition maps, and both quotient maps commute with the period factorisation. The M_B charts cover the final quotient after the specified B′ translates.
- Local-system sections are B-equivariant continuous functions; restriction, coefficient maps, identity, composition and stalk evaluation commute with them. The zero coefficient gives the zero sheaf, and the trivial character gives the constant sheaf.
- Pushforward of the character sheaf agrees with smooth induction, naturally in coefficient maps; the resulting cohomology comparisons are compatible with Dˣ, Weil actions and the factorisation π_GH=π̄∘q.
- For coefficient comparison, π̄_*ℱ_χ⊗O⁺/p≃π̄_*(ℱ_χ⊗O⁺/p), checked on the fibre y×ℙ¹(ℚ_p) (LUD17, Lemma 4.5, p. 30; LUD17 line 1269).

A route embeds the height-zero Lubin–Tate tower in the perfectoid modular curve with its GL₂(ℤ_p)-action, constructs the anticanonical B(ℤ_p) quotient, and glues the B′ quotient using local period sections. The diagonal element diag(p,p⁻¹) belongs to B′ but not to B(ℤ_p), so this second quotient is a substantive step.

**Checks.**

- For χ=1, ℱ_χ is constant k and its pushforward is the sheaf of Ind_B^G1; hence the Sⁱ calculation is quotient-space cohomology with constant coefficients.
- A geometric fibre has component space ℙ¹(ℚ_p)=B∖G. It includes [1:0] and [0:1], which are distinct; replacing it by a point would lose independent locally constant values.
- The composite π̄∘q is the Gross–Hopkins map, on both points and pullback of functions. Precomposing maps out of M_∞/B with q detects their equality: f∘q=g∘q forces f=g, and f=π̄ recovers π̄∘q=π_GH.
- The element diag(p,p⁻¹) has determinant 1 and moves a height-zero point within B′, yet is not integral. M_B alone therefore does not identify its orbit.
- At level zero the integral group is GL₂(ℤ_p); the expression 1+M₂(ℤ_p) contains singular matrices and cannot be its substitute.
- For a point x of height 0 and b=diag(p,1)∈B(ℚ_p), the point xb has height v(det b)=1, yet q(xb)=q(x). So the final quotient carries no integer height, while diag(p,p⁻¹)∈B′ changes height by 0.
- At a stalk, zero coefficients give dimension 0 and a character gives dimension 1. An invariant-subspace replacement can give dimension 0 for a nontrivial χ and is excluded by evaluation on a torsor lift.

*Needs:* the period-torsor contract; §§0.1, 1.1 and 2.3; PerfectoidShimuraVarieties §§1.13–1.15 and gap:height-zero-modular-uniformisation; EndoscopicTransferAndUnitaryTraceComparison §12.8; DiamondEtaleCohomology C0; PerfectoidSpaces P2, P3, P8; PadicLocalLanglandsForGL2Qp §2.6.

### 3.2 Degree-two vanishing for principal series and Steinberg twists

For all smooth χ₁,χ₂:ℚ_pˣ→kˣ prove S²(Ind_B^G(χ₁⊗χ₂))=0, allowing equal characters and every prime p. Prove S²(St⊗μ∘det)=0 for every smooth μ. By §1.6, S²(μ∘det)=k(−1)⊗(μ⁻¹⊠μ) is one-dimensional instead (LUD17, Theorem 4.6 and Corollary 4.7, p. 31; LUD17 line 1303, line 1331).

Use §3.1 and its integral coefficient comparison, almost acyclicity on the affinoid perfectoid fibres and analytic-topology cohomological dimension one. The almost comparison for the induced representation turns almost vanishing into the asserted vanishing. The Steinberg quotient follows from the long exact sequence and the general degree bound. Deduce that for every finite-length smooth X with only character, Steinberg-twist or principal-series constituents, S²(X) is finite-dimensional with a finite filtration by one-dimensional `Gal_{ℚ_p}×Dˣ` characters. Its H-invariants have a Galois-character filtration for every compact open H≤Dˣ (CDN23, proof of Theorem 4.23, pp. 47–48; CDN23 line 2009).

**Checks.**

- S²(Ind_B^G1)=0 but S²(1)=k(−1)≠0. Equal inducing characters are included, so the vanishing cannot be restricted to irreducible generic principal series.
- For the nonsplit extension of I(χ₂,χ₁) by I(χ₁,χ₂), the long exact sequence has two zero degree-two outside terms, giving S²=0 for the extension.
- From 0→1→Ind_B^G1→St→0, the connecting map S¹(St)→S²(1) is surjective because the next term is zero. Thus S¹(St) is nonzero, although S²(St)=0.
- At p=2 the trace of a degree-two divisor is zero, but the trace of a degree-one divisor is 1. Thus S²(1) still has dimension 1, and the principal-series vanishing remains a different assertion.

*Needs:* §3.1; §§1.2, 1.5–1.6; PerfectoidSpaces P3.21; HodgeTateAndCanonicalSubgroups §6.36; the principal-series/Steinberg sequence of PadicLocalLanglandsForGL2Qp §2.6.

### Examples

Trivial χ gives constant coefficients on the Borel quotient. The fibre is a profinite projective line, not a discrete finite set. Equal characters still give vanishing in degree two; the character subrepresentation retains a one-dimensional degree-two class, detected by the connecting map from S¹(St). The same three values hold at p=2.

### Dependencies

The quotient geometry uses the compact modular-curve uniformisation input and separate B′ gluing, followed by the quasicompact fibre calculation. Vanishing uses the integral pushforward comparison, almost finiteness and analytic dimension one. Neither result uses globalisation or the odd-prime Moore theorem.

## Layer 4: global quaternionic input and the local Galois criterion

### 4.1 Globalisation of residual local data

For p>2 and a continuous `r̄:Gal_{ℚ_p}→GL₂(k)`, with [k:𝔽_p]≥2, construct a totally real number field E of even degree with p completely split and a regular algebraic cuspidal representation π of GL₂(𝔸_E) of weight zero, meaning parallel weight two with trivial algebraic coefficient. Its attached p-adic representation ρ_π is unramified outside p, its residual image contains SL₂(k) and lies in GL₂(k), and its restriction at every v|p is isomorphic to r̄. A finite coefficient extension and conjugation puts the characteristic-zero representation in GL₂(O_L). Global absolute irreducibility is required and proved; local residual reducibility is allowed (DPS23, Proposition 8.1, pp. 37–38; CDN23, Proposition 4.5, p. 37; DPS23 line 1748; CDN23 line 1583).

A route uses potential realisation of local data, potentially Barsotti–Tate lifts for both reducible and irreducible local residual representations, and potential modularity with avoidance. Solvable base change makes the characteristic-zero representation unramified away from p and arranges even degree. Perfection of SL₂(k) preserves the large residual subgroup along the solvable steps. In §4.2 enlarge k to degree at least three for the auxiliary-place construction; that extra enlargement is not part of the two-dimensional residual lifting hypothesis (GK14, Proposition A.1, Theorem A.2 and Corollary A.3, pp. 36–37; GK14 line 1689, line 1712, line 1729).

**Checks.**

- If r̄ is irreducible, the residual restriction remains irreducible at each p-place because E_v=ℚ_p and the local representation is prescribed, not merely a representation of the same determinant.
- If r̄ is a nonsplit extension of χ₂ by χ₁, each local restriction is reducible, whereas the global residual image contains SL₂(k) and is absolutely irreducible. Local reducibility therefore does not contradict the global conclusion.
- Even [E:ℚ] makes the sum of quaternionic invariants at all real places equal to [E:ℚ]/2=0 in ℚ/ℤ. For an odd number of real ramified places this sum is 1/2 and no such definite, finite-place-split algebra exists.
- For k=𝔽₉ the globalisation input has [k:𝔽₃]=2 and SL₂(k) is perfect. The later auxiliary-place proof uses degree at least three instead; the two bounds are not identified.

*Needs:* PotentialModularityAndCompatibleSystems §§2.23, 4.15; LocalGaloisDeformationRings §3.4 and gap:potentially-barsotti-tate-lifts; AutomorphicGaloisRepresentations §§3.10–3.11; GL2AutomorphicRepresentationsAndTransfer §R17.4; finite coefficient extension and residual-image control.

### 4.2 The specified quaternionic block module and occurrence

Use §4.1, with [k:𝔽_p]≥3, to fix (E,π,ρ), a p-place 𝔭 and a real place ∞₀. Put ψ=χ_cyc·detρ, viewed by geometric reciprocity as a finite-adelic character, and ζ=ψ_𝔭. Let D₀/E be ramified exactly at every real place and split at all finite places, and let D be obtained by exchanging its invariants at 𝔭 and ∞₀. Use the supplied towers for these two different algebras. Let N be the product of the finite stabiliser orders in the definite double-coset description. Prove that an auxiliary place w₁ can be chosen with N(w₁) prime to 2Np, N(w₁)≠1 mod p, and the ratio of the two residual Frobenius eigenvalues outside {1,N(w₁),N(w₁)⁻¹} (DPS23, Lemma 8.2, pp. 38–39; DPS23 line 1769).

Take `U_{w₁}` to be the subgroup congruent to an upper unipotent matrix modulo `ϖ_{w₁}`; take hyperspecial level at the other finite places away from p. Form the supplied localised definite module `S=S_{ψ,λ,𝔪}=Hom_{U_p^𝔭}(λ,S_ψ(U^p,L/O))_𝔪`, with λ a tensor of finite free local coefficient types at the other p-places and 𝔪 determined by T_v=trρ̄(Frob_v), S_v=N(v)⁻¹detρ̄(Frob_v). Nonvanishing, admissibility and injectivity of `S_ψ(U^p,L/O)_𝔪` among smooth representations of the compact group U_p with central character ψ_p are imported from CompletedCohomologyAndLocalGlobalCompatibility §1.7(c)–(d) (CDN23, Proposition 4.7(a)). Prove here that λ can be chosen with S≠0 (DPS23, Lemma 8.6; CDN23, Proposition 4.7(b)), that passing to `Hom_{U_p^𝔭}(λ,−)_𝔪` preserves admissibility and the injectivity of the GL₂(ℤ_p)-restriction in the fixed-ζ smooth category, and that S lies in the block of r̄ˢˢ (CDN23, Proposition 4.8, p. 39; CDN23 line 1675). With `A_B=R_B^{ps,ζ}`, prove that `M=(k⊗_{A_B}S∨)∨=S[𝔪_{A_B}]` is of finite length and contains every irreducible of the block as a subquotient (DPS23, Proposition 8.4 and Lemma 8.6, pp. 39–41; CDN23, Propositions 4.7–4.10, pp. 39–40; DPS23 line 1852, line 1889; CDN23 line 1666, line 1694).

The generic module and abstract occurrence criterion are supplied; this target establishes their hypotheses in this global instance. A route first applies Chebotarev to the residual/cyclotomic composite, then uses the small auxiliary level to eliminate finite stabilisers. Its compact dual is projective over the fixed-central-character quotient of O[[GL₂(ℤ_p)]]. For occurrence, a missing constituent would vanish through every `𝔪_{A_B}`-adic quotient. A nonzero characteristic-zero supercuspidal Hecke point, obtained by the type/weight construction of Paškūnas’s argument, contradicts that vanishing. This point has absolutely irreducible characteristic-zero local Galois representation even when r̄ is reducible: by HilbertModularVarietiesAndShimuraCurves R18.3.29(c), applicable because the global residual representation is absolutely irreducible, its Weil–Deligne representation at 𝔭 is that of the supercuspidal component, which is irreducible of dimension two. The coefficient lattice contributes Hom_O(λ,O), as corrected in DPS23 footnote 15, before tensoring with L/O (PAS22, Theorem 6.5, pp. 29–30; DPS23, footnote 15, p. 40; CDN23, proof of Proposition 4.10; CDN23 line 1707).

**Checks.**

- For an absolutely irreducible r̄ the block is the single supersingular π̄, so M is a nonzero successive extension of π̄. For a generic reducible semisimplification its two constituents are precisely I(χ₁,χ₂) and I(χ₂,χ₁).
- The ring A_B acts on M through k: every element of `𝔪_{A_B}` kills it. Replacing this torsion fibre by the entire S would lose this property.
- The auxiliary ratio excludes 1 as well as N(w₁) and its inverse. If its value lies outside 𝔽_pˣ, all three exclusions hold; degree at least three in DPS23 ensures the needed choice also in the cyclotomic-containment case.
- At p=3 choose residue degree three: |kˣ|=26. For a primitive ξ, ξ² has order 13, hence ξ²∉𝔽₃ˣ. At degree two this particular uniform argument has a different range and is not silently reused.
- For λ=O, the lattice-dual factor is O and the torsion coefficient is L/O≠0. Using the torsion dual of λ instead gives (L/O)⊗(L/O)=0, contradicting nonvanishing of the selected coefficient module.
- Invariants exchanged at two places change each invariant by 1/2, with total change 1=0 in ℚ/ℤ. The definite algebra is split at 𝔭; the curve algebra is division there.

*Needs:* §4.1; CompletedCohomologyAndLocalGlobalCompatibility §§1.5–1.7, 3.7; PadicLocalLanglandsForGL2Qp §§0.3, 5.1–5.4, 6.7–6.8; HilbertModularVarietiesAndShimuraCurves R18.3–R18.4; GL2AutomorphicRepresentationsAndTransfer R16.3, R17.3; HilbertModularVarietiesAndShimuraCurves R18.3.29(c); AutomorphicGaloisRepresentations §§3.10–3.11; Chebotarev Layer 10; the Paškūnas type-selection argument on this module.

### 4.3 Torsion in Hecke ideals and the cohomology comparison

For the S and Hecke algebra T of §4.2, and any ideal I≤T, construct the natural injection `S¹(S[I])→Ĥ¹_{ψ,λ,𝔪}[I]`, using the supplied S¹(S)≃Ĥ¹ comparison. Prove that its cokernel is trivial under the reduced-norm-one units in `O_{D_𝔭}ˣ`; if r̄ˢˢ is not χ⊕χε, it is an isomorphism. In particular, for a generic pair it identifies S¹(M) with `Ĥ¹_{ψ,λ}(U^𝔭,k)_𝔪[𝔪_{A_B}]`, equivariantly for `Gal_{ℚ_p}`, D_𝔭ˣ and Hecke operators (PAS22, Lemmas 6.1–6.2, pp. 27–28; PAS22 line 1242).

Make the global non-Eisenstein vanishing S⁰(S)=0 and noetherianity of T explicit. If f₁,…,f_s generate I, put Q=S/S[I], which embeds into Sˢ by multiplication by the generators. The long exact sequence identifies S¹(S[I]) with a subspace of S¹(S). Its failure to commute with I-torsion is controlled by S⁰ of the cokernel of Q→Sˢ. The degree-zero formula and the block exclusions give the norm-one and vanishing assertions. This is the ψ-isotypic λ-typical version of the ideal-torsion comparison; it is separate from the supplied full S¹(S) comparison (SCH18, proof of Proposition 7.7, p. 29; SCH18 line 1278).

**Checks.**

- For I=0, S[I]=S and the injection is the supplied isomorphism, with zero cokernel. For I=T, S[I]=0 and both torsion targets are zero.
- If r̄ˢˢ=χ⊕χε, the theorem permits a nonzero cokernel trivial on norm-one units; claiming an isomorphism solely from noetherianity would erase the degree-zero obstruction.
- For generic χ₁χ₂⁻¹ outside {1,ε,ε⁻¹}, the exceptional semisimplification cannot occur, so the comparison for M is an isomorphism.
- A zero Hecke operator kills S and gives all of S as its kernel; a unit Hecke operator has zero kernel. The multiplication-map construction gives these two values and respects the same Galois and Dˣ actions.

*Needs:* §§1.6 and 4.2; CompletedCohomologyAndLocalGlobalCompatibility §§3.7, 4.12, including global non-Eisenstein localisation and coefficient divisibility; PadicLocalLanglandsForGL2Qp §§5.1–5.2; the exact sequence from the finite generators of I.

### 4.4 Galois invariants of generic principal series

For p>2, generic smooth χ₁,χ₂:ℚ_pˣ→k̄ˣ and any finite K/ℚ_p, prove that `S¹(I(χ₁,χ₂))^{Gal_K}≠0` implies χ₁|Gal_K=1 or χ₂|Gal_K=1. Equivalently, one of the finite abelian character fields is contained in K; K is not required to be Galois. Under a fixed central character χ₁χ₂ε⁻¹, only finitely many generic pairs can meet this condition (CDN23, Proposition 4.3 and §4.1.5, pp. 37, 41–42; CDN23 line 1574, line 1758).

Globalise a nonsplit extension with this semisimplification and use §4.2 to realise both irreducibles in M. Genericity removes S⁰ and S² terms and the exceptional Hecke-torsion obstruction. The comparison and isotypy place the relevant S¹ constituents in a two-character Galois filtration; invariants force a character to restrict trivially. Finiteness then follows from local reciprocity: characters trivial on Gal_K factor through the finite quotient `ℚ_pˣ/N_{K/ℚ_p}Kˣ`. This norm quotient is finite also for non-Galois K.

The generic-pair API consists of the following facts.

- Swapping the two characters and simultaneously twisting both by η preserve genericity, because their ratio is inverted or unchanged.
- The central character of I(χ₁,χ₂) is χ₁χ₂ε⁻¹. A nonsplit extension chosen in the generic block has the two ordered principal-series constituents from §4.2.
- Trivial restriction of χ_i to Gal_K is equivalent to containment of its finite character field in K, including non-Galois K.
- Twisting I by η∘det twists its cohomology by η⁻¹⊠η; the invariant-space hypothesis must be twisted with it.

**Checks.**

- For K=ℚ_p, the conclusion is χ₁=1 or χ₂=1. With a fixed central character, each choice determines the other character, giving at most two ordered candidates before genericity is tested.
- For χ₁=χ₂, or ratio ε or ε⁻¹, genericity fails. Swapping a ratio takes its inverse, preserving the excluded set.
- If η|Gal_K=1, simultaneous twisting preserves the invariant condition. If η|Gal_K is nontrivial, a previously invariant vector can acquire scalar 2 mod 5 and cease to be invariant; an untwisted hypothesis cannot be retained.
- For a non-Galois K the condition χ_i|Gal_K=1 is meaningful and is equivalent to containment of its character field in K. There is no quotient group Gal(K/ℚ_p) in this formulation.
- If ℚ_pˣ/NKˣ is cyclic of order m, the possible finite characters are roots of Xᵐ−1 in k̄; there are at most m, and only its prime-to-p part contributes. This bounds the support for each fixed central character.

*Needs:* §§1.6, 3.2 and 4.1–4.3; PadicLocalLanglandsForGL2Qp §§2.6, 5.1–5.2 and the Montréal values in Layer 3; CompletedCohomologyAndLocalGlobalCompatibility §4.12; ClassFieldTheory Layers 5 and 9.

### Examples

A globally absolutely irreducible residual representation can restrict to the same reducible nonsplit extension at every p-place. The two quaternion algebras have opposite local roles at 𝔭. For K=ℚ_p a generic invariant principal series has a trivial character in one of its two Galois positions; after a nontrivial twist that statement must be retested with the twisted invariant space.

### Dependencies

Globalisation uses local lifting and potential modularity, then solvable base change. The quaternionic instance uses the abstract block theory and the selected supercuspidal characteristic-zero point, with fixed central character. The ideal-torsion comparison uses finite generators and global non-Eisenstein degree-zero vanishing. The local Galois criterion then combines isotypy with Ludwig vanishing; no result of Layer 5 is used to supply a global input here.

## Layer 5: finite support and arithmetic finite length

### 5.1 Finite image of a multiplicity family

For the isomorphism classes of irreducible smooth k[G′]-modules, define a vector-space-valued family V to have finite image when every V(π) is finite-dimensional and the support {π:V(π)≠0} is finite. Values can be arbitrary k-vector spaces before this condition is imposed; a finite index set alone is not sufficient. For a functor on the entire smooth category impose the condition only on its irreducible inputs (CDN23, §4.2, p. 43; CDN23 line 1814).

The API includes the following statements.

- The condition is invariant under pointwise k-linear isomorphism and change of representatives of irreducible isomorphism classes.
- A pointwise injection into a finite-image family has finite image. A pointwise exact sequence with finite-image outer families has finite-image middle family. Finite direct sums and subquotients preserve the condition.
- For F=ℚ_p and a finite-type smooth W, the family `π↦Hom_{G′}(W,π)` has finite image precisely when the cosocle of W has finite length, using finite residue endomorphism fields; over ℚ_p every irreducible smooth k[G′]-module is admissible (PadicLocalLanglandsForGL2Qp §2.7), so MP.0/scalar-extension applies to each.
- If a compact p-adic Lie group H acts continuously on the finite discrete values, then π↦Hⁱ(H,V(π)) has finite image for every i. For W_K the same assertion holds in degrees 0 and 1 by finite-coefficient local Galois finiteness and extension of finite Weil actions and cocycles.
- For F=ℚ_p and a finite-length W, `Hom_{G′}(W,−)` has finite image. No condition on values at general reducible arguments is asserted by this definition. The definition of finite image, its closure properties and the compact-group cohomology statement hold for every finite F/ℚ_p; the two Hom statements do not.

**Checks.**

- The zero family has empty support and all values of dimension 0. A family supported at one index with value k has support size 1 and dimension 1, hence has finite image.
- A single supported value ⊕ℕk has infinite dimension and fails the definition despite support size 1.
- For a nonsplit length-two extension of I(χ₂,χ₁) by I(χ₁,χ₂), with central character trivial at p, its irreducible cosocle is I(χ₂,χ₁). The Hom family is zero elsewhere and has dimension 1 over that quotient’s endomorphism field.
- For F=ℚ_p and a pro-p Iwahori I₁, every irreducible smooth π has nonzero `π^{I₁}`; each is finite-dimensional, by admissibility, but infinitely many π occur. Thus the invariant family is not of finite image.
- Negative control for general F: for F the unramified cubic extension of ℚ_p, p>2, there is a smooth irreducible GL₂(F)-representation over the residue field, the field with p³ elements, that is not admissible, on which pI₂ acts trivially, so that it is a k[G′]-module, and whose endomorphism ring contains an algebraic closure of 𝔽_p (LE19, Theorems 1.1–1.2, pp. 1–2, the construction of §2, p. 4, and Theorems 3.2–3.4, pp. 5–6; LE19 line 30, line 49, line 169). Taking W=π, the cosocle has length 1 while `Hom(W,π)` is infinite-dimensional, and `π^{I₁}` is infinite-dimensional because a non-admissible representation has infinite-dimensional invariants under every pro-p open subgroup. This is why the Hom statements and the I₁ Check carry F=ℚ_p.
- For the trivial group H=1, H⁰(H,V(π))=V(π) and Hⁱ=0 for i>0. For H=ℤ_p with one trivial k value, degrees 0 and 1 have that same one-point support and dimension 1.

*Needs:* §0.3; ModpRepresentationsOfGL2OverLocalFields MP.0/scalar-extension and MP.1/central-ext; PadicLocalLanglandsForGL2Qp §2.6; ClassFieldTheory Layers 5 and 9; `FiniteDimensional`, `Set.Finite`.

### 5.2 Ascent from arithmetic levels to the infinite tower

Let F=ℚ_p, p>2, n≥0 and K/ℚ_p finite. Prove the following strictly exact sequences of prodiscrete G′-modules, with all maps the natural arithmetic pullback or level pullback:

    0 → H¹(Gal_K,H⁰_ét(M⁽ᵖ⁾_{n,C},k)) → H¹_ét(M⁽ᵖ⁾_{n,K},k)
      → H¹_ét(M⁽ᵖ⁾_{n,C},k)^{Gal_K},
    0 → H¹(Ǧ_n,H⁰_ét(M⁽ᵖ⁾_{Dr,∞},k)) → H¹_ét(M⁽ᵖ⁾_{n,C},k)
      → H¹_ét(M⁽ᵖ⁾_{Dr,∞},k)^{Ǧ_n}.

Here Ǧ₀=O_Dˣ and Ǧ_n=1+𝔪_Dⁿ for n≥1. Compute `H⁰_ét(M⁽ᵖ⁾_{Dr,∞},k)=C⁰(ℚ_pˣ/p²ℤ,k)`, prove that its Ǧ_n-cohomology is finite-dimensional in every degree, and prove `H¹_ét(M⁽ᵖ⁾_{Dr,∞},k)=H¹_ét(M_{Dr,∞},k)^{pℤ}`. The last comparison uses H¹(pℤ,C⁰(ℚ_pˣ,k))=0, with both unit cosets in its coinduced coefficient (CDN23, Lemma 4.13 and (4.14)–(4.16), pp. 43–44, with §0.2’s scalar calculation; CDN23 line 1818, line 1845, line 1858).

For irreducible k[G′]-modules π put `Y(π)=Hom_cont,k[G](π∨,H¹_ét(M_∞,k))^{W_K×Ǧ_n}`. Prove that finite image of Y implies finite image of `π↦Hom_cont,k[G′](π∨,H¹_ét(M⁽ᵖ⁾_{n,K},k))`. Prove in turn that finite image of `π↦S¹(π)^{Gal_K×Ǧ_n}` implies finite image of Y. The error families are H¹ and H² of SL₂(ℚ_p) from §2.5, and their finite support and degree-zero/one Weil and compact-group cohomology are controlled by §§2.1 and 5.1. The invariant-space passage includes the H¹ term of the kernel; invariants are not treated as exact (CDN23, Lemma 4.17, p. 45; CDN23 line 1875).

For every finite F/ℚ_p, also prove the unquotiented geometric-level sequence

    0 → H¹(Ǧ_n,C⁰(Fˣ,k)) → H¹_ét(M_{n,C},k)
      → H¹_ét(M_∞,k)^{Ǧ_n}.

Its source and topology are the geometric ones; it has neither arithmetic descent to K nor scalar quotient in its statement (CDN23, proof of Theorem 4.22; CDN23 line 1931).

**Checks.**

- At n=0, the component functions restricted through Nrd to O_Dˣ are two copies of C⁰(ℤ_pˣ,k), from valuation classes 0 and 1. Their compact-group cohomology is finite. Torsion-freeness of Ǧ₀ is not needed and is not asserted.
- The scalar generator shifts heights by 2. Coinduction from C⁰(ℤ_pˣ⊔pℤ_pˣ,k) has H¹=0 by Shapiro; a single unit coset misses all odd heights.
- For supersingular π, and for any irreducible outside the character-block exceptions of §2.5, `Y(π)=S¹(π)^{W_K×Ǧ_n}`. The principal series and Steinberg exceptions are retained where they occur in that block.
- A nonzero arithmetic multiplicity maps to a nonzero class at infinite level unless it belongs to one of the finite error supports. This is a support statement with finite-dimensional error values, not an unconditional injection through every intermediate invariant functor.
- With coefficients zero both strict sequences are zero. At fixed finite level H⁰ is finite-dimensional, while at infinite level C⁰(ℚ_pˣ/p²ℤ,k) is infinite-dimensional; compact admissibility supplies the different finiteness argument required there.

*Needs:* §§0.2–0.3, 1.6, 2.1, 2.3–2.5 and 5.1; EndoscopicTransferAndUnitaryTraceComparison §§12.11, 12.14, 12.19, 12.21; ClassicalAdicEtaleCohomology §1.5 and gap:arithmetic-stein-hochschild-serre; ClassFieldTheory Layers 5 and 9.

### 5.3 Finite support of arithmetic multiplicities

For p>2, n≥0 and finite K/ℚ_p, prove that `Hom_cont,k[G′](π∨,H¹_ét(M⁽ᵖ⁾_{n,K},k))` is finite-dimensional for every irreducible smooth k[G′]-module π and zero for all but finitely many such isomorphism classes. This is the finite-image conclusion of §5.1 (CDN23, §4.2 and Theorem 4.1, pp. 43–46; CDN23 line 1893).

The S¹-invariant spaces in §5.2 are finite-dimensional by admissibility. After scalar extension, the generic principal-series support is finite by §4.4, while the mod-p classification gives the finite nongeneric exceptions for each central character. There are only finitely many possible absolute central characters for G′: its centre is ℚ_pˣ/pℤ, and the pro-p units act trivially on smooth k̄ˣ-valued characters, leaving 𝔽_pˣ of order p−1. Scalar-extension descent then prevents distinct irreducibles over k from sharing an absolute constituent (CDN23, Lemma 1.22 and proof of (4.19), pp. 17, 45; CDN23 line 1906).

**Checks.**

- For K=ℚ_p the character alternatives in §4.4 give finitely many generic ordered pairs at each central character; compact Ǧ_n-invariants are already finite-dimensional.
- Every irreducible cosocle constituent of `H¹_ét(M⁽ᵖ⁾_{n,K},k)∨` belongs to this finite support. A family that is finite-dimensional at every π but supported everywhere would not suffice.
- At level n, twists by characters δ of ℚ_pˣ/p²ℤ that are trivial on `N_{K/ℚ_p}Kˣ` and for which δ∘Nrd is trivial on Ǧ_n permute the relevant supports through the twist comparison. The first condition keeps the Gal_K-invariant condition, the second the Ǧ_n-invariant condition. The second is automatic for n≥1, since Nrd(Ǧ_n)⊂1+pℤ_p is pro-p and δ has values of order prime to p there; at n=0 it says that δ is unramified. Negative control: p=5, n=0, K=ℚ₅(ζ₅), δ trivial at 5 and equal to reduction modulo 5 on ℤ₅ˣ. Then δ is trivial on the norm group 5^ℤ(1+5ℤ₅) of K, but δ(Nrd(2))=δ(4)=4≠1 for the central 2∈Ǧ₀, so the twist changes the Ǧ₀-character and need not preserve the level-zero support.
- For p=3, ℚ₃ˣ/3ℤ has prime-to-3 character quotient 𝔽₃ˣ of order 2, giving two possible absolute central characters. At p=2 the global theorem is outside its prime range even though that character quotient has order 1.

*Needs:* §§1.5–1.6, 2.5, 4.4 and 5.1–5.2; ModpRepresentationsOfGL2OverLocalFields MP.0/scalar-extension, MP.1/central-ext; PadicLocalLanglandsForGL2Qp §§2.1–2.7, 5.1–5.2.

### 5.4 Finite length of arithmetic Drinfeld cohomology

For p>2, n≥0 and finite K/ℚ_p, prove that `H¹_ét(M⁽ᵖ⁾_{n,K},k)` is the compact dual of a smooth admissible finitely presented k[G′]-representation of finite length. Prove also that `H¹_ét(M⁽ᵖ⁾_{n,K},μ_p)∨` is smooth admissible of finite length as a ℤ_p[G]-module. For every a≥1, prove the same finite-length and admissibility statement for `H¹_ét(M⁽ᵖ⁾_{n,K},O_L/ϖ_Lᵃ)∨` (CDN23, Theorem 4.1 and its coefficient dévissage, pp. 37, 43–46; CDN23 line 1565).

Use the arithmetic finite-presentation supplier theorem, §5.3’s finite-image multiplicities and the cosocle criterion. This proves finite length of the actual compact dual, rather than substituting finite length of individual multiplicity spaces. The coefficient filtration from ϖ_Lᵃ to k, and the degree-zero pieces of the long exact coefficient sequence, give the bounded-torsion extension. The μ_p case is not stated in CDN23 and is deduced here by descent. Put K′=K(ζ_p), so that μ_p≃𝔽_p over K′ and Γ=Gal(K′/K) has order dividing p−1, prime to p. The k-theorem over K′ gives finite length of `H¹_ét(M⁽ᵖ⁾_{n,K′},𝔽_p)∨`, since H¹(−,k)=H¹(−,𝔽_p)⊗k for the finite extension k of 𝔽_p. Since |Γ| is invertible on p-torsion coefficients, Hochschild–Serre for the finite Galois cover `M⁽ᵖ⁾_{n,K′}→M⁽ᵖ⁾_{n,K}` identifies `H¹_ét(M⁽ᵖ⁾_{n,K},μ_p)` with the Γ-invariants of `H¹_ét(M⁽ᵖ⁾_{n,K′},𝔽_p)⊗μ_p`, the image of the averaging idempotent, which commutes with G. Its dual is therefore a G-direct summand of a smooth admissible finite-length dual, and inherits both properties.

As the geometric corollary, prove for every smooth admissible k[G′]-module π that `Hom_cont,k[G′](π∨,H¹_ét(M⁽ᵖ⁾_{n,C},k))` is finite-dimensional. The argument is independent of arithmetic Gal_K-invariants for this finite-dimensionality statement; for a fixed central character it is §2.5 and §5.2 directly, and for arbitrary admissible π use the full geometric ascent argument of Remark 4.20, retaining its admissibility hypothesis without replacing π by a uniform finite central-character quotient (CDN23, Corollary 4.21 and Remark 4.20, p. 46; CDN23 line 1917, line 1920).

**Checks.**

- Every arithmetic dual has finitely many irreducible constituents with finite multiplicities. Finiteness of a support alone is not its finite-length proof without finite presentation and the cosocle criterion.
- For n=0 the geometric scalar quotient `M⁽ᵖ⁾_{0,C}` is two copies of the Drinfeld half-plane, one per height class modulo 2. Gal_K acts on these two components by translation by the residue degree f(K/ℚ_p) modulo 2, because W_K acts on heights through the valuation of the norm (CDN23, §0.2.1, p. 4; CDN23 line 179). Over K=ℚ_p Frobenius interchanges them: the invariants of the swap on `H⁰_ét(M⁽ᵖ⁾_{0,C},k)=k²` are {(a,a)}, of dimension 1, and `M⁽ᵖ⁾_{0,ℚ_p}` is connected. Over the unramified quadratic extension both components are fixed and the invariants have dimension 2; over a ramified quadratic extension (f=1) they are still interchanged. The theorem concerns the whole level with this descent action; treating the arithmetic level as two copies of the half-plane over every K is wrong in degree zero, and replacing the geometric level by one copy loses a direct summand.
- For π=1 the geometric multiplicity is finite-dimensional, in agreement with the degree-one comparison and its finite errors. For π=0 its dimension is 0.
- For K=ℚ₅ and the μ₅ coefficient, K′=ℚ₅(ζ₅) has Γ≃ℤ/4; Hⁱ(Γ,V)=0 for i>0 on every 𝔽₅[Γ]-module V, so no degree-zero error term enters and the μ₅ dual is a direct summand of the 𝔽₅ dual over K′. The constant-coefficient theorem over K alone does not give it: μ₅ and 𝔽₅ are non-isomorphic modules for Gal(ℚ̄₅/ℚ₅).
- At exponent a=1 the coefficient theorem is the k result. For a=2 the sequence 0→ϖ_LO/ϖ_L²→O/ϖ_L²→k→0 has two k-graded pieces; their long exact cohomology sequence preserves finite length without dividing by p.
- For F≠ℚ_p and n>0, arithmetic cohomology can have non-admissible dual at sufficiently large K. The general-F theorem of §6.1 is about multiplicities instead (CDN23, Theorem 2.13, p. 30; CDN23 line 1307).

*Needs:* §§0.3 and 5.1–5.3; ProetaleCohomologyOfPAdicCurvesAndTowers §7.7; ModpRepresentationsOfGL2OverLocalFields MP.0/finite-presentation and MP.1/cosocle-length; PadicLocalLanglandsForGL2Qp §§2.1–2.7; the central-character and coefficient dévissage specified here; EndoscopicTransferAndUnitaryTraceComparison §12.19.

### Examples

A family supported at one infinite-dimensional value fails finite image, while a length-two nonsplit principal-series extension has a one-point cosocle Hom support. At level zero the geometric scalar quotient has two height classes, which Gal_K interchanges exactly when f(K/ℚ_p) is odd; the arithmetic theorem keeps this descent action. The unbounded coefficient ℚ_p/ℤ_p is not obtained by claiming finite length of the colimit; the theorem is stated separately for each bounded exponent.

### Dependencies

Ascent uses arithmetic and compact-tower Hochschild–Serre with strict topologies, the two-coset component computation, continuous Shapiro and finite error families. Finite support uses the global local-Galois criterion and scalar descent. Arithmetic finite length uses the separate arithmetic finite-presentation theorem and the supplied smooth cosocle criterion. No finite-length conclusion is used to establish its own finite-support input.

## Layer 6: general multiplicities and smooth vectors

### 6.1 Finite multiplicities over arbitrary local fields

For every finite F/ℚ_p, every level n≥0 and every admissible smooth k[GL₂(F)]-module π with a central character, prove that `Hom_cont,k[G](π∨,H¹_ét(M_{n,C},k))` is finite-dimensional. The space `M_{n,C}` is the unquotiented geometric Drinfeld level. No oddness assumption is imposed here, and the theorem covers ramified as well as unramified F (CDN23, Theorem 4.22, p. 46; CDN23 line 1926).

Apply the unquotiented sequence of §5.2, then §2.5 and admissibility of S¹(π) to bound the infinite-level term. For the error term put W=H¹(Ǧ_n,C⁰(O_Fˣ,k)), finite-dimensional by §0.3. Coinduction over the height lattice identifies the remaining component term with functions on integer heights valued in W. Its G-multiplicity injects into `(π⊗W)^{SL₂(F)}`, finite-dimensional by the fixed-central-character restriction theorem of §2.1. This argument proves multiplicity finiteness without asserting arithmetic admissibility or finite length for general F (CDN23, proof of Theorem 4.22; CDN23 line 1939).

**Checks.**

- For π=δ∘det, the relevant SL₂ fixed space is π⊗W, of dimension dim W. The theorem bounds the corresponding character multiplicity.
- For F=ℚ_p the same comparison, with the scalar-quotient descent of §5.2, gives the central-character case of §5.4’s geometric corollary.
- For F≠ℚ_p, n>0 and sufficiently large finite K/F, the arithmetic dual can be non-admissible while every multiplicity in the theorem remains finite. These are different quantified conclusions.
- For p=2, F=ℚ₂ and π=1, the outer degree-two SL₂ group is k rather than zero. The theorem still gives finite dimension; it does not use the vanishing of §2.2.
- With π=0 the Hom dimension is 0. If π is a finite direct sum of m admissible central-character representations, the Hom dimensions add, giving a finite sum.

*Needs:* §§0.2–0.3, 1.5, 2.1, 2.5 and the general-F sequence of §5.2; the unquotiented geometric tower of EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.11, 12.21. This route does not need the arithmetic finite-presentation theorem or globalisation.

### 6.2 Geometric Galois multiplicity and finite presentation

For every finite F/ℚ_p, n≥0 and finite-dimensional continuous k-representation ρ̄ of Gal_F, define `Π_n^geo(ρ̄)=Hom_{k[Gal_F]}(ρ̄,H¹_ét(M⁽ϖ⁾_{n,C},k))∨`. Give the Hom space its closed prodiscrete subspace topology inside ρ̄∨⊗H¹, and take its continuous k-linear dual. The induced G′ action is contragredient. Prove that this representation is smooth and finitely presented for every F and p, using the arithmetic supplier theorem of ProetaleCohomologyOfPAdicCurvesAndTowers §7.7; finite length over ℚ_p is the separate theorem of §6.3 (CDN23, Corollary 2.12, p. 30, and §4.3.2, p. 46; CDN23 line 1280, line 1948).

The geometric multiplicity API consists of the following facts.

- A Galois-equivariant map ρ̄₁→ρ̄₂ induces Π_n^geo(ρ̄₁)→Π_n^geo(ρ̄₂), with identity and composition laws; the functor is covariant because precomposition on Hom is followed by a dual.
- Finite direct sums are preserved. An exact sequence 0→ρ̄′→ρ̄→ρ̄″→0 gives Π_n^geo(ρ̄′)→Π_n^geo(ρ̄)→Π_n^geo(ρ̄″)→0; no left-exactness assertion is made.
- If F′/F is finite Galois trivialising ρ̄, H=Gal(F′/F), and `H¹_ét(M⁽ϖ⁾_{n,C},k)^{Gal_{F′}}=V∨`, then Π_n^geo(ρ̄)≃(ρ̄⊗_kV)_H. It is coinvariants, with the diagonal H-action, rather than invariants.
- For m≥n, geometric pullback on H¹ induces the contravariant level map Π_m^geo(ρ̄)→Π_n^geo(ρ̄). Identity, composition, G′-equivariance and the maps in ρ̄ commute.
- Functionals in Π_n^geo agree exactly when they have the same value on every equivariant map ρ̄→H¹. This is the continuous dual of the specified Hom topology.
- The smooth finite-presentation conclusion is compatible with finite coefficient extensions and changes of a trivialising finite Galois extension.

To prove finite presentation, use arithmetic/Stein Hochschild–Serre to compare geometric `Gal_{F′}`-invariants with arithmetic H¹. The outer H¹ and H² local Galois terms are finite because finite-level H⁰ is finite. The arithmetic dual is smoothly finitely presented by the supplier theorem; finite-presentation closure under the finite errors then gives V. Before dualising, `Hom_Gal(ρ̄,H¹)=Hom_H(ρ̄,(H¹)^{Gal_{F′}})`. Dualising both sides gives the coinvariant formula and the finite-group finite-presentation argument. This proof does not identify an undualised Hom with a dualised one (CDN23, proof of Corollary 2.12; CDN23 line 1282, line 1289).

**Checks.**

- Π_n^geo(0)=0. For ρ̄=χ₁⊕χ₂ the result is Π_n^geo(χ₁)⊕Π_n^geo(χ₂); a two-dimensional trivial input gives two copies of the same output.
- For a character χ it is the dual of `(H¹⊗χ⁻¹)^{Gal_F}`. At χ(g)=2 mod 5 the tensor factor is 3, so χ-isotypy becomes invariant exactly when 2·3=1.
- A nonsplit extension 0→χ₁→ρ̄→χ₂→0 gives a surjection Π_n^geo(ρ̄)→Π_n^geo(χ₂). Maps factoring through a proper quotient are allowed; reducible input need not isolate a single mod-p block.
- For H=C_p and a two-dimensional unipotent module with generator 1+N, N(e₂)=e₁ and N(e₁)=0, invariants are k e₁, whereas coinvariants are represented by e₂. Both have dimension 1 but the natural invariant-to-coinvariant map is zero. Thus dimension alone cannot replace the dual coinvariant formula.
- For an identity level map the induced dual map is the identity. Composing levels m≥n≥j gives Π_m→Π_n→Π_j, in the reverse direction from cohomological pullback.
- Continuous linear functionals on ∏ℕk use finitely many coordinates; its entire algebraic dual is larger. The finite quotient computation therefore uses the continuous dual throughout.

*Needs:* §5.2’s topology and §5.4 for the ℚ_p refinement; ProetaleCohomologyOfPAdicCurvesAndTowers §7.7 directly for every F; ClassicalAdicEtaleCohomology gap:arithmetic-stein-hochschild-serre; EndoscopicTransferAndUnitaryTraceComparison §12.19; ModpRepresentationsOfGL2OverLocalFields MP.0/finite-presentation and MP.0/finiteness-calculus; ClassFieldTheory Layer 5; PadicLocalLanglandsForGL2Qp §0.3; `Representation`, `Field.absoluteGaloisGroup`.

### 6.3 Finite length, higher-dimensional vanishing and the supersingular block

For F=ℚ_p, p>2, every n≥0 and every continuous finite-dimensional `ρ̄:Gal_{ℚ_p}→GL_d(k)`, prove that Π_n^geo(ρ̄) has finite length. If d>2 and ρ̄ is absolutely irreducible, prove Π_n^geo(ρ̄)=0. If d=2 and ρ̄ is absolutely irreducible, prove that every constituent is the supersingular Π(ρ̄) in the supplied block/Galois normalisation, so Π_n^geo(ρ̄) is a finite successive extension of copies of Π(ρ̄) (CDN23, Theorem 4.23, Lemma 4.24 and Remark 4.25, pp. 47–48; CDN23 line 1954, line 1975, line 2015).

In the reducible-block setup of §4.2, for every G-submodule Z≤M and compact open H≤Dˣ prove that S¹(Z)ᴴ and H¹(H,S¹(Z)) are finite-dimensional Galois representations whose irreducible subquotients are one-dimensional. The kernel of S¹(Z)→S¹(M) is a quotient of S⁰(M/Z), hence has a character filtration. Its image is a submodule of r̄⊗U and has a filtration with the two Galois characters of r̄. Compact cohomology preserves the asserted finite character-filtration statement through its long exact sequences. These are the two separate contributions of Lemma 4.24.

A route first compares geometric Galois invariants with arithmetic cohomology up to finite errors and uses the coinvariants of §6.2 for finite length. An irreducible quotient π of a nonzero Π_n^geo(ρ̄) yields a nonzero Galois map into S¹(π), after the character-only error terms are excluded. For supersingular π, embed it in the global M; S⁰ of its quotient vanishes and the comparison/isotypy injects S¹(π) into an r̄-isotypic module. Thus any absolutely irreducible Galois constituent has dimension 2 and equals that block’s r̄. For ordinary blocks use Lemma 4.24 and §3.2 to show that only Galois characters can occur. The finite-length block decomposition then yields the dimension-two support statement, not merely a statement about a chosen irreducible quotient.

**Checks.**

- An absolutely irreducible three-dimensional representation, for example an induction from a suitable niveau-three character of the unramified cubic extension, gives Π_n^geo=0. Its dimension 3 cannot equal the supersingular block’s dimension 2 or an ordinary character’s dimension 1.
- For absolutely irreducible d=2, every constituent is Π(ρ̄). The theorem allows the zero representation, so it asserts neither nonzero multiplicity nor a particular positive length.
- At d=1 the finite-length statement applies without the higher-dimensional vanishing condition. At d=0 the input is zero and the output is zero by §6.2.
- For a reducible two-dimensional input, a nonzero map may factor through a one-dimensional quotient. The right-exact API gives the corresponding quotient of Π_n^geo; absolute irreducibility cannot be dropped from the block-support assertion.
- For Z=0, both spaces in Lemma 4.24 are zero. For Z=M, its image contribution lies in χ₁⊗U with a quotient in χ₂⊗U; each finite compact-open cohomology piece has only these one-dimensional Galois factors, with possible extra character factors from the kernel for general Z.
- In the supersingular argument, S⁰(π′)=0 for an extension π′ of supersingular copies. For an extension of characters that vanishing need not hold; Ludwig and Lemma 4.24 supply the different ordinary argument.

*Needs:* §§1.5–1.6, 2.5, 3.2, 4.1–4.3, 5.2, 5.4 and 6.2; CompletedCohomologyAndLocalGlobalCompatibility §4.12 and its rank-two isotypy; PadicLocalLanglandsForGL2Qp Layer 3 and §§5.1–5.2; compact finite cohomology from §0.3.

### 6.4 Smooth vectors in Lubin–Tate cohomology

For F=ℚ_p, p>2, n≥0 and finite K/ℚ_p, prove that the Dˣ-smooth vectors in `H¹_ét(LT⁽ᵖ⁾_{n,K},k)` form a finite-dimensional k-space. Here LT_n is level G₀=GL₂(ℤ_p) at n=0 and G_n=1+pⁿM₂(ℤ_p) for n≥1, the scalar quotient is taken in Z(Dˣ), and arithmetic descent is the Lubin–Tate quotient descent of gap:lubin-tate-arithmetic-descent, not the Drinfeld descent of EndoscopicTransferAndUnitaryTraceComparison §12.19 (CDN23, Theorem 4.26, p. 48; CDN23 line 2021).

Prove the two intermediate assertions: for every j≥0 the G-smooth vectors of `H¹_ét(M⁽ᵖ⁾_∞,k)^{Gal_K×Ǧ_j}` are finite-dimensional, and H¹_ét(M⁽ᵖ⁾_∞,k) has no nonzero finite-dimensional continuous G-submodule. In the first statement the inherited action is continuous and “smooth” means open stabilisers; the finite-dimensional submodules in the second carry their induced Hausdorff topology, hence are discrete over finite k. The first assertion follows from arithmetic finite length and finite-error descent. For the second, every nonzero finite-dimensional smooth G-module has a character submodule after finite scalar extension, since every map from an additive root group ℚ_p to a finite group is zero by divisibility, and those root groups generate SL₂(ℚ_p). Section 2.5 embeds any such character multiplicity between S¹ of a character and the degree-two group of §2.2, both zero. Thus the smooth subspace in the first assertion is actually zero. Pullback from finite Lubin–Tate level has only finite-dimensional descent errors, proving the headline result (CDN23, Lemmas 4.27–4.28, pp. 48–49; CDN23 line 2031, line 2041).

Prove also the equivalence of this smooth-vector finiteness theorem with the arithmetic finite-length theorem of §5.4, using the supplied finite-length criterion by smooth vectors of the dual and the same finite-error comparisons. This is an equivalence over ℚ_p with p>2, not an extension of arithmetic admissibility to every local field (CDN23, Remark 4.29, p. 49; CDN23 line 2057).

**Checks.**

- At n=0 the geometric Lubin–Tate components are open discs, with two height classes after the scalar quotient. The theorem bounds the Dˣ-smooth part of their arithmetic mod-p H¹; it does not assert finite-dimensionality of the whole disc cohomology.
- The geometric infinite tower has no nonzero G-invariant vector in H¹: an invariant line would be a forbidden finite-dimensional G-submodule.
- Connected components contribute H⁰ and the finite-dimensional terms H¹(Gal_K,H⁰) or H¹(G_n,H⁰) in descent. They are not a canonically embedded H¹ of geometric components. The descent sequence names precisely where their contribution enters.
- For odd p the character multiplicity is bounded by 0→Hom_G(δ,H¹(M_∞,k))→H²(SL₂(ℚ_p),k)=0. At p=2 the right-hand group is k, so this proof does not establish the theorem there.
- At an identity level map, the two induced pullback maps and their smooth-vector restrictions are identities. For zero coefficient the finite-dimensional smooth space has dimension 0.

*Needs:* §§0.2, 1.6, 2.2, 2.5, 5.2 and 5.4; EndoscopicTransferAndUnitaryTraceComparison §§12.7, 12.11, 12.14, 12.19 and gap:lubin-tate-arithmetic-descent; ModpRepresentationsOfGL2OverLocalFields MP.1/smooth-dual-length; the compact-continuous dual topology and finite-dimensional descent error terms.

### Examples

The general-F theorem keeps multiplicities finite even when an arithmetic dual is non-admissible. For geometric Galois multiplicity, the zero input gives zero and a direct sum of two characters gives the corresponding direct sum. A three-dimensional absolutely irreducible input has zero multiplicity over ℚ_p; a two-dimensional absolutely irreducible input permits only its supersingular block, with zero multiplicity still allowed. The p=2 degree-two countercheck explains the precise range of the smooth-vector theorem.

### Dependencies

Section 6.1 uses the geometric ascent and continuous-cohomology results over every F; it does not use the global theorem. Section 6.2 needs the arithmetic finite-presentation contract directly, even for general F. Section 6.3 uses arithmetic finite length, global block occurrence, isotypy and Ludwig vanishing. Section 6.4 uses the odd-prime Moore consequence and the independent finite-length criterion; the equivalence is proved only after both directional comparisons are available.

## Downstream consumers

PadicLocalLanglandsForGL2Qp, Part II consumes §§2.5, 5.3–5.4 and 6.1–6.3 for geometric realisation and characteristic-zero factorisation. Applications to completed cohomology use the coefficient extensions and action normalisations of Layer 1 together with the arithmetic comparisons supplied by CompletedCohomologyAndLocalGlobalCompatibility §4.12. The general-F multiplicity and geometric finite-presentation statements supply local-tower inputs without imposing a finite-length assertion outside its proven arithmetic range.

## Worked examples

For rank one, F=ℚ₅ and δ(5)=1, δ(2)=2, write an associated function as f(t)=δ(t)⁻¹v. Then f(2)=3v, (2·f)(1)=f(1/2)=2v for Dˣ, and a Weil element with Art(w)=2 gives (w·f)(1)=f(2)=3v. Evaluation, central character, tensor twist and the component translation all agree. Their inverse choices produce 2 instead of 3 or 3 instead of 2 and are detected in Layers 0–2.

For rank two, the scalar pI₂ has determinant p². Decompose ℚ_pˣ into the valuation-even and valuation-odd translates of ℤ_pˣ. Quotienting the scalar height shift gives ℤ_pˣ⊔pℤ_pˣ; coinduction from these two pieces has zero positive cohomology for the scalar ℤ-action. Thus both the finite-level geometric picture with two height classes, interchanged by Gal_K when f(K/ℚ_p) is odd, and the infinite-level H¹ comparison use the same height calculation.

For the unipotent C_p-module with matrix [[1,1],[0,1]], invariants are the span of e₁ and coinvariants are represented by e₂. The dual invariant computation pairs e₂ with its coefficient functional, giving the coinvariant model of §6.2. Averaging would divide by p and is unavailable; replacing coinvariants by invariants gives the wrong natural map even though both dimensions equal 1.

For λ=O the correct coefficient-dual tensor is O⊗(L/O)=L/O. A torsion dual in both factors gives zero. This distinguishes the fixed-central-character projective dual used in Layer 4 from a tensor product of two torsion modules, and keeps the selected automorphic coefficient space nonzero.

## References

Locators refer to the versions specified here; numbered extraction locators accompany the substantive claims. All statements are formulated in the conventions above.

- **CDN23.** Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum of Mathematics, Pi 11 (2023), e16, §§0–4, especially Theorems 2.1, 3.1–3.2, 4.1, 4.22–4.26. [Open published version](https://doi.org/10.1017/fmp.2023.15). Printed and PDF pages agree; arXiv:2204.11214v2 is the corresponding preprint.
- **SCH18.** Peter Scholze, *On the p-adic cohomology of the Lubin–Tate tower*, with an appendix by Michael Rapoport, Ann. Sci. ENS 51 (2018), 811–863. [arXiv:1506.04022v1](https://arxiv.org/abs/1506.04022v1), §§2–4 and proof of Proposition 7.7. Page locators use this preprint, not the journal pagination.
- **SCH13.** Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, Forum of Mathematics, Pi 1 (2013), e1. [arXiv:1205.3463v2](https://arxiv.org/abs/1205.3463v2), Proposition 2.11 and Lemmas 2.12–2.13, pp. 10–13.
- **LUD17.** Judith Ludwig, *A quotient of the Lubin–Tate tower*, Forum of Mathematics, Sigma 5 (2017), e17. [arXiv:1611.03685v2](https://arxiv.org/abs/1611.03685v2), §§3.3–4, Theorems 3.11, 3.14, 4.6 and Corollary 4.7. Page locators use this version.
- **FUST22.** Paulina Fust, *Continuous group cohomology and Ext-groups*, Münster Journal of Mathematics 15 (2022), 279–304. [Open journal text](https://www.uni-muenster.de/FB10/mjm/vol_15/mjm_vol_15_08.pdf), Corollary 4.4, Proposition 5.1, Corollary 5.2 and Lemmas 6.2–6.6. Reductive finiteness is Lemma 6.6 in this version.
- **PAS22.** Vytautas Paškūnas, *On some consequences of a theorem of J. Ludwig*, J. Inst. Math. Jussieu 21 (2022), 1067–1106. [arXiv:1804.07567v3](https://arxiv.org/abs/1804.07567v3), §§5–6, Lemmas 6.1–6.2 and Theorem 6.5. Page locators use this version.
- **DPS23.** Gabriel Dospinescu, Vytautas Paškūnas and Benjamin Schraen, *Gelfand–Kirillov dimension and the p-adic Jacquet–Langlands correspondence*, J. reine angew. Math. (2023). [arXiv:2201.12922v2](https://arxiv.org/abs/2201.12922v2), Lemmas 7.1–7.4, Proposition 8.1, Lemma 8.2, Proposition 8.4, Lemma 8.6 and footnote 15. Page locators use this version.
- **GK14.** Toby Gee and Mark Kisin, *The Breuil–Mézard conjecture for potentially Barsotti–Tate representations*, Forum of Mathematics, Pi 2 (2014), e1. [arXiv:1208.3179v5](https://arxiv.org/abs/1208.3179v5), Appendix A, pp. 36–37.
- **STR08.** Matthias Strauch, *Geometrically connected components of Lubin–Tate deformation spaces with level structures*, Pure Appl. Math. Q. 4 (2008), 1215–1232. [arXiv:math/0611121v1](https://arxiv.org/abs/math/0611121v1), Theorems 4.3–4.4, pp. 11–13.
- **MOO68.** Calvin C. Moore, *Group extensions of p-adic and adelic linear groups*, Publ. Math. IHÉS 35 (1968), 5–70. [Numdam open text](https://www.numdam.org/item/PMIHES_1968__35__5_0/), Chapter II, Theorem 3.1, and Chapter III, Theorems 9.1–9.2, 10.3–10.4. Locators use printed pages.
- **LE19.** Daniel Le, *On some nonadmissible smooth irreducible representations for GL₂*, [arXiv:1809.10247v3](https://arxiv.org/abs/1809.10247v3), Theorems 1.1–1.2, pp. 1–2, §2, p. 4, and Theorems 3.2–3.4, pp. 5–6. Used only for the general-F negative control of §5.1.
- **ECD17.** Peter Scholze, *Étale cohomology of diamonds*, [arXiv:1709.07343v4](https://arxiv.org/abs/1709.07343v4), Propositions 14.8–14.9, pp. 85–86, and Lemma 23.6, p. 144. The arbitrary-torsion argument used here is Proposition 14.9.
- **BW00.** Armand Borel and Nolan Wallach, *Continuous cohomology, discrete subgroups, and representations of reductive groups*, second edition, Mathematical Surveys and Monographs 67 (2000), Chapter IX, Proposition 2.3. [Publisher record](https://doi.org/10.1090/surv/067).
