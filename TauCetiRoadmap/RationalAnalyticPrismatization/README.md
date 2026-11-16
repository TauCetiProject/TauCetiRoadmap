# Roadmap: rational analytic prismatization

**Summary.** Build Gelfand analytic geometry over ℚ_p — bounded solid ℚ_p-algebras, Gelfand rings and their Berkovich spectra, Gelfand stacks with the six-functor formalism obtained by transmutation into Scholze–Stefanich Gestalten, derived Berkovich spaces, analytic de Rham stacks, cones, deformation theory, Fargues–Fontaine curves and Hyodo–Kato stacks as Gelfand stacks — and on it the rational analytic prismatization of Anschütz–Le Bras–Rodríguez Camargo–Scholze: rational δ-spaces and analytic δ-stacks, the prismatization X^Δ of a Gelfand stack, its perfection, the p-adic twistor stack `X^{Div¹}` and the analytic Hodge–Tate stack X^HT, with the Breuil–Kisin twist, the prismatic logarithm and Faltings' extension. Independently, prove the decompletion theorem for Berkovich spaces with a continuous action of a p-adic Lie group and verify it in arithmetic, geometric and mixed Sen theory. The end theorems are: for a smooth partially proper rigid space X over a finite extension of ℚ_p, pullback along `FF_{X^⋄} → X^{Div¹}` is fully faithful and an equivalence on perfect complexes, also over every Berkovich-étale Y → `X^{Div¹}` (ALRS Theorem 6.3.1), with its perfectoid-base and arithmetic variants; `Γ(X^{Div¹}, O)` is pro-étale ℚ_p-cohomology; Hodge–Tate stacks recover v-perfect complexes with their arithmetic and geometric Sen operators and the inverse Faltings' extension; pro-étale torsors under p-adic Lie groups decomplete; Div¹ is cohomologically smooth with dualizing complex O{1}[2], for a rigid smooth map of relative dimension d to a smooth partially proper rigid space over ℚ_p the induced map of twistor stacks has dualizing complex O{d}[2d] in the Breuil–Kisin twist, and smooth proper maps satisfy Poincaré duality; the prismatic first Chern class satisfies the projective bundle formula; and formal Hodge–Tate stacks recover Scholze's Riemann–Hilbert functor.

## Scope and ownership

This roadmap owns the part of the theory of Gestalten on which the six-functor formalism of Gelfand stacks is built (Layer 0: higher presentable categories, Stefanich rings, n-affine, n-prim, n-proper, n-suave and n-étale maps, their locality on the target, and the transmutation of a six-functor formalism into Gestalten), the Gelfand analytic geometry over ℚ_p that the prismatization uses (Layers 1–6: bounded solid ℚ_p-algebras, Gelfand rings and stacks, derived Berkovich spaces, analytic de Rham stacks, deformation theory, cones, and Fargues–Fontaine discs, curves and Hyodo–Kato stacks as Gelfand stacks), the rational analytic prismatization with its δ-spaces, twistor and Hodge–Tate stacks, its comparison theorems and their consequences for duality and Chern classes (Layers 7–9, 11 and 12), and the decompletion of semilinear representations over Gelfand rings by locally analytic vectors (Layer 10). No other roadmap defines Gestalten, Gelfand rings or stacks, derived Berkovich spaces, analytic de Rham or Hyodo–Kato stacks, rational δ-spaces, analytic δ-stacks, the analytic prismatization, the p-adic twistor stack, analytic Hodge–Tate stacks or decompletions over Gelfand rings. Layers 0–7 form a self-contained public interface for downstream consumers, such as a rational analytic syntomification or an integral analytic prismatization.

The following are imported, not rebuilt. Light profinite sets and light condensed sets are already in the library (Mathlib `LightProfinite`, `LightCondensed`); light solid abelian groups are SolidAnalyticRings §1.5. The Berkovich spectrum of a normed ring is TropicalAndBerkovichArithmetic §§0.1–0.24 and AdicSpacesPartIII §R3.9; this roadmap only identifies M(A) := M(A^u) with it. Rigid spaces, the rigid–adic comparison, partially proper and smooth morphisms and dagger spaces are RigidAnalyticGeometry §6.2, AdicSpacesPartII §§R0.4, R0.10, R0.16, R1.1 and AdicSpacesPartIV §F1; the Banach arc-site and Marc(A) are MotivesAndAlgebraicCyclesPartII Layer 0, of which this roadmap uses the light qfd hypersheaf version of ABLB with a comparison (2.8). Perfectoid rings, tilting, A_inf and Fontaine's θ are PerfectoidSpaces §§P1–P2 and P7.16; diamonds and the diamond of an analytic adic space are DiamondsAndVStacks §§D2, D4, D6. Relative Fargues–Fontaine curves, untilt divisors and Div¹ as v-sheaves are RelativeFarguesFontaine §§1.2, 2.1–2.2, 3.2, 4.7, FarguesFontaineDiamonds §§F2, F4 and VectorBundlesAndIsocrystals Layers 0, 1, 2, 5 and 6; this roadmap realizes them as Gelfand stacks and proves the comparisons. Period sheaves, the classical Faltings' extension, Sen operators of C_p-representations and Scholze's associated local system functor E ↦ M(E) are PadicHodgeTheory §§2.2–2.3, 4.4, 7.1 with FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2; Tate's normalized traces and Tate's calculation of H⁰ and H¹(G_K, C_p(i)) for K/ℚ_p finite are PadicPeriodRings §§1.3–1.4, the latter recovered from the arithmetic Hodge–Tate stack in 11.2; the cyclotomic decompletion of Robba (φ, Γ)-modules is PhiGammaModulesAndIwasawaCohomology §1.4. The linear theory of locally analytic vectors is LocallyAnalyticRepresentationsOfLocalGroups §2.3 (Banach representations) and §3.8 (solid representations); uniform groups, compact p-adic analytic groups, ordered coordinates, finite-rank p-valuations with ordered bases and the resolution of ℤ_p by finitely generated free modules over the Iwasawa algebra of a uniform group are NoncommutativeAndEquivariantIwasawa §§0.1, 0.2, 0.6, 0.7, 0.11; this roadmap builds the light, semilinear version on Gelfand stacks and compares. Amice's theorem on the Mahler coefficients of locally analytic functions on ℤ_p with values in a Banach ℚ_p-space is PadicFunctionalAnalysis §4.4, and its form in d variables for functions ℤ_p^d → K, K a complete discretely valued extension of ℚ_p, is LocallyAnalyticDistributionsPartII §1.5; 10.4 keeps only Lazard's criterion in d variables with values in a ℚ_p-Banach space, which differs from the latter in the coefficients, and derives it from PadicFunctionalAnalysis §4.4 by induction on d. The integral prismatic objects of PrismaticCohomology §1.5, PrismaticCohomologyPartII §§3.8–3.9, 3.11, 4.12–4.13 and PrismaticCohomologyPartIII §6.10, the étale Chern classes and Poincaré duality of ClassicalAdicEtaleCohomology §9.3 and ClassicalAdicEtaleCohomologyPartII §5.9, and the Chern class comparison of CohomologyComparisons §6.7 are used only as Checks.

The general theory of analytic stacks — light analytic rings over `ℚ_{p,■}`, the ∞-topos of analytic stacks for !-equivalences, its quasi-coherent six-functor formalism and the Heyer–Mann extension theorem, suave, prim and cohomologically smooth or proper maps, Betti stacks, nuclear modules, perfect complexes on analytic stacks of Fredholm rings, the cotangent complex of analytic rings, Cartier duality for analytic vector bundles and algebraic stacks as analytic stacks — is AnalyticStacks (Layers 0–7), consumed at the sections named in the supplier contracts. Following ALRS Construction 2.1.2, the six-functor formalism on Gelfand stacks (2.2) is the one enlarged along Scholze–Stefanich's Gestalten. AnalyticStacks places Gestalten, their n-affine and n-proper maps and the transmutation of six-functor formalisms into them outside its scope (its Scope and ownership, Left to other roadmaps), and no other roadmap states them, so Layer 0 states the part of that theory used here, for arbitrary Stefanich rings and arbitrary six-functor formalisms on small ∞-categories with finite limits, on the presentable ∞-categories of EnhancedDerivedSheaves and the correspondences and six-functor formalisms of AnalyticStacks Layer 0. AnalyticStacks §7.3 defines 1-suave, 1-étale, 0-suave and 0-prim maps of commutative algebras in V-linear κ-presentable categories, the two-level case of these notions used for its Cartier dualities; Layer 0 defines them at every categorical level for Stefanich rings, as the transmutation of 0.5 requires, and compares the two in a Check of 0.4. Maps that ALRS proves 0-affine or 0-proper are stated as such, and Δ-!-ability is stated for all locally †-finitely presented maps of Berkovich spaces (12.1, 12.4).

Outside the scope: ℤ_p-coefficient analytic prismatization (ALRS Remark 1.27); filtered prismatization and syntomification (Hauck); characteristic-p geometry; the p-adic monodromy theorem (ABLB Theorem 7.1.1; for Galois representations, de Rham implies potentially semistable, NoncommutativeAndEquivariantIwasawa §F.6); the Bhatt–Zhang Simpson gerbe and its Cartier duality (ALRS Remark 4.4.6); the identification of `X^{Div¹}` with `FF^la_{X̃}/G^la` (ALRS Remark 1.22, open); the comparison of Hyodo–Kato stacks with Colmez–Nizioł Hyodo–Kato cohomology (ABLB Remark 6.1.3); the bases W(k)[1/p] and relative prisms of ALRS footnotes 48 and 50; the geometrization of the locally analytic Langlands programme.

## Conventions

Fix a prime p and the absolute value with |p| = `p^{-1}`. Coefficients are ℚ_p throughout; this is the source's restriction (ALRS Remark 1.27). All rings are solid ℚ_p-algebras with the analytic ring structure induced from `ℚ_{p,■}`, everything is derived, and Γ, f_*, f_!, ⊗ are derived functors. "Anima" means spaces in the sense of EnhancedDerivedSheaves §E0.5. Gelfand rings, Gelfand stacks and arc-stacks are separable and light; from Layer 3 onwards they are also qfd.

Six functors are those of 2.2, whose class of !-able maps is the one of ALRS Construction 2.1.2. Suave, prim, D-smooth (cohomologically smooth), D-proper (cohomologically proper) and D-étale are HM Definitions 4.5.1 and 4.6.1 for it. A map of Gelfand stacks is n-affine or n-proper when its transmutation into Gestalten is (0.2–0.3; Gest Definitions 6.5 and 6.12); a 0-proper map is !-able and prim with trivial codualizing complex, so f_! ≅ f_* (ALRS Remark 2.1.4), and a truncated 0-proper map is D-proper (2.2); the dualizing complex of a D-smooth map f is ω_f = f^!O. "Cartier divisor" means generalized Cartier divisor (L, s: L → O), L a line bundle (3.6). The universal divisor on A¹/G_m has ideal sheaf I of G_m-weight −1, and cones carry the twist (−1) of ALRS Lemma 2.8.6: on the special fibre the tangent direction has weight −1.

Berkovich-étale and Berkovich-smooth maps are those of ABLB Definition 3.2.8 (ABLB line 1658) and ALRS Definition 2.6.12 (ALRS line 1344), as in 1.6 and 4.2: locally on strict closed covers, composites of †-rational localizations and finite étale maps, respectively Berkovich-étale maps to A^n followed by the projection. They are not the étale and smooth morphisms of Berkovich's analytic geometry, which have no relative boundary, used in TropicalAndBerkovichArithmetic §0.30 and ClassicalAdicEtaleCohomology §3.1: a †-rational localization onto a closed subdisc is Berkovich-étale here, while there the inclusion of a strict closed subdisc is quasi-étale and not étale. The rigid étale and rigid smooth maps of 4.2, analytically locally built from open immersions, finite étale maps and the analytic affine spaces A^n, exclude this map as well.

For a p-adic Lie group G, G^cont, G^la and G^sm are the group Gelfand stacks of continuous, locally analytic and locally constant ℚ_p-valued functions, with maps G^cont → G^la → G^sm (3.4, 10.3). `X^{Div¹~}` denotes the perfect prismatization lim_φ X^Δ and Div¹~ = `GSpec(ℚ_p)^{Div¹~}` = lim_φ Q_p^Δ, written with a tilde over Div¹ in ALRS.

Radius. For a perfectoid S of characteristic p with pseudo-uniformizer ϖ, κ_ϖ(x) = log|[ϖ]|_x / log|p|_x on the punctured disc `D^×_{FF,S}`, with values in (0, ∞); Frobenius multiplies κ by p, and κ tends to 0 towards the locus p = 0 of Spa(A_inf), which `D^×_{FF,S}` does not contain. Witness: at the untilt C of C♭ with ϖ = p♭, κ = 1, and the n-th Frobenius translate has radius p^n. On X^Δ the radius is reciprocal: the Hodge–Tate locus lies at 1 and its n-th inverse Frobenius translate at `p^{-n}` (6.1, 8.5).

Twists. O(λ) on a Fargues–Fontaine curve descends O ⊗ `D_{−λ}`, D_λ the standard isocrystal of slope λ, so O(1) has nonzero sections: `Γ(FF_{C♭}, O(1))` = BC(O(1))(C) = 1 + `𝔪_{C♭}`, while `Γ(FF_{C♭}, O(−1))` = 0. On Hyodo–Kato stacks O(n) is the isocrystal `(ℚ_p, p^{-n}φ)`; O⟨1⟩ is the line bundle of `(ℚ_p, p^{-1}φ)`, and the dualizing complex of `Div^{1,dR}` and the Hyodo–Kato Tate twist is O⟨1⟩[2] (ABLB Definition 6.2.8, ABLB line 5300, and ALRS Theorem 6.5.4(1), ALRS line 8746, write O⟨1⟩ for the shifted complex O(1)[2]). Witness: H¹ of G_m in Hyodo–Kato cohomology is O(−1) = (ℚ_p, pφ), Frobenius acting on dlog T by p. The Tate twist ℚ_p(d) on a relative Fargues–Fontaine curve is the slope-zero line bundle of the cyclotomic character, not O(d). The Breuil–Kisin twist is O{1} = I_BK ⊗ O⟨1⟩; on Div¹ it is `I_{Div¹}` ⊗ O⟨1⟩, pulling back to the Tate twist on `FF_{Q_p^⋄}` and to Ĉ(1) on Q_p^HT. Witness on the cyclotomic prism: e = (log q/(q − 1)) ⊗ e⟨1⟩ satisfies φ(e) = `[p]_q^{-1}e`, and log_Δ(q) = (q − 1)e (9.8, 9.9).

Sen operators and actions. The arithmetic Sen operator of O{n} on X^HT is multiplication by n (ALRS Example 6.1.4), so Tate's computation reads H^i(Gal_K, C_p(n)) = H^i(K `→^{n}` K). An element a ∈ ℤ_p^× acts on the cyclotomic δ-space by `q^{1/p^m} ↦ q^{a/p^m}`, and p ∈ ℚ_p^× acts by Frobenius q ↦ q^p. Faltings' extension is 0 → O{1} → FE_X → Ω¹_X ⊗ O → 0, with O{1} = Ô(1) on X̂^⋄.

Universes and cardinals: Gelfand rings range over an essentially small model of κ-compact separable Gelfand rings for a fixed uncountable regular cardinal κ (ABLB footnote 27), and arc-stacks over separable perfectoid spaces; every construction is made for this fixed κ.

Gestalten. Layer 0 is stated for the same κ: presentable means κ-presentable, nPr is the ∞-category of presentable (∞, n)-categories relative to κ, and Gestalten are κ-small, as in ALRS Construction 2.1.2 (ALRS line 704). The source of Layer 0 works with κ = ℵ₁; its statements are used with “countably presented”, “countable” and “ℵ₁-compact” read as “κ-presented”, “κ-small” and “κ-compact”, the adaptation that the source describes for another uncountable regular cardinal (Gest line 2271–2273) and that ALRS line 705 uses. For a Stefanich ring A = (A_0, A_1, …) the term A_n lies in CAlg(nPr), and for the Gestalt X = Gest(A) one writes O(X)_n = A_n; the index is that of Gest, so that O(X)_1 is the ∞-category of 1-sheaves on X, and for the transmutation [Y]_D of 0.5 it is D(Y).

## Exact supplier contracts

### From Mathlib

Use Mathlib pin 1b1ccf4b088b32fa3f23f2de1127433254a81e1e.

- `LightProfinite` (Mathlib/Topology/Category/LightProfinite/Basic.lean:44) is the category of second countable profinite spaces, a CompHausLike category with total disconnectedness and second countability; it supplies the light test objects of 1.1 and the Betti realization of 2.5. `LightCondensed` (Mathlib/Condensed/Light/Basic.lean:29) is the category of ordinary light condensed objects for the coherent topology; it is used as the underlying site of light condensed anima, whose enhanced version CondAni is AnalyticStacks §2.1.
- `MulRingSeminorm` (Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean:61) is the carrier of points of Berkovich spectra in 1.5, through TropicalAndBerkovichArithmetic §0.1; Mathlib's `spectralNorm` (Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:381) concerns algebraic field extensions and is not the spectral seminorm of a Banach algebra.
- `WittVector` (Mathlib/RingTheory/WittVector/Defs.lean:52) supplies A_inf(A) = W(A°) for the Fargues–Fontaine discs of 6.1. `WittVector.fontaineTheta` (Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166) and `BDeRhamPlus` (Mathlib/RingTheory/Perfectoid/BDeRham.lean:75), the kernel-adic completion of W(R♭)[1/p] at ker θ, supply Fontaine's θ and B⁺_dR for 9.5 and 9.7; both take the integral ring R, p-adically complete with p not a unit, and are applied to the rings of power-bounded elements A° of the nonzero perfectoid ℚ_p-algebras A used here (for instance `O_{C_p}` for C_p), not to A itself, in which p is a unit; `BDeRhamPlus` is the zero ring when p = 0 in R, which does not occur for these A°.
- `CondensedMod.IsSolid` (Mathlib/Condensed/Solid.lean:83) is the solidity predicate on condensed modules over a ring, for all profinite test objects; this roadmap works with the light solid theory of SolidAnalyticRings §1.5 and does not use it.
- `PadicComplex` (Mathlib/NumberTheory/Padics/Complex.lean:137), the completion of an algebraic closure of ℚ_p, is C_p in the Checks of 1.8 and Layer 11.
- `continuousCohomology` (Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131), the n-th continuous cohomology of a continuous representation of a topological group, the homology of its complex of homogeneous continuous cochains; it is the Galois cohomology H^i(Gal_K, V) of the Checks of 6.4, 11.1, 11.2, 11.7 and 12.2 and of PadicPeriodRings §1.4. It is a sequence of cohomology groups, not a derived complex, and the pin does not identify it with the cohomology of the classifying stacks BG^cont of 10.2; where a Check writes RΓ(Gal_K, V), only its cohomology groups are used.
- `PadicInt.mahlerEquiv` (Mathlib/NumberTheory/Padics/MahlerBasis.lean:353) is Mahler's theorem: for a complete ultrametric normed ℤ_[p]-module E with bounded scalar action, the isometric ℤ_[p]-linear equivalence C(ℤ_[p], E) ≃ C₀(ℕ, E) sending f to its iterated forward differences at 0; iterated over the coordinates of ℤ_p^d it gives the binomial expansions of 10.4.

### From Tau Ceti

Use Tau Ceti pin 2fd255d997f47c0b5d834ee416c7015d55444ce5. The pinned library contains no Gelfand rings, prismatization, locally analytic vectors of representations, Sen operators or Hyodo–Kato theory. It contains `TauCeti.LocallyAnalytic` (TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45), the algebraic direct limit, along re-expansion on smaller discs, of the analytic stages of coefficient families of functions on ℤ_p that are analytic on every disc a + p^hℤ_p, with its evaluation `TauCeti.LocallyAnalytic.eval` (LocallyAnalytic.lean:85) into C(ℤ_p, E), injective when E has no p-torsion; it carries no topology. Its stages carry Amice's basis map `TauCeti.AnalyticStage.amiceMap` (TauCeti/NumberTheory/Padics/Distribution/Amice/Basis.lean:494), the norm-nonincreasing continuous linear map C₀(ℕ, E) → LA_h(E), (c_n) ↦ Σ_n ⌊n/p^h⌋!·binom(x, n)·c_n, for complete ultrametric E; Amice's theorem (PadicFunctionalAnalysis §4.4), that this map is an isometric isomorphism and hence identifies the image of the evaluation by a condition on Mahler coefficients, is not proved at the pin. A Check of 10.4 compares the case d = 1 of Lazard's criterion with these declarations. The library also contains the classical adic Fargues–Fontaine space, which is the adic carrier that 6.1–6.2 realize as Gelfand stacks and compare with:

- `TauCeti.FarguesFontaine.spaY` (TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean:116), the subset 𝒴 = D(p) ∩ D([ϖ]) of Spa(W(R), W(R)) for a commutative ring R of characteristic p, ϖ ∈ R and a topology on W(R); `TauCeti.FarguesFontaine.frobeniusHomeomorph` (Y.lean:220), Witt-vector Frobenius as a self-homeomorphism of 𝒴 when R is perfect and W(R) carries the (p, [ϖ])-adic topology.
- `TauCeti.FarguesFontaine.IsRadiusLowerBound` and `TauCeti.FarguesFontaine.IsRadiusUpperBound` (TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Window.lean:102, :108), the bounds q ≤ κ(v) and κ(v) ≤ q for κ(v) = log v([ϖ])/log v(p), stated without forming the logarithm; `TauCeti.FarguesFontaine.isRadiusLowerBound_comap_frobenius_iff` (Window.lean:149), which says that Frobenius multiplies κ by p, the normalization κ_ϖ ∘ φ = p·κ_ϖ of 6.1; the windows `TauCeti.FarguesFontaine.windowU` and `TauCeti.FarguesFontaine.windowV` (Window.lean:260, :267).
- `TauCeti.FarguesFontaine.spaX` (TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:59), the topological orbit space 𝒴/φ^ℤ, with `TauCeti.FarguesFontaine.compactSpace_spaX` (Quotient.lean:259) and `TauCeti.FarguesFontaine.t0Space_spaX` (Quotient.lean:271).

These are topological spaces of valuations, not Gelfand stacks; the Berkovich-space realization `D^×_{FF,S}` and its comparison with them are 6.1.

### From TauCetiRoadmap.SolidAnalyticRings

Light solid abelian groups, the light null test, solidification and solid tensor (§1.5); the solid group algebras ℤ_■[Π] of Layer 10 are built on them. Sections consumed: §1.5.

### From TauCetiRoadmap.AnalyticStacks

The general theory of analytic stacks over `ℚ_{p,■}` is consumed at the sections below; each item says what is assumed of the section and which source passages it restates.

- **Light solid analytic rings (§2.11, with §2.3(1), (7) and §3.6).** The light solid analytic ring `ℚ_{p,■}` and, on every animated commutative algebra in light solid ℚ_p-vector spaces, the analytic ring structure induced from it, base change and colimits of induced analytic rings being computed on the underlying algebras (RCSolid §§3–4, RCSolid line 732, RCSolid line 1417). Used in 1.1–1.4, 1.6, 2.1 and 10.1.
- **Analytic stacks (§3.3).** For a small category of analytic rings stable under pushouts and finite products, the ∞-topos of analytic stacks: presheaves of anima inverting countably presented !-equivalences, a map being a !-equivalence when every base change of every iterated diagonal induces an equivalence on !-categories; descendable maps of analytic rings are !-covers, and D(−) satisfies !-descent (ABLB Definition 4.2.1, ABLB line 2109; RCSolid Definition 6.3.13 and Corollary 6.3.15, RCSolid line 4295, RCSolid line 4330). Used in 2.1, 2.3, 2.4 and 3.1.
- **The quasi-coherent six-functor formalism (§§3.2–3.3, with §§0.5–0.6).** The six-functor formalism D(−) on affinoid analytic stacks with induced analytic structure, with f_! = f_*, base change and the projection formula (RCSolid Corollary 6.3.4, RCSolid line 4101); its extension to analytic stacks by the Heyer–Mann extension theorem (HM Theorem 3.4.11, HM line 2258; RCSolid Theorem 6.2.11, RCSolid line 3924; SixFF Proposition 5.16); and the construction of a three-functor formalism from a geometric setup in which pullback along the maps of a class P has base-changing right adjoints (HM Proposition 3.3.3, HM line 1924). Used in 2.2 and 6.4.
- **Suave, prim, smooth, proper and étale maps (§§0.8–0.11).** For a six-functor formalism, f-suave and f-prim objects, and D-suave, D-prim, D-smooth, D-proper and D-étale maps (HM Definitions 4.4.1, 4.5.1 and 4.6.1, HM line 3225, HM line 3505, HM line 3731), with their stability, locality and dualizing-complex calculus (HM Lemmas 4.4.5–4.4.11, 4.5.7–4.5.18 and 4.6.3–4.6.4, HM line 3288, HM line 3339, HM line 3569, HM line 3783), and, for a stable formalism, prim descendable descent: a D-prim map g with g_*1 descendable is of universal ∗- and !-descent (§0.11(ii); HM Lemma 4.7.4(i), HM line 3858), and a map f with f∘g D-prim is then D-prim (§0.9; HM Corollary 4.7.5(ii), HM line 3895). Used in 2.2, 2.7, 3.3, 5.3, 6.3, 6.4, 10.2, 10.3, 12.1, 12.2 and 12.4.
- **Classifying stacks of locally profinite groups (§4.2).** For a second-countable locally pro-p group G and ℚ_p-coefficients, the classifying stack of locally constant ℚ_p-valued functions on G is !-able and cohomologically smooth, with dualizing complex the unit in degree 0 on which G acts through the modulus δ(g) = [gKg⁻¹ : K], K an open pro-p subgroup `(HM Example 5.3.21, HM line 4911, in the quasi-coherent formalism over ℚ_{p,■})`. Used in 10.3 and 12.2.
- **Perfect complexes on analytic stacks of Fredholm rings (§4.5).** For an essentially small category C₀ of affinoid analytic stacks of Fredholm analytic rings, closed under finite limits and finite coproducts, and integers a ≤ b, the unique extension of A ↦ `Perf^{[a,b]}(A)` to a sheaf of categories on AnStk(C₀) inverting !-equivalences, perfectness and amplitude being tested on a jointly surjective family of affinoids (ABLB Lemma 4.2.11, Definition 4.2.12 and Remark 4.2.13, ABLB line 2235, ABLB line 2253, ABLB line 2257, stated there for Gelfand rings). It is applied to C₀ = `GelfRing_{ω₁}^op`, every Gelfand ring being Fredholm by 1.7. Used in 2.3.
- **Betti stacks (§4.1, with §2.1).** The Betti realization of light condensed anima, the ∞-category CondAni of §2.1, in analytic stacks over `ℚ_{p,■}`, preserving colimits and finite limits, with S^Betti = AnSpec(C^lc(S, ℚ_p)) for light profinite S, and the descent of D along hypercovers of light profinite sets (RCSolid §6.5, RCSolid line 4745; ABLB Lemma 4.2.9, ABLB line 2214). Used in 2.5.
- **Nuclear modules (§4.3, with RefinedTraceMethods §4.3).** Nuclear objects of D(A) for a solid ℚ_p-algebra A, characterized by the Hom criterion in the opening of §4.3 (ABLB Definition A.0.4, ABLB line 6767), and, for nuclear A, §4.3(1): nuclearity tested on the underlying ℚ_p-module and on homotopy groups, with closure under countable limits (ABLB Lemmas A.0.7–A.0.8, ABLB line 6789, ABLB line 6795). Closure of nuclear objects under colimits and tensor products and the identification of the ω₁-compact nuclear objects with the basic nuclear ones (ABLB Lemma A.0.6, ABLB line 6781) are RefinedTraceMethods §4.3 (Nuclear objects; Closure and generation of nuclear objects), applied to D(A), which is compactly generated with compact unit. Descent of nuclear modules along descendable maps of Gelfand rings is 2.3. Used in 2.3, 3.2 and 10.2.
- **Fredholm criteria (§4.4(1), (3)–(5)).** For a map of analytic rings A → B with − ⊗_A B conservative, descent of connectivity and of perfect amplitude, and !-local perfectness over Fredholm rings (Sch24 Proposition VI.1.2, Corollaries VI.1.3–VI.1.4, Sch24 line 1720); A is Fredholm if and only if the cone of 1 − f is perfect for every trace-class endomorphism f of a compact object (Sch24 Proposition VI.1.5, Sch24 line 1743); and for A → Ā surjective on π₀ with Ā Fredholm and the Nakayama condition on finitely presented static modules, A is Fredholm (Sch24 Proposition VI.1.7, Sch24 line 1755). The Fredholm property of Banach ℚ_p-algebras with the induced structure is 1.7. Used in 1.7, 2.3 and 3.5.
- **The cotangent complex of analytic rings (§§5.1–5.3).** For maps A → B of solid animated ℤ-algebras and of analytic rings with induced structure, `L_{B/A} ∈ D_{≥0}(B)` corepresenting M ↦ Der_A(B, M), with `L_{B′/A′} = L_{B/A}` ⊗_B B′ for pushouts, compatibility with colimits, the transitivity fibre sequence and `L_{B/A}` = 0 for idempotent A → B (RCSolid Definition 7.4.1 and Lemma 7.4.3, RCSolid line 5257, RCSolid line 5276; ALRS Lemma A.1.1, ALRS line 9427); agreement with the animated cotangent complex of EnhancedDerivedSheaves §E5:cotangent-export.1 on discrete rings, so that for discrete A, `L_{A/ℤ}` is discrete with `L_{A/ℤ}(*) = L_{A(*)/ℤ}` (RCSolid Example 7.4.4(1), RCSolid line 5295); and descent of exterior powers along descendable maps, ∧^m_A `L_{A/R} ≃ Tot(∧^m_{A^•} L_{A^•/R})` (ALRS Lemma A.1.2, ALRS line 9435). Used in 4.5.
- **Cartier duality of the overconvergent and analytic vector groups (§7.5(4), with §7.2(3)).** The 1-categorical Cartier duality between the overconvergent group `G_a^{♯,†}` and the analytic group G_a^an through the pairing `G_a^{♯,†}` × G_a^an → G_m (RC26a Proposition 3.2.27, RC26a line 1936; ALRS cites it as RC26a Theorem 3.2.27). Used in 5.3, 11.2, 11.5, 11.8 and 12.6.
- **Stacky Cartier duality (§7.6).** Cartier duality for transmuted vector bundles over the ring stacks of RC26a Example 3.2.36, exchanging ∗- and !-functors in the category of kernels (RC26a Theorem 3.2.37, RC26a line 2085). Used in 5.3, 11.2, 11.5, 11.8 and 12.6.
- **Classifying stack of the analytic multiplicative group (§7.7).** The identification of D(BG_m) with modules over the dual nuclear Fréchet algebra of sequences `(a_n)_{n∈ℤ}` with |a_n| `r^{|n|}` → 0 for some r > 0 (RJRC Proposition 4.4.8, RJRC line 2134). Used in 5.3.
- **Algebraic stacks as analytic stacks (§3.8, with §1.6).** The realization (−)^cond of algebraic stacks as analytic stacks, with D(X^cond) = `Fun_{QCoh(ℤ)}(QCoh^!(X), D(ℤ^cond))` and, for !-able X, D(X^cond) = QCoh(X) `⊗_{QCoh(ℤ)}` D(ℤ^cond) (RCSolid §6.4 and Remark 6.4.1, RCSolid line 4457, RCSolid line 4465), with the resulting descriptions of sheaves on BG_m^alg, `A^{1,alg}/G_m^alg` and Â¹/G_m^alg as graded, filtered and complete filtered modules (ALRS Remark 2.9.1, ALRS line 1866). Used in 5.3, 9.5 and 12.6.
- **The formal line and shearing (§1.7, with §3.8).** Over `ℚ_{p,■}`, the identification Â¹ = BG_a[−1] and the shearing equivalence identifying the heart of the Beilinson t-structure on BG_a[−1]/G_m^alg with chain complexes of solid ℚ_p-vector spaces (ALRS Remarks 2.9.1–2.9.2, ALRS line 1866, ALRS line 1900); AnalyticStacks §1.7 fixes the direction of the differential, which raises the weight. Used in 5.3.
- **Cones and the adic filtration (§6.5(3)–(4)).** For a map A → B of analytic rings with induced structure, surjective on π₀, the algebraic cone of AnSpec B → AnSpec A is the relative spectrum over `A^{1,alg}/G_m^alg` of the adic filtration of A → B, and its algebraic formal cone is the restriction to Â¹/G_m^alg (RCSolid Remarks 7.7.17–7.7.18, RCSolid line 6063, RCSolid line 6072). The extension to !-Zariski closed maps of Gelfand stacks by descent (ALRS Remark 2.9.7(2), ALRS line 2086) is 5.1. Used in 5.1 and 9.5.
- **Regular immersions (§6.3(1)).** A regular Zariski closed immersion A → A/(a_1, …, a_c) of analytic rings with trivial analytic structure is suave, with dualizing complex det(I/I²)^∨[−c], I = (a_1, …, a_c) (RCSolid Lemma 6.3.5, RCSolid line 4111). Used in 12.1 and 12.2.
- **Solid Serre duality (§§6.4 and 6.6).** For a locally solid smooth map g of solid Huber rings of relative dimension d, cohomological smoothness with dualizing complex ω_g ≅ det(L_g)[d] = Ω^d_g[d], canonical up to a sign depending only on d; in relative dimension one, ω_g ≅ L_g[1] (RCSolid Theorems 7.7.1 and 7.7.21, RCSolid line 5827, RCSolid line 6208), as used in ALRS Remark 6.5.6 (ALRS line 8825), which writes L_g[d] for det(L_g)[d]; the two agree for the one-dimensional maps the remark applies it to. Used in 3.3 and 12.2.
- **Correspondences, six-functor formalisms and D-stacks (§§0.2, 0.4, 0.12–0.13, with §2.3(7) and §3.2).** The symmetric monoidal ∞-category Corr(C) of a small ∞-category with finite limits, three- and six-functor formalisms on it, Künneth formalisms, and the ∞-topos of presheaves inverting !-equivalences; the quasi-coherent formalism on affinoids satisfies the Künneth formula; and, for a Künneth formalism, descent of linear categories along a family of universal ∗- and !-descent (§0.12(d)). Used in Layer 0, 10.2 and 10.3; the two-level suave and prim maps of §7.3 are compared with those of Layer 0 in a Check of 0.4.

Sections consumed: §0.2, §0.4, §0.5, §0.6, §0.8, §0.9, §0.10, §0.11, §0.12, §0.13, §1.6, §1.7, §2.1, §2.3, §2.11, §3.2, §3.3, §3.6, §3.8, §4.1, §4.2, §4.3, §4.4, §4.5, §5.1, §5.2, §5.3, §6.3, §6.4, §6.5, §6.6, §7.2, §7.3, §7.5, §7.6, §7.7.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Spaces and ∞-categories (§E0.5), κ-filtered diagrams, accessibility and presentability (§E0.8), hypercovers and descent (§E2.6), sheaves of spaces (§E2.7), algebras and modules (§E5:abstract.2), the Barr–Beck–Lurie monadicity theorem (§E5:abstract.5), compact generation and Ind-completion (§E5:presentability.1), presentable ∞-categories and their limits (§E5:presentability.2), dualizable presentable categories (§E5:presentability.4), descendable algebras and module descent with the uniform-index colimit criterion (§E5:descent), animation and sifted left Kan extension from polynomial rings to animated rings (§E5:animation.1), and the animated cotangent complex and its animated exterior powers (§E5:cotangent-export.1, §E5:cotangent-export.2). Sections consumed: §E0.5, §E0.8, §E2.7, §E5:descent, §E5:presentability.1, §E5:presentability.2, §E5:presentability.4, §E2.6, §E5:cotangent-export.1, §E5:abstract.2, §E5:abstract.5, §E5:animation.1, §E5:cotangent-export.2.

### From TauCetiRoadmap.DerivedModuleAlgebra

The classical cotangent complex (§0.4), square-zero extensions (§0.5), cotangent obstruction theory (§0.25) and perfect complexes over discrete rings (§1.E.0). Sections consumed: §1.E.0, §0.4, §0.5, §0.25.

### From TauCetiRoadmap.MotivesAndAlgebraicCyclesPartII

The Banach arc-site, Marc(A) = Marc(A^u), strictly totally disconnected Banach rings and quasi-pro-étale maps (Layer 0); compared with ABLB light qfd arc-stacks in 2.8. Sections consumed: Layer 0.

### From TauCetiRoadmap.TropicalAndBerkovichArithmetic

Berkovich spectra of normed rings, compactness, nonemptiness, spectra of normed fields, completed residue fields, Berkovich analytic spaces and the uniform Gelfand representation (§§0.1–0.24). Sections consumed: §0.8, §0.7, §0.1, §0.11, §0.13, §0.15, §0.17, §0.19.

### From TauCetiRoadmap.AdicSpacesPartIII

The Gel'fand spectrum of a Banach ring and Berkovich's spectral seminorm formula (§R3.9). Sections consumed: §R3.9.

### From TauCetiRoadmap.AdicSpacesPartII

Spectral seminorm and uniformization (§R0.4), partially proper morphisms (§R0.10), smooth morphisms (§R0.16), rigid-analytic spaces (§R1.1). Sections consumed: §R0.4, §R1.1, §R0.10, §R0.16.

### From TauCetiRoadmap.AdicSpacesPartIV

Overconvergent Tate algebras, dagger algebras and dagger spaces (§§F1.1–F1.2, F1.7). Sections consumed: §F1.2, §F1.1, §F1.7.

### From TauCetiRoadmap.RigidAnalyticGeometry

The classical presentation of rigid spaces over a complete nonarchimedean field (§6.2). Sections consumed: §6.2.

### From TauCetiRoadmap.PerfectoidSpaces

Perfectoid Tate rings and fields (§§P1.1, P1.10), W(R⁺) (§P1.16), the tilting equivalence (§P1.27), perfectoid spaces (§P2.10) and the pro-étale site of a rigid space (§P7.16). Sections consumed: §P1.1, §P1.10, §P2.10, §P1.27, §P1.16, §P7.16.

### From TauCetiRoadmap.SchemeAndStackFoundations

Stacks in groupoids, algebraic stacks and quasi-coherent sheaves on them (§§1.18, 1.19, 1.22), quotient stacks and [𝔸¹/𝔾_m] (§1.21), line bundles and 𝔾_m-torsors (§1.15), deformation to the normal cone (§5.5). Sections consumed: §1.18, §1.19, §1.22, §1.21, §1.15, §5.5.

### From TauCetiRoadmap.ReductiveGroups

Representations as comodules and Tannakian reconstruction for affine group schemes (Layer 1). Sections consumed: Layer 1.

### From TauCetiRoadmap.AdicEtaleGeometry

Smooth morphisms by ball charts (§A2.4) and the pro-étale site of an analytic adic space (§A1.12). Sections consumed: §A2.4, §A1.12.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Algebraic Kummer Chern classes and the étale projective bundle formula (§0.9). Sections consumed: §0.9.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

The proper algebraic comparison for adic étale cohomology (§8.2) and Kummer Chern classes of line bundles on rigid spaces (§9.3), used in the proof of the projective bundle formula and compared with prismatic Chern classes in 12.5. Sections consumed: §8.2, §9.3.

### From TauCetiRoadmap.RelativeFarguesFontaine

Radius functions and period annuli (§1.2), the relative curve (§2.1), its diamond (§2.2), untilts as closed Cartier divisors (§3.2) and Div¹ (§4.7). Sections consumed: §2.2, §1.2, §2.1, §4.7, §3.2.

### From TauCetiRoadmap.VectorBundlesAndIsocrystals

Relative period domains, curves, untilt divisors and twists (Layer 0), isocrystals and slope blocks (Layer 1), vector bundles on curves, their cohomology and v-descent, with RΓ_proét(S, ℚ_p) = RΓ(X_S, O) (Layer 2), Banach–Colmez spaces, the fundamental exact sequence and the properness of the moduli Div^d of effective divisors over ∗ (Layer 5), slope-zero bundles and local systems (Layer 6). Sections consumed: Layer 0, Layer 1, Layer 2, Layer 5, Layer 6.

### From TauCetiRoadmap.FarguesFontaineDiamonds

The Frobenius quotient and its diamond (§F2) and marked untilts as analytic Cartier divisors (§F4). Sections consumed: §F2, §F4.

### From TauCetiRoadmap.DiamondsAndVStacks

The diamond of an analytic adic space (§D6.4), used for the diamonds X^⋄ of rigid and Berkovich spaces throughout Layers 6–12, and the étale-site comparison for analytic adic spaces over ℤ_p (§D6.5), which 11.7 extends to pro-étale cohomology with p-adic coefficients through the requirement below. Sections consumed: §D6.4, §D6.5.

What DiamondsAndVStacks must provide (gap:proetale-v-comparison): For a rigid space X over a complete nonarchimedean extension K of ℚ_p, natural equivalences RΓ_proét(X, Ẑ_p) ≃ RΓ_v(X^⋄, ℤ_p) and RΓ_proét(X, ℚ̂_p) ≃ RΓ_v(X^⋄, ℚ_p), compatible with restriction, between pro-étale cohomology with coefficients Ẑ_p and ℚ̂_p = Ẑ_p[1/p] and v-cohomology of the diamond with coefficients ℤ_p and the topological ℚ_p (§D6.5).

Here X_proét is the pro-étale site of AdicEtaleGeometry §A1.12 and X^⋄ the diamond of §D6.4. The rational equivalence is obtained for qcqs X by inverting p in the integral one and in general by descent along the affinoid opens of X, both sides being hypersheaves on the analytic site of X; it extends the étale-site comparison of §D6.5 to pro-étale cohomology with p-adic coefficients, and it is used in 11.7.

### From TauCetiRoadmap.PadicHodgeTheory

Horizontal and structural de Rham period sheaves and the classical Faltings' extension (§§2.2–2.3), Sen operators of C-representations (§4.4) and Scholze's associated local system functor E ↦ M(E) (§7.1). Sections consumed: §2.2, §2.3, §4.4, §7.1.

### From TauCetiRoadmap.AInfCohomology

Integral pro-étale period sheaves and the structural de Rham periods (§AI.3.1). Sections consumed: §AI.3.1.

### From TauCetiRoadmap.PadicPeriodRings

Normalized cyclotomic traces and the Tate–Sen calculation (§§1.3–1.4), used in 10.10; Tate's calculation of H⁰ and H¹(G_K, C_p(i)) for K/ℚ_p finite in continuous cohomology (§1.4), which 11.2 recovers from the arithmetic Hodge–Tate stack and compares in a Check. Sections consumed: §1.3, §1.4.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Labelled Sen operators with HT(χ_p) = +1 (§R07.P7.2), used to pin the sign of the arithmetic Sen operator. Sections consumed: §R07.P7.2.

### From TauCetiRoadmap.PadicFunctionalAnalysis

Amice's analytic basis (§4.4): for a complete ultrametric module E with bounded ℤ_p-action, the isometry C₀(ℕ, E) ≃ LA_h(E), (c_n) ↦ Σ_n ⌊n/p^h⌋!·binom(x, n)·c_n, onto the stage LA_h(E) of coefficient families of functions analytic on every disc a + p^hℤ_p, and, for a Banach ℚ_p-space E, the characterization of LA_h and of local analyticity of continuous functions ℤ_p → E by their Mahler coefficients; 10.4 applies it with E a Banach space of analytic functions in the remaining variables. Sections consumed: §4.4.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

Uniform pro-p groups (§0.1), compact p-adic analytic groups with an open normal uniform subgroup and their analytic structure (§0.2), the ordered coordinates of a uniform group (§0.6), and finite-rank p-valuations with ordered bases, saturation and the compatible analytic structure (§0.7), and, for a uniform group U of dimension d, its p-cohomological dimension d and the resolution of the trivial module ℤ_p of length d by finitely generated free Λ(U)-modules, with the finite global dimension of Λ(G) for G without elements of order p (§0.11); 10.2 reads this resolution in solid `ℤ_{p,■}[U]`-modules. Sections consumed: §0.1, §0.2, §0.6, §0.7, §0.11.

### From TauCetiRoadmap.RefinedTraceMethods

The derived HKR filtration on Hochschild homology of commutative rings, complete, left Kan extended from polynomial rings, with graded pieces ∧^n L[n] (§1.10), and Hochschild homology of a commutative or animated ring as its tensor with the circle, functorial in the space (§1.7); 4.5 uses them, with the same left Kan extension from polynomial rings to animated rings, for p-completeness of the solid cotangent complex. Nuclear and basic nuclear objects of a compactly generated presentable symmetric monoidal stable ∞-category with compact unit, their closure under colimits and tensor products, and the identification of the ω₁-compact nuclear objects with the basic nuclear ones (§4.3); 2.3, 3.2 and 10.2 use them for D(A), A a solid ℚ_p-algebra. Sections consumed: §1.7, §1.10, §4.3.

### Comparison partners used only in Checks

- TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups: Pan's derived functors R^iLA of locally analytic vectors of Banach representations (§2.3) and the κ-condensed derived locally analytic vectors V^Rla of solid representations (§3.8), compared with Layer 10 in Checks.
- TauCetiRoadmap.LocallyAnalyticDistributionsPartII: Amice's theorem in d variables for functions ℤ_p^d → K, K a complete discretely valued extension of ℚ_p (§1.5), the case M = K of Lazard's criterion in 10.4, compared in a Check.
- TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology: The cyclotomic decompletion between ordinary and extended Robba (φ, Γ)-modules (§1.4, extended descent and arbitrary-module decompletion), compared with 11.1 in a Check.
- TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII: Rational p-adic Poincaré duality for smooth proper rigid spaces (§5.9), recovered in a Check of 12.4.
- TauCetiRoadmap.CohomologyComparisons: The first Chern class comparison (§6.7), a Check of 12.5.
- TauCetiRoadmap.PrismaticCohomology: Breuil–Kisin twists of A/I-modules (§1.5), a normalization Check.
- TauCetiRoadmap.PrismaticCohomologyPartII: Breuil–Kisin twists of transversal prisms and of all prisms (§§3.8–3.9), the generator e_A of the twist of the q-de Rham prism with φ(e_A) = `[p]_q^{-1}e_A` and (q − 1)e_A = log_Δ(q^p) (§3.11), WCart^HT ≅ BG_m^♯ (§4.12) and the Sen operator `Θ_{O{n}}` = n (§4.13), normalization Checks for 9.7–9.9.
- TauCetiRoadmap.PrismaticCohomologyPartIII: The integral prismatic logarithm (§6.10), a normalization Check for 9.9.

## How to read the build

Layer 0 states the part of the theory of Gestalten from which the six-functor formalism of Gelfand stacks is built: Stefanich rings, the n-affine, n-prim and n-proper maps with their stability and locality, and the transmutation of a six-functor formalism into Gestalten; it is general higher category theory and depends only on EnhancedDerivedSheaves and AnalyticStacks. Layer 1 builds Gelfand rings from bounded solid ℚ_p-algebras and identifies their Berkovich spectra with those of the supplier Banach-ring theory; Layer 2 glues them into Gelfand stacks, proves that perfect complexes are dualizable and descend, that nilperfectoid rings form a basis, and embeds derived Berkovich and rigid spaces; Layer 3 adds the analytic de Rham stack, analytification and Cartier divisors. Layer 4 fixes the morphism classes, pushouts and deformation theory used later, and Layer 5 the cone construction and the filtered de Rham stack. Layer 6 realizes Fargues–Fontaine discs, curves and Hyodo–Kato stacks as Gelfand stacks. Layers 7–9 are the core of the prismatization: δ-spaces and δ-stacks, the prismatization with its twistor and Hodge–Tate stacks, and their explicit geometry (Hodge–Tate gerbes, Faltings' extension, ℚ_p, the Breuil–Kisin twist, the prismatic logarithm). Layer 10 is the decompletion theory; it depends only on Layers 0–7 and is placed before its first use in Layer 11. Layer 11 combines Layers 9 and 10 into the comparison theorems, with the headline 11.6, and Layer 12 derives duality, Chern classes and the relation to the Riemann–Hilbert functor. Each subsection states its target with hypotheses and locators; a proof route names one route and its inputs without making it mandatory, and the *Needs:* line lists what the statement and that route use.

## Layer 0: Gestalten and the transmutation of six-functor formalisms

This layer states the part of Scholze–Stefanich's theory of Gestalten from which the six-functor formalism on Gelfand stacks of 2.2 is built: the presentable (∞, n)-categories nPr and Stefanich rings, the n-affine, n-prim, n-proper, n-suave and n-étale maps of Gestalten with their stability under base change and composition and their locality on the target, and the transmutation of a six-functor formalism into Gestalten. Everything here concerns arbitrary Stefanich rings and arbitrary six-functor formalisms on small ∞-categories with finite limits; Gelfand rings and analytic rings appear only in Checks. Throughout, κ is the uncountable regular cardinal of the Conventions, nPr means presentable (∞, n)-categories relative to κ, and "κ-presented" and "κ-small" take the place of the source's "countably presented" and "countable" (Conventions).

### 0.1 Higher presentable categories, Stefanich rings and Gestalten

Let Pr^L_κ be the ∞-category of κ-presentable ∞-categories and colimit-preserving functors that preserve κ-compact objects (Gest Definition 2.7, p. 18, Gest line 561). Prove Gabriel–Ulmer duality in this form: C ↦ C^κ is an equivalence from Pr^L_κ to the ∞-category of small ∞-categories with κ-small colimits and functors preserving them, with inverse Ind_κ (Gest line 584–588). Prove that Pr^L_κ is itself κ-presentable, so that Pr^L_κ is an object of Pr^L_κ, and that Lurie's tensor product makes it a symmetric monoidal κ-presentable ∞-category (Gest Theorem 2.9, p. 19, Gest line 578; Gest line 923). For a symmetric monoidal κ-presentable ∞-category C, prove that A ↦ Mod_A(C) is a fully faithful functor CAlg(C) → CAlg(Mod_C(Pr^L_κ)) whose right adjoint sends D to the endomorphisms End_D(1) of its unit (Gest Theorem 3.11, p. 27, Gest line 930). Define 1Pr = Pr^L_κ and inductively (n + 1)Pr = `Mod_{nPr}(Pr^L_κ)`, each a symmetric monoidal κ-presentable ∞-category, with the fully faithful embeddings CAlg(nPr) → CAlg((n + 1)Pr), C ↦ Mod_C(nPr) (Gest line 945–954), and put 0Pr = Ani. Define the ∞-category StRing of Stefanich rings as the colimit of CAlg(Ani) → CAlg(1Pr) → CAlg(2Pr) → ⋯ along these embeddings, formed in 1Pr = Pr^L_κ, whose morphisms are the colimit-preserving functors that preserve κ-compact objects, equivalently the limit of ∞-categories along the right adjoints D ↦ End_D(1). It is not the union of the CAlg(nPr), the colimit in ∞-categories: a Stefanich ring need not be n-affine over the unit for any n (third Check of 0.2). Concretely, a Stefanich ring is a sequence A = (A_0, A_1, A_2, …) with A_n ∈ CAlg(nPr) and A_n ≅ `End_{A_{n+1}}(1)`, A_0 being a commutative monoid in anima (Gest Definition 3.13, p. 28, Gest line 959; Gest Definition 6.1, p. 47, Gest line 1712). Define the ∞-category of Gestalten as Gest = StRing^op, write Gest(A) for the Gestalt of A and O(X)_n = A_n for X = Gest(A), so that O(X)_1 is the ∞-category of 1-sheaves on X (Gest Definition 1.26, p. 14, Gest line 399; Gest line 2472). A map f: A → B of Stefanich rings is a compatible family of maps `f^*_{n−1}`: A_n → B_n in CAlg(nPr), n ≥ 1, each with a lax symmetric monoidal right adjoint `f_{n−1,*}`; define the relative algebras (B/A)_n = `f_{n,*}(1) ∈ CAlg(A_{n+1})` for n ≥ 0. Prove that for n ≥ 1 the functor CAlg(A_n) → `StRing_{A/}` is fully faithful with right adjoint B ↦ `(B/A)_{n−1}`, and that B ↦ ((B/A)_0, (B/A)_1, …) is an equivalence from Stefanich A-algebras to the colimit of CAlg(A_1) → CAlg(A_2) → ⋯ along C ↦ Mod_C(A_n), formed in 1Pr, equivalently the limit of ∞-categories of CAlg(A_1) ← CAlg(A_2) ← ⋯ along B ↦ End_B(1) (Gest Proposition 6.2, p. 47, Gest line 1740; Gest line 1751–1752).

A proof route: Gabriel–Ulmer duality follows from the presentation of a κ-presentable ∞-category as the κ-Ind-completion of its κ-compact objects (EnhancedDerivedSheaves §§E0.8, E5:presentability.1); the ∞-category of small ∞-categories with κ-small colimits is monadic over Cat∞ by the Barr–Beck–Lurie theorem (EnhancedDerivedSheaves §E5:abstract.5), hence has all small colimits, and its forgetful functor preserves κ-filtered colimits, which gives κ-presentability (Gest proof of Theorem 2.9, Gest line 584–610). For Proposition 6.2 rewrite each term `CAlg(nPr)_{A_n/}` of the limit description of `StRing_{A/}` as `CAlg(Mod_{A_n}(1Pr))` and the transitions through `A_{n+1}`; full faithfulness of CAlg(A_n) → `CAlg(A_{n+1})` is checked on κ-presented algebras R, for which the forgetful functor Mod_R(A_n) → A_n is an A_n-linear right adjoint preserving κ-compact objects (Gest line 1760–1784).

*Needs:* EnhancedDerivedSheaves §E0.8; EnhancedDerivedSheaves §E5:presentability.1; EnhancedDerivedSheaves §E5:presentability.2; EnhancedDerivedSheaves §E5:abstract.2; EnhancedDerivedSheaves §E5:abstract.5.

The API has the following laws.

- The unit (∗, Ani, 1Pr, 2Pr, …) is the initial Stefanich ring, so its Gestalt is the final Gestalt, and every Stefanich ring A receives compatible symmetric monoidal maps (n − 1)Pr → A_n (Gest line 1717).
- A commutative algebra C of 1Pr defines the Stefanich ring (C, Mod_C(1Pr), `Mod_{Mod_C(1Pr)}(2Pr)`, …), fully faithfully in C (Gest Remark 3.14, p. 28, Gest line 964); its Gestalt is written Gest(C).
- Module categories turn relative tensor products of commutative algebras into relative tensor products of categories: for commutative algebras B, B′ over A in a symmetric monoidal κ-presentable C, Mod_B(C) `⊗_{Mod_A(C)}` `Mod_{B′}(C) ≅ Mod_{B ⊗_A B′}(C)` (Gest Example 3.12, p. 27, Gest line 936).
- Small limits of Stefanich rings exist and are computed levelwise, (lim_i B_i)_n = lim_i (B_i)_n; equivalently colimits of Gestalten are computed levelwise on their rings (Gest line 2366, Gest line 2488–2490).
- For n ≥ 1, the n-fold shift (A_n, `A_{n+1}`, …) of a Stefanich ring is a Stefanich ring under (nPr, (n + 1)Pr, …), and shifting is an equivalence StRing ≅ `StRing_{(nPr, (n+1)Pr, …)/}` (Gest Proposition 6.4, p. 49, Gest line 1808).

**Checks.**

- For a field k and C = D(k), the Stefanich ring of C has A_1 = D(k) and A_2 = `Mod_{D(k)}(1Pr)`, and the endomorphisms of the unit of A_2 are the D(k)-linear colimit-preserving endofunctors of D(k), which form D(k) = A_1, as the limit description requires. Taking A_2 = 1Pr instead, without the D(k)-linearity, would give End(1) = Fun^L(Ani, Ani) = Ani ≠ D(k).
- For A = ℚ_p and B = B′ = ℚ_p[x], Mod_B(D(ℚ_p)) `⊗_{D(ℚ_p)}` `Mod_{B′}(D(ℚ_p))` = D(ℚ_p[x, y]), whose unit has endomorphism ring ℚ_p[x, y]; the product D(ℚ_p[x]) × D(ℚ_p[x]) = D(ℚ_p[x] × ℚ_p[x]) has ℚ_p[x] × ℚ_p[x] instead, so the tensor product of the third law is not the product of categories.
- The size cutoff is needed: in the ∞-category of all presentable ∞-categories and colimit-preserving functors, the functors Ani → C form C itself, so that ∞-category is not locally small, while in Pr^L_κ they form the small ∞-category C^κ of κ-compact objects (Gest Remark 2.8, p. 18, Gest line 566–572).
- The terminal Stefanich ring (∗, ∗, ∗, …), all of whose terms are the zero category, has as Gestalt the initial Gestalt ∅ (Gest line 2522–2523).

### 0.2 n-affine maps

For a Stefanich ring A and n ≥ 0, call a Stefanich A-algebra B, equivalently the map of Gestalten Gest(B) → Gest(A), n-affine if B lies in the essential image of `CAlg(A_{n+1}) → StRing_{A/}`, that is, if B is recovered from (B/A)_n by passing to module categories (Gest Definition 6.5, p. 50, Gest line 1862). Prove that n-affine A-algebras are stable under all small colimits in `StRing_{A/}`; that for n-affine B and m ≥ n the functor `Mod_{(B/A)_m}(A_{m+1}) → B_{m+1}` is an equivalence; that for any map g: A → C the base change B ⊗_A C is n-affine over C with g^*_m(B/A)_m ≅ (B ⊗_A C/C)_m for m ≥ n; and that for composable maps A → B → C with A → B n-affine, B → C is n-affine if and only if A → C is (Gest Proposition 6.6, p. 51, Gest line 1878). Hence n-affine maps of Gestalten are stable under composition, base change, passage to diagonals and retracts. Prove that every n-affine map is (n + 1)-affine, because `CAlg(A_{n+1}) → StRing_{A/}` factors through `CAlg(A_{n+2})` (Gest Proposition 6.2, Gest line 1750).

A proof route: Stability under colimits holds because `CAlg(A_{n+1}) → StRing_{A/}` preserves colimits; part (i) of Proposition 6.6 is the full faithfulness of `Mod_{A_{m+1}}(1Pr) → A_{m+2}` on the unit and on module categories of κ-presented algebras, which are κ-filtered colimits of dualizable objects (Gest Lemma 6.3, p. 49, Gest line 1791); base change follows from the compatibility of module categories with base change, and left cancellation from `StRing_{B/} ≅ StRing_{A/}` `×_{CAlg(A_{n+1})}` `CAlg(A_{n+1})_{(B/A)_n/}` (Gest line 1897–1941).

*Needs:* §0.1; EnhancedDerivedSheaves §E5:presentability.4.

The API has the following laws.

- The identity of A is n-affine for every n, with (A/A)_n = 1.
- For n-affine B over A and m ≥ n, `B_{m+1} ≅ Mod_{(B/A)_m}(A_{m+1})`; in particular B is determined by the commutative algebra (B/A)_n ∈ `CAlg(A_{n+1})`.
- n-affine maps of Gestalten are stable under composition, base change, diagonals, retracts and limits of Gestalten over a fixed base, and every n-affine map is (n + 1)-affine.
- Left cancellation: if A → B is n-affine, then B → C is n-affine if and only if A → C is.

**Checks.**

- Over the Stefanich ring of D(R) for a commutative ring R, the Stefanich ring of D(S) for an R-algebra S is 0-affine with (B/A)_0 = S ∈ CAlg(D(R)), since B_1 = D(S) = Mod_S(D(R)).
- The map ∗ → B²G_m over a field k is 1-affine and satisfies `Mod_{(B/A)_0}(A_1)` ≅ B_1 also for m = 0, since A_1 = B_1 = D(k) and (B/A)_0 = k; it is not 0-affine, because a 0-affine algebra with relative algebra the unit is A itself (Gest Warning 6.7, p. 51, Gest line 1888). The module-category condition at level n alone does not characterize n-affineness.
- The infinite-dimensional affine space ⋃_n A^n is not n-affine for any n, although every term is 0-affine (Gest line 1700–1702): n-affine maps are stable under limits of Gestalten, not under colimits.
- Over the initial Stefanich ring the empty Gestalt is 1-affine but not 0-affine, the 0-th terms of the point and of the empty Gestalt both being ∗; after base change to the Stefanich ring of D(k) it is 0-affine, with relative algebra the zero ring (Gest §8.2, p. 66, Gest line 2522–2527).

### 0.3 n-prim and n-proper maps

For a map f: A → B of Stefanich rings and n ≥ 0, call f n-prim if for every m ≥ n + 1 the map 1 → (B/A)_m of `A_{m+1}` given by `f^*_{m−1}` has a right adjoint in `A_{m+1}`; equivalently, the right adjoint `f_{m−1,*}`: B_m → A_m of pullback refines to an internal right adjoint in `A_{m+1}` (Gest Definition 6.9, p. 52, Gest line 1944). Prove: (i) a κ-presented n-affine A-algebra is n-prim; (ii) n-prim A-algebras are stable under κ-small filtered colimits in `StRing_{A/}`, compatibly with `StRing_{A/}` → CAlg(A_m) for m ≥ n; (iii) the base change of an n-prim map along any g: A → C is n-prim and `f_{m,*}` commutes with base change for m ≥ n; (iv) composites of n-prim maps are n-prim (Gest Proposition 6.10, p. 52, Gest line 1952). Call f n-proper if f and all its iterated diagonals B ⊗_A B → B, B `⊗_{B ⊗_A B}` B → B, … are n-prim (Gest Definition 6.12, p. 54, Gest line 2057). Prove: (i) a κ-presented n-affine A-algebra is n-proper; (ii) n-proper A-algebras are stable under κ-small colimits in `StRing_{A/}`; (iii) base changes of n-proper maps are n-proper; (iv) for composable f: A → B and g: B → C with f n-proper, g is n-prim (resp. n-proper) if and only if g ∘ f is (Gest Proposition 6.13, p. 55, Gest line 2061). In particular, for a 0-prim map f: Y → X of Gestalten, pullback f^*: O(X)_1 → O(Y)_1 has a colimit-preserving O(X)_1-linear right adjoint f_*, and f_* commutes with base change along every map X′ → X (Gest line 1950; Gest Proposition 6.10(iii)).

A proof route: By shifting (0.1) one may take n = 0. For (i) of Proposition 6.10, a κ-presented 0-affine B has κ-presented relative algebras at every level, and the forgetful functor of a module category over a κ-presented algebra is an internal right adjoint; (ii) and (iii) are formal from the levelwise description of colimits and base change; the statements for n-proper maps follow from those for n-prim maps, using that diagonals of a composite are composites of base changes of diagonals and the factorization of g through B ⊗_A C → C (Gest line 2068–2078).

*Needs:* §0.1; §0.2.

The API has the following laws.

- κ-presented n-affine maps are n-proper, and n-proper maps are n-prim.
- n-prim maps are stable under base change and composition; n-proper maps are moreover stable under κ-small colimits of Stefanich algebras over a fixed base and satisfy left cancellation along n-proper maps.
- Every n-prim (resp. n-proper) map is (n + 1)-prim (resp. (n + 1)-proper), the defining conditions being asked at fewer levels.
- For a 0-prim map f: Y → X of Gestalten, f^*: O(X)_1 → O(Y)_1 has a colimit-preserving O(X)_1-linear right adjoint f_* satisfying base change.
- For a κ-presented 1-affine A-algebra B, B is 0-proper if and only if (B/A)_1 is rigid in A_2: the unit 1 → (B/A)_1 has a right adjoint in A_2 and the multiplication (B/A)_1 ⊗ (B/A)_1 → (B/A)_1 has a right adjoint in module categories over (B/A)_1 ⊗ (B/A)_1 (Gest Proposition 6.14, p. 55, Gest line 2081).

**Checks.**

- The identity of every Stefanich ring is n-prim and n-proper for every n.
- Over the Stefanich ring of D(k) for a field k, the affine line Gest(D(k[x])) is κ-presented and 0-affine, hence 0-proper (Gest §8.6, p. 67, Gest line 2591–2593): its pushforward D(k[x]) → D(k) is the forgetful functor, which preserves colimits and is D(k)-linear, and its diagonal, the multiplication k[x, y] → k[x], is again 0-affine.
- Primness is not stable under diagonals: for a smooth variety X of positive dimension over a field k of characteristic 0, the de Rham stack X^dR is 0-prim over k while its diagonal is not (Gest line 1968–1970). After base change along X × X → X^dR × X^dR the diagonal becomes the inclusion of the formal completion of X × X along the diagonal, whose pushforward on 1-sheaves sends a compatible system (M_n) on the infinitesimal neighbourhoods to lim_n M_n and does not preserve colimits; a definition of 0-prim asking only for some right adjoint would admit it. This is why n-proper asks primness of all iterated diagonals.
- For X a point the de Rham stack is the point and every diagonal is an identity, so the previous Check needs positive dimension.

### 0.4 n-suave and n-étale maps, ambidexterity and descent

For a map f: A → B of Stefanich rings and n ≥ 0, call f n-suave if for every m ≥ n + 1 the map 1 → (B/A)_m of `A_{m+1}` given by `f^*_{m−1}` has a left adjoint `f_{m−1,♯}` in `A_{m+1}` and, writing (B/A)^!_m = `f_{m,♯}(1)` for m ≥ n, the counit map (B/A)^!_m → 1 has a right adjoint in `A_{m+1}` for m ≥ n + 1 (Gest Definition 6.16, p. 56, Gest line 2115); call f n-étale if f and all its iterated diagonals are n-suave (Gest Definition 6.19, p. 58, Gest line 2214). Prove that n-suave maps are stable under base change, with `f_{m,♯}` commuting with base change for m ≥ n, and under composition (Gest Proposition 6.18, p. 57, Gest line 2147); that n-étale maps are stable under base change, and that for composable f, g with f n-étale, g is n-suave (resp. n-étale) if and only if g ∘ f is (Gest Proposition 6.20, p. 58, Gest line 2216). Prove the ambidexterity criterion: if a 1-morphism F of an (∞, 3)-category has a right adjoint F^R such that the unit id → F^R F and the counit F F^R → id have right adjoints in the endomorphism (∞, 2)-categories, then F^R is also left adjoint to F (Gest Proposition 4.4, p. 31, Gest line 1081). Deduce ambidexterity for Stefanich rings: if f and its diagonal are n-prim, then f is (n + 1)-suave, so n-proper maps are (n + 1)-étale; if f and its diagonal are n-suave, then f is (n + 1)-prim, so n-étale maps are (n + 1)-proper; in either case `f_{m,♯} ≅ f_{m,*}` for m ≥ n + 1, and this functor preserves dualizable objects (Gest Proposition 6.21, p. 58, Gest line 2225; Gest Lemma 6.22, p. 59, Gest line 2252). Call a map g: X′ → X of Gestalten an effective epimorphism if the colimit of its Čech nerve is X. Prove that the image of an n-suave map f: Y → X, the colimit of its Čech nerve, is an n-suave injection; that an injective map (one whose diagonal is an isomorphism) is n-étale if and only if it is n-suave, n-étale injections into X corresponding to coidempotent coalgebras of `O(X)_{n+1}`; and that an n-suave f is an effective epimorphism if and only if the colimit over [m] ∈ Δ^op of (O(Y ×_X ⋯ ×_X Y)/O(X))^!_n, with m + 1 factors, is the unit of `O(X)_{n+1}`, if and only if pullback `O(X)_{n+1} → O(Y)_{n+1}` is conservative (Gest Propositions 8.6, 8.7(i) and 8.10, pp. 71–72, Gest line 2698, Gest line 2702, Gest line 2753). Prove that for an effective epimorphism g: X′ → X and n ≥ 0, a map f: Y → X of Gestalten is n-affine, n-prim, n-proper, n-suave or n-étale if and only if its base change Y ×_X X′ → X′ is (Gest Proposition 7.9, p. 65, Gest line 2479).

A proof route: Base change and composition follow as for prim maps, with left adjoints and the coalgebras (B/A)^!_m in place of right adjoints and algebras (Gest line 2155–2211). Ambidexterity, after shifting to n = 0: in the prim case, for m ≥ 1, F = f^*_m: 1 → `(B/A)_{m+1}` in `A_{m+2}` has the right adjoint `f_{m,*}`; the unit of F ⊣ `f_{m,*}` is the map `f^*_{m−1}`: 1 → (B/A)_m of `A_{m+1}`, which has a right adjoint since f is 0-prim, and the counit, a map of `End_{A_{m+2}}((B/A)_{m+1})`, is the image under the kernel functor `(B ⊗_A B)_{m+1} → End_{A_{m+2}}((B/A)_{m+1})` of the map 1 → `(B/(B ⊗_A B))_m` of `(B ⊗_A B)_{m+1}`, which has a right adjoint since the diagonal is 0-prim; the ambidexterity criterion then makes `f_{m,*}` a left adjoint of F too. The suave case is the mirror argument with left adjoints (Gest line 2232–2249). Surjectivity: the image is a colimit of n-suave maps, and conservativity of pullback can be checked after pulling back to Y, where the Čech nerve splits (Gest line 2700–2701, Gest line 2765–2769). Locality: one direction is base change; conversely, since colimits of Gestalten are computed levelwise (0.1), O(X)_m = lim over the Čech nerve of O(X′ ×_X ⋯ ×_X X′)_m, an n-affine, n-prim or n-suave structure on the base change descends, and the proper and étale cases follow by passing to diagonals (Gest line 2486–2497).

*Needs:* §0.1; §0.2; §0.3; AnalyticStacks §7.3 (comparison Check).

The API has the following laws.

- n-suave and n-étale maps are stable under base change and composition, and n-étale maps satisfy left cancellation.
- An n-suave map is an effective epimorphism if and only if pullback of (n + 1)-sheaves along it is conservative.
- n-proper maps are (n + 1)-étale and n-étale maps are (n + 1)-proper, with `f_{m,♯} ≅ f_{m,*}` for m ≥ n + 1.
- The five properties n-affine, n-prim, n-proper, n-suave and n-étale are local on the target for effective epimorphisms of Gestalten.

**Checks.**

- Over every base Gest(A), the identity (the point of Gestalten over Gest(A)) is 0-affine, 0-proper and 0-étale (Gest §8.1, p. 66, Gest line 2520–2521).
- Over the Stefanich ring of D(k), the affine line Gest(D(k[x])) is 0-proper and therefore 1-étale (Gest §8.6, Gest line 2591–2593), but it is not 0-suave: pullback M ↦ M ⊗_k k[x] = `⊕_{n≥0}` M·x^n does not preserve infinite products, so it has no left adjoint.
- The empty Gestalt is 0-étale, as the empty colimit of 0-étale maps (Gest line 2524).
- The projective line A¹ `⊔_{GL₁}` A¹, glued along x ↦ x and x ↦ x⁻¹, is 1-étale and not 0-affine, while its diagonal is 0-affine (Gest §8.8, p. 68, Gest line 2604–2611). Being covered by two 0-affine Gestalten does not make it 0-affine: the locality of this section is on the target, not on the source.
- At level two, 0-primness in the sense of 0.3 for the Gestalt of D(Y) over that of D(X) is the 0-primness of AnalyticStacks §7.3, which works with commutative algebras in V-linear κ-presentable categories (the two-level case, RC26a Definition 2.5.1): both ask for a D(X)-linear colimit-preserving right adjoint of f^*. For V = D(ℤ) and Spec ℤ[T] → Spec ℤ, §7.3 finds f 0-prim and not 0-suave, the right adjoint Hom_ℤ(ℤ[T], −) = ∏_ℕ(−) of restriction not preserving colimits; this section reaches the same verdict for k[x] over k (the second Check of 0.3 and the second Check above).

### 0.5 Transmutation of six-functor formalisms

Let C be a small ∞-category with finite limits and D: Corr(C) → Pr^L_κ a six-functor formalism in which every map of C is !-able (AnalyticStacks §§0.2, 0.4). Regard D as a commutative algebra of Fun(Corr(C), 1Pr) for Day convolution and put K_D = Mod_D(Fun(Corr(C), 1Pr)) ∈ CAlg(2Pr), with the symmetric monoidal functor X ↦ `[X]_{K_D}` from Corr(C)^op characterized by `Hom_{K_D}([X]_{K_D}, M)` = M(X), so that `Hom_{K_D}([X]_{K_D}, 1)` = D(X) (Gest line 2989–3004); define `K_{D,X}` in the same way for every slice `C_{/X}` (Gest line 3041–3042). Prove that for f: Y → X in C the pullback f^*_1: `K_{D,X} → K_{D,Y}` has left and right adjoints that are isomorphic, `f_{1♯} ≅ f_{1*}`, and commute with base change (Gest Proposition 9.4, p. 80, Gest line 3054). Iterating the construction on the once-categorified formalism X ↦ `K_{D,X}` gives Stefanich rings `A_{D,X}` = (D(X), `K_{D,X}`, …), functorial in X (Gest line 3068–3080). Prove that the transmutation X ↦ [X]_D = `Gest(A_{D,X})`, a functor from C to Gestalten over [∗]_D = `Gest(A_{D,∗})`, commutes with finite limits; that for every f in C the map [f]_D is 1-étale and 1-proper; and that the composite of [−]_D with O(−)_1 recovers D^*: C^op → CAlg(1Pr) (Gest Proposition 9.5, p. 81, Gest line 3082). Prove that f is suave (resp. prim) for D if and only if [f]_D is 0-suave (resp. 0-prim), and that f is cohomologically étale (resp. cohomologically proper) if and only if f is truncated and [f]_D is 0-étale (resp. 0-proper) (Gest Remark 9.6, p. 82, Gest line 3109). Prove that a family {Y_i → X} of maps of C of universal !-descent gives an effective epimorphism ⊔_i [Y_i]_D → [X]_D (Gest Proposition 9.7, p. 82, Gest line 3121), and deduce that transmutation extends to a functor Shv_D(C)_κ → `Gest^{1-ét}_{/[∗]_D}` on the κ-small objects of the ∞-topos Shv_D(C) of presheaves on C inverting !-equivalences (AnalyticStacks §0.13), commuting with κ-small colimits and finite limits (Gest Corollary 9.8, p. 83, Gest line 3166). Prove that this functor is conservative (ALRS Construction 2.1.2, p. 14, ALRS line 712–723). Prove that if D satisfies the Künneth formula D(X) `⊗_{D(∗)}` D(Y) ≅ D(X × Y) for all X, Y in C, then K_D ≅ `Mod_{D(∗)}(1Pr)` and [∗]_D is the Gestalt Gest(D(∗)) of the commutative algebra D(∗) of 1Pr (0.1) (Gest Proposition 9.3, p. 79, Gest line 3020), and that if moreover the restriction of D to the slice `C_{/X}` satisfies the Künneth formula, D(Y) `⊗_{D(X)}` D(Z) ≅ D(Y ×_X Z) for all Y, Z over X, and f: X → ∗ has f^* inducing D(X) ≅ `Mod_{f_*1}(D(∗))`, then `K_{D,X} ≅ Mod_{D(X)}(1Pr)` and [X]_D is 0-affine over [∗]_D with relative algebra f_*1 (Gest Proposition 9.3 for `C_{/X}`, Gest line 3020, Gest line 3041). The slice condition is also necessary: if [X]_D is 0-affine over [∗]_D, its second term `K_{D,X}` is `Mod_{D(X)}(1Pr)`, which by the same proposition is the Künneth formula over X.

A proof route: Proposition 9.4: let Σ_f: `C_{/Y} → C_{/X}` be composition with f. A correspondence from f^*U to V in `C_{/Y}` and a correspondence from U to Σ_f V in `C_{/X}` are the same datum, an object W over Y with a map to U over X and a map to V over Y; reading the spans backwards gives the same identification with source and target exchanged, so `Corr(Σ_f)` is adjoint to `Corr(f^*)` on both sides. The free presentable (∞, 2)-categories `Fun(Corr(C_{/−}), 1Pr)` inherit this two-sided adjunction, and so do the D-module categories `K_{D,−}`, because restriction to a slice sends D to its restriction (Gest line 3043–3048); this yields `f_{1♯} ≅ f_{1*}` and its base change (Gest line 3043–3059). Proposition 9.5: Proposition 9.4 at each categorical level makes every [f]_D 1-prim and 1-suave, the extra condition of 1-suaveness holding by Gest Lemma 6.22; finite limits are preserved by the Künneth formula for lower-∗ functors, and 1-properness and 1-étaleness follow by passing to diagonals (Gest line 3099–3108). Proposition 9.7: as 1 ∈ K_D is κ-compact and K_D is generated by the `[X′]_{K_D}`, the effective-epimorphism condition becomes !-descent (Gest line 3134–3164). Conservativity: if [f]_D is an isomorphism then, transmutation commuting with finite limits, so is [f′]_D for every base change f′ of every iterated diagonal of f, so f′ induces equivalences on O(−)_1 = D^* and on the !-sheaves (−)^!_1 of Gest Remark 6.17 (Gest line 2133); thus f is a !-equivalence and hence an equivalence in Shv_D(C). The Künneth statement is Proposition 9.3 at the second level, propagated to the higher levels by Gest Example 3.12, which shows that the once-categorified formalism `Mod_{D(X)}(1Pr)` is again Künneth. For the statement over X apply Proposition 9.3 to the slice `C_{/X}`, whose final object is X: the slice formula gives `K_{D,X} ≅ Mod_{D(X)}(1Pr)`, propagated to the higher levels in the same way, so `A_{D,X}` is the Stefanich ring of D(X) = `Mod_{f_*1}(D(∗))`, the image of f_*1 under CAlg(D(∗)) → `StRing_{A_{D,∗}/}` (0.2); the Künneth formula over ∗ and the description of D(X) do not by themselves give the slice formula, which compares D(Y) `⊗_{D(X)}` D(Z) with D(Y ×_X Z) for objects Y, Z that need not be affine over X.

*Needs:* §0.1; §0.2; §0.3; §0.4; AnalyticStacks §0.2; AnalyticStacks §0.4; AnalyticStacks §0.12; AnalyticStacks §0.13; EnhancedDerivedSheaves §E5:abstract.2.

The API has the following laws.

- [−]_D: C → `Gest_{/[∗]_D}` commutes with finite limits, each [f]_D is 1-étale and 1-proper, and its extension to Shv_D(C)_κ commutes with κ-small colimits and finite limits and is conservative.
- O([X]_D)_1 = D(X), and pullback of 1-sheaves along [f]_D is f^*.
- Suave, prim, cohomologically étale and cohomologically proper maps of C correspond to 0-suave, 0-prim, truncated 0-étale and truncated 0-proper maps of Gestalten.
- Families of universal !-descent become effective epimorphisms of Gestalten.
- For a Künneth formalism, [∗]_D = Gest(D(∗)), and [X]_D is 0-affine over it with relative algebra f_*1 if and only if the restriction of D to `C_{/X}` is Künneth and f: X → ∗ satisfies D(X) ≅ `Mod_{f_*1}(D(∗))`; without the second condition it need not be, as for the projective line over a field, whose global functions are the constants.

**Checks.**

- For C the one-object category and D(∗) = V a commutative algebra of 1Pr, Corr(C) is a point, K_D = Mod_V(1Pr) and [∗]_D = Gest(V); for V = Ani this is the final Gestalt.
- For the quasi-coherent formalism on affinoid analytic stacks over `ℚ_{p,■}` (AnalyticStacks §3.2), the Künneth formula D(B ⊗_A C) ≅ D(B) `⊗_{D(A)}` D(C) holds over every affinoid AnSpec(A) (AnalyticStacks §2.3(7)), which is the slice formula over AnSpec(A), and D(R) = `Mod_R(D(ℚ_{p,■}))` for the induced structure, so [∗]_D = `Gest(D(ℚ_{p,■}))` and [AnSpec(R)]_D is 0-affine over it with relative algebra R; for R = ℚ_p⟨T⟩ this is the closed unit disc, and for R = 0 it is the empty Gestalt, whose relative algebra is the zero ring.
- The empty family covers [X]_D exactly when D(X) = 0: for X = AnSpec(0) both sides of Proposition 9.7 are empty, while the empty family does not cover AnSpec(ℚ_p), whose ∞-category of sheaves `D(ℚ_{p,■})` is nonzero.
- For C the category of finite sets and D(X) = Fun(X, D(Λ)) for a commutative ring Λ, the Künneth formula holds and K_D = `Mod_{D(Λ)}(1Pr)`; the fold map f: {1, 2} → ∗ has f_! = f_* = the direct sum, left and right adjoint to the diagonal f^*, so it is cohomologically étale and cohomologically proper, and being 0-truncated its transmutation is 0-étale and 0-proper, with relative algebra f_*1 = Λ × Λ.

### Examples

Over the Stefanich ring of D(k) for a field k, the affine line is 0-affine, 0-proper and 1-étale but not 0-suave, the empty Gestalt is 0-affine and 0-étale, and the projective line A¹ `⊔_{GL₁}` A¹ is 1-étale with 0-affine diagonal and is not 0-affine. For the quasi-coherent formalism on affinoid analytic stacks over `ℚ_{p,■}`, transmutation sends AnSpec(R) to the 0-affine Gestalt of R over `Gest(D(ℚ_{p,■}))`, the Gestalt of the point.

### Dependencies

EnhancedDerivedSheaves §E0.8, §E5:abstract.2, §E5:abstract.5, §E5:presentability.1, §E5:presentability.2, §E5:presentability.4; AnalyticStacks §0.2, §0.4, §0.12, §0.13, §2.3, §3.2, §7.3 (comparison Check).

## Layer 1: Bounded solid ℚ_p-algebras and Gelfand rings

This layer builds the affine building blocks of Gelfand analytic geometry from light solid ℚ_p-algebras: the bounded condition, the norm filtration and the †-nilradical, the uniform completion, Gelfand rings with their Berkovich spectra and †-rational localizations, the Fredholm property, and the classes of totally disconnected, strictly totally disconnected and nilperfectoid rings. Every construction here is a property of, or a functor on, solid ℚ_p-algebras with the induced analytic ring structure; the analytic ring `ℚ_{p,■}` and the induced structures are AnalyticStacks §2.11, with §2.3 and §3.6.

### 1.1 Bounded solid ℚ_p-algebras

For an animated commutative algebra A over the light solid analytic ring `ℚ_{p,■}`, define the power-bounded subring A° by its values on light profinite sets S, A°(S) = `Map(ℤ_{p,■}⟨ℕ[S]⟩, A)`, where `ℤ_{p,■}⟨ℕ[S]⟩` is the p-adic completion of the free solid ℤ_p-algebra on S, and the bounded subring A^b = A°[1/p]. Call A bounded when A^b → A is an equivalence. Prove that A ↦ A^b is right adjoint to the inclusion of bounded algebras into solid ℚ_p-algebras, so that bounded algebras are closed under all colimits computed in solid ℚ_p-algebras (ABLB Definition 2.1.1, p. 12, ABLB line 609; ABLB Lemma 2.1.2, p. 12, ABLB line 622). Boundedness is a property and not extra structure, because `ℤ_{p,■}⟨ℕ[S]⟩` is idempotent over `ℤ_{p,■}[ℕ[S]]`.

A proof route: Use the idempotency of `ℤ_{p,■}⟨ℕ[S]⟩` over `ℤ_{p,■}[ℕ[S]]` to see that A° is a subobject, so that (−)^b is idempotent; the adjunction is then formal, and colimits of bounded algebras are bounded because (−)^b is a right adjoint fixing them.

*Needs:* Mathlib `LightProfinite`; SolidAnalyticRings §1.5; AnalyticStacks §2.3, §2.11, §3.6.

The API has the following laws.

- For bounded A and every light profinite S and map f: S → A there is n ≥ 0 such that p^n·f extends to an algebra map `ℤ_{p,■}⟨ℕ[S]⟩` → A; conversely this condition for all S implies boundedness.
- Maps from a bounded algebra B to a solid ℚ_p-algebra A factor uniquely through A^b → A; A^b is bounded and (A^b)^b = A^b.
- Colimits of bounded algebras computed in solid ℚ_p-algebras are bounded; in particular pushouts and filtered colimits are.
- Every algebra map A → B sends A° into B° and A^b into B^b.

**Checks.**

- For A = ℚ_p the point values are A°(*) = ℤ_p and A^b(*) = ℚ_p, so ℚ_p is bounded; replacing `ℤ_{p,■}⟨ℕ[S]⟩` by the uncompleted free algebra would make every element power-bounded.
- For the discrete polynomial algebra A = ℚ_p[T] with induced structure, no p^n·T extends to ℤ_p⟨T⟩ → ℚ_p[T], since the image of Σ_k p^k T^k would be a non-terminating sum in ⊕_k ℚ_p T^k; hence A^b = ℚ_p and A is not bounded.
- The Tate algebra ℚ_p⟨T⟩ is bounded with T ∈ ℚ_p⟨T⟩°(*) = ℤ_p⟨T⟩.
- The zero ring is bounded, with A° = A^b = 0.

### 1.2 The norm filtration, the †-nilradical and †-reduction

For r ∈ `ℝ_{≥0}` and a light profinite set S, let `ℚ_{p,■}⟨ℕ[S]⟩_{≤r}` be the solid subring of `ℚ_{p,■}⟦ℕ[S]⟧` of power series overconvergent on the closed polydisc of radius r: its S′-points are the series Σ_n a_n with a_n ∈ `ℚ_{p,■}[S^n/Σ_n](S′)` for which some r′ > r has |a_n| r′^n → 0 (ABLB Definition 2.2.3, p. 13, ABLB line 686). For a solid ℚ_p-algebra A define `A_{≤r}(S) = Map(ℚ_{p,■}⟨ℕ[S]⟩_{≤r}, A)`, `A_{<r} = ⋃_{r′<r}` `A_{≤r′}` and the †-nilradical Nil†(A) = `A_{≤0}` (ABLB Definition 2.2.8, p. 14, ABLB line 746). Then `A_{≤1}` is a solid animated ℤ_p-algebra, each `A_{≤r}` is a solid `A_{≤1}`-module, and A = ⋃_r `A_{≤r}` when A is bounded (ALRS §2.1, p. 13, ALRS line 640). For bounded A, Nil†(A) is an ideal of A (RC24 Proposition 2.6.9(3), p. 24, RC24 line 1169, recalled at ABLB line 972); define the †-reduction of a bounded A as `A^{†-red}` = A/Nil†(A), a static bounded solid ℚ_p-algebra (ABLB Definition 2.2.19, p. 19, ABLB line 974). Prove that for bounded A the square `A_{≤1} → A^{†-red}_{≤1}` over A → `A^{†-red}` is a pullback, similarly for `A_{≤r}` and `A_{<1}`, and that `Nil†(A^{†-red})` = 0 (ABLB Proposition 2.2.20, p. 19, ABLB line 981).

A proof route: The objects are subobjects by the idempotency of `ℚ_{p,■}⟨ℕ[S]⟩_{≤r}` over `ℚ_{p,■}[ℕ[S]]` (ABLB Lemma 2.2.5); the pullback square follows from the description of `A_{<r}` by null sequences (ABLB Corollary 2.2.14).

*Needs:* §1.1; AnalyticStacks §2.3, §2.11, §3.6.

The API has the following laws.

- For r ≤ s one has `A_{≤r} ⊆ A_{≤s}`, and `A_{≤r}·A_{≤s} ⊆ A_{≤rs}`; multiplication by p maps `A_{≤r}` into `A_{≤r/p}`, matching |p| = `p^{-1}`.
- Nil†(A) is contained in `A_{<r}` for every r > 0, and every nilpotent element of A(*) lies in Nil†(A); for bounded A, Nil†(A) is an ideal of A.
- For bounded A, every algebra map from A to a †-reduced bounded algebra factors uniquely through A → `A^{†-red}`.
- An algebra map A → B sends `A_{≤r}` into `B_{≤r}` for every r.

**Checks.**

- For A = ℚ_p⟨T⟩ one has `A_{≤1}` = ℤ_p⟨T⟩, `A_{≤p^{-k}}` = p^k ℤ_p⟨T⟩ and Nil†(A) = 0.
- For A = ℚ_p[ε]/ε² the element ε lies in `A_{≤r}` for all r, so Nil†(A) = ℚ_p·ε and `A^{†-red}` = ℚ_p.
- For A = colim_n ℚ_p⟨T/p^n⟩, the functions on the overconvergent neighbourhood of 0, the element T lies in `A_{≤p^{-n}}` for all n, hence in Nil†(A), although T is not nilpotent; the †-nilradical is not the nilradical.
- For A = ℤ_p⟦T⟧[1/p] the element T is topologically nilpotent but lies in no `A_{≤r}` with r < 1 (ABLB Remark 2.2.9(2)), so `A_{<1}` is strictly smaller than the topologically nilpotent elements.
- Overconvergence (some r′ > r) cannot be weakened to convergence on the closed polydisc of radius r. For r = 0 that condition would give all of ℚ_p⟦T⟧, and for A = colim_n ℚ_p⟨T/p^n⟩ the series Σ_n `p^{−n²}T^n`, which converges on no disc of positive radius, would have no image under T ↦ T, so T would not lie in Nil†(A), against the third Check. For r = 1 it would give the Tate algebra ℚ_p⟨T⟩, and for the overconvergent algebra A = `colim_{s>1}` ℚ_p⟨T/s⟩ the series Σ_n p^n `T^{n²}` ∈ ℚ_p⟨T⟩, with `p^{−n}s^{n²}` → ∞ for every s > 1, would have no image under T ↦ T, so T would not lie in `A_{≤1}`, against the Check of 1.3 that computes A^u = ℚ_p⟨T⟩ for this A.
- For the unbounded algebra A = ℚ_p⟦T⟧[1/T] the element T lies in Nil†(A), the inclusion of germs at 0 into ℚ_p⟦T⟧ extending T ↦ T, and T is a unit of A, whereas 1 does not lie in Nil†(A), since T ↦ 1 would send the unit 1 − T of the germ ring to 0; so Nil†(A) is not an ideal. A is not bounded: `p^n·T^{−1}` extends to ℤ_p⟨X⟩ → A for no n, the image of Σ_k p^k X^k being an infinite Laurent tail. The ideal property, the †-reduction and the pullback square are stated for bounded A only.

### 1.3 Uniform completion

For a bounded solid ℚ_p-algebra A define its uniform completion A^u = `(lim_r A_{≤1}/A_{≤r})[1/p] = (A_{≤1})^∧_p[1/p]`, with the analytic ring structure induced from A (ABLB Definition 2.3.1, p. 20, ABLB line 1037). Prove: A^u is bounded and static; `A_{≤1} → A^u_{≤1}` over A → A^u is a pullback square `(and likewise for A_{≤r}, A_{<1})`; the map `A^{†-red}` → A^u is injective and `(A^{†-red})^u` = A^u; (A^u)^u = A^u and Nil†(A^u) = 0; an element f ∈ A is invertible if and only if its image in A^u is (ABLB Proposition 2.3.6, p. 21, ABLB line 1080). The inclusion of uniform bounded algebras has left adjoint A ↦ A^u, which commutes with colimits (ABLB Corollary 2.3.7, p. 22, ABLB line 1143).

A proof route: Boundedness of A^u holds because it is the generic fibre of a p-adically complete solid ring (RC24 Lemma 2.6.13); the pullback square is proved on null sequences as in 1.2; the unit criterion follows from the pullback square and the invertibility of 1 + x for x ∈ `A_{<1}`.

*Needs:* AdicSpacesPartIV §F1.2; AdicSpacesPartIV §F1.1; §1.2; AdicSpacesPartII §R0.4; AnalyticStacks §2.3, §2.11, §3.6.

The API has the following laws.

- Every map from A to a uniform bounded algebra B factors uniquely through A → A^u.
- A^u depends only on `A^{†-red}`: the map A → A^u factors through `A^{†-red}` and induces `(A^{†-red})^u` ≅ A^u.
- f ∈ A(*) is a unit if and only if its image in A^u(*) is a unit.
- For a Banach ℚ_p-algebra B with induced structure, B^u is the uniformization of B in the sense of AdicSpacesPartII §R0.4 (the completion for the spectral seminorm).

**Checks.**

- ℚ_p⟨T⟩^u = ℚ_p⟨T⟩, since ℤ_p⟨T⟩ is p-adically complete and `A_{≤0}` = 0.
- For A = ℚ_p[ε]/ε², A^u = ℚ_p; the unit 1 + ε maps to the unit 1 and the non-unit ε maps to 0, as the unit criterion requires.
- For the overconvergent algebra A = `ℚ_p⟨T⟩_{≤1} = colim_{r>1}` ℚ_p⟨T/r⟩ one has Nil†(A) = 0 and A^u = ℚ_p⟨T⟩, so `A^{†-red}` → A^u is injective but not surjective; A is †-reduced and not uniform.
- The zero ring has zero uniform completion, and A^u = 0 forces A = 0 by the unit criterion applied to 0.

### 1.4 Gelfand rings, separable and quasi-finite-dimensional

Call a bounded solid ℚ_p-algebra A a Gelfand ring if `A/A_{≤1}` is a discrete condensed set (ABLB Definition 3.1.1, p. 23, ABLB line 1162). Prove that A is Gelfand if and only if A^u is a Banach ℚ_p-algebra, and that Gelfand rings are closed under colimits in bounded algebras (ABLB Proposition 3.1.4, p. 23, ABLB line 1176). Call A separable if A^u is a separable Banach algebra (ABLB Definition 4.2.6(1), p. 42, ABLB line 2190) and quasi-finite-dimensional (qfd) if moreover A^u is qfd, that is, Marc(A^u) → Marc(ℚ_p) is quasi-pro-étale over a relative affine space (ABLB Definition 4.1.11, p. 39, ABLB line 2061; ABLB Definition 4.2.14(1), p. 43, ABLB line 2261).

A proof route: `A/A_{≤1} = A^u/A^u_{≤1}` by 1.3, so the condition depends only on A^u; A^u is Banach if and only if `A_{≤1}/A_{≤1/p}` is discrete, and discreteness is stable under filtered colimits, subobjects, quotients and extensions (ABLB Remark 3.1.2).

*Needs:* §1.3; MotivesAndAlgebraicCyclesPartII Layer 0; AnalyticStacks §2.3, §2.11, §3.6.

The API has the following laws.

- A is Gelfand if and only if `A^{†-red}` is Gelfand if and only if A^u is a Banach ℚ_p-algebra.
- Pushouts, finite products and filtered colimits of Gelfand rings computed in bounded algebras are Gelfand; separable Gelfand rings are closed under pushouts and finite products.
- Every Banach ℚ_p-algebra B with its induced analytic ring structure is a Gelfand ring; Nil†(B) consists of the elements of spectral seminorm zero, so B is †-reduced exactly when its spectral seminorm is a norm.
- The qfd condition is stable under pushouts along maps of qfd separable Gelfand rings and under finite products.

**Checks.**

- ℚ_p⟨T_1,…,T_n⟩, its overconvergent version `ℚ_p⟨T_1,…,T_n⟩_{≤1}`, ℚ_p[ε]/ε² and the completed algebraic closure C_p are separable qfd Gelfand rings.
- For an infinite light profinite set S, A = `ℚ_{p,■}⟨ℕ[S]⟩_{≤1}` is bounded but not Gelfand: `A_{≤1}/A_{≤1/p}` contains `𝔽_{p,■}[S]` as a direct summand, which is not discrete (ABLB Example 3.1.3).
- The separable Gelfand ring ℚ_p⟨T_n : n ∈ ℕ⟩ is not qfd: its spectrum contains the Hilbert cube [0,1]^ℕ through the Gauss points of prescribed radii |T_n| = r_n, so it has infinite covering dimension, whereas a qfd ring is quasi-pro-étale over a finite-dimensional polydisc and its spectrum has finite covering dimension.
- The zero ring is a separable qfd Gelfand ring.

### 1.5 The Berkovich spectrum and residue fields

For a Banach ℚ_p-algebra B let M(B) be the set of continuous multiplicative seminorms |·| on B with |p| = `p^{-1}`, with the topology of pointwise convergence; for a Gelfand ring A put M(A) := M(A^u) (ABLB Definition 3.1.5, p. 23, ABLB line 1189). For f_1,…,f_n, g ∈ A generating the unit ideal define the rational subspace M(A)(f/g) = {|f_i| ≤ |g| ≠ 0}, a closed subset. For x ∈ M(A) define the Berkovich residue field κ(x) as the completed residue field of the Banach algebra A^u at x (TropicalAndBerkovichArithmetic §0.15; ABLB Definition 3.1.15, p. 26, ABLB line 1335). Prove that M(A) is compact Hausdorff, metrizable when A is separable (ABLB Remark 3.1.6), nonempty when A ≠ 0, functorial (ABLB Lemma 3.1.8) and that M(colim A_i) = lim M(A_i) for filtered colimits (ABLB Lemma 3.1.12). Prove that M(A) is the Berkovich spectrum `Spectrum` of TropicalAndBerkovichArithmetic §0.1 and the Gel'fand spectrum `Huber.GelfandSpectrum` of AdicSpacesPartIII §R3.9 of the Banach ring A^u with its gauge norm.

A proof route: Compactness, Hausdorffness and nonemptiness are imported from TropicalAndBerkovichArithmetic §0.7, §0.8 and §0.13 applied to A^u. The normalization |p| = `p^{-1}` is automatic for a bounded seminorm on a ℚ_p-algebra, because a bounded multiplicative seminorm on ℚ_p is the p-adic absolute value (§0.11); a seminorm bounded by C·‖·‖ is bounded by ‖·‖ by multiplicativity, so the two notions of point agree.

*Needs:* TropicalAndBerkovichArithmetic §0.8; TropicalAndBerkovichArithmetic §0.7; Mathlib `MulRingSeminorm`; §1.4; TropicalAndBerkovichArithmetic §0.1; TropicalAndBerkovichArithmetic §0.11; TropicalAndBerkovichArithmetic §0.13; TropicalAndBerkovichArithmetic §0.15; AdicSpacesPartIII §R3.9.

The API has the following laws.

- A map A → B of Gelfand rings induces a continuous map M(B) → M(A), functorially.
- M(A) = ∅ if and only if A = 0.
- For a filtered colimit A = colim A_i of Gelfand rings, M(A) → lim M(A_i) is a homeomorphism.
- M(A) equals TropicalAndBerkovichArithmetic `Spectrum` and AdicSpacesPartIII `Huber.GelfandSpectrum` of A^u, compatibly with evaluation and with induced maps.
- κ(x) is a complete nonarchimedean field extension of ℚ_p, and the seminorm x is the pullback of its absolute value along A^u → κ(x) (TropicalAndBerkovichArithmetic §0.15).

**Checks.**

- M(ℚ_p) is a point and M(ℚ_p × ℚ_p) is two points; M(0) = ∅.
- M(ℚ_p⟨T⟩) contains the Gauss point with |T| = 1 and the rigid point T = 0 with |T| = 0; the Gauss point is not a maximal ideal, so M is not the maximal spectrum.
- M(ℚ_p[ε]/ε²) = M(ℚ_p) and `M(ℚ_p⟨T⟩_{≤1})` = M(ℚ_p⟨T⟩): the spectrum sees only the uniform completion.
- The trivial absolute value on ℚ_p is not a point, since points satisfy |p| = `p^{-1}`.

### 1.6 †-rational localizations and Berkovich-étale maps

For a Gelfand ring A and f_1,…,f_n, g ∈ A(*) generating the unit ideal define the †-rational localization `A⟨f/g⟩_{≤1} = A⟨T_1,…,T_n⟩_{≤1}/L(gT_i − f_i)`, where `A⟨T⟩_{≤1}` = A `⊗_{ℚ_p}` `ℚ_p⟨T⟩_{≤1}` and L denotes the derived quotient, and the Tate-rational localization A⟨f/g⟩ = A⟨T⟩/L(gT_i − f_i) with A⟨T⟩ = A `⊗_{ℚ_p}` ℚ_p⟨T⟩ (ALRS Notations and conventions, p. 11, ALRS line 590). Prove that A → `A⟨f/g⟩_{≤1}` is an idempotent morphism of Gelfand rings, that a map A → B factors through it if and only if M(B) → M(A) lands in M(A)(f/g), and that `M(A⟨f/g⟩_{≤1})` → M(A) is a homeomorphism onto M(A)(f/g) identifying rational subspaces (ABLB Proposition 3.1.9, p. 24, ABLB line 1260). Define Berkovich-étale maps of Gelfand rings as maps which locally for strict closed covers are composites of †-rational localizations and finite étale maps (ABLB Definition 3.2.8, p. 32, ABLB line 1658), and prove that Berkovich-étale maps of A, `A^{†-red}` and A^u correspond (ABLB Proposition 3.2.11, p. 33, ABLB line 1712). For x ∈ M(A) define the stalk A_x as the filtered colimit of the †-rational localizations `A⟨f/g⟩_{≤1}` over the rational subspaces M(A)(f/g) containing x, and prove that A_x is a Gelfand ring with M(A_x) = {x} and (A_x)^u = κ(x) of 1.5 (ABLB Definition 3.1.15, p. 26, ABLB line 1335; ABLB Lemma 3.1.14, p. 26, ABLB line 1324).

A proof route: The element g is invertible in the localization because Σ a_i f_i + b g = 1 gives 1 = g(Σ a_i T_i + b); idempotency reduces to the idempotency of `ℚ_p⟨T⟩_{≤1}` over ℚ_p[T]; the topological statement is checked on uniform completions.

*Needs:* §1.5; §1.4; §1.3; AnalyticStacks §2.3, §2.11, §3.6.

The API has the following laws.

- `A⟨f/g⟩_{≤1}` ⊗_A `A⟨f/g⟩_{≤1} ≅ A⟨f/g⟩_{≤1}`.
- A map A → B factors (uniquely) through `A⟨f/g⟩_{≤1}` if and only if the image of M(B) → M(A) lies in M(A)(f/g).
- `M(A⟨f/g⟩_{≤1})` → M(A) is a homeomorphism onto the closed subset M(A)(f/g).
- Base change along A → A^u induces an equivalence between Berkovich-étale A-algebras and Berkovich-étale A^u-algebras.
- For x ∈ M(A), the stalk A_x is a Gelfand ring with M(A_x) = {x}, and (A_x)^u = κ(x).

**Checks.**

- For A = ℚ_p⟨T⟩, the †-rational localization at {|T| ≤ 1} is A itself, because T already lies in `A_{≤1}`.
- For A = ℚ_p⟨T⟩ and the locus {|T| ≤ |p|}, the localization is `colim_{r>1/p}` ℚ_p⟨T/r⟩, whose spectrum is the closed disc of radius `p^{-1}`, a closed and not open subset.
- For f = 1, g = p·1 on A = ℚ_p the locus {|1| ≤ |p|} is empty and the localization is the zero ring.
- For A = ℚ_p⟨T⟩ and the locus {|T| ≤ |p|} the Tate-rational localization is ℚ_p⟨T/p⟩, which differs from the †-rational one; both have the same spectrum.
- For A = ℚ_p⟨T⟩ and x the rigid point T = 0, the discs {|T| ≤ |p^n|} are cofinal among the rational subspaces containing x, so A_x = colim_n `ℚ_p⟨T⟩⟨T/p^n⟩_{≤1}` is the ring of germs at 0 of overconvergent functions; it is not a field, T being a nonzero non-unit, but T has spectral seminorm 0 on M(A_x) = {x}, so T ∈ Nil†(A_x) and (A_x)^u = ℚ_p = κ(x). Taking A_x itself as the residue field would give a non-field.

### 1.7 Gelfand rings are Fredholm

Prove that every Banach ℚ_p-algebra B with the analytic ring structure induced from `ℚ_{p,■}` is Fredholm, and that a bounded solid ℚ_p-algebra (1.1) whose uniform completion is Fredholm is Fredholm; hence every Gelfand ring A is Fredholm: every dualizable object of D(A) is discrete, that is, it lies in the image of the fully faithful embedding of perfect complexes over the abstract ring A(*) (ABLB Definition 3.3.1, p. 33, ABLB line 1724; ABLB Proposition 3.3.5, p. 35, ABLB line 1828, whose proof takes the Banach case from And21 Theorem 5.50, p. 39, And21 line 2733, stated there for (B, B⁺)_■ with (B, B⁺) a sheafy Huber pair).

A proof route: For the Banach case, run the argument of And21 Theorem 5.50 and Lemma 5.51 (And21 line 2733, And21 line 2779) for the compact projective generators B `⊗_{ℚ_p}` `ℚ_{p,■}[S]` of the induced structure: their B-linear duals are C(S, B), a map from a light profinite set to C(S, B) factors through the module of null sequences of B as in And21 Lemmas 5.48–5.49 (And21 line 2687), so the cone of 1 − f for a trace-class f is perfect, and a nuclear pseudocoherent object is built from such cones; no sheafiness is used. Then follow ABLB §3.3: by the trace-class criterion of AnalyticStacks §4.4(1) (Sch24 Proposition VI.1.5) it suffices to show that a compact connective complex K with K ⊗_A A^u perfect is perfect; reduce along the square-zero filtration of A → A^u (ABLB Lemmas 3.3.2–3.3.3), as in the surjection criterion (Sch24 Proposition VI.1.7), using the Banach case for A^u.

*Needs:* §1.3; §1.4; AnalyticStacks §4.4.

**Checks.**

- Over A = ℚ_p the dualizable objects are the bounded complexes of finite-dimensional ℚ_p-vector spaces.
- Over A = ℚ_p × ℚ_p a dualizable object is a pair of finite-dimensional complexes; its ranks at the two points of M(A) may differ, so Fredholm does not force constant rank.
- The solid ℚ_p-vector space ℚ_p⟨T⟩ is not dualizable over ℚ_p, consistent with the Fredholm property since it is not a perfect ℚ_p-complex.
- On the Banach algebra ℚ_p⟨T⟩ the structure induced from `ℚ_{p,■}` and (ℚ_p⟨T⟩, ℤ_p⟨T⟩)_■ are different analytic rings, T being solid only in the second (AnalyticStacks §3.6); both are Fredholm, the first by this target and the second by AnalyticStacks §4.4(6), and only the first is the structure the uniform completion of a Gelfand ring carries, so the Huber-pair case alone does not give 1.7.
- Over the non-uniform Banach algebra B = ℚ_p[ε]/ε² the residue field ℚ_p = B/ε is not dualizable, its minimal free resolution being infinite; a notion of Fredholm asking only that dualizable objects have finite-dimensional fibres at the points of M(B) would wrongly allow it, while perfectness excludes it.

### 1.8 Totally disconnected, strictly totally disconnected and nilperfectoid rings

Call a Gelfand ring A totally disconnected if M(A) is profinite, strictly totally disconnected if moreover every Berkovich residue field κ(x) is algebraically closed, nilperfectoid if `A^{†-red}` → A^u is an isomorphism and A^u is perfectoid, and uniformly perfectoid if A^u is perfectoid (ALRS Definition 2.1.5, p. 15, ALRS line 785; ALRS Proposition 3.4.7, p. 48, ALRS line 2501). Prove that a strictly totally disconnected Gelfand ring with `A^{†-red}` = A^u is nilperfectoid (ALRS Remark 2.1.6, p. 15, ALRS line 793), via the statement that a Gelfand ring with profinite spectrum and perfectoid residue fields has perfectoid uniform completion (ABLB Lemma 3.1.17, p. 27, ABLB line 1428).

A proof route: For the remark, residue fields of a strictly totally disconnected ring are complete algebraically closed, hence perfectoid fields (PerfectoidSpaces §P1.10); ABLB Lemma 3.1.17 propagates perfectoidness from the residue fields over the profinite spectrum using a locally defined pseudo-uniformizer π with π^p | p.

*Needs:* Mathlib `PadicComplex`; §1.5; PerfectoidSpaces §P1.1; PerfectoidSpaces §P1.10; MotivesAndAlgebraicCyclesPartII Layer 0.

The API has the following laws.

- A is nilperfectoid if and only if Nil†(A) → A → A^u is a fibre sequence and A^u is a perfectoid Banach ℚ_p-algebra.
- Nilperfectoid rings are uniformly perfectoid; perfectoid Banach ℚ_p-algebras are nilperfectoid.
- Among Banach ℚ_p-algebras, the strictly totally disconnected Banach rings of MotivesAndAlgebraicCyclesPartII §0.4 are exactly the uniform strictly totally disconnected Gelfand rings.

**Checks.**

- C_p and C(S, C_p) for a light profinite S are nilperfectoid; the latter is strictly totally disconnected with M = S.
- C_p[ε]/ε² is nilperfectoid: its †-reduction C_p equals its uniform completion.
- The uncompleted cyclotomic field `ℚ_p(μ_{p^∞})` is uniformly perfectoid but not nilperfectoid, because its †-reduction is itself and differs from its completion.
- ℚ_p is totally disconnected (M is a point) but not nilperfectoid, since ℚ_p is not perfectoid.

### Examples

The Tate algebra ℚ_p⟨T⟩ is a uniform qfd Gelfand ring with M(ℚ_p⟨T⟩) the Berkovich closed unit disc. The overconvergent algebra `ℚ_p⟨T⟩_{≤1} = colim_{r>1}` ℚ_p⟨T/r⟩ is †-reduced, not uniform, with uniform completion ℚ_p⟨T⟩. The ring C_p[ε]/ε² is nilperfectoid with †-nilradical C_p·ε. The uncompleted cyclotomic field `ℚ_p(μ_{p^∞})` is uniformly perfectoid and not nilperfectoid.

### Dependencies

The light solid ℚ_p analytic ring and induced structures (AnalyticStacks §2.3, §2.11, §3.6); Scholze's Fredholm criteria (AnalyticStacks §4.4); TropicalAndBerkovichArithmetic §0.1, §0.11, §0.13, §0.15, §0.7, §0.8; AdicSpacesPartIII §R3.9; AdicSpacesPartII §R0.4; AdicSpacesPartIV §F1.1–§F1.2; PerfectoidSpaces §P1.1, §P1.10; MotivesAndAlgebraicCyclesPartII Layer 0; EnhancedDerivedSheaves §E5:descent; SolidAnalyticRings §1.5.

## Layer 2: Gelfand stacks, perfect complexes and derived Berkovich spaces

This layer defines Gelfand stacks as analytic stacks on separable Gelfand rings, pulls back the quasi-coherent six-functor formalism to them and enlarges it along 0-proper maps of Gestalten, proves that perfect complexes are the dualizable objects and satisfy !-descent, proves that nilperfectoid rings form a basis of the !-topology, and embeds derived Berkovich spaces, †-rigid spaces and partially proper rigid spaces. It ends with light arc-stacks and the perfectoidization functor, which is the bridge to perfectoid geometry.

### 2.1 Gelfand stacks

Let `GelfRing_{ω₁}` be (an essentially small model of) the category of separable Gelfand rings, stable under pushouts and finite products. Define the ∞-category of Gelfand stacks GelfStk = `AnStk(GelfRing_{ω₁}^op)`, the full subcategory of presheaves of anima on affinoid Gelfand stacks GSpec(A) which invert countably presented !-equivalences, where a map is a !-equivalence when every base change of every iterated diagonal induces an equivalence on !-categories D^! (ABLB Definition 4.2.1, p. 40, ABLB line 2109; ABLB Definition 4.2.6, p. 42, ABLB line 2189). Define qfd Gelfand stacks GelfStk^qfd likewise on separable qfd Gelfand rings (ABLB Definition 4.2.14, p. 43, ABLB line 2261). Construct the morphisms of ∞-topoi AnStk → GelfStk → GelfStk^qfd, whose left adjoints preserve finite limits and colimits; the right adjoint of the first, the Gelfandification (−)^Gelf, sends an analytic stack X to A ↦ X(AnSpec(A)) (ABLB Lemma 4.2.7, p. 42, ABLB line 2198; ALRS §2.1, p. 13, ALRS line 662). From Layer 3 onwards every Gelfand ring, Gelfand stack and arc-stack is separable and qfd (ALRS p. 20, ALRS line 1038).

A proof route: The inclusion of separable Gelfand rings into analytic rings over `ℚ_{p,■}` preserves pushouts and !-equivalences (ABLB Lemma 4.2.7), so the construction of AnalyticStacks §3.3 restricts; descendable maps are !-covers by that section and EnhancedDerivedSheaves §E5:descent.

*Needs:* EnhancedDerivedSheaves §E0.5; §1.4; §1.6; EnhancedDerivedSheaves §E2.7; EnhancedDerivedSheaves §E5:descent; AnalyticStacks §2.3, §2.11, §3.6; AnalyticStacks §3.3.

The API has the following laws.

- A separable Gelfand ring A defines the representable Gelfand stack GSpec(A), and A ↦ GSpec(A) is fully faithful on separable Gelfand rings (the site is subcanonical).
- A descendable map A → B of separable Gelfand rings induces an epimorphism GSpec(B) → GSpec(A) of Gelfand stacks.
- The functor (−)^An: GelfStk → AnStk is left exact and colimit-preserving with right adjoint (−)^Gelf, and (−)^An is fully faithful on affinoid Gelfand stacks.
- GelfStk and GelfStk^qfd are ∞-topoi. The geometric morphism GelfStk → GelfStk^qfd has as inverse image the left exact colimit-preserving functor GelfStk^qfd → GelfStk sending GSpec(A), for A a separable qfd Gelfand ring, to GSpec(A), and as direct image the restriction of a Gelfand stack to separable qfd Gelfand rings (ABLB line 2269–2271; ALRS line 661–669); the inverse image is not claimed to be fully faithful (ALRS line 670).

**Checks.**

- GSpec(ℚ_p) is the final Gelfand stack and GSpec(0) is the initial one; any sheaf takes value a point on GSpec(0).
- GSpec(A × B) = GSpec(A) ⊔ GSpec(B) for separable Gelfand rings A, B, because D(A × B) = D(A) × D(B).
- The !-cover ℚ_p → ℤ_p((x))^∧_p[1/p] of analytic rings is not refined by a !-cover from Gelfand rings, which is why (−)^An is not claimed fully faithful on all Gelfand stacks (ABLB footnote 28).

### 2.2 The quasi-coherent six-functor formalism on Gelfand stacks

Pull back the quasi-coherent six-functor formalism D(−) of analytic stacks over `AnSpec(ℚ_{p,■})` along (−)^An to a six-functor formalism on Gelfand stacks, and call its class of !-able maps E₂ (ABLB Remark 4.2.8, p. 42, ABLB line 2209). Enlarge it as in ALRS Construction 2.1.2 (p. 14, ALRS line 704): every map of affinoid Gelfand stacks is !-able with f_! = f_*, so the transmutation of 0.5, applied to C = `GelfRing_{ω₁}^op`, gives a conservative functor Gest((−)_D): GelfStk → Gest/Gest(D(ℚ_p)) on κ-small Gelfand stacks (Conventions), preserving κ-small colimits and finite limits, the Gestalt of the point being Gest(D(ℚ_p)) by the Künneth formula (0.5), and a map of Gelfand stacks is called n-affine, n-prim or n-proper when its image is (0.2–0.3). The 0-proper maps contain all maps of affinoid Gelfand stacks, are stable under composition and base change and satisfy left cancellation, and pullback along them has a linear right adjoint satisfying base change, so D is a 3-functor formalism on Corr(GelfStk, 0-proper) (HM Proposition 3.3.3, p. 37, HM line 1924) and extends uniquely to a six-functor formalism on Corr(GelfStk, E₁) for the minimal class E₁ of HM Theorem 3.4.11 and Lemma 3.4.13; these are the six functors of this roadmap. Prove that every 0-proper map f is prim with a natural trivialization δ_f ≅ 1 of its codualizing complex, so f_! ≅ f_* (ALRS Remark 2.1.4, p. 15, ALRS line 780). Prove the comparison with E₂: the class E₀ generated by the maps of affinoid Gelfand stacks under HM Theorem 3.4.11 lies in E₁ ∩ E₂, the two formalisms agree on Corr(GelfStk, E₀), and a map in E₀ that is suave, prim, cohomologically proper or cohomologically étale for E₂ has the same property for E₁; E₀ contains every map of Betti stacks coming from a ℚ-fine map of condensed anima, every map of derived Berkovich spaces with finite-dimensional underlying space, and the de Rham stacks of arc-locally lqfd maps of qfd arc-stacks (ALRS Remark 2.1.3, p. 15, ALRS line 751). Define suave, prim, cohomologically smooth (D-smooth), cohomologically proper (D-proper) and cohomologically étale maps by HM Definitions 4.5.1 and 4.6.1 for E₁.

A proof route: The 3-functor formalism is HM Proposition 3.3.3 applied to the 1-sheaf functor on Gestalten over Gest(D(ℚ_p)), whose pullbacks along 0-proper maps have linear right adjoints compatible with base change (0.3; Gest Definition 6.9 and Proposition 6.10(iii)); stability of 0-proper maps is 0.3 (Gest Proposition 6.13), and maps of affinoid Gelfand stacks are 0-affine by the Künneth case of 0.5, whose slice hypothesis over GSpec(A) is AnalyticStacks §2.3(7), D(B ⊗_A C) ≅ D(B) `⊗_{D(A)}` D(C), together with left cancellation (0.2), hence 0-proper (0.3). The trivialization δ_f ≅ 1 holds because f_! is f_* on 0-proper maps by construction. A truncated 0-proper map is D-proper by induction on the truncation level, since its diagonal is again 0-proper. For the comparison, suaveness, primness, properness and étaleness are tested on functors built from projections and iterated diagonals of finite products of f, whose six functors do not depend on the !-able class (HM Lemmas 4.4.5–4.4.6).

*Needs:* §2.1; AnalyticStacks §0.5, §0.6, §3.2, §3.3; AnalyticStacks §§0.8–0.11; §0.2; §0.3; §0.4; §0.5.

The API has the following laws.

- For a map f: GSpec(B) → GSpec(A) of affinoid Gelfand stacks, f is 0-affine and 0-proper and f_! ≅ f_* is the forgetful functor D(B) → D(A).
- For a cartesian square of Gelfand stacks with f !-able, g^* f_! ≅ f′_! g′^*, and the projection formula f_!(M ⊗ f^*N) ≅ f_!M ⊗ N holds.
- 0-affine and 0-proper maps are stable under composition and base change, 0-affine maps also under diagonals and retracts; for maps Z → Y → X with Y → X 0-proper, Z → Y is 0-proper if and only if Z → X is; and both properties are local on the target for !-covers (0.2–0.4; Gest Propositions 6.6, 6.13 and 7.9).
- A 0-proper map f is !-able and prim with δ_f ≅ 1, so f_! ≅ f_*; if f is moreover truncated, it is D-proper. 0-properness can be checked along a !-cover of the source generated by a finite family of monomorphisms that are cohomologically proper and 0-proper, such as a finite closed affinoid cover, the limit over its sieve then being a finite limit (HM Remark 4.4.11(iii), HM line 3409, whose argument applies to 0-proper maps, ALRS footnote 58, p. 165, ALRS line 8962).
- D-properness and D-smoothness of a truncated map are local on the target for !-covers, and D-properness of f can be checked on a universal D-proper !-cover of the source for which f_! commutes with the limits indexed by the cover's sieve (HM Lemma 4.6.3(ii′), HM line 3752).
- If the diagonal of f is D-proper, then f is D-proper if and only if the natural map f_! → f_* is an equivalence (HM Lemma 4.6.4(ii)).

**Checks.**

- GSpec(ℚ_p⟨T⟩) → GSpec(ℚ_p) is 0-affine, hence 0-proper, with f_! = f_* the forgetful functor; its global sections of O are ℚ_p⟨T⟩.
- The open unit disc over ℚ_p is cohomologically smooth with dualizing complex Ω¹[1] but is not 0-proper: f_!O is compactly supported cohomology, concentrated in cohomological degree 1 for this one-dimensional Stein space, while f_*O is its ring of functions in degree 0, so f_! ≇ f_*. The closed disc GSpec(ℚ_p⟨T⟩) is 0-proper and is neither Berkovich-smooth nor rigid smooth (ALRS Warning 2.6.13): properness and smoothness separate the two discs.
- The identity of any Gelfand stack is 0-affine, 0-proper, D-proper, D-smooth and D-étale with trivial dualizing and codualizing complexes.
- For a map f: GSpec(B) → GSpec(A) of affinoid Gelfand stacks, which lies in E₀, the lower-shriek functors of E₁ and of E₂ are both the forgetful functor D(B) → D(A), as the comparison requires; a comparison that also identified the two !-able classes would be stronger than what ALRS Remark 2.1.3 proves, which is E₀ ⊂ E₁ ∩ E₂.

### 2.3 Perfect complexes, eventually connective and nuclear modules satisfy descent

Since every Gelfand ring is Fredholm (1.7), AnalyticStacks §4.5 applied to C₀ = `GelfRing_{ω₁}^op` gives, for integers a ≤ b, the sheaf of categories `Perf^{[a,b]}(−)` on GelfStk extending A ↦ `Perf^{[a,b]}(A)` and inverting !-equivalences, a module being perfect of amplitude [a, b] when its pullback to every affinoid is (ABLB Lemma 4.2.11 and Definition 4.2.12, p. 43, ABLB line 2235, ABLB line 2253, stated there for Gelfand rings). Prove that for every Gelfand stack X the category Perf(X) ⊂ D(X) is exactly the full subcategory of dualizable objects (ALRS §2.1, p. 16, ALRS line 809). Prove that locally eventually connective modules D^+(−) and nuclear modules Nuc(D(−)) form sheaves of categories on GelfStk (ALRS Lemma 2.1.8, p. 16, ALRS line 820; ALRS Lemma 2.1.10, p. 17, ALRS line 861), and prove the criterion used for D^+ and Nuc: a sheaf of categories on an ∞-topos descends to a cotopological localization if and only if it is fully faithful along the localizing maps (ALRS Lemma 2.1.9, p. 16, ALRS line 841).

A proof route: D(X) is the limit of D(A) over affinoids GSpec(A) → X along symmetric monoidal pullbacks, so an object of D(X) is dualizable if and only if each of its pullbacks is; a dualizable module over a Gelfand ring is perfect by the Fredholm property 1.7, and a perfect one is dualizable, so the dualizable objects of D(X) are those perfect on every affinoid, which is Perf(X) by AnalyticStacks §4.5. For D^+, a descendable map has a nilpotent fibre power (EnhancedDerivedSheaves §E5:descent), so B is descendable in D^+(A), and ALRS Lemma 2.1.9 applies because D^+ ⊂ D and Nuc ⊂ D are full and D(−) inverts !-equivalences (AnalyticStacks §3.3); for nuclear modules use pro-constancy of the partial totalizations.

*Needs:* §1.7; §2.1; §2.2; EnhancedDerivedSheaves §E5:descent; EnhancedDerivedSheaves §E5:presentability.4; AnalyticStacks §3.3; AnalyticStacks §4.5; AnalyticStacks §4.3; AnalyticStacks §4.4; RefinedTraceMethods §4.3.

**Checks.**

- Perf(GSpec(ℚ_p)) is the category of bounded complexes of finite-dimensional ℚ_p-vector spaces, and Perf(∅) = 0.
- For the descendable map ℚ_p → ℚ_p^cyc (it has a ℚ_p-linear retraction), a perfect ℚ_p^cyc-complex with descent datum for the Čech conerve descends to a perfect ℚ_p-complex of the same amplitude.
- The object ℚ_p⟨T⟩ ∈ D(GSpec(ℚ_p)) is eventually connective and nuclear but not dualizable, so Perf differs from both D^+ and Nuc.
- D^+ and Nuc differ in both directions. The solid module (∏_ℕ ℤ_p)[1/p] ≅ `ℚ_{p,■}[ℕ ∪ {∞}]` is static, hence eventually connective, and compact; a compact nuclear object has trace-class identity and is therefore dualizable, which it is not (the dualizable objects of `D(ℚ_{p,■})` are the perfect complexes, 1.7), so it is not nuclear. The sum `⊕_{n≥0}` ℚ_p[−n] is a colimit of nuclear objects, hence nuclear, and has `π_{−n} = ℚ_p` for every n ≥ 0, so it lies in `D_{≥−n}` for no n. A definition with Nuc ⊆ D^+ or D^+ ⊆ Nuc fails one of the two.

### 2.4 Nilperfectoid rings form a basis of the !-topology

Prove: (1) every separable Gelfand ring A admits a descendable map A → A′ with A′ separable nilperfectoid, quasi-pro-étale after uniform completion; (2) every separable qfd Gelfand ring admits a descendable map to a separable qfd strictly totally disconnected nilperfectoid ring; (3) for an arc-hypercover A → A^• of qfd perfectoid rings, and for an arc-hypercover A → A^• of separable perfectoid ℚ_p-algebras with A totally disconnected, colim_Δ GSpec(A^•) → GSpec(A) is a !-equivalence (ALRS Theorem 2.1.7, p. 15, ALRS line 797; ABLB Proposition 4.6.4, p. 55, ABLB line 2916; ABLB Corollary 4.4.10, p. 50, ABLB line 2641; ABLB Lemma 4.4.3, p. 46, ABLB line 2414).

A proof route: For (1), choose a surjection onto A^u from ℚ_p⟨T_n : n ∈ ℕ⟩, base change the descendable map colim_n ℚ_p⟨T_1,…,T_n⟩ → ℚ_p⟨T_n : n ∈ ℕ⟩ (index ≤ 2, EnhancedDerivedSheaves §E5:descent, isDescendable_colimit_of_uniformIndex) to get A′ with `A′^{†-red}` = A′^u, then pass to a perfectoid quasi-pro-étale cover; for (2) use the strictly totally disconnected basis of MotivesAndAlgebraicCyclesPartII Layer 0 and ind-finite étale covers; (3) is the almost-mathematics descent of ABLB §4.4 (Lemmas 4.4.3–4.4.9).

*Needs:* EnhancedDerivedSheaves §E2.6; §1.8; §2.1; §2.3; MotivesAndAlgebraicCyclesPartII Layer 0; PerfectoidSpaces §P2.10; EnhancedDerivedSheaves §E5:descent; AnalyticStacks §3.3.

**Checks.**

- For A = ℚ_p the map ℚ_p → ℚ_p^cyc is descendable and lands in a nilperfectoid ring.
- A nilperfectoid ring is its own cover; for A = 0 the empty family covers.
- ℚ_p is totally disconnected but not strictly totally disconnected, since its residue field ℚ_p is not algebraically closed; (2) requires passing to C_p-type covers.

### 2.5 Betti realization of condensed anima

Construct the colimit-preserving Betti realization (−)^Betti: CondAni → GelfStk^qfd, left adjoint in a morphism of ∞-topoi, sending a light profinite set S to GSpec(C^lc(S, ℚ_p)), the spectrum of the solid ℚ_p-algebra of locally constant functions (ABLB Lemma 4.2.9, p. 42, ABLB line 2214; ALRS §2.1, p. 13, ALRS line 671). For a qfd Gelfand ring A construct the natural map GSpec(A) → M(A)^Betti, and for a qfd derived Berkovich space X the map X → |X|^Betti (ALRS §2.2, p. 18, ALRS line 925).

A proof route: For a hypercover S^• → S of light profinite sets the pro-system of partial totalizations of C^lc(S^•, ℚ_p) is pro-isomorphic to C^lc(S, ℚ_p), which already holds with ℤ-coefficients.

*Needs:* §2.1; §1.5; Mathlib `LightProfinite`; Mathlib `LightCondensed`; AnalyticStacks §2.1, §4.1.

The API has the following laws.

- For a light profinite S, S^Betti = GSpec(C^lc(S, ℚ_p)).
- (−)^Betti preserves colimits and finite limits.
- For a qfd Gelfand ring A there is a natural map GSpec(A) → M(A)^Betti, compatible with rational localizations, which on the open subset U ⊂ M(A) recovers the open subspace GSpec(A)_U.

**Checks.**

- The Betti realization of a two-point set is GSpec(ℚ_p × ℚ_p) and that of the empty set is GSpec(0).
- For S = ℕ ∪ {∞}, C^lc(S, ℚ_p) consists of eventually constant sequences and is not the Banach algebra C(S, ℚ_p) of convergent sequences; GSpec(C(S, ℚ_p)) is the continuous incarnation S^cont, distinct from S^Betti.
- The point realizes to GSpec(ℚ_p), the final Gelfand stack.

### 2.6 Derived Berkovich spaces, †-rigid spaces and rigid spaces

Define the analytic topology on affinoid Gelfand stacks: a cover of GSpec(A) is a finite family of †-rational localizations whose spectra form a strict closed cover of M(A), that is, one refined by an open cover. A derived Berkovich space is a sheaf for this topology admitting an open cover by open subspaces of affinoid Gelfand stacks; it has an underlying topological space |X| = colim |GSpec(A)| (ABLB Definition 4.3.1, p. 44, ABLB line 2295; ALRS §2.2, p. 17, ALRS line 894). Prove that the left Kan extension BerkSp → GelfStk is fully faithful (ABLB Proposition 4.3.3, p. 44, ABLB line 2330). A †-rigid space over a separable nonarchimedean field K is a derived Berkovich space locally represented by a static quotient of an overconvergent Tate algebra `K⟨T_1,…,T_n⟩_{≤r}` for some r > 0 (ABLB Definition 4.3.6, p. 45, ABLB line 2384). For a rigid space X over a qfd Banach field define X′ = colim GSpec(A) over open affinoids Spa(A, A^+) ⊂ X; prove that X ↦ X′ sends rational covers to epimorphisms, depends only on the canonical compactification of X, and its restriction to partially proper rigid spaces is a fully faithful embedding into derived Berkovich spaces, with Spa(A, A^+) ↦ GSpec(A) on affinoids (ALRS Example 2.2.2, p. 17, ALRS line 910).

A proof route: Full faithfulness reduces to the statement that the realization of a strict analytic cover is a !-equivalence (ABLB Proposition 4.3.3); for partially proper rigid spaces the Tate-rational and †-rational gluings agree because every point has a neighbourhood basis of †-rational subspaces whose interiors cover.

*Needs:* §1.6; §2.1; §2.5; TropicalAndBerkovichArithmetic §0.17; TropicalAndBerkovichArithmetic §0.19; RigidAnalyticGeometry §6.2; AdicSpacesPartII §R1.1; AdicSpacesPartII §R0.10; AdicSpacesPartIV §F1.7.

The API has the following laws.

- Every derived Berkovich space X has a topological space |X|, with |GSpec(A)| = M(A), functorial in maps.
- Open subsets U ⊂ |X| define open subspaces X_U → X, and these are exactly the open immersions.
- BerkSp → GelfStk and BerkSp^qfd → GelfStk^qfd are fully faithful.
- Partially proper rigid spaces over K embed fully faithfully into derived Berkovich spaces, and dagger spaces in the sense of AdicSpacesPartIV §F1.7 give †-rigid spaces.
- For a K-affinoid algebra A in the sense of TropicalAndBerkovichArithmetic §0.17, |GSpec(A)| is its Berkovich spectrum, and affinoid and rational domains (§0.19) correspond to †-rational localizations with the same spectra.

**Checks.**

- The open unit disc is a partially proper rigid space whose derived Berkovich space has |X| the open Berkovich disc.
- The rigid closed disc Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) and its canonical compactification Spa(ℚ_p⟨T⟩, ℤ_p + pℤ_p⟨T⟩) have the same open affinoid algebra ℚ_p⟨T⟩, so the colimit defining X′ gives GSpec(ℚ_p⟨T⟩) for both: X′ does not see the ring of integral elements, and the construction factors through the canonical compactification, an adic space over ℚ_p that is partially proper but not a rigid space, its ring of integral elements not being the power-bounded subring ℤ_p⟨T⟩. Full faithfulness is asserted only on partially proper rigid spaces, and the closed disc is not one.
- `GSpec(ℚ_p⟨T⟩_{≤1})` and GSpec(ℚ_p⟨T⟩) have the same underlying space and different Gelfand stacks: the first is a †-rigid space and is Berkovich-smooth, the second is the canonical compactification of the closed disc and is not Berkovich-smooth (ALRS Warning 2.6.13).
- The radius r > 0 is needed. For r = 0, `K⟨T⟩_{≤0}` is the ring of power series in T with positive radius of convergence (1.2), with T ∈ Nil†, and `GSpec(K⟨T⟩_{≤0})`, the base change to K of G_a^† = `GSpec(ℚ_p⟨T⟩_{≤0})` of 3.1, is a †-nilpotent thickening of a point; its underlying space is one point, so every analytic cover of it has it as a member. It is not a static quotient of `K⟨T_1,…,T_n⟩_{≤r}` with r > 0: a surjection `K⟨T_1,…,T_n⟩_{≤r} → K⟨T⟩_{≤0}` of solid K-algebras sends T_i to germs g_i with |g_i(0)| ≤ r, and on a disc |T| < ρ on which every g_i converges with |g_i(T) − g_i(0)| ≤ r, each h(g_1,…,g_n) converges, h converging on a polydisc of radius > r; so the image misses 1/(1 − T/c) for 0 < |c| < ρ. `GSpec(K⟨T⟩_{≤1})` stays †-rigid.
- The empty sheaf is a derived Berkovich space with empty underlying space.

### 2.7 Relative spectra, Toën-affine maps and the Betti projection

For a qfd Gelfand stack X and A ∈ CAlg(D(X)) define GSpec_X(A) as the functor on Gelfand rings f: GSpec(R) → X with value `Map_{CAlg(D(R))}(f^*A, R)` (ALRS Definition 2.2.3, p. 18, ALRS line 937). Prove that it is a qfd Gelfand stack, compatible with base change, that GSpec_X(f_*O_Y) = Y for a map f: Y → X of affinoid Gelfand stacks, and define the relative affinization and Toën-affine maps (prim maps for which Y → GSpec_X(f_*O_Y) is an equivalence), a property local on the target (ALRS Remark 2.2.4, p. 18, ALRS line 941). Prove that for a qfd derived Berkovich space X the map h: X → |X|^Betti is Toën-affine and 0-affine, in particular 0-proper, so that X = `GSpec_{|X|^Betti}(h_*O_X)` (ALRS Lemma 2.2.5, p. 18, ALRS line 964).

A proof route: Toën-affineness of X → |X|^Betti is local on the target; covering |X|^Betti by light profinite S_i, each base change X `×_{|X|}` S_i is affinoid (ABLB Proposition 3.2.10), and maps of affinoid Gelfand stacks are 0-affine; 0-affineness is local on the target for effective epimorphisms (0.4; Gest Proposition 7.9).

*Needs:* §2.2; §2.3; §2.5; §2.6; AnalyticStacks §§0.8–0.11; §0.2; §0.3; §0.4.

The API has the following laws.

- For g: Y → X, Y ×_X GSpec_X(A) ≅ GSpec_Y(g^*A).
- For f: GSpec(B) → GSpec(A), `GSpec_{GSpec(A)}(f_*O)` = GSpec(B).
- Toën-affineness is local on the target for epimorphisms of Gelfand stacks.
- For a qfd derived Berkovich space X, h: X → |X|^Betti is Toën-affine and 0-affine (hence 0-proper), and h_*O_X is the sheaf U ↦ O(X_U) on |X|.

**Checks.**

- For X = GSpec(ℚ_p⟨T⟩), h_*O is the sheaf on the Berkovich disc assigning to a †-rational closed subset its overconvergent function ring, and `GSpec_{|X|}(h_*O)` recovers X.
- For A = `ℚ_p[u^{±1}]` with u of homological degree 2, GSpec_X(A) = ∅ although A ≠ 0, because a homogeneous unit of positive degree cannot map to a connective ring (ALRS Remark 2.2.4(4)).
- GSpec_X(O_X) = X for every qfd Gelfand stack X.

### 2.8 Light arc-stacks and perfectoidization

Define the ∞-category `ArcStk_{𝔽_p}` of light arc-stacks over 𝔽_p as the anima-valued arc-hypersheaves on separable perfectoid spaces of characteristic p (ABLB Definition 4.1.5, p. 38, ABLB line 1976, on the perfectoid spaces of characteristic p; ABLB line 2020–2022). For a separable Banach ring A, such as a Banach ℚ_p-algebra, ℤ_p or ℤ_p^cyc with the p-adic norm, or 𝔽_p with the trivial norm, let Marc(A) ∈ `ArcStk_{𝔽_p}` be the arc-sheaf of pairs (R^♯, A → R^♯) of an untilt and a bounded map: Marc(𝔽_p) is the final object, Marc(ℤ_p) classifies all untilts and Marc(ℚ_p) ⊂ Marc(ℤ_p) the untilts in which p is a unit. Put `ArcStk_{ℤ_p}` = `ArcStk_{𝔽_p}`/Marc(ℤ_p), which tilting identifies with the hypersheaves on the arc-site of all separable perfectoid spaces, and define the ∞-category `ArcStk_{ℚ_p}` = `ArcStk_{𝔽_p}`/Marc(ℚ_p) of light arc-stacks over Marc(ℚ_p), which tilting identifies with the anima-valued arc-hypersheaves on separable perfectoid spaces over ℚ_p (ABLB Definition 4.1.8, p. 39, ABLB line 2023; ALRS §2.3, p. 19, ALRS line 996). The qfd variants `ArcStk^qfd_{𝔽_p}`, `ArcStk^qfd_{ℤ_p}` = `ArcStk^qfd_{𝔽_p}`/Marc(ℤ_p) and `ArcStk^qfd_{ℚ_p}` are the hypersheaves on the separable perfectoid spaces that are qfd, in characteristic p quasi-pro-étale over a relative affine space over `𝔽_p((π^{1/p^∞}))` for a pseudo-uniformizer π (ABLB Definition 4.1.11(3), p. 39, ABLB line 2067; ABLB Example 4.1.13, p. 40, ABLB line 2086–2095; ABLB line 4981). ArcStk without subscript denotes `ArcStk_{𝔽_p}`; an arc-stack over ℤ_p or ℚ_p is an arc-stack over 𝔽_p through the forgetful functor of the slice; in Layers 2–5 an arc-stack is an object of `ArcStk_{ℚ_p}`. Construct the perfectoidization functor (−)^⋄: GelfStk → `ArcStk_{ℚ_p}` by restriction along totally disconnected perfectoid affinoids, colimit-preserving, with GSpec(A)^⋄ = Marc(A^u), and its left adjoint X ↦ X̂, written (X)^∧ on compound expressions, which preserves fibre products but not the final object (ABLB Lemma 4.5.1, p. 51, ABLB line 2690; ABLB Proposition 4.5.5, p. 52, ABLB line 2737; ALRS §2.3, p. 19, ALRS line 1005). Compare Marc(A) with the Banach arc-site of MotivesAndAlgebraicCyclesPartII Layer 0.

A proof route: separable totally disconnected perfectoid rings R form a basis of the arc-site, and (−)^⋄ is restriction along R ↦ GSpec(R), so its left adjoint is the left Kan extension of R ↦ GSpec(R); for this extension to be defined on arc-hypersheaves it suffices that, for every arc-hypercover R → R^• of separable perfectoid rings with R totally disconnected, colim_Δ GSpec(R^•) → GSpec(R) is a !-equivalence, which is 2.4(3) (ABLB Lemma 4.4.3, Proposition 4.5.5).

*Needs:* §2.1; §2.4; MotivesAndAlgebraicCyclesPartII Layer 0; PerfectoidSpaces §P1.27; PerfectoidSpaces §P2.10; EnhancedDerivedSheaves §E2.7.

The API has the following laws.

- GSpec(A)^⋄ = Marc(A) = Marc(A^u) for every separable Gelfand ring A.
- (−)^⋄ preserves colimits and finite limits, and is itself the inverse image of a geometric morphism of ∞-topoi (ALRS §2.3, ALRS line 1016; ABLB Lemma 4.5.1(1), ABLB line 2691).
- For a qfd nilperfectoid A, the left adjoint sends Marc(A^u) to GSpec(A^u).
- For a separable Banach ring A, Marc(A) agrees on separable perfectoid spaces with the arc-sheafified representable of the arc-site of MotivesAndAlgebraicCyclesPartII Layer 0.

**Checks.**

- GSpec(ℚ_p[ε]/ε²)^⋄ = Marc(ℚ_p) = GSpec(ℚ_p)^⋄: perfectoidization forgets †-nilpotent thickenings.
- In `ArcStk_{𝔽_p}`, Marc(𝔽_p) is the final object and Marc(𝔽_p) `×_{Marc(ℤ_p)}` Marc(ℚ_p) = ∅, since p is not both zero and a unit in a nonzero untilt; so the final object Marc(ℚ_p) of `ArcStk_{ℚ_p}` is not that of `ArcStk_{𝔽_p}`, and for an arc-stack X over 𝔽_p the product X `×_{Marc(𝔽_p)}` Marc(ℚ_p) of 6.1 and 6.3 is the part of X × Marc(ℤ_p) away from the locus p = 0.
- `GSpec(ℚ_p⟨T⟩_{≤1})^⋄` = GSpec(ℚ_p⟨T⟩)^⋄ = Marc(ℚ_p⟨T⟩).
- The left adjoint X ↦ X̂ preserves fibre products but not the final object (ALRS line 1015): the final arc-stack Marc(ℚ_p) is not sent to the final Gelfand stack GSpec(ℚ_p), so X ↦ X̂, as a functor to GelfStk, is not the inverse image of a geometric morphism GelfStk → `ArcStk_{ℚ_p}`; as a functor to the slice of GelfStk over the image of Marc(ℚ_p) it is the inverse image of a geometric morphism from that slice to `ArcStk_{ℚ_p}` (ABLB Proposition 4.5.5, p. 52, ABLB line 2737).

### Examples

GSpec(ℚ_p) is the final Gelfand stack and GSpec(0) the initial one. The Betti realization of a two-point set is GSpec(ℚ_p × ℚ_p). The open unit disc is a partially proper rigid space and a derived Berkovich space; the closed disc Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) and its canonical compactification have the same Gelfand stack GSpec(ℚ_p⟨T⟩). The perfectoidization of GSpec(ℚ_p[ε]/ε²) is Marc(ℚ_p).

### Dependencies

Layers 0 and 1; AnalyticStacks §0.5, §0.6, §§0.8–0.11, §2.1, §2.3, §2.11, §3.2, §3.3, §3.6, §4.1, §4.3, §4.4, §4.5; RefinedTraceMethods §4.3; EnhancedDerivedSheaves §E0.5, §E2.6, §E2.7, §E5:descent, §E5:presentability.4; TropicalAndBerkovichArithmetic §0.17, §0.19; RigidAnalyticGeometry §6.2; AdicSpacesPartII §R1.1, §R0.10; AdicSpacesPartIV §F1.7; PerfectoidSpaces §P1.27, §P2.10; MotivesAndAlgebraicCyclesPartII Layer 0.

## Layer 3: Analytic de Rham stacks, analytification and Cartier divisors

This layer constructs the analytic de Rham stack as the right adjoint of perfectoidization and records its descent and cohomological properties, defines locally analytic points, analytifies étale algebraic stacks into Gelfand stacks, and identifies maps to BG_m and A¹/G_m with line bundles and generalized Cartier divisors. From here on all Gelfand rings, Gelfand stacks and arc-stacks are separable and qfd.

### 3.1 The analytic de Rham stack

Define the analytic de Rham stack (−)^dR: `ArcStk^qfd_{ℚ_p}` → GelfStk^qfd as the right adjoint of perfectoidization; explicitly, for a qfd nilperfectoid ℚ_p-algebra A, X^dR(A) = X(Marc(A^u)), and for a qfd Gelfand stack X put X^dR = (X^⋄)^dR, so that X^dR(A) = X(A^u) (ALRS Definition 2.3.1, p. 19, ALRS line 1017; ALRS Remark 2.3.2, p. 20, ALRS line 1027). For a map Y → X define the relative de Rham stack `Y^{dR/X}` = X `×_{X^dR}` Y^dR. Prove that for a qfd derived Berkovich space X, X^dR is the !-sheafification of A ↦ `X(A^{†-red})`, that for a map Z → X of qfd derived Berkovich spaces whose map of arc-stacks is an immersion `Z^{dR/X}` is the overconvergent neighbourhood X^†_Z, and that for a †-rigid space X over a qfd field K, X → `X^{dR/K}` is prim and descendable with Čech nerve `(X^{×_K (n+1)})^†_Δ` (ABLB Proposition 4.7.12, p. 59, ABLB line 3155; ABLB Theorem 4.7.15, p. 61, ABLB line 3248).

A proof route: The right adjoint exists because perfectoidization is a colimit-preserving functor between presentable categories; its value on nilperfectoids is computed from the qfd identification (Marc(A^u))^∧ = GSpec(A^u) of 2.8. The presentations follow ABLB §4.7 (RC24 Theorem 5.4.1 adapted).

*Needs:* §2.8; §2.4; §2.6; AnalyticStacks §3.3.

The API has the following laws.

- Maps Y → X^dR of qfd Gelfand stacks are equivalent to maps Y^⋄ → X of arc-stacks.
- For a qfd nilperfectoid A and a qfd Gelfand stack X, X^dR(A) = X(A^u); in particular X^dR(A) depends only on A^u.
- The unit X → X^dR induces (X^dR)^dR ≅ X^dR.
- For an immersion Z → X of qfd derived Berkovich spaces on arc-stacks, `Z^{dR/X}` = X^†_Z.

**Checks.**

- For A¹, (A¹)^dR(A) = A^u-points = A/Nil†(A) on nilperfectoids, so (A¹)^dR = A¹/G_a^† with G_a^†(A) = Nil†(A) = `GSpec(ℚ_p⟨T⟩_{≤0})(A)` acting by translation (ABLB Theorem 4.7.15).
- GSpec(ℚ_p[ε]/ε²)^dR = GSpec(ℚ_p)^dR = GSpec(ℚ_p), since both have perfectoidization Marc(ℚ_p).
- A¹ → (A¹)^dR is not an isomorphism: over A = C_p[ε]/ε² the points ε and 0 of A¹(A) have the same image.
- The empty arc-stack has empty de Rham stack: ∅^dR(A) = ∅(Marc(A^u)) is empty for every nonzero nilperfectoid A.

### 3.2 Exactness and arc-hyperdescent of the de Rham stack

Prove that (−)^dR: `ArcStk^qfd_{ℚ_p}` → GelfStk^qfd is left exact and commutes with all colimits, hence is the inverse image of a geometric morphism; in particular, for an arc-hypercover X_• → X of qfd arc-stacks, |X^dR_•| → X^dR is an equivalence, and epimorphisms go to epimorphisms (ABLB Theorem 5.6.6, p. 90, ABLB line 4799; ABLB Theorem 5.6.1, p. 87, ABLB line 4629; ABLB Theorem 4.8.7, p. 64, ABLB line 3384). Prove that (−)^dR and the left adjoint of perfectoidization are fully faithful (ABLB Proposition 4.5.7, p. 52, ABLB line 2752).

A proof route: Commutation with colimits reduces, by the adjunction between perfectoid and nilperfectoid affinoids, to arc-hyperdescent of qfd affinoid perfectoid rings for the pullback functor (ABLB Theorem 5.6.1), which is proved through nuclear modules and the cohomology of de Rham stacks of overconvergent polydiscs (ABLB §§5.5–5.6).

*Needs:* §3.1; §2.3; §2.4; AnalyticStacks §4.3; RefinedTraceMethods §4.3.

**Checks.**

- For a locally profinite group G with classifying arc-stack BG, (BG)^dR = BG^sm, where G^sm has the locally constant ℚ_p-valued functions (ABLB Remark 1.2.6).
- The de Rham stack of a disjoint union of two qfd arc-stacks is the disjoint union of their de Rham stacks.
- Without the qfd restriction the big de Rham stack satisfies the other assertions but is not known to commute with colimits (ABLB Remark 1.2.6), which is why the qfd setting is imposed.

### 3.3 Cohomological properness and smoothness of de Rham stacks

Prove: (1) if a map f: Y → X of qfd arc-stacks over ℚ_p is arc-locally on X locally of quasi-finite dimension (lqfd: strict closed covers by pieces qcqs and quasi-pro-étale over a relative affine space), then f^dR is !-able, and cohomologically proper if f is proper (ABLB Proposition 5.1.4, p. 67, ABLB line 3512); (2) if f is smooth (arc-locally on X and analytically on Y étale over a relative affine space) of pure dimension d, then f^dR is cohomologically smooth with dualizing complex O[2d], and cohomologically étale when f is étale (ABLB Theorem 5.1.7, p. 68, ABLB line 3567); (3) for the open punctured pre-perfectoid unit disc X = `lim_{x↦x^p}` `D̊^{×,⋄}`, X^dR → GSpec(ℚ_p) is cohomologically smooth with dualizing complex O[2] (ABLB Proposition 5.7.1, p. 91, ABLB line 4860).

A proof route: As in ABLB §5.1: !-ability is local on the source for strict closed covers, reducing to Y quasi-pro-étale over A^d_X, where de Rham stacks of quasi-pro-étale maps and of `A^{d,dR}_X` → X^dR are !-able; smoothness reduces by HM Lemmas 4.5.7–4.5.8 to the open disc, treated through the overconvergent de Rham cohomology of polydiscs.

*Needs:* §3.2; §2.2; AnalyticStacks §§0.8–0.11; AnalyticStacks §6.4, §6.6.

**Checks.**

- For `A^{d,⋄}` → Marc(ℚ_p) the dualizing complex is O[2d]; for d = 0 it is O.
- The dualizing complex of a smooth de Rham stack carries no Frobenius twist; the Tate twist O⟨1⟩[2] of 6.3 appears only after passing to Hyodo–Kato stacks.
- The open disc is smooth and not proper over Marc(ℚ_p), so its de Rham stack is cohomologically smooth but f^dR_! ≠ f^dR_*.

### 3.4 Locally analytic points

For a rigid space X over ℚ_p, viewed as a Gelfand stack, define X(ℚ_p)^la := X `×_{X^dR}` (X(ℚ_p))^dR, where X(ℚ_p) is the locally profinite set of ℚ_p-points (ALRS Definition 2.3.3, p. 20, ALRS line 1032). When X is a rigid analytic group, X(ℚ_p)^la is a group object in Gelfand stacks; for a p-adic Lie group G define G^cont = GSpec(C(G, ℚ_p)) locally and G^sm with the locally constant functions, so that there are group maps G^cont → G^la → G^sm (ALRS footnote 6, p. 6, ALRS line 326).

*Needs:* §3.1; §2.5; §2.6.

The API has the following laws.

- If X is a rigid analytic group then X(ℚ_p)^la is a group object and X(ℚ_p)^la → X is a group map.
- The de Rham stack of X(ℚ_p)^la is X(ℚ_p)^dR = X(ℚ_p)^sm, the Betti realization of the locally profinite set X(ℚ_p).
- For a nilperfectoid A, X(ℚ_p)^la(A) is the set of points x ∈ X(A) whose image in X(A^u) comes from a continuous map M(A) → X(ℚ_p); for a light profinite set S, S^dR(A) = S(Marc(A^u)) is the set of continuous maps M(A) → S, which need not be locally constant.

**Checks.**

- A¹(ℚ_p)^la = ℚ_p^la, and ℚ_p^la(ℚ_p[ε]/ε²) = ℚ_p ⊕ ℚ_p·ε while ℚ_p^sm(ℚ_p[ε]/ε²) = ℚ_p; the extra tangent direction distinguishes locally analytic from locally constant.
- ℚ_p^la(C_p[ε]/ε²) = {a + bε : a ∈ ℚ_p, b ∈ C_p}, because the reduction modulo the †-nilradical must be a constant in ℚ_p.
- For X = GSpec(ℚ_p), X(ℚ_p)^la = GSpec(ℚ_p).
- For A = C(ℤ_p, C_p), a strictly totally disconnected perfectoid ring with M(A) = ℤ_p, ℚ_p^la(A) = A `×_{A^u}` C(ℤ_p, ℚ_p) = C(ℤ_p, ℚ_p); it contains the inclusion ℤ_p → ℚ_p, the image of the tautological point of ℤ_p^cont = GSpec(C(ℤ_p, ℚ_p)) under ℤ_p^cont → ℤ_p^la → ℚ_p^la, which is not locally constant. A description by locally constant maps would give the smaller C^lc(ℤ_p, ℚ_p), against Γ(FF_A, O) = ℚ_p^la(A) of 7.5.

### 3.5 Analytification of étale algebraic stacks and Tannakian stacks

For an affinoid Gelfand stack S = GSpec(R) and an affine derived scheme Spec(R′) over Spec(R(*)) define (Spec R′)^an(A) = `Map_{R(*)}(R′, A(*))`. Prove that this extends uniquely to a colimit-preserving and finite-limit-preserving functor (−)^an from étale sheaves on affine derived schemes over Spec(R(*)) to Gelfand stacks over S, the !-sheafification of A ↦ X(A(*)) (ALRS Lemma 2.4.1, p. 20, ALRS line 1053). Call an étale algebraic stack X over Spec(R(*)) Tannakian if for every R(*)-algebra R′ the map x ↦ x^* from X(R′) to the D(R(*))-linear symmetric monoidal functors QCoh(X) → D(R′) is fully faithful with essential image the functors preserving connective objects, strongly Tannakian if moreover `QCoh_{≥0}(X)` is generated under filtered colimits by connective pseudo-coherent objects, and perfect if Ind(Perf(X)) → QCoh(X) is an equivalence (ALRS Definition 2.4.2, p. 21, ALRS line 1092). Prove that for a perfect strongly Tannakian X over Spec(R(*)) the presheaf A ↦ X(Spec A(*)) is already a Gelfand stack equal to X^an, and that maps Y → X^an from a Gelfand stack Y over S are the Perf(R)-linear symmetric monoidal functors Perf(X) → Perf(Y) whose extension to QCoh(X) carries connective pseudo-coherent objects to objects that are locally connective (ALRS Proposition 2.4.5, p. 22, ALRS line 1143).

A proof route: Étale covers of finitely presented schemes become rigid étale surjections, hence !-covers. For the Tannakian statement use that perfect complexes form a sheaf of categories on GelfStk (2.3) and that connectivity of discrete pseudo-coherent complexes is !-local (Sch24 Proposition VI.1.2, AnalyticStacks §4.4(3)).

*Needs:* §2.3; §1.7; SchemeAndStackFoundations §1.18; SchemeAndStackFoundations §1.19; SchemeAndStackFoundations §1.22; ReductiveGroups Layer 1; DerivedModuleAlgebra §1.E.0; AnalyticStacks §4.4.

The API has the following laws.

- For an affine derived scheme Spec(R′) over Spec(R(*)) and a Gelfand ring A over R, (Spec R′)^an(A) = `Map_{R(*)}(R′, A(*))`; for an étale sheaf X, X^an is the !-sheafification of A ↦ X(A(*)).
- (−)^an preserves all colimits and finite limits, and sends étale covers of affine derived schemes over Spec(R(*)) to !-covers.
- For a perfect strongly Tannakian X over Spec(R(*)), X^an(A) = X(Spec A(*)) for every Gelfand ring A over R, without sheafification.
- For a perfect strongly Tannakian X and a Gelfand stack Y over S, maps Y → X^an are the Perf(R)-linear symmetric monoidal functors Perf(X) → Perf(Y) whose extension to QCoh(X) = Ind(Perf(X)) sends connective pseudo-coherent objects to locally connective objects.

**Checks.**

- `(A^{1,sch})^an` = A¹ with A¹(A) = A(*), and `(G_m^{sch})^an` = G_m with G_m(A) = A(*)^×; A¹ is the increasing union of the discs GSpec(ℚ_p⟨p^n T⟩), not the closed disc GSpec(ℚ_p⟨T⟩).
- B `G_m^{sch}` and `A^{1,sch}/G_m^{sch}` over a field of characteristic zero are perfect and strongly Tannakian (ALRS Example 2.4.4(3)), so their analytifications have the functor-of-points description.
- The analytification of Spec(R(*)) is S itself.

### 3.6 Line bundles, BG_m and generalized Cartier divisors

Prove that for a Gelfand stack X the anima Map(X, BG_m) is equivalent to the anima of line bundles in D(X), the objects that are ∗-locally perfect of amplitude 0 and rank 1 (ALRS Lemma 2.5.2, p. 22, ALRS line 1178), and that Map(X, A¹/G_m) is equivalent to the anima of generalized Cartier divisors (L, s: L → O_X) with L a line bundle; if X is a derived Berkovich space this is also the anima of maps Z → X which are analytically locally the derived zero locus of a function. The correspondences send g: X → A¹/G_m to its pullback along {0}/G_m → A¹/G_m, f: Z → X to L = fib(O_X → f_*O_Z), and (L, s) to the descent of the G_m-equivariant map V(L)^× → A¹ (ALRS Proposition 2.5.3, p. 23, ALRS line 1197). In this roadmap "Cartier divisor" always means generalized Cartier divisor in this sense.

A proof route: Locally on a Gelfand ring a line bundle is a rank one projective module in degree 0 by the Fredholm property, trivialized after a †-rational localization; automorphisms of the trivial bundle are A(*)^×. For A¹/G_m, sections of L lift !-locally to functions, and triangles O → O over the identity are indexed by units.

*Needs:* §3.5; §2.3; §1.7; SchemeAndStackFoundations §1.21; SchemeAndStackFoundations §1.15.

The API has the following laws.

- Map(X, BG_m) ≅ line bundles on X, compatibly with pullback and tensor product.
- Map(X, A¹/G_m) ≅ pairs (L, s: L → O_X), compatibly with pullback; tensor product of pairs corresponds to the multiplication A¹/G_m × A¹/G_m → A¹/G_m.
- The divisor Z = X `×_{A¹/G_m}` BG_m attached to (L, s) has O_Z = cofib(s), and the divisor is empty if and only if s is an isomorphism.

**Checks.**

- Over GSpec(ℚ_p) there are two isomorphism classes of Cartier divisors: s ≠ 0 gives the empty divisor and s = 0 gives the derived zero locus GSpec(ℚ_p ⊕ ℚ_p[1]), which is neither empty nor GSpec(ℚ_p).
- On GSpec(ℚ_p⟨T⟩), (O, T) has zero locus GSpec(ℚ_p) at the origin; (O, T²) has zero locus GSpec(ℚ_p[T]/T²), and (O, 1) is empty.
- The universal Cartier divisor on A¹/G_m has ideal sheaf the line bundle I of weight −1, and its divisor is BG_m = {0}/G_m; this fixes the sign of the G_m-weights used for cones in Layer 5.

### Examples

The de Rham stack of the analytic affine line is A¹/G_a^†, where G_a^†(A) = Nil†(A). The locally analytic points of A¹ over ℚ_p[ε]/ε² are ℚ_p ⊕ ℚ_p·ε, whereas the locally constant ones are ℚ_p. Over GSpec(ℚ_p) a Cartier divisor is (O, s) with s ∈ ℚ_p up to units: either the empty divisor (s ≠ 0) or the derived zero locus GSpec(ℚ_p ⊕ ℚ_p[1]) (s = 0).

### Dependencies

Layers 1 and 2; AnalyticStacks §§0.8–0.11, §3.3, §4.3, §4.4, §6.4, §6.6; RefinedTraceMethods §4.3; SchemeAndStackFoundations §1.15, §1.18–§1.22; ReductiveGroups Layer 1; EnhancedDerivedSheaves §E5:presentability.4; DerivedModuleAlgebra §1.E.0.

## Layer 4: Morphisms, pushouts, †-cohesiveness and deformation theory

This layer fixes the classes of morphisms used throughout (†-formally étale and smooth maps, immersions, rigid and Berkovich étale and smooth maps, Zariski closed immersions), constructs the pushouts of Berkovich spaces along Zariski closed immersions that underlie thickened Fargues–Fontaine curves, introduces †-cohesive maps, and develops the deformation theory of Gelfand stacks: cotangent complexes, infinitesimal cohesiveness, the †-quasi-pro-étale topology and tangent complexes of classifying stacks.

### 4.1 †-formally étale and †-formally smooth maps

Prove that for a map f: Y → X of Gelfand stacks the following are equivalent: (1) Y → `Y^{dR/X}` is an isomorphism; (2) for every Gelfand ring A, Y(A) → X(A) `×_{X^⋄(Marc(A^{†-red}))}` `Y^⋄(Marc(A^{†-red}))` is an isomorphism; (3) for every nilperfectoid A, Y(A) → X(A) `×_{X(A^u)}` Y(A^u) is an isomorphism; call such f †-formally étale (ALRS Lemma 2.6.1, p. 24, ALRS line 1248; ABLB Definition 4.7.2, p. 57, ABLB line 3051). Define f to be †-formally smooth (the map in (3) is an epimorphism for nilperfectoid A), weakly †-formally smooth (Y → `Y^{dR/X}` is an epimorphism), strongly †-formally smooth (Y(A) → X(A) `×_{X(A^{†-red})}` `Y(A^{†-red})` is an epimorphism for every Gelfand ring A), and †-formally étale locally †-formally smooth (†-formally smooth after †-formally étale epimorphisms on source and target), with the implications strong ⇒ †-formally smooth ⇒ étale-locally ⇒ weak (ALRS Definition 2.6.4, p. 24, ALRS line 1275). Prove that a weakly †-formally smooth map is an epimorphism if and only if f^⋄ is (ALRS Lemma 2.6.5, p. 24, ALRS line 1293).

A proof route: (2) ⇒ (1) ⇒ (3) are formal; for (3) ⇒ (2) cover A by a nilperfectoid B with nilperfectoid Čech nerve (2.4) and pass to the limit, using that Marc(B^u) → `Marc(A^{†-red})` is an arc-cover. ALRS Lemma 2.6.5 factors f as Y → `Y^{dR/X}` → X, the second map being a base change of (f^⋄)^dR.

*Needs:* §3.1; §2.4; §1.6.

The API has the following laws.

- †-formally étale maps are stable under base change and composition and satisfy cancellation; †-rational localizations of Berkovich spaces are †-formally étale.
- For every map Y → X, `Y^{dR/X}` → X is †-formally étale; in particular Y^dR → GSpec(ℚ_p) is, `Y^{dR/GSpec(ℚ_p)}` being Y^dR.
- Strongly †-formally smooth ⇒ †-formally smooth ⇒ †-formally étale locally †-formally smooth ⇒ weakly †-formally smooth.
- A weakly †-formally smooth map is an epimorphism of Gelfand stacks if and only if its perfectoidization is an epimorphism of arc-stacks.

**Checks.**

- A †-rational localization `GSpec(A⟨f/g⟩_{≤1})` → GSpec(A) is †-formally étale (ABLB Proposition 3.1.9).
- The zero section 0 → A¹ is not †-formally étale: for A = C_p[ε]/ε² the target set X(A) `×_{X(A^u)}` Y(A^u) is Nil†(A) = C_p·ε, while Y(A) is a point.
- GSpec(ℚ_p⟨T⟩) → GSpec(ℚ_p) has cotangent complex ℚ_p⟨T⟩dT (formally smooth in 4.6) but is not †-formally smooth (ALRS Remark 2.6.6; ABLB Example 4.7.7).
- Isomorphisms are †-formally étale.

### 4.2 Immersions, rigid and Berkovich étale and smooth maps

For a map f: Y → X of Berkovich spaces define: f is an open (closed, locally closed) immersion if |Y| → |X| is one and Y → |Y|^Betti `×_{|X|^Betti}` X is an isomorphism, equivalently f is †-formally étale and f^⋄ is an open (closed, locally closed) immersion of arc-stacks (ALRS Definition 2.6.8, p. 25, ALRS line 1321); finite étale maps (ALRS Remark 2.6.7, p. 25, ALRS line 1309); rigid étale maps (analytically locally composites of open immersions and finite étale maps) and rigid smooth maps (analytically locally rigid étale over A^n_X) (ALRS Definition 2.6.10, p. 25, ALRS line 1332); Berkovich-étale maps (locally on strict closed covers composites of †-rational localizations and finite étale maps) and Berkovich-smooth maps (locally Berkovich-étale over A^n_X) (ALRS Definition 2.6.12, p. 25, ALRS line 1344). Prove that rigid smooth maps are analytically locally strongly †-formally smooth (ALRS Lemma 2.6.11, p. 25, ALRS line 1339) and that smooth partially proper rigid spaces over a nonarchimedean field are rigid smooth (ALRS Warning 2.6.13, p. 25, ALRS line 1351).

A proof route: ALRS Lemma 2.6.11 reduces to the solid smooth case of RC24 Proposition 3.7.5 (solid étale maps of bounded solid ℚ_p-algebras in the sense of 1.1 are †-formally étale, solid smooth maps †-formally smooth).

*Needs:* §4.1; §2.6; §1.6; AdicEtaleGeometry §A2.4; AdicSpacesPartII §R0.16.

The API has the following laws.

- Rigid étale maps are Berkovich-étale and rigid smooth maps are Berkovich-smooth; Berkovich-étale maps are †-formally étale.
- Being an open or closed immersion is local on the target for !-covers, which therefore defines open and closed immersions of Gelfand stacks.
- A smooth morphism of partially proper rigid spaces (AdicSpacesPartII §R0.16, AdicEtaleGeometry §A2.4) is rigid smooth on the associated Berkovich spaces.

**Checks.**

- The open unit disc is rigid smooth over ℚ_p.
- The overconvergent closed disc `GSpec(ℚ_p⟨T⟩_{≤1})` is Berkovich-smooth but not rigid smooth.
- The closed disc GSpec(ℚ_p⟨T⟩), the canonical compactification, is neither Berkovich-smooth nor rigid smooth.
- A †-rational localization onto a closed subdisc is Berkovich-étale but not rigid étale, since its image is not open; in TropicalAndBerkovichArithmetic §0.30 the inclusion of the strict closed subdisc is quasi-étale and not étale, so the two uses of the word differ on this map.

### 4.3 Zariski closed immersions and pushouts of Berkovich spaces

Call a map f: Z → X of Berkovich spaces Zariski closed if it is Toën-affine and locally on a strict closed affinoid cover X_i = GSpec(A_i) the map A_i → `f_{i,*}O_{Z_i}` is surjective on π_0 with connective target (ALRS Definition 2.7.1, p. 26, ALRS line 1366). Prove: (1) for two Zariski closed maps f: Z → Y and g: Z → X the pushout X ⊔_Z Y exists in Berkovich spaces, with |X ⊔_Z Y| = |X| `⊔_{|Z|}` |Y| and, in the affinoid case with π_0-surjective maps, X ⊔_Z Y = GSpec(O(X) `×_{O(Z)}` O(Y)) (ALRS Lemma 2.7.3, p. 26, ALRS line 1375); (2) for g: GSpec(A) → GSpec(A′) inducing an isomorphism on uniform completions and f: GSpec(A) → X Zariski closed, X `⊔_{GSpec A}` GSpec(A′) exists with space |X| and structure sheaf O_X `×_{O_Z}` `O_{Z′}` (ALRS Lemma 2.7.4, p. 27, ALRS line 1441); (3) for connective solid ℚ_p-algebras A → B ← C with A → B surjective and D = A ×_B C, the functor D(D) → D(A) `×_{D(B)}` D(C) is fully faithful, an equivalence on D^+, and an equivalence on Perf when A, B, C are Gelfand (ALRS Lemma 2.7.5, p. 27, ALRS line 1461).

A proof route: In the affinoid case identify |GSpec(B ×_A C)| with the pushout of spectra pointwise, using a †-rational localization inverting an element of the kernel; glue by analytic descent. For (3) construct the right adjoint (N, M) ↦ N ×_K M and prove the unit is an equivalence; essential surjectivity on D^+ uses projectivity of ℤ_■[S] and a connectivity induction; Perf follows by passing to dualizable objects and the Fredholm property.

*Needs:* §2.6; §2.7; §2.3; §1.7.

The API has the following laws.

- For two Zariski closed maps Z → Y and Z → X of Berkovich spaces the pushout X ⊔_Z Y exists in Berkovich spaces, and |X ⊔_Z Y| = |X| `⊔_{|Z|}` |Y|.
- If X, Y and Z are affinoid and O(X) → O(Z) and O(Y) → O(Z) are surjective on π_0, then X ⊔_Z Y = GSpec(O(X) `×_{O(Z)}` O(Y)).
- For GSpec(A) → GSpec(A′) inducing an isomorphism of uniform completions and a Zariski closed GSpec(A) → X, the pushout X `⊔_{GSpec A}` GSpec(A′) has underlying space |X| and structure sheaf O_X `×_{O_{GSpec A}}` `O_{GSpec A′}`.
- For connective solid ℚ_p-algebras A → B ← C with A → B surjective on π_0 and D = A ×_B C, base change D(D) → D(A) `×_{D(B)}` D(C) is fully faithful and an equivalence on bounded-below objects, and Perf(D) ≃ Perf(A) `×_{Perf(B)}` Perf(C) when A, B and C are Gelfand rings.

**Checks.**

- The pushout of two copies of GSpec(ℚ_p⟨T⟩) along their origins is GSpec(ℚ_p⟨S, T⟩/(ST)).
- ALRS Lemma 2.7.5 fails for full module categories: for A = C = ℚ_p[T], B = ℚ_p, the pair `(⊕_{n even} B[n], ⊕_{n odd} B[n])` lies in D(A) `×_{D(B)}` D(C) but not in the image of D(D) (ALRS Example 2.7.6).
- Zariski closed immersions do not satisfy !-descent: the inclusion of the †-rational disc {|T| ≤ `p^{-1}`} into the closed unit disc becomes Zariski closed after base change to a strictly totally disconnected cover, where it is a limit of inclusions of clopen subsets, but is not Zariski closed: on a connected affinoid neighbourhood of the Gauss point of radius `p^{-1}`, a function vanishing on the part of the small disc it contains vanishes identically, so no ideal cuts out the disc near the points with |T| slightly larger than `p^{-1}` (ALRS Example 2.7.2, whose disc of radius 1/2 is a †-rational subspace only for p = 2, radii of rational discs over ℚ_p lying in `p^ℚ`).
- For Z = ∅ the pushout is the disjoint union X ⊔ Y.

### 4.4 †-thickenings and †-cohesive maps

Call a map A → B of Gelfand rings a †-thickening if it is surjective and induces an isomorphism on †-reductions. Call a map f: Y → X of Gelfand stacks †-cohesive if for every †-thickening B → A and every surjection C → A of Gelfand rings the square with corners Y(B ×_A C), Y(B) `×_{Y(A)}` Y(C), X(B ×_A C), X(B) `×_{X(A)}` X(C) is cartesian (ALRS Definition 2.7.7, p. 29, ALRS line 1538). Prove that maps of Berkovich spaces are †-cohesive, that Perf(−) is †-cohesive, that X^an → GSpec(R) is †-cohesive for a perfect strongly Tannakian X (ALRS Example 2.7.8, p. 29, ALRS line 1546), and that †-cohesive maps satisfy two-out-of-three over a †-cohesive base, are stable under base change, and include all †-formally étale maps (ALRS Lemma 2.7.9, p. 29, ALRS line 1555).

*Needs:* §4.3; §4.1; §3.5; §2.3.

The API has the following laws.

- Every morphism of Berkovich spaces is †-cohesive (by 4.3(2)).
- If f: Y → X is †-cohesive then g: Z → Y is †-cohesive if and only if f ∘ g is; base changes of †-cohesive maps are †-cohesive.
- †-formally étale maps are †-cohesive; in particular every de Rham stack Y^dR → GSpec(ℚ_p) is †-cohesive.

**Checks.**

- ℚ_p[ε]/ε² → ℚ_p is a †-thickening; ℚ_p⟨T⟩ → ℚ_p (T ↦ 0) is surjective but not a †-thickening, since the †-reductions differ.
- For B = ℚ_p[ε]/ε² → A = ℚ_p and C = ℚ_p⟨T⟩ → ℚ_p, Perf(B ×_A C) ≅ Perf(B) `×_{Perf(A)}` Perf(C) by 4.3(3).
- GSpec(ℚ_p) → GSpec(ℚ_p) is †-cohesive.

### 4.5 Cotangent complexes of Gelfand rings

With the solid cotangent complex of AnalyticStacks §§5.1–5.2: for a map A → B of solid animated ℤ-algebras, `L_{B/A} ∈ D_{≥0}(B)` corepresents A-linear derivations into connective modules, with base change, colimit, transitivity and idempotent-vanishing properties (ALRS Lemma A.1.1, p. 175, ALRS line 9427), and for discrete A, `L_{A/ℤ}` is discrete with `L_{A/ℤ}(*) = L_{A(*)/ℤ}` (ALRS Lemma A.1.3(1), p. 175, ALRS line 9463). AnalyticStacks §5.3 gives, for a descendable map A → A_0 of solid animated R-algebras with Čech conerve A^•, the equivalence ∧^m_A `L_{A/R} → Tot(∧^m_{A^•} L_{A^•/R})` for all m (ALRS Lemma A.1.2, p. 175, ALRS line 9435). Prove that for a p-complete solid animated ℤ-algebra A, `L_{A/ℤ_p}` is p-complete and `L_{A[1/p]/ℚ_p} = (lim_n L_{(A/p^n)/(ℤ/p^n)})[1/p]` (ALRS Lemma A.1.3(2), p. 175, ALRS line 9464).

A proof route: since ℤ → ℤ_p is idempotent, transitivity gives `L_{A/ℤ_p} = L_{A/ℤ}`, and p-completeness of a connective module is checked on each π_i. π_0 `L_{A/ℤ}` is I/I² for I the kernel of π_0(A ⊗ A) → π_0(A), hence p-complete. For higher π_i compare with Hochschild homology HH(A/ℤ) = A `⊗_{A ⊗ A}` A, p-complete because A is p-complete and connective. Its HKR filtration Fil^• is built on the values A(S), S light profinite, which are animated rings, and then sheafified and solidified as L itself is. RefinedTraceMethods §1.10 defines the filtration on commutative rings as the left Kan extension of the Postnikov filtration `τ_{≥k}HH(P/ℤ)` of polynomial ℤ-algebras P; the same left Kan extension from polynomial ℤ-algebras to animated ℤ-algebras (EnhancedDerivedSheaves §E5:animation.1) defines Fil^• on HH(A(S)/ℤ). Its graded pieces are gr^k = ∧^k_A `L_{A/ℤ}[k]`: Hochschild homology, the cotangent complex and its animated exterior powers (EnhancedDerivedSheaves §E5:cotangent-export.2) commute with sifted colimits, and §1.10 identifies gr^k with ∧^k L[k] on polynomial rings. Fil^k is k-connective, so the filtration is complete. For an integer ℓ ≥ 2 prime to p, the degree-ℓ self-map of the circle induces an E_∞-endomorphism ψ^ℓ of HH(A/ℤ) = S¹ ⊗ A, the tensor of the animated ring A with the circle, which is functorial in the space (RefinedTraceMethods §1.7). ψ^ℓ preserves Fil^• (on polynomial rings every map preserves the Postnikov filtration, and both are left Kan extended from there) and acts on gr^k by ℓ^k (on a polynomial ring HH_k = Ω^k is generated multiplicatively by HH_1, where the action is by the degree ℓ). On the fibre of ψ^ℓ − ℓ on Fil¹/Fil^j the graded pieces with 2 ≤ k < j are killed by ℓ^k − ℓ ≠ 0, hence of bounded p-power torsion, while the piece k = 1 is the fibre of the zero map on `L_{A/ℤ}[1]`, that is `L_{A/ℤ}[1] ⊕ L_{A/ℤ}`; induction on i gives p-completeness of π_i `L_{A/ℤ}` (ALRS line 9471 to ALRS line 9506). The second statement follows by base change: `L_{(A/p^n)/(ℤ/p^n)} = L_{A/ℤ_p}` `⊗_{ℤ_p}` ℤ/p^n, whose limit is the p-completion `L_{A/ℤ_p}`, and A[1/p] = A `⊗_{ℤ_p}` ℚ_p.

*Needs:* EnhancedDerivedSheaves §E5:cotangent-export.1; EnhancedDerivedSheaves §E5:cotangent-export.2; EnhancedDerivedSheaves §E5:animation.1; DerivedModuleAlgebra §0.4; RefinedTraceMethods §1.7; RefinedTraceMethods §1.10; AnalyticStacks §§5.1–5.3.

**Checks.**

- `L_{ℚ_p⟨T⟩/ℚ_p}` = ℚ_p⟨T⟩·dT in degree 0 (ALRS Remark 2.6.6).
- For a †-rational localization A → `A⟨f/g⟩_{≤1}`, an idempotent map, the cotangent complex vanishes.
- `L_{C_p/ℚ_p}` ≅ gr¹B⁺_dR(C_p)[1] = C_p(1)[1] (ALRS line 3889), nonzero although C_p is perfectoid: perfectoid vanishing applies only between perfectoid rings.
- `L_{A/A}` = 0.
- For the solid ℤ_p-algebra ℤ_p[T] = `⊕_{n ≥ 0}` ℤ_p·T^n, which is not p-complete, base change gives `L_{ℤ_p[T]/ℤ_p}` = ℤ_p[T]·dT, a countable direct sum of copies of ℤ_p and not p-complete (its p-completion is ℤ_p⟨T⟩·dT): the p-completeness hypothesis on A cannot be dropped.
- For the animated ℤ_p-algebra A = ℤ_p `⊗^L_{ℤ_p[x]}` ℤ_p (x ↦ 0 on both factors), which is p-complete but not static (π_0 A = π_1 A = ℤ_p), base change gives `L_{A/ℤ_p}` = A `⊗_{ℤ_p}` `L_{ℤ_p/ℤ_p[x]}` = A[1], p-complete with homotopy ℤ_p in degrees 1 and 2, and both sides of the second statement are A[1/p][1]: the clause covers animated rings, where a filtration known only on commutative rings gives nothing.

### 4.6 Deformation theory of Gelfand stacks

For a map f: Y → X of presheaves on affinoid Gelfand stacks define: f is nilcomplete if Y(A) = lim_n `Y(τ_{≤n}A)` relative to X for strictly totally disconnected A; infinitesimally cohesive if for every square-zero extension Ã_d → A with derivation d: A → M[1], M connective, Y(Ã_d) ≅ Y(A) `×_{Y(A ⊕ M[1])}` Y(A) relative to X; f admits a cotangent complex if there is a locally eventually connective `L_{Y/X}` ∈ D^+(Y) such that for every η: GSpec(R) → Y with R a Gelfand ring and every connective M ∈ `D_{≥0}(R)` the fibre of Y(R ⊕ M) → Y(R) `×_{X(R)}` X(R ⊕ M) at the point given by η is `τ_{≥0}Hom_R(η^*L_{Y/X}, M)`, naturally in M; f is formally étale if `L_{Y/X}` = 0 and formally smooth if `L_{Y/X}` is the dual of a connective perfect complex; f admits a deformation theory if it has all three properties (ALRS Definition A.2.2, p. 177, ALRS line 9552). Prove that maps of affinoid Gelfand stacks admit a deformation theory (ALRS Example A.2.3, p. 178, ALRS line 9591), that de Rham stacks are nilcomplete, infinitesimally cohesive and have zero cotangent complex (ALRS Lemma A.2.4, p. 178, ALRS line 9595), and that for maps f: Z → Y and g: Y → X of presheaves on affinoid Gelfand stacks: if g is nilcomplete (resp. infinitesimally cohesive), then f is so if and only if g ∘ f is; if g admits a cotangent complex, then f admits one if and only if g ∘ f does, with the transitivity fibre sequence `f^*L_{Y/X} → L_{Z/X} → L_{Z/Y}`; and nilcompleteness, infinitesimal cohesiveness and the existence of a cotangent complex for g are preserved by base change along any X′ → X, the cotangent complex of Y ×_X X′ → X′ being the pullback of `L_{Y/X}` (ALRS Lemma A.2.5, p. 178, ALRS line 9601). Prove that every †-cohesive map of Gelfand stacks (4.4) is infinitesimally cohesive; this is immediate from ALRS Definition 2.7.7 (p. 29, ALRS line 1538) and ALRS Definition A.2.2(2) (p. 177, ALRS line 9560), and it supplies the infinitesimal cohesiveness that ALRS Proposition 2.8.15 (5.2) asks for where ALRS Remark 4.4.5 (p. 68, ALRS line 3552) and the proof of ALRS Proposition 4.5.3 (p. 70, ALRS line 3643) apply it to a †-cohesive map.

A proof route: For a square-zero extension Ã_d = A `×_{A ⊕ M[1]}` A with M connective, the zero section and the section (id, d) of the projection A ⊕ M[1] → A are isomorphisms on π_0, since M[1] is 1-connective; having the projection as a common retraction, they induce isomorphisms on †-reductions, which are static quotients of π_0 (1.2). So both are †-thickenings, and the cartesian square of 4.4 for this pair of maps to A ⊕ M[1] is the square defining infinitesimal cohesiveness.

*Needs:* §4.5; §4.4; §2.3; §3.1; §1.2; DerivedModuleAlgebra §0.5; DerivedModuleAlgebra §0.25.

The API has the following laws.

- For Z → Y → X with Y → X admitting a cotangent complex, Z → Y admits one if and only if Z → X does, with the fibre sequence `f^*L_{Y/X} → L_{Z/X} → L_{Z/Y}`.
- For GSpec(B) → GSpec(A), L is the solid cotangent complex `L_{B/A}` of 4.5.
- X^dR → GSpec(ℚ_p) admits a deformation theory with L = 0.
- If f is infinitesimally cohesive with cotangent complex, square-zero extensions of Y over X with ideal M are `τ_{≥0}Hom(L_{Y/X}, M[1])`.
- Every †-cohesive map of Gelfand stacks is infinitesimally cohesive; in particular so are maps of Berkovich spaces and de Rham stacks (4.4).

**Checks.**

- `L_{A¹}` = O·dT, so A¹ is formally smooth.
- For the zero section 0 → A¹, L = (T)/(T²)[1] = ℚ_p[1], whose dual ℚ_p[−1] is not connective; the map is not formally smooth, but it has perfect amplitude [−1, 0] (quasi-syntomic).
- `L_{(A¹)^dR}` = 0, consistent with (A¹)^dR = A¹/G_a^†: in the transitivity sequence of the G_a^†-torsor A¹ → (A¹)^dR, the term `L_{A¹}` = O·dT maps isomorphically onto the relative cotangent complex O, the dual of Lie(G_a^†) = ℚ_p.
- For A = M = ℚ_p the only derivation is d = 0, since `L_{ℚ_p/ℚ_p}` = 0, and ℚ_p `×_{ℚ_p ⊕ ℚ_p[1]}` ℚ_p has π_0 an extension of ℚ_p by π_1(ℚ_p ⊕ ℚ_p[1]) = ℚ_p and no other homotopy: it is ℚ_p[ε]/ε². Both maps ℚ_p → ℚ_p ⊕ ℚ_p[1] are π_0-isomorphisms, so a †-cohesive Y satisfies Y(ℚ_p[ε]/ε²) ≅ Y(ℚ_p) `×_{Y(ℚ_p ⊕ ℚ_p[1])}` Y(ℚ_p).
- The connectivity of M is what makes the two sections †-thickenings: for M = ℚ_p[−1], A ⊕ M[1] is ℚ_p ⊕ ℚ_p·ε with ε in degree 0, and the section ℚ_p → ℚ_p[ε]/ε² is not surjective, so †-cohesiveness says nothing there; infinitesimal cohesiveness only tests connective M.
- For d = 0 and f with a cotangent complex, the fibres over η: GSpec(A) → Y of the two sides of the square are `τ_{≥0}Hom_A(η^*L_f, M)` for Ã_0 = A ⊕ M and the loop space of `τ_{≥0}Hom_A(η^*L_f, M[1])` for Y(A) `×_{Y(A ⊕ M[1])}` Y(A); these agree, as the implication requires.

### 4.7 The †-quasi-pro-étale topology and descent of deformation theory

Call A → B a †-quasi-pro-étale map of Gelfand rings if Marc(B) → Marc(A) is quasi-pro-étale and GSpec(B) → GSpec(A) is †-formally étale, with covers the finite jointly surjective families (ALRS Definition A.2.17, p. 184, ALRS line 9917). Prove that †-rational localizations and Berkovich-étale maps are †-quasi-pro-étale (ALRS Remark A.2.18, p. 184, ALRS line 9921), that †-formally étale maps of Gelfand rings satisfy the following: for A → B †-formally étale, a map B → C is †-formally étale if and only if A → C is; base changes of †-formally étale maps are †-formally étale, and A → B is †-formally étale if its base change along a !-cover A → A′ is †-quasi-pro-étale; filtered colimits of †-formally étale maps are †-formally étale; A → B is †-formally étale if A → C is for some †-formally étale cover B → C; and a †-formally étale hypercover A → B^• gives a !-cover GSpec(B^•) → GSpec(A); that the same statements hold with †-quasi-pro-étale in place of †-formally étale; that every Gelfand ring has a †-quasi-pro-étale cover by a strictly totally disconnected Gelfand ring (ALRS Lemma A.2.19, p. 184, ALRS line 9939), and that over a strictly totally disconnected A every †-quasi-pro-étale A → B is a filtered colimit of finite étale A-algebras, hence flat (ALRS Lemma A.2.20, p. 186, ALRS line 10024). Let τ be a topology on Gelfand rings whose coverings are !-covers. Say that τ lifts along square-zero extensions if for every square-zero extension Ã → A every τ-covering of GSpec(A) lifts to a τ-covering of GSpec(Ã), and that τ is flat if every τ-covering of GSpec(A) with A strictly totally disconnected consists of maps GSpec(A_i) → GSpec(A) with A_i strictly totally disconnected and A → A_i flat for the solid tensor product (ALRS §A.2, p. 179, ALRS line 9641); τ-Gelfand stacks are the τ-sheaves on Gelfand rings (ALRS Definition A.2.6, p. 179, ALRS line 9653). For maps f: Z → Y and g: Y → X of τ-Gelfand stacks with f an epimorphism that is infinitesimally cohesive and formally smooth, prove: if τ is flat, every affinoid Gelfand stack has a τ-cover by a strictly totally disconnected one, and f and g ∘ f are nilcomplete, then g is nilcomplete; if τ lifts along square-zero extensions and g ∘ f is infinitesimally cohesive, then g is infinitesimally cohesive, and if g ∘ f moreover admits a cotangent complex, so does g (ALRS Proposition A.2.15, p. 182, ALRS line 9833). Prove that for f: Y → X and an epimorphism X′ → X of τ-Gelfand stacks, f is infinitesimally cohesive, resp. admits a cotangent complex, resp. (for flat τ) is nilcomplete, if its base change Y ×_X X′ → X′ is (ALRS Lemma A.2.11, p. 180, ALRS line 9732). Prove that if the covers by †-rational localizations are τ-coverings, as for the !-topology, every map of Berkovich spaces is infinitesimally cohesive and admits a cotangent complex, and so is every map f: Y → X of Gelfand stacks for which some epimorphism X′ → X from a Berkovich space has Y ×_X X′ a Berkovich space (ALRS Example A.2.12 and Example A.2.13, p. 181, ALRS line 9767 and ALRS line 9773).

A proof route: ALRS Lemma A.2.20: over strictly totally disconnected A, GSpec(B) = GSpec(A) `×_{M(A)^Betti}` M(B)^Betti and M(B) → M(A) is a countable limit of finite disjoint unions of clopens. For ALRS Proposition A.2.15 lift points along the epimorphism using formal smoothness, and identify the cotangent complex by the transitivity sequence. For maps of Berkovich spaces: both properties can be tested on a basis of τ (ALRS Lemma A.2.9 and Lemma A.2.10, p. 180, ALRS line 9694 and ALRS line 9722) and descend along epimorphisms of the target (ALRS Lemma A.2.11), so one may take X affinoid and, as basis over Y, the affinoids that factor through an affinoid †-rational subspace of Y, where ALRS Example A.2.3 (4.6) applies; the weakly representable case follows by ALRS Lemma A.2.11.

*Needs:* §4.6; §4.2; §2.6; §2.4; §1.6; MotivesAndAlgebraicCyclesPartII Layer 0.

The API has the following laws.

- †-quasi-pro-étale maps of Gelfand rings contain the †-rational localizations and the Berkovich-étale maps and are stable under base change and filtered colimits; for A → B †-quasi-pro-étale, a map B → C is †-quasi-pro-étale if and only if A → C is.
- Every Gelfand ring A has a †-quasi-pro-étale cover A → B with B strictly totally disconnected; over a strictly totally disconnected A every †-quasi-pro-étale A → B is a filtered colimit of finite étale A-algebras and is flat.
- For an epimorphism f: Z → Y of τ-Gelfand stacks that is infinitesimally cohesive and formally smooth and a map g: Y → X: if τ lifts along square-zero extensions, infinitesimal cohesiveness and the existence of a cotangent complex pass from g ∘ f to g; if τ is flat and every affinoid has a strictly totally disconnected τ-cover, nilcompleteness passes from f and g ∘ f to g.
- For f: Y → X and an epimorphism X′ → X of τ-Gelfand stacks, f is infinitesimally cohesive, resp. admits a cotangent complex, resp. for flat τ is nilcomplete, if its base change Y ×_X X′ → X′ is.
- If τ contains the covers by †-rational localizations, every map of Berkovich spaces is infinitesimally cohesive and admits a cotangent complex, and so is every map of Gelfand stacks that becomes a map of Berkovich spaces after base change along an epimorphism from a Berkovich space.

**Checks.**

- A †-rational localization is †-quasi-pro-étale but not finite étale.
- For A = C(S, C_p) with S light profinite and a clopen decomposition S = S_1 ⊔ S_2, A → C(S_1, C_p) is †-quasi-pro-étale and flat.
- Identities are †-quasi-pro-étale covers.
- The analytic projective line P¹ is glued from the overconvergent discs D = `GSpec(ℚ_p⟨pT⟩_{≤1})` = {|T| ≤ p} and D′ = {|1/T| ≤ p} along the overconvergent annulus `p^{−1}` ≤ |T| ≤ p, the †-rational localization of each disc at the locus where the other coordinate has absolute value at most p; the two discs form a strict closed cover, since the open subsets {|T| < p} and {|T| > `p^{−1}`} that they contain cover P¹, the Gauss point included. Its cotangent complex is the line bundle Ω¹ glued from O·dT and O·d(1/T) with transition `d(1/T) = −T^{−2} dT`, of degree −2; on each disc it is the solid cotangent complex of 4.5 of the overconvergent disc algebra, and the gluing is the content of the statement for a Berkovich space that is not affinoid. The two closed unit discs {|T| ≤ 1} and {|T| ≥ 1} do not form a cover of 2.6: every open neighbourhood of the Gauss point meets both |T| < 1 and |T| > 1, so it lies in neither disc.
- The point T = 0 of the closed unit disc, GSpec(ℚ_p) → GSpec(ℚ_p⟨T⟩), is a map of Berkovich spaces with cotangent complex (T)/(T²)[1] = ℚ_p[1]: it has a cotangent complex but is not formally smooth, so the statement gives existence of L and nothing more.
- For the inclusion of the closed disc of radius 1/p into the closed unit disc, a †-rational localization, the cotangent complex is 0 (4.5), so the map is formally étale.

### 4.8 Tangent complexes and classifying stacks

For an infinitesimally cohesive map f: Y → X with cotangent complex define its tangent complex T_f as the spectrum-valued functor (R, η, M) ↦ fib(Y(R ⊕ M) → Y(R) `×_{X(R)}` X(R ⊕ M)), the fibre taken at the point given by η and the trivial derivation, and for i ≥ 0 the shifted tangent complex T_f[i], the Gelfand stack over Y with T_f[i](η) = T_f(η, R, R[i]) = `τ_{≥0}Hom_R(η^*L_f, R[i])` for η: GSpec(R) → Y, the anima written `τ_{≥−i}Hom_R(η^*L_f, R)` in the source (ALRS Construction A.3.1, pp. 186–187, ALRS line 10041 and ALRS line 10064). Define its de Rham stack (T_f[i])^dR over Y by (T_f[i])^dR(η) = `τ_{≥0}Hom_A(η^*L_f, A^u[i])` on nilperfectoid η: GSpec(A) → Y, and the overconvergent shifted tangent complex (T_f[i])^† = fib(T_f[i] → (T_f[i])^dR), a Gelfand stack over Y with (T_f[i])^†(η) = `τ_{≥0}Hom_A(η^*L_f, Nil†(A)[i])` (ALRS Remark A.3.2, p. 187, ALRS line 10074); for a line bundle L on Y define T_f[i] ⊗ L, (T_f[i] ⊗ L)^dR and (T_f[i] ⊗ L)^† in the same way, with η^*L, η^*L ⊗_A A^u and η^*L ⊗_A Nil†(A) in place of R, A^u and Nil†(A). The twisted complex T^†_X[1](−1) of ALRS Remark 3.1.4 (p. 43, ALRS line 2230) is (T_g[1] ⊗ L)^† for the base change g: X × BG_m → BG_m of X → GSpec(ℚ_p) and L the line bundle of weight −1 pulled back from BG_m; the source takes the de Rham stack relative to X^dR, which has the same fibre. Call a map Y → X of arc-stacks weakly representable in arc-diamonds if there are perfectoid spaces X′ and Z, an arc-cover X′ → X and a surjective quasi-pro-étale map Z → Y ×_X X′ (ALRS Lemma A.3.4, p. 187, ALRS line 10104). Prove that for such a map Ŷ → X̂ is infinitesimally cohesive with zero cotangent complex (ALRS Lemma A.3.4, p. 187, ALRS line 10104); that for a group G → S admitting a deformation theory and formally smooth, with BG → S admitting a deformation theory, `L_{BG/S}` ≅ e^*L_f[−1] is the shifted adjoint representation on the cotangent complex at the unit (ALRS Proposition A.3.5, p. 188, ALRS line 10123); and that for a partially proper rigid analytic group G over a Banach field K, BG and BG^† (G^† the overconvergent neighbourhood of 1) admit a deformation theory over GSpec(K), with GSpec(K) → `BG^{dR/K}` and BG^† → BG epimorphisms for the †-quasi-pro-étale topology (ALRS Lemma A.3.6, p. 190, ALRS line 10234).

*Needs:* §4.6; §4.7; §2.8; §3.4; §3.1; §1.8; §1.2.

The API has the following laws.

- For i ≥ 0, η: GSpec(R) → Y and nilperfectoid η: GSpec(A) → Y, T_f[i](η) = `τ_{≥0}Hom_R(η^*L_f, R[i])`, (T_f[i])^dR(η) = `τ_{≥0}Hom_A(η^*L_f, A^u[i])` and (T_f[i])^†(η) = `τ_{≥0}Hom_A(η^*L_f, Nil†(A)[i])`; twisting by a line bundle L on Y replaces the coefficients by their tensor products with η^*L.
- (T_f[i])^† → T_f[i] → (T_f[i])^dR is a fibre sequence of spectrum objects in Gelfand stacks over Y, and likewise after twisting by a line bundle on Y.
- For a formally smooth group G → S with unit e such that G and BG admit a deformation theory over S, `L_{BG/S} ≅ e^*L_{G/S}[−1]`, with G acting through the adjoint action on the cotangent space at the unit.
- For a map Y → X of arc-stacks weakly representable in arc-diamonds, Ŷ → X̂ is infinitesimally cohesive with `L_{Ŷ/X̂}` = 0.

**Checks.**

- `L_{BG_m}` = O[−1], the dual of the one-dimensional adjoint representation shifted by −1.
- `L_{BG_a^†}` = O[−1], although G_a^† has trivial underlying arc-stack.
- For the trivial group, BG = S and `L_{BG/S}` = 0.
- For a perfectoid space Y over a perfectoid X, `L_{Ŷ/X̂}` = 0, whereas `L_{C_p/ℚ_p}` ≠ 0 since ℚ_p is not perfectoid (compare 4.5).
- For Y = A¹ over GSpec(ℚ_p), A = C_p[ε]/ε² and a point η: GSpec(A) → A¹, `η^*L_{A¹}` = A·dT, so `T_{A¹}[1](η)` = BA, `(T_{A¹}[1])^dR(η)` = BC_p and `(T_{A¹}[1])^†(η)` = B(C_p·ε) = BG_a^†(A); for Y = GSpec(ℚ_p) all three are a point. A fibre formed with the absolute de Rham stack of the total space of `T_{A¹}[1]` would also contain the fibre C_p·ε of A¹(A) → A¹(C_p), the †-neighbourhood of the base point.

### Examples

The closed point 0 → A¹ is a Zariski closed immersion with cotangent complex ℚ_p[1], quasi-syntomic but not formally smooth. The pushout of two closed discs along their origins is the node GSpec(ℚ_p⟨S, T⟩/(ST)). Berkovich spaces, de Rham stacks and Perf(−) are †-cohesive. `L_{BG_m}` = O[−1].

### Dependencies

Layers 1–3; AnalyticStacks §§5.1–5.3; DerivedModuleAlgebra §0.4, §0.5, §0.25; EnhancedDerivedSheaves §E5:cotangent-export.1, §E5:cotangent-export.2, §E5:animation.1; RefinedTraceMethods §1.7, §1.10; MotivesAndAlgebraicCyclesPartII Layer 0; AdicEtaleGeometry §A2.4; AdicSpacesPartII §R0.16.

## Layer 5: The cone construction and the filtered de Rham stack

This layer introduces the cone of a Gelfand stack over A¹/G_m, a Gelfand incarnation of the deformation to the normal bundle, with its overconvergent, formal and special fibres; identifies its special fibre with the shifted twisted tangent bundle and, relative to a Cartier divisor, with the obstruction to lifting to the first infinitesimal neighbourhood; computes sheaves on formal cones of formally smooth maps as modules over the de Rham complex; and relates the filtered de Rham stack to the cone and to degree-one divisors on thickened affine lines, the toy model of the twistor stack.

### 5.1 Cones, overconvergent and formal cones, special fibres

For a Gelfand stack Y define its cone Y^cone → A¹/G_m as the functor sending a Gelfand stack Z with a Cartier divisor D ⊆ Z to Y(D), its overconvergent cone `Y^{†-cone}` = Y^cone `×_{A¹/G_m}` `A^{1,†}/G_m`, its formal cone `Y^{cone^}` = Y^cone `×_{A¹/G_m}` Â¹/G_m and its special fibre Y^cone_s = Y^cone `×_{A¹/G_m}` BG_m; for f: Y → X define the relative cone `Y^{cone/X}` = Y^cone `×_{X^cone}` (X × A¹/G_m) (ALRS Definition 2.8.1, p. 30, ALRS line 1598). Prove that Y^cone is a Gelfand stack (ALRS Lemma 2.8.2, p. 30, ALRS line 1609), that it is g_* f^* for f: BG_m → GSpec(ℚ_p) and g: BG_m → A¹/G_m and so commutes with limits (ALRS Remark 2.8.4, p. 30, ALRS line 1621), that there is a natural map Y^cone_s → Y × BG_m induced by R ⊕ I[1] → R (ALRS Remark 2.8.3, p. 30, ALRS line 1618), that `Y^{cone/X}` `×_{A¹/G_m}` G_m/G_m ≅ X and, when f admits a cotangent complex, `Y^{cone/X}_s ≅ T_{Y/X}[1](−1)` over Y × BG_m, with G_m acting through t ↦ `t^{-1}` (ALRS Lemma 2.8.6, p. 31, ALRS line 1653), and that for †-formally étale Y → X the squares relating `Y^{†-cone}`, `X^{†-cone}`, their de Rham stacks and Y^dR, X^dR are cartesian, likewise for formal cones (ALRS Lemma 2.8.7, p. 31, ALRS line 1677). For a Cartier divisor D → W and Y → D define the relative cone `Y^{cone/(D,W)}` = Y^cone `×_{D^cone}` W along the natural map W → D^cone (ALRS Definition 2.8.9, p. 32, ALRS line 1700). For an analytic stack X (in particular X^An for a Gelfand stack X, 2.1) define the algebraic cone `X^{cone-alg} → A^{1,alg}/G_m^alg` as the sheafification of the functor sending an affinoid analytic stack AnSpec(A) with a Cartier divisor I → A to X(A/I), its algebraic formal cone `X^{cone-alg^}` over Â¹/G_m^alg and their relative versions (ALRS Remark 2.9.7(1), p. 39, ALRS line 2062). Prove that for a !-Zariski closed map f: Z → X of Gelfand stacks (f Toën-affine and O_X → f_*O_Z !-locally a surjection of connective rings) the algebraic formal cone `Z^{cone-alg^/X}` → X × Â¹/G_m^alg is the relative spectrum of the adic filtration of O_X → f_*O_Z, defined by descent from the affinoid case of AnalyticStacks §6.5(3)–(4) (ALRS Remark 2.9.7(2), p. 39, ALRS line 2086).

A proof route: Well-definedness: !-equivalences are stable under base change, so the divisor Z(S) → GSpec(R/I) of a !-equivalence S → GSpec(R) over A¹/G_m is a !-equivalence. Over G_m/G_m the divisor is empty and Y(∅) is a point; over BG_m the divisor is the trivial square-zero extension R ⊕ I[1] and Y(R ⊕ I[1]) relative to Y(R) is `τ_{≥0}Hom(η^*L_{Y/X}, I[1])`.

*Needs:* §3.6; §4.6; §4.8; §4.1; §2.1; SchemeAndStackFoundations §5.5; AnalyticStacks §6.5.

The API has the following laws.

- Y ↦ Y^cone commutes with all limits of Gelfand stacks.
- The restriction of `Y^{cone/X}` to G_m/G_m is X.
- If f admits a cotangent complex, `Y^{cone/X}_s ≅ T_{Y/X}[1]` `⊗_{G_a}` G_a(−1) over Y × BG_m.
- The natural map W → D^cone over A¹/G_m sends Z → W to Z ×_W D → D; relative cones over (D, W) are functorial in Y → D.
- For a Zariski closed immersion Z → X of Berkovich spaces, `Z^{cone/X}` is the analytification of the deformation to the normal bundle (SchemeAndStackFoundations §5.5, adic filtration of O_X → O_Z).

**Checks.**

- GSpec(ℚ_p)^cone = A¹/G_m and ∅^cone = G_m/G_m, since Y(R/I) = Y(0) is a point when I = R and empty otherwise for Y = ∅.
- G_a^cone = `G_{a,A¹/G_m}/G_a(−1)`, where G_a(−1) is the geometric vector bundle of the ideal I → R (ALRS Example 2.8.5(1)).
- For Y = A¹ over GSpec(ℚ_p), the special fibre is `T_{A¹}[1](−1)` = BG_a(−1) over A¹ × BG_m.
- The weight convention is t ↦ `t^{-1}` on the tangent direction: with weight +1 the special fibre of A¹ would be BG_a(1), which is not the classifying stack of the ideal sheaf I of the universal divisor (3.6).
- For the zero section Z = GSpec(ℚ_p) → X = GSpec(ℚ_p⟨x⟩) the adic filtration is (x^n)_n with associated graded Sym(I/I²) = ℚ_p[x̄], so the special fibre of the algebraic formal cone is the line Spec ℚ_p[x̄], the normal bundle `T_{Z/X}[1]` of the special-fibre law of this section; for the identity of X the ideal is 0, so the adic filtration is O_X in degrees ≤ 0 and 0 in degrees ≥ 1, with associated graded O_X in degree 0 and Rees algebra O_X[t] (a constant filtration would have associated graded 0), and the cone is X × Â¹/G_m^alg, so a construction that always returned the normal line of a point is excluded.

### 5.2 Square-zero lifts and the special fibre of the relative cone

For Y → X with cotangent complex and locally eventually connective M define the anima of square-zero extensions Sqz(Y/X; M) = `τ_{≥0}Hom_Y(L_{Y/X}, M[1])` and, for f: Y → X and X → S with cotangent complexes, M ∈ D^+(X) and η ∈ π_0Sqz(X/S; M), the anima of square-zero lifts Sqz(Y/S; η), the fibre of `τ_{≥0}Hom_Y(L_{Y/S}, f^*M[1]) → τ_{≥0}Hom_Y(f^*L_{X/S}, f^*M[1])` at f^*η (ALRS Definition 2.8.11, p. 32, ALRS line 1712); the divisor BG_m → A¹/G_m carries the square-zero extension ℚ_p[t]/t², so every Cartier divisor D → W has its first infinitesimal neighbourhood D(1) (ALRS Example 2.8.12, p. 32, ALRS line 1724). For Berkovich spaces construct the underlying square-zero thickening of η, compatible with base change and †-formally étale maps (ALRS Lemma 2.8.13, p. 33, ALRS line 1762; ALRS Lemma 2.8.14, p. 33, ALRS line 1777). Prove: for a Cartier divisor D → W over S and Y → D, `Y^{cone/(D,W)}` → W is an isomorphism off D; if Y → D → W → S are infinitesimally cohesive with cotangent complexes, `Y^{cone/(D,W)}_s` = D `×_{T_{D/S}[1](−1)}` `T_{Y/S}[1](−1)` along the map classifying `L_{D/S} → L_{D/W}`; `Y^{cone/(D,W)}_s` → Y is a principal homogeneous space for `T_{Y/D}[1]` ⊗ N*`_{D/W}`, whose sections over †-formally étale U → Y are the square-zero lifts of U from D to D(1) (ALRS Proposition 2.8.15, p. 34, ALRS line 1805).

A proof route: Part (1) is ALRS Lemma 2.8.6(1) since W ∖ D = W `×_{A¹/G_m}` G_m/G_m. Part (2) follows from the definitions and the description of D → D(1) → W; the torsor structure comes from the fibre sequence `T_{Y/D}[1](−1) → T_{Y/S}[1](−1) → f^*T_{D/S}[1](−1)`; sections over †-étale U use ALRS Lemma 2.8.7.

*Needs:* §5.1; §4.6; §4.8; DerivedModuleAlgebra §0.25.

The API has the following laws.

- For affinoid GSpec(B) → GSpec(A) and connective M, Sqz(GSpec(B)/GSpec(A); M) is the anima of square-zero extensions B̃ = B `×_{B ⊕ M[1]}` B → B of A-algebras with ideal M.
- Sqz(Y/S; η) is nonempty if and only if the image of f^*η in `π_0Hom_Y(L_{Y/X}, f^*M[2])` vanishes, and it is then a torsor under Sqz(Y/X; f^*M), by the transitivity sequence of 4.6.
- For a Cartier divisor D → W and Y → D, `Y^{cone/(D,W)}` → W is an isomorphism over W ∖ D = W `×_{A¹/G_m}` G_m/G_m.
- For Y → D → W → S infinitesimally cohesive with cotangent complexes, `Y^{cone/(D,W)}_s` → Y is a principal homogeneous space for `T_{Y/D}[1]` ⊗ N*`_{D/W}`, and its sections over a †-formally étale U → Y are the square-zero lifts of U over S from D to D(1).

**Checks.**

- For X = GSpec(ℚ_p), M = ℚ_p, Sqz(X/X; ℚ_p) is a point (L = 0) and the unique extension is ℚ_p[ε]/ε².
- For the trivial divisor D × 0 → D × A¹, sections of the special fibre of `X^{cone/D}` always exist (the trivial deformation to D × GSpec(ℚ_p[t]/t²)), whereas for the divisor GSpec(C_p) → Spf B⁺_dR sections correspond to lifts to B⁺_dR/ξ², which need not exist (ALRS Remark 2.8.16).
- For Y = D the principal homogeneous space is trivial since `T_{D/D}` = 0, and its canonical section corresponds to D(1) itself.

### 5.3 Sheaves on formal cones and the de Rham complex

Use the realization of algebraic stacks as analytic stacks, under which sheaves on BG_m^alg, `A^{1,alg}/G_m^alg` and Â¹/G_m^alg over an analytic stack are graded, filtered and complete filtered modules, and Â¹/G_m^alg = BG_a[−1]/G_m^alg with the Beilinson t-structure (ALRS Remark 2.9.1, p. 35, ALRS line 1866; ALRS Remark 2.9.2, p. 36, ALRS line 1900). Prove that for a formally smooth map f: Y → X of Berkovich spaces with `Ω¹_{Y/X} = L_{Y/X}` a vector bundle, the map h: `Y^{cone^/X}` → |Y|^Betti × Â¹/G_m^alg is prim, so `Mod_{h_*1}(D(|Y|^Betti × Â¹/G_m^alg)) → D(Y^{cone^/X})` is fully faithful; that the underlying graded algebra of h_*1 is ⊕_i `Ω^i_{Y/X}[−i](i)` with `Ω^i_{Y/X}` = ∧^i `Ω¹_{Y/X}`; and that if f factors through a formally étale Y → A^n_X then, after shearing, h_*1 ≅ `(Ω^•_{A^n/ℚ_p}, d)` ⊗ O_Y (ALRS Proposition 2.9.3, p. 36, ALRS line 1914). Prove that for a smooth rigid space X over a Banach field K which is a Berkovich space, h_*1 lies in the heart of the Beilinson t-structure and is, after shearing, the de Rham complex `(Ω^•_{X/K}, d)` with its structure of commutative differential graded algebra, so that filtered flat connections with Griffiths transversality embed fully faithfully into `D(X^{cone^/K})` (ALRS Corollary 2.9.4, p. 38, ALRS line 2010; ALRS Example 2.9.5, p. 38, ALRS line 2021). Prove the relative version over a Cartier divisor D ⊆ W with W complete along D and a lift X̃ → W of a formally smooth X → D: `X^{cone^/(D,W)}` → |X|^Betti × W is prim, and for X̃ formally étale over A^n_W and D static, h_*1 is the D-de Rham complex O → Ω¹(D) → Ω²(2D) → ⋯ (ALRS Proposition 2.9.9, p. 40, ALRS line 2119).

A proof route: Primness is checked on special fibres, factoring `Y/(T_{Y/X} ⋊ G_m)` → Y/G_m → |Y|^Betti/G_m → |Y|^Betti/G_m^alg: the first is prim by Cartier duality for analytic vector bundles (RC26a Proposition 3.2.27 and Theorem 3.2.37, AnalyticStacks §7.5(4) and §7.6), the second by 2.7, the third because 1 is a direct summand of g_♯1 for GSpec(ℚ_p) → BG_m, using D(BG_m) ≅ modules over the algebra of sequences of RJRC Proposition 4.4.8. The graded algebra is computed by Cartier duality; the differential is identified on the closed polydisc and propagated by the universal property of the de Rham complex.

*Needs:* §5.1; §2.7; §4.8; AnalyticStacks §§0.8–0.11; AnalyticStacks §7.2, §7.5; AnalyticStacks §7.6; AnalyticStacks §7.7; AnalyticStacks §1.6, §3.8; AnalyticStacks §1.7, §3.8.

**Checks.**

- For X = Y = GSpec(K), h_*1 = K in degree 0 and weight 0.
- For the open disc over ℚ_p, h_*1 is O → Ω¹ with Fil¹ = Ω¹[−1] and gr¹ = Ω¹[−1](1).
- Before shearing, h_*1 is the Hodge complex ⊕ Ω^i[−i](i) with zero differential as a graded algebra; the de Rham differential is extra structure visible only through the cdga structure, so identifying h_*1 with the graded algebra alone loses the connection.

### 5.4 The filtered de Rham stack and degree-one divisors on thickened affine lines

For a Gelfand stack X define the filtered de Rham stack `X^{dR,+}` → A¹/G_m as the sheafification of (I → R) ↦ X(R/(I ⊗_R Nil†(R))), with relative versions `Y^{dR,+/X}` and `X^{dR,+/(D,W)}` (ALRS Definition 3.1.1, p. 42, ALRS line 2195). Prove that for a †-cohesive map Y → X the square relating `Y^{dR,+/X}`, `Y^{cone/X}`, (Y × A¹/G_m)^dR and `(Y^{cone/X})^dR` is cartesian (ALRS Proposition 3.1.3, p. 42, ALRS line 2221), that over G_m/G_m the filtered de Rham stack is X^dR and, for X with a cotangent complex, over BG_m it is the Hodge stack (T_X[1](−1))^† of 4.8, formed for X × BG_m → BG_m and the line bundle of weight −1, which for X with tangent bundle T_X is the classifying stack of T^†_X(−1) over X × BG_m (ALRS Remark 3.1.4, p. 43, ALRS line 2230). For a nilperfectoid A let Ã¹_A = `A¹_{A^u}` `⊔_{GSpec A^u}` GSpec(A), a degree-one divisor on Ã¹_A being a Cartier divisor whose pullback to `A¹_{A^u}` is a section; let `Div¹_{A¹}` be the Gelfand stack sending a nilperfectoid A to the anima of degree-one divisors on Ã¹_A, and `X^{Div¹_{A¹}} → Div¹_{A¹}` the sheafification of (A, D) ↦ X(D) (ALRS Definition 3.1.5, p. 43, ALRS line 2240). Prove the cartesian square (3.1.1) and `Div¹_{A¹}` ≅ A¹/G_m^†, and, for †-cohesive X, `X^{Div¹_{A¹}} = X^{dR,+}` `×_{A¹/G_m}` A¹/G_m^† (ALRS §3.1, p. 43, ALRS line 2255).

A proof route: R/(I ⊗ Nil†R) is the pullback of R/I and `R^{†-red}` over `R^{†-red}/(R^{†-red} ⊗ I)`, a pullback along a †-thickening and a surjection, so †-cohesiveness gives the square; a degree-one divisor D on Ã¹_A has D = GSpec(A/(I ⊗_A Nil†(A))).

*Needs:* §5.1; §4.4; §4.3; §3.1; §4.8.

The API has the following laws.

- The restriction of `X^{dR,+}` to G_m/G_m is X^dR, and for X with a cotangent complex its restriction to BG_m is the Hodge stack (T_X[1](−1))^†.
- For a †-cohesive map Y → X, `Y^{dR,+/X} = Y^{cone/X}` `×_{(Y^{cone/X})^dR}` (Y × A¹/G_m)^dR.
- `Div¹_{A¹}` ≅ A¹/G_m^†, and for †-cohesive X, `X^{Div¹_{A¹}} = X^{dR,+}` `×_{A¹/G_m}` A¹/G_m^†.

**Checks.**

- `GSpec(ℚ_p)^{dR,+}` = A¹/G_m, since the point takes value a point on every ring.
- Over G_m/G_m, `(A¹)^{dR,+}` restricts to (A¹)^dR = A¹/G_a^†.
- Let θ be the operator through which the Lie algebra of G_m acts on an equivariant sheaf E on A¹, so that θ(f·e) = T∂_T(f)·e + f·θ(e). For Ĝ_m, the formal completion of G_m at 1, a quasi-coherent sheaf on A¹/Ĝ_m is any such pair (E, θ); pullback D(A¹/G_m^†) → D(A¹/Ĝ_m) is fully faithful, with image the pairs on which the action of the polynomials in θ extends to the entire functions of θ (ALRS Remark 3.1.6, p. 43, ALRS line 2263). For a vector bundle E the extension is automatic: over the disc |T| ≤ r, E is a finite projective ℚ_p⟨T/r⟩-module, a Banach module on which θ is bounded (T∂_T multiplies T^n by n, of norm at most 1), so Σ_n c_nθ^n converges whenever |c_n|ρ^n → 0 for every ρ > 0. Hence a vector bundle on A¹/G_m^† is a vector bundle on A¹ with such a θ, equivalently with the connection `T^{-1}θ` having at most a simple pole at T = 0; the two stacks have the same vector bundles, and a description that separates them by vector bundles is wrong. They differ on larger sheaves: on the skyscraper at T = 0 with fibre ℚ_p[θ], T acting by 0 and T∂_T by multiplication by θ, the entire series Σ_n `p^{n²}θ^n` does not act, its partial sums applied to 1 having unbounded degree and so no limit in ℚ_p[θ].
- Without †-cohesiveness the square of ALRS Proposition 3.1.3 need not be cartesian; the proof uses exactly the cohesive square for the †-thickening R/I → `R^{†-red}/(R^{†-red} ⊗ I)`.

### Examples

The cone of GSpec(ℚ_p) is A¹/G_m; the cone of the empty stack is G_m/G_m. The cone of G_a is the quotient `G_{a,A¹/G_m}/G_a(−1)`. For a smooth rigid X over a Banach field the pushforward of O from the formal cone is the de Rham complex with its Hodge filtration. `Div¹_{A¹}` ≅ A¹/G_m^†.

### Dependencies

Layers 2–4; AnalyticStacks §§0.8–0.11, §1.6, §1.7, §3.8, §6.5, §7.2, §7.5, §7.6, §7.7 (the last being RJRC Proposition 4.4.8); SchemeAndStackFoundations §5.5; DerivedModuleAlgebra §0.25.

## Layer 6: Fargues–Fontaine discs and curves, Hyodo–Kato stacks

This layer realizes the relative punctured Fargues–Fontaine disc and the curve of a perfectoid space, and then of any arc-stack over 𝔽_p, as Gelfand stacks; fixes the radius normalization; defines Hyodo–Kato stacks as de Rham stacks of Fargues–Fontaine curves with their cohomological properties; and transports to the light Gelfand formalism the cohomological smoothness of relative Fargues–Fontaine curves and the dualizing complex of the curve over Marc(ℚ_p).

### 6.1 Fargues–Fontaine discs as Berkovich spaces and the radius map

For an affinoid perfectoid space S = Spa(A) of characteristic p, qfd and separable, with pseudo-uniformizer ϖ, define the relative punctured Fargues–Fontaine disc `D^×_{FF,S}` = Spa(A_inf(A)) ∖ V(p[ϖ]) as the Berkovich space ⋃ `GSpec(B^†_{[r,s]}(S))`, the union over the closed intervals [r, s] ⊂ (0, ∞) with rational ends, where A_inf(A) = W(A°), `B_{[r,s]}(S)` is the ring of the rational subset {|p|^s ≤ |[ϖ]| ≤ |p|^r} of Spa(A_inf(A)) and `B^†_{[r,s]}(S)` is the colimit of the `B_{[r′,s′]}(S)` over 0 < r′ < r ≤ s < s′ (ALRS §3.2, p. 44, ALRS line 2295; ABLB line 2605–2610; ABLB Corollary 4.4.10(1), p. 50, ABLB line 2641). For r > 0 this rational subset lies in Spa(A_inf(A)) ∖ V(p[ϖ]): [ϖ] vanishes nowhere on it, being the denominator of the condition |p|^s ≤ |[ϖ]|, and |[ϖ]| ≤ |p|^r then forces |p| ≠ 0. So p and [ϖ] are units of `B_{[r,s]}(S)`, a Banach ℚ_p-algebra, and `B^†_{[r,s]}(S)` is a separable qfd Gelfand ring (1.4; ALRS footnote 19, ALRS line 2333); for r = 0 neither holds (fifth Check). Construct its Frobenius φ_S and the radius map κ_ϖ: `D^×_{FF,S}` → (0, ∞)^Betti with κ_ϖ(x) = log|[ϖ]|_x / log|p|_x, so that κ_ϖ ∘ φ = p·κ_ϖ, the point x lying over [r, s] exactly when |p|^s ≤ |[ϖ]| ≤ |p|^r at x; on the adic disc Spa(A_inf(A)) ∖ V(p[ϖ]), κ_ϖ tends to 0 towards the locus p = 0 and to ∞ towards the locus [ϖ] = 0, neither of which lies in `D^×_{FF,S}`; for S = T♭ with T perfectoid over ℚ_p fix the canonical radius κ by taking ϖ = p♭, which does not depend on the choice (ALRS Remark 3.2.1, p. 44, ALRS line 2322). Prove `D^{×,⋄}_{FF,S}` = S `×_{Marc(𝔽_p)}` Marc(ℚ_p) (2.8), that the construction globalizes to perfectoid spaces over 𝔽_p preserving Tate-analytic covers, and that every map of Gelfand stacks X → `D^×_{FF,Y}` from a perfectoid space X over ℚ_p extends uniquely to a φ-equivariant map `D^×_{FF,X♭} → D^×_{FF,Y}` through the untilt (ALRS Lemma 3.2.2, p. 45, ALRS line 2336).

A proof route: The punctured disc is glued from the overconvergent rational localizations of Spa(A_inf); its perfectoidization is computed on the classical adic space (RelativeFarguesFontaine §2.2, the diamond formula). ALRS Lemma 3.2.2 follows from `D^{×,⋄}_{FF,Y}` = Y × Marc(ℚ_p) and X̂^⋄ = X for perfectoid X.

*Needs:* RelativeFarguesFontaine §2.2; Mathlib `WittVector`; §2.6; §2.8; §1.4; §1.6; PerfectoidSpaces §P1.16; PerfectoidSpaces §P1.27; RelativeFarguesFontaine §1.2; VectorBundlesAndIsocrystals Layer 0; FarguesFontaineDiamonds §F2; Tau Ceti `TauCeti.FarguesFontaine.spaY`; Tau Ceti `TauCeti.FarguesFontaine.isRadiusLowerBound_comap_frobenius_iff`.

The API has the following laws.

- κ_ϖ(φ(x)) = p·κ_ϖ(x), and replacing ϖ by ϖ^m multiplies κ_ϖ by m.
- `D^{×,⋄}_{FF,S}` = S `×_{Marc(𝔽_p)}` Marc(ℚ_p), compatibly with φ = φ_S × id.
- On analytic adic spaces, `D^×_{FF,S}` agrees with the period domain Y_S of VectorBundlesAndIsocrystals Layer 0 (“Relative period domain and analytic quotient”) and RelativeFarguesFontaine §1.2, and κ_ϖ with the radius rad_ϖ = log|[ϖ]|/log|p| of RelativeFarguesFontaine §1.2 for E = ℚ_p; for S = Spa(A) and R = A°, the points of the classical adic space underlying `D^×_{FF,S}` form Tau Ceti's 𝒴 ⊂ Spa(W(R), W(R)) with its Frobenius homeomorphism, and Tau Ceti's radius bounds and their Frobenius law are the conditions q ≤ κ_ϖ, κ_ϖ ≤ q and the identity κ_ϖ ∘ φ = p·κ_ϖ (supplier contracts, From Tau Ceti).
- Maps X → `D^×_{FF,Y}` from a perfectoid X over ℚ_p factor uniquely as X → `D^×_{FF,X♭} → D^×_{FF,Y}` with the second map φ-equivariant (the analytic analogue of W(R) → A factoring through W(A)).

**Checks.**

- At the point of `D^×_{FF,C♭}` given by the untilt C, |[p♭]| = |p| = `p^{-1}`, so κ = 1 for the canonical radius; its Frobenius translates have radius p^n for n ∈ ℤ.
- The reciprocal convention log|p|/log|[ϖ]| would send Frobenius to multiplication by `p^{-1}` and would tend to 0 towards the locus [ϖ] = 0 instead of p = 0, contradicting κ ∘ φ = p·κ.
- For S = Spa(C♭), `D^×_{FF,S}` is the punctured open disc `Y_{(0,∞)}` of C♭.
- For S = ∅ the disc is empty.
- The interval [0, s] is excluded: for S = Spa(C♭) the ring of the rational subset {|p|^s ≤ |[ϖ]| ≠ 0} of Spa(A_inf(C♭)) maps onto C♭ by p ↦ 0, [ϖ] ↦ ϖ, since the point p = 0 satisfies |p|^s = 0 ≤ |[ϖ]|; so p is not a unit in it, it is not a ℚ_p-algebra and not a Gelfand ring, and the disc Spa(A_inf(C♭)) ∖ V([ϖ]), which contains the locus p = 0, is not a Gelfand stack.

### 6.2 Relative Fargues–Fontaine discs and curves of arc-stacks

Prove that Marc(A) ↦ `D^×_{FF,A}` takes the geometric realization of an arc-hypercover of separable totally disconnected perfectoid rings over 𝔽_p to a !-equivalence (ABLB Corollary 4.4.10, p. 50, ABLB line 2641), and deduce the left exact colimit-preserving relative punctured Fargues–Fontaine disc `D^×_{FF,−}`: ArcStk → GelfStk (ALRS (3.2.1), p. 45, ALRS line 2352). For an arc-stack X over 𝔽_p define the relative Fargues–Fontaine curve FF_X = `D^×_{FF,X}/φ^ℤ`, a Gelfand stack (ALRS Definition 3.2.6, p. 45, ALRS line 2390). Prove that the natural map (FF^⋄_X)^∧ → FF_X is not an isomorphism unless X = ∅: for a perfectoid X it is the map from the quotient of the uniformly completed cyclotomic base change by `ℤ_p^{×,cont}` to the quotient of the uncompleted one by `ℤ_p^{×,sm}` (ALRS Remark 3.2.4, p. 45, ALRS line 2357), and that `FF_{Marc(ℚ_p)} ≅ FF_{ℚ_p^cyc}/Γ^cont` with Γ = Gal(ℚ_p^cyc/ℚ_p) (ALRS Example 3.2.7, p. 46, ALRS line 2394). The quasi-coherent theory of (3.2.1) is a light variant of the solid formalism `D_{(0,∞)}` of ALBM (ALRS Remark 3.2.5, p. 45, ALRS line 2385).

*Needs:* §6.1; §2.4; §3.4; RelativeFarguesFontaine §2.1; VectorBundlesAndIsocrystals Layer 0.

The API has the following laws.

- `D^×_{FF,−}` preserves colimits and finite limits; FF_− preserves colimits.
- For a perfectoid S over 𝔽_p, FF_S is the Gelfand stack of the relative curve X_S = Y_S/φ^ℤ of VectorBundlesAndIsocrystals Layer 0 and RelativeFarguesFontaine §2.1.
- `FF_{Marc(ℚ_p)} ≅ FF_{ℚ_p^cyc}/Γ^cont`, with Γ^cont = GSpec(C(Γ, ℚ_p)).

**Checks.**

- For X = Marc(C♭), FF_X is the Fargues–Fontaine curve of C♭.
- For X = Marc(ℚ_p^cyc,♭) the map (FF^⋄_X)^∧ → FF_X is the map from a quotient by `ℤ_p^{×,cont}` to a quotient by `ℤ_p^{×,sm}`, not an isomorphism.
- For X = ∅ both sides are empty and the map is an isomorphism.

### 6.3 Hyodo–Kato stacks

For an arc-stack X over 𝔽_p define the open punctured curve Y^⋄_X = X `×_{Marc(𝔽_p)}` Marc(ℚ_p), its de Rham stack Y^dR_X = (Y^⋄_X)^dR, the curve FF^⋄_X = Y^⋄_X/φ^ℤ and the Hyodo–Kato stack X^HK = (FF^⋄_X)^dR; for a Gelfand stack X put X^HK = (X^⋄)^HK (ABLB Definition 6.1.1, p. 94, ABLB line 4983; ABLB Definition 6.1.2, p. 94, ABLB line 4989). Let O(n) on Marc(𝔽_p)^HK ≅ GSpec(ℚ_p)/φ^ℤ be the line bundle of the isocrystal `(ℚ_p, p^{-n}φ)` (ABLB Definition 6.2.4, p. 99, ABLB line 5247). Prove: for a map f: Y → X of qfd arc-stacks over ℤ_p (2.8) which is arc-locally lqfd, f^HK is !-able and cohomologically proper when f is proper; if f is smooth of pure relative dimension d, f^HK is cohomologically smooth with dualizing complex `(O(1)[2])^{⊗d}`, the d-th power of the Tate twist, and cohomologically étale when f is étale; similarly for `f^{Y^dR}` (ABLB Theorem 6.3.1, p. 102, ABLB line 5415); for proper smooth f between Berkovich spaces over ℚ_p, f^HK_* preserves perfect modules (ABLB Corollary 6.3.2, p. 103, ABLB line 5470). Prove that f^HK_*O = O ⊕ O(−1)[−1] for G_m → Marc(𝔽_p) (ABLB Lemma 6.2.5, p. 99, ABLB line 5250) and that Hyodo–Kato stacks carry a strong theory of first Chern classes in the sense of Zav Definition 5.2.8 (ABLB Lemma 6.2.9, p. 100, ABLB line 5303).

A proof route: !-ability and properness reduce to 3.3(1). Smoothness reduces, arc-locally on X (3.2) and analytically on Y (3.3(2)), to G_m over Marc(ℤ_p^cyc): the perfected multiplicative group is suave by the perfectoid disc case 3.3(3), the quotient by ℤ_p^sm is suave, and 1 → g_*1 is an equivalence by excision along Marc(ℚ_p^cyc) ⊂ Marc(ℤ_p^cyc) ⊃ Marc(𝔽_p). The dualizing complex follows from the strong theory of first Chern classes and Zav Theorem 5.7.7.

*Needs:* §2.8; §3.2; §3.3; §6.2; VectorBundlesAndIsocrystals Layer 1; AnalyticStacks §§0.8–0.11.

The API has the following laws.

- Marc(𝔽_p)^HK = GSpec(ℚ_p)/φ^ℤ, its vector bundles are the isocrystals over ℚ_p, and O(n) is the isocrystal `(ℚ_p, p^{-n}φ)`.
- For a map f of qfd arc-stacks over ℤ_p that is arc-locally lqfd, f^HK is !-able; it is cohomologically proper for proper f, cohomologically étale for étale f, and for smooth f of pure relative dimension d cohomologically smooth with dualizing complex O(d)[2d] = `(O(1)[2])^{⊗d}`.
- For a proper smooth map f of Berkovich spaces over ℚ_p, f^HK_* sends perfect modules to perfect modules.
- For G_m → Marc(𝔽_p), f^HK_*O = O ⊕ O(−1)[−1], and Hyodo–Kato stacks carry a strong theory of first Chern classes in the sense of Zav Definition 5.2.8.

**Checks.**

- Marc(𝔽_p)^HK = GSpec(ℚ_p)/φ^ℤ and its vector bundles are isocrystals over ℚ_p; O(1) is `(ℚ_p, p^{-1}φ)`, of slope −1.
- For G_m, H¹ = O(−1), the isocrystal (ℚ_p, pφ): Frobenius acts on dlog T by p, matching the convention φ(dlog t) = p·dlog t.
- For P¹ → Marc(𝔽_p), f^HK_*O = O ⊕ O(−1)[−2] and ω = O(1)[2], so the trace pairs H²(P¹) = O(−1) with O(1) to give O.
- With ω = O(−1)[2] the trace H²(P¹) ⊗ ω would land in O(−2) ≠ O, so the dualizing twist has slope −1 isocrystal O(1), not O(−1).

### 6.4 Cohomological smoothness of relative Fargues–Fontaine curves in the light Gelfand formalism

Transport to the light Gelfand formalism, through the comparison of !-functors of ABLB §4.4 (ALRS footnote 57, p. 164, ALRS line 8910), the following statements. (1) For a smooth morphism g: Y → X of analytic adic spaces over ℚ_p, `FF_{Y^⋄} → FF_{X^⋄}` is cohomologically smooth (ALBM Theorem 4.4.4, p. 36, ALBM line 1580); if g is equidimensional of dimension d, its dualizing complex is the Tate twist O ⊗ ℚ_p(d) placed in cohomological degree −2d (ALBM Theorem 4.4.6, p. 38, ALBM line 1654). (2) `FF_{Marc(ℚ_p)}` → GSpec(ℚ_p) is cohomologically smooth and proper, with dualizing complex the (φ, Γ)-module of the cyclotomic character in degree −2 (ALBM Theorem 4.5.1, p. 40, ALBM line 1753; ALBM Corollary 4.5.2, p. 44, ALBM line 1930). Here the Tate twist ℚ_p(1) is the slope-zero line bundle given by the cyclotomic character, not the degree-one bundle O(1) of 7.6.

A proof route: Follow ALBM §§4.4–4.5 in the light setting: étale maps are cohomologically smooth, smoothness descends, the relative torus over a geometric point is treated directly, and the dualizing complex is computed from the unit section of A^d; the !-functors of ALBM and of the light Gelfand formalism agree by ABLB §4.4 (ABLB Lemma 4.4.3, ABLB line 2414; ABLB Proposition 4.4.7, ABLB line 2531; ABLB Corollary 4.4.10, ABLB line 2641). For (2), `FF_{Marc(ℚ_p)}` has fibres Spd ℚ_p/φ^ℤ over Marc(ℚ_p), and the dualizing complex is pinned down by the cohomology of rank one (φ, Γ)-modules.

*Needs:* §6.2; §2.4; §2.2; DiamondsAndVStacks §D6.4; VectorBundlesAndIsocrystals Layer 6; AnalyticStacks §0.5, §0.6, §3.2, §3.3; AnalyticStacks §§0.8–0.11.

**Checks.**

- For g an étale map, d = 0 and the dualizing complex is O.
- On `FF_{C♭}` the Tate twist O ⊗ ℚ_p(1) has H⁰ = ℚ_p(1), one-dimensional, whereas O(1) has H⁰ = BC(O(1))(C) = `B^{φ=p}_cris`, infinite-dimensional; reading (d) as O(d) gives the wrong dualizing complex.
- For (2), `Γ(FF_{Marc(ℚ_p)}, O) = RΓ(G_{ℚ_p}, ℚ_p)` has dimensions 1, 2, 0 in degrees 0, 1, 2, and duality with ℚ_p(1)[2] pairs H⁰ with H²(ℚ_p(1)) = ℚ_p and H¹ with H¹(ℚ_p(1)), local Tate duality.

### Examples

For S = Spa(C♭) the disc `D^×_{FF,S}` is the punctured open disc `Y_{(0,∞)}` and FF_S is the Fargues–Fontaine curve of C♭ as a Gelfand stack. Marc(𝔽_p)^HK = GSpec(ℚ_p)/φ^ℤ, whose vector bundles are isocrystals over ℚ_p. For f: G_m → Marc(𝔽_p) one has f^HK_*O = O ⊕ O(−1)[−1].

### Dependencies

Layers 1–5; RelativeFarguesFontaine §1.2, §2.1, §2.2; VectorBundlesAndIsocrystals Layer 0, Layer 1, Layer 6; FarguesFontaineDiamonds §F2; PerfectoidSpaces §P1.16, §P1.27; DiamondsAndVStacks §D6.4; AnalyticStacks §0.5, §0.6, §§0.8–0.11, §3.2, §3.3.

## Layer 7: Rational δ-spaces and analytic δ-stacks

This layer defines rational δ-spaces, the analytic analogue of δ-rings, as Berkovich thickenings of punctured Fargues–Fontaine discs with a Frobenius; constructs the δ-space attached to a uniformly perfectoid ring, the analytic analogue of the Witt vectors; defines analytic δ-stacks and their realization as Gelfand stacks; relates perfect analytic δ-stacks to arc-stacks and Hyodo–Kato stacks; computes perfect complexes on thickened Fargues–Fontaine curves; and constructs locally analytic Banach–Colmez spaces.

### 7.1 Rational δ-spaces

A rational δ-space is a tuple (S, 𝒳, ι, φ_𝒳) with S a qfd perfectoid space of characteristic p, 𝒳 a Berkovich space with an endomorphism φ_𝒳, and ι: `D^×_{FF,S}` → 𝒳 a map of Berkovich spaces inducing an isomorphism of arc-stacks `D^{×,⋄}_{FF,S}` ≅ 𝒳^⋄ with φ_𝒳 ∘ ι ≅ ι ∘ φ (a property, since `D^×_{FF,S}` is locally the spectrum of a static Banach algebra). A morphism (S, 𝒳) → (S′, 𝒳′) is a map α: S → S′, a φ-equivariant map 𝒳 → 𝒳′ (a datum) and the commutative square with the map of discs induced by α (a property). A δ-space is perfect if φ_𝒳 is an automorphism; Spc^δ and PerfSpc^δ denote the categories (ALRS Definition 3.3.1, p. 46, ALRS line 2398). For a perfect δ-space the Frobenius acts totally discontinuously on |𝒳| and the thickened Fargues–Fontaine curve 𝒳/φ^ℤ is defined (ALRS Remark 3.3.2, p. 46, ALRS line 2417). Prove that S ↦ `(S, D^×_{FF,S})` is an equivalence from perfectoid spaces of characteristic p onto the full subcategory `Spc^{δ,cl}` of classical δ-spaces, and that the inclusion has right adjoint (S, 𝒳) ↦ S (ALRS Example 3.3.4, p. 46, ALRS line 2429; ALRS Lemma 3.5.2, p. 51, ALRS line 2670).

*Needs:* §6.1; §2.6; §2.8.

The API has the following laws.

- The Frobenius φ_𝒳 together with φ_S is an endomorphism of δ-spaces, natural in morphisms.
- Perf ≅ `Spc^{δ,cl}`, and Hom(`(S, D^×_{FF,S})`, (S′, 𝒳′)) = Hom(S, S′).
- For a perfect δ-space, 𝒳/φ^ℤ is a Berkovich space with |𝒳/φ^ℤ| = |𝒳|/φ^ℤ.

**Checks.**

- For S = Spa(C♭), `(S, D^×_{FF,S})` is a perfect δ-space whose thickened curve is `FF_{C♭}`.
- For S = `Marc(𝔽_p((π^{1/p^∞})))`, the decompleted perfected punctured open disc `D^{×,<1,perf}_{ℚ_p}` with φ(x) = x^p is a perfect δ-space which is not a †-thickening of `D^×_{FF,S}` (ALRS Example 3.3.5).
- For 𝒳 = `D^×_{FF,S}` ⊔ `D^×_{FF,S}` with ι the first inclusion, ι^⋄ is not an isomorphism, so this is not a δ-space.
- For S = ∅ the only δ-space is (∅, ∅), since a Berkovich space with empty perfectoidization is empty.

### 7.2 The δ-space attached to a uniformly perfectoid ring

Let A be a uniformly perfectoid Gelfand ring, T = GSpec(A), T^u = GSpec(A^u), T♭ the tilt of T^u, f: T^u → `D^×_{FF,T♭}` the untilt and f_φ: ℕ × T^u → `D^×_{FF,T♭}` the map equal to φ^n ∘ f on {n} × T^u. Prove that the category of δ-spaces (S, 𝒳) with a map T → 𝒳 of Berkovich spaces has an initial object (T♭, 𝒳_T), where 𝒳_T is the pushout in Berkovich spaces of f_φ and ℕ × T^u → ℕ × T (ALRS Proposition 3.4.7, p. 48, ALRS line 2501; ALRS Definition 3.4.8, p. 48, ALRS line 2524). Prove the perfect analogue, with initial perfect δ-space `D^×_{FF,A}` = (ℤ × T) `⊔_{ℤ × T^u}` `D^×_{FF,T♭}` and Fargues–Fontaine curve FF_A = `D^×_{FF,A}/φ^ℤ` (ALRS Remark 3.4.10, p. 48, ALRS line 2535); the radius map κ: 𝒳_T → (0, ∞) sends the n-th copy of T to p^n and `κ^{-1}(p^n)` = GSpec`(A ×_{A^u} B^†_{[p^n,p^n],A^u})` (ALRS Remark 3.4.9, p. 48, ALRS line 2526). Prove that `D^×_{FF,Marc(A^u)} → D^×_{FF,A}` is an isomorphism if and only if A is perfectoid (ALRS Remark 3.4.17, p. 50, ALRS line 2634), and that for nilperfectoid A the Gelfand stack 𝒳_T represents the maps `W′(A_{≤1}) → B_{≤1}`, B a Gelfand ring, whose composite to every perfectoid B-algebra factors through `D^×_{FF,A^u}`, where `W′(A_{≤1}) = W(A_{≤1})` `×_{W(A^{u,°})}` `W(A^{u,°,♭})` (ALRS Remark 1.5, p. 4, ALRS line 197).

A proof route: Given (S, 𝒳) and T → 𝒳, the composite T^u → 𝒳 is determined by `T^{u,⋄}` → 𝒳^⋄ = `D^{×,⋄}_{FF,S}` since T^u = `(T^{u,⋄})^∧`, hence factors through `D^×_{FF,S}`; ALRS Lemma 3.2.2 (6.1) factors T^u → `D^×_{FF,S}` through f; extend φ-equivariantly to ℕ × T^u and ℕ × T, and conclude by the pushout of 4.3(2), whose input A → A^u is an isomorphism on uniform completions. The Witt-vector description combines the pushout presentation with the fibre sequence W(Nil†(A)) → `W(A_{≤1}) → W(A^{u,°})`, which needs A nilperfectoid: then `A^{†-red}` = A^u, so by the pullback square of 1.2 the map `A_{≤1} → A^u_{≤1} = A^{u,°}` is a base change of the surjection A → A^u and has fibre Nil†(A), and W(Nil†(A)) ≅ ∏_ℕ Nil†(A) by the ghost map, Nil†(A) being a non-unital ℚ_p-algebra (ALRS p. 4, ALRS line 205).

*Needs:* §7.1; §6.1; §4.3; §1.2; §1.8; PerfectoidSpaces §P1.27.

The API has the following laws.

- For uniformly perfectoid A and T = GSpec(A), the pair (T♭, 𝒳_T) is initial among the δ-spaces (S, 𝒳) equipped with a map T → 𝒳 of Berkovich spaces, where 𝒳_T is the pushout of f_φ: ℕ × T^u → `D^×_{FF,T♭}` along ℕ × T^u → ℕ × T.
- Among perfect δ-spaces with a map from T the initial one is (T♭, `D^×_{FF,A}`), where `D^×_{FF,A}` = (ℤ × T) `⊔_{ℤ × T^u}` `D^×_{FF,T♭}`, and FF_A = `D^×_{FF,A}/φ^ℤ` is a Berkovich space.
- The radius map κ: 𝒳_T → (0, ∞) sends the n-th copy of T to p^n, and `κ^{-1}(p^n)` = GSpec`(A ×_{A^u} B^†_{[p^n,p^n],A^u})`.
- The natural map `D^×_{FF,Marc(A^u)} → D^×_{FF,A}` is an isomorphism if and only if A is perfectoid.
- For nilperfectoid A, 𝒳_T represents the maps `W′(A_{≤1}) → B_{≤1}`, B a Gelfand ring, whose composite to every perfectoid B-algebra factors through `D^×_{FF,A^u}`.

**Checks.**

- For A perfectoid, 𝒳_T = `D^×_{FF,T♭}`, since the pushout is along the identity of ℕ × T.
- For A = C_p[ε]/ε², 𝒳_T agrees with `D^×_{FF,C♭}` away from the radii p^n, n ≥ 0, and at radius p^n contains the thickened point GSpec(C_p[ε]/ε²).
- For A = `ℚ_p(μ_{p^∞})` uncompleted, the map `D^×_{FF,Marc(A^u)} → D^×_{FF,A}` is not an isomorphism, since A is not perfectoid.
- For the nilperfectoid A = C_p[ε]/ε², the pullback square of 1.2 gives `A_{≤1} = O_{C_p}` ⊕ C_p·ε, and W(C_p·ε) → `W(A_{≤1}) → W(O_{C_p})` is a fibre sequence, as the Witt-vector description uses. For the uniformly perfectoid but not nilperfectoid A = `ℚ_p(μ_{p^∞})` uncompleted, Nil†(A) = 0 while `A_{≤1} = ℤ_p[μ_{p^∞}] → A^{u,°}`, the ring of integers of ℚ_p^cyc, is not surjective, so the sequence fails and the description is not asserted.
- For A = 0, 𝒳_T = ∅.

### 7.3 Analytic δ-stacks and their realization

Let (−)^preal: P(Spc^δ) → GelfStk be the colimit-preserving functor sending (S, 𝒳) to 𝒳; call a map of presheaves a !-equivalence if its realization is an isomorphism, and define the ∞-category AnStk^δ of rational analytic δ-stacks as the localization at !-equivalences, with induced colimit-preserving realization (−)^real: AnStk^δ → GelfStk; define PerfAnStk^δ likewise from perfect δ-spaces (ALRS Definition 3.4.2, p. 47, ALRS line 2470; ALRS Remark 3.4.4, p. 47, ALRS line 2482). Every analytic δ-stack has a Frobenius endomorphism, an automorphism in the perfect case, and realization is conservative (ALRS Remark 3.4.3, p. 47, ALRS line 2479; ALRS Remark 3.4.5, p. 47, ALRS line 2488). Prove that realization commutes with finite limits, hence is the inverse image of a geometric morphism, and that it sends 𝒴 to the !-sheafification of T = GSpec(A) ↦ 𝒴(T♭, 𝒳_T) on uniformly perfectoid A; in the perfect case to the sheafification of A ↦ 𝒴`(Marc(A)♭, D^×_{FF,A})` (ALRS Proposition 3.4.12, p. 49, ALRS line 2569; ALRS Remark 3.4.13, p. 49, ALRS line 2586). Define admissible δ-stacks (realization needs no sheafification on nilperfectoids), prove that they are closed under limits and that for admissible 𝒴, (𝒴^perf)^real ≅ lim_φ 𝒴^real (ALRS Definition 3.4.15, p. 50, ALRS line 2614; ALRS Lemma 3.4.16, p. 50, ALRS line 2617); construct the perfection adjunction (ALRS Remark 3.4.14, p. 50, ALRS line 2599) and, for a Gelfand stack T, the analytic δ-stack `T_{Spc^δ}`: (S, 𝒳) ↦ T(𝒳), its restriction `T_{PerfSpc^δ}` to perfect δ-spaces, and the perfect analytic δ-stack `T_{FF}`: (S, 𝒳) ↦ T(𝒳/φ^ℤ), defined on perfect δ-spaces only, where φ_𝒳 is an automorphism (ALRS Definition 3.4.18, p. 51, ALRS line 2651).

A proof route: ALRS Proposition 3.4.7 gives a partial left adjoint on uniformly perfectoid affinoids; the induced adjunction on presheaves expresses realization as the composite of the restriction Ψ′ with sheafification, and sheafification preserves colimits and finite limits.

*Needs:* §7.2; §2.1; §2.4; EnhancedDerivedSheaves §E2.7.

The API has the following laws.

- (−)^real preserves colimits and finite limits and is conservative.
- 𝒴^real is the !-sheafification of A ↦ 𝒴(T♭, 𝒳_T) on uniformly perfectoid A.
- Admissible (perfect) analytic δ-stacks are closed under limits, and for admissible 𝒴 the perfection is computed by lim_φ on realizations.
- The Frobenius of an analytic δ-stack is a natural endomorphism, inducing a Frobenius on its realization; the perfect analytic δ-stack `T_{FF}` has canonically trivialized Frobenius automorphism.

**Checks.**

- The final analytic δ-stack realizes to GSpec(ℚ_p), since realization preserves finite limits.
- The δ-stack represented by (S, 𝒳) realizes to 𝒳.
- The presheaf T ↦ 𝒴(T♭, 𝒳_T) need not be a !-sheaf, because T ↦ 𝒳_T does not preserve fibre products even over a perfectoid base (ALRS footnote 24); sheafification is part of the definition.
- On the classical perfect δ-space `(S, D^×_{FF,S})` the stack `T_{FF}` takes the value T(FF_S), since `D^×_{FF,S}/φ^ℤ` is the Fargues–Fontaine curve FF_S (6.2). On a δ-space whose Frobenius φ_𝒳 is only an endomorphism, 𝒳/φ^ℤ is not a quotient by a group action, so `T_{FF}` is not defined there: it is a perfect analytic δ-stack only.

### 7.4 Perfect analytic δ-stacks, arc-stacks and Hyodo–Kato stacks

Prove that (−)^⋄_FF: PerfAnStk^δ → ArcStk, 𝒴 ↦ `(S ↦ 𝒴(S, D^×_{FF,S}))`, is well defined with a fully faithful left adjoint `D^×_{FF,(−)}`, the colimit-preserving extension of S ↦ `D^×_{FF,S}` which preserves finite limits, and a fully faithful right adjoint `D^{×,dR}_{FF,(−)}`: Y ↦ ((S, 𝒳) ↦ Y(S)) with admissible values (ALRS Proposition 3.5.3, p. 51, ALRS line 2685). Define the de Rham Fargues–Fontaine stack `D^{×,dR}_{FF,Y}` and 𝒴^dR = `D^{×,dR}_{FF,𝒴^⋄_FF}` (ALRS Definition 3.5.4, p. 52, ALRS line 2735). Prove that `(D^{×,dR}_{FF,Y})^real` = (Y × Marc(ℚ_p))^dR, so that Y^HK = `D^{×,dR}_{FF,Y}/φ^ℤ` realizes the Hyodo–Kato stack of 6.3 (ALRS Remark 3.5.6, p. 52, ALRS line 2743), that `D^{×,dR}_{FF,(−)}` commutes with colimits (ALRS Lemma 3.5.7, p. 53, ALRS line 2754), and that realization commutes with de Rham stacks, with `D^×_{FF,𝒴^⋄}` → 𝒴^real → (𝒴^dR)^real inducing equivalences on de Rham stacks, also for non-perfect analytic δ-stacks (ALRS Remark 3.5.8, p. 53, ALRS line 2764).

A proof route: From the adjunction of 7.1 (ALRS Lemma 3.5.2, ALRS line 2670) one obtains j_! ⊣ j^* ⊣ j_* on presheaves; arc-covers of perfectoids induce !-covers of perfect δ-spaces and conversely, so j^* and j_* restrict; full faithfulness and finite limits follow as in ABLB Proposition 4.5.7, the finite-limit statement reducing to products of perfectoid spaces over `𝔽_p((π^{1/p^∞}))` via Teichmüller coordinates; colimits follow from 3.2.

*Needs:* §7.3; §7.1; §6.3; §3.2.

The API has the following laws.

- `D^×_{FF,(−)}` ⊣ (−)^⋄_FF ⊣ `D^{×,dR}_{FF,(−)}` between arc-stacks and perfect analytic δ-stacks, both outer functors fully faithful; `D^×_{FF,(−)}` preserves colimits and finite limits, and `D^{×,dR}_{FF,(−)}` preserves limits and colimits.
- `(D^{×,dR}_{FF,Y})^real` = (Y × Marc(ℚ_p))^dR for an arc-stack Y over 𝔽_p, and `D^{×,dR}_{FF,Y}/φ^ℤ` realizes the Hyodo–Kato stack Y^HK of 6.3.
- Realization commutes with de Rham stacks: for an analytic δ-stack 𝒴, perfect or not, `D^×_{FF,𝒴^⋄}` → 𝒴^real → (𝒴^dR)^real induce equivalences on de Rham stacks.

**Checks.**

- For Y = Marc(𝔽_p), `(D^{×,dR}_{FF,Y})^real` = Marc(ℚ_p)^dR = GSpec(ℚ_p), so Y^HK = GSpec(ℚ_p)/φ^ℤ as in 6.3.
- `D^×_{FF,Marc(K)×Marc(K)} = D^×_{FF,K}` `×_{GSpec(ℚ_p)}` `D^×_{FF,K}` for K = `𝔽_p((π^{1/p^∞}))`, from the finite-limit compatibility of `D^×_{FF,(−)}`, of realization (7.3) and the realization GSpec(ℚ_p) of the final object (ABLB Remark 4.4.11(1), p. 50, ABLB line 2654). The fibre product is over GSpec(ℚ_p), not over `D^×_{FF,K}`: with ϖ = π on both factors, the two radius maps are independent on it, (κ_1, κ_2) taking every value in (0, ∞)² because the spectrum of a completed tensor product of Banach ℚ_p-algebras surjects onto the product of their spectra (ABLB line 2037–2038), whereas on the diagonal copy of `D^×_{FF,K}` one has κ_1 = κ_2.
- `D^{×,dR}_{FF,(−)}` is a right adjoint and preserves the final object: `D^{×,dR}_{FF,Marc(𝔽_p)}` is the final perfect analytic δ-stack, consistent with its realization GSpec(ℚ_p).

### 7.5 Perfect complexes on thickened Fargues–Fontaine curves

With `Perf^{[n,m]}` on Gelfand stacks as in 2.3 (AnalyticStacks §4.5), define the sheaf of categories `Perf^{[n,m],FF}` on perfect δ-spaces, (S, 𝒳) ↦ `Perf^{[n,m]}(𝒳/φ^ℤ)` (ALRS Definition 3.6.1, p. 53, ALRS line 2797). Prove that for a nilperfectoid (or uniformly perfectoid) A the square Perf(FF_A) → `Perf(FF_{A^u})`, Perf(GSpec A) → Perf(GSpec A^u) is cartesian; consequently A ↦ Perf(FF_A) is a sheaf of categories on Gelfand stacks and (Perf^≃_FF)^real = Perf^≃ `×_{Perf^{≃,dR}}` `(Perf^≃_FF)^{dR,real}` (ALRS Proposition 3.6.3, p. 54, ALRS line 2822); the same holds for D^+ and fixed amplitudes (ALRS Remark 3.6.4, p. 54, ALRS line 2838), for Perf on perfect δ-spaces and on δ-spaces (ALRS Remark 3.6.7, p. 55, ALRS line 2857), and for global sections: Γ(FF_A, E) = `Γ(FF_{A^u}, E)` `×_{Γ(A^u, E)}` Γ(A, E) (ALRS Corollary 3.6.5, p. 54, ALRS line 2841). For a strictly totally disconnected nilperfectoid A deduce Γ`(GSpec A, O_{FF_A})` ≅ A `×_{A^u}` ℚ_p^dR(A) = ℚ_p^la(A) (ALRS Example 3.6.6, p. 54, ALRS line 2847).

A proof route: Cover FF_A by †-rational localizations; on each, the pushout description of 7.2 and the Perf statement of 4.3(3) give the cartesian square; sheafiness of A ↦ `Perf(FF_{A^u})` and Perf(A^u) on nilperfectoids is ABLB Proposition 4.4.7.

*Needs:* §7.2; §4.3; §2.3; §3.4; VectorBundlesAndIsocrystals Layer 2.

The API has the following laws.

- A ↦ Perf(FF_A) is a sheaf of categories on Gelfand stacks, and (S, 𝒳) ↦ `Perf^{[n,m]}(𝒳/φ^ℤ)` is a sheaf of categories on perfect δ-spaces.
- For nilperfectoid or uniformly perfectoid A, Perf(FF_A) = `Perf(FF_{A^u})` `×_{Perf(A^u)}` Perf(A), and likewise for D^+ and for each fixed amplitude [n, m].
- For nilperfectoid A and E ∈ Perf(FF_A), Γ(FF_A, E) = `Γ(FF_{A^u}, E)` `×_{Γ(A^u, E)}` Γ(A, E), each term the sections of the base change of E; for strictly totally disconnected nilperfectoid A, Γ`(GSpec A, O_{FF_A})` = ℚ_p^la(A).
- (Perf^≃_FF)^real = Perf^≃ `×_{Perf^{≃,dR}}` `(Perf^≃_FF)^{dR,real}`.

**Checks.**

- For A perfectoid both horizontal maps are identities and the square is trivially cartesian.
- For A = C_p[ε]/ε², Γ(FF_A, O) = ℚ_p `×_{C_p}` (C_p[ε]/ε²) = ℚ_p ⊕ C_p·ε, using `Γ(FF_{C♭}, O)` = ℚ_p.
- The value of ALRS Example 3.6.6 at A = C_p[ε]/ε² agrees with the computation ℚ_p^la(C_p[ε]/ε²) = ℚ_p ⊕ C_p·ε of 3.4.

### 7.6 Locally analytic Banach–Colmez spaces

For λ ∈ ℚ let `(D_λ, φ_{D_λ})` be the standard isocrystal of slope λ and, for a nilperfectoid A, `O_{FF_A}(λ)` the descent along `D^×_{FF,A}` → FF_A of O `⊗_{ℚ_p}` `D_{−λ}`; define the absolute Banach–Colmez spaces BC(O(λ)): A ↦ Γ(FF_A, O(λ)) for λ ≥ 0 and BC(O(λ)[1]): A ↦ Γ(FF_A, O(λ)[1]) for λ < 0, and their incarnations BC_FF in PerfAnStk^δ with BC_FF(O(λ))^real = BC(O(λ)) (ALRS Definition 3.7.1, p. 55, ALRS line 2869; ALRS Remark 3.7.2, p. 55, ALRS line 2878). Prove 1 + `D̃^{<1}_{ℚ_p}` := `lim_{x↦x^p}(1 + D^{<1}_{ℚ_p})` ≅ BC(O(1)) compatibly with the logarithm (ALRS Example 3.7.3, p. 55, ALRS line 2890), and: for λ ≥ 0, BC(O(λ)) = `(G_a^an ⊗ D_{−λ})` `×_{G_a^{an,dR} ⊗ D_{−λ}}` BC(O(λ))^dR, so BC(O) = ℚ_p^la and G_a^† ⊗ `D_{−λ}` → BC(O(λ)) → BC(O(λ))^dR is an extension of ℚ_p^la-modules; for λ < 0, BC(O(λ)[1]) = B`(G_a^an ⊗ D_{−λ})` `×_{B(G_a^{an,dR} ⊗ D_{−λ})}` BC(O(λ)[1])^dR, so that B`(G_a^† ⊗ D_{−λ})` → BC(O(λ)[1]) → BC(O(λ)[1])^dR is an extension of ℚ_p^la-modules (ALRS Proposition 3.7.4, p. 56, ALRS line 2915; the square displayed in its part (2) has G_a^dR in place of G_a^an in the lower left corner, against its proof at ALRS line 2931 and the extension it deduces); and BC_FF → BC_FF^dR is an epimorphism (ALRS Corollary 3.7.5, p. 56, ALRS line 2937). Prove that the de Rham stacks agree, after base change to Marc(ℚ_p), with the classical Banach–Colmez spaces BC of VectorBundlesAndIsocrystals Layer 5 (FS Proposition II.2.2, p. 60, FS line 2274).

A proof route: Apply 7.5 to E = O(λ) or O(λ)[1]: the lower-left term is G_a^an ⊗ `D_{−λ}` (resp. its classifying stack) by definition of O(λ), the right column is the de Rham stack of the left, and the upper right is the classical Banach–Colmez space (FS Proposition II.2.2; VectorBundlesAndIsocrystals Layer 5, “Lubin–Tate universal cover and sections of O(1)”). For λ = 1 the map 1 + `D̃^{<1}` → BC(O(1)) is an isomorphism because log: 1 + `D^{<1}` → A¹ is étale of partially proper rigid spaces and 1 + `D̃^{<1}` → 1 + `D^{<1}` is †-formally étale.

*Needs:* §7.5; §7.3; §3.4; §4.1; VectorBundlesAndIsocrystals Layer 1; VectorBundlesAndIsocrystals Layer 2; VectorBundlesAndIsocrystals Layer 5.

The API has the following laws.

- For λ ≥ 0, G_a^† ⊗ `D_{−λ}` → BC(O(λ)) → BC(O(λ))^dR is an extension of ℚ_p^la-modules, and BC(O) = ℚ_p^la.
- For λ < 0, B`(G_a^† ⊗ D_{−λ})` → BC(O(λ)[1]) → BC(O(λ)[1])^dR is an extension of ℚ_p^la-modules.
- `lim_{x↦x^p}(1 + D^{<1}_{ℚ_p})` ≅ BC(O(1)), compatibly with the logarithm.
- BC_FF → BC_FF^dR is an epimorphism, and after base change to Marc(ℚ_p) the de Rham stacks are the classical Banach–Colmez spaces of VectorBundlesAndIsocrystals Layer 5.

**Checks.**

- BC(O) = ℚ_p^la and BC(O)^dR = ℚ_p^sm; the kernel of BC(O)(A) → BC(O)^dR(A) is Nil†(A), which is ℚ_p·ε for A = ℚ_p[ε]/ε².
- BC(O(1))(C_p) = 1 + `𝔪_{C_p♭}` as a group under multiplication, and its image under the logarithm of the first coordinate lands in C_p.
- For λ = −1, BC(O(−1)[1])^dR(C_p) = `H¹(FF_{C♭}, O(−1))` = C_p/ℚ_p (FS Proposition II.2.5). At A = C_p[ε]/ε², 7.5 gives BC(O(−1)[1])(A) = `Γ(FF_{C♭}, O(−1)[1])` `×_{B(C_p ⊗ D_1)}` B(A ⊗ D_1), with π₀ = C_p/ℚ_p and π₁ = C_p·ε ⊗ D_1, the π₁ of B(G_a^† ⊗ D_1)(A), whereas π₁ of BC(O(−1)[1])^dR(A) = BC(O(−1)[1])(C_p) is `H⁰(FF_{C♭}, O(−1))` = 0; a square with B(G_a^dR ⊗ D_1) in the lower left corner would make the two equal.
- Using D_λ instead of `D_{−λ}` would give O(1) the slope −1, with `H⁰(FF_{C♭}, O(1))` = 0, contradicting BC(O(1)) = 1 + `D̃^{<1}`.

### Examples

The classical δ-space `(S, D^×_{FF,S})`; the cyclotomic δ-space `(Marc(𝔽_p((t^{1/p^∞}))), (lim_{x↦x^p} 1 + D^{<1})∖{1})`, which is not a †-thickening; X_T for T = GSpec(C_p[ε]/ε²), thickened at the points of radius p^n; BC(O) = ℚ_p^la and BC(O(1)) = 1 + `D̃^{<1}`.

### Dependencies

Layers 1–6; RelativeFarguesFontaine §2.1; VectorBundlesAndIsocrystals Layer 1, Layer 2, Layer 5; FarguesFontaineDiamonds §F2; PerfectoidSpaces §P1.27; EnhancedDerivedSheaves §E2.7.

## Layer 8: The rational analytic prismatization and the p-adic twistor stack

This layer defines degree-one Cartier divisors on δ-spaces, rational analytic prisms, the prismatic site, the prismatization X^Δ of a Gelfand stack, its perfect version `X^{Div¹~}` = lim_φ X^Δ, the p-adic twistor stack `X^{Div¹} = X^{Div¹~}/φ^ℤ` and the analytic Hodge–Tate stack X^HT; computes their de Rham stacks; describes X^Δ through the cone of X and the Breuil–Kisin divisor; decomposes X^Δ by the radius map into a Hyodo–Kato part and a twistor part; and proves descent along †-formally étale and quasi-syntomic maps.

### 8.1 Degree-one divisors, rational analytic prisms and the prismatic site

For a δ-space (S, 𝒳) call a Cartier divisor (s: L → O_𝒳) of degree one if its pullback to `D^×_{FF,S}` represents the closed Cartier divisor S^♯ → `D^×_{FF,S}` of an untilt S^♯ of S (FS Proposition II.1.18, p. 55, FS line 2105). A rational analytic prism (S, 𝒳, D) is a δ-space with a degree-one divisor D ⊆ 𝒳 (the map D → 𝒳 need not be a monomorphism). For a Gelfand stack X the rational analytic prismatic site `X_{Δ-site}` consists of tuples (S, 𝒳, D, α: D → X), with coverings induced by !-covers of (S, 𝒳); `Q_{p,Δ}` is the analytic δ-stack of degree-one divisors and X_Δ → `Q_{p,Δ}` the analytic δ-stack (S, 𝒳, D) ↦ Map(D, X) (ALRS Definition 4.1.1(1)–(4), p. 57, ALRS line 2953). Prove rigidity: for a morphism of prisms (S′, 𝒳′, D′) → (S, 𝒳, D), D′ → D ×_𝒳 𝒳′ is an isomorphism (ALRS Remark 4.1.2(3), p. 57, ALRS line 2988).

A proof route: Rigidity reduces to an isomorphism of invertible ideal sheaves, which can be checked after uniform completion, where it is rigidity of degree-one divisors on `D^×_{FF,S′}` (FarguesFontaineDiamonds §F4, “The analytic untilt divisor on Y”; RelativeFarguesFontaine §3.2).

*Needs:* RelativeFarguesFontaine §4.7; §7.1; §3.6; §6.1; RelativeFarguesFontaine §3.2; FarguesFontaineDiamonds §F4; VectorBundlesAndIsocrystals Layer 0.

The API has the following laws.

- The pullback of a degree-one divisor along a morphism of δ-spaces is of degree one, giving the δ-stack `Q_{p,Δ}`.
- For a morphism of prisms, D′ ≅ D ×_𝒳 𝒳′.
- On the classical δ-space `(S, D^×_{FF,S})`, degree-one divisors are the untilt divisors of RelativeFarguesFontaine §3.2 and FarguesFontaineDiamonds §F4.

**Checks.**

- On X_cyc = `(lim_{x↦x^p} 1 + D^{<1}_{ℚ_p})` ∖ {1}, the divisor of [p]_q = (q^p − 1)/(q − 1) has degree one, with D = `GSpec(ℚ_p(μ_{p^∞}))` uncompleted (ALRS Example 4.1.7(1)).
- On X_cyc the divisor of q − 1 is not of degree one. X_cyc omits only the point at which every `q^{1/p^n}` equals 1, and q − 1 = (`q^{1/p^k}` − 1)·`[p]_{q^{1/p}}`⋯`[p]_{q^{1/p^k}}` for every k ≥ 1, so the divisor of q − 1 is the sum over k ≥ 1 of the divisors of `[p]_{q^{1/p^k}}`, the loci where `q^{1/p^(k-1)}` = 1 ≠ `q^{1/p^k}`. These are pairwise disjoint Frobenius translates of the divisor of [p]_q, the first containing the points with q = 1 and `q^{1/p}` a primitive p-th root of unity, so the divisor of q − 1 pulls back to a sum of infinitely many distinct untilt divisors.
- The divisor of [p]_q² pulls back to twice an untilt divisor and is not of degree one.
- On `lim_{x↦x^p}` `D^{<1}_{ℚ_p}` ∖ {0} with φ(X) = X^p, the divisor of X − p has degree one, with D = `GSpec(ℚ_p(p^{1/p^∞}))` (ALRS Example 4.1.7(2)).

### 8.2 The prismatization, the p-adic twistor stack and the Hodge–Tate stack

For a Gelfand stack X define the rational analytic prismatization X^Δ as the realization of X_Δ, equivalently the sheafification of the functor sending a nilperfectoid A over Q_p^Δ = GSpec(ℚ_p)^Δ to Map(D, X), D ⊆ `𝒳_{GSpec A}` the classified degree-one divisor; the rational perfect analytic prismatization `X^{Div¹~}` = lim_φ X^Δ; and the p-adic twistor stack `X^{Div¹} = X^{Div¹~}/φ^ℤ`, with Div¹~ = `GSpec(ℚ_p)^{Div¹~}` = lim_φ Q_p^Δ and Div¹ = Div¹~/φ^ℤ (ALRS Definition 4.1.1(5)–(7), p. 57, ALRS line 2965). Construct the natural map X^Δ → A¹/G_m from the divisor {0} × T ⊂ ℕ × T → 𝒳_T and the analytic Hodge–Tate stack X^HT = X^Δ `×_{A¹/G_m}` BG_m (ALRS Definition 4.1.4, p. 58, ALRS line 3010). Prove that X ↦ X_Δ is right adjoint to the colimit-preserving functor (S, 𝒳, D) ↦ D and commutes with fibre products (ALRS Remark 4.1.2(2), p. 57, ALRS line 2980), that the perfect prismatic site gives a perfect δ-stack with `(X^{Div¹~})^real → X^{Div¹~}` an equivalence for †-cohesive X (ALRS Remark 4.1.2(4), p. 57, ALRS line 2993), and construct the maps 𝒳 → D^Δ → Q_p^Δ attached to a prism (ALRS Remark 4.1.6, p. 58, ALRS line 3017) and the relative prismatization `Y^{Δ/𝒳}` = Y^Δ `×_{D^Δ}` 𝒳 and relative Hodge–Tate stack `Y^{HT/D} = Y^{Δ/𝒳}` ×_𝒳 D over a prism (ALRS Definition 4.1.8, p. 59, ALRS line 3048). For a perfect analytic prism (S, 𝒳, D), one whose δ-space (S, 𝒳) is perfect, the map 𝒳 → D^Δ factors through a φ-equivariant map 𝒳 → `D^{Div¹~}` (ALRS Remark 4.1.6, p. 58, ALRS line 3024); for Y over D define the relative perfect prismatization `Y^{Div¹~/𝒳} = Y^{Div¹~}` `×_{D^{Div¹~}}` 𝒳 and the relative p-adic twistor stack `Y^{Div¹/𝒳} = Y^{Div¹~/𝒳}/φ^ℤ`, φ acting through the Frobenius of `Y^{Div¹~}` and the automorphism φ_𝒳 (ALRS Definition 4.1.8(1), p. 59, ALRS line 3052). A perfectoid space D over ℚ_p is a perfect prism (D♭, `D^×_{FF,D♭}`, D) through its untilt divisor (7.2), with 𝒳/φ^ℤ = FF_D; over it `Y^{Div¹/𝒳}` is written `Y^{Div¹/FF_D}`.

*Needs:* §8.1; §7.3; §7.2; §7.1; §3.6; §4.4.

The API has the following laws.

- (X ×_Z Y)^Δ = X^Δ `×_{Z^Δ}` Y^Δ, and likewise for `X^{Div¹~}`, `X^{Div¹}` and X^HT.
- X^Δ carries a Frobenius φ over the Frobenius of Q_p^Δ; `X^{Div¹~}` is its perfection and `X^{Div¹}` the quotient by φ^ℤ.
- The map X^Δ → A¹/G_m is the pullback of the classified divisor along {0} × T → 𝒳_T; the resulting divisor X^HT ⊆ X^Δ is the Hodge–Tate divisor.
- A prism (S, 𝒳, D) gives maps 𝒳 → D^Δ → Q_p^Δ sending D to D^HT → Q_p^HT.
- For a perfect prism (S, 𝒳, D) and Y over D, `Y^{Div¹/𝒳} = Y^{Div¹}` `×_{D^{Div¹}}` 𝒳/φ^ℤ, and the pullback of `Y^{Div¹/𝒳}` along 𝒳 → 𝒳/φ^ℤ is `Y^{Div¹~/𝒳}`, because quotients by compatible actions of φ^ℤ commute with fibre products.
- For a perfect prism, `Y^{HT/D} = Y^{Div¹/𝒳}` `×_{𝒳/φ^ℤ}` D, so `Y^{HT/D}` maps to `Y^{Div¹/𝒳}`: the map D → 𝒳 → `D^{Div¹~}` lands in the Hodge–Tate locus, over which the projection `Y^{Div¹~}` → Y^Δ is an isomorphism, a Hodge–Tate divisor D_0 ⊆ 𝒳_T having the unique Frobenius-compatible system of divisors D_n = φ^n(D_0); this is the Hodge–Tate case of the fibre product of ALRS Definition 4.5.1(2) (ALRS line 3611).

**Checks.**

- ∅^Δ = ∅ and GSpec(ℚ_p)^Δ = Q_p^Δ.
- The cyclotomic prism gives a cartesian square `GSpec(ℚ_p(μ_{p^∞}))` = X_cyc `×_{Q_p^Δ}` Q_p^HT (ALRS Example 4.1.7(1)).
- The map {0} × T → 𝒳_T is not itself a Cartier divisor; for D ∈ Q_p^HT(A) the map T → D is a derived thickening with fibre sequence Nil†(A)[1] → O_D → A (ALRS Remark 4.1.5), so X^HT must be defined through A¹/G_m.
- For Y = D over a perfect prism (S, 𝒳, D), `D^{Div¹~/𝒳}` = 𝒳 and `D^{Div¹/𝒳} = D^{Div¹}` `×_{D^{Div¹}}` 𝒳/φ^ℤ = 𝒳/φ^ℤ, base changes of identities; for perfectoid D this is FF_D, whereas the absolute twistor stack `D^{Div¹}` is not FF_D (8.3), so the relative and the absolute twistor stack of D differ.
- For a nilperfectoid A that is not perfectoid, such as C_p[ε]/ε², the Frobenius of the δ-space 𝒳_T of 7.2 shifts the copies {n} × T to {n + 1} × T and misses the 0-th copy of T, so 𝒳_T is not perfect: over a prism with underlying δ-space 𝒳_T only `Y^{Δ/𝒳_T}` and `Y^{HT/D}` are defined, not 𝒳_T/φ^ℤ or a relative twistor stack.
- For S = ∅ the only prism is (∅, ∅, ∅) (7.1), and `Y^{Div¹~/𝒳} = Y^{Div¹/𝒳}` = ∅ for every Y.

### 8.3 de Rham stacks of the prismatization, perfectoids and étale descent

Prove that (X_Δ)^⋄_FF = X^⋄, so that X^dR_Δ = `D^{×,dR}_{FF,X^⋄}` over `Q^dR_{p,Δ}` (ALRS Lemma 4.2.1, p. 59, ALRS line 3062), giving maps `D^×_{FF,X^⋄}` → X^Δ → `D^{×,dR}_{FF,X^⋄}` inducing equivalences on de Rham stacks (ALRS Remark 4.2.2, p. 59, ALRS line 3069); that `X^{Div¹~,dR} → X^{Δ,dR}` and colim_φ X^Δ → `X^{Δ,dR}` are isomorphisms and `X^{Div¹~,dR} ≅ D^{×,dR}_{FF,X^⋄}` (ALRS Proposition 4.2.3, p. 59, ALRS line 3080); that for a perfectoid space Y over ℚ_p the map π_Y: Y^HT → Y, sending a point (D, T → D → FF_A, D → Y) to the composite T → D → Y, is an isomorphism (ALRS Proposition 4.2.4, p. 59, ALRS line 3094); and that for a †-formally étale X′ → X, X′^Δ = X^Δ `×_{D^{×,dR}_{FF,X^⋄}}` `D^{×,dR}_{FF,X′^⋄}`, so X ↦ X^Δ satisfies descent for †-formally étale hypercovers (ALRS Lemma 4.2.5, p. 60, ALRS line 3118).

A proof route: For Proposition 4.2.3 note that for each degree-one divisor D ⊆ 𝒳_T some Frobenius pullback lands in 𝒳_T ∖ (ℕ × T) ≅ `D^×_{FF,T♭}` ∖ (ℕ × T^u). For ALRS Proposition 4.2.4 build the inverse Y → Y^HT from FF_A → FF_Y and the divisor Y `×_{FF_Y}` FF_A, and use rigidity (8.1). For ALRS Lemma 4.2.5 use †-formal étaleness against the †-reduction of D and arc-hyperdescent of `D^{×,dR}_{FF,(−)}` (7.4).

*Needs:* §8.2; §7.4; §4.1; §3.2; §8.1.

**Checks.**

- For Y = GSpec(C_p), Y^HT = GSpec(C_p).
- For a perfectoid Y over ℚ_p, `Y^{Div¹}` and FF_Y are not isomorphic (ALRS line 3114), in contrast with the p-complete prismatization of perfectoids.
- GSpec(ℚ_p[ε]/ε²) and GSpec(ℚ_p) have the same de Rham stack of the prismatization, `D^{×,dR}_{FF,Marc(ℚ_p)}`, although their prismatizations differ.

### 8.4 The Breuil–Kisin divisor and the cone description

Let I_Δ be the ideal sheaf of the Hodge–Tate locus Q_p^HT ⊆ Q_p^Δ and define the Breuil–Kisin ideal I_BK = `⊗_{n∈ℕ}` (φ^n)^* I_Δ, a line bundle on Q_p^Δ (the product is locally finite, since locally all but finitely many factors are trivial), with Breuil–Kisin divisor μ_BK: Q_p^Δ → A¹/G_m (ALRS Definition 4.2.7, p. 61, ALRS line 3166; ALRS Remark 4.2.8, p. 61, ALRS line 3175). Prove that the pullback of μ_BK along 𝒳_T → Q_p^Δ is D_BK = `⊔_{n∈ℕ}` `φ^{n,*}D`, the Frobenius translates being disjoint (ALRS Lemma 4.2.10, p. 62, ALRS line 3217). Prove that for †-cohesive X, X^Δ is admissible and the diagram (4.2.2) is cartesian (ALRS Lemma 4.2.6, p. 61, ALRS line 3154), and that the square with corners X^Δ, `D^{×,dR}_{FF,X^⋄}`, X^cone, (X^cone)^dR, through μ_BK: X^Δ → X^cone `×_{A¹/G_m, μ_BK}` Q_p^Δ, is cartesian, so that μ_BK is †-formally étale (ALRS Proposition 4.2.11, p. 62, ALRS line 3250).

A proof route: The pushout 𝒳_T = `D^×_{FF,A^u}` `⊔_{ℕ × T^u}` (ℕ × T) induces a pushout D = D̄ `⊔_{D_BK ×_{𝒳_T} T^u}` (D_BK `×_{𝒳_T}` T) of divisors, with D̄ the reduction; †-cohesiveness of X turns it into the cartesian square of anima, which is the value of the claimed square at A.

*Needs:* §8.3; §5.1; §4.4; §4.3; §6.1.

The API has the following laws.

- I_BK is a line bundle on Q_p^Δ, locally a finite tensor product of the (φ^n)^*I_Δ, and μ_BK: Q_p^Δ → A¹/G_m classifies the divisor I_BK → O.
- The pullback of μ_BK along 𝒳_T → Q_p^Δ is the divisor `⊔_{n∈ℕ}` `φ^{n,*}D`, whose Frobenius translates are pairwise disjoint.
- Off `⋃_{n∈ℕ}` `φ^{-n}(Q_p^HT)` the map I_BK → O is an isomorphism.
- For †-cohesive X, X^Δ = X^cone `×_{(X^cone)^dR}` `D^{×,dR}_{FF,X^⋄}` along μ_BK and its de Rham stack, so μ_BK: X^Δ → X^cone is †-formally étale.

**Checks.**

- On X_cyc, μ_BK pulls back to the ideal generated by log(q)/(q − 1): log(q) has simple zeros at all p-power roots of unity, and dividing by q − 1 removes q = 1, leaving the zeros of `[p]_{q^{p^n}}`, n ≥ 0 (ALRS Proposition 4.8.1(3)).
- The translates `φ^{n,*}D` and `φ^{m,*}D` for n ≠ m have disjoint supports because the radius map multiplies by p under Frobenius (6.1).
- On Q_p^Δ only the pullbacks `φ^{n,*}` with n ≥ 0 exist, because φ is not invertible on the δ-spaces 𝒳_T; the ℤ-indexed product `⊗_{n∈ℤ}` φ^n(I_Δ) exists only on the perfection Div¹~, where it is the pullback of `I_{Div¹}` (9.7), the underlying line bundle of the perfected twist of 9.8.
- Over the open complement Q_p^Δ ∖ ⋃_n `φ^{-n}(Q_p^HT)` the Breuil–Kisin ideal is trivial.

### 8.5 The radius map and the Hyodo–Kato and twistor regions

Construct the radius map κ: X^Δ → (0, ∞) through X^Δ → `(D^×_{FF,X^⋄})^dR` (ALRS Remark 4.2.12, p. 63, ALRS line 3287). Prove that for †-cohesive X: (1) X^Δ → `(D^×_{FF,X^⋄})^dR` is an isomorphism over (1, ∞), so φ induces `X^Δ_{(1,∞)} ≅ X^Δ_{(p,∞)}` with coequalizer X^HK; (2) `X^{Div¹~}` → X^Δ is an isomorphism over (0, p), so φ induces `X^Δ_{(0,1)} ≅ X^Δ_{(0,p)}` with coequalizer `X^{Div¹}` (ALRS Proposition 4.2.13, p. 63, ALRS line 3309); and X^Δ ≅ `X^{Div¹~}_{(0,p)}` `⊔_{X^{Div¹~}_{(1,p)}}` `(D^{×,dR}_{FF,X^⋄})_{(1,∞)}` (ALRS Corollary 4.2.14, p. 64, ALRS line 3362). The two radius functions are reciprocal: a divisor D ⊆ 𝒳_T lands in `𝒳_{T,(r,s)}` if and only if the corresponding point of X^Δ lands in `X^Δ_{(1/s,1/r)}` (ALRS Proposition 4.2.13, proof, p. 64, ALRS line 3327).

A proof route: Compare the radius of 𝒳_T, which sends n × T to p^n, with the radius of X^Δ coming from Marc(ℚ_p) × Marc(ℚ_p): at an untilt K^♯ of K♭ the first uses the tilt of p and the second the tilt of a uniformizer of K^♯, whence the reciprocal relation; then use that Frobenius induces isomorphisms `𝒳_{T,(1/p,∞)} ≅ 𝒳_{T,(1,∞)}` and `𝒳_{T,(0,1/p)} ≅ 𝒳_{T,(0,1)}`, that 𝒳_T agrees with `D^×_{FF,T♭}` over (0, 1), its thickenings lying at the radii p^n, n ≥ 0 (7.2), and that over (1/p, ∞) it agrees with the perfect thickened disc `D^×_{FF,A}` of 7.2 (ALRS p. 64, ALRS line 3347).

*Needs:* §8.4; §7.2; §6.3; §6.1.

The API has the following laws.

- κ: X^Δ → (0, ∞) factors through X^Δ → `(D^×_{FF,X^⋄})^dR`, Frobenius multiplies it by p, and a divisor D ⊆ 𝒳_T lands in `𝒳_{T,(r,s)}` exactly when the corresponding point of X^Δ lands in `X^Δ_{(1/s,1/r)}`.
- For †-cohesive X, X^Δ → `(D^×_{FF,X^⋄})^dR` is an isomorphism over (1, ∞), and φ: `X^Δ_{(1,∞)} ≅ X^Δ_{(p,∞)}` has coequalizer X^HK.
- For †-cohesive X, `X^{Div¹~}` → X^Δ is an isomorphism over (0, p), and φ: `X^Δ_{(0,1)} ≅ X^Δ_{(0,p)}` has coequalizer `X^{Div¹}`.
- For †-cohesive X, X^Δ is the pushout of `X^{Div¹~}_{(0,p)}` and `(D^{×,dR}_{FF,X^⋄})_{(1,∞)}` along their common open `X^{Div¹~}_{(1,p)}`.

**Checks.**

- The Hodge–Tate locus of X^Δ lies at κ = 1 and its n-th inverse Frobenius translate at κ = `p^{-n}`, whereas the n-th copy of T in 𝒳_T lies at radius p^n.
- For X = GSpec(ℚ_p), `Q^Δ_{p,(1,∞)} = (D^×_{FF,Marc(ℚ_p)})^dR_{(1,∞)}` and the coequalizer over (1, ∞) is Q_p^HK = GSpec(ℚ_p)^HK.
- Using the radius of 𝒳_T instead of that of X^Δ replaces κ by 1/κ: the Hodge–Tate locus stays at 1, its n-th inverse Frobenius translate moves from `p^{-n}` to p^n, and the intervals (0, p) and (1, ∞) of ALRS Proposition 4.2.13 become (1/p, ∞) and (0, 1); they are not exchanged. Part (1) read in that radius would claim that X^Δ → `(D^×_{FF,X^⋄})^dR` is an isomorphism over (1, ∞), which contains the radii p, p², … of the inverse Frobenius translates of X^HT, where X^Δ is not the de Rham stack of the disc (ALRS Remark 4.2.12, p. 63, ALRS line 3291): for X = GSpec(ℚ_p) the isomorphism would hold over κ ∈ (0, 1) and extend by Frobenius, which multiplies κ by p, over κ ∈ (0, p) (that is, over (1/p, ∞) in the radius of 𝒳_T), and identify Div¹ with Q_p^HK on coequalizers, whereas by the first Check of 8.6 the map Div¹ → Q_p^HK is a base change of A¹/G_m → `A^{1,dR}/G_m^dR`, which is not an isomorphism over the origin, the image of the Hodge–Tate locus.

### 8.6 The p-adic twistor stack between the Fargues–Fontaine curve and the Hyodo–Kato stack

Construct the factorization `FF_{X^⋄} → X^{Div¹} → FF^dR_{X^⋄}` = X^HK of the natural map from the relative Fargues–Fontaine curve to its de Rham stack (ALRS (4.3.1), p. 65, ALRS line 3392). Prove that restriction of degree-one divisors on FF_A to GSpec(A) and `FF_{A^u}` gives a commutative square `X^{Div¹}` → X^HK over X^cone → (X^cone)^dR, cartesian when X is †-cohesive (ALRS Proposition 4.3.1, p. 65, ALRS line 3396), and that `X^{Div¹}` → X^HK is an isomorphism after base change to Div¹ ∖ Q_p^HT ≅ `Div^{1,dR}` ∖ GSpec(ℚ_p) (ALRS Proposition 4.3.2, p. 65, ALRS line 3406).

A proof route: Both statements follow from the pushout FF_T = `FF_{T^u}` `⊔_{T^u}` T of thickened Fargues–Fontaine curves for T = GSpec(A) nilperfectoid; away from the Hodge–Tate locus `FF_{A^u♭}` → FF_A is an isomorphism.

*Needs:* §8.4; §8.5; §7.5; §6.3.

The API has the following laws.

- For every Gelfand stack X the composite `FF_{X^⋄} → X^{Div¹}` → X^HK is the map from `FF_{X^⋄}` to its de Rham stack `FF^dR_{X^⋄}` = X^HK.
- For every Gelfand stack X the square `X^{Div¹}` → X^HK over X^cone → (X^cone)^dR commutes, and it is cartesian when X is †-cohesive.
- For every Gelfand stack X, `X^{Div¹}` → X^HK is an isomorphism over Div¹ ∖ Q_p^HT ≅ `Div^{1,dR}` ∖ GSpec(ℚ_p).

**Checks.**

- For X = GSpec(ℚ_p) the square reads Div¹ = A¹/G_m `×_{A^{1,dR}/G_m^dR}` Q_p^HK (ALRS Proposition 4.8.1(1)).
- Over the complement of the Hodge–Tate locus, vector bundles on `X^{Div¹}` are vector bundles on X^HK, i.e. analytic D-modules on `FF_{X^⋄}` ∖ X^⋄.
- For X = ∅ all four corners are empty.

### 8.7 Descent for the analytic prismatization along †-formally smooth maps

Prove: (1) if f: Y → X is †-formally étale locally †-formally smooth, then f^Δ, `f^{Div¹~}` and `f^{Div¹}` are weakly †-formally smooth; (2) if moreover f is an arc-cover they are epimorphisms; (3) if f is †-formally smooth and Y, X are †-cohesive they are †-formally smooth (ALRS Theorem 4.7.1, p. 78, ALRS line 4040). In particular the prismatization, its perfection and the twistor stack satisfy descent along rigid étale covers and Tate-rational covers of smooth rigid spaces.

A proof route: On a degree-one divisor D ⊆ 𝒳_T with reduction D̄, †-formal smoothness gives an epimorphism Y(D) → Y(D̄) `×_{X(D̄)}` X(D); sheafifying gives weak †-formal smoothness, and for †-cohesive source and target no sheafification is needed; reduce to the †-formally smooth case by ALRS Lemma 4.2.5 (8.3). For (2), `f^{Δ,dR}` is an epimorphism since f is an arc-cover, and ALRS Lemma 2.6.5 (4.1) applies.

*Needs:* §8.3; §4.1; §4.2.

**Checks.**

- A rigid étale cover of a smooth rigid space by charts étale over G_m^d is †-formally étale (4.2) and an arc-cover, so the twistor stacks of the charts cover `X^{Div¹}`.
- An open immersion that is not surjective is †-formally étale but not an arc-cover, and the induced map of prismatizations is not an epimorphism.
- The identity satisfies all hypotheses and its induced maps are isomorphisms.

### Examples

For X = GSpec(ℚ_p), Q_p^Δ is the moduli of degree-one divisors. The cyclotomic prism (X_cyc, [p]_q) and the Breuil–Kisin prism `(lim_{x↦x^p} D^{<1} ∖ {0}, X − p)` give cartesian squares with Q_p^HT whose upper-left corners are `GSpec(ℚ_p(μ_{p^∞}))` and `GSpec(ℚ_p(p^{1/p^∞}))`. For a perfectoid space Y over ℚ_p, Y^HT ≅ Y, while `Y^{Div¹}` ≠ FF_Y.

### Dependencies

Layers 3–7; RelativeFarguesFontaine §3.2, §4.7; FarguesFontaineDiamonds §F4; VectorBundlesAndIsocrystals Layer 0.

## Layer 9: Hodge–Tate geometry, Faltings' extension and explicit computations

This layer analyses the analytic Hodge–Tate stack as a gerbe for the overconvergent Breuil–Kisin twisted tangent bundle, absolutely and over a perfect prism; proves descent of Hodge–Tate stacks along quasi-syntomic covers; describes the formal and overconvergent Hodge–Tate stacks through cones; defines Faltings' extension through the cone and identifies it with the classical extension; computes the prismatization of ℚ_p; constructs the Breuil–Kisin twist; and constructs the prismatic logarithm with the resulting presentation of the perfect prismatization of G_m.

### 9.1 The Hodge–Tate stack as a gerbe

Let `I_{Div¹}` be the ideal of the Hodge–Tate divisor Q_p^HT → Div¹ and I its restriction to Q_p^HT (ALRS Definition 4.4.1, p. 65, ALRS line 3413). Prove that for a nilperfectoid A, a degree-one divisor D → FF_T and a factorization T → D → FF_T through the Hodge–Tate locus, O(D) → A is a square-zero extension with ideal Nil†(A) ⊗_A I_A[1], classified by the derivation d̃: A → A ⊕ Nil†(A) ⊗ I_A[2] obtained from the derivation of A^u attached to B⁺_dR(A^u)/ξ² → A^u through the connecting map of I_A[1] → `I_{A^u}[1]` → Nil†(A) ⊗ I_A[2] (ALRS Lemma 4.4.2, p. 65, ALRS line 3417); thus G_a^HT is a square-zero extension of G_a × Q_p^HT by G_a^†{1}[1]. Prove that for a Gelfand stack X there is a natural map π_X: X^HT → X × Q_p^HT through X^cone_s; that for †-cohesive X with a cotangent complex the square X^HT → X^dR over X^cone_s → (X^cone_s)^dR is cartesian and π_X is a principal homogeneous space for the overconvergent shifted twisted tangent complex (T_X[1]{1})^† of 4.8, formed for X × Q_p^HT → Q_p^HT and the pullback of I; and that, still for †-cohesive X with a cotangent complex, π_X is the fibre of a derivation d̃_X: X × Q_p^HT → (T_X{1}[2])^†, so that if X is moreover formally smooth with T_X a vector bundle, π_X is an epimorphism and a gerbe banded by T_X^†{1}, where {1} is the twist by I (ALRS Proposition 4.4.3, p. 66, ALRS line 3481).

A proof route: Base change ALRS Proposition 4.3.1 (8.6) along BG_m → A¹/G_m and Div¹ → A¹/G_m. The pushout FF_T = `FF_{T^u}` `⊔_{T^u}` T gives O(D) = A `×_{A^u}` `(A^u ⊕ I_{A^u}[1])` over the Hodge–Tate point; †-cohesiveness of X evaluates X on this square, and ALRS Lemma 2.8.6 (5.1) identifies X^cone_s = T_X[1]{1}, whose map to its de Rham stack has fibre (T_X[1]{1})^†.

*Needs:* §8.6; §5.1; §5.2; §4.8; §4.4; PadicHodgeTheory §2.2.

**Checks.**

- For X = GSpec(ℚ_p), T_X = 0 and π_X is the identity of Q_p^HT.
- For X = A¹, X^HT → A¹ × Q_p^HT is a gerbe banded by G_a^†{1}.
- For Y = GSpec(C_p), `L_{C_p/ℚ_p}` = C_p(1)[1] (4.5) gives T_Y[1]{1} = O, the twists cancelling; Y × Q_p^HT is a G_m^† ≅ G_a^†-gerbe over Y, and π_Y makes Y^HT a torsor over it under (T_Y[1]{1})^† = G_a^†, which trivializes the gerbe, so Y^HT ≅ Y as in 8.3.
- For X = A¹ the band restricted over the origin is G_a^†{1} = G_a^† ⊗ I on Q_p^HT, whose arithmetic Sen weight is 1 because I ≅ Ô(1) (9.7, 11.2); the untwisted band G_a^† has Sen weight 0, so the twist {1} is detected by the Sen operator.

### 9.2 Relative twistor and Hodge–Tate stacks over a perfect prism

Let (S, 𝒳, D) be a perfect analytic prism and X → D a †-cohesive map of Gelfand stacks, and define the relative Hyodo–Kato stack `X^{HK/𝒳} = (X^{Div¹/𝒳})^{dR/(𝒳/φ^ℤ)}` as the relative de Rham stack over 𝒳/φ^ℤ of the relative p-adic twistor stack `X^{Div¹/𝒳}` of 8.2 (ALRS p. 7, ALRS line 350). Prove that in the diagram `X^{Div¹/𝒳} → X^{HK/𝒳}` → X^HK over `X^{cone/(D,𝒳/φ^ℤ)} → (X^{cone/(D,𝒳/φ^ℤ)})^{dR/(𝒳/φ^ℤ)} → (X^{cone/(D,𝒳/φ^ℤ)})^dR` both squares are cartesian, and that if X admits a cotangent complex then `X^{HT/D}` = X `×_{(T_{X/D}{1}[2])^†}` X along 0 and the derivation d̃_X, so that for X → D formally smooth with `T_{X/D}` a vector bundle, `T^†_{X/D}` its overconvergent neighbourhood of the zero section, `X^{HT/D}` → X is a gerbe banded by `T^†_{X/D}{1}`, {1} being the twist by the ideal of D ⊆ 𝒳 (ALRS Proposition 4.4.4, p. 68, ALRS line 3535). For X → D formally smooth with `T_{X/D}` a vector bundle prove that the pushout of `X^{HT/D}` along `BT^†_{X/D}{1} → BT_{X/D}{1}` is the stack of square-zero lifts of X to the first infinitesimal neighbourhood D(1) (ALRS Remark 4.4.5, p. 68, ALRS line 3552).

A proof route: Identical to 9.1, using the relative cone over (D, 𝒳/φ^ℤ) of ALRS Definition 2.8.9 and ALRS Proposition 2.8.15 (5.2). The hypotheses of 5.2 hold for X → D → 𝒳/φ^ℤ → GSpec(ℚ_p) once X → D has a cotangent complex: X → D is infinitesimally cohesive because it is †-cohesive (4.6), and D, 𝒳 and 𝒳/φ^ℤ are Berkovich spaces (7.1; ALRS Remark 4.1.2(2), ALRS line 2983), whose maps are infinitesimally cohesive with cotangent complexes (4.7).

*Needs:* §9.1; §5.2; §8.2; §8.6; §7.1; §4.4; §4.6; §4.7; §3.1.

The API has the following laws.

- `X^{HK/𝒳}` = X^HK `×_{D^HK}` 𝒳/φ^ℤ, because de Rham stacks commute with fibre products, `(X^{Div¹})^dR` = X^HK (ALRS p. 6, ALRS line 308) and (𝒳/φ^ℤ)^dR = D^HK, both being the de Rham stack of FF^⋄_S (7.1, D^⋄ being an untilt of S).
- `X^{HK/𝒳}` → 𝒳/φ^ℤ is †-formally étale, as every relative de Rham stack is (4.1), and `X^{Div¹/𝒳} → X^{HK/𝒳}` is the unit of the relative de Rham stack.

**Checks.**

- For X = D, `T_{X/D}` = 0 and `X^{HT/D}` = D.
- For X = D every corner of the diagram is computed: `D^{Div¹/𝒳}` = 𝒳/φ^ℤ (8.2), `D^{HK/𝒳}` = 𝒳/φ^ℤ `×_{(𝒳/φ^ℤ)^dR}` (𝒳/φ^ℤ)^dR = 𝒳/φ^ℤ, `D^{cone/(D,𝒳/φ^ℤ)}` = D^cone `×_{D^cone}` 𝒳/φ^ℤ = 𝒳/φ^ℤ with relative de Rham stack 𝒳/φ^ℤ and absolute one (𝒳/φ^ℤ)^dR, and D^HK = (𝒳/φ^ℤ)^dR; the left square consists of identities and the right square is cartesian. So the relative Hyodo–Kato stack `D^{HK/𝒳}` is the thickened curve 𝒳/φ^ℤ itself, whereas the absolute D^HK is its de Rham stack: the two differ already for X = D.
- For a smooth curve X over a perfectoid field C with prism given by `FF_{C♭}` and the untilt C, `X^{HT/C}` is a gerbe banded by T^†_X{1}, and its pushout to T_X{1} is the gerbe of lifts of X to B⁺_dR(C)/ξ².
- The relative Hodge–Tate gerbe need not split, in contrast with the archimedean Hodge stack (ALRS Remark 1.14); the two are distinguished by the twist {1}.
- For X = D × BG_a the map X → D is formally smooth, `L_{X/D}` = O[−1] being dual to the connective perfect complex O[1], but `T_{X/D}` = O[1] is not a vector bundle. The cartesian square gives `X^{HT/D}` = X `×_{(O{1}[3])^†}` X, a torsor under the loop object (O{1}[2])^† = B²G_a^†{1}, not a gerbe banded by a group; the vector-bundle hypothesis excludes it.

### 9.3 Descent of Hodge–Tate stacks along quasi-syntomic covers

Prove that if f: Y → X is an infinitesimally cohesive epimorphism of Gelfand stacks with a cotangent complex `L_{Y/X}` perfect of amplitude [−1, 0], then f^HT: Y^HT → X^HT is an epimorphism (ALRS Theorem 4.7.2, p. 78, ALRS line 4062). In particular Hodge–Tate stacks satisfy descent along formally étale !-covers such as Tate-rational covers, which propagates 9.1 from smooth affinoids to smooth rigid spaces (ALRS footnote 27, p. 69, ALRS line 3631).

A proof route: A point GSpec(G_a^HT(A)) → X with G_a^HT(A) = A `×_{A ⊕ Nil†(A){1}[2]}` A lifts along f !-locally: infinitesimal cohesiveness reduces to lifting along the trivial and twisted derivations, and the obstruction lies in a group that vanishes !-locally because of the amplitude bound.

*Needs:* §9.1; §4.6; §4.7.

**Checks.**

- A Tate-rational cover of a smooth affinoid has L = 0 and is an epimorphism, so the Hodge–Tate stacks of its pieces cover X^HT.
- The zero section 0 → A¹ has L = ℚ_p[1] of amplitude [−1, 0] but is not an epimorphism; its Hodge–Tate map misses the points of A¹^HT over A¹ ∖ {0}.
- The identity has L = 0 and induces an isomorphism.

### 9.4 Formal and overconvergent Hodge–Tate stacks

Define the overconvergent and formal Hodge–Tate stacks `X^{†-HT} = X^{Div¹}` `×_{A¹/G_m}` `A^{1,†}/G_m` and `X^{HT^} = X^{Div¹}` `×_{A¹/G_m}` Â¹/G_m, and, for a perfect prism (S, 𝒳, D) with D^∧ ⊆ D^† ⊆ 𝒳 the formal completion and the overconvergent neighbourhood 𝒳^†_D of D and for X over D, the relative versions `X^{†-HT/D^†} = X^{Div¹/𝒳}` `×_{𝒳/φ^ℤ}` D^† and `X^{HT^/D^∧} = X^{Div¹/𝒳}` `×_{𝒳/φ^ℤ}` D^∧ (ALRS Definition 4.5.1, p. 69, ALRS line 3602). Prove that for †-cohesive X the squares relating `X^{HT^}`, `X^{†-HT}`, X^dR, `X^{cone^}`, `X^{†-cone}` and (X^cone_s)^dR are cartesian, and that for formally smooth X with a cotangent complex X^dR → (X^cone_s)^dR = (X/T_X(−1) ⋊ G_m)^dR is a (T_X(−1) ⋊ G_m)^dR-torsor, hence so are `X^{HT^} → X^{cone^}` and `X^{†-HT} → X^{†-cone}` (ALRS Proposition 4.5.2, p. 69, ALRS line 3614); prove the relative version: for a perfect prism (S, 𝒳, D) and X → D †-cohesive, the squares relating `X^{HT^/D^∧}`, `X^{†-HT/D^†}`, `X^{dR/D^†}` and X^dR to the formal and overconvergent relative cones `X^{cone^/(D,𝒳/φ^ℤ)}`, `X^{†-cone/(D,𝒳/φ^ℤ)}` and to the de Rham stacks of `X^{cone/(D,𝒳/φ^ℤ)}_s` relative to D^† and absolute are cartesian, and if X → D is moreover formally smooth, X^dR → `(X^{cone/(D,𝒳/φ^ℤ)}_s)^dR` is a `T_{X/D}{1}^dR`-torsor, hence so are the other vertical maps, {1} being the twist by the ideal of D (ALRS Proposition 4.5.3, pp. 69–70, ALRS line 3630). X is any Gelfand stack with these properties and need not be a Berkovich space.

A proof route: Base change 9.1 along Â¹/G_m → `A^{1,†}/G_m` → A¹/G_m, using (Â¹/G_m)^dR = `(A^{1,†}/G_m)^dR` = BG_m^dR, and base change 9.2 along D^∧ → D^† → 𝒳/φ^ℤ for the relative squares. For the relative torsor, the hypotheses of 5.2 hold for X → D → 𝒳/φ^ℤ → GSpec(ℚ_p): X → D is infinitesimally cohesive because it is †-cohesive (4.6) and has a cotangent complex because it is formally smooth; 𝒳 is a Berkovich space (7.1), so are D (ALRS Remark 4.1.2(2), ALRS line 2983) and 𝒳/φ^ℤ, on which Frobenius acts totally discontinuously (7.1), and maps of Berkovich spaces are infinitesimally cohesive with cotangent complexes (4.7); by transitivity (4.6) so is X → GSpec(ℚ_p) (ALRS line 3645). Then 5.2 makes the special fibre of the relative cone the `BT_{X/D}{1}`-torsor of square-zero lifts of X to D(1), and the section through the first infinitesimal neighbourhood of X^⋄ → `FF_{X^⋄}` trivializes its perfectoidization (ALRS Proposition 2.8.15, ALRS line 1805; ALRS line 3648).

*Needs:* §9.1; §9.2; §8.1; §8.2; §7.1; §5.1; §5.2; §4.4; §4.6; §4.7; §4.8; §3.1.

The API has the following laws.

- For †-cohesive X, `X^{†-HT} = X^{†-cone}` `×_{(X^cone_s)^dR}` X^dR and `X^{HT^} = X^{cone^}` `×_{(X^cone_s)^dR}` X^dR, using `(X^{cone^})^dR = (X^{†-cone})^dR` = (X^cone_s)^dR.
- For formally smooth X with a cotangent complex, X^dR → (X^cone_s)^dR is a (T_X(−1) ⋊ G_m)^dR-torsor, G_m acting with weight −1 on the tangent space, and so are `X^{HT^} → X^{cone^}` and `X^{†-HT} → X^{†-cone}`.
- Over a perfect prism (S, 𝒳, D) and a †-cohesive formally smooth X → D, the relative formal and overconvergent Hodge–Tate stacks are `T_{X/D}{1}^dR`-torsors over the corresponding relative cones, {1} being the twist by the ideal of D.

**Checks.**

- For X = GSpec(ℚ_p), `Q_p^{HT^} = Spf(K_∞[[t]])/ℤ_p^{×,la}` with K_∞ = `ℚ_p(μ_{p^∞})`, because (B⁺_dR(ℚ_p^cyc)/t^n)^la = K_∞[t]/t^n (ALRS §6.7, line 9169).
- The formal and overconvergent Hodge–Tate stacks differ: the formal one sees only nilpotent thickenings of the divisor, the overconvergent one its †-neighbourhood; for non-Berkovich X only the formal statement of 9.6 holds.
- For X = ∅ all stacks are empty.
- For X = D over a perfect prism the relative versions are `D^{†-HT/D^†}` = 𝒳/φ^ℤ `×_{𝒳/φ^ℤ}` D^† = D^† and `D^{HT^/D^∧}` = D^∧, since `D^{Div¹/𝒳}` = 𝒳/φ^ℤ (8.2); restricting further to D gives `D^{HT/D}` = D, as in 9.2.
- The relative torsor statement is not confined to Berkovich spaces. For X = D × BG_m over a perfect prism, X → D is †-cohesive (base change of the Tannakian BG_m → GSpec(ℚ_p), 4.4) and formally smooth with `L_{X/D}` = O[−1] (4.8), but X is not a Berkovich space; the statement applies, with `T_{X/D}` = BG_a and `T_{X/D}{1}^dR` = BG_a^dR{1}. Its input from 5.2 is computed directly: cones commute with limits (5.1) and BG_m(R ⊕ I[1]) = BG_m(R) × B²I, so `X^{cone/(D,𝒳/φ^ℤ)}_s` = X × B²G_a{1}, the trivial principal homogeneous space for `T_{X/D}[1]` ⊗ N*`_{D/(𝒳/φ^ℤ)}` = B²G_a{1}, split by the lift D(1) × BG_m of X; and BG_a^dR{1} is the loop group of its de Rham fibre B²G_a^dR{1}, as a torsor structure on X^dR → `(X^{cone/(D,𝒳/φ^ℤ)}_s)^dR` requires.

### 9.5 Faltings' extension through the cone and its agreement with the classical extension

For a smooth rigid space X over ℚ_p define Faltings' extension FE_X as the extension 0 → `O_{X̂^⋄}{1}` → FE_X → Ω¹_X ⊗ `O_{X̂^⋄}` → 0 on X̂^⋄ whose T_X{1}-torsor is X̂^⋄ `×_{X^cone_s}` (X × BG_m), for the map X × BG_m → X^cone_s of ALRS Lemma 2.8.6 and X̂^⋄ → X^HT → X^cone_s; for a smoothoid X over an affinoid perfectoid D, that is, an analytic adic space X with a smooth morphism X → D, locally étale over a relative polydisc over D (AdicEtaleGeometry §A2.4; the smoothoid spaces of Heuer, ALRS line 3667), with a lift X̃ to B⁺_dR(D)/ξ², define `FE^{X̃}_X` through X̂^⋄ `×_{X^{cone/(D,FF_D)}_s}` X (ALRS Definition 4.6.1, p. 70, ALRS line 3674). Write `FF^∧_{X^⋄}` for the formal completion of the relative Fargues–Fontaine curve `FF_{X^⋄}` (6.2) along the untilt divisor X̂^⋄ → `FF_{X^⋄}` (ALRS Lemma 4.6.4, p. 73, ALRS line 3822). Prove that X̂^⋄ → `FF^∧_{X^⋄}` `×_{X^dR}` X is, locally on the pro-étale site `X_proét^{ω₁}`, a regular closed immersion with formal completion Spf(OB⁺_dR,X) (ALRS Lemma 4.6.4, p. 73, ALRS line 3819), so that `L_{X̂^⋄/X}` ≅ gr¹(OB⁺_dR,X)[1] (ALRS Remark 4.6.5, p. 74, ALRS line 3876); that, writing `Spf^{≥0}` for spectra of ℕ-filtrations (ALRS Construction 4.6.6, p. 75, ALRS line 3891), `Spf^{≥0}(B⁺_dR,X)` is the algebraic formal cone of X̂^⋄ and `Spf^{≥0}(B⁺_dR,X)` `×_{X^{cone-alg^}}` (X × Â¹/G_m^alg) = `Spf^{≥0}(OB⁺_dR,X)` (ALRS Proposition 4.6.8, p. 75, ALRS line 3920); and that X̂^⋄ `×_{X^cone_s}` (X × BG_m) ≅ (AnSpec(OC_X))^Gelf, so that FE_X is the classical Faltings' extension 0 → Ô_X(1) → gr¹OB⁺_dR,X → Ô_X ⊗ Ω¹_X → 0 of PadicHodgeTheory §2.3 (ALRS Corollary 4.6.10, p. 76, ALRS line 3966; Sch13 Corollary 6.14, p. 39, Sch13 line 1787).

A proof route: For Lemma 4.6.4 reduce, on a toric chart X → T^d with perfectoid cover X_∞, to the regular immersion X → X `×_{X^dR}` X = (X ⊂ X × X)^† and identify the regular sequence (log[ε], [T_i♭] ⊗ 1 − 1 ⊗ T_i). For ALRS Proposition 4.6.8 use that formally étale maps have trivial algebraic cones (ALRS Remark 2.9.7(1), ALRS line 2062) and that the cone of a Zariski closed immersion is the spectrum of its adic filtration (ALRS Remark 2.9.7(2)). ALRS Corollary 4.6.10 is the base change of (4.6.5) along BG_m^alg → Â¹/G_m^alg, using gr^•OB_dR,X = ⊕_i gr⁰OB_dR,X(i) and gr⁰OB_dR,X = OC_X, followed by Gelfandification.

*Needs:* Mathlib `WittVector.fontaineTheta`; Mathlib `BDeRhamPlus`; §9.1; §6.2; §5.1; §5.3; §4.5; §2.1; PadicHodgeTheory §2.2; PadicHodgeTheory §2.3; AInfCohomology §AI.3.1; AdicEtaleGeometry §A1.12; AdicEtaleGeometry §A2.4; PerfectoidSpaces §P7.16; AnalyticStacks §1.6, §3.8; AnalyticStacks §6.5.

The API has the following laws.

- FE_X is an extension 0 → `O_{X̂^⋄}{1}` → FE_X → Ω¹_X ⊗ `O_{X̂^⋄}` → 0 on X̂^⋄ whose T_X{1}-torsor is X̂^⋄ `×_{X^cone_s}` (X × BG_m).
- X̂^⋄ → `FF^∧_{X^⋄}` `×_{X^dR}` X is, locally on `X_proét^{ω₁}`, a regular closed immersion with formal completion Spf(OB⁺_dR,X), and `L_{X̂^⋄/X}` ≅ gr¹(OB⁺_dR,X)[1].
- `Spf^{≥0}(B⁺_dR,X)` is the algebraic formal cone of X̂^⋄, and its base change along X × Â¹/G_m^alg → `X^{cone-alg^}` is `Spf^{≥0}(OB⁺_dR,X)`.
- X̂^⋄ `×_{X^cone_s}` (X × BG_m) ≅ (AnSpec(OC_X))^Gelf, and FE_X is the classical Faltings' extension 0 → Ô_X(1) → gr¹OB⁺_dR,X → Ô_X ⊗ Ω¹_X → 0 of PadicHodgeTheory §2.3.

**Checks.**

- For X = GSpec(ℚ_p) one has Ω¹ = 0 and FE_X = `O_{X̂^⋄}{1}`.
- For X = G_m with the toric cover `T^{1/p^∞}`, the class log([T♭]/T) in gr¹OB⁺_dR lifts dT/T and the generator γ of ℤ_p(1) moves it by t = log[ε]; the cocycle γ ↦ t is a nonzero class in H¹(ℤ_p(1), Ĉ(1)), so FE_X is a non-split Galois-equivariant extension.
- The subobject is O{1} = Ô(1), not Ô: the cocycle γ ↦ t takes values in the Tate twist, and an extension of Ô ⊗ Ω¹ by Ô would have an equivariant splitting on the toric cover.
- For X = GSpec(ℚ_p), `L_{X̂^⋄/X}` = gr¹(B⁺_dR(C_p))[1] = C_p(1)[1], matching 4.5.

### 9.6 The formal Hodge–Tate squares

Prove that for a smooth rigid space X over ℚ_p there is a cartesian square `X^{HT^}` → X^dR over `X^{cone^}` → (X^cone_s)^dR = (X^cone)^dR `×_{(A¹/G_m)^dR}` BG_m^dR, where the lower right term is the classifying stack `B_{X^dR × BG_m^dR}T_X{1}^dR`, the map X^dR → BG_m^dR is the Tate twist, and the T_X{1}^⋄-torsor on X^⋄ given by the right vertical map is Faltings' extension; if X is a Berkovich space the formal completion may be replaced by the overconvergent neighbourhood (ALRS Corollary 4.6.11, p. 77, ALRS line 3985). Prove the relative version for a smoothoid X over a perfectoid D with a smooth lift X̃ to B⁺_dR(D)/t², with `FE^{X̃}_X` and relative de Rham stacks over D^∧ (or D^†) (ALRS Corollary 4.6.12, p. 77, ALRS line 3999).

A proof route: X^cone_s → `X^{cone^}` is an epimorphism, so it suffices to prove the statement for Hodge–Tate stacks; by descent along formally étale !-covers (9.3) reduce to affinoid, hence †-cohesive, X, where it follows from 9.4 and ALRS Definition 4.6.1.

*Needs:* §9.4; §9.5; §9.3.

**Checks.**

- For X = GSpec(ℚ_p), T_X = 0 and the square reads `Q_p^{HT^}` = Â¹/G_m `×_{BG_m^dR}` GSpec(ℚ_p), the map GSpec(ℚ_p) → BG_m^dR being the Tate twist (9.7).
- For X = G_m the T_X{1}^⋄-torsor is the torsor of lifts of dT/T in gr¹OB⁺_dR, the class computed in 9.5.
- For a smooth rigid space which is not a Berkovich space (not partially proper and not affinoid) only the formal version is asserted.

### 9.7 The analytic prismatization of ℚ_p

Let 1 + `D̃^{<1}_{ℚ_p} = lim_{x↦x^p}(1 + D^{<1}_{ℚ_p})` with coordinate q and Frobenius q ↦ q^p, and let (S_cyc, X_cyc, I) be the cyclotomic prism with divisor ([p]_q). Prove: (1) the square Q_p^Δ → `Q_p^{Δ,dR}` over μ_BK: A¹/G_m → `A^{1,dR}/G_m^dR` is cartesian; (2) the square Q_p^HT → GSpec(ℚ_p) over ι: BG_m → BG_m^dR is cartesian, so `π_{ℚ_p}`: Q_p^HT → GSpec(ℚ_p) is a BG_m^†-torsor, a gerbe banded by G_m^†; (3) along X_cyc → Q_p^Δ, I_BK pulls back to (log(q)/(q − 1)), and the ideal `I_{Div¹}` of the Hodge–Tate divisor of Div¹ (9.1) pulls back along X_cyc → Div¹~ → Div¹ to (log q), whereas I_Δ pulls back along X_cyc → Q_p^Δ to ([p]_q); (4) X_cyc → Div¹~ induces Div¹~ ≅ `X_cyc/ℤ_p^{×,la}` with a·(q, `q^{1/p}`, …) = (q^a, `q^{a/p}`, …), hence Div¹ ≅ `X_cyc/ℚ_p^{×,la}` and Q_p^HT ≅ `GSpec(ℚ_p(μ_{p^∞}))/ℤ_p^{×,la}`, the action factoring through the Galois action of `ℤ_p^{×,sm}` via the cyclotomic character; and the cartesian square of 8.6 becomes `((1 + D̃^{<1}) ∖ {1})/ℚ_p^{×,la}` over A¹/G_m via log (ALRS Proposition 4.8.1, p. 79, ALRS line 4112). Prove that ι^dR: GSpec(ℚ_p) → BG_m^dR is classified by the Tate twist Ô ⊗ ℚ_p(1) ≅ gr¹B⁺_dR on Spa(ℚ_p)_proét (ALRS §4.8, p. 81, ALRS line 4202), and that `D^×_{FF,ℚ_p^cyc} → (1 + D̃^{<1}_{ℚ_p})` ∖ {1}, q ↦ `[ε^{1/p}]`, is Γ-equivariant through χ and sends the prism ideal to the ideal of the untilt ℚ_p^cyc (ALRS Example 4.8.4, p. 81, ALRS line 4206).

A proof route: (1)–(2) are ALRS Proposition 4.3.1 for X = GSpec(ℚ_p). For (3), log(q)/(q − 1) has simple zeros exactly at the zeros of `[p]_{q^{p^n}}`, n ≥ 0; the pullback of `I_{Div¹}` to Div¹~ is the perfection `⊗_{n∈ℤ}` φ^n(I_Δ) of I_BK (8.4), with the Frobenius structure of an ideal sheaf, which permutes the factors, and on X_cyc it is the limit of `(log(q)/(q^{p^{-n}} − 1))`, with zeros those of log q. For (4) use Q_p^HK = `(1 + D̃^{<1})^dR` and that log is †-formally étale.

*Needs:* §8.6; §9.1; §8.4; §7.6; §3.4.

**Checks.**

- Q_p^HT → GSpec(ℚ_p) is a gerbe banded by G_m^† ≅ G_a^† (via exp and log on the overconvergent neighbourhood of 1); compare AHLB §1.3 and §2.1, where the integral Hodge–Tate stack of O_K is the classifying stack of a group G_π, isomorphic to G_m^♯ when e = E′(π) is a unit and to G_a^♯ when e lies in the maximal ideal, so that it is BG_m^♯ for ℤ_p, where π = p and e = 1 (AHLB line 214; AHLB line 368; AHLB line 375), and PrismaticCohomologyPartII §4.12, where WCart^HT ≅ Spf ℤ_p × BG_m^♯: the rational analytic theory replaces G_m^♯ by G_m^†.
- An element a ∈ ℤ_p^× acts on X_cyc by `q^{1/p^n} ↦ q^{a/p^n}`; the element p of ℚ_p^× acts by the Frobenius q ↦ q^p.
- The restriction I of `I_{Div¹}` to Q_p^HT (9.1) is Ĉ(1); its arithmetic Sen operator (11.2) is multiplication by 1, matching the convention `Θ_{O{n}}` = n of PrismaticCohomologyPartII §4.13 and HT(χ_p) = +1 of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2.
- The upper-left corner of the cyclotomic square is the uncompleted `GSpec(ℚ_p(μ_{p^∞}))`, not GSpec(ℚ_p^cyc); the completed field gives the perfectoid Hodge–Tate stack of 8.3 instead.

### 9.8 The Breuil–Kisin twist

Let `O_{Q_p^Δ}⟨1⟩` be the pullback along Q_p^Δ → `D^{×,dR}_{FF,Marc(ℚ_p)}` of the line bundle of the isocrystal `(ℚ_p, p^{-1}φ)`, a φ-equivariant line bundle. Define the Breuil–Kisin twist `O_{Q_p^Δ}{1}` = I_BK ⊗ O⟨1⟩ with its Frobenius φ^*I_BK ≅ `I_Δ^{-1}` I_BK, and O{n} = `O{1}^{⊗n}` (ALRS Construction 4.9.1, p. 82, ALRS line 4233). Construct the perfected twist `O_{Div¹~}{1}` as the tensor product of the pullback of `I_{Div¹}` to Div¹~ (9.7) with the pullback of O⟨1⟩: after forgetting Frobenius it is `⊗_{n∈ℤ}` φ^n(I_Δ), the ideal sheaf of `⊔_{n∈ℤ}` φ^n(Q_p^HT), and its Frobenius structure is `p^{-1}` times the one of that ideal sheaf, which permutes the factors (ALRS Remark 4.9.3(3)–(4), pp. 82–83, ALRS line 4283; ALRS Remark 4.10.7, p. 87, ALRS line 4508); it descends to `O_{Div¹}{1} = I_{Div¹}⟨1⟩` on Div¹; prove that its pullback along `FF_{Q_p^⋄}` → Div¹ is the Tate twist ℚ_p(1) as a pro-étale local system, whereas `O_{Div¹}⟨1⟩` pulls back to the line bundle of Frobenius slope one (ALRS Remark 4.9.3, p. 82, ALRS line 4278). Compare with the integral Breuil–Kisin twist of PrismaticCohomologyPartII §§3.8–3.9, built for transversal prisms as a limit of I_k/I_k² along transition maps divided by p (§3.8) and extended to all prisms by base change (§3.9), the division by p corresponding rationally to the twist by O⟨1⟩ (ALRS Remark 4.9.2, p. 82, ALRS line 4239).

*Needs:* §8.4; §9.7; §7.4; §6.3; VectorBundlesAndIsocrystals Layer 6.

The API has the following laws.

- O{1} carries the φ-structure φ^*O{1} ≅ `I_Δ^{-1}` ⊗ O{1} obtained from φ^*I_BK ≅ `I_Δ^{-1}I_BK` and the slope twist of O⟨1⟩.
- The restriction of O{1} to Q_p^HT is the conormal ideal I ≅ Ô(1) of the Hodge–Tate divisor.
- On Div¹~ the perfected twist `O_{Div¹~}{1}` is the pullback of `I_{Div¹}` tensored with the pullback of O⟨1⟩; its Frobenius structure is an isomorphism φ^*`O_{Div¹~}{1}` ≅ `O_{Div¹~}{1}`, and its descent to Div¹ is `O_{Div¹}{1}` = `I_{Div¹}` ⊗ O⟨1⟩.
- The pullback of `O_{Div¹}{1}` to `FF_{Q_p^⋄}` is the Tate twist O ⊗ ℚ_p(1), a slope-zero line bundle; the pullback of `O_{Div¹}⟨1⟩` has slope one.
- O{m} ⊗ O{n} ≅ O{m + n} and O{0} = O, compatibly with Frobenius structures.

**Checks.**

- On the cyclotomic prism, e = (log q/(q − 1)) ⊗ e⟨1⟩ generates O{1}, and φ(log q/(q − 1)) = p·log q/(q^p − 1) = `p·[p]_q^{-1}·log` q/(q − 1), while φ(e⟨1⟩) = `p^{-1}e⟨1⟩`; hence φ(e) = `[p]_q^{-1}·e`, matching φ(e_A) = `[p]_q^{-1}e_A` for the generator e_A of the q-de Rham prism in PrismaticCohomologyPartII §3.11. This identity holds for every ℚ_p^×-multiple of e, so it fixes the generator only up to a φ-invariant scalar; the logarithm of 9.9 fixes the scalar.
- Without the factor O⟨1⟩ the generator would satisfy φ(e′) = `p·[p]_q^{-1}·e′`, off by p from the integral normalization.
- O{0} = O with the identity Frobenius structure.
- Away from the Hodge–Tate locus I is trivial and O{1} ≅ O⟨1⟩, matching the dualizing complexes of 12.2 on Div¹ ∖ Q_p^HT ≅ `Div^{1,dR}` ∖ GSpec(ℚ_p).
- On X_cyc the pullback of `I_{Div¹}` is generated by log q, and φ(log q) = p·log q: with the Frobenius structure of an ideal sheaf, which permutes the factors, `⊗_{n∈ℤ}` φ^n(I_Δ) descends to `I_{Div¹}`, whose pullback to `FF_{Q_p^⋄}` is the ideal O(−1) of the untilt divisor, with no nonzero sections. The generator e = log q ⊗ e⟨1⟩ of the perfected twist satisfies φ(e) = p·`p^{-1}`·e = e, so the perfected twist descends to a line bundle of slope zero, the Tate twist; omitting O⟨1⟩ changes the slope by one.

### 9.9 The prismatic logarithm and the prismatization of G_m

Let G̃_m = `lim_{x↦x^p}` G_m and ℤ_p(1)^sm = fib(G̃_m → G_m). Prove G̃_m ≅ G̃_m^dR `×_{G_m^dR}` G_m (ALRS Lemma 4.10.2, p. 84, ALRS line 4348); construct the φ-equivariant Teichmüller map of commutative group stacks ρ: `G̃_{m,Q_p^Δ}` → G_m^Δ (ALRS Construction 4.10.3, p. 84, ALRS line 4355) and prove that ρ is an epimorphism with G_m^Δ = `G̃_{m,Q_p^Δ}/G`, G = fib(ρ), with cartesian squares relating G, `(1 + D̃^{<1})` `×_{GSpec ℚ_p}` Q_p^Δ and `(1 + D^{<1})^Δ` (ALRS Lemma 4.10.4, p. 85, ALRS line 4403). Define the prismatic logarithm as the unique φ-equivariant map of commutative group stacks log_Δ: G → `G_{a,Q_p^Δ}{1}` fitting in the diagram of fibre sequences with β = log ∘ pr_1 twisted by ⟨1⟩ and γ = (log)^cone ∘ μ_BK (ALRS Construction 4.10.5, p. 86, ALRS line 4454). Prove that log_Δ is †-formally étale, with a fibre square over its de Rham stack and an exact sequence 0 → G_a^† ⊗ `G_{a,Q_p^Δ}{1}` → G → ℤ_p(1)^sm → 0 (ALRS Theorem 4.10.6, p. 87, ALRS line 4494); that the logarithm induces fibre sequences with rows G → `(1 + D̃^{<1})_{Q_p^Δ} → (1 + D^{<1})^Δ` and G[1/p] → `(1 + D̃^{<1})_{Q_p^Δ}` → G_a^Δ, recovering on arc-stacks 0 → ℚ_p(1) → BC(O(1)) → G_a → 0 (ALRS Lemma 4.10.10, p. 89, ALRS line 4599); and that over the cyclotomic prism the section q♭ = (q, `q^{1/p}`, …) gives `G^{Div¹~}|_{X_cyc} ≅ q^{ℤ_p^la}`, the action on `G̃_{m,X_cyc}` with coordinate T is `a·T^{1/p^n} = q^{a/p^n}T^{1/p^n}`, `G_m^{Div¹~/X_cyc} ≅ G̃_{m,X_cyc}/ℤ_p^la`, and `G_m^{Div¹~} ≅ G̃_{m,X_cyc}/(ℤ_p^{×,la} ⋉ ℤ_p^la)` with (a, b)·(q♭, T♭) = (q♭^a, q♭^b T♭) (ALRS Theorem 4.10.13, p. 89, ALRS line 4622).

A proof route: ρ is an epimorphism because `lim_{x↦x^p}A^{u,×} → (A^{♭,♯})^×` is surjective arc-locally and the remaining nilpotent part is handled by †-thickenings. β and γ are †-formally étale (1 + `D̃^{<1}` → 1 + `D^{<1}` and log are; `(1 + D^{<1})^Δ → (1 + D^{<1})^cone` is by 8.4), hence so is log_Δ. Over X_cyc, the pullback square (4.10.8) and the description of G by log_Δ identify G with `q^{ℤ_p^la}`.

*Needs:* §9.7; §9.8; §8.4; §7.6; §5.1; §4.1.

The API has the following laws.

- ρ: `G̃_{m,Q_p^Δ}` → G_m^Δ is a φ-equivariant epimorphism of commutative group stacks with fibre G, so G_m^Δ = `G̃_{m,Q_p^Δ}/G`.
- log_Δ: G → `G_{a,Q_p^Δ}{1}` is φ-equivariant and †-formally étale, and 0 → G_a^† ⊗ `G_{a,Q_p^Δ}{1}` → G → ℤ_p(1)^sm → 0 is exact.
- On arc-stacks the fibre sequence G[1/p] → `(1 + D̃^{<1})_{Q_p^Δ}` → G_a^Δ becomes the fundamental exact sequence 0 → ℚ_p(1) → BC(O(1)) → G_a → 0.
- Over the cyclotomic prism, `G^{Div¹~}|_{X_cyc} ≅ q^{ℤ_p^la}` and `G_m^{Div¹~} ≅ G̃_{m,X_cyc}/(ℤ_p^{×,la} ⋉ ℤ_p^la)` with (a, b)·(q♭, T♭) = (q♭^a, q♭^b T♭).

**Checks.**

- On X_cyc, log_Δ(q) = log(q) = (q − 1)·e for the generator e of 9.8, and `p^{-1}φ(log q) = p^{-1}log(q^p)` = log q, so log_Δ(q) is φ-invariant for the twisted Frobenius; compare PrismaticCohomologyPartIII §6.10 and PrismaticCohomologyPartII §3.11, where (q − 1)e_A = log_Δ(q^p) integrally, the integral logarithm being defined on q^p, which is congruent to 1 modulo ([p]_q) since q^p − 1 = (q − 1)[p]_q, and not on q. Since log_Δ is additive, log_Δ(q^p) = p·log_Δ(q) = p(q − 1)e, so the two formulas agree exactly when the integral generator e_A corresponds to p·e under the rational comparison of twists, not to e; the Frobenius identity φ(x) = `[p]_q^{-1}x` holds for both and cannot tell them apart, and the factor p is fixed by the comparison of the integral and the rational logarithm.
- Without the twist ⟨1⟩, φ(log q) = p·log q, so the untwisted logarithm is not φ-equivariant.
- ℤ_p(1)^sm = `GSpec(ℚ_p[T^{1/p^∞}]/(T − 1))`, the locally constant functions on ℤ_p(1), and `G^{dR}` ≅ ℤ_p(1)^sm × `D^{×,dR}_{FF,Marc(ℚ_p)}`.
- On arc-stacks ALRS Lemma 4.10.10 becomes the fundamental exact sequence 0 → ℚ_p(1) → BC(O(1)) → G_a → 0 of VectorBundlesAndIsocrystals Layer 5 (“The fundamental untilt sequence and degree-one divisors”), consistent with 7.6.

### Examples

Q_p^HT ≅ `GSpec(ℚ_p(μ_{p^∞}))/ℤ_p^{×,la}` is a gerbe banded by G_m^† over GSpec(ℚ_p); Div¹ ≅ `X_cyc/ℚ_p^{×,la}`. On the cyclotomic prism the Breuil–Kisin twist has generator e = (log q/(q − 1)) ⊗ e⟨1⟩ with φ(e) = `[p]_q^{-1}·e`, and log_Δ(q) = (q − 1)·e. For X = G_m over the cyclotomic prism the perfect prismatization is `G̃_{m,X_cyc}/ℤ_p^la` with `a·T^{1/p^n} = q^{a/p^n}T^{1/p^n}`.

### Dependencies

Layers 2–8; PadicHodgeTheory §2.2, §2.3; AInfCohomology §AI.3.1; AdicEtaleGeometry §A1.12, §A2.4; VectorBundlesAndIsocrystals Layer 6; PerfectoidSpaces §P7.16; PrismaticCohomologyPartII §3.8, §3.9, §3.11, §4.12, §4.13 and PrismaticCohomologyPartIII §6.10 (comparison Checks only); AnalyticStacks §1.6, §3.8, §6.5.

## Layer 10: Semilinear solid representations and decompletion by locally analytic vectors

This layer is independent of the prismatization. It develops semilinear solid representations of p-adic Lie groups on Gelfand rings, identifies continuous and locally analytic representations with quasi-coherent sheaves on BG^cont and BG^la, and proves the decompletion theorem for Berkovich spaces with a continuous action of a p-adic Lie group: the sheaf of locally analytic functions, classical decompletion, and the equivalence of perfect complexes under strong decompletion. It then verifies strong decompletion in the arithmetic, geometric and mixed Sen-theoretic situations through the Tate–Sen axioms, and decompletes torsors.

### 10.1 Semilinear solid representations

For a light locally profinite group Π let Rep^■_ℤ(Π) = D(ℤ_■[Π]) be the category of solid Π-representations, symmetric monoidal through the Hopf algebra ℤ_■[Π]. For R ∈ CAlg(D(ℤ_■[Π])) let Rep^■_R(Π) = Mod_R(D(ℤ_■[Π])) be the category of R-semilinear solid representations. Construct the associative algebra Λ_R(Π) with underlying solid abelian group R ⊗ ℤ_■[Π] and an equivalence Rep^■_R(Π) ≃ `LMod_{Λ_R(Π)}(D(ℤ_■))` by the Barr–Beck–Lurie theorem applied to the conservative, limit- and colimit-preserving forgetful functor, together with algebra maps ℤ_■[Π] → Λ_R(Π) and R → Λ_R(Π) recovering the rule (a[g])(b[h]) = a·g(b)[gh] (ALRS Construction 5.2.1, p. 93, ALRS line 4817).

*Needs:* SolidAnalyticRings §1.5; EnhancedDerivedSheaves §E5:abstract.2; EnhancedDerivedSheaves §E5:abstract.5; AnalyticStacks §2.3, §2.11, §3.6.

The API has the following laws.

- Rep^■_R(Π) ≃ `LMod_{Λ_R(Π)}(D(ℤ_■))`, compatibly with the forgetful functors.
- The algebra maps R → Λ_R(Π) and ℤ_■[Π] → Λ_R(Π) satisfy [g]·a = g(a)·[g].
- Λ_R(Π) is functorial in equivariant algebra maps R → R′ and in group homomorphisms.

**Checks.**

- For Π trivial, Λ_R(Π) = R.
- For R = ℤ with trivial action, Λ_R(Π) = ℤ_■[Π], the solid group algebra.
- For Π = ℤ/2 acting on R = ℚ_p × ℚ_p by swapping, Λ_R(Π) ≅ M_2(ℚ_p), a simple algebra.
- The untwisted product (a[g])(b[h]) = ab[gh] would give the commutative algebra (ℚ_p × ℚ_p) ⊗ ℚ_p[ℤ/2] ≅ ℚ_p⁴ in the previous example, which is not M_2(ℚ_p).

### 10.2 Continuous representations as quasi-coherent sheaves on BΠ^cont

Let Π^cont be the Berkovich space of ℚ_p-valued continuous functions on Π and BΠ^cont = GSpec(ℚ_p)/Π^cont. Prove that for profinite Π pullback along f: GSpec(ℚ_p) → BΠ^cont identifies D(BΠ^cont) with right C(Π, ℚ_p)-comodules in solid ℚ_p-vector spaces; that for every light locally profinite Π, D(BΠ^cont) has a t-structure for which f^* is t-exact and is the left-completed derived category of its heart; that for profinite Π the map f is 0-proper and D-proper, and if Π moreover has finite p-cohomological dimension, f is descendable, so BΠ^cont is D-proper and 0-proper over GSpec(ℚ_p); BΠ^cont is !-able whenever Π has an open subgroup of finite p-cohomological dimension (ALRS Lemma 5.2.2, p. 94, ALRS line 4860). Construct a symmetric monoidal functor Φ: D(BΠ^cont) → `Rep^■_{ℚ_p}(Π)` compatible with forgetful functors and natural in Π (ALRS Construction 5.2.3, p. 94, ALRS line 4906). Prove that if ℚ_p is a perfect `ℚ_{p,■}[Π_0]`-module for a compact open Π_0, which holds for p-adic Lie groups by the Lazard–Serre resolution (RJRC22 Theorem 5.7, p. 45, RJRC22 line 2227), then Φ has a D(BΠ^cont)-linear right adjoint Φ^R(M) = Γ(Π_0, M ⊗ C(Π_0, ℚ_p)), the unit ℚ_p → Φ^R(ℚ_p) is an equivalence, and Φ is fully faithful (ALRS Lemma 5.2.5, p. 95, ALRS line 4957; ALRS Lemma 5.2.7, p. 97, ALRS line 5072). The algebraic form of the Lazard–Serre resolution, a resolution of the trivial module ℤ_p of length d by finitely generated free Λ(U)-modules for a uniform group U of dimension d, is NoncommutativeAndEquivariantIwasawa §0.11; it is a resolution of solid `ℤ_{p,■}[U]`-modules because `ℤ_{p,■}[U]` is the condensed ring of the compact ring Λ(U) = lim_n ℤ_p[U/U_n], a map of finite free Λ(U)-modules is a matrix over Λ(U), and a complex of compact Hausdorff abelian groups that is exact on underlying groups is exact as a complex of condensed abelian groups; inverting p gives a resolution of ℚ_p by finite free `ℚ_{p,■}[U]`-modules, so ℚ_p is perfect for Π_0 = U, an open uniform subgroup of the p-adic Lie group Π (NoncommutativeAndEquivariantIwasawa §0.2).

A proof route: f is 0-affine and 0-proper because its base change along itself is the map Π^cont → GSpec(ℚ_p) of affinoid Gelfand stacks and both properties are local on the target (2.2; 0.4), and D-proper because it is moreover 0-truncated (2.2; ALRS line 4898–4899). Descendability is shown in the proof of ALBM Proposition 4.3.9 (p. 33, ALBM line 1437), as ALRS line 4900 says, so f is of universal ∗- and !-descent (AnalyticStacks §0.11(ii); HM Lemma 4.7.4(i), p. 77, HM line 3858). As the composite GSpec(ℚ_p) → BΠ^cont → GSpec(ℚ_p) is the identity, π: BΠ^cont → GSpec(ℚ_p) is D-prim by descent of primness along f (AnalyticStacks §0.9; HM Corollary 4.7.5(ii), p. 78, HM line 3895). It is moreover 1-truncated with D-proper diagonal, hence D-proper (AnalyticStacks §0.10): the base change of the diagonal along f × f, of universal ∗- and !-descent as a composite of two base changes of f, is the 0-truncated map Π^cont → GSpec(ℚ_p) of affinoid Gelfand stacks, and D-properness is local on the target (2.2). It is 0-proper, which the proof of ALRS Proposition 5.7.3 (p. 127, ALRS line 6907) infers from f being 0-proper and descendable. 0-primness asks for a linear right adjoint of pullback at every categorical level (0.3): on 1-sheaves, π_* ≅ π_! (2.2) preserves colimits and is ℚ_p-linear by the projection formula; on 2-sheaves, descent of linear categories along f (AnalyticStacks §0.12, (a) ⇒ (d), whose Künneth hypothesis holds on the Čech nerve of the 0-affine map f) identifies 2-sheaves on BΠ^cont with D(BΠ^cont)-linear presentable categories, so the right adjoint is the forgetful functor; at the higher levels, BΠ^cont, like every Gelfand stack, is 1-étale over GSpec(ℚ_p) (0.5), hence 2-proper (0.4). The diagonal of π is 0-proper by locality on the target, its base change along the effective epimorphism GSpec(ℚ_p) → BΠ^cont × BΠ^cont being Π^cont → GSpec(ℚ_p) (2.2; 0.4). ALRS Lemma 5.2.2(3) states only the D-properness of BΠ^cont, while ALRS line 5150 and ALRS line 5824 use its 0-properness. Construct Φ on the comodule presentation: a right C(Π_0, ℚ_p)-comodule M → M ⊗ C(Π_0, ℚ_p) becomes a `ℚ_{p,■}[Π_0]`-module through the evaluation pairing C(Π_0, ℚ_p) ⊗ `ℚ_{p,■}[Π_0]` → ℚ_p, and glue over compact opens. ALRS constructs Φ through Mann's solid sheaves on classifying stacks (Man26 Lemmas 10.3 and 10.5) and the nuclear comparison of AM24 Lemma 3.29; the two constructions agree on nuclear objects, which is recorded as a Check. The right adjoint is computed by the projection formula of ALRS Lemma 5.2.7, which holds because ℚ_p is a perfect `ℚ_{p,■}[Π_0]`-module, the hypothesis (for uniform Π_0, the Lazard–Serre resolution of ℤ_p by finite free `ℤ_{p,■}[Π_0]`-modules with p inverted, NoncommutativeAndEquivariantIwasawa §0.11 read in solid modules as above, RJRC22 Theorem 5.7; for Π_0 trivial, ℚ_p is perfect over ℚ_p although it has no finite free resolution over ℤ_p); Φ^R(ℚ_p) = Γ(Π_0, C(Π_0, ℚ_p)) = ℚ_p by Shapiro's lemma, without Gestalten.

*Needs:* §10.1; §2.2; §2.5; §2.3; §0.3; §0.4; §0.5; NoncommutativeAndEquivariantIwasawa §0.1; NoncommutativeAndEquivariantIwasawa §0.2; NoncommutativeAndEquivariantIwasawa §0.6; NoncommutativeAndEquivariantIwasawa §0.11; SolidAnalyticRings §1.5; AnalyticStacks §0.9; AnalyticStacks §0.10; AnalyticStacks §0.11; AnalyticStacks §0.12; AnalyticStacks §4.3; RefinedTraceMethods §4.3.

The API has the following laws.

- For profinite Π, f^* identifies D(BΠ^cont) with right C(Π, ℚ_p)-comodules in solid ℚ_p-vector spaces.
- For every light locally profinite Π, D(BΠ^cont) has a t-structure for which f^* is t-exact, and D(BΠ^cont) is the left-completed derived category of its heart.
- For profinite Π, f: GSpec(ℚ_p) → BΠ^cont is 0-proper and D-proper; if Π moreover has finite p-cohomological dimension, f is descendable and BΠ^cont is D-proper and 0-proper over GSpec(ℚ_p); for Π with an open subgroup of finite p-cohomological dimension, BΠ^cont → GSpec(ℚ_p) is !-able.
- Φ: D(BΠ^cont) → `Rep^■_{ℚ_p}(Π)` is symmetric monoidal, commutes with the forgetful functors to solid ℚ_p-vector spaces, and is natural in Π.
- If ℚ_p is a perfect `ℚ_{p,■}[Π_0]`-module for a compact open Π_0 ⊆ Π, then Φ has a D(BΠ^cont)-linear right adjoint Φ^R whose underlying solid ℚ_p-vector space is Φ^R(M) = Γ(Π_0, M ⊗ C(Π_0, ℚ_p)), the unit ℚ_p → Φ^R(ℚ_p) is an equivalence, and Φ is fully faithful.

**Checks.**

- For Π trivial, D(BΠ^cont) = D(ℚ_p) and Φ is the identity.
- For Π = ℤ_p the character a ↦ (1 + p)^a (p odd) is a one-dimensional C(ℤ_p, ℚ_p)-comodule, and Φ sends it to ℚ_p with ℤ_p acting through it.
- The regular representation `ℚ_{p,■}[Π]` is not in the essential image of Φ, being a comodule over no C(Π_0, ℚ_p) (ALRS Remark 5.2.4(1)); for Π = ∏_ℕ ℤ_p, Φ is not fully faithful (ALRS Remark 5.2.4(2)), so the Lie group hypothesis is needed.
- On nuclear objects Φ agrees with Mann's identification of nuclear solid ℚ_p-sheaves on (∗/Π)_proét with nuclear solid representations (Man26 Lemma 10.5).

### 10.3 The groups G_r, G^la and locally analytic representations

Let G be a compact p-adic Lie group with an open normal subgroup G_0 that is uniform pro-p, with ordered basis g_1, …, g_d, G_0 ≅ ℤ_p^d, and p-valuation; after shrinking G_0 its group law and the conjugation action of G extend to integral power series on the polydisc D^d. Let G_0(r) ⊂ G_0(1) be the polydisc of radius r ∈ (0, 1] ∩ ℚ, G_0(r)(ℚ_p) ⊆ G_0 the compact open subgroup of ℚ_p-points of G_0(r), normal in G because conjugation is given by integral power series, G_r the induced rigid analytic group `⊔_{g ∈ G/G_0(r)(ℚ_p)}` g·G_0(r), G^la = `⋂_{r→0}` G_r with O(G^la) = C^la_G = colim_r O(G_r), `G_{<r} = ⋃_{r′<r}` `G_{r′}` for r ∈ (0, 1] and `G_{≤r} = ⋂_{r′>r}` `G_{r′}` for r ∈ (0, 1) (ALRS §5.2.2, p. 97, ALRS line 5086; ALRS Definition 5.2.8, p. 98, ALRS line 5110). A solid representation M is locally analytic if M^la := Γ(G, C^la_G ⊗ M) → M is an isomorphism (ALRS Definition 5.2.9, p. 98, ALRS line 5124). For a p-adic Lie group G, not necessarily compact, and a compact open subgroup G_c, put G^la = `⊔_{g ∈ G/G_c}` g·G_c^la; this does not depend on G_c, since G_c^la = `⊔_{h ∈ G_c/G_c′}` h·G_c′^la for every open subgroup G_c′ ⊆ G_c, and G^cont and G^sm are the corresponding disjoint unions over G/G_c. Prove, for every p-adic Lie group G, not necessarily compact: BG^cont → BG^la is 0-proper with pushforward of O equal to O, so pullback is fully faithful, and Ψ: D(BG^la) → `Rep^■_{ℚ_p}(G)`, pullback to BG^cont followed by Φ of 10.2, is fully faithful with a D(BG^la)-linear right adjoint Ψ^R (ALRS Lemma 5.2.10(1)–(2), p. 98, ALRS line 5137). For compact G prove that Ψ^R followed by pullback along GSpec(ℚ_p) → BG^la is (−)^la, so the essential image of Ψ is the category of locally analytic representations (ALRS Lemma 5.2.10(3), p. 98, ALRS line 5143); for compact G and r ∈ (0, 1) define `Rep^{<r}` and `Rep^{≤r}` as `D(GSpec(ℚ_p)/G_{<r})` and `D(GSpec(ℚ_p)/G_{≤r})` (ALRS Definition 5.2.11, p. 99, ALRS line 5163); for compact G and r ∈ (0, 1), GSpec(ℚ_p) → BG^la and → `BG^{≤r}` are 0-proper and descendable, so BG^la and `BG^{≤r}` are 0-proper over GSpec(ℚ_p), and both are suave, and GSpec(ℚ_p) → `BG^{<r}` is cohomologically smooth with `BG^{<r}` prim (ALRS Lemma 5.2.12, p. 99, ALRS line 5169). For a rigid analytic group 𝒢 over ℚ_p whose group of ℚ_p-points G = 𝒢(ℚ_p) is a p-adic Lie group of dimension dim 𝒢, G^la agrees with 𝒢(ℚ_p)^la of 3.4, coset by coset of a compact open subgroup when G is not compact.

A proof route: Let U be an open uniform subgroup of G (for compact G, the G_0 above), which exists because a compact open subgroup of G has an open normal uniform subgroup (NoncommutativeAndEquivariantIwasawa §0.2). The base change of BG^cont → BG^la along the effective epimorphism BU^la → BG^la, whose fibre is the discrete set G/U, is BU^cont → BU^la, so descent along it reduces the 0-properness and the value of the pushforward to the uniform group U, which has finite p-cohomological dimension d (NoncommutativeAndEquivariantIwasawa §0.11). The reduction is needed for compact G as well: a compact G with p-torsion, such as ℤ/p × ℤ_p, has infinite p-cohomological dimension, so 10.2 does not apply to G itself. For uniform G, 0-properness of BG^cont → BG^la is checked after pullback along the effective epimorphism GSpec(ℚ_p) → BG^la (0.4; Gest Proposition 7.9), where G^la/G^cont → GSpec(ℚ_p) is the composite of G^la/G^cont → BG^cont, 0-proper because its base change along GSpec(ℚ_p) → BG^cont is the affinoid G^la, and BG^cont → GSpec(ℚ_p), 0-proper by 10.2; the pushforward computes locally analytic vectors (RJRC Proposition 6.1.5). Ψ^R is D(BG^la)-linear because Φ^R is D(BG^cont)-linear (10.2) and the pushforward along BG^cont → BG^la is D(BG^la)-linear by the projection formula. For compact G, BG^la and `BG^{≤r}` are 0-proper over GSpec(ℚ_p) by the argument given for BΠ^cont in 10.2, which uses of GSpec(ℚ_p) → BΠ^cont only that it is descendable and that its base change along itself is a map of affinoid Gelfand stacks, here G^la and `G_{≤r}`.

*Needs:* §10.2; §3.4; NoncommutativeAndEquivariantIwasawa §0.1; NoncommutativeAndEquivariantIwasawa §0.2; NoncommutativeAndEquivariantIwasawa §0.6; NoncommutativeAndEquivariantIwasawa §0.7; NoncommutativeAndEquivariantIwasawa §0.11; AnalyticStacks §§0.8–0.11; AnalyticStacks §0.12; AnalyticStacks §4.2; §0.3; §0.4; §0.5; §2.2.

The API has the following laws.

- For compact G, Ψ identifies D(BG^la) with the full subcategory of locally analytic solid representations, and Ψ^R ∘ pullback = (−)^la.
- The ind-systems {C^r_G}, `{C^{<r}_G}`, `{C^{≤r}_G}` are ind-equivalent, so C^la_G = colim C^r_G = colim `C^{<r}_G` = colim `C^{≤r}_G` (RJRC Remark 2.1.5).
- For every p-adic Lie group G, BG^cont → BG^la is 0-proper with O ≅ s_*O; for compact G, GSpec(ℚ_p) → BG^la is 0-proper and descendable.
- The coordinates and p-valuation are those of NoncommutativeAndEquivariantIwasawa §0.6 and §0.7: the ordered coordinate homeomorphism ℤ_p^d → G_0 and a finite-rank p-valuation with an ordered basis, which fixes the compatible analytic structure.

**Checks.**

- For G = ℤ_p, C^la_G is the space of locally analytic functions on ℤ_p, and the character a ↦ (1 + p)^a is locally analytic for p odd (its Mahler coefficients p^n satisfy |p^n|r^n → 0 for 1 < r < p).
- For G finite, G^la = G^sm = G^cont and every solid representation is locally analytic.
- The representation C(ℤ_p, ℚ_p) with the regular action is not locally analytic: its locally analytic vectors are C^la(ℤ_p, ℚ_p) ⊊ C(ℤ_p, ℚ_p).
- For a Banach representation B, the cohomology of the derived locally analytic vectors equals R^iLA(B) of LocallyAnalyticRepresentationsOfLocalGroups §2.3, and agrees with RJRC22 Theorems 4.36, 5.3 and 5.5; the derived locally analytic vectors V^Rla of solid representations of its §3.8 are the κ-condensed counterpart.
- For G = ℤ_p, with coordinate x and G_0(1) the closed unit disc, and r = 1/p, `G_{≤1/p} = ⋂_{r′>1/p}` `G_{r′}` is the disjoint union over a = 0, …, p − 1 of the overconvergent closed discs of radius 1/p around a, since G_0(r′)(ℚ_p) = {x ∈ ℤ_p : |x| ≤ r′} = pℤ_p for 1/p ≤ r′ < 1, so that `G_{r′}` is the union of the p discs a + G_0(r′) indexed by ℤ_p/pℤ_p; the rigid group `G_{r′}` itself contains all of ℤ_p. For r = 1 the intersection `⋂_{r′>1}` `G_{r′}` has no terms, the polydiscs G_0(r′) being defined for r′ ≤ 1 only, so `G_{≤1}` and `Rep^{≤1}` are not defined, whereas `G_{<1} = ⋃_{r′<1}` `G_{r′}` is.
- For the discrete group G = ℤ, a p-adic Lie group of dimension 0 that is not compact, take G_c = {0}: G^cont = G^la = G^sm = `⊔_{n ∈ ℤ}` GSpec(ℚ_p), so BG^cont → BG^la is the identity and Ψ = Φ is the equivalence of D(Bℤ) with `Rep^■_{ℚ_p}(ℤ)`, the solid `ℚ_p[T^{±1}]`-modules; the identification of Ψ^R with (−)^la is not asserted, M^la being defined for compact G only. A version of Lemma 5.2.10(1)–(2) for compact G only would not cover the second Check of 10.6 for G = ℚ_p^×, where G^la = `⊔_{n ∈ ℤ}` `p^n·ℤ_p^{×,la}`.

### 10.4 Lazard's criterion and binomial analytic functions

Prove that for a uniform pro-p group G with the ordered coordinates G ≅ ℤ_p^d of NoncommutativeAndEquivariantIwasawa §0.6 and a ℚ_p-Banach space M, a function f: G → M with binomial expansion f(x) = Σ_α c_α binom(x, α) is locally analytic if and only if there is r > 1 with ‖c_α‖ `r^{|α|}` → 0 (ALRS Theorem 5.2.14, p. 101, ALRS line 5314; Laz65 Chapitre III, (1.3.9) Corollaire, p. 77, Laz65 line 2873). For a uniform Banach ℚ_p-algebra Λ with pseudo-uniformizer ϖ and the spectral norm |−|_ϖ normalized by |ϖ|_ϖ = 1/2 at every point of M(Λ), define for r > 1 the ϖ-complete module `C_{r,ϖ}(G, Λ°)` of series Σ c_α binom(x, α) with |c_α|_ϖ `r^{τ(α)}` ≤ 1 and → 0, where τ(α) = Σ_i w(g_i)·α_i for the p-valuation w and the ordered basis g_1, …, g_d defining the coordinates (10.3), the values w(g_i) being made rational by modifying w (ALRS p. 101, ALRS line 5333; ALRS Definition 5.2.15, p. 102, ALRS line 5364), prove that it is a subalgebra of C(G, Λ°) and, for |p|_ϖ ≤ 1/2 and 1 < r < 2, a Hopf Λ°-algebra (ALRS Lemma 5.2.16, p. 102, ALRS line 5379; ALRS Lemma 5.2.17, p. 102, ALRS line 5411), and define the analytic group `G^Bin_{r,ϖ} = GSpec(C_{r,ϖ}(G, Λ))` and, for a commutative algebra R in `D(BG^Bin_{r,ϖ})`, the R-semilinear `Bin_{r,ϖ}`-analytic representations `Mod_R(D(BG^Bin_{r,ϖ}))` (ALRS Definition 5.2.18, p. 104, ALRS line 5492). Prove that for 1 < r < 2 and |p|_ϖ ≤ 1/2 the natural map f: BG^la `×_{GSpec ℚ_p}` GSpec(Λ) → `BG^Bin_{r,ϖ}` is 0-proper with f_*Λ = Λ, so that ∗-pullback along f is fully faithful (ALRS Lemma 5.2.21, p. 105, ALRS line 5617).

A proof route: Lazard's criterion follows from Amice's analytic basis of PadicFunctionalAnalysis §4.4 by induction on d. A restricted power series in d variables with coefficients in M is a restricted series in the first variable whose coefficients are restricted series in the others, so the stage of M-valued functions on ℤ_p^d analytic on every coset of p^hℤ_p^d is the stage LA_h(E) of §4.4 for E the corresponding stage in d − 1 variables; by induction, (b_α) ↦ Σ_α b_α ∏_i ⌊α_i/p^h⌋!·binom(x_i, α_i) is an isometry of C₀(ℕ^d, M) onto it, and Mahler's theorem iterated over the coordinates (Mathlib `PadicInt.mahlerEquiv`) shows that f lies in the stage h if and only if ‖c_α‖/∏_i |⌊α_i/p^h⌋!| → 0. By Legendre's formula and the digit-sum bound of Laz65 (1.3.9.3), Σ_i v_p(⌊α_i/p^h⌋!) lies between |α|/(p^h(p − 1)) − d·(2 + log_p(|α| + 1)) and |α|/(p^h(p − 1)), so the union over h of these conditions is the existence of r > 1 with ‖c_α‖ `r^{|α|}` → 0, as in the deduction of Laz65 (1.3.9) from (1.3.8). Multiplicativity of `C_{r,ϖ}` follows from the estimates on products of binomial coefficients; the Hopf structure needs |p|_ϖ ≤ 1/2 so that the group law is analytic on the relevant polydiscs; the Lazard–Serre resolution of ℤ_p by finite free `ℤ_{p,■}[G]`-modules (RJRC22 Theorem 5.7; NoncommutativeAndEquivariantIwasawa §0.11, read in solid modules as in 10.2) controls group cohomology.

*Needs:* §10.3; §10.2; NoncommutativeAndEquivariantIwasawa §0.6; NoncommutativeAndEquivariantIwasawa §0.7; NoncommutativeAndEquivariantIwasawa §0.11; PadicFunctionalAnalysis §4.4; Mathlib `PadicInt.mahlerEquiv`.

The API has the following laws.

- For a uniform pro-p group G with coordinates and a ℚ_p-Banach space M, f = Σ_α c_α binom(x, α) is locally analytic if and only if ‖c_α‖ `r^{|α|}` → 0 for some r > 1.
- `C_{r,ϖ}(G, Λ°)` is a ϖ-complete Λ°-subalgebra of C(G, Λ°), and a Hopf Λ°-algebra when |p|_ϖ ≤ 1/2 and 1 < r < 2.
- For |p|_ϖ ≤ 1/2 and 1 < r < 2, `G^Bin_{r,ϖ} = GSpec(C_{r,ϖ}(G, Λ))` is a group Gelfand stack over GSpec(Λ), and its R-semilinear representations form `Mod_R(D(BG^Bin_{r,ϖ}))`.
- For |p|_ϖ ≤ 1/2 and 1 < r < 2, f: BG^la `×_{GSpec ℚ_p}` GSpec(Λ) → `BG^Bin_{r,ϖ}` is 0-proper with f_*Λ = Λ, so ∗-pullback along f is fully faithful.

**Checks.**

- For G = ℤ_p and p odd, f(a) = (1 + p)^a has c_n = p^n and satisfies the criterion for every r < p.
- f(a) = Σ_k p^k binom(a, p^k) is continuous (Mahler coefficients tend to 0) but `p^{-k}r^{p^k}` → ∞ for every r > 1, so f is not locally analytic.
- A polynomial function on ℤ_p^d has finitely many nonzero c_α and is locally analytic for every r.
- For M = K a complete discretely valued extension of ℚ_p the criterion is the d-variable Amice theorem of LocallyAnalyticDistributionsPartII §1.5, and for d = 1 it is the condition liminf_n v_p(c_n)/n > 0 of PadicFunctionalAnalysis §4.4: for p odd, d = 2 and f(a, b) = `(1 + p)^{a+b}`, `c_{(m,n)} = p^{m+n}` and `|c_{(m,n)}|` `r^{m+n} = (r/p)^{m+n}` → 0 exactly for r < p. The exponent |α| may be replaced by max_i α_i, since `r^{max α}` ≤ `r^{|α|}` ≤ `(r^d)^{max α}`, but not by α_1: g(a, b) = Σ_k p^k binom(b, p^k) has `c_{(0,p^k)}` = p^k, so `p^{−k}` `r^{α_1}` → 0 for every r, while `p^{−k}` `r^{p^k}` → ∞ and g is not locally analytic.
- The condition |p|_ϖ ≤ 1/2 depends on ϖ and is not read in the normalization |p| = `p^{−1}` of the Conventions, under which it would always hold: with |ϖ|_ϖ = 1/2, Λ = `ℚ_p(p^{1/2})` and ϖ = `p^{1/2}` give |p|_ϖ = 1/4, so the Hopf structure is available, while Λ = ℚ_p and ϖ = p² give |p|_ϖ = `2^{−1/2}` > 1/2, outside ALRS Definition 5.2.18.
- For d = 1, G = ℤ_p and M = ℚ_p, the locally analytic functions of the criterion are the image of Tau Ceti's algebraic direct limit of analytic stages under its evaluation into C(ℤ_p, ℚ_p) (Exact supplier contracts, From Tau Ceti), which is injective because ℚ_p has no p-torsion; the criterion identifies this image with the Mahler series Σ c_n binom(x, n) with |c_n| r^n → 0 for some r > 1, Amice's theorem (PadicFunctionalAnalysis §4.4), which the pinned library does not prove. For p odd, f(a) = (1 + p)^a lies in the stage h = 0, its Taylor coefficients log(1 + p)^n/n! having absolute value `p^{−n + v_p(n!)}` ≤ `p^{−n(p−2)/(p−1)}` → 0, and its Mahler coefficients p^n satisfy the criterion for 1 < r < p, as the first Check says.
- For p odd and G = 1 + p²ℤ_p with basis g_1 = 1 + p²: with the p-valuation w(g) = v_p(g − 1), w(g_1) = 2 and τ(n) = 2n, so `C_{r,ϖ}(G, Λ°)` is cut out by |c_n|_ϖ `r^{2n}` ≤ 1, the condition the exponent |α| = n of Lazard's criterion imposes for r² and not for r; with the p-valuation v_p(g − 1) − 1, τ(n) = n. The module depends on w, not only on the coordinates.

### 10.5 Decompletions of semilinear representations

Let G be a compact p-adic Lie group. For a commutative algebra R in solid G-representations with locally analytic vectors R^la, say that M ∈ Rep^■_R(G) admits a locally analytic decompletion as an R-module if it lies in the essential image of `Rep^la_{R^la}(G)`, equivalently M^la `⊗_{R^la}` R → M is an equivalence; similarly for ≤r-analytic decompletion (ALRS Definition 5.2.23, p. 106, ALRS line 5648). Prove that for p-adic Lie groups G and H, not necessarily compact, and M ∈ D(B(G^cont × H^cont)), the pushforward of M along `s_{G×H}`: B(G^cont × H^cont) → B(G^la × H^la) is computed one factor at a time: `s_{G×H}` is the composite of s_G × id: B(G^cont × H^cont) → B(G^la × H^cont) and id × s_H: B(G^la × H^cont) → B(G^la × H^la), the base changes of the 0-proper maps s_G: BG^cont → BG^la and s_H: BH^cont → BH^la of 10.3 along the projections to BG^la and to BH^la, so that by proper base change (s_G × id)_*M, pulled back along BG^la → B(G^la × H^cont), is `s_{G,*}` of the restriction of M to BG^cont, with H^cont acting through M, and likewise for id × s_H; for compact G and H, where `s_{G,*}` followed by pullback to GSpec(ℚ_p) is `(−)^{G-la}` (10.3), this reads `M^{(G×H)-la} = (M^{G-la})^{H-la}` (ALRS Remark 5.2.25, p. 106, ALRS line 5659), that descendability of an equivariant map of solid ℚ_p-algebras does not depend on the action (ALRS Lemma 5.2.26, p. 106, ALRS line 5664), and that for a map A → B of G-equivariant solid ℚ_p-algebras: if B admits a locally analytic decompletion as an A-module, then M^la `⊗_{A^la}` A = M^la `⊗_{B^la}` B for every G-equivariant B-module M, so that M decompletes as an A-module if and only if it does as a B-module; if a G-equivariant A-module M′ decompletes, then M′ ⊗_A B decompletes as a B-module with (M′ ⊗_A B)^la = M′^la `⊗_{A^la}` B^la; and if A → B is descendable and B decompletes as an A-module, then M′ decompletes whenever M′ ⊗_A B does (ALRS Lemma 5.2.27, p. 107, ALRS line 5691). Prove that for a compact p-adic Lie group G = H ⋉ N acting on X = GSpec(R) and M ∈ D(X/G^cont), if M decompletes over R as an N-representation and `M^{N-la}` decompletes over `R^{N-la}` as an H-representation, then M decompletes over R as a G-representation with `M^{G-la} = (M^{N-la})^{H-la}` (ALRS Lemma 5.2.28, p. 107, ALRS line 5721).

*Needs:* §10.3; §10.1; §2.2.

The API has the following laws.

- M admits a locally analytic decompletion if and only if M^la `⊗_{R^la}` R → M is an equivalence.
- For p-adic Lie groups G and H, not necessarily compact, pushforward along B(G^cont × H^cont) → B(G^la × H^la) is the composite of the pushforwards along s_G × id and id × s_H, each computed by proper base change from BG^cont → BG^la and BH^cont → BH^la; for compact G and H, `(−)^{(G×H)-la} = ((−)^{G-la})^{H-la}`.
- For compact G, an equivariant map A → B of solid ℚ_p-algebras is descendable in Rep(G) if and only if it is descendable as a map of algebras.

**Checks.**

- For R = ℚ_p with trivial action, M admits a decompletion if and only if M is locally analytic.
- For R = C(G, ℚ_p) with the left regular action, R^la = C^la_G. For G = ℤ_p the identity functor in place of (−)^la would give all of C(ℤ_p, ℚ_p), the invariants would give ℚ_p and the smooth vectors the locally constant functions, and none of these is C^la(ℤ_p, ℚ_p): for p odd, a ↦ (1 + p)^a is locally analytic and not locally constant, and Σ_k p^k binom(a, p^k) is continuous and not locally analytic (10.4). A solid ℚ_p-vector space N with trivial action is locally analytic, since Γ(G, C^la_G ⊗ N) = Γ(G, C^la_G) ⊗ N, Γ(G, −) commuting with − ⊗ N by the Lazard–Serre resolution (10.2), and Γ(G, C^la_G) = (ℚ_p)^la = ℚ_p (10.3); the base-change statement of ALRS Lemma 5.2.27(2) for ℚ_p → R then shows that N ⊗ R decompletes over R with (N ⊗ R)^la = N ⊗ C^la_G.
- For R = ℚ_p and M = C(ℤ_p, ℚ_p), M^la ⊗ ℚ_p = C^la(ℤ_p, ℚ_p) ≠ M, so M admits no decompletion over ℚ_p. Over B = C(ℤ_p, ℚ_p) it decompletes, as every algebra does over itself, which tests nothing; over the intermediate algebra A = C^la(ℤ_p, ℚ_p) it does not: A is locally analytic, being the image under Ψ of the pushforward of O along GSpec(ℚ_p) → BG^la (10.3), so A^la = A and M^la `⊗_{A^la}` A = C^la(ℤ_p, ℚ_p) ≠ M. Thus B does not decomplete as an A-module, and without that hypothesis the conclusion of ALRS Lemma 5.2.27(1) fails: M decompletes as a B-module and not as an A-module.
- For the discrete group G = ℤ, a p-adic Lie group that is not compact, G^la = G^cont (10.3), so s_G is the identity and pushforward along B(ℤ^cont × H^cont) → B(ℤ^la × H^la) is pushforward along id × s_H alone: by proper base change its pullback along BH^la → B(ℤ^la × H^la) is `s_{H,*}` of the restriction of M to BH^cont, the H-locally analytic vectors for compact H, with ℤ acting through M. A statement for compact G and H only would say nothing here; the formula `M^{(G×H)-la} = (M^{G-la})^{H-la}` itself is not asserted for G = ℤ, `M^{G-la}` being defined for compact G only.

### 10.6 The sheaf of locally analytic functions

Let X be a Berkovich space with an action of G^cont for a p-adic Lie group G. Prove that the action of a profinite group on GSpec(R) induces a continuous action on R^u and lifts, after shrinking the group, along Berkovich-étale maps, uniquely up to further shrinking (ALRS Lemma 5.3.1, p. 108, ALRS line 5763). Prove that h = h_X: X/G^cont → |X|^Betti/G^la, where G^la acts on |X|^Betti through G^la → G^sm, is 0-proper, and that pullback induces a fully faithful functor `Mod_{O^la_X}(D(|X|^Betti/G^la))` → D(X/G^cont), where O^la_X := `h_*O_{X/G^cont}` is the sheaf of locally analytic functions (ALRS Proposition 5.3.2, p. 109, ALRS line 5814; ALRS Theorem 5.1.1(1), p. 92, ALRS line 4743). The introduction of ALRS phrases the same statement as primness of h with trivial codualizing complex (ALRS Theorem 1.19(1), p. 8, ALRS line 420).

A proof route: By Lemma 5.3.1 and 10.3 restrict to an open uniform subgroup and localize on closed †-rational subspaces of |X|, so that G is uniform and X = GSpec(R) is affinoid; then X/G^cont and |X|^Betti/G^la are 0-proper over GSpec(ℚ_p), since |X| is a finite-dimensional compact Hausdorff space and BG^cont and BG^la are 0-proper (10.2, a uniform group having finite p-cohomological dimension by NoncommutativeAndEquivariantIwasawa §0.11, and 10.3), and h is 0-proper by left cancellation (2.2). Full faithfulness on modules over h_*O follows from the projection formula for the 0-proper, hence prim, map h.

*Needs:* §10.3; §10.2; §2.7; §2.2; §1.6; NoncommutativeAndEquivariantIwasawa §0.11.

The API has the following laws.

- For a light profinite group Π, an action of Π^cont on GSpec(R) induces a continuous action on the Banach algebra R^u; along a Berkovich-étale map R → R′ the action of some open subgroup of Π extends to R′, and two such extensions agree on a smaller open subgroup.
- For a Berkovich space X with an action of G^cont, h_X: X/G^cont → |X|^Betti/G^la is 0-proper.
- O^la_X = `h_*O_{X/G^cont}` is a commutative algebra in D(|X|^Betti/G^la), and pullback gives a fully faithful functor `Mod_{O^la_X}(D(|X|^Betti/G^la))` → D(X/G^cont).

**Checks.**

- For G trivial, h = (X → |X|^Betti) and O^la_X = h_*O_X, recovering 2.7.
- For X = GSpec(ℚ_p) with trivial action, h = (BG^cont → BG^la) and O^la = O by 10.3.
- For X = G^cont with G = ℤ_p acting by translation, h is not an isomorphism: D(X/G^cont) = D(ℚ_p) while |X|^Betti/G^la = ℤ_p^sm/ℤ_p^la carries more quasi-coherent sheaves.

### 10.7 Classical decompletion

Prove that for a Gelfand ring R with an action of a compact p-adic Lie group G, the connective cover `τ_{≥0}R^la` is a Gelfand ring (ALRS Lemma 5.4.1, p. 109, ALRS line 5831). Call R classically decompleted if R^la is connective and R^la → R is an isomorphism on uniform completions; call a Berkovich G^cont-space X locally classically decompleted if it has a strict closed affinoid cover by GSpec(R_i), stabilized by compact opens G_i with R_i classically decompleted, and let X^la = ⋃ GSpec(R_i^la) (ALRS Definition 5.4.2, p. 110, ALRS line 5851). Prove that X^la is a Berkovich space and that analytic, finite étale and Berkovich-étale sites of R^la, R and R^u agree (ALRS Remark 5.4.3, p. 110, ALRS line 5862; ALRS Remark 5.4.4, p. 110, ALRS line 5867), that for classically decompleted R a G-equivariant Berkovich-étale R → R′ decompletes: the Berkovich-étale R^la-algebra B corresponding to R′ under the equivalence of sites carries a locally analytic G-action with B `⊗_{R^la}` R ≅ R′ G-equivariantly (ALRS Lemma 5.4.5, p. 110, ALRS line 5877), that `GSpec_{|X|/G^la}(O^la_X)` ≅ GSpec(R^la)/G^la (ALRS Corollary 5.4.6, p. 110, ALRS line 5895), that for a p-adic Lie group G acting on a Berkovich space X, X is locally classically decompleted if the pieces Z_i of a strict closed cover, each stable under a compact open subgroup G_i ⊂ G, are locally classically decompleted for G_i; local classical decompletedness passes to a Berkovich (finite) étale X′ → X with an extension of the action of an open G_0 ⊂ G, with X′^la → X^la Berkovich (finite) étale and X′ = X′^la `×_{X^la}` X, and descends along such maps that are covers; that if X is locally classically decompleted, then for a G^la-equivariant map of Berkovich spaces Y → X^la the fibre product X `×_{X^la}` Y is locally classically decompleted with (X `×_{X^la}` Y)^la = Y; that if X is locally classically decompleted for G and Y for a p-adic Lie group H, then X × Y is locally classically decompleted for G × H with `(X × Y)^{(G×H)-la} = X^{G-la} × Y^{H-la}`; and that for G = H ⋉ N, local classical decompletion of X with respect to N and of `X^{N-la}` with respect to H gives `X^{G-la} = (X^{N-la})^{H-la}` (ALRS Lemma 5.4.7, p. 111, ALRS line 5909), and hence that for classically decompleted affinoid X = GSpec(R), R^la → O^la_X is an equivalence and `Mod_{R^la}(D(BG^la)) ≅ Mod_{O^la_X}(D(|X|^Betti/G^la))`, with every G^cont-equivariant affinoid Berkovich-étale GSpec(R′) → GSpec(R) classically decompleted (ALRS Theorem 5.1.1(2), p. 92, ALRS line 4747).

A proof route: Boundedness of `τ_{≥0}R^la` follows by adjunction from boundedness of C^la_G ⊗ R; †-rational localizations of GSpec(R) are pulled back from GSpec(R^la) because `R^{la,u}` = R^u (ABLB Lemma 3.1.8), and the sites agree by ABLB Proposition 3.2.11 for the Berkovich-étale maps of ABLB Definition 3.2.8 (ALRS Remark 5.4.4 cites the pair as Lemma 3.2.8 and Proposition 3.2.11).

*Needs:* §10.6; §10.5; §1.6; §2.6.

The API has the following laws.

- For a Gelfand ring R with an action of a compact p-adic Lie group, `τ_{≥0}R^la` is a Gelfand ring; if R is classically decompleted, the analytic, finite étale and Berkovich-étale sites of R^la, R and R^u agree.
- For classically decompleted R, every G-equivariant Berkovich-étale R → R′ has R′ ≅ B `⊗_{R^la}` R G-equivariantly for a Berkovich-étale R^la-algebra B with a locally analytic G-action.
- Local classical decompletedness is local on strict closed covers by G_i-stable pieces, passes to Berkovich (finite) étale maps X′ → X with an extension of the action of an open subgroup and descends along such maps that are covers, is stable under base change along G^la-equivariant Y → X^la with (X `×_{X^la}` Y)^la = Y, and under products with `(X × Y)^{(G×H)-la} = X^{G-la} × Y^{H-la}`.
- For classically decompleted X = GSpec(R), R^la → O^la_X is an equivalence, `GSpec_{|X|^Betti/G^la}(O^la_X)` ≅ GSpec(R^la)/G^la and `Mod_{R^la}(D(BG^la)) ≅ Mod_{O^la_X}(D(|X|^Betti/G^la))`.

**Checks.**

- For K = ℚ_p^cyc with Γ = Gal(ℚ_p^cyc/ℚ_p), K^la = `ℚ_p(μ_{p^∞})` is connective with completion K, so K is classically decompleted; this is the Berger–Colmez computation (BC16 Théorème 3.2).
- For trivial G every Gelfand ring is classically decompleted with R^la = R.
- For R = C(G, ℚ_p) with translation action, R^la = C^la_G and its uniform completion is R, so R is classically decompleted with X^la = G^la.

### 10.8 Integral binomial-analytic vectors and the ϵ-TORS criterion

Let G be a uniform pro-p group of dimension d with the coordinates of 10.4, and let Λ, ϖ and |−|_ϖ be as in 10.4 with |p|_ϖ ≤ 1/2 and ϖ^ϵ ∈ Λ for every ϵ in a dense subset E of `ℚ_{>0}` containing the exponents ϵ, (d + 1)ϵ and, when positive, δ used below (ALRS p. 112, ALRS line 5987, which assumes every rational ϵ > 0 and notes in its footnote 43 that a dense set suffices). For a Λ°-linear solid G-representation M define its integral binomial-analytic vectors `M^{Bin_{r,ϖ}}` = Γ`(G, M ⊗_{Λ°} C_{r,ϖ}(G, Λ°))` (ALRS Definition 5.5.1, p. 112, ALRS line 5997). Prove that if a G-equivariant ϖ-complete solid animated Λ°-algebra A satisfies (ϵ-TORS) — there are 2 > r_0 > r_1 > ⋯ > 1, r_n → 1, with `π_i(A^{Bin_{r_n,ϖ}})` ϖ^ϵ-torsion for i ≤ −1 — and a connective ϖ-complete G-equivariant A-module N admits G-equivariant `A_{ϖ^{(d+1)ϵ}}`-linear maps `N_{ϖ^{(d+1)ϵ}}` → M `⊗_{R_0}` `A_{ϖ^{(d+1)ϵ}} → N_{ϖ^{(d+1)ϵ}}` composing to ϖ^δ, where 0 ≤ δ < ϵ, N_a is the derived quotient of N by a ∈ Λ° (ALRS line 6053), R_0 = Γ`(G, (τ_{≥0}A^{Bin_{r_0,ϖ}})_{ϖ^{(d+1)ϵ}})` and M is an R_0-module, not necessarily connective, with trivial G-action, then N[1/ϖ] admits a decompletion by `Bin_{r_n,ϖ}`-analytic vectors, in particular by locally analytic vectors (ALRS Proposition 5.5.6, p. 113, ALRS line 6055); prove stability under relatively locally analytic base change (ALRS Corollary 5.5.13, p. 116, ALRS line 6203), say that A satisfies ϵ-TORS uniformly on G if it satisfies ϵ-TORS as a G_0-equivariant algebra for every G_0 in a basis of compact open subgroups of G (ALRS Definition 5.5.14, p. 116, ALRS line 6213), and prove its stability under integral models of Tate-rational localizations (ALRS Lemmas 5.5.16–5.5.17, p. 116, ALRS line 6225).

A proof route: Tensor the given almost-retraction with the binomial-analytic functions and use the torsion bound on negative homotopy of `A^{Bin}` to make the comparison map an equivalence after inverting ϖ; the Lazard–Serre resolution (NoncommutativeAndEquivariantIwasawa §0.11, read in solid modules as in 10.2) bounds the cohomological amplitude by d.

*Needs:* §10.4; §10.5; §10.2; §1.3; NoncommutativeAndEquivariantIwasawa §0.11.

The API has the following laws.

- If A satisfies ϵ-TORS and a connective ϖ-complete G-equivariant A-module N admits G-equivariant `A_{ϖ^{(d+1)ϵ}}`-linear maps `N_{ϖ^{(d+1)ϵ}}` → M `⊗_{R_0}` `A_{ϖ^{(d+1)ϵ}} → N_{ϖ^{(d+1)ϵ}}` composing to ϖ^δ, with 0 ≤ δ < ϵ, R_0 = Γ`(G, (τ_{≥0}A^{Bin_{r_0,ϖ}})_{ϖ^{(d+1)ϵ}})` and M an R_0-module, not necessarily connective, with trivial action, then `N[1/ϖ]^{Bin_{r_n,ϖ}}` `⊗_{A[1/ϖ]^{Bin_{r_n,ϖ}}}` A[1/ϖ] → N[1/ϖ] is an equivalence for every r_n of the condition, and N[1/ϖ] decompletes by locally analytic vectors.
- For G-equivariant A → B and A → C with `B_{ϖ^δ}` ≅ M `⊗_{τ_{≥0}Γ(G, A_{ϖ^δ})}` `A_{ϖ^δ}` G-equivariantly, for some δ > dϵ > 0 and a connective M with trivial action, if C satisfies ϵ-TORS then B ⊗_A C satisfies dϵ-TORS, and likewise uniformly on G.
- If a p-complete Λ°-algebra A satisfies ϵ-TORS uniformly on G and f ∈ A has reduction modulo p^s coming from a G-equivariant map (ℤ/p^s)[T] → A/p^s with trivial action on (ℤ/p^s)[T], for integers s > k ≥ 1, then A⟨f/p^k⟩ and A⟨p^k/f⟩ satisfy dϵ-TORS uniformly on G.

**Checks.**

- For A = Λ° with trivial G-action, `τ_{≥0}A^{Bin_{r,ϖ}}` = Λ° and the negative homotopy groups of `A^{Bin_{r,ϖ}}` = Γ`(G, C_{r,ϖ}(G, Λ°))` are killed by ϖ^ϵ once `2^{−ϵ}` < `r^{−ω}`, where ω = `Σ_{I,J ⊆ {1,…,d}}` |w_I − w_J| and w_I = `Σ_{i∈I}` w(g_i), so ϵ-TORS holds for every ϵ > 0 along radii r_n → 1 (ALRS Example 5.5.9, p. 115, ALRS line 6145); so does every ϖ-complete G-equivariant Λ°-algebra whose reduction modulo some ϖ^δ, δ > 0, carries the trivial action (ALRS Lemma 5.5.11, p. 115, ALRS line 6170). The negative homotopy need not vanish, so `A^{Bin_{r,ϖ}}` = A is false: for G = ℤ_p with generator γ, `π_{−1}` is the cokernel of γ − 1 on `C_{r,ϖ}(ℤ_p, Λ°)`, whose image is, up to the translation `γ^{±1}`, which fixes constants, that of the difference operator Σ c_n binom(x, n) ↦ Σ `c_{n+1}` binom(x, n); the constant 1 is not in it, its preimages c_0 + binom(x, 1) having |1|_ϖ `r^{w(γ)} = r^{w(γ)}` > 1, and `π_{−1}` is killed by ϖ^ϵ exactly when `2^{−ϵ}` `r^{w(γ)}` ≤ 1.
- For d = 0 (G trivial), `C_{r,ϖ}(G, Λ°)` = Λ°, `A^{Bin_{r,ϖ}}` = A and R_0 = `A_{ϖ^ϵ}`, so every N satisfies the hypothesis with M = `N_{ϖ^ϵ}` and δ = 0, and every module decompletes.
- If for every r ∈ (1, 2) the group `π_{−1}(A^{Bin_{r,ϖ}})` contains an element killed by no power of ϖ, then ϵ-TORS fails for every ϵ and ALRS Proposition 5.5.6 does not apply; strong decompletion requires the torsion bound.

### 10.9 Strong decompletion and perfect complexes

Let G be a p-adic Lie group and X → X′ a G^cont-equivariant map of Berkovich spaces which, locally on |X′|, is a map of affinoid Gelfand stacks inducing an isomorphism of uniform completions, with G acting locally analytically on X′, that is, through an action of G^la; let G_0 ⊆ G be an open subgroup, Y′ → X′ a G_0^la-equivariant map of Berkovich spaces and Y = Y′ `×_{X′}` X. Prove that the square with top row Y/G_0^cont → Y′/G_0^la and bottom row X/G^cont → X′/G^la is cartesian; that if X is locally classically decompleted with X^la = X′, then Y is locally classically decompleted for G_0 with Y^la = Y′, and conversely when Y′ → X′ is an epimorphism; and that, when X′ = X^la and Y′ → X′ is an epimorphism, pullback Perf(X′/G^la) → Perf(X/G^cont) is an equivalence if Perf(Y′/G_0^la) → Perf(Y/G_0^cont) is one (ALRS Lemma 5.6.2, p. 119, ALRS line 6348). Prove that for G, Λ, ϖ and E as in 10.8 and a G^cont-equivariant animated Λ°-algebra A that is ϖ-adically complete with A/ϖ discrete and satisfies ϵ-TORS uniformly on G for some ϵ ∈ E, every G-equivariant perfect A[1/ϖ]-module P decompletes: P^la `⊗_{A[1/ϖ]^la}` A[1/ϖ] → P is an equivalence (ALRS Proposition 5.6.4, p. 120, ALRS line 6444). For a p-adic Lie group G of dimension d and Λ, ϖ, |−|_ϖ and E as in 10.8 (ALRS p. 124, ALRS line 6727), call an affinoid Berkovich G^cont-space GSpec(A) over Λ strongly decompleted if there are an open uniform subgroup G_0, a direct system of G_0-equivariant ϖ-complete animated Λ°-algebras A_i with A_i/ϖ discrete and A = colim A_i[1/ϖ], each A_i satisfying ϵ_i-TORS uniformly on G_0; call a locally classically decompleted X locally strongly decompleted if, for some compact open G_0, a G_0^la-equivariant epimorphism Y′ → X^la from a Berkovich space over GSpec(Λ) has pullback Y = Y′ `×_{X^la}` X a disjoint union of strongly decompleted affinoids (ALRS Definition 5.6.8, p. 124, ALRS line 6730). Prove that strongly decompleted rings are classically decompleted (ALRS Remark 5.6.9, p. 124, ALRS line 6746), that for locally strongly decompleted X pullback gives Perf(X^la/G^la) ≃ Perf(X/G^cont) (ALRS Theorem 5.6.10, p. 124, ALRS line 6754), also after every G^cont-equivariant Berkovich-étale Y → X (ALRS Corollary 5.6.11, p. 125, ALRS line 6786) and that, for X over a Banach field extension K of ℚ_p with Λ a K-algebra and a filtered system of p-adically complete animated O_K-algebras `B_{j,0}` with B = colim_j `B_{j,0}[1/p]`, the base change X_B = X `×_{GSpec(K)}` GSpec(B) is again locally strongly decompleted, so that Perf(X_B^la/G^la) ≃ Perf(X_B/G^cont) (ALRS Corollary 5.6.12, p. 125, ALRS line 6824). The strong decompletion hypothesis is part of the statement: ALRS does not prove the equivalence on perfect complexes for arbitrary continuous actions (ALRS Remark 5.1.4, p. 93, ALRS line 4791).

A proof route: By Lemma 5.6.2 reduce to G^cont-equivariant perfect complexes on a strongly decompleted affinoid GSpec(R), R = colim A_i[1/ϖ]; a perfect complex descends to some A_i, where ALRS Proposition 5.6.4 (built on 10.8 and the almost isomorphism colim_r `C_{r,ϖ}(G, Λ°)` → C(G, Λ°) of ALRS Lemma 5.6.3) produces the decompletion; full faithfulness comes from 10.7.

*Needs:* §10.8; §10.7; §10.6; §2.3; §2.2; §4.3.

The API has the following laws.

- For a G^cont-equivariant map X → X′ of Berkovich spaces that is locally on |X′| a map of affinoid Gelfand stacks inducing an isomorphism of uniform completions, with G acting on X′ through G^la, an open subgroup G_0 ⊆ G, a G_0^la-equivariant Y′ → X′ and Y = Y′ `×_{X′}` X, the square Y/G_0^cont → Y′/G_0^la over X/G^cont → X′/G^la is cartesian; local classical decompletedness with X^la = X′ passes from X to Y with Y^la = Y′, and back when Y′ → X′ is an epimorphism; and for X′ = X^la and an epimorphism Y′ → X′, Perf(Y′/G_0^la) ≃ Perf(Y/G_0^cont) implies Perf(X′/G^la) ≃ Perf(X/G^cont).
- For a G^cont-equivariant animated Λ°-algebra A, ϖ-adically complete with A/ϖ discrete and satisfying ϵ-TORS uniformly on G for some ϵ ∈ E, every G-equivariant perfect A[1/ϖ]-module P has P^la `⊗_{A[1/ϖ]^la}` A[1/ϖ] ≃ P.
- A strongly decompleted affinoid GSpec(A) is classically decompleted.
- For locally strongly decompleted X, pullback gives Perf(X^la/G^la) ≃ Perf(X/G^cont), also after every G^cont-equivariant Berkovich-étale Y → X, and, for X over a Banach field K with Λ a K-algebra, after base change to X_B for every filtered colimit B = colim_j `B_{j,0}[1/p]` of p-adically complete animated O_K-algebras.

**Checks.**

- For G trivial the equivalence is the identity of Perf(X).
- For one-dimensional Γ and a finite-dimensional K̂_∞-semilinear representation W, the decompleted module is W^la = W^fin and K̂_∞ `⊗_{K_∞}` W^la ≅ W (BC16 Théorèmes 3.2 and 3.4).
- The equivalence is not asserted for arbitrary continuous actions; only full faithfulness (10.6) holds without the strong decompletion hypothesis (ALRS Remark 5.1.4).

### 10.10 The Tate–Sen axioms and the arithmetic, geometric and mixed decompletions

Let Λ be a uniform Banach ℚ_p-algebra with pseudo-uniformizer ϖ such that ϖ^ϵ ∈ Λ for every ϵ in a dense subset E of `ℚ_{>0}`, normed by the |−|_ϖ of 10.4 (|ϖ|_ϖ = 1/2 at every point of M(Λ)), every radius below being of the form |ϖ^ϵ|_ϖ with ϵ ∈ E (ALRS p. 126, ALRS line 6847), Γ ≅ ℤ_p with generator γ and Γ_k = `γ^{p^kℤ_p}`, and A_∞ = (colim_n A_n)^∧_ϖ for static ϖ-complete ϖ-torsion-free animated Λ°-algebras A_n with A_n/ϖ discrete. Assume the Tate–Sen axioms: for every k there is n_0 such that for n ≥ n_0 there are `ρ_{n,k}`, `ϵ_{n,k}` ∈ E with 0 < `ρ_{n,k}` < `ϵ_{n,k}` and `ϵ_{n,k}` → 0 as n → ∞, with Γ_k acting trivially on `A_n/ϖ^{ϵ_{n,k}}` and the cohomology of Γ(Γ_k, A_∞/A_n) concentrated in degree 1 and `ϖ^{ρ_{n,k}}`-torsion (ALRS Assumption 5.7.1, p. 126, ALRS line 6855). Prove that A_∞ satisfies ϵ-TORS uniformly on Γ for all ϵ ∈ E and (A_∞[1/ϖ])^la = colim_n A_n[1/ϖ] (ALRS Proposition 5.7.3, p. 126, ALRS line 6875). Prove: (arithmetic) X = `(1 + D̃^{<1,u}_{ℚ_p})` ∖ {1} with G = ℚ_p^× is locally strongly decompleted with X^la = `(1 + D̃^{<1})` ∖ {1} (ALRS Theorem 5.7.4, p. 127, ALRS line 6930); the toric tower satisfies the axioms (ALRS Proposition 5.7.16, p. 134, ALRS line 7338); (geometric) for a perfectoid D over ℚ_p^cyc and G = ℤ_p(1)^d acting on X = `D^×_{FF,G̃^{d,⋄}_{m,D}} = G̃^{d,u}_{m,ℚ_p} × D^×_{FF,D}`, X is locally strongly decompleted with X^la = `G̃^d_{m,ℚ_p} × D^×_{FF,D}` (ALRS Corollary 5.7.18, p. 135, ALRS line 7371); and the summary: X_arith = `D^×_{FF,ℚ_p^cyc}` has X^la_arith = BC(O(1)) ∖ {0}, X_geo has X^la_geo = `G̃^d_{m,ℚ_p} × D^×_{FF,D}`, for X_mixed = `D^×_{FF,G̃^{d,u}_{m,ℚ_p^cyc}}` with G_mixed = ℤ_p^× ⋉ ℤ_p(1)^d one has X^la_mixed = `G̃^d_{m,ℚ_p}` × (BC(O(1)) ∖ {0}), and for every Berkovich-étale G^cont-equivariant Y → X_? (? ∈ {arith, geo, mixed}), Perf(Y^la/G^la_?) ≃ Perf(Y/G^cont_?) (ALRS Theorem 5.7.19, p. 135, ALRS line 7390).

A proof route: ALRS Lemma 5.7.2 shows that A_n is a `C_{r,ϖ}(Γ_k, Λ°)`-comodule for r below `|ϖ^{−ϵ_{n,k}}|`, which together with the torsion bound on A_∞/A_n gives ϵ-TORS. In the arithmetic case the affinoids of `(1 + D̃^{<1,u})` ∖ {1} are covered by rings `A_{∞,i}` built from normalized Tate traces on the cyclotomic tower (the classical estimates of PadicPeriodRings §§1.3–1.4, extended to the relative rings by ALRS Lemmas 5.7.5–5.7.15); the geometric case uses the analogous traces for the toric tower; the mixed case combines them with ALRS Corollary 5.6.12.

*Needs:* §10.9; §10.8; §7.6; §6.1; PadicPeriodRings §1.3; PadicPeriodRings §1.4.

**Checks.**

- For d = 0 the mixed statement reduces to the arithmetic one.
- On the Hodge–Tate point the arithmetic decompletion recovers K^la = `ℚ_p(μ_{p^∞})` for K = ℚ_p^cyc (BC16 Théorème 3.2).
- In the geometric case with d = 1 the generator γ of ℤ_p(1) acts by T^r ↦ q^rT^r, q = [ε], for r ∈ ℕ[1/p] (ALRS (5.7.10)); for r = `p^{−n}`, `(γ^{p^k} − 1)`T^r = `(q^{p^{k−n}} − 1)`T^r is divisible by `ϖ^{1/p^{n−k}}`, which is Axiom (1) of Assumption 5.7.1 with `ϵ_{n,k} = p^{k−n}` (ALRS Proposition 5.7.16(1)); here Λ = B_I contains `ϖ^{1/p^n}` for every n (ALRS line 7334), so E = `ℤ[1/p]_{>0}` is admissible and contains both `ϵ_{n,k} = p^{k−n}` and `ρ_{n,k} = p^{k−n−1}` of ALRS Proposition 5.7.16(2).
- A discretely valued Λ such as ℚ_p is excluded for every pseudo-uniformizer ϖ: ϖ^ϵ ∈ ℚ_p forces ϵ·v_p(ϖ) ∈ ℤ, so the admissible exponents form the discrete set `v_p(ϖ)^{−1}ℤ`, which is not dense; for ϖ = p the toric exponent `ϵ_{n+1,n} = p^{−1}` would need `p^{1/p}` ∈ ℚ_p.

### 10.11 Decompletion of torsors

For a locally classically decompleted Berkovich G^cont-space X with h: X/G^cont → X^la/G^la, and a Gelfand stack Z over X^la/G^la, let `β_{X,Z}`: `Map_{X^la/G^la}(X^la/G^la, Z) → Map_{X^la/G^la}(X/G^cont, Z)` be precomposition with h, a map between anima of maps over X^la/G^la, and `β^ét_{X,Z}` its étale-sheaf version on the Berkovich-étale site of X/G^cont, identified with that of X^la/G^la by 10.7 (ALRS §5.8, p. 137, ALRS line 7454). Prove that the class of Gelfand stacks Z over X^la/G^la for which `β^ét_{X,Z}` is an equivalence is stable under limits, contains every Z for which Z → `Z^{dR/(X^la/G^la)}` is an equivalence, contains Z′ whenever it contains Z and Z′ → Z is Berkovich-étale, and contains Z whenever it contains Z′ for a Berkovich-étale cover Z′ → Z (ALRS Lemma 5.8.1, p. 137, ALRS line 7473). Prove that if moreover the natural map X̂^⋄ → X is an isomorphism, for instance X perfectoid, then for every Gelfand stack Z such that `β_{X,Z′}` is an equivalence for Z′ = X^la/G^la × Z, perfectoidization induces an equivalence Map(X^la/G^la, Z) ≃ `Map_{ArcStk_{ℚ_p}}(X^⋄/G, Z^⋄)` between maps of Gelfand stacks and maps of arc-stacks over Marc(ℚ_p) (ALRS Lemma 5.8.2, p. 138, ALRS line 7511), that torsors under groups !-locally induced by Gelfand rings are !-locally maps of Gelfand rings (ALRS Lemma 5.8.5, p. 139, ALRS line 7555), that for a compact p-adic Lie group H and a G^cont-equivariant H^la-torsor T → X such that `β_{X,Z}` is an equivalence for Z = BH^la × X^la/G^la, the G^la-equivariant H^la-torsor T′ → X^la corresponding to T under `β_{X,Z}`, so that T ≅ T′ `×_{X^la}` X, satisfies `O(T)^{G-la}` ≅ O(T′) as sheaves on |X| = |X^la| (ALRS Lemma 5.8.8, p. 139, ALRS line 7581), that for p-adic Lie groups G and H and a Berkovich space W with an action of (G × H)^cont such that (i) Y := W/G^cont is a Berkovich space, locally classically decompleted for the H^cont-action with decompletion `Y^{H-la}`, and (ii) `β_{Y,Z}` is an equivalence for Z = BG^la × `Y^{H-la}/H^la`, one has `Y^{H-la}/H^la ≅ GSpec_{|W|^Betti}(O^{(G×H)-la}_W)/(G × H)^la`, and `Y^{H-la}/H^la ≅ V^{G-la}/G^la` when V := W/H^cont satisfies (i) and (ii) with G and H exchanged (ALRS Proposition 5.8.9, p. 139, ALRS line 7595), and that `β^ét_{X,Z}` is an equivalence, when perfect complexes on all Berkovich-étale X′/G^cont admit decompletions, for Z = T^an × X^la/G^la with T perfect strongly Tannakian, Z = BU × X^la/G^la with U an open subgroup of 𝐇(ℚ_p)^la = 𝐇^an `×_{𝐇^{an,dR}}` 𝐇(ℚ_p)^dR (3.4) for an affine algebraic group 𝐇 over ℚ_p, and Z = BΓ^la × X^la/G^la for a p-adic Lie group Γ (ALRS Proposition 5.8.10, p. 140, ALRS line 7627).

A proof route: For Z = T^an use the Tannakian description of maps to T^an (3.5) and the equivalence of perfect complexes; for BU pass along the Berkovich-étale map BU → B𝐇(ℚ_p)^la to U = 𝐇(ℚ_p)^la and use the cartesian square B𝐇(ℚ_p)^la = B𝐇(ℚ_p)^sm `×_{B𝐇^{an,dR}}` B𝐇^an, in which B𝐇^an is the case T = B𝐇 and the other two stacks are their own relative de Rham stacks; for BΓ^la shrink Γ to an open subgroup Γ_0 along the Berkovich-étale cover BΓ_0^la → BΓ^la, so that Γ is open in 𝐇(ℚ_p) when Lie(Γ) is the Lie algebra of an algebraic group 𝐇, as for abelian (𝐇 = G_a^n) and semisimple Lie algebras, and in general induct on dim Lie(Γ) along an extension by an abelian ideal (ALRS Proposition 5.8.10, proof of (3), ALRS line 7654); ALRS Proposition 5.8.9 combines ALRS Lemma 5.8.5, full faithfulness (10.6) and the computation of pushforward along B(G^cont × H^cont) → B(G^la × H^la) one factor at a time (10.5), which holds for all p-adic Lie groups G and H; after restricting G and H to compact open subgroups, as the source does (ALRS line 7607), it reads `(−)^{(G×H)-la} = ((−)^{G-la})^{H-la}`, the identity the source draws from ALRS Lemma 5.2.28 (ALRS line 7620).

*Needs:* §10.9; §10.7; §10.6; §10.5; §3.5; §3.4; §2.8; §2.7.

The API has the following laws.

- The Gelfand stacks Z over X^la/G^la for which `β^ét_{X,Z}` is an equivalence are stable under limits, include every Z with Z → `Z^{dR/(X^la/G^la)}` an equivalence, include Z′ along with Z whenever Z′ → Z is Berkovich-étale, and include Z along with Z′ whenever Z′ → Z is a Berkovich-étale cover.
- If X̂^⋄ → X is an isomorphism and `β_{X,Z′}` is an equivalence for Z′ = X^la/G^la × Z, then (−)^⋄ gives Map(X^la/G^la, Z) ≃ `Map_{ArcStk_{ℚ_p}}(X^⋄/G, Z^⋄)`.
- For a compact p-adic Lie group H and a G^cont-equivariant H^la-torsor T → X with `β_{X,Z}` an equivalence for Z = BH^la × X^la/G^la, T ≅ T′ `×_{X^la}` X for a G^la-equivariant H^la-torsor T′ → X^la, and `O(T)^{G-la}` ≅ O(T′) as sheaves on |X|.
- For p-adic Lie groups G and H and a Berkovich space W with a (G × H)^cont-action such that Y = W/G^cont is a Berkovich space, locally classically decompleted for the H^cont-action with decompletion `Y^{H-la}`, and `β_{Y,Z}` is an equivalence for Z = BG^la × `Y^{H-la}/H^la`, one has `Y^{H-la}/H^la` ≅ `GSpec_{|W|^Betti}(O^{(G×H)-la}_W)/(G × H)^la`.
- When perfect complexes on all Berkovich-étale X′/G^cont admit decompletions, `β^ét_{X,Z}` is an equivalence for Z = T^an × X^la/G^la with T perfect strongly Tannakian, for Z = BU × X^la/G^la with U an open subgroup of 𝐇(ℚ_p)^la, and for Z = BΓ^la × X^la/G^la with Γ a p-adic Lie group.

**Checks.**

- For the trivial torsor `β_{X,Z}` sends the trivial H^la-torsor on X^la/G^la to the trivial one on X/G^cont.
- For Γ finite, Γ^la = Γ^sm and Z = BΓ^la × X^la/G^la: β^ét is an equivalence by ALRS Lemma 5.8.1(2), since BΓ^sm is its own relative de Rham stack.
- For G trivial in the double decompletion, Y = W and Z = B1 × `Y^{H-la}/H^la = Y^{H-la}/H^la`, so `β_{Y,Z}` is a map between two contractible mapping anima and (ii) holds; the formula reads `Y^{H-la}/H^la ≅ GSpec_{|Y|^Betti}(O^{H-la}_Y)/H^la`, which over each classically decompleted affinoid of Y is the isomorphism of 10.7 (ALRS Corollary 5.4.6) for H. Without (i) the left side is not defined.
- For a compact p-adic Lie group G and a Berkovich space S, a G^la-torsor P → S is !-locally a map of Gelfand rings (ALRS Lemma 5.8.5), and ALRS Remark 5.8.6 leaves open whether P is a Berkovich space: for G = GL_n(ℤ_p) the induced GL_n-torsor P′ = P `×^{GL_n(ℤ_p)^la}` GL_n is a Berkovich space and P is the overconvergent neighbourhood of the closed subset |P| ⊆ |P′|. Only !-local affineness is asserted, never a Berkovich structure on P; for the trivial torsor over a point, P′ = GL_n and P = GL_n(ℤ_p)^la, the overconvergent neighbourhood of the profinite set GL_n(ℤ_p) in GL_n.
- The choices Z = BU × X^la/G^la and Z = BΓ^la × X^la/G^la meet: for 𝐇 = GL_n and Γ = GL_n(ℤ_p), Γ^la is the open subgroup GL_n(ℤ_p)^la of GL_n(ℚ_p)^la = GL_n^an `×_{GL_n^{an,dR}}` GL_n(ℚ_p)^dR (3.4, 10.3), so U = Γ^la gives the same Z. For 𝐇 = G_a, 𝐇(ℚ_p)^la = ℚ_p^la (3.4) contains U = ℤ_p^la. U is always formed from an algebraic group 𝐇: a compact p-adic Lie group such as ℤ_p has no functor of ℚ_p-points from which to form (−)(ℚ_p)^la.

### 10.12 The decompletion theorem

Let X be a Berkovich space with a continuous action of a p-adic Lie group G, i.e. an action of G^cont, and h: X/G^cont → |X|^Betti/G^la. Then: (1) h is 0-proper and h^* is fully faithful on modules over O^la_X = h_*O; (2) if X = GSpec(R) is affinoid and R is classically decompleted, R^la → O^la_X is an equivalence and `Mod_{R^la}(D(BG^la)) ≅ Mod_{O^la_X}(D(|X|^Betti/G^la))`, and G^cont-equivariant affinoid Berkovich-étale maps to X are classically decompleted; (3) if X is locally strongly decompleted, then every G^cont-equivariant Berkovich-étale X′ → X has a strict closed affinoid cover classically decompleted for the stabilizers, `O^la_{X′}` is the structure sheaf of a Berkovich space X′^la with |X′^la| = |X′|, and Perf(X′^la/G^la) ≃ Perf(X′/G^cont) (ALRS Theorem 5.1.1, p. 92, ALRS line 4738).

A proof route: Part (1) is 10.6, part (2) is 10.7 and part (3) is 10.9 together with ALRS Lemma 5.4.7 for the classical decompletion of Berkovich-étale covers.

*Needs:* §10.6; §10.7; §10.9.

**Checks.**

- For G trivial, X^la = X, (1) is the Betti projection of 2.7 and (2)–(3) are tautological.
- For G trivial and X the closed unit disc GSpec(ℚ_p⟨T⟩), whose space |X| is connected, the unit of D(|X|^Betti) has endomorphism ring the locally constant functions ℚ_p, while O_X has endomorphism ring ℚ_p⟨T⟩; so h^* is not fully faithful on all of D(|X|^Betti), only on modules over h_*O = O^la_X, where it identifies `Mod_{O^la_X}(D(|X|^Betti))` with D(X). A version of (1) without the restriction to `O^la_X`-modules would be false.
- For X = `D^×_{FF,ℚ_p^cyc}` with G = ℤ_p^×, (3) gives Perf`(BC(O(1)) ∖ {0}/ℤ_p^{×,la}) ≃ Perf(X/ℤ_p^{×,cont})`, the decompletion used in 11.1.
- Without strong decompletion only (1) is asserted; in particular the equivalence on perfect complexes is not claimed for arbitrary continuous actions.

### Examples

For G = ℤ_p^× acting on X_arith = `D^×_{FF,ℚ_p^cyc}`, X^la_arith = BC(O(1)) ∖ {0} = `(1 + D̃^{<1})` ∖ {1}. For K = ℚ_p^cyc with Γ = ℤ_p^×, K^la = `ℚ_p(μ_{p^∞})`, recovering Berger–Colmez. For G finite, G^la = G^sm = G^cont and every representation is locally analytic.

### Dependencies

Layers 0–7; NoncommutativeAndEquivariantIwasawa §0.1, §0.2, §0.6, §0.7, §0.11; PadicFunctionalAnalysis §4.4; Mathlib `PadicInt.mahlerEquiv`; EnhancedDerivedSheaves §E5:abstract.2, §E5:abstract.5; LocallyAnalyticRepresentationsOfLocalGroups §2.3 and §3.8 (comparison Checks); LocallyAnalyticDistributionsPartII §1.5 (comparison Check); PadicPeriodRings §1.3, §1.4; SolidAnalyticRings §1.5; AnalyticStacks §§0.8–0.11, §0.12, §2.3, §2.11, §3.6, §4.2, §4.3; RefinedTraceMethods §4.3.

## Layer 11: The pro-étale comparison, Sen operators and torsors

This layer proves the comparison between the p-adic twistor stack and the relative Fargues–Fontaine curve: for p-adic fields, for rigid smooth spaces over perfectoid bases, and for smooth partially proper rigid spaces over a finite extension of ℚ_p, the headline theorem. It derives the computation of pro-étale ℚ_p-cohomology as coherent cohomology of the twistor stack, the comparison of Hodge–Tate stacks with v-perfect complexes, the arithmetic and geometric Sen operators and the inverse Faltings' extension, and the decompletion of pro-étale torsors under p-adic Lie groups with their Sen operators.

### 11.1 The arithmetic comparison

Let K be a finite extension of ℚ_p and X = GSpec(K). Prove that α_X: `FF_{X^⋄} → X^{Div¹}` is 0-proper with O ≅ `α_{X,*}O`, so that for every map Y → `X^{Div¹}` pullback D(Y) → `D(FF_{X^⋄} ×_{X^{Div¹}} Y)` is fully faithful, and that for every Berkovich-étale U → `X^{Div¹}`, pullback Perf(U) → `Perf(FF_{X^⋄} ×_{X^{Div¹}} U)` is an equivalence (ALRS Theorem 6.1.1, p. 143, ALRS line 7756). Let K/ℚ_p be unramified with residue field k and arithmetic Frobenius σ ∈ Gal(K/ℚ_p), so σ(x) ≡ x^p modulo p for x ∈ O_K, and write GSpec(σ) for the automorphism of GSpec(K) with ring map σ. Prove that there are isomorphisms X^Δ ≅ GSpec(K) × Q_p^Δ and `X^{Div¹~}` ≅ GSpec(K) × Div¹~ under which the Frobenius is GSpec(σ) × φ, so that `X^{Div¹}` ≅ (GSpec(K) × Div¹~)/(GSpec(σ) × φ)^ℤ = GSpec(K)/σ^ℤ `×_{GSpec(ℚ_p)/φ^ℤ}` Div¹, where ℤ acts trivially on GSpec(ℚ_p) (ALRS Remark 6.1.5, p. 145, ALRS line 7873, in Frobenius-twisted form: the untwisted product GSpec(K) × Div¹ written there holds only for K = ℚ_p; the fibre product over GSpec(ℚ_p)/φ^ℤ has the shape of ALRS footnote 48, p. 143, ALRS line 7776).

A proof route: Since K/ℚ_p is étale the square `FF_{X^⋄} → FF_{Q_p^⋄}` over `X^{Div¹}` → Div¹ is cartesian, reducing to K = ℚ_p. Then `FF_{Q_p^⋄} = FF_{ℚ_p^cyc}/ℤ_p^{×,cont}` (6.2), Div¹ = `FF^la_{ℚ_p^cyc}/ℤ_p^{×,la}` by 9.7 and 10.10, and α identifies with h of 10.12; (1) is 10.12(1) and (2) is 10.10. For unramified K, a K-structure on an untilt of a perfectoid S is the same as a k-structure on S, because the minimal polynomial of a generator of O_K over ℤ_p stays separable modulo p; hence Marc(K) = Marc(ℚ_p) `×_{Marc(𝔽_p)}` Marc(k). The functor `D^×_{FF,−}` preserves finite limits (6.2), sends the terminal arc-stack Marc(𝔽_p) to GSpec(ℚ_p) (ABLB Remark 4.4.11, p. 50, ABLB line 2653), and sends Marc(k) to GSpec(K) with Frobenius GSpec(σ), since φ^*[a] = [a^p] on Teichmüller lifts restricts to σ on W(k). So `D^×_{FF,X^⋄} = D^×_{FF,Q_p^⋄}` × GSpec(K) with Frobenius φ × GSpec(σ), and the same holds for de Rham stacks (3.2; GSpec(K)^dR = GSpec(K) since K is étale). The cartesian square of 8.3 for the †-formally étale map GSpec(K) → GSpec(ℚ_p) then gives X^Δ = GSpec(K) × Q_p^Δ compatibly with Frobenius; pass to lim_φ and to the quotient by φ^ℤ (8.2).

*Needs:* §9.7; §10.12; §10.10; §6.2; §8.6; §8.3; §8.2; §3.2.

**Checks.**

- On vector bundles, `Perf(Div¹)^{VB}` is the category of (φ, Γ)-modules over the Robba ring, and the equivalence restricted to `FF_{Q_p^⋄}` recovers the cyclotomic decompletion between ordinary and extended Robba (φ, Γ)-modules of PhiGammaModulesAndIwasawaCohomology §1.4.
- Continuous finite-dimensional ℚ_p-representations V of Gal_K embed fully faithfully as vector bundles E_V on `X^{Div¹}`, with essential image those whose pullback to `FF_{ℚ_p^cyc}` has slope 0 (ALRS Example 6.1.7; VectorBundlesAndIsocrystals Layer 6, “Slope-zero bundles and E-local systems”).
- H⁰ of the pushforward of `E_V|_{X^HT}` along X^HT → BG_m is D_HT(V) as a graded K-vector space, up to the sign convention of the grading (ALRS Example 6.1.7(1), p. 146, ALRS line 7888); the pushforward itself also has H¹: for V = ℚ_p its weight-0 part is RΓ(X^HT, O) = K ⊕ K[−1] by the first Check of 11.2, whose H⁰ = K is D_HT(ℚ_p).
- On all of D the pullback is fully faithful but not an equivalence: for π: `FF_{ℚ_p^cyc} → FF_{Q_p^⋄}`, π_*O = O ⊗ C(ℤ_p^×, ℚ_p) with the regular action, whereas α^*α_*π_*O = O ⊗ C^la(ℤ_p^×, ℚ_p), so π_*O is not in the essential image of α^*.
- For K = `ℚ_{p²}` the untwisted product GSpec(K) × Div¹ has Γ(O) = K ⊗ `RΓ(Gal_{ℚ_p}, ℚ_p)`, of dimensions 2, 4, 0 in degrees 0, 1, 2, whereas `Γ(X^{Div¹}, O)` = RΓ(Gal_K, ℚ_p) has dimensions 1, 3, 0 (11.7); the projection of the untwisted product to GSpec(K) would give a ring map K → `H⁰(X^{Div¹}, O)` = ℚ_p, which does not exist. In the twisted form, H⁰(Div¹~, O) = `B^{Gal_{ℚ_p}}` = ℚ_p for B the ring of functions on `D^×_{FF,C_p♭}` (it lies in `(B⁺_dR)^{Gal_{ℚ_p}}` = ℚ_p), so `H⁰(X^{Div¹}, O) = (K ⊗ ℚ_p)^{σ⊗1}` = ℚ_p, as 11.7 requires. For K = ℚ_p the twist is trivial and the formula reads `X^{Div¹}` = Div¹.
- The direction of the twist: for K = `ℚ_{p³}`, pull `X^{Div¹}` back along `FF_{C_p♭}` → Div¹. The twisted form gives `(GSpec(K) × D^×_{FF,C_p♭})/(GSpec(σ) × φ)^ℤ`, with functions `(K ⊗ B)^{σ⊗φ}`; writing K ⊗ B = ∏_τ B over the three embeddings τ: K → `B^{φ³=1} = ℚ_{p³}`, and using φ∘τ = τ∘σ, the operator σ ⊗ φ acts by φ on each factor, so the functions are ℚ_p³, those of `FF_{Marc(K ⊗ C_p)}` = ⊔_τ `FF_{C_p♭}` given by the cartesian square of the proof route. With `GSpec(σ^{-1})` in place of GSpec(σ) the operator applies φ to the factor `τσ^{-2}` and places it in the factor τ, permuting the three factors cyclically, and the invariants form a field isomorphic to `ℚ_{p³}`; so the twist is by σ and not by `σ^{-1}`.

### 11.2 The arithmetic Hodge–Tate stack and the arithmetic Sen operator

For K/ℚ_p finite and X = GSpec(K), prove (1) that α^HT_X: X̂^⋄ → X^HT is 0-proper with O ≅ α^HT_*O and induces Perf(X^HT) ≃ Perf(X̂^⋄), and (2) that `L_{X^HT/ℚ_p} = L_{X^HT/X} ≅ O_{X^HT}[−1]`. Using the G_m^† ≅ G_a^†-gerbe structure of X^HT → X and Cartier duality, D(X^HT) is a module over D(G_a^an), giving each M ∈ D(X^HT) its arithmetic Sen operator θ_M. Prove: (a) for M in the essential image of `α^{HT,*}`, viewed as a solid C_p-semilinear Gal_K-representation, θ_M is the base change along `K(ζ_{p^∞})` → C_p of the derivative of the Γ-action on `α^HT_*(M)|_{K(ζ_{p^∞})} = Γ(Gal^cont_{K^cyc}, M)^{Γ-la}`; (b) for static M in the essential image, H*(Gal^cont_K, M) ≅ H*`(θ_M, M)^{Gal_K}` (ALRS Theorem 6.1.3, p. 144, ALRS line 7798). Prove that H^i(Gal_K, C_p(n)) ≅ H^i(X^HT, O{n}) ≅ H^i(K `→^{n}` K) for every i ≥ 0 and n ∈ ℤ, with `θ_{O{n}}` = n (ALRS Example 6.1.4, p. 145, ALRS line 7868). In degrees 0 and 1 this recovers Tate's calculation of PadicPeriodRings §1.4, which is not rebuilt here; the content of the target is its identification with the cohomology of O{n} on X^HT, which also gives the vanishing in degrees i ≥ 2.

A proof route: (1) follows from 11.1 and the cartesian square X̂^⋄ = `FF_{X^⋄}` `×_{X^{Div¹}}` X^HT, pushforward along the Cartier divisor X̂^⋄ → `FF_{X^⋄}` being conservative and preserving perfect complexes; (2) holds since X^HT → BG_m is †-formally étale and `L_{BG_m}` = O[−1] (4.8); for (a), over K_∞ the gerbe trivializes and the BG_a^†-action becomes the Γ^†-action, so θ is the derivative of the locally analytic Γ-action; (b) uses Γ(Gal_K, M) = Γ(X^HT, N) = Γ(Γ^sm, Γ(θ_N, N)) and exactness of smooth Γ-invariants in characteristic zero.

*Needs:* §11.1; §9.7; §4.8; §9.8; PadicHodgeTheory §4.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2; AnalyticStacks §7.2, §7.5; AnalyticStacks §7.6.

The API has the following laws.

- For K/ℚ_p finite and X = GSpec(K), α^HT_X is 0-proper with O ≅ α^HT_*O, Perf(X^HT) ≃ Perf(X̂^⋄), and `L_{X^HT/ℚ_p}` = `L_{X^HT/X}` ≅ O[−1].
- Every M ∈ D(X^HT) carries an arithmetic Sen operator θ_M, natural in M; for M in the essential image of `α^{HT,*}`, θ_M is the base change along `K(ζ_{p^∞})` → C_p of the derivative of the Γ-action on Γ`(Gal^cont_{K^cyc}, M)^{Γ-la}`.
- For static M in the essential image of `α^{HT,*}`, H*(Gal^cont_K, M) ≅ H*`(θ_M, M)^{Gal_K}`.
- `θ_{O{n}}` = n, so H^i(Gal_K, C_p(n)) ≅ H^i(K `→^{n}` K).

**Checks.**

- For M = C_p(n): if n ≠ 0, θ = n is invertible and H*(Gal_K, C_p(n)) = 0; if n = 0, θ = 0 and H⁰ = H¹ = K, H² = 0. In degrees 0 and 1 these are the values of Tate's calculation in PadicPeriodRings §1.4 (H⁰(G_K, C_p(i)) = K for i = 0 and 0 otherwise, H¹ one-dimensional over K, spanned by log χ, for i = 0 and 0 otherwise).
- On finite-dimensional C_p-semilinear representations θ_M is the Sen operator of PadicHodgeTheory §4.4 and the labelled Sen operator of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2, in which χ_p has weight +1, so that both give 1 on C_p(1).
- With the opposite sign `θ_{O{1}}` = −1 one would get H*(Gal_K, C_p(1)) computed by K `→^{−1}` K, still zero, but the Sen weight of the Tate twist would be −1, contradicting the Sen operator of PadicHodgeTheory §4.4 on C_p(1), which is multiplication by 1.
- `L_{X^HT/ℚ_p}` = O[−1]: the classifying stack BG_m^† of the band contributes the shifted dual of its one-dimensional Lie algebra.

### 11.3 Toric charts: the twistor stack as a locally analytic quotient

Let X = G_m^d over ℚ_p, X̃ = `lim_{T↦T^p}` X the perfected torus in Gelfand stacks and Γ_d = ℤ_p^× ⋉ ℤ_p^d, the p-adic Lie group in which ℤ_p^× acts on ℤ_p^d by multiplication (the group G_mixed of 10.10 with ℤ_p(1) trivialized), so that Γ_d^la = `ℤ_p^{×,la}` ⋉ `ℤ_p^{d,la}`. Prove that `X^{Div¹} ≅ X̃_{X_cyc}/(φ^ℤ × Γ_d^la) = FF^la_{X̃^{d,⋄}_{ℚ_p^cyc}}/Γ_d^la`, where FF^la is glued from the spectra of Γ_d-locally analytic vectors of Γ_d-stable affinoids of `FF_{X̃^{d,⋄}_{ℚ_p^cyc}}`, while `FF_{X^⋄} = FF_{X̃^{d,⋄}_{ℚ_p^cyc}}/Γ_d^cont`, so that α_X is the natural map from the continuous to the locally analytic quotient (ALRS Remark 4.10.15, p. 90, ALRS line 4683; ALRS (1.2.1), p. 8, ALRS line 399); the Lie algebra of Γ_d acts on FF^la through (log q)q∂_q, `(log q)T_i∂_{T_i}`, with logarithmic poles at the Hodge–Tate locus (ALRS §4.10, p. 91, ALRS line 4704).

A proof route: ALRS Theorem 4.10.13 (9.9) and its Frobenius-equivariant refinement (ALRS Remark 4.10.14) give `G_m^{Div¹} ≅ G̃_{m,X_cyc}/(φ^ℤ × ℤ_p^{×,la} ⋉ ℤ_p^la)`; products give the d-dimensional case; the mixed decompletion of 10.10 identifies the quotient with FF^la/Γ_d^la.

*Needs:* §9.9; §10.10; §6.2; §8.2.

**Checks.**

- For d = 0 the statement is Div¹ = `FF^la_{ℚ_p^cyc}/ℤ_p^{×,la} = X_cyc/ℚ_p^{×,la}` of 9.7.
- For d = 1 the Lie algebra of Γ_1 acts by (log q)q∂_q and (log q)T∂_T, the factor log q being the derivative of a ↦ q^a; the action has logarithmic poles along the Hodge–Tate locus and is trivial modulo log q, and the residual linear action on the Hodge–Tate stack gives the arithmetic and geometric Sen operators of 11.2 and 11.5.
- The continuous quotient `FF_{X̃^{d,⋄}_{ℚ_p^cyc}}/Γ_d^cont` is `FF_{X^⋄}`, not `X^{Div¹}`: already for d = 0 the pushforwards of O from `FF_{ℚ_p^cyc}` to the two quotients are O ⊗ C(ℤ_p^×, ℚ_p) and O ⊗ C^la(ℤ_p^×, ℚ_p) (11.1), so the two quotients differ exactly by α_X.

### 11.4 The geometric comparison over a perfectoid base

Let D be a perfectoid space over ℚ_p and X → D a rigid smooth morphism of Berkovich spaces. Prove that `α_{X/D}`: `FF_{X^⋄} → X^{Div¹/FF_D}` is 0-proper with O ≅ `α_{X/D,*}O`, so pullback from any Y → `X^{Div¹/FF_D}` is fully faithful, and that for every Berkovich-étale U → `X^{Div¹/FF_D}`, Perf(U) ≃ `Perf(FF_{X^⋄} ×_{X^{Div¹/FF_D}} U)` (ALRS Theorem 6.2.1, p. 146, ALRS line 7921).

A proof route: The statements are local on the target, so D = GSpec(A) affinoid over ℚ_p^cyc; by descent along †-formally étale covers (8.7) localize X in the rigid étale topology to X étale over `G^d_{m,A}`, and by base change and Künneth to d = 1; after passing to ℤ-covers the map is `G̃^u_{m,D^×_{FF,A}}/Γ^cont → G̃_{m,D^×_{FF,A}}/Γ^la` with Γ = ℤ_p(1) by ALRS Theorem 4.10.13 (9.9), and 10.12 with the geometric case of 10.10 concludes.

*Needs:* §11.3; §10.12; §10.10; §8.7; §8.2; §9.9.

**Checks.**

- For X = D, `X^{Div¹/FF_D} = D^{Div¹}` `×_{D^{Div¹}}` FF_D = FF_D, the base change of an identity (8.2), and `α_{D/D}` is the identity of FF_D; the value does not come from an identification of `D^{Div¹}` with FF_D, which fails for perfectoid D (8.3).
- For X = `G_{m,D}`, Γ = ℤ_p(1) acts on G̃_m by [T♭]^r ↦ [ε]^r[T♭]^r for r ∈ ℤ[1/p].
- The localization in the proof uses rigid étale maps and not †-rational localizations of X, because the latter are completed on X^⋄ (ALRS footnote 51, p. 146); accordingly the statement is made for Berkovich-étale U.

### 11.5 The geometric Hodge–Tate stack, Higgs fields and geometric Sen operators

For D and X → D as in 11.4 prove: (1) `α^HT_{X/D}`: X̂^⋄ → X^HT is 0-proper with O ≅ α^HT_*O and Perf(X^HT ×_X U) ≃ Perf(X̂^⋄ ×_X U) for Berkovich-étale U → X; (2) `L_{X^HT/X} ≅ Ω¹_{X/D}{−1}[−1]`; (3) the `BT^†_{X/D}{1}`-torsor structure of X^HT → X and Cartier duality make every M ∈ D(X^HT) a `Sym_{O_X}(T_{X/D}{1})`-module, its geometric Sen operator θ_M, an `Ω¹_{X/D}{−1}`-Higgs field, which pulls back to the essential image of `α^{HT,*}`; (4) `π_X^*π_{X,*}M` is computed by the Higgs complex M → M ⊗ `Ω¹_{X/D}{−1}` → ⋯ → M ⊗ `Ω^{dim X}_{X/D}{−dim X}`; (5) every relative locally analytic orthonormalizable Banach Ô_X-sheaf lies in the essential image of `α^{HT,*}` and its geometric Sen operator is that of RCSen Theorem 1.0.3 (ALRS Theorem 6.2.2, p. 147, ALRS line 7976; RCSen Theorem 1.0.3, p. 2, RCSen line 64).

A proof route: (1) follows from 11.4 and X̂^⋄ = `FF_{X^⋄}` `×_{X^{Div¹/FF_D}}` X^HT; (2) from the cartesian square X^HT → X over `X/T_{X/D}{1} → X/T^dR_{X/D}{1}` and 4.8; (3)–(4) from Cartier duality for BT^†{1} (RC26a, AnalyticStacks §7.5(4) and §7.6) and the relative de Rham complex of X → `BT^†_{X/D}{1}`; (5) from the local description of RCSen §3.2 on toric charts.

*Needs:* §11.4; §9.2; §4.8; AnalyticStacks §7.2, §7.5; AnalyticStacks §7.6.

The API has the following laws.

- `α^HT_{X/D}` is 0-proper with O ≅ α^HT_*O, and Perf(X^HT ×_X U) ≃ Perf(X̂^⋄ ×_X U) for every Berkovich-étale U → X.
- `L_{X^HT/X} ≅ Ω¹_{X/D}{−1}[−1]`.
- Every M ∈ D(X^HT) is a `Sym_{O_X}(T_{X/D}{1})`-module through its geometric Sen operator θ_M, an `Ω¹_{X/D}{−1}`-Higgs field, and `π_X^*π_{X,*}M` is its Higgs complex.
- Every relative locally analytic orthonormalizable Banach Ô_X-sheaf lies in the essential image of `α^{HT,*}`, and its θ_M is the geometric Sen operator of RCSen Theorem 1.0.3.

**Checks.**

- For dim X = 1, `L_{X^HT/X} = Ω¹_{X/D}{−1}[−1]` and the Higgs complex has two terms M → M ⊗ Ω¹{−1}.
- A vector bundle on X^HT descends to X if and only if its geometric Sen operator vanishes, the analogue of p-curvature (ALRS Remark 6.2.5).
- For X = D the Higgs field is zero and X^HT = D.

### 11.6 The comparison with the relative Fargues–Fontaine curve

Let K be a finite extension of ℚ_p and X a smooth partially proper rigid space over K, viewed as a Berkovich space. Prove that α_X: `FF_{X^⋄} → X^{Div¹}` is 0-proper and O → `α_{X,*}O` is an equivalence, so α_X^* is fully faithful on quasi-coherent sheaves, and that for every Berkovich-étale Y → `X^{Div¹}` pullback gives an equivalence Perf(Y) ≃ `Perf(FF_{X^⋄} ×_{X^{Div¹}} Y)`; in particular `Perf(X^{Div¹}) ≃ Perf(FF_{X^⋄})` (ALRS Theorem 6.3.1, p. 149, ALRS line 8082; ALRS Theorem 1.15, p. 7, ALRS line 356).

A proof route: As in 11.4: localize on X in the rigid étale topology (8.7; partially proper smooth rigid spaces are rigid smooth Berkovich spaces, 4.2 and 2.6) to X étale over `G^d_{m,K}`, reduce to the toric chart description 11.3, and apply 10.12 with the mixed case of 10.10.

*Needs:* §11.4; §11.3; §10.10; §10.12; §8.7; §4.2; §2.6.

**Checks.**

- For X = GSpec(K) the theorem is 11.1.
- For X = ∅ both sides are empty.
- The smoothness hypothesis is used: perfect complexes and cohomology on `FF_{X^⋄}` depend only on X^⋄, which does not see nilpotents (2.8), whereas the two sides of (1.2.2) differ for non-reduced Berkovich spaces (ALRS p. 9, ALRS line 483); so the theorem is not asserted beyond smooth X.
- For a smooth affinoid X the Hodge–Tate parts of the statement hold without partial properness (ALRS Remarks 6.3.4 and 6.4.2), but the statement for `X^{Div¹}` is asserted only for partially proper X.

### 11.7 Pro-étale cohomology as twistor cohomology

For K/ℚ_p finite and X a smooth partially proper rigid space over K prove `Γ(X^{Div¹}, O) ≅ RΓ(FF_{X^⋄}, O)` ≅ RΓ_v(X^⋄, ℚ_p) ≅ RΓ_proét(X, ℚ_p), where ℚ_p is the topological (condensed) ℚ_p and the last isomorphism is the comparison of the pro-étale site of X with the v-site of X^⋄ (ALRS (1.2.2), p. 9, ALRS line 480).

A proof route: Apply Γ to O ≅ α_*O (11.6). For a perfectoid S, RΓ(FF_S, O) = RΓ_proét(S, ℚ_p) by VectorBundlesAndIsocrystals Layer 2 (“Slope-sensitive cohomology of standard bundles”) and these satisfy v-descent (Layer 2, “V-descent of bundles and their derived cohomology”), identifying `RΓ(FF_{X^⋄}, O)` with RΓ_v(X^⋄, ℚ_p); the Gelfand quasi-coherent cohomology of FF_S agrees with the classical one by 6.2. The final comparison is the pro-étale–v comparison that DiamondsAndVStacks §D6.5 is to provide (gap:proetale-v-comparison).

*Needs:* §11.6; §6.2; VectorBundlesAndIsocrystals Layer 2; AdicEtaleGeometry §A1.12; DiamondsAndVStacks §D6.5 (gap:proetale-v-comparison).

**Checks.**

- For X = GSpec(ℚ_p), Γ(Div¹, O) = `RΓ(Gal_{ℚ_p}, ℚ_p)` has dimensions 1, 2, 0 in degrees 0, 1, 2, with Euler characteristic −1 = −[ℚ_p : ℚ_p].
- For K/ℚ_p of degree n, H¹(Gal_K, ℚ_p) = Hom(Gal_K^ab, ℚ_p) has dimension n + 1, matching `Γ(X^{Div¹}, O)` through the cartesian square of 11.1.
- For connected X, `H⁰(X^{Div¹}, O)` = H⁰_proét(X, ℚ_p) = ℚ_p, the constants.

### 11.8 The mixed Hodge–Tate stack and the inverse Faltings' extension

For K/ℚ_p finite and X a smooth partially proper rigid space over K prove: (1) `π_{X,1}`: X^HT → X `×_{GSpec(K)}` K^HT = X × Q_p^HT, where K^HT = GSpec(K)^HT ≅ GSpec(K) × Q_p^HT by 9.1 `(T_{GSpec(K)} = 0)`, is a BT^†_X{1}-torsor, so every M ∈ D(X^HT) is an Ω¹_X{−1}-Higgs module, compatibly with 11.5 after base change to perfectoids over Q_p^HT, descending the geometric Sen operator to X `×_{GSpec(K)}` K^HT; (2) `L_{X^HT/(X ×_{GSpec(K)} K^HT)} ≅ Ω¹_{X/K}{−1}[−1]` and `L_{X^HT/X}` is an extension of `Ω¹_{X/K}{−1}[−1]` by `O_{X^HT}[−1]` whose pullback to X̂^⋄ is the inverse Faltings' extension, FE^−_X{−1} = `L_{X^HT/X}[1]`; (3) for G_FE = T_X ⋊ G_m with dual Lie algebra g*_FE, the pullback of g*_FE along X^HT → BG_FE is `L_{X^HT/X}[1]`; (4) the maps X^HT → BG_FE → B(Ĝ_FE ⋊ G_FE) → B(G^†_FE ⋊ G_FE) promote every sheaf on X^HT to a module over the enveloping algebra of `g_{X,FE}`, the analytic Harish-Chandra (Higgs–Sen) structure, restricting along T_X{1} → `g_{X,FE}` to the Higgs field (ALRS Theorem 6.3.2, p. 150, ALRS line 8145). Partial properness is not needed for these statements (ALRS Remark 6.3.4, p. 153, ALRS line 8277).

A proof route: Use the cartesian square X^HT → X over X/(T_X ⋊ G_m) → `X/(T_X ⋊ G_m)^{dR/X}` of 9.6, whose bottom map is Faltings' extension; the identification (G ⊂ G × G)^† ≅ G^† ⋊ G for a partially proper smooth rigid group G gives the Harish-Chandra action, and ALRS Proposition A.3.5 (4.8) computes the cotangent complexes.

*Needs:* §11.2; §11.5; §9.6; §9.5; §9.1; §4.8; AnalyticStacks §7.2, §7.5; AnalyticStacks §7.6.

**Checks.**

- For X = GSpec(K), Ω¹ = 0 and `L_{X^HT/X}` = O[−1], agreeing with 11.2.
- For X = G_m over K, the extension class of `L_{X^HT/X}[1]` pulled back to X̂^⋄ is the class of FE_X computed in 9.5, inverted and twisted by {−1}.
- `L_{X^HT/X}` is in general a non-split extension: splitting it would split Faltings' extension, which fails for G_m (9.5).
- For K = `ℚ_{p²}` and X = GSpec(K), X `×_{GSpec(K)}` K^HT = K^HT and `π_{X,1}` is the identity, a torsor under the trivial group BT^†_X{1} = B0. The product over GSpec(ℚ_p) would be GSpec(K `⊗_{ℚ_p}` K) × Q_p^HT = K^HT ⊔ K^HT, as K `⊗_{ℚ_p}` K ≅ K × K, and X^HT = K^HT maps isomorphically onto the diagonal copy only, so that product is not the base of the torsor.

### 11.9 Locally analytic torsors on twistor and Hodge–Tate stacks

Let X be a smooth partially proper rigid space over ℚ_p and G a p-adic Lie group. Prove: (1) Map(X^HT, BG^la) ≃ Map(X̂^⋄, BG^la) ≃ Map(X^⋄, BG), so G^la-torsors on X^HT, G^la-torsors on X̂^⋄ and pro-étale G-torsors on X^⋄ are equivalent; (2) for every Berkovich-étale U ⊂ `FF^⋄_{X^⋄}`, pullback gives `Map(X^{Div¹}|_U, BG^la) ≃ Map(FF_{X^⋄}|_U, BG^la)`; (3) there is a natural map Map(X^⋄, BG) → `Map(FF_{X^⋄}, BG^la)` sending X̃^⋄ → X^⋄ to `FF^⋄_{X̃^⋄} → FF^⋄_{X^⋄}` after perfectoidization; and the analogous statements hold relative to a perfectoid base D with `X^{Div¹/FF_D}` (ALRS Theorem 6.4.1, p. 153, ALRS line 8321). Part (1) does not need partial properness (ALRS Remark 6.4.2, p. 154, ALRS line 8349), and `Γ(X^{Div¹}, O)` = Γ`(G^la, Γ(FF_{X̃^⋄}, O)^{G-la})`, with `(−)^{G-la}` the derived G-locally analytic vectors, for every pro-étale G-torsor X̃^⋄ → X^⋄ (ALRS Remark 6.4.3, p. 154, ALRS line 8351); whether `X^{Div¹} = FF^la_{X̃}/G^la` in general is not asserted (ALRS Remark 1.22, p. 9, ALRS line 460).

A proof route: The statements are local for the rigid étale topology, so X = G_m^d; (1) follows from ALRS Proposition 5.8.10 and ALRS Lemma 5.8.2 (10.11) with the explicit decompletion of X^HT (10.10), (2) from the toric description 11.3 and ALRS Proposition 5.8.10, and (3) by applying FF_− to X^⋄ → BG and composing with BG → BG^la.

*Needs:* §11.6; §11.5; §10.11; §11.3.

**Checks.**

- For G finite, G^la = G^sm and (1) recovers the equivalence between finite étale G-torsors on X and on X̂^⋄.
- For G trivial all mapping anima are points.
- For G trivial the formula of ALRS Remark 6.4.3 reads `Γ(X^{Div¹}, O) = Γ(FF_{X^⋄}, O)`, the first isomorphism of 11.7 for K = ℚ_p: X̃^⋄ = X^⋄, G^la is the trivial group, so Γ(G^la, −) and `(−)^{G-la}` are the identity. A restriction to perfectoid torsors would exclude this case: for X = GSpec(ℚ_p), X̃ = X is not perfectoid, ℚ_p being discretely valued.
- For X = GSpec(ℚ_p) and G = ℤ_p, pro-étale ℤ_p-torsors are continuous homomorphisms `Gal_{ℚ_p}` → ℤ_p up to conjugacy, a free ℤ_p-module of rank 2, and (1) identifies them with ℤ_p^la-torsors on Q_p^HT.
- The identification `X^{Div¹} = FF^la_{X̃}/G^la` over BG^la is an open question (ALRS Remark 1.22) and is not a target.

### 11.10 Sen operators of locally analytic torsors

For a perfectoid D, a partially proper smooth rigid space X over D, a p-adic Lie group G and a pro-étale G-torsor X̃^⋄ → X^⋄ with decompletion β: `X^{HT/D}` → BG^la (11.9), define the geometric Sen operator θ^geo_β: g^∨_β → `Ω¹_{X/D}{−1}` as the shifted map of cotangent complexes `β^*L_{BG^la}[1] → L_{X^HT/X}[1]`; for X over K finite over ℚ_p define the mixed Sen operator θ^mix_β: g^∨_β → FE^−_X{−1} and, for X = GSpec(K), the arithmetic Sen operator θ^arith_β: g^∨_β → `O_{X^HT}` (ALRS Definition 6.4.4, p. 155, ALRS line 8384). Construct, for a †-formally smooth group G → S and a `G^{dR/S}`-torsor, the induced homomorphism of overconvergent groups (ALRS Construction 6.4.5, p. 155, ALRS line 8404), and prove that the dual of the resulting Lie algebra map Sen_β: `T_{X/D}{1}` → g_β is θ^geo_β and agrees with the geometric Sen operator of RCSen Theorem 1.0.4 (ALRS Lemma 6.4.8, p. 156, ALRS line 8454; RCSen Theorem 1.0.4, p. 3, RCSen line 113), and that for X = GSpec(K) and a Galois X̃ the dual of θ^arith_β is the classical Sen operator (ALRS Remark 6.4.9, p. 156, ALRS line 8471). Prove: for K_∞/K algebraic Galois with p-adic Lie group G and K^u_∞ perfectoid, β_*O = `K^{u,la}_∞` is static and X^HT ≅ `GSpec(K^{u,la}_∞)/G^la` (ALRS Proposition 6.4.10, p. 156, ALRS line 8477); in the geometric and mixed cases, for G compact, X̃^⋄ → X^⋄ a profinite étale Galois extension with group G, X̃ → X the associated G^sm-torsor and β̃: X^HT → X̃/G^la → |X̃|^Betti/G^la the composite: if θ^geo (resp. θ^mix) is surjective, then β̃ is 0-affine, β̃_*O = `O^la_{X̃̂^⋄}` is the sheaf on |X̃| of locally analytic sections of the structure sheaf of X̃̂^⋄, its values on the members of some strict closed basis of |X̃| are static Gelfand rings, and X^HT ≅ `GSpec_{|X̃|^Betti}(O^la_{X̃̂^⋄})/G^la` (ALRS Proposition 6.4.12 with the setting fixed before it, p. 158, ALRS line 8539 and ALRS line 8545).

A proof route: ALRS Proposition A.3.5 (4.8) identifies `L_{BG^la}` with the shifted coadjoint representation, so ALRS Construction 6.4.5 gives the Lie algebra map; ALRS Proposition 6.4.10 uses that GSpec(K) → BG^la and GSpec(K^u_∞) → GSpec(K) are epimorphisms with t-exact pullback (K → K^u_∞ has a K-linear section and is flat by RJRC22 Lemma 3.21), so β is affine with static pushforward `K^{u,G-la}_∞`.

*Needs:* §11.9; §11.8; §11.5; §11.2; §4.8; §10.7.

The API has the following laws.

- θ^geo_β: g^∨_β → `Ω¹_{X/D}{−1}` is the shift of `β^*L_{BG^la} → L_{X^HT/X}`; over K finite over ℚ_p, θ^mix_β: g^∨_β → FE^−_X{−1} is the analogous map, and θ^arith_β: g^∨_β → `O_{X^HT}` is its case X = GSpec(K).
- The dual Sen_β: `T_{X/D}{1}` → g_β of θ^geo_β is a map of Lie algebras and agrees with the geometric Sen operator of RCSen Theorem 1.0.4; for X = GSpec(K) and Galois X̃ the dual of θ^arith_β is the classical Sen operator.
- For X = GSpec(K) and K_∞/K algebraic Galois with p-adic Lie group G and K^u_∞ perfectoid, β_*O = `K^{u,la}_∞` is static and X^HT ≅ `GSpec(K^{u,la}_∞)/G^la`.
- For compact G and a profinite étale Galois X̃^⋄ → X^⋄ with group G whose θ^geo (resp. θ^mix) is surjective, the composite β̃: X^HT → |X̃|^Betti/G^la is 0-affine and X^HT ≅ `GSpec_{|X̃|^Betti}(O^la_{X̃̂^⋄})/G^la`, with static values of `O^la_{X̃̂^⋄}` on a strict closed basis of |X̃|.

**Checks.**

- For K_∞ = `K(μ_{p^∞})`, `K^{u,la}_∞ = K(μ_{p^∞})` uncompleted, so ALRS Proposition 6.4.10 recovers K^HT = `GSpec(K(μ_{p^∞}))/Γ^la` as in 9.7; θ^arith is dual to the identity of Lie(Γ) = ℚ_p, the Sen operator of the cyclotomic character.
- For the trivial torsor g_β = 0 and all Sen operators vanish.
- For a torsor with non-surjective θ^geo, e.g. a torsor pulled back from a point, ALRS Proposition 6.4.12 does not apply and X^HT need not be the quotient of the locally analytic spectrum.

### Examples

For X = GSpec(K), vector bundles on `X^{Div¹}` are (φ, Γ)-modules over the Robba ring and Galois representations embed as those of slope zero. Tate's computation H^i(Gal_K, C_p(n)) = H^i(K `→^{n}` K) is the cohomology of O{n} on X^HT. For X = G_m^d over ℚ_p, `X^{Div¹} = FF^la_{X̃^{d,⋄}_{ℚ_p^cyc}}/Γ_d^la` while `FF_{X^⋄} = FF_{X̃^{d,⋄}_{ℚ_p^cyc}}/Γ_d^cont`.

### Dependencies

Layers 2–4 and 6–10; PhiGammaModulesAndIwasawaCohomology §1.4 (Check); PadicPeriodRings §1.4 (Check); PadicHodgeTheory §4.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2; VectorBundlesAndIsocrystals Layer 2, Layer 6; AdicEtaleGeometry §A1.12; AnalyticStacks §7.2, §7.5, §7.6; DiamondsAndVStacks §D6.5 (gap:proetale-v-comparison).

## Layer 12: Twistor cohomology, duality, Chern classes and the Riemann–Hilbert functor

This layer extracts consequences of the comparison: Δ-!-ability of locally †-finitely presented maps; cohomological smoothness and the dualizing complexes of `Div^{1,dR}`, Div¹ and of twistor stacks of rigid smooth maps, giving Poincaré duality for pro-étale ℚ_p-cohomology; properness and duality for smooth proper maps; the prismatic first Chern class with the projective bundle formula; and the relation of formal Hodge–Tate stacks with Scholze's Riemann–Hilbert functor. !-ability and trivial codualizing complexes come from the 0-affine and 0-proper maps of 2.2; dualizing complexes are computed through relative Fargues–Fontaine curves or by the cone square (ALRS Theorem 6.5.4, Remarks 6.5.5–6.5.6).

### 12.1 Δ-!-able maps and locally †-finitely presented maps

Call a map f: Y → X of Gelfand stacks Δ-!-able if `f^{Div¹}` is !-able (ALRS Definition 6.5.1, p. 159, ALRS line 8628). A map A → B of connective ℚ_p-algebras is finitely presented if π_0(B) is a finitely presented π_0(A)-algebra and `L_{B/A}` is perfect, and a map of Berkovich spaces is locally †-finitely presented if locally on strict closed covers it is a composite of †-rational localizations and analytifications of finitely presented maps (ALRS Definition 6.5.2, p. 160, ALRS line 8640); call it locally †-l.c.i. if moreover the analytifications can be taken to be regular Zariski closed immersions into overconvergent polydiscs `D^{n,†}_X` (ALRS Remark 2.1.1(2), p. 14, ALRS line 697). Prove: (1) a †-formally étale map whose perfectoidization is arc-locally lqfd is Δ-!-able, in particular pro-Berkovich-étale maps are, that is, maps that are, locally on strict closed covers of source and target, of the form GSpec(B) → GSpec(A) with B a filtered colimit of Berkovich-étale A-algebras (ALRS line 8652); (2) A¹ → GSpec(ℚ_p) is Δ-!-able with 0-affine diagonal on twistor stacks; (3) for a surjective map A → B of affinoid Gelfand rings that is of finite presentation as a map of animated rings, `f^{Div¹}` is 0-affine, hence 0-proper and !-able with trivialized codualizing complex; (4) maps of Berkovich spaces locally of †-finite presentation are Δ-!-able (ALRS Proposition 6.5.3, p. 160, ALRS line 8649). Berkovich-smooth maps, in particular rigid smooth maps, are locally †-l.c.i., hence locally †-finitely presented (ALRS §2.1, p. 14, ALRS line 699); for instance a †-rational localization `A⟨f/g⟩_{≤1} = A⟨T⟩_{≤1}/L(gT_i − f_i)` is the regular Zariski closed immersion cut out by the gT_i − f_i in an overconvergent polydisc over A.

A proof route: (1) reduces by ALRS Lemma 4.2.5 (8.3) to de Rham stacks of Fargues–Fontaine curves (6.3). (2) covers A¹ by A¹ ∖ {0} and A¹ ∖ {1} and uses the presentation of `G_m^{Div¹}` of 9.9, !-ability of maps of Berkovich spaces and of classifying stacks of locally analytic groups; the diagonal is a base change of the zero section, which is (3). (3) writes B as a retract of a finite cell attachment A_n, each step A_m = `A_{m−1}` `⊗_{Sym M_m[m]}` A for a finite free M_m (the equivalence of (a) and (b) in ALRS Definition 6.5.2(1), p. 160, ALRS line 8640); each step is a base change of the zero section of a shifted affine space, whose twistor stack map is, !-locally on the target, represented in affinoid Gelfand stacks (reduce to the unit section of G_m and use 9.9), hence 0-affine, and 0-affine maps are stable under composition and retracts (0.2; Gest Proposition 6.6); the trivialization of the codualizing complex is 2.2. For a regular Zariski closed immersion the cone square of 8.6 gives a second route: the twistor stack is the base change of the deformation to the normal bundle, and regular Zariski closed immersions of analytic rings are suave (RCSolid Lemma 6.3.5, AnalyticStacks §6.3(1)). (4) is local for †-formally étale maps on source and target, and an analytified finitely presented map factors as Y → A^d_X → X with the first map locally a surjection of finite presentation, so (2) and (3) apply.

*Needs:* §8.3; §8.6; §9.9; §6.3; §5.1; §4.3; §2.2; AnalyticStacks §§0.8–0.11; AnalyticStacks §6.3; §0.2; §0.3; §0.4.

The API has the following laws.

- A †-formally étale map whose perfectoidization is arc-locally lqfd is Δ-!-able; in particular pro-Berkovich-étale maps are.
- A¹ → GSpec(ℚ_p) is Δ-!-able, and the diagonal of its twistor stack is 0-affine.
- For a surjection A → B of affinoid Gelfand rings of finite presentation as a map of animated rings, `f^{Div¹}` is 0-affine, hence 0-proper and !-able with trivialized codualizing complex.
- Maps of Berkovich spaces locally of †-finite presentation are Δ-!-able; Berkovich-smooth maps, in particular rigid smooth maps, are locally †-l.c.i., hence locally †-finitely presented.

**Checks.**

- An open immersion of Berkovich spaces is rigid étale, hence Berkovich-étale (4.2) and in particular pro-Berkovich-étale; it is †-formally étale with perfectoidization an open immersion (4.2), hence Δ-!-able by (1).
- The origin of the closed unit disc, the surjection ℚ_p⟨T⟩ → ℚ_p with kernel (T), has L = ℚ_p[1], perfect, so by (3) its twistor stack map is 0-affine, hence !-able with trivial codualizing complex; the same holds for the zero section of A¹ locally on strict closed covers.
- Identities are Δ-!-able.
- The singular point of the cusp y² = x³ is a closed immersion that is not l.c.i. but is covered by (3)–(4): for R = ℚ_p⟨x, y⟩/(y² − x³) and k = R/(x, y), the transitivity triangle for ℚ_p⟨x, y⟩ → R → k, in which d(y² − x³) vanishes at the origin, gives `L_{k/R}` = k²[1] ⊕ k[2]. This is perfect, so R → k is of finite presentation as a map of animated rings, while `H^{−2}` ≠ 0 puts it outside the amplitude [−1, 0] of regular immersions; a definition of (3) restricted to amplitude [−1, 0] would miss it.
- The surjection ℚ_p⟨T_n : n ∈ ℕ⟩ → ℚ_p sending every T_n to 0 is not of finite presentation: the derivations ∂/∂T_n at the origin vanish on I² for the kernel I and separate the T_n, so I/I² is infinite-dimensional and I is not finitely generated; (3) does not apply to it.
- The closed unit disc GSpec(ℚ_p⟨T⟩) → GSpec(ℚ_p) comes from a smooth affinoid rigid space but is neither rigid smooth nor Berkovich-smooth (ALRS Warning 2.6.13, p. 25, ALRS line 1351), so the last sentence of the statement does not apply to it. The open unit disc is rigid smooth and is the increasing union of the overconvergent discs {|T^n/p| ≤ 1} = `{|T| ≤ p^{−1/n}}`, †-rational localizations of A¹, so the sentence applies to it.

### 12.2 Twistor duality for ℚ_p: local Tate duality

Prove: (1) `Div^{1,dR}` → GSpec(ℚ_p) is cohomologically proper and cohomologically smooth with dualizing complex O⟨1⟩[2], the pullback along `Div^{1,dR}` = Q_p^HK → Marc(𝔽_p)^HK = GSpec(ℚ_p)/φ^ℤ of the line bundle of the isocrystal `(ℚ_p, p^{-1}φ)`, shifted by 2; (2) β: Div¹ → `Div^{1,dR}` is 0-proper with 0-affine diagonal; (3) Div¹ → GSpec(ℚ_p) is 0-proper and cohomologically smooth with dualizing complex `O_{Div¹}{1}[2]`, the (φ, Γ)-module of the cyclotomic character in cohomological degree −2 (ALRS Theorem 6.5.4, p. 161, ALRS line 8745). Prove that Q_p^Δ is cohomologically smooth with dualizing complex O{1}[2] (ALRS Remark 6.5.7, p. 164, ALRS line 8864).

A proof route: (1): `Div^{1,dR} = ((1 + D̃^{<1,dR}) ∖ {1})/ℚ_p^{×,sm}`; cohomological smoothness follows from the perfectoid disc (3.3(3)) and classifying stacks of locally profinite groups; the dualizing complex is computed representation-theoretically through `BC(O(1))^dR/ℚ_p^{×,sm} → GSpec(ℚ_p)/ℚ_p^{×,sm}` with modulus characters (HM Example 5.3.21) and Poincaré duality for de Rham stacks of smooth rigid spaces (3.3(2)), following ALRS Remark 6.5.5, which avoids the p-adic monodromy theorem (ALRS proves (1) through ABLB Theorem 7.1.1 and gives this computation as a remark); cohomological properness follows from 3.3(1) since `Div^{1,⋄}` → Spd ℚ_p is proper (ALRS line 8759–8761), by the properness of Div¹ → ∗ (FS Proposition II.1.21, FS line 2133; VectorBundlesAndIsocrystals Layer 5, “Effective divisors and projective sections”, the case d = 1). (2): base change along the square of 8.6 of A¹/G_m → `A^{1,dR}/G_m → A^{1,dR}/G_m^dR`, the first map represented in affinoid Gelfand stacks and the second with fibre BG_m^†, which is prim with diagonal represented in affinoids; the diagonal is 0-affine because A¹ → `A^{1,dR}` and G_m → G_m^dR are (0.2; Gest Proposition 6.6). (3): 0-properness from the presentation Div¹ ≅ `X_cyc/ℚ_p^{×,la}` of 9.7(4) with ℚ_p^× = p^ℤ × ℤ_p^×: the base change of Div¹ → `Bℤ_p^{×,la}` along GSpec(ℚ_p) → `Bℤ_p^{×,la}` is X_cyc/φ^ℤ, p acting by φ(q) = q^p, and `Bℤ_p^{×,la}` is 0-proper over GSpec(ℚ_p) (10.3), so by locality on the target and composition (0.4; 2.2) it suffices that X_cyc/φ^ℤ → GSpec(ℚ_p) is 0-proper; for `p^{-1/(p-1)}` < s < 1 it is covered by the images of the closed annuli s ≤ |q − 1| ≤ `s^{1/√p}` and `s^{1/√p}` ≤ |q − 1| ≤ `s^{1/p}`, each meeting none of its nontrivial φ-translates because φ lowers |q − 1| and acts on it by r ↦ r^p above `p^{-1/(p-1)}`, a finite closed affinoid cover by monomorphisms, along which 0-properness is checked (2.2); smoothness from 6.4(2) and the invertibility of α_*O (11.1); the dualizing complex by the cone square (ALRS Remark 6.5.6): `ω_{Div¹}` = f^!1 ⊗ `f^*ω_{A¹/G_m}` with `ω_{A¹/G_m}` = I, f^!1 = h′^*O⟨1⟩[2] by suave base change, hence O⟨1⟩ ⊗ I [2] = O{1}[2].

*Needs:* §9.7; §9.8; §3.3; §6.3; §6.4; §11.1; §8.5; §8.6; §10.3; §2.2; §0.4; VectorBundlesAndIsocrystals Layer 5; AnalyticStacks §§0.8–0.11; AnalyticStacks §4.2; AnalyticStacks §6.3; AnalyticStacks §6.4, §6.6.

**Checks.**

- With RΓ(Div¹, O) = `RΓ(Gal_{ℚ_p}, ℚ_p)` (11.7), duality pairs H⁰ = ℚ_p with H²(ℚ_p(1)) = ℚ_p and the two-dimensional H¹(ℚ_p) with the two-dimensional H¹(ℚ_p(1)), local Tate duality.
- Off the Hodge–Tate locus I is trivial, so O{1}[2] = h′^*O⟨1⟩[2] ⊗ f^*I restricts to h′^*O⟨1⟩[2], the pullback of the dualizing complex of `Div^{1,dR}` from (1) (ALRS Remark 6.5.6).
- `ω_{BG_m}` = O[−1] (Verdier diagonal trick: ω_Δ = O[1]) and `ω_{A¹/G_m → BG_m}` = I[1], so `ω_{A¹/G_m}` = I, the ideal sheaf of the universal divisor.
- If the dualizing complex of Div¹ were O⟨1⟩[2] everywhere, its pullback to `FF_{Q_p^⋄}` would be the slope-one line bundle rather than the Tate twist ℚ_p(1) (9.8), contradicting the dualizing complex of `FF_{Marc(ℚ_p)}` in 6.4(2).
- On the mirabolic ℚ_p ⋊ ℚ_p^×, with a acting on ℚ_p by multiplication as BC(O)^× acts on BC(O(1)) (ALRS line 4175) and K = ℤ_p ⋊ (1 + pℤ_p), the generalized index gives δ(a) = [aℤ_p : ℤ_p] = |a|_p, so δ(p) = p⁻¹, as in AnalyticStacks Conventions (4); ALRS Remark 6.5.5 (ALRS line 8819) writes the inverse |a|⁻¹_p. With δ(p) = p⁻¹ the character α^*δ⁻¹ takes the value p at p, and since the result of (1) is O⟨1⟩[2] with O⟨1⟩ = `(ℚ_p, p^{-1}φ)`, the route must send a character χ to the isocrystal `(ℚ_p, χ(p)^{-1}φ)`; combining |a|⁻¹_p with that dictionary would give O⟨−1⟩[2], contradicting the dualizing complex of `FF_{Marc(ℚ_p)}` in 6.4(2).

### 12.3 Poincaré duality for twistor stacks of smooth maps

Let d ≥ 0 and let f: Y → X be a map of Berkovich spaces, rigid smooth and of pure relative dimension d. Prove: (1) `f^{Div¹}`: `Y^{Div¹} → X^{Div¹}` is cohomologically smooth; (2) for the base change `f^{Div¹/FF_{X^⋄}}`: `Y^{Div¹}` `×_{X^{Div¹}}` `FF_{X^⋄} → FF_{X^⋄}`, its dualizing complex is `f^{Div¹/FF_{X^⋄},!}O` ≅ O{d}[2d]; (3) if X is a smooth partially proper rigid space over ℚ_p then `f^{Div¹,!}O_{X^{Div¹}} ≅ O_{Y^{Div¹}}{d}[2d]` (ALRS Theorem 6.5.8, p. 164, ALRS line 8875). Partial properness in (3) enters only through 11.6 (ALRS Remark 6.5.9, p. 165, ALRS line 8932).

A proof route: Cohomological smoothness is local on the source by 8.7, reducing to Y = `G_{m,X}` and then X = GSpec(ℚ_p), Y = G_m; there α_X is an epimorphism (11.1) and `FF_{Y^⋄} → FF_{X^⋄}` is cohomologically smooth (6.4(1)); since a: `FF_{Y^⋄} → Y^{Div¹/FF_{X^⋄}}` is 0-proper, hence prim with trivial codualizing complex, with a_*O = O (11.4, 11.6), HM Lemma 4.4.9(ii) gives g^!O ≅ a_*(O ⊗ ℚ_p(d)[2d]) ≅ O{d}[2d], the Tate twist pulling back to the Breuil–Kisin twist (9.8). For (3) apply suave base change and the projection formula along h_X: `FF_{X^⋄} → X^{Div¹}`, 0-proper with `h_{X,*}O` = O (11.6).

*Needs:* §12.1; §12.2; §11.4; §11.6; §6.4; §8.7; §9.8.

**Checks.**

- For d = 0 (f rigid étale), `f^{Div¹,!}O` = O: `f^{Div¹}` is cohomologically étale.
- For Y = G_m over X = GSpec(ℚ_p), `f^{Div¹,!}O` = O{1}[2]; composed with 12.2 the dualizing complex of `G_m^{Div¹}` over GSpec(ℚ_p) is O{2}[4].
- The statement is about the upper shriek f^! of the structure sheaf of `X^{Div¹}`, an object on `Y^{Div¹}`; the lower shriek f_!O lives on `X^{Div¹}` and for Y = P¹_X equals O ⊕ O{−1}[−2] (12.5), not O{1}[2].

### 12.4 Properness and duality for smooth proper maps

Prove that for a morphism f: Y → X of Berkovich spaces locally of †-finite presentation whose underlying map of arc-stacks is proper, f^Δ: Y^Δ → X^Δ `(and hence f^{Div¹})` is 0-proper, hence !-able with trivial codualizing complex and f^Δ_! ≅ f^Δ_* (ALRS Proposition 6.5.10, p. 165, ALRS line 8938). Deduce that for a smooth proper morphism f: Y → X of smooth partially proper rigid spaces over ℚ_p of relative dimension d, `f^{Div¹}_*` preserves perfect complexes and `f^{Div¹}_*(M^∨{d}[2d]) ≅ (f^{Div¹}_*M)^∨` for every perfect M on `Y^{Div¹}` (ALRS Corollary 6.5.11, p. 165, ALRS line 8952).

A proof route: 0-properness is local on the target (HM Lemma 4.4.8) and, by the radius decomposition (8.5, ALRS Corollary 4.2.14), reduces to the Hyodo–Kato stack, where it follows from ABLB Proposition 5.1.4 (6.3), and to the twistor stack; for the latter take a finite closed affinoid cover Y_i → Y, whose disjoint union gives a !-cover of twistor stacks that is cohomologically proper and 0-affine, closed immersions of analytic stacks being 0-affine, and use that 0-properness can be checked along such covers of the source (2.2). The corollary follows because pushforward along a cohomologically smooth prim map preserves dualizable objects (HM Corollary 4.5.18), with duality from 12.3 and HM Lemma 4.4.9(ii).

*Needs:* §12.1; §12.3; §8.5; §6.3; AnalyticStacks §§0.8–0.11.

**Checks.**

- For f: P¹_X → X, f_*O = O ⊕ O{−1}[−2] (12.5); duality gives f_*(O{1}[2]) = O{1}[2] ⊕ O, the dual of f_*O, as the formula requires.
- For f the identity the statement is trivial.
- For smooth proper X of dimension d over K and its structure map, the formula pairs f_*O with f_*O{d}[2d]; over a geometric point C this is the perfect Galois-equivariant pairing H^i(X_C, ℚ_p) ⊗ `H^{2d−i}(X_C, ℚ_p(d))` → ℚ_p of ClassicalAdicEtaleCohomologyPartII §5.9, ℚ_p(d) being the pullback of O{d} to FF (9.8).
- For the open disc over ℚ_p the underlying arc-stack map is not proper, `f^{Div¹}_!` ≠ `f^{Div¹}_*`, and `f^{Div¹}_*O` is not perfect.

### 12.5 The prismatic first Chern class and the projective bundle formula

Construct the first Chern class c^Δ_1: BG^Δ_m → `B²V(O_{Q_p^Δ}{1})` of animated abelian group stacks over Q_p^Δ as the delooping of the composite of the connecting map G^Δ_m → G[1] of G^Δ_m = `G̃_{m,Q_p^Δ}/G` with log_Δ[1]: G[1] → V(O{1})[1] (ALRS Construction 6.6.1, p. 166, ALRS line 8992); it gives a weak theory of first Chern classes for X ↦ D(X^Δ) on Berkovich spaces with the Berkovich-étale topology in the sense of Zav Definition 5.2.4 (ALRS Remark 6.6.2, p. 166, ALRS line 9006). Prove compatibility with pro-étale Chern classes over the region (0, p), where O{1} is the Tate twist (ALRS Remark 6.6.4, p. 167, ALRS line 9032), and with Hyodo–Kato Chern classes over (1, ∞) (ALRS Remark 6.6.6, p. 168, ALRS line 9084). Prove that for every Gelfand stack X over ℚ_p and d ≥ 1, with f: P^d_X → X, the map `Σ_{k=0}^d` c_1^k{d − k}[2d − 2k]: `⊕_{k=0}^d` O{d − k}[2d − 2k] → f^Δ_*O{d}[2d] is an isomorphism, so that c^Δ_1 is a strong theory of first Chern classes (ALRS Proposition 6.6.7, p. 168, ALRS line 9093; Zav Definition 5.2.8, p. 45, Zav line 1949).

A proof route: P^d_X → X is locally †-finitely presented with proper underlying arc-stack map, so f^Δ is 0-proper (12.4) and by proper base change X = GSpec(ℚ_p); by the radius decomposition (8.5) the claim splits into the Hyodo–Kato part (ABLB Lemma 6.2.9, 6.3) and the twistor part, which by 11.6–11.7 is the Galois-equivariant pro-étale ℚ_p-cohomology of P^d, computed by the étale projective bundle formula (EtaleCohomologyFoundations §0.9) through the proper algebraic comparison (ClassicalAdicEtaleCohomology §8.2) and the Kummer Chern class (§9.3) in the limit over p^n.

*Needs:* §9.9; §9.8; §12.4; §8.5; §6.3; §11.6; §11.7; EtaleCohomologyFoundations §0.9; ClassicalAdicEtaleCohomology §8.2; ClassicalAdicEtaleCohomology §9.3.

The API has the following laws.

- c^Δ_1: BG^Δ_m → `B²V(O_{Q_p^Δ}{1})` is a map of animated abelian group stacks over Q_p^Δ, and it is a weak theory of first Chern classes for X ↦ D(X^Δ) on Berkovich spaces with the Berkovich-étale topology in the sense of Zav Definition 5.2.4.
- Over the region (0, p), where O{1} is the Tate twist, c^Δ_1 agrees with the pro-étale first Chern class; over (1, ∞) it agrees with the Hyodo–Kato first Chern class of 6.3.
- For every Gelfand stack X over ℚ_p, d ≥ 1 and f: P^d_X → X, the map `Σ_{k=0}^d` c_1^k{d − k}[2d − 2k]: `⊕_{k=0}^d` O{d − k}[2d − 2k] → f^Δ_*O{d}[2d] is an isomorphism, so c^Δ_1 is a strong theory of first Chern classes in the sense of Zav Definition 5.2.8.

**Checks.**

- For d = 1, f^Δ_*O{1}[2] = O{1}[2] ⊕ O, the second summand generated by c_1 of the universal line bundle.
- For d = 0 the formula reads O ≅ f^Δ_*O for the identity.
- On the region (0, p), c^Δ_1 of a line bundle L restricts to the inverse limit over n of the Kummer classes c_1(L) ∈ H²`(X_ét, μ_{p^n})` of ClassicalAdicEtaleCohomology §9.3, inverted at p; on smooth proper X/K this is compared with the de Rham class by CohomologyComparisons §6.7.
- With values in O⟨1⟩ instead of O{1} the class would not be compatible with Kummer classes over (0, p), since O⟨1⟩ pulls back to the slope-one bundle rather than the Tate twist (9.8).

### 12.6 Formal Hodge–Tate stacks and the Riemann–Hilbert functor

For a smooth rigid space X over ℚ_p prove that f̂: `X^{HT^} → X^{cone^}` `×_{Â¹/G_m}` `Q_p^{HT^}` is a T^dR_X{1}-torsor, {1} the Breuil–Kisin twist, so f̂ is suave with f̂_♮1 = 1 and f̂^* is fully faithful; the same holds for the overconvergent version when X is partially proper (ALRS Proposition 6.7.1, p. 169, ALRS line 9143). Writing `Q_p^{HT^} = Spf(K_∞[[t]])/ℤ_p^{×,la}`, B⁺_dR = B⁺_dR(ℚ_p^cyc) and Spf(B⁺_dR) = `colim_n GSpec(B⁺_dR/t^n)` (ALRS line 9169), prove that after base change along Spf(B⁺_dR) → `Q_p^{HT^}` the pullback f̂^* is fully faithful with essential image the sheaves whose pullback to `X^HT_{ℚ_p^cyc}` has †-nilpotent geometric Sen operators, and that vector bundles on `X^{cone^/(B⁺_dR, t)}` correspond to B⁺_dR-local systems on `X_{ℚ_p^cyc}` whose underlying Ô-bundle has nilpotent geometric Sen operator (ALRS Proposition 6.7.3, p. 170, ALRS line 9177). Write Spf(B⁺_dR,X) for `FF^∧_{X^⋄}` of 9.5 (ALRS line 9222) and consider the maps Spf(B⁺_dR,X) → `X^{HT^}` → `X^{cone^}` `×_{Â¹/G_m}` `Q_p^{HT^}` → `X^{cone^}`: the restriction `α_{X,dR}` of `FF_{X^⋄}` → `X^{Div¹}` (8.6) to the formal completions along the Hodge–Tate loci, f̂ and the projection h. Prove that the three maps are 0-proper, that `α_{X,dR,*}1` = 1 and f̂_*1 = 1, and that h_*1 ≅ 1 ⊕ 1[−1], computed by the Galois cohomology of the filtered ring B_dR, the summand 1[−1] being spanned by the pullback of the class log χ_cyc ∈ H¹(`Q_p^{†-HT}`, O) on the overconvergent Hodge–Tate stack of ℚ_p (9.4) through `Q_p^{HT^}` → `Q_p^{†-HT}` (ALRS Example 6.1.7(3), p. 146, ALRS line 7896). Let BG_a^alg be the realization of the algebraic classifying stack BG_a over ℚ_p as an analytic stack (AnalyticStacks §3.8). The class log χ_cyc classifies a map to BG_a^alg, and h′ = (h, log χ_cyc): `X^{cone^}` `×_{Â¹/G_m}` `Q_p^{HT^}` → `X^{cone^}` × BG_a^alg is 0-proper with h′_*1 = 1. Define `X^{pHT^}` and Spf(B⁺_pdR,X) as the base changes of `X^{HT^}` and of Spf(B⁺_dR,X), mapping to `X^{cone^}` × BG_a^alg through h′ ∘ f̂ and h′ ∘ f̂ ∘ `α_{X,dR}`, along the map `X^{cone^}` → `X^{cone^}` × BG_a^alg given by the point GSpec(ℚ_p) → BG_a^alg; write B⁺_dR,X → B⁺_pdR,X for the induced map of period sheaves and F̃: Spf(B⁺_pdR,X) → `X^{pHT^}` → `X^{cone^}` for the composite. Prove that both maps of this composite are 0-proper with pushforward of the unit equal to the unit, so that pullback along each is fully faithful (ALRS Construction 6.7.5, p. 171, ALRS line 9223). Prove that pullback along F̃, restricted to vector bundles, is the base change along B⁺_dR,X → B⁺_pdR,X of Scholze's functor F(E) = `Fil⁰(E ⊗_O OB_dR,X)^{∇=0}`, the associated local system functor E ↦ M(E) of PadicHodgeTheory §7.1 (ALRS Proposition 6.7.6, p. 171, ALRS line 9237; Sch13 Theorem 7.6, p. 42, Sch13 line 1936). For X smooth over a perfectoid D with a lift X̃ to Spf(B⁺_dR(D)), prove that f^* is fully faithful from flat t-connections on X̃ relative to B⁺_dR(D), nilpotent modulo t, to B⁺_dR-local systems on X (ALRS Proposition 6.7.7, p. 172, ALRS line 9297).

A proof route: ALRS Proposition 6.7.1 is the base change of 9.6 along X → X^dR and `Q_p^{HT^}` → GSpec(ℚ_p), using `X^{cone^,dR}` = T^dR_X(−1)[1]. For 6.7.3, full faithfulness is proper base change; the essential image is detected on the special fibre `X^HT_{ℚ_p^cyc} → X_{ℚ_p^cyc}/T_X{1}`, where the BT^†_X{1}-action integrates to a BT_X{1}-action exactly when the Sen operator is †-nilpotent (Cartier duality for vector bundles, AnalyticStacks §7.6). For 6.7.6 replace the formal cone by the algebraic one (its Gelfandification, inducing an equivalence on perfect complexes) and identify F̃′_*1 = 1 with the filtered equivalence dR_X ≅ Rν_*B_pdR,X; ALRS Proposition 6.7.7 uses ALRS Remark 2.9.10 (5.3) to identify vector bundles on the relative formal cone with t-connections nilpotent modulo t.

*Needs:* §9.4; §9.5; §9.6; §8.6; §5.3; §11.2; §11.4; §11.5; §10.10; PadicHodgeTheory §7.1; AnalyticStacks §7.2, §7.5; AnalyticStacks §7.6; AnalyticStacks §1.6, §3.8.

The API has the following laws.

- For smooth X, f̂: `X^{HT^} → X^{cone^}` `×_{Â¹/G_m}` `Q_p^{HT^}` is a T^dR_X{1}-torsor, suave with f̂_♮1 = 1, and f̂^* is fully faithful; for partially proper X the same holds for the overconvergent version.
- After base change along Spf(B⁺_dR) → `Q_p^{HT^}`, f̂^* is fully faithful with essential image the sheaves whose pullback to `X^HT_{ℚ_p^cyc}` has †-nilpotent geometric Sen operators.
- `α_{X,dR}`, f̂ and h are 0-proper with `α_{X,dR,*}1` = 1, f̂_*1 = 1 and h_*1 ≅ 1 ⊕ 1[−1]; h′ is 0-proper with h′_*1 = 1.
- Spf(B⁺_pdR,X) → `X^{pHT^}` and `X^{pHT^}` → `X^{cone^}` are 0-proper with pushforward of the unit equal to the unit, so pullback along each, and along F̃, is fully faithful.
- F̃^*, restricted to vector bundles on `X^{cone^}`, is the base change along B⁺_dR,X → B⁺_pdR,X of Scholze's functor F.

**Checks.**

- For X = GSpec(ℚ_p) and E = ℚ_p with Fil⁰ = ℚ_p, F(E) = `Fil⁰(B_dR)^{∇=0}` = B⁺_dR, the trivial B⁺_dR-local system.
- The functor satisfies F(E[1]) = t·F(E) (PadicHodgeTheory §7.1, shift), matching the twist by the Breuil–Kisin ideal on the formal Hodge–Tate stack.
- For X = G_m over ℚ_p^cyc, the v-line bundle obtained from the ℤ_p(1)-torsor of p-power roots of T through a locally analytic character χ: ℤ_p(1) → ℚ_p^× with nonzero derivative has geometric Sen operator a nonzero multiple of dlog T (11.5(5)); this operator is invertible, hence not †-nilpotent, so the bundle is not in the essential image of ALRS Proposition 6.7.3.
- For any smooth X and E = O with the trivial filtration, F(E) = `(OB⁺_dR,X)^{∇=0}` = B⁺_dR,X by the Poincaré lemma, the counterpart of f̂_♮1 = 1 in ALRS Proposition 6.7.1.
- For X = GSpec(ℚ_p), `X^{cone^}` = Â¹/G_m (5.1) and h is the projection `Q_p^{HT^}` → Â¹/G_m. Over the Hodge–Tate point BG_m its pushforward of O has weight-n part RΓ(Q_p^HT, O{n}), which is 0 for n ≠ 0 and ℚ_p ⊕ ℚ_p[−1] for n = 0 (11.2: H⁰ = H¹ = ℚ_p, H² = 0). So the second summand of h_*1 is a class in cohomological degree one, 1[−1], matching Γ(BG_a^alg, O) = ℚ_p ⊕ ℚ_p[−1], the Lie algebra cohomology of the additive group, as h′_*1 = 1 requires; a summand 1[1] would be a class in degree −1, where Galois cohomology vanishes. Base change along the point of BG_a^alg removes exactly this summand.

### Examples

Div¹ → GSpec(ℚ_p) is cohomologically smooth with dualizing complex O{1}[2], and RΓ(Div¹, O) ⊗ RΓ(Div¹, O{1}[2]) → ℚ_p is local Tate duality. For P^d_X → X, f^Δ_*O{d}[2d] = `⊕_{k=0}^d` O{d − k}[2d − 2k]. For X a point, Scholze's functor sends the filtered module ℚ_p to the B⁺_dR-local system B⁺_dR.

### Dependencies

Layers 2–11; EtaleCohomologyFoundations §0.9; ClassicalAdicEtaleCohomology §8.2, §9.3; ClassicalAdicEtaleCohomologyPartII §5.9 (Check); CohomologyComparisons §6.7 (Check); PadicHodgeTheory §7.1; VectorBundlesAndIsocrystals Layer 5; Layer 0 (§§0.2–0.4); AnalyticStacks §§0.8–0.11, §1.6, §3.8, §4.2, §6.3, §6.4, §6.6, §7.2, §7.5, §7.6.

## Downstream consumers

No roadmap in the merge order consumes this one. Its interfaces are designed for: a Part II on the filtered prismatization and rational analytic syntomification of Hauck (Hauck, abstract, Hauck line 7), which needs Layers 4–9 and 12; an integral analytic prismatization with ℤ_p-coefficients (ALRS Remark 1.27, ALRS line 551), which would extend Layers 1–9; pro-étale cohomology and duality of p-adic curves and towers through the twistor stack, which needs 11.7 and 12.2–12.4; and a geometrization of the locally analytic p-adic Langlands programme along Pan's geometric Sen theory (ALRS Remark 1.23, ALRS line 472; Pan22 Remark 1.0.15), which needs Layers 10–11.

## References

- **ALRS** — J. Anschütz, A.-C. Le Bras, J. E. Rodríguez Camargo, P. Scholze, *Rational analytic prismatization*, preprint 2026, author page of P. Scholze. Locators are theorem numbers, pages and lines of the version recorded in the sources manifest.
- **ABLB** — J. Anschütz, G. Bosco, A.-C. Le Bras, J. E. Rodríguez Camargo, P. Scholze, *Analytic de Rham stacks of Fargues–Fontaine curves*, arXiv:2510.15196v2 (2026). ALRS cites an earlier numbering: its Definition 3.3.1 (Gelfand rings), Definition 2.3.1 (Berkovich spectrum), Lemma 3.6.2, Proposition 2.4.9 and Corollary 3.4.10 are Definition 3.1.1, Definition 3.1.5, Lemma 3.1.17, Proposition 3.1.9 and Corollary 4.4.10 of v2.
- **RCSolid** — J. E. Rodríguez Camargo, *Notes on Solid Geometry*, arXiv:2603.03012v1 (2026); ALRS cites it as [RC26d].
- **HM** — C. Heyer, L. Mann, *6-Functor Formalisms and Smooth Representations*, arXiv:2410.13038v1 (2024).
- **SixFF** — P. Scholze, *Six-Functor Formalisms*, arXiv:2510.26269v2 (2026).
- **Gest** — P. Scholze, *Geometry and higher category theory*, lecture notes on joint work with G. Stefanich, author page (2026). Layer 0 restates results of Lectures II, III and VI–IX; the numbering cited by ALRS Construction 2.1.2 agrees with this file.
- **ALBM** — J. Anschütz, A.-C. Le Bras, L. Mann, *A 6-functor formalism for solid quasi-coherent sheaves on the Fargues–Fontaine curve*, arXiv:2412.20968v2.
- **RC24** — J. E. Rodríguez Camargo, *The analytic de Rham stack in rigid geometry*, arXiv:2401.07738v1 (2024).
- **FS** — L. Fargues, P. Scholze, *Geometrization of the local Langlands correspondence*, arXiv:2102.13459v4.
- **RJRC22** — J. Rodrigues Jacinto, J. E. Rodríguez Camargo, *Solid locally analytic representations of p-adic Lie groups*, Represent. Theory 26 (2022), arXiv:2110.11916v2.
- **RJRC** — J. Rodrigues Jacinto, J. E. Rodríguez Camargo, *Solid locally analytic representations*, arXiv:2305.03162v5.
- **BC16** — L. Berger, P. Colmez, *Théorie de Sen et vecteurs localement analytiques*, Ann. Sci. Éc. Norm. Supér. 49 (2016), arXiv:1405.5430v1.
- **RCSen** — J. E. Rodríguez Camargo, *Geometric Sen theory over rigid analytic spaces*, arXiv:2205.02016v4.
- **Sch13** — P. Scholze, *p-adic Hodge theory for rigid-analytic varieties*, Forum Math. Pi 1 (2013), arXiv:1205.3463v2.
- **AHLB** — J. Anschütz, B. Heuer, A.-C. Le Bras, *v-vector bundles on p-adic fields and Sen theory via the Hodge–Tate stack*, arXiv:2211.08470v3.
- **Pan22** — L. Pan, *On locally analytic vectors of the completed cohomology of modular curves*, Forum Math. Pi 10 (2022), arXiv:2008.07099v3.
- **Hauck** — M. Hauck, *Rational analytic syntomic cohomology*, arXiv:2604.15193v2.
- **RC26a** — J. E. Rodríguez Camargo, *Cartier duality for gerbes of vector bundles*, arXiv:2512.24967v3.
- **Zav** — B. Zavyalov, *Poincaré Duality in abstract 6-functor formalisms*, arXiv:2301.03821v3; ALRS cites it as [Zav26].
- **AM24** — J. Anschütz, L. Mann, *Descent for solid quasi-coherent sheaves on perfectoid spaces*, arXiv:2403.01951v2.
- **Man26** — L. Mann, *A 6-functor formalism for ℤ_ℓ- and ℚ_ℓ-sheaves on diamonds*, arXiv:2209.08135v1; published in Res. Math. Sci. 13 (2026).
- **And21** — G. Andreychev, *Pseudocoherent and perfect complexes and vector bundles on analytic adic spaces*, arXiv:2105.12591v1 (2021).
- **Sch24** — P. Scholze, *Geometrization of the real local Langlands correspondence*, author page (2024).
- **Laz65** — M. Lazard, *Groupes analytiques p-adiques*, Publ. Math. IHÉS 26 (1965), Numdam; ALRS cites Chapitre III, (1.3.9) Corollaire as Corollary I.3.9.
