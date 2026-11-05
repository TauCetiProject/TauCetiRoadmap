# Roadmap: adic coefficients and the comparison of schemes with v-sheaves, part II — prime-to-degree alterations

**Summary.** This Part II develops alterations with prescribed prime support in their generic degrees. The base roadmap AdicCoefficientsAndComparisons stops at Layer L5, which uses alterations in the scheme–v-sheaf comparison without controlling their generic degrees; this roadmap begins where that control is needed. Starting from the scheme and valuation foundations, unrestricted alterations, arbitrary-rank ramification and logarithmic geometry, it builds pointed Riemann–Zariski spaces, tame distillation for fields and schemes, functorial monoidal resolution, stable modification of non-proper relative curves, and degree-controlled desingularization of schemes and morphisms. The end results are Temkin’s char(X)-alterations and desingularization of morphisms, Gabber’s prime-to-ℓ alterations over fields and one-dimensional bases, the prime-to-ℓ variety form used by Jannsen, and the odd-degree model form used by Dittmann–Pop. Over quasi-excellent bases of dimension at most two the resolving alterations are projective; over separated quasi-excellent bases of dimension at most three, which enter through the threefold resolution of §PA.0.12, they are proper (temkin17, Theorems 1.2.5, 1.2.9 and 4.3.1, pp. 99–100 and 123–124; temkin17 lines 108, 149, 1078; ilo14, X Theorems 2.1 and 2.4, pp. 149–152; ilo14 lines 6790, 6985).

A degree prime to ℓ makes the degree scalar invertible on ℓ-primary coefficients; in cohomology theories with restriction and trace whose composite is multiplication by that degree, pullback is consequently injective. This is the application of the degree condition, with the trace identity supplied by the cohomology theory (jannsen16, Theorem 2.11 and its application, p. 24, jannsen16 line 1052; dp23, proof of Proposition 3.4, pp. 8–9, dp23 line 374).

## Scope and ownership

AdicCoefficientsAndComparisons Layer L5 uses alterations in scheme–v-sheaf comparison and does not control their prime support. This Part II owns that extension. Its layers own the noetherian, potentially reducible alteration predicate and prime-degree refinements; pseudo-projectivity and non-separated Chow; finite-type flattening beyond the proper case; support-valued snc boundaries and universal resolvability, projective and in the proper sense, including Lipman’s resolution of two-dimensional quasi-excellent schemes by normalized blow-ups; pointed Riemann–Zariski geometry including non-dominant points; valuation loci and field and alteration distillation, with separable variants; log regular pairs and normalized monoidal blow-up comparisons; the functorial monoidal theorem and inertia specializing extensions of Gabber modification; uniformization of one-dimensional valued and analytic fields, non-proper multipointed stable modification, and the scheme-level reduction to geometrically integral generic curves with its degree comparison; Rumely's existence theorem for integral points with boundary Picard torsion, and de Jong's sections and linear projections over a global Dedekind base; and the final alteration theorems. LocalFieldsRamificationPartII and LogicAndDefinabilityInNumberTheoryPartII refer to this roadmap as PrimeToDegreeAlterations; that alias resolves here.

The following subjects have their own owners and are consumed here.

- SchemeAndStackFoundations §§0.9, 0.16–0.21 supplies scheme limits, noetherian approximation, catenarity, excellence and finite normalization. Its §§4.11–4.20 supplies modifications, strict transforms, proper flattening, separated Chow, regularity, integral alterations, strict normal crossings divisors and de Jong’s field and trait theorems. The alteration and boundary notions here extend those integral/divisor carriers to reducible schemes and reduced supports; their integral and divisor specializations use the supplied objects. Its §2.20 supplies relative dualizing complexes of flat finitely presented morphisms, with uniqueness and arbitrary base change, on every curve of PA.5 including non-proper ones; its §5.9 supplies the relative intersection pairing on regular surfaces over Dedekind bases for §PA.6.11a.
- Normalization in a finite function-field extension is Mathlib’s relative normalization, with finiteness and gap:normalization-finite-field-identification from SchemeAndStackFoundations §0.20. No normalization construction or second normal-scheme carrier is a target here.
- EtaleCohomologyFoundations §F.0.A1 supplies decomposition and inertia groups of a normalization in a finite Galois extension; PA.3 extends them to finite group actions on arbitrary schemes.
- PurityOfBranchLocus §0.3 supplies the Auslander–Buchsbaum formula and freeness of maximal Cohen–Macaulay modules over regular local rings; §PA.6.11a uses the latter for Weil divisors on regular surfaces and owns no homological algebra.
- AlgebraicModuliForArithmeticGeometryPartII §4.6 supplies Zariski's lemma: on a regular two-dimensional scheme proper and flat over a regular one-dimensional scheme Z with O_Z = f_*O_S, the intersection form on the components of a fibre is negative semidefinite with radical spanned by the fibre and negative definite on every proper subset of the components. §PA.6.11a reduces its regular model to that statement through the Stein factorization and owns no intersection-form lemma.
- LocalFieldsRamificationPartII GF.0–GF.6 supplies prime-supported integers and extensions, henselization, arbitrary-rank tame and unramified extensions, their tower, base-change and composition laws, Abhyankar's inequality, and both full and separable prime-supported closed-field tameness. The pointwise tameness export is consumed there; this roadmap owns its compact-set globalization.
- CrystallineCohomology CR.5:log-algebra.1–4 supplies monoids, log structures, charts, fs fibre products, log smoothness, log regularity and logarithmic Abhyankar. The closed-subset log structure contract below extends its divisorial interface. This roadmap’s pair retains its exact boundary, rather than merely a chosen fs log structure.
- LefschetzPencilsAndVanishingCycles §0.10 supplies logarithmic group actions, very tameness, very tame quotients, log blow-ups, regular log resolution and the separated absolute and relative Gabber modification theorems. Those targets are not reconstructed here. PA.4 adds normalized blow-up comparison, functoriality on monoidally smooth maps and the inertia specializing non-separated variants.
- ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6 supplies regular-functorial resolution of reduced noetherian quasi-excellent Q-schemes. PA.4.3 owns the fan and logarithmic comparisons derived from this tower.
- ClassicalAdicEtaleCohomology §2.4 supplies the affine Zariski–Riemann model-limit presentation. PA.1 compares its space with the pointed locally ringed limit, including centres and stalks.
- Tau Ceti supplies the valuation spectrum and its patch compactness, residue degrees of scheme morphisms with their tower law, and affine invariant quotients. StableReduction Layer 2 supplies projective morphisms, relative Proj and proper-curve dualizing theory, Layer 4 blow-ups of quasi-coherent finite-type ideals and normalized blow-up resolution of normal proper models of smooth curves over a discrete valuation ring, which §PA.0.11 extends to every two-dimensional quasi-excellent scheme, and Layer 3 proper pointed prestable families and the pointed stability criterion. PA.5 retains non-proper curves, the nodal identification of the degree −1 cohomology of SchemeAndStackFoundations §2.20’s relative dualizing complex with an invertible dualizing sheaf, and stability relative to the modification, with ordered markings only after an étale splitting. Its semistability means nodality with étale smooth-locus markings; it does not imply the genus bound and absence of rational tails required by the supplier’s semistability predicate.

The de Jong equivariant field theorem in PA.6 includes the group surjection, purely inseparable invariant extension and G-strict projective compactification, beyond the non-equivariant field theorem of SchemeAndStackFoundations §4.19. The arithmetic theorem there is over a global-field Dedekind base, beyond its §4.20 trait theorem.

## Conventions

Schemes in desingularization statements are noetherian; pointed Riemann–Zariski geometry permits qcqs schemes. A maximal point means the generic point of an irreducible component. An alteration is proper, surjective, maximally dominating and finite over the scheme of generic points. In §§PA.5.3–PA.5.4, at integral qcqs bases, alteration instead means the integral carrier of SchemeAndStackFoundations §4.16: proper and dominant, finite over a nonempty open, with separable function-field extension for generically étale. Generic degrees are the positive degrees of the residue extensions at maximal source points. A P-number is a positive integer supported on P; in particular 1 is a P-number and 0 is not. An ℓ′-alteration has all these degrees prime to the prime ℓ. For integral schemes, a degree-one alteration is a modification; this equivalence does not identify arbitrary nonreduced degree-one alterations with modifications (temkin17 §4.1, p. 121, temkin17 line 970; ilo14 X §3.3.1, p. 158, ilo14 line 7288).

Residue characteristic zero contributes no element to char(X). For Spec Z_(2) the set is {2}, and for Spec Q it is empty. The empty scheme also has empty set of residue primes. Universal resolvability requires projective resolving alterations and the exact reduced inverse image of the prescribed nowhere dense subset to be snc; universal resolvability in the proper sense asks only for proper resolving alterations, and every statement in which it enters names the sense it uses. A closed snc support is empty or the reduced support of a strict normal crossings divisor; arbitrary subsets of that support need not be divisors (ilo14 X §3.3.3, p. 159, ilo14 line 7304).

Valuations are Krull valuations, recorded as valuation subrings, with arbitrary rank and trivial valuations included. A valuative point records its centre. Field restriction has direction Val_L → Val_K, O ↦ O ∩ K; for Z[i]_(1+i), restriction is Z_(2). For additive valuations the Artin–Schreier equation u^p − u = t⁻¹ with v(t) = 1 has v(u) = −1/p. Tameness includes separability after henselization; e and residue degree alone do not exclude defect (temkin17 §§2.3, 3.1.5 and 3.2, pp. 105–106 and 114–118, temkin17 lines 686, 772; LocalFieldsRamificationPartII GF.1–GF.2).

Log structures are étale fs log structures unless a fine or non-fs structure is explicitly specified. For a reduced scheme X and nowhere dense closed Z with j : U → X its complement, the boundary log structure is O_X ∩ j_*O_U×; it need not be fine. At a coordinate crossing xy = 0 the characteristic monoid is ℕ². For a trait with uniformizer π and model xy = π, the base chart ℕ → ℕ² sends 1 to (1,1); the total boundary is V(xy), while the horizontal boundary is empty. Unit coordinates have exponent group ℤ^ν and branch coordinates monoid ℕ^μ; their ranks are not interchanged (ilo14 VI §1 and X §2.6, pp. 69–70 and 155, ilo14 lines 3050, 7085).

All diagrams and field embeddings live in fixed universes, enlarged for small indexing categories of models when necessary. Composita are taken in a specified common algebraic closure. Degrees are finite-dimensional field degrees, never the totalized zero value of an infinite-dimensional finrank. No separability is added to the odd-degree model theorem. Locators for ilo14 use arXiv:1207.3648v1 internal pages; temkin10 uses arXiv:0707.3953v3; temkin17 uses the published Annals pages.

## Exact supplier contracts

### From Mathlib

Use `algebraicClosure` (Mathlib/FieldTheory/AlgebraicClosure.lean), the relative algebraic closure as an intermediate field, for §PA.5.5a; the scheme-level factorization and degree-preservation theorem there use this carrier. Use `AlgebraicGeometry.Scheme` and `AlgebraicGeometry.Scheme.residueField` (Mathlib/AlgebraicGeometry/ResidueField.lean), `ringChar`, `Module.finrank`, `Nat.primeFactors`, `Algebra.IsSeparable`, `IsGalois` and `IsPurelyInseparable` for residue characteristics and finite generic degrees. `AlgebraicGeometry.Scheme.Hom.residueDegree` (Mathlib/AlgebraicGeometry/ResidueField.lean) is the degree [κ(x) : κ(f(x))] of a morphism f at a point x, with the value 0 when that residue extension is infinite; it is used only at maximal points of alterations, where the extension is finite. The scheme predicates are `AlgebraicGeometry.IsNoetherian`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.IsDominant`, `AlgebraicGeometry.IsOpenImmersion`, `AlgebraicGeometry.IsSeparated`, `AlgebraicGeometry.Flat` and `AlgebraicGeometry.Etale`. IsNoetherian includes local noetherianness and compactness, but does not supply separatedness. Keep that distinction on non-separated bases.

Use `AlgebraicGeometry.Scheme.Hom.normalization`, `AlgebraicGeometry.Scheme.Hom.toNormalization`, `AlgebraicGeometry.Scheme.Hom.fromNormalization` and `AlgebraicGeometry.Scheme.Hom.normalizationObjIso` in Mathlib/AlgebraicGeometry/Normalization.lean for relative normalization and its affine integral-closure comparison. For Spec L → X with X integral and L finite over k(X), denote this object by Nor_L(X). Normality and the marked identification of its function field with L use gap:normalization-finite-field-identification below, rather than a pinned geometric export. The universal property `AlgebraicGeometry.Scheme.Hom.normalizationDesc` and uniqueness `AlgebraicGeometry.Scheme.Hom.normalization.hom_ext` induce maps along compatible field inclusions and modifications: the target normalization is integral over the original base. For normal X and L = k(X), the affine comparison identifies each integral closure with the original normal domain; these comparisons glue to `Nor_{k(X)}(X)` ≅ X. Finiteness uses the Nagata contract below (stacks, tag 0AVK; temkin17 §3.3.3, p. 119, temkin17 line 895).

**Checks.**

- `Nor_{Q(i)}(Spec Z)` is Spec Z[i]; the generic degree is 2, not 1.
- Normalization of Spec k[t²,t³] in k(t) is Spec k[t]; its degree is 1 although the schemes differ.
- Over F_p, normalization in F_p(t^(1/p)) is Spec F_p[t^(1/p)] of degree p; inseparable extensions are included.
- A non-Japanese DVR can have nonfinite normalization in a finite inseparable extension; finiteness cannot be inferred from normality of the DVR alone (SchemeAndStackFoundations §0.22).

The pinned normalization API supplies the relative carrier, affine integral-closure comparison, universal property and smooth base change. Its reducedness and integrality instances do not assert normality or the marked function-field identification; the latter use the supplier gap below. All comparisons use this same relative-normalization object.

Use `AlgebraicGeometry.Scheme.Hom.image`, `AlgebraicGeometry.Scheme.Hom.imageι` and `AlgebraicGeometry.Scheme.Hom.toImage` in Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean for the scheme-theoretic image and its factorization. For Spec k → Spec k[ε]/(ε²), the kernel is (ε), and the image is Spec k; the topological image alone does not recover this reduced closed subscheme. These objects supply the graph closure in §PA.6.1 and the image factorization in §PA.6.6.

Use `ValuationSubring`, `LocalSubring.exists_le_valuationSubring`, `WithConstructibleTopology` and `compactSpace_withConstructibleTopology` for valuative centres and compactness. The last instance requires a compact, quasi-sober, quasi-separated prespectral space, not an arbitrary topological space (Mathlib/Topology/Spectral/ConstructibleTopology.lean). Use `AlgebraicGeometry.IsProper.eq_valuativeCriterion`, `AlgebraicGeometry.IsSeparated.valuativeCriterion`, `AlgebraicGeometry.Flat.generalizingMap`, `AlgebraicGeometry.isOpenMap_of_generalizingMap` and `AlgebraicGeometry.Scheme.Hom.isConstructible_image` with their quasi-compactness, finite-presentation and target hypotheses. Use `Algebra.IsEtaleAt.exists_isStandardEtale` in Mathlib/RingTheory/Unramified/LocalStructure.lean on a finitely presented algebra étale at the chosen prime; first choose that finite-presentation neighborhood inside the essentially étale valuation-ring extension, and retain the subsequent minimal-polynomial argument. `MulAction.stabilizer` supplies point stabilizers; the residue-field kernel is additional geometric data.

For §PA.5.2b(ii), use `NormedField.valuation` (Mathlib/Topology/Algebra/Valued/NormedValued.lean), `Subfield.topologicalClosure` (Mathlib/Topology/Algebra/Field.lean), `IntermediateField.adjoin`, `Valuation.valuationSubring`, `ValuationSubring.comap`, `IsLocalRing.ResidueField`, `IsLocalRing.residue`, `Subfield.closure`, `Transcendental` and `Algebra.Etale`. Étaleness means formally étale and finitely presented (Mathlib/RingTheory/Etale/Basic.lean); a finite field degree is not implicit in that class.

### From Tau Ceti

`TauCeti.ValuationSpectrum` in TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean is the carrier of valuative relations; `TauCeti.ValuationSpectrum.comap`, `TauCeti.ValuationSpectrum.comap_comp` and `TauCeti.ValuationSpectrum.continuous_comap` provide restriction and its continuity. `TauCeti.ValuationSpectrum.patchTopology` and `TauCeti.ValuationSpectrum.compactSpace_patchTopology` in TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean provide constructible compactness. Over a field the comparison with valuation subrings is used with its full arbitrary-rank carrier.

`TauCeti.AlgebraicGeometry.residueDegree_comp` in TauCeti/AlgebraicGeometry/ResidueDegree.lean is the tower law: the residue degree of g ∘ f at x is the residue degree of g at f(x) times that of f at x. `TauCeti.AlgebraicGeometry.residueDegree_pos_iff` in the same file says a residue degree is positive exactly when the residue extension is finite.

`TauCeti.AffineInvariantQuotient.quotient` and `TauCeti.AffineInvariantQuotient.projection` in TauCeti/AlgebraicGeometry/Quotient/Affine.lean give Spec A^G and Spec A → Spec A^G. The finite-group module TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean supplies integral and surjective projection, `TauCeti.AffineInvariantQuotient.projection_eq_iff_exists_smul`, and `TauCeti.AffineInvariantQuotient.isFinite_projection` under finite type over the invariant subring. Its `TauCeti.AffineInvariantQuotient.isFinite_projection_of_finiteType` permits finite type over an invariant base. An arbitrary noetherian ring with finite-group action is not substituted for that finite-type hypothesis.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §0.9, limits, noetherian approximation and finite-presentation descent; §§0.16–0.18, regular implies Cohen–Macaulay implies universally catenary, with §0.17’s `depth_shortExact` (depth of the kernel in a short exact sequence); §0.20, Japanese, universally Japanese and Nagata rings and finite normalization in every finite function-field extension; §0.21, quasi-excellent and excellent schemes, quasi-excellent implies Nagata, openness of regular loci for J-2 rings, and normality of the completion of a normal local G-ring (`regular_map_completion`). In §0.20 the Nagata predicate includes noetherianness; universally Japanese alone does not. The regular local rings obtained in PA.0 are therefore excellent when quasi-excellent.

What SchemeAndStackFoundations must provide (gap:normalization-finite-field-identification): For an integral scheme X and a finite field extension L/k(X), the native relative normalization Nor_L(X) is normal, and the canonical map Spec L → Nor_L(X) identifies L with its function field compatibly with the specified embedding of k(X). This is a contract on §0.20's normalization in finite field extensions; it imposes no Nagata hypothesis and asserts no finiteness of the normalization morphism.

What SchemeAndStackFoundations must provide (gap:finite-type-fp-factorization): Every finite-type quasi-separated morphism X → S with S qcqs factors as a closed immersion X → X₀ followed by a finitely presented morphism X₀ → S; if X → S is of finite presentation over a quasi-compact open U ⊆ S, then X₀ can be chosen with X ×_S U → X₀ ×_S U an isomorphism.

For §§PA.5.3–PA.5.4 consume §4.16 `Formal.IsAlteration` and `Formal.IsAlteration.IsGenericallyEtale` on integral schemes without a noetherian hypothesis; the former records properness, dominance and finiteness on a nonempty open. This carrier is distinct from §PA.0.3's noetherian, potentially reducible generalization.

Consume §§2.4, 2.6 and 2.11 for cohomological boundaries, quasi-coherent cohomology and the identification of Picard groups with first cohomology of the multiplicative group; §§3.3–3.4 supply Euler degrees of line bundles on proper curves and Picard groups, and §3.6 supplies their map into rational points of the Jacobian for §PA.6.11a. §3.4’s `classGroup_picard_locallyFactorial` identifies the class group of a normal integral locally noetherian scheme with its Picard group when the scheme is locally factorial; §PA.6.11a proves the two-dimensional regular case of local factoriality it needs.

Consume §2.20, `RelativeDualizingComplex.exists`, `RelativeDualizingComplex.unique` and `RelativeDualizingComplex.baseChange`, for every flat finitely presented C → S, including non-proper, non-separated C and non-noetherian S: the relative dualizing pair (K, ξ) is S-perfect, unique up to the unique isomorphism preserving ξ, and its formation commutes with arbitrary derived base change; and, for f flat, separated, quasi-compact and locally of finite type over a noetherian base with Cohen–Macaulay fibres of pure dimension one, `relativeDualizingModule` with `relativeDualizingModule_invertible_iff` (invertible exactly at the Gorenstein points). §PA.5.1 constructs no second relative dualizing complex; it owns the identification of H⁻¹(K) on nodal curves over arbitrary bases.

Consume §5.9, the relative intersection pairing on a regular scheme of dimension two, proper and flat over a Dedekind base: bilinear and symmetric on vertical divisors over a closed point, given at a closed point by the residue-weighted length of the quotient by the two local equations, and agreeing over a discrete valuation ring with StableReduction Layer 4’s intersection numbers, including the negative semidefinite matrix of the components of a fibre. §PA.6.11a uses it on the regular model it builds, after proving that every Weil divisor there is Cartier. Consume §4.9, the Stein factorization of a proper morphism to a noetherian scheme, X → Spec f_*O_X → Y with the first map proper with geometrically connected fibres and the second finite; §PA.6.11a applies it to its regular model over the Dedekind base.

Consume §1.17 finite-group quotients for projective schemes over noetherian bases. Consume §§4.11–4.12 modifications, strict transforms with their dense-open witness, generic flatness, proper flattening by admissible blow-up, domination of modifications and separated Chow. Consume §4.13 regular schemes, Serre’s normality criterion, curve resolution and Bertini; §§4.16–4.17 integral alterations, their function-field maps and generic degrees (`genericDegree`, multiplicative by `genericDegree_comp`), SNC data and passage to subfamilies of components; §§4.18–4.20 split nodal curve families, their resolution and de Jong’s field and trait alteration theorems. The two generalizations in PA.0 keep finite-type, quasi-separated flattening and non-separated Chow at their full stated generality.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

Consume §§7.5–7.6, strong non-embedded resolution (§7.5) and functoriality for all regular morphisms (§7.6), both stated there as prose targets: on reduced noetherian quasi-excellent Q-schemes, a projective resolving tower in regular centres preserving the entire regular locus, functorial for regular morphisms after deletion of empty steps. PA.4.3 restricts this tower to toric Q-schemes, normalizes it, and constructs the fan and log-scheme comparisons (ilo14 VIII §§2.3.9–2.3.12, pp. 93–94, ilo14 lines 4071–4099).

### From TauCetiRoadmap.LocalFieldsRamificationPartII

Consume GF.0, prime-supported positive degrees, algebraic extensions, P-closed and separably P-closed fields and maximal P-extensions; GF.1, valued henselization and tensor decomposition by prolongations; GF.2, unramified/tame extensions after henselization, the valuation-ring étale criterion, tower and compositum laws and the separable tame tower under perfection; GF.5, unramifiedness under composition of valuations (GF.5/unramified-composition) and Abhyankar's inequality (GF.5/abhyankar-and-rank); GF.6, general tameness and the full and separable prime-supported closed-field exports. Full P-closedness implies tameness of every algebraic extension at residue primes in P, and algebraic extensions of that field retain this tameness; separable P-closedness gives only the finite separable conclusion (temkin17 Lemma 3.2.5 and Remark 3.2.6, p. 116, temkin17 line 796).

What LocalFieldsRamificationPartII must provide (gap:maximal-separable-p-extension): Every separable P-extension inside a fixed separable closure is contained in a maximal separable P-extension whose top field is separably P-closed, with every finite subextension separable of P-number degree.

**Checks.**

- For P empty, the maximal separable P-extension is K and the local degree is 1.
- For a separably closed imperfect field K of characteristic 2, adjoining t^(1/2) has degree 2 and is not tame, although every finite separable extension of K is trivial; the separable export cannot assert full tameness.
- For a p-closed field of characteristic p, every algebraic extension is tame; for F_q the extension F_(q^p)/F_q has degree p, so the p-closed hypothesis fails.

### From TauCetiRoadmap.CrystallineCohomology

Consume CR.5:log-algebra.1–4: étale log structures, fine/saturated monoids, characteristic monoids and charts, Kummer and Kummer étale morphisms, fs fibre products and saturation, Kato’s log smooth chart criterion, divisorial structures, log regularity, preservation of log regularity under log smooth morphisms, and logarithmic Abhyankar for finite tame covers of a regular SNC pair. The chart criterion retains invertibility of the torsion in the group cokernel. In PA.5, ℕ → ℕ², 1 ↦ (1,1), has cokernel ℤ; replacing it by 1 ↦ (p,p) gives torsion ℤ/p and fails in residue characteristic p.

What CrystallineCohomology must provide (gap:closed-subset-log-structure): For a reduced locally noetherian X and a nowhere dense closed Z with complement j : U → X, the subsheaf O_X ∩ j_*O_U^× of O_X is a log structure on the étale site of X. When X is regular and Z = |D| for a strict normal crossings divisor D, this subsheaf is literally the divisorial log structure M_D of CR.5:log-algebra.4, which that section defines as O_X ∩ j_*O_U^× for U = X ∖ D; no second statement is requested for that case. That a log regular fs log scheme is recovered from its triviality locus is §PA.4.1's own statement, not part of this contract.

This contract includes the non-fine boundary structure of the cusp, rather than extending the fs divisorial carrier by assumption (ilo14 VI §1.4 and X §3.2.1, pp. 69 and 158, ilo14 lines 3070, 7271; temkin17 §1.2.7, pp. 99–100, temkin17 line 119).

What CrystallineCohomology must provide (gap:kummer-etale-source-descent): For morphisms X′ → X → S of fs log schemes with X′ → X surjective and Kummer étale (equivalently surjective, log étale and exact) and X′ → S log smooth, the morphism X → S is log smooth (ilo14, Exposé X, Theorem 1.11, p. 148, ilo14 line 6778, after Kato–Nakayama). This is a contract on CR.5:log-algebra.3's log smooth and Kummer étale predicates: that section supplies lifting, the chart criterion and base change of log smoothness, not its descent along a cover of the source. §PA.4.6 consumes it for the quotient by a very tame action.

**Checks.**

- For the n-th root cover of the log affine line (A¹_k, V(t)) by itself, t ↦ tⁿ, with n invertible in k, the characteristic map is ℕ → ℕ, 1 ↦ n, with cokernel ℤ/n of invertible order, so the cover is surjective Kummer étale; the source is log smooth over the trivially logged Spec k, and descent recovers log smoothness of the target, which is also visible directly.
- For n = 1 the cover is the identity and descent returns its hypothesis.
- Surjectivity cannot be omitted: the empty log scheme over the cusp Spec k[x², x³] with trivial log structure is Kummer étale and vacuously log smooth over Spec k, but the cusp is not smooth over k.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

Consume §0.10, the logarithmic action and quotient construction, the very tame quotient theorem, separated absolute and relative Gabber modification and regular log blow-up resolution. An action is very tame at a geometric point when inertia has invertible order, acts trivially on its characteristic monoid, and acts trivially on its strict-local logarithmic stratum. The quotient of an admissible generically free very tame action on a log regular fs scheme is fs log regular and the projection is Kummer étale. The supplied Gabber construction enlarges the boundary to the inverse image of the old boundary and the nonfree locus; its map to the original log scheme need not be log smooth (ilo14 VI §3, VIII Theorem 1.1, X Theorem 1.1, pp. 73–75, 85–86 and 135–136, ilo14 lines 3263, 3681, 6117).

What LefschetzPencilsAndVanishingCycles must provide (gap:very-tame-local-quotient): The equivariant log resolution f(G, X, Z) : X′ → X of §0.10, for X noetherian, quasi-excellent, separated and log regular fs with a tame, generically free action of the finite group G, Z its logarithmic boundary and T its nonfree locus, is functorial with respect to λ-equivariant strict inert morphisms (Y, T_Y) → (X, Z) for every homomorphism λ : H → G, once the empty normalized blow-ups of the towers are discarded. Here strict means T_Y is the inverse image of Z, and inert means that the induced homomorphism of inertia groups H_y → G_x is an isomorphism at every point y over x. The instances consumed here are the G-stable open subschemes U ⊆ X with λ the identity, the local schemes `Spec O_{X,x}` with λ the inclusion G_x → G of the inertia group at x, and the strict localizations at geometric points with the same group: on each, f(G, X, Z) pulls back to the resolution of the restricted triple (ilo14 VIII Theorem 5.6.1(ii), ilo14 line 5863; inert morphisms, ilo14 VIII §5.3.6, ilo14 line 5593; as used in ilo14 X Theorem 3.1.5(i), ilo14 line 7194). The very tame quotient theorem of §0.10 is consumed as stated there; this contract asks nothing about it.

Through gap:log-blowup-universal-property, the fine log blow-up of a coherent log ideal I is universal among maps on which its pullback becomes invertible; its saturated form is the fs saturation. Both maps have source the appropriate blow-up log scheme and target (X, M). The unit ideal and every invertible log ideal give the identity (ilo14 VIII §§3.3.7–3.3.11, pp. 107–108, ilo14 line 4761).

What LefschetzPencilsAndVanishingCycles must provide (gap:log-blowup-universal-property): The log blow-up carrier of §0.10 has the universal property for making a coherent log ideal invertible, and its fs saturation supplies the saturated log blow-up on the same shared log-scheme carrier. This includes the empty ideal, whose blow-up is empty; the universal property alone does not assert that the blow-up is a modification.

The action API consumed here is pointwise and global very tameness, the implication to tameness, and the Kummer étale quotient of an admissible, generically free, very tame action on a log regular fs scheme (ilo14 VI Theorem 3.2, pp. 73–75, ilo14 line 3279). No target here uses the abelian-inertia or strict-local description of that quotient, nor openness of the very tame locus, so neither is requested.

**Checks.**

- For the sign action on A²_k with char k ≠ 2 and trivial log structure, inertia at 0 has order 2 and the characteristic monoid is 0, but its action on the whole strict-local surface is nontrivial. The action is tame and not very tame.
- With axes boundary the same action is very tame: at 0 the characteristic is ℕ² and the stratum is a point. Its quotient is (Spec k[u,v,w]/(uw−v²), V(v)), with u = x², v = xy and w = y², and the covering is Kummer étale of group Z/2.
- The trivial group acts very tamely on every fs log scheme, and its quotient is the original log scheme.
- Conjugation on Spec Z₂[i] at the closed log point has inertia order 2 in residue characteristic 2, so it is not very tame.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

Consume §2.4, normal models and Zariski–Riemann vanishing, specifically its homeomorphism of the locus of valuation rings of K containing s(A) with the cofiltered limit of integral projective A-models pointed dominantly by Spec K. The centre maps and the spectral topology are part of the contract; its cohomological vanishing theorem is not an input to PA.1.

### From TauCetiRoadmap.StableReduction

Consume Layer 2, projective morphisms, relative Proj of finitely generated graded quasi-coherent algebras, relative ampleness, and dualizing sheaves for proper Gorenstein curves with base change and component degrees under its base conventions; Layer 4, blow-ups of quasi-coherent finite-type ideals with their universal property, projectivity, strict transforms and affine charts; and Layer 3, proper pointed prestable families and the positive-degree criterion for pointed stability. Neither pinned library has projective morphisms or global blow-ups; Tau Ceti has only affine blow-up charts. The comparison of a proper semistable multipointed curve with geometrically connected fibres, after étale splitting of its finite étale marking, is with pointed prestable families, not with the supplier’s stronger semistability predicate. On non-proper curves over arbitrary bases the relative dualizing complex is SchemeAndStackFoundations §2.20’s; PA.5 identifies its degree −1 cohomology on nodal curves with an invertible sheaf, compares it with this supplier’s dualizing sheaf on proper curves, and applies the proper pointed stability criterion to contracted fibres. An identity modification of an unmarked P¹ is permitted despite dualizing degree −2.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII

Consume §4.6, Zariski's lemma for fibres of fibrations of regular surfaces: for S a regular two-dimensional scheme, f : S → Z proper and flat onto a regular one-dimensional scheme with O_Z = f_*O_S, and z a closed point with fibre f^*(z) = Σ m_i C_i, the pairing of SchemeAndStackFoundations §5.9 satisfies (C_i · C_j) ≥ 0 for i ≠ j with equality exactly when C_i ∩ C_j = ∅, (f^*(z) · C_j) = 0 for every j, is negative semidefinite on the rational span of the C_i with radical spanned by Σ m_i C_i, and is negative definite on the span of every proper subset of the components. §PA.6.11a consumes it over the Stein factorization of its regular model, so that the hypothesis O_Z = f_*O_S holds by construction, and owns only that reduction; the hypothesis is not weakened here to connected fibres.

### From TauCetiRoadmap.PurityOfBranchLocus

Consume §0.3, `IsRegularLocalRing.free_of_isCohenMacaulay`: a maximal Cohen–Macaulay module, a finite module whose depth equals the dimension of the ring, over a regular local ring is free; and `auslander_buchsbaum`, the Auslander–Buchsbaum formula for nonzero finite modules of finite projective dimension over a noetherian local ring. §PA.6.11a applies the first to a height-one prime of a two-dimensional regular local ring; the formula is cited only as the general background. For the regular local ring k[[x, y]] and p = (x), the quotient k[[y]] has depth one and p has depth two, so p is free; over the one-dimensional k[[t]] the maximal ideal has depth one and is free, generated by t.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Consume §F.0.A1, `SchemeInertia` with `SchemeInertia.decomposition` and `SchemeInertia.inertia`: for X normal integral locally noetherian, L/k(X) finite Galois with group G and finite normalization Nor_L(X), the decomposition group of a point y of Nor_L(X) is its stabilizer and the inertia group the kernel of the decomposition group acting on κ(y). §PA.3.1 extends these to finite group actions on arbitrary schemes and agrees with them on Nor_L(X).

## How to read the build

PA.0 fixes degrees, boundaries and universal resolvability in its projective and proper senses. PA.1 supplies the compact valuative spaces. PA.2 globalizes local tameness on compact valuation sets, and PA.3 passes from fields to alterations. PA.4 compares monoidal and scheme modifications and extends the supplied Gabber construction. PA.5 uniformizes one-dimensional valued and analytic fields, constructs stable models of relative curves and resolves them with prime-supported base changes. PA.6 uses simultaneous induction on relative dimension to obtain the morphism theorem and inheritance of resolvability, then its absolute, prime-to-ℓ and odd-degree consequences. The perfect-field separable assertion is proved in that same induction; it is not deduced by discarding inseparability afterwards.

## Layer PA.0: Degree-controlled alterations and universal resolvability

### 0.1 Residue characteristics of a scheme

For a scheme X, char(X) is the set of prime numbers p for which some point x ∈ X has residue field κ(x) of characteristic p. Equivalently p ∈ char(X) exactly when p is not a unit of Γ(X, O_X), that is when p is not invertible on X. Residue characteristic zero contributes nothing, so char(X) = ∅ exactly when X is a Q-scheme.

Work under these precise hypotheses: X is an arbitrary scheme; no noetherian hypothesis is needed for the definition.

The API records the following facts.

- char(X) ⊆ ℕ, the set of primes p with ringChar κ(x) = p for some x ∈ X.
- For p prime: p ∈ char(X) ⇔ the image of p in Γ(X, O_X) is not a unit.
- char(X) = ∅ ⇔ every prime is a unit of Γ(X, O_X), that is, X is a Q-scheme.
- For any morphism f : X → Y, char(X) ⊆ char(Y), since κ(f(x)) → κ(x) is a field extension.
- If f : X → Y is surjective then char(X) = char(Y).
- For an open U ⊆ X, char(U) ⊆ char(X).
- char(Spec k) = {char k} when char k > 0 and ∅ when char k = 0.
- For f : X → S dominant of finite type with S noetherian, char(S) ∖ char(X) is finite.

One proof route is as follows. Define char(X) := {p prime : ∃ x ∈ X, ringChar κ(x) = p}, with κ(x) Mathlib's residue field of the scheme at x. For the unit characterisation: p maps to zero in κ(x) exactly when p lies in the maximal ideal of `O_{X,x}`; a global section is a unit exactly when it is a unit in every stalk. For the finiteness statement: if f : X → S is dominant of finite type with S noetherian, its image is constructible (Chevalley) and contains the generic points, hence a dense open U. A prime p with S_p ⊆ S ∖ U is detected by a codimension-one point of an irreducible component T of S of characteristic zero (Krull's principal ideal theorem applied to p on T), or p is the characteristic of a component; S ∖ U has finitely many such points, so char(S) ∖ char(X) is finite (Temkin §4.3.2).

(temkin17, §1.2.1, p. 98 (temkin17 line 71); §2.1.1, p. 103 (temkin17 line 249); temkin17, §4.3.2, p. 124 (temkin17 line 1107).)

**Checks.**

- char(Spec Q) = ∅. This excludes inserting 0 into the prime set.
- char(Spec Z_(2)) = {2}. The characteristic of the generic field is 0, so generic characteristic alone gives the wrong set.
- char(Spec Z) is the set of all primes. A singleton obtained from the generic point misses every closed fibre.
- char(Spec Z[1/6]) is the set of primes p ≥ 5; in particular it is not determined by the characteristic of the generic point, which is 0. Invertibility excludes 2 and 3 separately.
- char(∅) = ∅. The empty scheme has no witnessing point.
- char(Spec F_p[t]) = {p}. Adjoining a variable does not add residue primes.

char(Spec Q) = ∅ and char(Spec Z_(2)) = {2} (the two examples printed in Temkin §2.1.1), and char(Spec Z) is the set of all primes. For f : X → Y, char(X) ⊆ char(Y); equality holds when f is surjective.

*Needs:* Mathlib `AlgebraicGeometry.Scheme.residueField`; Mathlib `ringChar`; Mathlib `Nat.primeFactors`; Mathlib `AlgebraicGeometry.Scheme.Hom.isConstructible_image`.

### 0.2 Maximal points and maximally dominating morphisms

Let S be a noetherian scheme with maximal points (generic points of irreducible components) η_1, …, η_n. The scheme of generic points is η_S := ⊔_i Spec κ(η_i). A morphism f : X → S of noetherian schemes is maximally dominating if it maps every maximal point of X to a maximal point of S; equivalently, the generic fibre X ×_S η_S is dense in X.

Work under these precise hypotheses: S and X noetherian (so that they have finitely many maximal points).

The API records the following facts.

- x is a maximal point: the closure of {x} is an irreducible component of X.
- Maximal domination means that every maximal source point maps to a maximal target point.
- For noetherian X and S, maximal domination is equivalent to density of the generic fibre in X.
- Composites of maximally dominating morphisms are maximally dominating.
- A dense open immersion is maximally dominating.
- If X and S are irreducible, maximal domination is equivalent to Mathlib’s dominance predicate; for reducible S an irreducible source can dominate one component without being dominant onto S.
- The restriction to an open subscheme of X is maximally dominating.

One proof route is as follows. Define maximal points as generic points of irreducible components (Mathlib's irreducible components and generic points of irreducible closed subsets). Equivalence with density of X ×_S η_S: the maximal points of X lying over maximal points of S are exactly the maximal points of the generic fibre. The generic fibre is stable under generization in X, and a generization-stable subset of a noetherian space is dense exactly when it contains every maximal point (an arbitrary dense subset, such as the set of closed points of A^1_k, need not contain one).

(temkin17, §4.1.1, pp. 120–121 (temkin17 line 970); ilo14, Exposé II, Definition 1.1.2 (ilo14 line 1158); Exposé X, §2 opening paragraph, arXiv v1 p. 148 (ilo14 lines 6782–6787).)

**Checks.**

- 𝔾_m → A^1_k is maximally dominating. The generic point survives despite missing the origin.
- Spec k → A^1_k at the origin is not maximally dominating. Its sole maximal point maps to a nonmaximal point.
- A^1_k ⊔ Spec k → A^1_k (extra point to the origin) is surjective and dominant but not maximally dominating. Dominance alone admits the extra vertical component.
- The identity of a noetherian scheme is maximally dominating, and so is ∅ → S. The empty source tests the universal quantifier over maximal points.

The inclusion of a dense open subscheme is maximally dominating. X = A^1_k ⊔ Spec k → A^1_k, mapping the extra point to the origin, is dominant and surjective but not maximally dominating.

*Needs:* Mathlib `AlgebraicGeometry.IsDominant`; Mathlib `AlgebraicGeometry.IsNoetherian`.

### 0.3 Alterations of noetherian schemes

A morphism f : X → S of noetherian schemes is an alteration if it is proper, surjective, maximally dominating and generically finite, the last meaning that X ×_S η_S → η_S is finite. For X and S integral this is the alteration of SchemeAndStackFoundations §4.16 (proper, dominant, finite over a nonempty open).

Work under these precise hypotheses: X, S noetherian.

The API records the following facts.

- The alteration predicate is the conjunction of properness, surjectivity, maximal domination and finiteness over the generic-point scheme.
- For X, S integral noetherian: The noetherian alteration predicate agrees with the supplied integral alteration predicate.
- A composite of alterations is an alteration.
- For S quasi-excellent noetherian, Nor(S_red) → S is an alteration.
- X_red → X is an alteration.
- A modification of integral noetherian schemes is an alteration.

One proof route is as follows. Use the stated conjunction to define the alteration predicate. Comparison with the integral case: for X, S integral, a proper dominant morphism is surjective; finiteness of the generic fibre spreads out to finiteness over a nonempty open (limits, SchemeAndStackFoundations §0.9), and conversely. Normalization example: if S is quasi-excellent, it is Nagata (SchemeAndStackFoundations §0.20, Excellence.IsQuasiExcellentRing.isNagata), so the normalization of S_red is finite, hence proper and surjective, and it is an isomorphism over the generic points.

(temkin17, §4.1.2, p. 121 (temkin17 line 976); ilo14, Exposé X, §3.3.1, arXiv v1 p. 158 (ilo14 line 7288).)

**Checks.**

- Spec k[t] → Spec k[t², t³] is an alteration of generic degree 1. Birationality permits changing the local ring.
- The absolute Frobenius of `A^1_{F_p}` is an alteration of generic degree p. Generic finiteness does not imply separability.
- P^1_k → Spec k is not an alteration (its generic fibre is not finite). Properness and surjectivity do not imply generic finiteness.
- A^1_k ⊔ Spec k → A^1_k is proper on each piece and surjective but not an alteration: it is not maximally dominating. Generic degree alone fails to exclude a vertical component.
- The identity of a noetherian scheme is an alteration. The degree is 1 on each component.

For a quasi-excellent noetherian S, the normalization of S_red is an alteration (Temkin §4.1.2). P^1_k → Spec k is proper and surjective but not an alteration.

*Needs:* Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.IsFinite`; §PA.0.2; TauCetiRoadmap.SchemeAndStackFoundations §§0.9, 0.16–0.21; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 0.4 P-alterations, ℓ′-alterations and separable alterations

Let f : X → S be an alteration and P a set of primes. For a maximal point x of X the generic degree is deg_x f := f.residueDegree x, Mathlib's residue degree `AlgebraicGeometry.Scheme.Hom.residueDegree`, that is [κ(x) : κ(f(x))], positive because the generic fibre is finite. Then f is a P-alteration if every deg_x f is a P-number (every prime divisor lies in P; LocalFieldsRamificationPartII GF.0), an ℓ′-alteration if it is a P-alteration for P = {ℓ}′ (all degrees prime to ℓ), and separable if every κ(x)/κ(f(x)) is separable. For X and S integral there is one degree, [k(X) : k(S)], which is SchemeAndStackFoundations §4.16 `genericDegree`.

Work under these precise hypotheses: f is an alteration of noetherian schemes; P is any set of prime numbers (possibly empty or all primes).

The API records the following facts.

- For a maximal point x of X, deg_x f = finrank κ(f(x)) κ(x) ∈ `ℕ_{>0}`.
- A P-alteration is an alteration whose generic degrees are positive P-numbers.
- If f : X → Y and g : Y → S are P-alterations, so is g ∘ f.
- P ⊆ P′ and f a P-alteration ⇒ f a P′-alteration.
- For integral X, S: f is a ∅-alteration ⇔ f is a modification.
- A separable alteration is an alteration for which every residue extension at a maximal source point is separable.
- Composites of separable alterations are separable.
- f is an ℓ′-alteration ⇔ ℓ does not divide any deg_x f.
- Every alteration is a P-alteration for P the set of all primes.

One proof route is as follows. Define the generic degrees from the finite residue extensions at maximal points (finiteness: the generic fibre is finite). Composition: maximal points map to maximal points and residue degrees multiply in towers (Tau Ceti `TauCeti.AlgebraicGeometry.residueDegree_comp`; in the integral case SchemeAndStackFoundations §4.16 `genericDegree_comp`), so a composite of P-alterations is a P-alteration (P-numbers are closed under products, GF.0). Degree one at every maximal point, for integral X and S, is SchemeAndStackFoundations' criterion for a modification.

(temkin17, §1.2.1, p. 98 (temkin17 line 71); ilo14, Exposé X, §2 opening paragraph, arXiv v1 p. 148 (ilo14 line 6783); §3.3.1, p. 158 (ilo14 line 7288).)

**Checks.**

- Frobenius of `A^1_{F_p}` is a {p}-alteration, not separable, and not a p′-alteration. For p = 2 and 3 the degrees are 2 and 3, respectively.
- Spec Z[i] → Spec Z is a separable {2}-alteration and a 3′-alteration. Generic separability does not assert étaleness at 2.
- The identity of a noetherian scheme is a ∅-alteration (degree 1 has no prime factors); conversely a ∅-alteration of integral schemes has generic degree 1. Positive degree 1 has empty prime support; degree 0 is excluded.
- Spec Z[i] → Spec Z is not a ∅-alteration: its degree is 2. The degree is 2 rather than 1.
- t ↦ t² on A^1_Q is an alteration of degree 2 that is not a char(A^1_Q)-alteration, since char(A^1_Q) = ∅. Separability alone does not give the required prime support.
- Every alteration is a P-alteration when P is the set of all primes. There is still a positive finite degree at each generic point.

The absolute Frobenius of `A^1_{F_p}` is a {p}-alteration that is not separable. For P = ∅ a P-alteration of integral schemes is a modification. For X a Q-scheme, char(X) = ∅, so a char(X)-alteration of an integral X has degree 1.

*Needs:* §PA.0.3; TauCetiRoadmap.LocalFieldsRamificationPartII GF.0/prime-supported-degree; Mathlib `Algebra.IsSeparable`; Mathlib `Nat.primeFactors`; Mathlib `AlgebraicGeometry.Scheme.Hom.residueDegree`; Tau Ceti `TauCeti.AlgebraicGeometry.residueDegree_comp`; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 0.5 Pseudo-projective morphisms

A finite-type morphism f : X → S is pseudo-projective if it factors as X → X̄ → S where X̄ → S is projective and X → X̄ is a local isomorphism (X has an open cover on whose members X → X̄ restricts to open immersions). For separated f this is quasi-projectivity, and for proper f projectivity.

Work under these precise hypotheses: f of finite type; S quasi-compact and quasi-separated.

The API records the following facts.

- Pseudo-projectivity consists of a factorization f = g ∘ h with h a local isomorphism and g projective.
- Quasi-projective morphisms are pseudo-projective.
- For separated f: pseudo-projective ⇔ quasi-projective; for proper f: ⇔ projective.
- Pseudo-projectivity is stable under base change.
- Composition does not preserve pseudo-projectivity: the blow-up example of ILO X 3.1.7(i).

One proof route is as follows. Define the property by the existence of the factorisation. If f = g ∘ h is separated, then h : X → X̄ is separated, of finite type and étale (a local isomorphism), hence quasi-finite. By Zariski’s main theorem (stacks, tag 05K0, More on Morphisms line 6247) h factors as a quasi-compact open immersion into a scheme T finite over X̄; T → X̄ → S is projective over the qcqs S, so f is quasi-projective. A separated local isomorphism need not be an open immersion (two disjoint copies of an open subscheme of X̄ map to X̄), so this step cannot use the open-immersion criterion of ILO X 3.1.9, which needs an open embedding on a dense open. If f is moreover proper, the image of X in T is also closed, so X is open and closed in a scheme projective over S and f is projective (ILO X Remark 3.1.7(ii)).

(ilo14, Exposé X, §3.1.6 and Remark 3.1.7, arXiv v1 p. 157 (ilo14 line 7223); temkin17, §4.2, p. 121 (temkin17 line 992).)

**Checks.**

- An open subscheme of P^n_S is pseudo-projective over S. The factorization uses the given open immersion.
- The affine plane with doubled origin over k, mapped by its two charts into P^2_k, is pseudo-projective over k. A local isomorphism need not be a globally injective open immersion.
- Blowing up one origin of the doubled-origin plane gives a scheme that is not pseudo-projective over k: two k-maps from the spectrum of the DVR at the exceptional curve's generic point agree generically but differ at the closed point. This also tests failure under composition.
- The identity S → S is pseudo-projective. The factorization has two identity arrows.

The affine plane with doubled origin is pseudo-projective over k, but its blow-up at one of the origins is not (ILO X 3.1.7(i)). A separated pseudo-projective morphism is quasi-projective.

*Needs:* Mathlib `AlgebraicGeometry.IsOpenImmersion`; Mathlib `AlgebraicGeometry.IsSeparated`; TauCetiRoadmap.SchemeAndStackFoundations §§0.9, 0.16–0.21; TauCetiRoadmap.StableReduction Layer 2.

### 0.6 Flattening of finite-type morphisms by admissible blow-ups

Let S be quasi-compact and quasi-separated and U ⊆ S a quasi-compact open. (i) If f : X → S is of finite type and quasi-separated and X_U → U is flat and locally of finite presentation, there is a U-admissible blow-up S′ → S (centre disjoint from U, cut out by a finite-type ideal) such that the strict transform of X is flat and of finite presentation over S′ (Stacks 081R). (ii) If X is quasi-compact and locally of finite presentation over S and F is a quasi-coherent O_X-module of finite type with F_U of finite presentation and flat over U, there is a U-admissible blow-up S′ → S such that the strict transform of F is of finite presentation and flat over S′ (Stacks 0815). For noetherian integral S and dense U, (i) extends SchemeAndStackFoundations' flattening_by_blowup from proper to arbitrary finite-type f.

Work under these precise hypotheses: S qcqs; U ⊆ S quasi-compact open; in (i) f of finite type and quasi-separated with X_U → U flat and locally of finite presentation; in (ii) X quasi-compact and locally of finite presentation over S, F of finite type with F_U flat and of finite presentation.

One proof route is as follows. (ii) is the module flattening theorem in the precise form of Stacks 0815. For separated f, (i) reduces to (ii) through a closed immersion of X into a separated finitely presented S-scheme and noetherian approximation (SchemeAndStackFoundations §0.9); Stacks 081R treats quasi-separated finite-type f directly. The blow-ups are U-admissible and are descended from the local constructions; no finite presentation of f itself is needed in (i), only over U. Strict transforms along modifications are those of SchemeAndStackFoundations §4.11; generic flatness (§4.12) gives the dense U when S is integral (Stacks 052A).

(stacks, Tag 0815 (Theorem 38.30.7, More on Flatness line 4197) and Tag 081R (Lemma 38.31.1, More on Flatness line 4250); temkin17, proof of Lemma 3.1.6, p. 115; proof of Theorem 3.3.6, p. 120 (temkin17 line 744); ilo14, Exposé X, proof of Theorem 3.4, Steps 2 and 7, arXiv v1 pp. 160–161 (ilo14 line 7373).)

For f proper, S noetherian integral and U dense, this is SchemeAndStackFoundations' flattening_by_blowup. Bl_0 A^2 → A^2 is flattened by the blow-up of the origin itself, with strict transform an isomorphism.

*Needs:* TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.SchemeAndStackFoundations §§0.9, 0.16–0.21; TauCetiRoadmap.SchemeAndStackFoundations §0.9, noetherian approximation and finite-presentation descent; TauCetiRoadmap.SchemeAndStackFoundations §0.9, finite-type factorization contract; TauCetiRoadmap.StableReduction Layer 4.

### 0.7 Chow's lemma for non-separated morphisms

Let f : X → S be a finite-type morphism of quasi-compact quasi-separated schemes with X having finitely many maximal points. Then there is a projective modification g : X′ → X, which may be taken to be a blow-up along a finitely generated ideal with nowhere dense support, such that X′ → S is pseudo-projective.

Work under these precise hypotheses: X, S qcqs; f of finite type; X has finitely many maximal points.

One proof route is as follows. By the flattening construction used in ILO X proof of Proposition 3.1.8 there is a modification X′ → X with X′ → S factoring as an étale X′ → X̄, an isomorphism on dense opens, followed by a projective X̄ → S. An étale morphism which is an open embedding on a dense open is a local isomorphism (ILO X 3.1.9: on separated pieces the diagonal is open and closed, so the morphism is an étale monomorphism, hence an open immersion). For separated f this recovers SchemeAndStackFoundations' chow_lemma.

(ilo14, Exposé X, Proposition 3.1.8 and Lemma 3.1.9, arXiv v1 pp. 157–158 (ilo14 line 7246).)

For separated f, X′ → S is quasi-projective (SchemeAndStackFoundations §4.12).

*Needs:* §PA.0.6; §PA.0.5; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.StableReduction Layer 2; TauCetiRoadmap.StableReduction Layer 4.

### 0.8 Strict normal crossings supports

Let X be a regular noetherian scheme. A closed subset Z ⊆ X is an snc support ("Z is an snc divisor" in the convention of ILO X §3.3.3) if Z = ∅ or Z is the support of a divisor D on X satisfying SchemeAndStackFoundations' IsStrictNormalCrossings (§4.17): D is the reduced sum of components D_i with every nonempty partial intersection D_J regular of codimension |J|.

Work under these precise hypotheses: X regular and noetherian (SchemeAndStackFoundations §4.13 IsRegular).

The API records the following facts.

- Z = ∅ or Z is the support of a strict normal crossings divisor of SchemeAndStackFoundations §4.17.
- ∅ is an snc support of every regular noetherian X.
- A union of irreducible components of an snc support is an snc support.
- If Z′ is an snc support and Z ⊆ Z′ is the support of an effective Cartier divisor, then Z is an snc support.
- Every irreducible component of a nonempty snc support has codimension one.
- Restriction to an open subscheme preserves snc supports.
- The preimage of an snc support under a smooth morphism of regular schemes is an snc support.

One proof route is as follows. Use existence of a strict normal crossings divisor with support Z, allowing the empty divisor. Sub-divisors: a union of irreducible components of an snc support is an snc support (the subfamily theorem of §4.17). Cartier sub-supports: if Z′ is an snc support and Z ⊆ Z′ is the support of an effective Cartier divisor, every irreducible component of Z has codimension one (Krull's principal ideal theorem in the regular, hence normal, local rings) and is contained in Z′, so it is a component of Z′; hence Z is an snc support.

(ilo14, Exposé X, §3.3.3, arXiv v1 p. 159 (ilo14 line 7304); temkin17, Theorems 1.2.5, 1.2.9, 4.2.1, 4.3.1, pp. 99–124 (temkin17 line 1083).)

**Checks.**

- V(xy) ⊆ A^2_k is an snc support with two components. The two branches meet in codimension 2.
- ∅ ⊆ X is an snc support. The empty divisor is allowed.
- The origin of A^2_k is not an snc support: it has codimension two. Being a closed subset of a boundary is insufficient.
- For char k ≠ 2, V(y² − x²(x+1)) ⊆ A^2_k is not an snc support: its only component is singular at the node. Étale normal crossings and strict normal crossings differ.
- V(xy(x − y)) ⊆ A^2_k is not an snc support. Three branches cannot be three parameters in dimension 2.

V(xy) ⊆ A^2_k is an snc support; the origin of A^2_k is not. The nodal cubic V(y² − x²(x+1)) ⊆ A^2_k (char k ≠ 2) is not an snc support.

*Needs:* TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; Mathlib `IsRegularLocalRing`.

### 0.9 Universal P-resolvability

Let X be a noetherian scheme and P a set of primes. X is universally P-resolvable if for every alteration Y → X and every nowhere dense closed Z ⊆ Y there is a projective P-alteration f : Y′ → Y with Y′ regular and f⁻¹(Z) an snc support; universally separably P-resolvable if f can moreover be chosen separable. X is universally (separably) P-resolvable in the proper sense if the same holds with f only a (separable) P-alteration: f is proper, as every alteration is, but need not be projective. The projective notion follows ilo14 Exposé X §3.3.3; the proper sense is the notion of temkin17 §4.1.4. Universally resolvable means P = ∅, so all resolving generic degrees are 1. The resolution factors through Y_red, since Y′ is reduced; on reduced integral components it is a modification, projective in the projective sense, while no generic isomorphism to a generically nonreduced Y is asserted.

Work under these precise hypotheses: X noetherian; P a set of primes.

The API records the following facts.

- ∀ alteration Y → X, ∀ nowhere dense closed Z ⊆ Y, ∃ projective P-alteration f : Y′ → Y with Y′ regular and f⁻¹(Z) an snc support.
- The same with f separable.
- In the proper sense: the same quantifiers with f a P-alteration (respectively a separable P-alteration), proper but not necessarily projective.
- Universally (separably) P-resolvable implies universally (separably) P-resolvable in the proper sense, since projective morphisms are proper.
- P ⊆ P′ ⇒ universally P-resolvable implies universally P′-resolvable, in each sense.
- If X is universally P-resolvable, so is every alteration of X (alterations compose), in each sense.
- Universally resolvable (P = ∅) implies universally P-resolvable for every P, in each sense.
- Spec k is universally resolvable: an alteration of Spec k is finite, its reduction is regular, Y_red → Y is a closed immersion, hence projective, and every nowhere dense closed subset is empty.

One proof route is as follows. Quantify over all alterations Y → X of §PA.0.3 and nowhere dense closed Z. Monotonicity: a P-alteration is a P′-alteration for P ⊆ P′. Universal ℓ′-resolvability of ILO X §3.3.3 is the case P = {ℓ}′ for ℓ invertible on X.

(temkin17, §4.1.4, p. 121 (temkin17 line 987); ilo14, Exposé X, §3.3.3 and Remark 3.3.4, arXiv v1 p. 159 (ilo14 line 7304).)

**Checks.**

- Spec k is universally resolvable for every field k. Reducing a finite zero-dimensional scheme gives fields; a nowhere dense subset is empty.
- Universally {2}-resolvable implies universally {2,3}-resolvable. Enlarging P allows more degrees, never fewer.
- The regular DVR A of K = k(x, y^p) ⊆ k((x)) (y transcendental) is not universally P-resolvable, even in the proper sense: the finite purely inseparable K′ = k(x, y) gives an alteration Y = Spec A[y] of Spec A whose normalization Spec A′ is not finite over A (ILO X 3.3.4(iv)), and a proper P-alteration Y′ → Y with Y′ regular would make A′ a submodule of the finite A-module Γ(Y′₀, O), which is integrally closed in k(Y′₀), for a connected component Y′₀ of Y′ dominating Y; so A′ would be finite over A. Regularity of the base alone does not give universal resolvability.
- For P = ∅ and Y integral, a resolving alteration in the projective sense is a projective modification, while in the proper sense any proper modification with regular source and snc boundary is admitted. A definition that silently replaced projective by proper would make §§PA.0.10–PA.0.11 weaker than stated.
- The empty scheme is universally P-resolvable for every P. There are no nonempty schemes mapping to the empty base.

Spec of a field is universally resolvable. A regular but non-quasi-excellent DVR (ILO X 3.3.4(iv)) is not universally P-resolvable for any P.

*Needs:* §PA.0.3; §PA.0.4; §PA.0.8; Mathlib `AlgebraicGeometry.IsProper`; TauCetiRoadmap.StableReduction Layer 2.

### 0.10 Universal resolvability in dimension at most one

Every noetherian quasi-excellent scheme S of dimension at most one is universally resolvable, hence universally P-resolvable for every P.

Work under these precise hypotheses: S noetherian, quasi-excellent, dim S ≤ 1.

One proof route is as follows. An alteration Y → S is proper over S, so Y is noetherian quasi-excellent of dimension ≤ 1 (finite type over qe; dimension does not grow under generically finite proper maps). Y qe ⇒ Nagata (SchemeAndStackFoundations §0.20), so the normalization Y′ of Y_red is finite; by resolution_of_curves (§4.13) Y′ is regular and Y′ → Y is a finite, hence projective, degree-one alteration, induced by modifications of the reduced components. A nowhere dense closed Z ⊆ Y is a finite set of closed points; its preimage in the regular one-dimensional Y′ is a finite set of closed points, a reduced divisor whose components are disjoint regular points, hence an snc support (or empty).

(ilo14, Exposé X, Remark 3.3.4(ii), arXiv v1 p. 159 (ilo14 line 7318); stacks, Tag 0C45 (Lemma 33.41.1) and Tag 0BI4 (Lemma 54.15.1) (stacks, Varieties line 4034; Resolution of Surfaces line 1918).)

Spec of an excellent Dedekind domain and every curve over a field are universally resolvable.

*Needs:* §PA.0.9; TauCetiRoadmap.SchemeAndStackFoundations §§0.9, 0.16–0.21; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 0.11 Universal resolvability of quasi-excellent surfaces

Every noetherian quasi-excellent scheme S of dimension at most two is universally resolvable: for every alteration Y → S and nowhere dense closed Z ⊆ Y there is a projective degree-one alteration Y′ → Y with Y′ regular and the preimage of Z an snc support. Moreover Y′ is the disjoint union, over the irreducible components Y_i of Y with their reduced structure, of regular schemes W_i with projective modifications W_i → Y_i.

Work under these precise hypotheses: S noetherian, quasi-excellent, dim S ≤ 2.

One proof route is as follows. An alteration Y → S is proper and generically finite, so Y is noetherian, quasi-excellent (of finite type over S) and of dimension ≤ 2. The map from the disjoint union of its finitely many reduced components Y_i to Y is finite, hence projective, and an isomorphism to Y_red over the dense open complement of the pairwise intersections. Its residue degrees at the maximal points of Y are 1, so it is a degree-one alteration to Y. A component of dimension 0 is the spectrum of a field, and a component of dimension 1 is resolved by its finite normalization as in §PA.0.10. For a component Y_i of dimension 2 apply Lipman's theorem in the form (4) ⇒ (3) of stacks Tag 0BGP: if the normalization Y_i^ν → Y_i is finite, Y_i^ν has finitely many singular points and the completed local rings there are normal, then a finite sequence of normalized blow-ups in closed points, starting from Y_i^ν, ends at a regular Y′_i. The three conditions hold because Y_i is quasi-excellent. Quasi-excellent schemes are Nagata (SchemeAndStackFoundations §0.20, `Excellence.IsQuasiExcellentRing.isNagata`), so Y_i^ν → Y_i is finite. Y_i^ν is quasi-excellent, so its singular locus is closed by the J-2 property (§0.21); it contains no point of codimension at most one, because a normal scheme satisfies (R_1) (§4.13, Serre's criterion); and in a noetherian scheme of dimension 2 a closed set of points of codimension 2 is a finite set of closed points. The local ring of Y_i^ν at each singular point is a normal local G-ring, so its completion is normal (§0.21, `regular_map_completion`). A normalized blow-up is the blow-up of a closed point, which is projective (StableReduction Layer 4), followed by the normalization of that quasi-excellent, hence Nagata, blow-up, which is finite; so Y′_i → Y_i is a projective modification. Put Y₁ = ⊔ Y′_i. The composite Y₁ → Y is a projective degree-one alteration and an isomorphism over a dense open of Y_red containing every maximal point. Y₁ is regular and quasi-excellent, hence Cohen–Macaulay, universally catenary and excellent (SchemeAndStackFoundations §§0.16–0.21). Let D ⊆ Y₁ be the reduced preimage of Z. Maximal points of Y₁ map to maximal points of Y, which Z avoids, so D is nowhere dense and of dimension ≤ 1. Cossart–Jannsen–Saito Corollary 0.4, applied to the regular excellent Y₁ and D, gives a projective surjective π : Y′ → Y₁, an isomorphism off D, with Y′ regular and π⁻¹(D)_red a strict normal crossings divisor (its proof applies cjs Theorem 0.3 with empty boundary and then blows up the regular strict transform). The composite Y′ → Y is a projective degree-one alteration with Y′ regular, the preimage of Z is π⁻¹(D), an snc support (§PA.0.8), and W_i = π⁻¹(Y′_i) is a projective modification of Y_i. Over an excellent S, Cossart–Jannsen–Saito Theorem 0.1 gives the first step canonically, by blow-ups of Y_red in permissible centres inside its singular locus; the route above does not need excellence of S.

(stacks, Resolution of Surfaces, Theorem 54.14.5 (Tag 0BGP), Definitions 54.5.1 (Tag 0BBS) and 54.14.2 (Tag 0BGL) (stacks, Resolution of Surfaces lines 1880, 488, 1752); cjs, Theorem 0.1 and Corollary 0.4 (with Theorem 0.3), arXiv v2 pp. 3–5 (cjs lines 43, 131); ilo14, Exposé X, Remark 3.3.4(ii), arXiv v1 p. 159 (ilo14 line 7318); temkin17, Remark 1.2.3, p. 99 (temkin17 line 94).)

**Checks.**

- For Y = Spec k[x,y,ε]/(ε²), the single reduced component is Spec k[x,y]. The map has kernel (ε) ≠ 0, so it is not an isomorphism to Y on any nonempty open, but its comparison with Y_red is the identity and its generic residue degree is 1.
- For S = Y = Spec k[[x, y]] (complete, hence excellent) and Z the closed point: Y is regular, its normalization is the identity and Lipman's sequence is empty, so Y₁ = Y and D = Z has codimension 2. Corollary 0.4 blows up the closed point; the preimage of Z is the exceptional curve ≅ P¹_k, one regular component, so an snc support. The identity is not a solution: a point of codimension 2 is not an snc support.
- For S = Y = Spec k[u, v, w]/(uw − v²) and Z = ∅: Y is normal with the vertex as its only singular point. One blow-up of the vertex has the regular charts k[u, v₁] (v = uv₁, w = uv₁²), k[w, v₂] (symmetrically) and k[v, s, s⁻¹] (u = vs, w = vs⁻¹), so it is already normal and Lipman's sequence has length one; Y′ is this blow-up with exceptional curve P¹, of degree 1, and π is the identity since D = ∅.
- For S = Y = Spec k[x, y, z]/(xz, yz), the plane z = 0 and the z-axis meeting at the origin, with Z the origin: Y is not regular at the origin. The components give Y₁ = A²_k ⊔ A¹_k, of degree 1 at both maximal points; D is the origin in each. In A¹_k it is already an snc support, while in A²_k it has codimension 2 and is blown up, so Y′ = Bl₀A²_k ⊔ A¹_k and the preimage of Z is the exceptional curve together with one point. Components of different dimensions are resolved separately.
- For the non-quasi-excellent regular DVR A of the §PA.0.9 Check, S = Spec A[z] is regular of dimension two but not universally resolvable, even in the proper sense: the alteration Spec A[y, z] has normalization Spec A′[z], and a regular proper alteration Y′ of it would make A′[z] a submodule of the finite A[z]-module Γ(Y′₀, O) of a dominating component, hence A′ = A′[z]/(z) finite over A. Regularity of S does not replace quasi-excellence.

*Needs:* §PA.0.9; §PA.0.8; §PA.0.10; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`; TauCetiRoadmap.SchemeAndStackFoundations §§0.9, 0.16–0.21; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.StableReduction Layer 4.

### 0.12 Universal resolvability of separated quasi-excellent threefolds in the proper sense

Every separated noetherian quasi-excellent scheme S with dim S ≤ 3 is universally resolvable in the proper sense of §PA.0.9: for every alteration Y → S and every nowhere dense closed Z ⊆ Y there is a proper degree-one alteration Y′ → Y, factoring through Y_red and a modification of each reduced irreducible component, with Y′ regular and the reduced preimage of Z an snc support. When Y is affine, Y′ → Y can be taken projective. Neither projectivity of Y′ → Y for non-affine Y nor the case of non-separated S is part of the statement: Cossart–Piltant Theorem 1.1 assumes the scheme separated and gives projectivity only over the members of a chosen finite affine cover.

Work under these precise hypotheses: S separated, noetherian, quasi-excellent, dim S ≤ 3.

One proof route is as follows. An alteration Y → S is proper, so Y is separated, noetherian, quasi-excellent (of finite type over S) and of dimension ≤ 3 (generically finite over S). Cossart–Piltant Theorem 1.1, applied to the reduced separated Y_red, gives a proper birational π₁ : Y₁ → Y_red with Y₁ regular, π₁ an isomorphism over the regular locus Reg(Y_red), which is a dense open since Y_red is reduced and quasi-excellent, and π₁⁻¹(Sing Y_red) a strict normal crossings divisor; when Y is affine, the one-member affine cover makes π₁ projective (cp19 Theorem 1.1, last clause; Remark 1.4). Let D ⊆ Y₁ be the reduced preimage of Z. D is closed. Every maximal point of Y₁ maps to a maximal point of Y_red, and Z avoids these points. Hence D contains no maximal point of Y₁, so it is nowhere dense and has dimension ≤ 2. A regular quasi-excellent scheme is Cohen–Macaulay, hence universally catenary, hence excellent (SchemeAndStackFoundations §§0.16–0.21), so Cossart–Jannsen–Saito Corollary 0.4 gives a projective surjective π₂ : Y′ → Y₁, an isomorphism off D, with Y′ regular (its proof ends by blowing up a regular centre in a regular scheme) and π₂⁻¹(D)_red a strict normal crossings divisor, as in §PA.0.11. The composite Y′ → Y₁ → Y_red → Y is proper and an isomorphism over a dense open of Y_red containing every maximal point, so it is a degree-one alteration and a modification of each reduced component; the preimage of Z is π₂⁻¹(D), an snc support (§PA.0.8). When Y is affine the three maps are projective, and so is their composite over the noetherian affine Y.

(cp19, Theorem 1.1, arXiv v2 pp. 3–4 (cp19 line 93); Corollary 1.2 and Remark 1.4, p. 4 (cp19 lines 111, 124); temkin17, Remark 1.2.3, p. 99; §4.3.2, p. 124 (temkin17 lines 94, 1107); cjs, Corollary 0.4 (with Theorem 0.3), arXiv v2 p. 5 (cjs line 131).)

**Checks.**

- For S = Spec A with A a reduced complete noetherian local ring of dimension three, the alteration Y = S is affine and Cossart–Piltant Corollary 1.2 gives a projective good resolution, as the affine clause predicts.
- For S the affine plane over Z with its zero section doubled (two copies of Spec Z[x, y] glued along the complement of V(x, y)), S is noetherian, quasi-excellent and of dimension three but not separated; the identity Y = S is an alteration to which Cossart–Piltant Theorem 1.1 does not apply. The separatedness hypothesis is needed for the stated route and is not dropped.
- For Y = Spec k[u,v,w,t]/(uw−v²) and Z = V(v,w), Z ∩ Reg(Y) omits the singular line V(u,v,w) and is not closed. The reduced full inverse image D is closed, avoids every generic point and has dimension at most 2, including its exceptional specialization points.
- For S regular and Z = ∅, the identity of Y = S already satisfies the conclusion, with degree 1 at every maximal point.

*Needs:* §PA.0.3; §PA.0.8; §PA.0.9; §PA.0.11; TauCetiRoadmap.SchemeAndStackFoundations §§0.9, 0.16–0.21; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.StableReduction Layer 2.

### Examples

For the cusp Spec k[t²,t³], normalization has degree 1. Frobenius on A¹ over F₂ has degree 2 and over F₃ degree 3; each is a singleton-prime alteration and neither is separable. The origin in A² has codimension 2, whereas V(xy) has two codimension-one branches (temkin17 line 71; ilo14 line 7304).

### Dependencies

The statements and routes use Mathlib `AlgebraicGeometry.Scheme.residueField`; Mathlib `ringChar`; Mathlib `Nat.primeFactors`; Mathlib `AlgebraicGeometry.Scheme.Hom.isConstructible_image`; Mathlib `AlgebraicGeometry.IsDominant`; Mathlib `AlgebraicGeometry.IsNoetherian`; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.IsFinite`; TauCetiRoadmap.SchemeAndStackFoundations §§0.9, 0.16–0.21; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.LocalFieldsRamificationPartII GF.0/prime-supported-degree; Mathlib `Algebra.IsSeparable`; Mathlib `AlgebraicGeometry.IsOpenImmersion`; Mathlib `AlgebraicGeometry.IsSeparated`; TauCetiRoadmap.SchemeAndStackFoundations §0.9, noetherian approximation and finite-presentation descent; TauCetiRoadmap.SchemeAndStackFoundations §0.9, finite-type factorization contract; Mathlib `IsRegularLocalRing`; Mathlib `AlgebraicGeometry.Scheme.Hom.residueDegree`; Tau Ceti `TauCeti.AlgebraicGeometry.residueDegree_comp`; TauCetiRoadmap.StableReduction Layer 2; TauCetiRoadmap.StableReduction Layer 4.

## Layer PA.1: Riemann–Zariski spaces of pointed schemes

### 1.1 Pointed schemes and their modifications

A pointed scheme is a morphism ε : Spec K → X with K a field and X quasi-compact and quasi-separated. A morphism (Spec K′ → X′) → (Spec K → X) is a compatible pair j : Spec K′ → Spec K, f : X′ → X; it is a modification if j is an isomorphism and f is proper (not necessarily surjective), and a modification is tight if Spec K → X′ is schematically dominant. The point need not be dominant: char K may differ from the generic characteristic of X.

Work under these precise hypotheses: X quasi-compact and quasi-separated; K any field.

The API records the following facts.

- A field K, a qcqs scheme X and ε : Spec K ⟶ X.
- Pairs (j, f) with ε ∘ j = f ∘ ε′.
- A pointed modification requires j to be an isomorphism and f to be proper.
- Tightness means schematic dominance of Spec K → X′.
- Modifications of a fixed pointed scheme form a cofiltered category.
- Every modification is dominated by a tight one (the schematic image of the point).

One proof route is as follows. Define the category of pointed schemes and the full subcategory of modifications of a fixed ε. Filteredness: two modifications X_1, X_2 of ε are dominated by the schematic image of Spec K in X_1 ×_X X_2, which is again proper over X. Tight modifications are cofinal: any modification is dominated by the schematic image of Spec K in it (a closed subscheme, hence proper over X).

(temkin17, §3.1.1, pp. 112–113; §3.1.5, p. 114 (temkin17 line 645); temkin10, §3.2, arXiv v3 (temkin10 line 679).)

**Checks.**

- The identity of ε is a tight modification when ε is schematically dominant. A non-dominant point need not make its identity tight.
- 𝔾_m → A^1_k with the generic point is not a modification (not proper). A dense open immersion alone does not satisfy properness.
- For ε : Spec F_p → Spec Z at (p), the closed immersion Spec F_p → Spec Z is a tight modification. Pointed modifications need not be surjective onto X.
- Bl_0 A^2_k → A^2_k with the generic point is a tight modification. The exceptional fibre does not change the marked function field.

For X integral and ε the generic point, tight modifications are exactly the modifications of SchemeAndStackFoundations §4.11 that are birational onto their image.

*Needs:* Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.QuasiCompact`; Mathlib `AlgebraicGeometry.QuasiSeparated`; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 1.2 Riemann–Zariski space of a pointed scheme

For a pointed scheme ε : Spec K → X, RZ_K(X) := lim_i X_i, the limit in locally ringed spaces over all modifications X_i → X of ε. Its underlying space is lim |X_i| with projections π_i, its structure sheaf is colim π_i⁻¹ `O_{X_i}`, so `O_{RZ,x}` = colim `O_{X_i,π_i(x)}`. Constructible subsets are the preimages π_i⁻¹(C) of constructible C ⊆ X_i, and they generate the constructible topology.

Work under these precise hypotheses: ε a pointed scheme.

The API records the following facts.

- The locally ringed space lim_i X_i over modifications of ε.
- π_i : RZ_K(X) → X_i, compatible with transition maps.
- `O_{RZ,x}` ≅ colim_i `O_{X_i, π_i(x)}`.
- U ⊆ RZ_K(X) is constructible ⇔ U = π_i⁻¹(C) for some i and constructible C ⊆ X_i.
- A morphism of pointed schemes induces RZ_L(Y) → RZ_K(X) (§PA.1.5).

One proof route is as follows. Index by the cofiltered category of modifications (or the cofinal tight ones). Form the limit of underlying spaces and the colimit of pulled-back structure sheaves; each stalk is a filtered colimit of local rings along local homomorphisms, hence local. Define the constructible topology from constructible subsets of the X_i (Mathlib's constructible topology on spectral spaces).

(temkin17, §3.1.1, pp. 112–113 (temkin17 line 645).)

**Checks.**

- If X is a point Spec K with ε the identity, RZ_K(X) is a single point with stalk K. Valuations must contain all of K, excluding nontrivial valuation rings.
- For X = Spec R, R a DVR with fraction field K and ε generic, RZ_K(X) = Spec R as a locally ringed space (tight modifications of the generic point over Spec R are isomorphisms; arbitrary pointed modifications may have extra components). Extra components in a non-tight modification do not add compatible limit points.
- For X = A^1_k and ε generic, the points of `RZ_{k(t)}(X)` are the valuation rings of k(t) containing k[t]: the trivial one and the local rings at closed points. A valuation at infinity fails the condition t ∈ O.
- For X = A^2_k and ε generic, `RZ_{k(x,y)}(X)` has a point whose stalk is a valuation ring of rank two (value group Z² ordered lexicographically), which is not noetherian; so RZ_K(X) is not a noetherian scheme, unlike every X_i. A noetherian valuation domain has rank at most 1.

For ε dominant with X = Spec A, RZ_K(Spec A) is the Riemann–Zariski space of K over A (§PA.1.8).

*Needs:* §PA.1.1; Mathlib `WithConstructibleTopology`.

### 1.3 Valuative points of a pointed scheme

For a pointed scheme ε : Spec K → X, Val_K(X) is the set of isomorphism classes of morphisms Spec O → X extending ε, where O ⊆ K is a valuation ring of K (with Spec K → Spec O the generic point). By the valuative criterion of separatedness the morphism is determined by O when X is separated.

Work under these precise hypotheses: ε a pointed scheme.

The API records the following facts.

- Pairs (O : ValuationSubring K, g : Spec O ⟶ X) extending ε.
- Forget the centre: Val_K(X) → Val_K.
- Injective when X is separated (valuative criterion of separatedness); no converse for a fixed pointed scheme is asserted.
- If X is proper over Spec A and A ⊆ O, the point extends (valuative criterion of properness).
- The centre g(closed point) ∈ X.

One proof route is as follows. Define Val_K(X) as pairs (O, g) with O a valuation subring of K and g : Spec O → X with g restricted to Spec K equal to ε, modulo isomorphism (O is a subring of K, so isomorphisms are identities). Topologies on Val_K(X) are transported from RZ_K(X) along the bijection of §PA.1.4.

(temkin17, §3.1.2, p. 113 (temkin17 line 663); temkin10, §3.2, arXiv v3 (temkin10 line 742).)

**Checks.**

- For X = Spec Z_(p) and K = Q, Val_Q(X) has two elements: Q and Z_(p). A prime different from p cannot be a closed centre on this localization.
- For X = P^1_k and K = k(t) with ε generic, Val_K(X) is the set of all valuation rings of k(t) containing k. Only valuations containing k are eligible for the fixed generic k-point.
- For K = F_p every valuation ring of K is F_p itself, so Val_K(X) is the set of F_p-points of X lying under ε, a single element. A finite field has no proper valuation subring.
- For the doubled-origin line over k with ε generic, the valuation k[t]_(t) has two centres, so Val_K(X) → Val_K is not injective. The centre must be retained in the data.

For X proper over Spec Z (or separated), Val_K(X) is the set of valuation rings O of K for which ε extends to Spec O.

*Needs:* Mathlib `ValuationSubring`; Mathlib `AlgebraicGeometry.IsSeparated.valuativeCriterion`; §PA.1.1.

### 1.4 Compactness and the valuative description of RZ spaces

Let ε : Spec K → X be a pointed scheme and 𝔛 = RZ_K(X). (i) 𝔛 is compact in the constructible topology and quasi-compact in the Zariski topology. (ii) Every stalk `O_{𝔛,x}` is a valuation ring of K, and x ↦ (Spec `O_{𝔛,x}` → X) is a bijection 𝔛 → Val_K(X).

Work under these precise hypotheses: ε a pointed scheme (X qcqs).

One proof route is as follows. (i) Each X_i is a qcqs scheme, hence a spectral space, compact in its constructible topology (Mathlib compactSpace_withConstructibleTopology); a cofiltered limit of compact Hausdorff spaces along continuous maps is compact; the Zariski topology is coarser. (ii) For f, g ∈ `O_{𝔛,x}`, blowing up the ideal (f, g) on some X_i shows one divides the other in a further modification, so the stalk is a valuation ring (Temkin 2010, Cors. 3.2.4–3.2.5). Bijectivity: given (O, Spec O → X), the valuative criterion of properness (Mathlib IsProper.eq_valuativeCriterion) lifts the centre uniquely to every proper X_i, giving a compatible family of points; injectivity because the stalk determines O.

(temkin17, Lemma 3.1.3 and proof, p. 113 (temkin17 line 667); temkin10, Corollaries 3.2.4–3.2.5, arXiv v3 (temkin10 line 735).)

For X = Spec A and ε dominant this recovers the classical compactness of the Zariski–Riemann space.

*Needs:* §PA.1.2; §PA.1.3; Mathlib `compactSpace_withConstructibleTopology`; Mathlib `AlgebraicGeometry.IsProper.eq_valuativeCriterion`; Mathlib `LocalSubring.exists_le_valuationSubring`.

### 1.5 Functoriality of Riemann–Zariski spaces

A morphism of pointed schemes (j : Spec L → Spec K, f : Y → X) induces ψ : Val_L(Y) → Val_K(X), sending Spec O → Y to the factorisation of Spec O → Y → X through Spec(O ∩ K), and a compatible morphism of locally ringed spaces RZ_L(Y) → RZ_K(X).

Work under these precise hypotheses: (j, f) a morphism of pointed schemes.

The API records the following facts.

- ψ : Val_L(Y) → Val_K(X), (O, g) ↦ (O ∩ K, induced centre).
- ψ is functorial: `ψ_{(j,f)∘(j′,f′)}` = `ψ_{(j,f)}` ∘ `ψ_{(j′,f′)}`.
- ψ of the identity is the identity.
- The limit map RZ_L(Y) → RZ_K(X) corresponds to ψ under the bijections of §PA.1.4.
- This limit map is also continuous for the constructible topologies, without a finite-type hypothesis on f: a basic constructible subset π_i⁻¹(C) pulls back to λ_j⁻¹(g⁻¹(C)) on a tight model Y_j → X_i. Both models are qcqs, so g is qcqs and g⁻¹(C) is constructible (temkin17 §3.1.5 and proof of Lemma 3.1.6, temkin17 lines 686, 717–720).

One proof route is as follows. Restriction: the generic point of Spec O maps into Spec K, so Spec O → X factors through Spec(O ∩ K) by the valuative property of O ∩ K ⊆ K. Limit map: for every modification X_i → X of ε_K there is a tight modification Y_j → Y of ε_L through which Y_j → Y → X factors via Y_j → X_i, uniquely because ε_L is schematically dominant in Y_j and X_i → X is separated; these assemble to RZ_L(Y) → RZ_K(X). Compatibility of the two maps with the bijections of §PA.1.4 follows from the valuative criterion of properness.

(temkin17, §3.1.5, pp. 113–114 (temkin17 line 686).)

**Checks.**

- For L = Q(i), K = Q: the valuation ring Z[i]_(1+i) restricts to Z_(2). The value of 2 is positive on both sides.
- The trivial valuation ring L restricts to K. The direction is L to K.
- For L = Q(i), K = Q, the two valuation rings of L over 5 restrict to the same Z_(5): ψ need not be injective. The fibre has size 2 rather than 1.
- For M/L/K, (O ∩ L) ∩ K = O ∩ K. Both restrictions give the same subring of K.

For L/K a field extension and X = Y = Spec Z, ψ is restriction of valuation rings O ↦ O ∩ K.

*Needs:* §PA.1.2; §PA.1.3; §PA.1.4.

### 1.6 Openness of the restriction map

Let (Spec L → Y) → (Spec K → X) be a morphism of pointed schemes with Y → X of finite type. Then ψ : Val_L(Y) → Val_K(X) is open and continuous for both the Zariski and the constructible topologies; in particular it takes constructible sets to constructible sets.

Work under these precise hypotheses: Y → X of finite type; X, Y qcqs.

One proof route is as follows. Continuity: basic opens (constructibles) pulled back from X_i have preimage pulled back from a tight Y_j mapping to X_i. Openness: reduce to K = k(X_i) by writing K as the union of finitely generated subextensions of K/k(X_i) and choosing modifications with function field K_l; RZ_K(X) = lim_l `RZ_{K_l}(X)`. Flatten Y_j → X_i by a blow-up of X_i (§PA.0.6, using generic flatness, Stacks 052A, over the integral X_i); then f is flat of finite presentation, hence open in both topologies (Mathlib Flat.generalizingMap, isOpenMap_of_generalizingMap, and Chevalley isConstructible_image). Flatness lifts valuations: for O centred at x ∈ X_i and y over x, `O ⊗_{O_{X_i,x}} O_{Y_j,y}` embeds in k(Y_j) after the reduction to k(X_i) = K and flatness; a valuation ring of k(Y_j) dominating a localization over y extends O, and it is prolonged to L (Mathlib `LocalSubring.exists_le_valuationSubring`). Hence ψ(V) = π_i⁻¹(f(V_j)).

(temkin17, Lemma 3.1.6 and proof, pp. 114–115 (temkin17 line 707).)

For L/K finite and X = Y = Spec Z, `ψ_{L/K}` : Val_L → Val_K is open and continuous (Temkin §3.1.7).

*Needs:* §PA.1.5; §PA.1.4; §PA.0.6; Mathlib `AlgebraicGeometry.Flat.generalizingMap`; Mathlib `AlgebraicGeometry.isOpenMap_of_generalizingMap`; Mathlib `AlgebraicGeometry.Scheme.Hom.isConstructible_image`; Mathlib `LocalSubring.exists_le_valuationSubring`.

### 1.7 Absolute Riemann–Zariski spaces and centres

For a field K, Val_K := Val_K(Spec Z) is the set of all valuation rings of K, identified with Tau Ceti's valuation spectrum of K (equivalence classes of valuations); as a topological space it is the Zariski–Riemann space Spv K of ClassicalAdicEtaleCohomology §2.4, the valuation rings of K with the topology generated by the sets {V : a ∈ V}, a ∈ K. For a pointed scheme ε : Spec K → X let Val_K(X)′ ⊆ Val_K be the image of Val_K(X) → Val_K: the valuation rings of K with a centre on X extending ε. For a field extension L/K, `ψ_{L/K}` : Val_L → Val_K is O ↦ O ∩ K. If X is separated, Val_K(X) → Val_K is injective; the converse fails for a fixed pointed scheme.

Work under these precise hypotheses: K a field; ε a pointed scheme for Val_K(X)′.

The API records the following facts.

- Val_K, the type of valuation subrings of K (Mathlib ValuationSubring K).
- Val_K ≃ the points of Tau Ceti's ValuationSpectrum K.
- Val_K(X)′ := {O | ∃ g : Spec O ⟶ X extending ε}.
- `ψ_{L/K}(O)` = O ∩ K, i.e. ValuationSubring.comap along K → L.
- `ψ_{M/K}` = `ψ_{L/K}` ∘ `ψ_{M/L}`.
- Val_K(X)′ is compact in the constructible topology.
- `ψ_{L/K}` is open and continuous (§PA.1.6).
- For L/K algebraic, `ψ_{L/K}` is surjective (Chevalley extension of valuations).

One proof route is as follows. Identify Val_K with the points of Tau Ceti's ValuationSpectrum K of the field (a valuation up to equivalence is determined by its valuation ring), and transport its spectral topology; its patch topology is compact (ValuationSpectrum.compactSpace_patchTopology). Val_K(X)′ is the image of the constructibly compact Val_K(X) (§PA.1.4) under the map of §PA.1.5, continuous in the constructible topology, hence constructibly compact and Zariski quasi-compact. `ψ_{L/K}` is the restriction map of §PA.1.5 for X = Y = Spec Z, so it is continuous and open by §PA.1.6; it agrees with Tau Ceti's ValuationSpectrum.comap along K → L. Injectivity for separated X is the valuative criterion of separatedness.

(temkin17, §3.1.7, p. 115 (temkin17 line 760).)

**Checks.**

- Val_Q = {Q} ∪ {Z_(p) : p prime}. No archimedean absolute value defines a valuation ring.
- `Val_{F_q}` = {F_q}. The space has one point, not zero.
- For X = Spec Z_(p), K = Q, Val_K(X) = {Q, Z_(p)}. The preimage of {V : 1/p ∈ V} under the forgetful map is {Q}, clopen in the two-point constructible topology, although X → Spec Z is not of finite type.
- Val_K(Spec Z)′ = Val_K: every valuation ring contains the image of Z. The prime ring lies in every valuation ring.
- For X = Spec Z[1/p] and K = Q, Val_Q(X)′ = Val_Q ∖ {Z_(p)}. Inverting p removes precisely its nontrivial p-adic valuation.
- `ψ_{Q(i)/Q}` is not injective: Z_(5) has two preimages. At 2 the fibre has size 1 and at 5 it has size 2.

Val_Q consists of Q and the Z_(p); `ψ_{Q(i)/Q}` is surjective with fibres of size 1 or 2.

*Needs:* §PA.1.3; §PA.1.4; §PA.1.5; §PA.1.6; Tau Ceti `TauCeti.ValuationSpectrum`; Tau Ceti `TauCeti.ValuationSpectrum.continuous_comap`; Tau Ceti `TauCeti.ValuationSpectrum.compactSpace_patchTopology`; Mathlib `ValuationSubring`; TauCetiRoadmap.ClassicalAdicEtaleCohomology §2.4, normal models and the Zariski–Riemann limit.

### 1.8 Comparison with the affine Zariski–Riemann limit

For a ring A, a field K and a dominant point ε : Spec K → Spec A (s : A → K with schematically dominant image), the Riemann–Zariski space RZ_K(Spec A) of §PA.1.2 is homeomorphic, compatibly with centres, to the subspace {V ∈ Spv K : s(A) ⊆ V} of the Zariski–Riemann space, presented as the limit of projective integral models (ClassicalAdicEtaleCohomology §2.4). Both are built on Tau Ceti's ValuationSpectrum carrier; no second Zariski–Riemann carrier is introduced.

Work under these precise hypotheses: A a ring; K a field; ε dominant (schematically dominant point).

One proof route is as follows. Projective integral models (X, f, g) with f projective and g dominant are tight modifications of ε, and they are cofinal among all modifications. Since tight modifications are cofinal (§PA.1.1), it suffices to dominate a tight modification X_i → Spec A: X_i is integral, because Spec K → X_i is schematically dominant, so it has one maximal point, and it is proper, hence of finite type and qcqs, over the qcqs Spec A. The non-separated Chow lemma (§PA.0.7) gives a blow-up X′ → X_i along a finitely generated ideal with nowhere dense support such that X′ → Spec A is pseudo-projective; X′ is integral, the point lifts to its generic point, and X′ → Spec A is proper, so it is projective by §PA.0.5 (ilo14 X Remark 3.1.7(ii), ilo14 line 7243). No noetherian hypothesis on A is used; SchemeAndStackFoundations §4.12 `chow_lemma` needs a noetherian base and is not used here. Hence the two limits agree on underlying spaces; under the bijection of §PA.1.4 both correspond to the valuation rings V of K containing s(A).

(temkin17, §3.1.1, pp. 112–113 (temkin17 line 645); temkin10, §3.2, arXiv v3 (temkin10 line 679).)

For A = Z and K = Q both sides are Val_Q.

*Needs:* §PA.0.5; §PA.0.7; §PA.1.1; §PA.1.2; §PA.1.4; §PA.1.7; TauCetiRoadmap.ClassicalAdicEtaleCohomology §2.4, normal models and the Zariski–Riemann limit; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### Examples

For K = Q(i), restriction sends the unique valuation above 2 to Z_(2) and the two valuations above 5 to Z_(5). For the doubled-origin line with generic point k(t), k[t]_(t) has two centres, so the valuative point retains more information than its ring (temkin17 line 663).

### Dependencies

The statements and routes use §PA.0.6; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.QuasiCompact`; Mathlib `AlgebraicGeometry.QuasiSeparated`; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; Mathlib `WithConstructibleTopology`; Mathlib `ValuationSubring`; Mathlib `AlgebraicGeometry.IsSeparated.valuativeCriterion`; Mathlib `compactSpace_withConstructibleTopology`; Mathlib `AlgebraicGeometry.IsProper.eq_valuativeCriterion`; Mathlib `LocalSubring.exists_le_valuationSubring`; Mathlib `AlgebraicGeometry.Flat.generalizingMap`; Mathlib `AlgebraicGeometry.isOpenMap_of_generalizingMap`; Mathlib `AlgebraicGeometry.Scheme.Hom.isConstructible_image`; Tau Ceti `TauCeti.ValuationSpectrum`; Tau Ceti `TauCeti.ValuationSpectrum.continuous_comap`; Tau Ceti `TauCeti.ValuationSpectrum.compactSpace_patchTopology`; TauCetiRoadmap.ClassicalAdicEtaleCohomology §2.4, normal models and the Zariski–Riemann limit; §PA.0.5; §PA.0.7.

## Layer PA.2: Tame distillation for field extensions

### 2.1 Tame, wild and unramified loci

Let L/K be an algebraic extension of fields. For x ∈ Val_L, L/K is x-tame if it is tame (LocalFieldsRamificationPartII GF.2) for the valuation of L given by x and the valuation `ψ_{L/K}(x)` of K. The tame locus is `Val^t_{L/K}` := {x ∈ Val_L : L/K is x-tame}, the wild locus `Val^w_{L/K}` := Val_L ∖ `Val^t_{L/K}`, and the unramified locus `Val^u_{L/K}` is defined in the same way with 'unramified' (GF.2) in place of 'tame'.

Work under these precise hypotheses: L/K algebraic; tameness and unramifiedness in the sense of LocalFieldsRamificationPartII GF.2 (after henselization).

The API records the following facts.

- `Val^t_{L/K}` ⊆ Val_L.
- `Val^w_{L/K}` = the complement of the tame locus.
- `Val^u_{L/K}` ⊆ Val_L.
- `Val^u_{L/K}` ⊆ `Val^t_{L/K}`.
- x ∈ `Val^t_{L/K}` ⇔ (L, O_x)/(K, O_x ∩ K) is tame in the sense of GF.2.
- `Val^t_{K/K}` = Val_K.

One proof route is as follows. Pull back the valued-field notions of GF.2 pointwise along x ↦ (O_x, O_x ∩ K). `Val^u_{L/K}` ⊆ `Val^t_{L/K}`, since unramified extensions are tame.

(temkin17, §3.2.1, p. 115; §3.2.7, p. 116 (temkin17 line 772).)

**Checks.**

- For L = Q(i), K = Q: Z[i]_(1+i) ∈ `Val^w_{L/K}` and Z[i]_(2+i) ∈ `Val^u_{L/K}`. At 2 the ramification index is 2; at 5 it is 1.
- The trivial valuation of L lies in `Val^t_{L/K}` exactly when L/K is separable. An inseparable extension is excluded even when the value groups are trivial.
- For K = F_p(t) and L = K(u) with u^p − u = t⁻¹, the point of Val_L over the t-adic valuation is wild although L/K is separable. The additive valuation of u is −1/p and e = p.
- `Val^t_{K/K}` = Val_K. The local degree is 1 and the wild locus is empty.

If char K = 0 then the residue characteristic of the trivial valuation is 0 and the trivial valuation lies in `Val^t_{L/K}`. For K = Q, L = Q(i), the point Z[i]_(1+i) lies in `Val^w_{L/K}`.

*Needs:* §PA.1.7; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/tame-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/unramified-extension.

### 2.2 S-tameness and P-tameness

Let L/K be algebraic and S ⊆ Val_L. L/K is S-tame if S ⊆ `Val^t_{L/K}`; X-tame for a pointed scheme Spec L → X if it is Val_L(X)′-tame; absolutely tame if `Val^t_{L/K}` = Val_L. For S ⊆ Val_L, char(S) is the set of nonzero residue characteristics of the elements of S. For a set of primes P, L/K is P-tame if `char(Val^w_{L/K})` ∩ P = ∅, and a field K is P-tame if K^a/K is. Separable P-tameness of K asks this for K^s/K.

Work under these precise hypotheses: L/K algebraic; S ⊆ Val_L; P a set of primes.

The API records the following facts.

- S ⊆ the tame locus of L/K.
- Tameness on the valuations of L centred on the pointed scheme X.
- char(S) ⊆ ℕ, the nonzero residue characteristics occurring in S.
- P-tameness means that no wild valuation has residue characteristic in P.
- If char K = 0 or char K ∈ P, L/K is P-tame exactly when it is tame on the valuations centred on Spec `Z_{P′}`.
- X-tameness depends only on the modification class of the pointed scheme.
- S ⊆ S′ and S′-tame ⇒ S-tame.
- If L/K is S-tame and K ⊆ M ⊆ L then M/K is `ψ_{L/M}(S)`-tame (subextensions of tame extensions are tame).

One proof route is as follows. Define the predicates from §PA.2.1. When char K = 0 or char K belongs to P, Spec L has its canonical point over Spec `Z_{P′}`, where primes outside P are inverted; P-tameness then equals tameness for this pointed scheme, since its centred valuations have residue characteristic zero or in P. Without that characteristic hypothesis use only the locus definition, since the required point need not exist. X-tameness is invariant under modifications of the pointed scheme: modifications do not change Val_L(X)′ (valuative criterion of properness).

(temkin17, §3.2.2–3.2.4, p. 116 (temkin17 line 778).)

**Checks.**

- Every algebraic extension is ∅-tame. No residue prime is tested; this condition does not force separability.
- Q(i)/Q is 3-tame and not 2-tame. The residue prime 2 is detected independently of char Q = 0.
- Every L/K is ∅-tame (S = ∅). No valuation is tested.
- char(Val_Q) is the set of all primes. Using char Q = 0 would miss every nontrivial valuation.
- F_p(t)(u)/F_p(t), u^p − u = t⁻¹, is not p-tame. Here v(u) = −1/p and e = p, for p = 2 and p = 3.
- For K = F₂(t), L = K(t^(1/2)) and P = ∅, P-tameness holds vacuously, but Spec L has no map to Spec Q. The pointed-scheme comparison therefore needs its characteristic hypothesis.

At every valuation of residue characteristic zero, every algebraic extension is tame for each prolongation; this is a statement at that valuation, rather than at valuations of other residue characteristics. Q^a/Q is not 2-tame.

*Needs:* §PA.2.1; §PA.1.7; §PA.1.1.

### 2.3 Tame and unramified loci in towers and composita

(i) For a tower of algebraic extensions L/l/k: `Val^t_{L/k}` = `Val^t_{L/l}` ∩ `ψ_{L/l}⁻¹(Val^t_{l/k})`, and the same for unramified loci. (ii) If l/k and K/k are subextensions of L/k with L = Kl, then `ψ_{L/l}⁻¹(Val^t_{l/k})` ⊆ `Val^t_{L/K}` and `ψ_{L/l}⁻¹(Val^u_{l/k})` ⊆ `Val^u_{L/K}`.

Work under these precise hypotheses: All fields inside one algebraic extension.

One proof route is as follows. (i) A valued extension L/k is tame (unramified) iff L/l and l/k are (GF.2/tower-laws). (ii) Tameness and unramifiedness are preserved by base change: if l/k is tame then lK/K is tame (LocalFieldsRamificationPartII GF.2, tame base change).

(temkin17, Lemma 3.2.8 and proof, p. 116 (temkin17 line 803).)

For k = Q, l = Q(i), L = Q(i, √3): the point over 3 lies in `Val^t_{L/k}`, and the point over 2 does not.

*Needs:* §PA.2.1; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/tower-laws; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/tame-extension.

### 2.4 Openness of the tame and unramified loci

For a finite extension L/K, the tame locus `Val^t_{L/K}` and the unramified locus `Val^u_{L/K}` are open subsets of Val_L.

Work under these precise hypotheses: L/K finite.

One proof route is as follows. Unramified locus: for y ∈ Val^u with x = ψ(y), O_y/O_x is essentially étale (GF.2/unramified-etale-criterion), so by Chevalley's local structure theorem (Mathlib `Algebra.IsEtaleAt.exists_isStandardEtale`) O_y is a localization of O_x[t]/(f) with f monic and f′(a) a unit at the image a of t. Replace f by the minimal polynomial g of a over K; since O_x is integrally closed, g ∈ O_x[t] and f = gh in O_x[t], and f′(a) = g′(a)h(a) makes g′(a) a unit. The set V of valuation rings O of L containing the coefficients of g, containing a and with g′(a) ∈ O^× is an open neighbourhood of y. For y′ ∈ V with x′ = ψ(y′): A = `O_{x′}[t, g′(t)⁻¹]/(g)` is étale over `O_{x′}` and embeds in L (g is the minimal polynomial), A is integrally closed and its localizations are valuation rings (Prüfer, GF.1), so `O_{y′}` is a localization of A and `O_{y′}/O_{x′}` is essentially étale. Tame locus: after finite unramified L′/L and K′/K, L′ = `K′(x_1^{1/n_1}, …, x_r^{1/n_r})` with n_i invertible in the residue field; `Val^t_{L′/K′}` contains all valuations of residue characteristic prime to the n_i, an open set; combine with the openness of `Val^u_{K′/K}` (the first part of this target) via §PA.2.3(i), and push down along the open map `ψ_{L′/L}` (§PA.1.6).

(temkin17, Lemma 3.2.10 and proof, p. 117 (temkin17 line 817).)

For L = Q(i), K = Q the tame locus is Val_L minus the single point over 2, which is open.

*Needs:* §PA.2.1; §PA.2.3; §PA.1.6; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/unramified-etale-criterion; TauCetiRoadmap.LocalFieldsRamificationPartII GF.1/normalization-and-prolongations; Mathlib `Algebra.IsEtaleAt.exists_isStandardEtale`.

### 2.5 Tame distillation for finite field extensions

Let L/K be a finite field extension, S ⊆ Val_L compact in the constructible topology, and P := char(S ∩ `Val^w_{L/K}`) the wild primes set of S. Then there are a finite extension L′/L and a tower L′/K′/K with K′/K a P-extension and L′/K′ S′-tame, where S′ := `ψ_{L′/L}⁻¹(S)`. Moreover for any maximal P-extension K̄/K one can take K′ ⊆ K̄ and L′ = LK′.

Work under these precise hypotheses: L/K finite; S ⊆ Val_L constructibly compact.

One proof route is as follows. Fix a maximal P-extension K̄/K (GF.0/maximal-p-extension) and a composite L̄ = LK̄; S̄ := `ψ_{L̄/L}⁻¹(S)` is constructibly compact. L̄/K̄ is S̄-tame: by §PA.2.3(ii) the wild part of S̄ maps into the wild part of S, so its residue characteristics lie in P; but K̄ is P-closed, hence P-tame (LocalFieldsRamificationPartII GF.6, general-tameness and separable-p-closed-tameness), so the wild part of S̄ is empty. For each x ∈ S̄ there is a finite K_x/K inside K̄ with LK_x/K_x tame at x; the tame locus of LK_x/K_x is open (§PA.2.4), so its preimage is an open neighbourhood of x in `Val_{L̄}`. By quasi-compactness of S̄ finitely many `K_{x_1}`, …, `K_{x_n}` suffice; let K′ be their composite and L′ = LK′. §PA.2.3(ii) gives S′ ⊆ `Val^t_{L′/K′}`.

(temkin17, Theorem 3.2.12 and proof, pp. 117–118 (temkin17 line 858).)

If S ⊆ `Val^t_{L/K}` then P = ∅ and one may take K′ = K, L′ = L. For L = Q(i), K = Q and S = Val_L, P = {2}: K′ = Q(i) itself (a 2-extension) and L′ = K′ give L′/K′ trivially tame.

*Needs:* §PA.2.4; §PA.2.3; LocalFieldsRamificationPartII GF.6, general-tameness and separable-p-closed-tameness; §PA.1.7; TauCetiRoadmap.LocalFieldsRamificationPartII GF.0/maximal-p-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.0/p-extensions.

### 2.6 Separable tame distillation for finite separable extensions

Let L/K be finite separable, S ⊆ Val_L constructibly compact and P = char(S ∩ `Val^w_{L/K}`). For any maximal separable P-extension K̄^s/K there is a finite separable P-extension K′/K with K′ ⊆ K̄^s such that L′ = LK′ is S′-tame over K′, S′ = `ψ_{L′/L}⁻¹(S)`. In particular L′/K is separable.

Work under these precise hypotheses: L/K finite separable; S constructibly compact.

One proof route is as follows. A maximal unrestricted P-extension may contain purely inseparable subextensions when char K ∈ P, so §PA.2.5 does not give a separable K′. A maximal separable P-extension K̄^s of K exists by Zorn's lemma inside K^s, as for maximal P-extensions (GF.0/maximal-p-extension), and it is separably P-closed (GF.0/separably-p-closed): a finite separable P-extension of it is a separable P-extension of K. Separable P-closedness of K̄^s is P-closedness of its perfection (GF.2/perfection-tame-tower), and the separable tame tower is unchanged by the purely inseparable base change to the perfection, so L K̄^s/K̄^s is S̄-tame at all points of residue characteristic in P (LocalFieldsRamificationPartII GF.6, general-tameness and separable-p-closed-tameness, separable part). Repeat the compactness argument of §PA.2.5 with finite separable K_x ⊆ K̄^s.

(Derived: separable variant of temkin17 Theorem 3.2.12, pp. 117–118 (temkin17 line 858), with its proof run inside a maximal separable P-extension; it supplies the separable case of temkin17 Theorem 4.2.1, proof Step 4, p. 122 (temkin17 line 1051).)

If char K = 0 the statement coincides with §PA.2.5.

*Needs:* §PA.2.5; LocalFieldsRamificationPartII GF.6, general-tameness and separable-p-closed-tameness; TauCetiRoadmap.LocalFieldsRamificationPartII GF.0/separably-p-closed; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/perfection-tame-tower; TauCetiRoadmap.LocalFieldsRamificationPartII GF.0/maximal-p-extension.

### Examples

For Q(i)/Q and S all valuations, the wild prime set is {2}; K′ = Q(i) and L′ = K′ give relative degree 1. For u^p − u = t⁻¹ over F_p(t), v(u) = −1/p and e = p, for p = 2 as well as p = 3 (temkin17 line 858).

### Dependencies

The statements and routes use §PA.1.1; §PA.1.6; §PA.1.7; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/tame-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/unramified-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/tower-laws; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/unramified-etale-criterion; TauCetiRoadmap.LocalFieldsRamificationPartII GF.1/normalization-and-prolongations; Mathlib `Algebra.IsEtaleAt.exists_isStandardEtale`; TauCetiRoadmap.LocalFieldsRamificationPartII GF.0/maximal-p-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.0/p-extensions; TauCetiRoadmap.LocalFieldsRamificationPartII GF.0/separably-p-closed; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/perfection-tame-tower.

## Layer PA.3: Tame distillation for alterations

### 3.1 Inertia, tame actions and inertia specialization

Let a finite group G act on a scheme X by automorphisms. For x ∈ X the decomposition group D_x is the stabilizer of the point x, and the inertia group G_x ⊆ D_x consists of the g ∈ D_x acting trivially on κ(x). The action is tame if |G_x| is invertible in κ(x) for every x, inertia specializing if G_x ⊆ G_y whenever y specializes x, and admissible if every orbit lies in a G-stable affine open (so that X/G exists by gluing the affine invariant quotients). For H ≤ G the fixed-point subscheme X^H is the simultaneous equalizer of h and the identity, h ∈ H; on a non-separated scheme its immersion need not be closed. EtaleCohomologyFoundations §F.0.A1 `SchemeInertia` gives D_y and I_y for the Galois group acting on Nor_L(X) → X, X normal integral; this target extends them to finite group actions on arbitrary schemes and agrees with them on Nor_L(X).

Work under these precise hypotheses: G finite acting on X by automorphisms (over a base where relevant).

The API records the following facts.

- D_x := stabilizer of x in G.
- G_x := {g ∈ D_x | g acts trivially on κ(x)}.
- Tameness means that each inertia order is nonzero, hence invertible, in its residue field.
- Inertia specialization means G_x ≤ G_y whenever y specializes x.
- If X is noetherian, inertia specializing ⇔ X^H is closed for every H ≤ G.
- Admissibility means that every orbit lies in a G-stable affine open.
- For admissible actions, glue X/G from affine invariant quotients; q : X → X/G is integral and surjective with `O_{X/G}` = (q_* O_X)^G, and is finite when the affine coordinate rings are finite type over their invariant subrings, in particular in the finite-type situations over a noetherian invariant base used here.
- If |G| is invertible on X the action is tame.
- For X normal integral locally noetherian, L/k(X) finite Galois with Nor_L(X) finite and G = Gal(L/k(X)) acting on Nor_L(X), D_y and G_y are `SchemeInertia.decomposition` and `SchemeInertia.inertia` of EtaleCohomologyFoundations §F.0.A1.

One proof route is as follows. Define D_x via Mathlib's `MulAction.stabilizer` for the action on points and G_x as the kernel of D_x → Aut κ(x). For noetherian X, inertia specializing ⇔ every X^H is closed: the equalizer immersions have constructible images, and a constructible specialization-stable subset of a noetherian space is closed. Closed fixed loci imply specialization of inertia on arbitrary X. This is the noetherian form of ILO X 3.1.3; separated X, or X covered by G-stable separated opens, gives an inertia specializing action (X 3.1.4(i)). Admissible actions have quotients: glue the affine invariant quotients (Tau Ceti’s affine invariant quotient modules); for Y projective over a noetherian S this is SchemeAndStackFoundations §1.17 finiteGroupQuotient_projective.

(temkin17, §3.3.2, p. 118 (temkin17 line 889); ilo14, Exposé X, Example 3.1.1, §3.1.2, Lemma 3.1.3 and Remark 3.1.4, arXiv v1 p. 156 (ilo14 line 7160); ilo14, Exposé VI, §3.1, arXiv v1 p. 73 (ilo14 line 3263).)

**Checks.**

- For ±1 on A^2_k, char k ≠ 2: the inertia group at the origin is {±1} and is trivial at every other point. Inertia tests the residue action, not just whether the scheme point is fixed.
- Complex conjugation on Spec Z[i] has inertia of order 2 at the prime (1+i) with residue field F_2: the action is not tame. The scalar 2 equals 0 in that residue field.
- For Spec Z[i] → Spec Z at (1+i), the decomposition and inertia groups of this target and those of EtaleCohomologyFoundations §F.0.A1 coincide: both orders are 2, since (1+i) is the only prime over 2 and its residue field F_2 has trivial automorphism group. At (2+i) both groups are trivial, and at (3) the decomposition group has order 2 and the inertia group order 1.
- The trivial group acts tamely, admissibly and inertia specializingly on every scheme. Every inertia order is 1.
- For char k ≠ 2, Z/2 acting on the plane with doubled origin by y ↦ −y and swapping the origins is not inertia specializing: X^G is not closed (ILO X 3.1.1). The generic point of the fixed axis has inertia 2, while either origin has inertia 1.
- Glue two copies of Spec(∏ₙ F₃) along U = ⋃ₙ D(eₙ), where eₙ is the nth coordinate idempotent, and let C₂ swap the copies. Every prime is maximal, so every specialization is an identity and inertia specializes. Inertia is C₂ on U and trivial off U; the fixed locus is the dense proper open U, hence is not closed. This scheme is not quasi-separated, and the closed-fixed-locus equivalence requires its noetherian hypothesis.
- On two copies of Spec F₃ swapped by C₂, both inertia groups are trivial and the fixed locus is empty, which is closed. The noetherian equivalence has value true on both sides.
- The identity element lies in the decomposition group of every point. Its residue action is also the identity.
- `Gal(F_{p²}/F_p)` acting on Spec `F_{p²}`: the decomposition group of the unique point is the whole group, the inertia group is trivial. The two group orders are 2 and 1, respectively.
- For S₃ acting freely on six disjoint copies of Spec F₂ by left multiplication, the group has order 6 but every inertia group has order 1, so the action is tame. The order of the whole group is not the tame-action test.

±1 acting on A^2_k (char k ≠ 2) has inertia G at the origin and trivial inertia elsewhere; the action is tame. Z/p acting on `A^1_{F_p}` by t ↦ t + 1 has trivial inertia everywhere, while for a ∈ F_p with a ≠ 0 the irreducible closed point t^p − t − a has decomposition group Z/p; Z/2 acting on Spec Z[i] by conjugation has inertia of order 2 at (1+i), so it is not tame.

*Needs:* Mathlib `MulAction.stabilizer`; Mathlib `AlgebraicGeometry.Scheme.residueField`; TauCetiRoadmap.SchemeAndStackFoundations §1.17; Tau Ceti `TauCeti.AffineInvariantQuotient.projection` and its finite-group API; TauCetiRoadmap.EtaleCohomologyFoundations §F.0.A1.

### 3.2 Galois alterations and tame Galois coverings

Let f : Y → X be an alteration of integral schemes and G = Aut_X(Y). f is Galois (de Jong) if Y/G → X is generically radicial, equivalently k(Y)/k(X) is a purely inseparable K/k(X) followed by a Galois k(Y)/K with Aut_X(Y) = Gal(k(Y)/K); separable Galois if moreover f is generically étale. A Galois covering is a finite separable Galois alteration, and it is tame if the action of Aut_X(Y) on Y is tame. ILO X 3.3.1 calls a G-equivariant alteration with trivial action on X, free action on the generic points and η_Y/G ≅ η_X a separable G-alteration.

Work under these precise hypotheses: X, Y integral noetherian; f an alteration.

The API records the following facts.

- The Galois alteration predicate requires a purely inseparable extension followed by a Galois extension with precisely the geometric automorphism group.
- A separable Galois alteration is a Galois alteration which is generically étale.
- A Galois covering is a finite separable Galois alteration.
- A tame Galois covering is one for which the geometric automorphism action is tame.
- For a Galois covering with X normal, Y/Aut_X(Y) → X is an isomorphism.
- For X normal integral noetherian with finite normalizations and L/k(X) finite Galois, Nor_L(X) → X is a Galois covering with group Gal(L/k(X)).
- A Galois covering whose group order is invertible on X is tame.

One proof route is as follows. Define via the function-field factorisation: Mathlib IsPurelyInseparable for K/k(X) and IsGalois for k(Y)/K, with Aut_X(Y) → Gal(k(Y)/K) an isomorphism. For Galois coverings use finiteness and generic étaleness; the quotient Y/G exists (finite morphisms are affine) and Y/G → X is a finite birational map, an isomorphism when X is normal.

(temkin17, §3.3.1, p. 118; §3.3.3, p. 119 (temkin17 line 884); ilo14, Exposé X, §3.3.1 and Remark 3.3.2, arXiv v1 p. 158 (ilo14 line 7288); dejong96, §7, p. 88 (dejong96 line 1447).)

**Checks.**

- Spec Z[i] → Spec Z is a Galois covering with group Z/2 that is not tame (inertia of order 2 at (1+i)). A Galois covering need not be tame.
- Spec Z[1/2, i] → Spec Z[1/2] is a tame Galois covering. Removing the fibre at 2 removes its wild inertia.
- The Frobenius of `A^1_{F_p}` is a Galois alteration (purely inseparable, trivial Galois part) but not a separable Galois alteration. The degrees for p = 2 and p = 3 are 2 and 3 despite automorphism group order 1.
- The identity of X is a tame Galois covering with trivial group. Its degree and inertia order are 1.
- Spec Z[∛2] → Spec Z is a finite separable alteration with Aut = 1 ≠ Gal of a Galois closure; it is not Galois. A nonnormal separable field extension is excluded.

Nor_L(X) → X is a Galois covering for X normal integral and L/k(X) finite Galois (G = Gal(L/k(X))).

*Needs:* §PA.0.3; §PA.3.1; Mathlib `IsGalois`; Mathlib `IsPurelyInseparable`; Mathlib `Algebra.IsSeparable`.

### 3.3 Wild primes set of an alteration

For an alteration f : Y → X of integral noetherian schemes, `P^w_{Y/X}` := `char(Val_{k(Y)}(X)′ ∩ Val^w_{k(Y)/k(X)})`, the residue characteristics of the valuations of k(Y) centred on X at which k(Y)/k(X) is wild. It is contained in char(X), and every element is at most deg f.

Work under these precise hypotheses: f an alteration of integral noetherian schemes (so k(Y)/k(X) is finite).

The API records the following facts.

- `P^w_{Y/X}` ⊆ ℕ.
- `P^w_{Y/X}` ⊆ char(X).
- p ∈ `P^w_{Y/X}` ⇒ p ≤ deg f.
- `P^w_{Y/X}` = ∅ ⇔ k(Y)/k(X) is X-tame.
- P^w is unchanged by modifications of Y and of X.

One proof route is as follows. Define from §PA.1.7 and §PA.2.1. Bound: if k(Y)/k(X) is wild at a point of residue characteristic p, the corresponding factor L_x^h/K^h of k(Y) ⊗ K^h is a henselian extension that is not tame, so its degree is divisible by p (a henselian extension of degree prime to the residue characteristic is tame); as [L_x^h : K^h] ≤ [k(Y) : k(X)], p ≤ deg f. The degree [k(Y) : k(X)] itself need not be divisible by p. And p is a residue characteristic of a valuation centred on X, hence of a point of X.

(temkin17, §3.3.5, p. 120 (temkin17 line 936); temkin17, §3.2.11, p. 117 (temkin17 line 850).)

**Checks.**

- For Spec Z[i] → Spec Z, P^w = {2}. The whole degree is not the definition of the wild set.
- For a modification, P^w = ∅. Its valued function-field extension has degree 1.
- For the Frobenius of `A^1_{F_p}`, P^w = {p} (purely inseparable extensions are wild at the trivial valuation). The trivial valuation already detects inseparability.
- For t ↦ t² on A^1_Q, P^w = ∅ even though the degree is 2: char(A^1_Q) = ∅. Every centred valuation contains Q and has residue characteristic 0.
- For the cubic field defined by T³ − T − 2, the discriminant is −104 and the reduction modulo 2 is T(T+1)². Its local degrees above 2 are 1 and 2, and the quadratic branch is wild; hence the wild prime 2 is at most the global degree 3 but does not divide 3. Replacing the degree bound by divisibility would fail.

Spec Z[i] → Spec Z has P^w = {2}.

*Needs:* §PA.1.7; §PA.2.1; §PA.2.2; §PA.0.3; §PA.0.1.

### 3.4 Tame Galois coverings after modification

Let X be a noetherian universally Japanese integral scheme and L/k(X) a finite Galois extension that is X-tame. Then there is a modification X′ → X such that Nor_L(X′) → X′ is a tame Galois covering.

Work under these precise hypotheses: X noetherian, universally Japanese, integral; L/k(X) finite Galois and X-tame.

One proof route is as follows. For every modification X_i of X, Y_i := Nor_L(X_i) → X_i is a G-Galois covering, G = Gal(L/k(X)) (Mathlib Scheme.Hom.normalization and SchemeAndStackFoundations §0.20). Let T_i ⊆ Y_i be the non-tame locus. T_i is closed: covering Y_i by G-stable affines, T_i = `⋃_{(H,p)}` Y_i^H ∩ Y_i(p) over subgroups H and primes p dividing |H|, a finite union of closed subschemes (§PA.3.1). If every T_j were nonempty, their preimages in RZ_L(Y), Y = Nor_L(X), would be nonempty closed and directed, so by quasi-compactness (§PA.1.4) some y lies over every T_j; the inertia groups at its centres stabilize to G′ with p | |G′|. But L/k(X) is y-tame, so the inertia of Spec O_y has order invertible in k(y) = colim k(y_j), contradicting p | |G′| = |G_y|.

(temkin17, Lemma 3.3.4 and proof, p. 119 (temkin17 line 902).)

If L/k(X) has degree invertible on X, X′ = X works.

*Needs:* Mathlib Scheme.Hom.normalization and SchemeAndStackFoundations §0.20; §PA.3.1; §PA.3.2; §PA.1.4; §PA.2.2.

### 3.5 Galois closures preserve S-tameness

Let L/K be a finite separable extension with Galois closure L′/K, T ⊆ Val_K, S := `ψ_{L/K}⁻¹(T)` and S′ := `ψ_{L′/K}⁻¹(T)`. Then L/K is S-tame if and only if L′/K is S′-tame.

Work under these precise hypotheses: L/K finite separable; L′ a Galois closure.

One proof route is as follows. S′-tame ⇒ S-tame: subextensions of tame extensions are tame. S-tame ⇒ S′-tame: let L_1, …, L_n ⊆ L′ be the K-conjugates of L. For a valuation of L′ in S′, the induced valuation of K lies in T, so for every K-isomorphism L_i ≅ L the induced valuation of L_i corresponds to a point of S; hence each L_i/K is tame there. The composite of tame extensions is tame, and L′ is the composite of the L_i, so L′/K is tame.

(temkin17, Lemma 3.3.7 and proof, p. 120 (temkin17 line 960).)

For K = Q, L = Q(∛2), T = Val_Q ∖ {Z_(2), Z_(3)}: L/K is S-tame and so is its Galois closure Q(∛2, ω).

*Needs:* §PA.2.2; §PA.2.3; Mathlib `IsGalois`.

### 3.6 Tame distillation of alterations

Let X be a noetherian universally Japanese integral scheme, Y → X an alteration and P = `P^w_{Y/X}` its wild primes set. Then there is an alteration Y′ → Y such that the composite Y′ → X factors as a tame Galois covering Y′ → X′ followed by a P-alteration X′ → X.

Work under these precise hypotheses: X noetherian, universally Japanese, integral; Y → X an alteration (Y integral).

One proof route is as follows. Put K = k(X), L = k(Y). Flatten Y → X by a blow-up X₁ → X (SchemeAndStackFoundations flattening_by_blowup); the strict transform is a flat alteration of X₁, hence finite, so Nor_L(X₁) is a modification of Y. Replace X, Y by X₁, Nor_L(X₁): Y = Nor_L(X). Apply tame distillation for fields (§PA.2.5) to L/K and the constructibly compact S = Val_L(X)′ (§PA.1.7): get L′/L and L′/K′/K with K′/K a P-extension and L′/K′ X-tame. X-tameness includes the trivial valuation, so L′/K′ is separable; replace L′ by its Galois closure over K′, still X-tame (§PA.3.5). L′/K′ is `Nor_{K′}(X)`-tame, so §PA.3.4 gives a modification X′ → `Nor_{K′}(X)` with Y′ = `Nor_{L′}(X′)` → X′ a tame Galois covering; X′ → X has degree [K′ : K], a P-number; Y′ → X factors through Y = Nor_L(X).

(temkin17, Theorem 3.3.6 and proof, p. 120 (temkin17 line 939); temkin17, §1.3.4, p. 102 (temkin17 line 219).)

If Y → X is tame (P = ∅) then X′ → X is a modification.

*Needs:* §PA.3.4; §PA.3.5; Mathlib Scheme.Hom.normalization and SchemeAndStackFoundations §0.20; §PA.3.3; §PA.2.5; §PA.1.7; §PA.0.4; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 3.7 Separable tame distillation of alterations

Let X be a noetherian universally Japanese integral scheme, Y → X a separable alteration and P = `P^w_{Y/X}`. Then there is a separable alteration Y′ → Y such that Y′ → X factors as a tame Galois covering Y′ → X′ followed by a separable P-alteration X′ → X.

Work under these precise hypotheses: X noetherian, universally Japanese, integral; Y → X a separable alteration.

One proof route is as follows. As in §PA.3.6, but distil with §PA.2.6 inside a maximal separable P-extension, so K′/K is separable; then X′ → X is a separable P-alteration and Y′ → X is separable. The flattening, Galois-closure and §PA.3.4 steps preserve separability.

(Derived: separable variant of temkin17 Theorem 3.3.6, p. 120 (temkin17 line 939), with its proof run inside a maximal separable P-extension; it supplies the separable case of temkin17 Theorem 4.2.1, proof Step 4, p. 122 (temkin17 line 1051).)

For X over a field of characteristic zero this is §PA.3.6.

*Needs:* §PA.3.6; §PA.2.6; §PA.0.4.

### Examples

For the cover Spec Z[i] → Spec Z, inertia at (1+i) has order 2 and residue characteristic 2. Over Z[1/2] the cover is tame. Frobenius over F₃ has trivial automorphism group and purely inseparable degree 3, so the Galois alteration convention includes it but the Galois covering convention excludes it (temkin17 line 884).

### Dependencies

The statements and routes use §PA.0.1; §PA.0.3; §PA.0.4; §PA.1.4; §PA.1.7; §PA.2.1; §PA.2.2; §PA.2.3; §PA.2.5; §PA.2.6; Mathlib `MulAction.stabilizer`; Mathlib `AlgebraicGeometry.Scheme.residueField`; TauCetiRoadmap.SchemeAndStackFoundations §1.17; Tau Ceti `TauCeti.AffineInvariantQuotient.projection` and its finite-group API; Mathlib `IsGalois`; Mathlib `IsPurelyInseparable`; Mathlib `Algebra.IsSeparable`; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.EtaleCohomologyFoundations §F.0.A1.

## Layer PA.4: Log regular pairs and functorial modifications

### 4.1 Log regular pairs

A pair (X, Z), X a reduced locally noetherian scheme and Z ⊆ X closed with complement j : U → X, is log regular if Z is nowhere dense and the log structure `M_{(X,Z)}` := O_X ∩ j_*O_U^× associated with Z (the log structure of a closed subset, requested from CrystallineCohomology CR.5:log-algebra.4 as gap:closed-subset-log-structure) is fine and saturated, the fs log scheme (X, `M_{(X,Z)}`) is log regular (CR.5:log-algebra.4, Log regular schemes), and Z is exactly the complement of the triviality locus of `M_{(X,Z)}`. Construct this boundary log structure only after verifying that Z is nowhere dense. Conversely every log regular fs log scheme is of this form, with U its dense triviality locus (ILO VI §1.4).

Work under these precise hypotheses: X reduced locally noetherian; Z closed.

The API records the following facts.

- The log regular pair predicate requires `M_{(X,Z)}` fs, logarithmic regularity and Z exactly its nontriviality locus.
- X regular and Z an snc support ⇒ (X, Z) log regular.
- (X, ∅) is log regular ⇔ X is regular.
- If (X, Z) is log regular then X ∖ Z is dense and X is normal.
- A log regular fs log scheme (X, M) is (X, `M_{(X,Z)}`) for Z the non-triviality locus of M.
- The rank stratification X(i) by rank M̄^gp consists of regular locally closed subschemes of codimension i.

One proof route is as follows. Build `M_{(X,Z)}` as an étale log structure of CrystallineCohomology CR.5:log-algebra.1 through gap:closed-subset-log-structure; for X regular and Z = |D| with D strict normal crossings, `M_{(X,Z)}` and the divisorial log structure M_D of CR.5:log-algebra.4 (Divisorial log structures) are the same subsheaf O_X ∩ j_*O_U^× of O_X by that section's definition of M_D, since U = X ∖ D, so `M_{(X,Z)}` has the étale-local charts N^s supplied there. Recovery: if (X, M) is a log regular fs log scheme with triviality locus j : U → X, then U is dense and M = O_X ∩ j_*O_U^× inside O_X, so (X, M) is the log scheme of the pair (X, X ∖ U) (ilo14 VI §1.4, ilo14 line 3070, after Nizioł). Log regularity is CR.5's definition at geometric points: O_x/I_x regular and dim O_x = dim O_x/I_x + rank M̄_x^gp. If X is regular and Z an snc support, (X, Z) is log regular; if (X, ∅) is log regular then X is regular (CrystallineCohomology CR.5:log-algebra.4, Log regular schemes, the trivial-log-structure clause of its API).

(ilo14, Exposé VI, §§1.2–1.4, arXiv v1 p. 69 (ilo14 line 3050); ilo14, Exposé X, §3.2.1, arXiv v1 p. 158 (ilo14 line 7271); temkin17, §1.2.7, pp. 99–100 (temkin17 line 119).)

**Checks.**

- (A^2_k, V(xy)) is log regular, with M̄ ≅ N² at the origin. The dimension formula is 2 = 0 + 2.
- For X = Spec F₂ and Z = X, the nowhere-dense condition is false. No boundary log structure is requested from the supplier at this input; the pair is not log regular.
- (X, ∅) is log regular for X regular, e.g. (Spec Z, ∅). The rank term is 0.
- (Spec k[x², x³], {x = 0}) is not log regular, over any field k: the boundary log structure is not fine. Its stalk at the geometric point over the origin is computed in the strict local ring, whose residue field is the separable closure k^s, an infinite field; the classes of x² + a x³ with a ∈ k^s are infinitely many indecomposable elements of the characteristic monoid. A boundary does not automatically give an fs chart.
- Over F₂ the Zariski local ring of the cusp at the origin gives the monoid of nonzero elements modulo units {0} ∪ {(n, a) : n ≥ 2, a ∈ F₂}, with (n, a) the class of xⁿ(1 + a x), generated by the classes of x², x² + x³, x³ and x³ + x⁴: finitely generated, but not saturated, since the class of x lies in its group and twice it is the class of x². A Zariski-site definition would call this boundary structure fine; on the étale site of the Conventions the residue field becomes F̄₂ and fineness fails as in the previous Check.
- For Y = Spec k[u, v, w]/(uw − v²), the quotient of A^2_k by ±1 with u = x², v = xy, w = y² (char k ≠ 2), the pair (Y, V(v)) is log regular although Y is singular at the vertex; V(v) is the image of the axes V(xy). At the vertex the log dimension formula is 2 = 0 + 2, while the embedding dimension is 3.
- (A^2_k, {0}) is not log regular: the non-triviality locus of a log regular structure has pure codimension one. The point has codimension 2.

For the cusp over an infinite field k the classes of x² + a x³, a ∈ k, already give infinitely many indecomposable boundary sections modulo units in the Zariski stalk; over every field the étale stalk does, so the boundary log structure is not fine. The cusp also fails log regularity because log regular schemes are normal (temkin17 §1.2.7, temkin17 line 126; ilo14 VI §1.6).

*Needs:* TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Étale log structures); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Divisorial log structures); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Log regular schemes); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Saturated monoids); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Fine monoids); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (gap:closed-subset-log-structure); §PA.0.8.

### 4.2 Normalized blow-ups of monoidal ideals

For a log regular fs scheme (X, M), prove that log ideals I ⊆ M correspond bijectively to the ideals I O_X they generate. Identify the underlying schemes of the supplied fine log blow-up and saturated log blow-up with `Bl_{I O_X}(X)` and its normalization, respectively, compatibly with strict morphisms of log regular fs schemes. The source and target of both comparison isomorphisms are over X.

Work under these precise hypotheses: (X, M) log regular fs and I a coherent log ideal; strict comparison maps have log regular fs source and target. Projectivity additionally assumes X quasi-excellent noetherian. The modification conclusion further requires I to have a nonempty stalk at every geometric point; equivalently in this coherent log regular setting, I O_X is the unit ideal at every generic point. Global nonemptiness alone does not suffice on a disconnected X.

The API records the following facts.

- For (X, M) log regular fs: the underlying scheme of the saturated log blow-up I is `Bl_{I O_X}(X)^{nor}`.
- For strict f, the (saturated) log blow-up of f⁻¹I is the pullback of that of I.
- Saturated log blow-ups of log regular fs log schemes are log regular and log étale over the base.
- If X is quasi-excellent and noetherian, the normalized blow-up is projective because normalization is finite. If also every geometric stalk of I is nonempty, it is a modification, since the centre misses every generic point.

One proof route is as follows. Use the log blow-up and saturation of LefschetzPencilsAndVanishingCycles §0.10 and the shared chart and fs-fibre-product carriers of CrystallineCohomology CR.5:log-algebra.1–2 (Log charts, Log fiber products). On a chart P, compare the Rees algebra of the monoidal ideal with its pullback to O_X; logarithmic regularity gives the required Tor vanishing (ILO VIII Lemma 3.4.6). For quasi-excellent noetherian X, normalization is finite, so the resulting morphism is projective. If every geometric stalk of I is nonempty, its ordinary ideal is the unit ideal at every generic point: nonempty monoidal generators become units there. Coherence makes the unit-ideal locus open, and it is dense on every component. The blow-up and its normalization are isomorphisms there, giving a projective modification. An empty stalk instead deletes its component locally and cannot be allowed in this conclusion (ilo14 VIII §3.1.19, p. 101, ilo14 line 4451).

(ilo14, Exposé VIII, §§3.3.7–3.3.11, arXiv v1 pp. 107–108 (ilo14 line 4761); ilo14, Exposé VIII, Lemma 3.4.3, §3.4.5 and Lemma 3.4.6, arXiv v1 pp. 110–111 (ilo14 line 4910).)

**Checks.**

- For (A^2_k, V(xy)) and the ideal (x, y) of N², the log blow-up is Bl_0 A^2 with the divisorial log structure of the total transform. In the x-chart, y = xv and the boundary is xv = 0.
- The log blow-up of the unit ideal M is the identity. The unit ideal is already invertible; its generic degree is 1.
- On Spec F₂ with trivial log structure and I empty, I O_X = 0 and the Rees algebra has zero positive-degree part. Its Proj and normalization are empty, so the map to Spec F₂ is projective but not a modification. Coherence does not exclude the empty ideal.
- On the disjoint union of two copies of Spec F₂, take I empty on the first and the unit log ideal on the second. The blow-up retains only the second point. I is nonempty on one component but has empty stalks on the other; there is no dense open of X on which this map is an isomorphism.
- The log blow-up of an invertible log ideal is the identity. Universality gives the identity on both sides.
- For the A_1 monoid P ⊂ Z² generated by (2,0), (1,1), (0,2) (Spec k[P] = Spec k[u, v, w]/(uw − v²)) and the ideal of P generated by (2,0) and (0,2), the unsaturated log blow-up, which is the ordinary blow-up along (u, w), has the non-normal chart Spec k[u, v, s]/(v² − u²s) with s = w/u; its saturation adjoins v/u and is the normalized blow-up, with regular chart Spec k[u, v/u]. The integral element v/u is absent from the ordinary blow-up chart and present in its normalization. The ideal has nonempty stalks everywhere; the ordinary chart and its normalization both have fraction field k(u,v), so the normalized map has generic degree 1.

For (A^2_k, V(xy)) and I the maximal ideal of N², the log blow-up is the blow-up of the origin with its divisorial log structure.

*Needs:* §PA.4.1; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Log charts); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Saturated monoids); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.2 (Log fiber products); TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.LefschetzPencilsAndVanishingCycles §0.10; TauCetiRoadmap.StableReduction Layer 4.

### 4.3 Functorial saturated monoidal desingularization

There is a saturated monoidal desingularization functor F̃^log: to every log regular fs log scheme (X, M) (more generally every monoidally torsion-free fine log scheme) it assigns a tower of saturated log blow-ups X′ → X, finite on quasi-compact sources, after which every stalk of M̄ is free; for a log regular source, X′ is regular and its non-triviality locus is a normal crossings divisor (snc when the log structure is Zariski). It is functorial for monoidally smooth morphisms: for monoidally smooth φ : Y → X, F̃^log(Y) is the contraction, deleting empty blow-up steps, of the induced pullback of the saturated log blow-up tower F̃^log(X) along φ, using fs fibre products on fs log schemes. The same contraction rule applies to strict morphisms; strictness alone does not ensure that all centres are met. For a log regular fs source whose underlying scheme X is quasi-excellent noetherian, the underlying morphism X′ → X is a projective modification. For a monoidally torsion-free fine log scheme that is not log regular, only the saturated monoidal tower and its functoriality are asserted: its underlying morphism need not be a modification, nor even birational. On arbitrary log regular schemes retain the normalized tower and its functoriality, without inferring finite normalization. For a non-quasi-compact fine log scheme the tower is locally finite; a quasi-compact source has a finite tower. Freeness of characteristic monoids implies underlying regularity only under the log-regular hypothesis, not for arbitrary fine log schemes.

Work under these precise hypotheses: (X, M) log regular fs, or a fine log scheme whose characteristic groups are torsion free. A log morphism f : (Y, N) → (X, M) is monoidally smooth if, for every geometric y of Y over x of X, the characteristic map M̄_x → N̄_y extends to an isomorphism M̄_x ⊕ ℕ^r ≅ N̄_y for some nonnegative integer r, with the given map the first-factor inclusion (ilo14 VIII §3.3.14, p. 109, ilo14 line 4847).

The API for monoidally smooth morphisms records the following facts.

- The identity is monoidally smooth with r = 0; composites are monoidally smooth, since two successive free-factor inclusions add their numbers of generators.
- Every strict log morphism is monoidally smooth with r = 0. No smoothness of its underlying scheme morphism is required.
- The criterion is stalkwise at geometric points and invariant under isomorphisms of the source and target log schemes: it asks for a splitting that identifies the actual characteristic map with the first-factor inclusion, not merely an abstract isomorphism between its source and a factor of its target.

One proof route is as follows. Consume ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6, strong non-embedded resolution and functoriality for all regular morphisms, on reduced noetherian quasi-excellent Q-schemes. Restrict the supplied tower to toric Q-schemes and normalize it; regular-functoriality gives the compatibility used to construct functorial saturated desingularization of fine torsion-free fans (ILO VIII §§2.3 and 3.1–3.2). Descend to log schemes with fan charts by pullback, uniquely and functorially for monoidally smooth morphisms (VIII 3.3.15). The fan blow-up centres have nonempty stalks, and their pullbacks retain this property (ilo14 VIII §3.1.19, ilo14 line 4451). For log regular log schemes the tower is a normalized blow-up tower of X (§PA.4.2), giving the desingularization F̃ with the stated functoriality (VIII 3.4.9); M̄ free means X regular with normal crossings boundary (VIII 3.4.4, VI 1.7).

(ilo14, Exposé VIII, Theorem 3.3.15, arXiv v1 p. 109 (ilo14 line 4849); ilo14, Exposé VIII, §3.4.8 and Theorem 3.4.9, arXiv v1 p. 111 (ilo14 line 4967); temkin17, proof of Theorem 4.2.1, Step 10, p. 123; Remark 4.3.4, p. 124 (temkin17 line 1074).)

**Checks.**

- The strict closed immersion Spec k → A¹_k at the origin with trivial logs has characteristic map 0 → 0 and group cokernel 0 at its source point. It is monoidally smooth with r = 0, although its underlying morphism is not smooth.
- The projection (A²_k, V(xy)) → (A¹_k, V(t)), t ↦ x, has at the origin the characteristic inclusion ℕ → ℕ², 1 ↦ (1,0), with group cokernel ℤ and r = 1. Along x = 0 away from the origin it is ℕ → ℕ, the identity; along y = 0 with x ≠ 0 it is 0 → ℕ; elsewhere it is 0 → 0. All stalks satisfy the criterion, although the map is not strict.
- Over a field of characteristic 3, the square map of (A¹_k, V(t)) has at the origin characteristic map ℕ → ℕ, 1 ↦ 2, and group cokernel ℤ/2. It is Kummer étale, since 2 is invertible in k, but not monoidally smooth: equal ranks force r = 0 and multiplication by 2 is not an isomorphism.
- For the strict open immersion of the torus into (Spec k[u,v,w]/(uw−v²), V(v)), the vertex resolution has empty pulled-back centre: its log ideal becomes the unit ideal. Contracting that step gives the identity tower on the torus; strictness does not prevent empty steps. Over Q this also tests the supplied characteristic-zero tower: the cone has a singular vertex and the torus has none.
- With trivial characteristic monoid, the singular cusp remains singular under every monoidal blow-up. Freeness alone gives regularity only for a log regular source.
- For the log point Spec Q with chart P = ⟨(2,0), (1,1), (0,2)⟩, the A₁ monoid, every nonzero element of P mapping to 0: P is fine, saturated and sharp with torsion-free group ℤ², so the log point is monoidally torsion-free; it is not log regular, since dim O = 0 while dim O/I + rank P^gp = 0 + 2. The chart is strict at the vertex of Spec Q[P], so the saturated monoidal tower is the pullback along Spec Q → Spec Q[P] of the vertex blow-up of §PA.4.2: its underlying scheme is the exceptional P¹_Q, with free characteristic stalks ℕ² at the two points where the exceptional curve meets the strict transforms of the toric boundary and ℕ elsewhere, so the tower has length one. The morphism P¹_Q → Spec Q is not a modification. The geometric conclusion needs log regularity; the monoidal conclusion does not.

For X regular with snc boundary, F̃^log(X) is the identity. For the log regular pair (Spec k[u, v, w]/(uw − v²), V(v)), F̃^log is the toric resolution given by subdividing the cone of the A_1 singularity, whose underlying morphism is the blow-up of the vertex. (ILO VIII 1.2(b) identifies the log blow-up of the vertex with the canonical resolution of this toric singularity.)

*Needs:* TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6; §PA.4.2; §PA.4.1; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Log charts); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Saturated monoids); TauCetiRoadmap.LefschetzPencilsAndVanishingCycles §0.10.

### 4.4 Gabber modification for inertia specializing actions

Extend the Gabber modification of LefschetzPencilsAndVanishingCycles §0.10 from separated schemes to a noetherian quasi-excellent log regular fs scheme X with a finite, tame, generically free, inertia specializing G-action. With Z the logarithmic boundary and T the nonfree locus, construct a G-equivariant projective modification h : X′ → X with X′ log regular, boundary h⁻¹(Z ∪ T), and very tame action. Require compatibility under the localizations used to glue the modification; the map h itself need not be log smooth.

Work under these precise hypotheses: X noetherian, quasi-excellent, log regular fs; G finite, tame, generically free and inertia specializing.

One proof route is as follows. Use the separated modification of LefschetzPencilsAndVanishingCycles §0.10 and its functoriality for strict inert morphisms, gap:very-tame-local-quotient, in the instances of G-stable opens, local schemes at points and strict localizations. The ILO X Theorem 3.1.5(i) proof checks the construction at local schemes, compatibility under specialization, descent of the resulting normalized blow-up tower, and a uniform normalization bound. Each specialization uses precisely the inclusion of inertia groups; this replaces separatedness.

(ilo14, Exposé VIII, Theorem 1.1, arXiv v1 p. 85; proof §§4–5, pp. 116–130 (ilo14 line 3681); ilo14, Exposé X, Theorem 3.1.5(i), arXiv v1 p. 156 (ilo14 line 7194); ilo14, Exposé VIII, §1.2, arXiv v1 p. 86 (ilo14 line 3705).)

For ±1 on (A^2_k, ∅), k algebraically closed of characteristic ≠ 2: the blow-up f : X′ → A^2_k of the origin satisfies all the conclusions, with (X′, Z′) log regular for Z′ the exceptional line and the action very tame. The morphism f is not log smooth (its fibre over the origin is Z′ with the log structure of N sending 1 to 0), although (X′, Z′) is log smooth over k (ILO VIII 1.2(a)).

*Needs:* §PA.4.3; LefschetzPencilsAndVanishingCycles §0.10, very tame quotients; LefschetzPencilsAndVanishingCycles §0.10, logarithmic actions; §PA.4.1; §PA.3.1; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.LefschetzPencilsAndVanishingCycles §0.10.

### 4.5 Gabber's preparation lemma for equivariant log smooth maps

Let f : X → Y be a G-equivariant log smooth map of fine log schemes, x a geometric point with image y, G the inertia group at x of order invertible on Y, acting trivially on M̄_x and M̄_y. Put N = exponent(G), let μ_N be the group of complex N-th roots of unity, and put Λ = Z[1/N, μ_N]. Let a : Y → Spec Λ[Q] be an equivariant chart at y modelled on χ : G^ab ⊗ Q^gp → μ_N, with Q fine. Then, étale-locally at x, a extends to an equivariant chart b : X → Spec Λ[P] with Q^gp → P^gp injective, torsion of the cokernel annihilated by an integer invertible on X, `X → Y ×_{Spec Λ[Q]} Spec Λ[P]` smooth, and after shrinking an equivariant étale map X → `(Y ×_{Λ[Q]} Λ[P])` ×_Λ Spec Sym_Λ(V) for a finitely generated projective Λ[G]-module V. If X, Y and Q are fs with Q sharp, P may be chosen fs with P^× torsion free.

Work under these precise hypotheses: G finite of order invertible on Y; f equivariant log smooth between fine log schemes; equivariant chart at y.

One proof route is as follows. Decompose `k(x) ⊗ Ω¹_{X/Y,x}` = V₀ ⊕ (k(x) ⊗ `M̄^gp_{X/Y,x}`) G-equivariantly (tameness), lift a basis of the second summand to elements t_i of M_x^gp with characters ψ_i. Build F as the push-out making the m-th powers of generators of M̄_x^gp land in Z ⊕ Q^gp (m invertible), set P := v⁻¹(M_x); Kato's chart extension gives b, and the Jacobian criterion (the chart Jacobian argument in ilo14, proof of Proposition X 1.2) shows smoothness of the strict map b′. Lift V₀ to a projective Λ[G]-module (the equivariant lifting in that same proof) to get the étale map to the polynomial factor; saturate and split off the torsion of P^× for the fs refinement.

(ilo14, Exposé X, Proposition 1.2 and proof, arXiv v1 pp. 136–139 (ilo14 line 6149).)

For G = 1, Y = Spec k with trivial log structure and X regular, assume the étale fs log structure is the divisorial structure of its reduced boundary D. Log smoothness then gives smoothness of X/k and a relative normal crossings boundary. If D is strict normal crossings on X, the conclusion is relative strict normal crossings, as in §PA.4.8 (ilo14 X §2.3 Step 3, pp. 151–152, ilo14 lines 6965–6970).

**Checks.**

- For G = C₃, N = 3 and Λ = Z[1/3,ζ₃]; for G = 1, N = 1 and Λ = Z.
- For G = C₂ × C₂ the exponent is 2, not its order 4, so Λ = Z[1/2]. No fourth roots of unity are required by the coefficient convention.
- In A²_C, D : y² = x²(x+1) is an irreducible node. Its divisorial étale fs structure is log smooth, but at (0,0) its local dimension is 1 and tangent dimension 2. It is a relative normal crossings boundary and is not strict normal crossings.
- The coordinate axes on A²_C have two regular components and intersection codimension 2. Their characteristic monoid at the origin is ℕ², and they satisfy the relative strict version.
- With empty boundary on A¹_k the characteristic monoid is 0 and the underlying map is smooth of relative dimension 1; no boundary component is created by the chart criterion.

*Needs:* TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Log smooth morphisms); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Kato chart criterion); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Log charts); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Saturated monoids); LefschetzPencilsAndVanishingCycles §0.10, logarithmic actions.

### 4.6 The relative Gabber modification without separatedness

For a G-equivariant log smooth map f : (X, Z) → (S, W) of noetherian quasi-excellent log regular fs pairs, with G finite and trivial on S and its action on X tame, generically free and inertia specializing, extend the relative Gabber modification of LefschetzPencilsAndVanishingCycles §0.10 to this non-separated setting. Construct a G-equivariant projective h : X′ → X, with Z′ = h⁻¹(Z ∪ T) for the nonfree locus T, such that X′ is log regular, G acts very tamely, and (X′, Z′) → (S, W) is log smooth; when G acts admissibly, its quotient pair is log smooth over (S, W).

Work under these precise hypotheses: G finite, trivial on S; X, S noetherian, qe, log regular; f log smooth; G tame and generically free on X; G-action separated or inertia specializing.

One proof route is as follows. Use the absolute extension and the preparation lemma. The separated relative theorem is supplied by LefschetzPencilsAndVanishingCycles §0.10; its log smoothness checks are local on X and extend to the inertia specializing tower (ILO X Theorem 3.1.5(ii)). For the quotient statement, the quotient map X′ → X′/G is a surjective Kummer étale cover (LefschetzPencilsAndVanishingCycles §0.10, very tame quotients) and (X′, Z′) → (S, W) is log smooth, so descent of log smoothness along a surjective Kummer étale morphism of the source, gap:kummer-etale-source-descent (ILO X Theorem 1.11), gives that (X′/G, Z′/G) → (S, W) is log smooth.

(ilo14, Exposé X, Theorem 1.1, arXiv v1 pp. 135–136; proof §§1.3–1.8, pp. 139–148 (ilo14 line 6117); ilo14, Exposé X, Theorem 1.11, p. 148; Theorem 3.1.5(ii), p. 156 (ilo14 line 6778); temkin17, §1.3.5, p. 102; proof of Theorem 4.2.1, Step 10, p. 123 (temkin17 line 221).)

For S = Spec k with trivial log structure and X smooth over k with snc Z, the conclusion gives a very tame model whose quotient is log smooth over k, the input to Gabber's ℓ′ theorem over a field.

*Needs:* §PA.4.4; §PA.4.5; LefschetzPencilsAndVanishingCycles §0.10, very tame quotients; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Log smooth morphisms); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Kummer étale morphisms); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (gap:kummer-etale-source-descent); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Log smoothness over log regular schemes); TauCetiRoadmap.LefschetzPencilsAndVanishingCycles §0.10.

### 4.7 Log smoothness for intermediate boundaries

Let X and S be regular, W ⊆ S and Z ⊆ X snc supports, and f : X → S with f⁻¹(W) ⊆ Z such that (X, Z) → (S, W) is log smooth. Then for every snc support Z′ with f⁻¹(W) ⊆ Z′ ⊆ Z that is a union of components of Z, (X, Z′) → (S, W) is log smooth.

Work under these precise hypotheses: X, S regular; Z, W snc supports; f⁻¹(W) ⊆ Z′ ⊆ Z, Z′ a union of components of Z.

One proof route is as follows. Work étale-locally at a geometric point; take the chart N^r of (S, W) and by Gabber's preparation lemma (G = 1) an fs chart Q → P of f with X → `S ×_{Z[Q]} Z[P]` smooth, P^× torsion free, torsion of Coker φ^gp killed by n invertible. Localize P so that P ≅ N^t ⊕ Z^u with the N^t factor given by the branches of Z; the image of Q lands in the factor P′ of the branches of Z′ (since f⁻¹(W) ⊆ Z′). Spec Z[P] → Spec Z[P′ ⊕ P^×] is smooth, so the chart φ′ : Q → P′ ⊕ P^× satisfies Kato's criterion (CR.5:log-algebra.3, Kato chart criterion).

(ilo14, Exposé X, Lemma 3.5.2 and proof, arXiv v1 p. 165 (ilo14 line 7655).)

Taking Z′ = Z recovers the hypothesis; Z′ = f⁻¹(W) gives the minimal boundary when that support is itself a union of components of Z and is snc.

*Needs:* §PA.4.5; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Kato chart criterion); §PA.0.8.

### 4.8 Local forms of log smooth maps to points and traits

Let f : (X̃, Ẽ) → (S′, W′) be log smooth with X̃ regular and Ẽ an snc support. (i) If S′ = Spec k′ is a field with W′ = ∅, then X̃ is smooth over k′ and Ẽ is a relative strict normal crossings divisor. (ii) If S′ is a regular one-dimensional scheme and W′ = Σ a finite set of closed points with Ẽ ⊇ f⁻¹(Σ), then outside Σ, X̃ → S′ is smooth with Ẽ a relative normal crossings divisor, and étale-locally at a point over s′ ∈ Σ the pair (X̃, Ẽ) is (`S′[u_1^{±1}, …, u_s^{±1}, t_1, …, t_n]/(u^b t^a − π)`, V(t_1 ⋯ t_m)), 1 ≤ r ≤ m ≤ n, with gcd(p, a_1, …, a_r, b_1, …, b_s) = 1 for p the characteristic exponent of k(s′) and π a uniformizer. Here t₁,…,t_r cut out the reduced special fibre, and `V(t_{r+1} ⋯ t_m)` is only the horizontal boundary; an empty product is 1. The a_i are positive, the unit exponents b_j are integers, and the invertibility condition concerns the torsion of the chart cokernel.

Work under these precise hypotheses: f log smooth; X̃ regular; Ẽ snc; base a field or a regular one-dimensional scheme.

One proof route is as follows. Apply Gabber's preparation lemma with G = 1: (i) Q = {1}, P^× torsion free, gives X̃ étale over an affine space times Spec Λ[P] with P free on the branches, i.e. smooth with relative snc boundary. (ii) Q = N with 1 ↦ π, and P = P^× ⊕ P₁ with P^× free abelian and P₁ ≅ N^m (the branches of Ẽ through the point); the image of 1 in P gives the exponents (b_j) on the unit coordinates and (a_i) on the branches, the invertibility of the torsion of Coker(Z → P^gp) gives gcd(p, a, b) = 1, and the horizontal part of Ẽ is cut out by further coordinates t_j. The unit part has exponent group ℤ^ν and the branch part monoid ℕ^μ, as in Conventions; ilo14 X §2.6, Step 3, states these two ranks inconsistently.

(ilo14, Exposé X, Step 3 of §2.3, arXiv v1 p. 152; end of §2.6, pp. 154–155; §3.5.3, pp. 165–166 (ilo14 line 6965).)

**Checks.**

- For xy = π over a trait, the total boundary is V(xy), the horizontal boundary is empty, and the chart is ℕ → ℕ², 1 ↦ (1,1), with cokernel ℤ. Deleting the vertical branches would give the wrong source log structure.
- For a trait in residue characteristic p and the unit-coordinate chart π = u t^p, the exponents are (p,1), so the cokernel has no torsion and the log morphism is smooth despite p dividing the vertical exponent. A condition using only gcd(p,a_i) would fail.

For X̃ = Spec Z_p[x, y]/(xy − p) over Spec Z_p with Ẽ the special fibre, the local form has a_1 = a_2 = 1.

*Needs:* §PA.4.5; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Kato chart criterion).

### Examples

For the sign action on A² with axes boundary, the invariant ring is k[u,v,w]/(uw−v²); its closed log stratum has dimension 0 and characteristic rank 2. Blowing up the vertex resolves the underlying surface. On a trait chart xy = π, the total boundary has both x and y branches and the chart cokernel is ℤ (ilo14 lines 3681, 4910 and 6985).

### Dependencies

The statements and routes use TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6; §PA.0.8; §PA.3.1; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Étale log structures); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Divisorial log structures); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Log regular schemes); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Saturated monoids); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Fine monoids); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (gap:closed-subset-log-structure); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.1 (Log charts); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.2 (Log fiber products); TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Log smooth morphisms); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Kato chart criterion); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Kummer étale morphisms); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (gap:kummer-etale-source-descent); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Log smoothness over log regular schemes); TauCetiRoadmap.StableReduction Layer 4.

## Layer PA.5: Stable modification and resolution of relative curves

### 5.1 Multipointed curves and their stable modifications

Let S be a scheme. A multipointed S-curve (C, D) is a pair of flat finitely presented morphisms C → S and D → S of pure relative dimensions one and zero with a closed immersion D → C over S; C need not be proper or separated over S. It is semistable if C → S is flat with geometric fibres having at most ordinary double points, D → S is étale and D misses the non-smooth locus of C → S. A modification (C′, D′) → (C, D) is a pair of modifications (proper, isomorphisms on schematically dense opens); it is semistable if (C′, D′) is, and stable if moreover no geometric fibre C′_s has an exceptional component (a P^1 meeting D′_s ∪ `(C′_s)^{sing}` in at most two points and contracted to a point of C_s). For S integral with generic point η, an η-modification is one that is an isomorphism over η.

Work under these precise hypotheses: S a scheme (integral, quasi-compact and quasi-separated for η-modifications).

The API records the following facts.

- (C → S, D → S, D ↪ C) flat finitely presented of relative dimensions 1 and 0.
- Semistability means nodal geometric fibres, with D étale and disjoint from the nonsmooth locus.
- Pairs of modifications compatible with D ↪ C.
- A stable modification is semistable and has no contracted exceptional component in any geometric fibre.
- Semistability is stable under arbitrary base change S′ → S.
- (C, D) is semistable ⇔ all geometric fibres are semistable multipointed curves.
- For C → S proper with geometrically connected fibres, after an étale base change splitting the finite étale marking D into ordered sections, the semistable pair gives a pointed prestable family in the terminology of StableReduction Layer 3; its stronger semistability predicate need not hold.
- For a semistable pair the relative dualizing complex of C → S has cohomology only in degree −1, and `ω_{C/S}`, its degree −1 cohomology, is invertible and commutes with arbitrary base change; on C proper over S with geometrically connected fibres it is StableReduction Layer 2’s dualizing sheaf.

One proof route is as follows. Define the predicates fibrewise; semistability is a property of geometric fibres by the fibre criterion of étaleness for D. For proper C with geometrically connected fibres, D is finite étale in the semistable case. After an étale cover splitting D into n ordered sections, compare with the pointed prestable families of StableReduction Layer 3. Temkin’s semistability here imposes neither a positive-genus bound nor absence of rational tails, unlike that supplier’s semistability predicate. Stability of a modification concerns only contracted components and differs from stability of a pointed curve: the identity of an unmarked P¹ is a stable modification. For a semistable pair, let (K, ξ) be the relative dualizing complex of the flat finitely presented C → S supplied by SchemeAndStackFoundations §2.20 (`RelativeDualizingComplex.exists`). Prove the nodal identification: K has cohomology only in degree −1 and `ω_{C/S}` := H⁻¹(K) is invertible. This is local on C, so restrict to an affine open; by noetherian approximation (SchemeAndStackFoundations §0.9) that open is the base change of a flat finitely presented morphism C₀ → S₀ with S₀ noetherian, nodal after replacing C₀ by its open subscheme of points at which C₀ → S₀ is nodal, which contains the image of C because nodality is a fibre condition stable under base change; C₀ → S₀ is separated, quasi-compact and Gorenstein of pure relative dimension one, so `relativeDualizingModule_invertible_iff` (§2.20) gives f^!O = ω[1] with ω invertible, étale-locally the complete-intersection line bundle `det(Ω_{P/S})|_C ⊗ N_{C/P}` for a closed immersion of C into a smooth S-scheme P of relative dimension two cut out by uv − h at a node and by u at a smooth point, `N_{C/P}` the dual of the conormal sheaf; `RelativeDualizingComplex.baseChange` transports the identification to S, and `RelativeDualizingComplex.unique` glues it over C. For C proper over S with geometrically connected fibres this is StableReduction Layer 2’s `ω_{C/S}`, by uniqueness. Define `ω_{(C,D)/S}` := `ω_{C/S}(D)` for the effective Cartier divisor D; it commutes with base change because both factors do.

(temkin10, §1.2, arXiv v3 pp. 2–3 (temkin10 line 57); ilo14, Exposé X, §3.2.2, arXiv v1 p. 158 (ilo14 line 7276).)

**Checks.**

- (A^1_S, ∅) is a semistable multipointed S-curve and the identity is a stable modification. Stability of a modification tests only contracted components.
- Over a DVR R with uniformizer π, (Spec R[u, v]/(uv − π), ∅) is semistable, with a node in the special fibre. The special fibre has two branches and the generic fibre is smooth.
- (Spec k[x, y]/(y² − x³), ∅) over k is not semistable: the cusp is not an ordinary double point. The tangent cone is a double line, not two transverse branches.
- Blowing up a smooth point of the special fibre of A^1_R over a DVR gives a semistable modification that is not stable: the exceptional P^1 meets the rest of the fibre in one point and is contracted. The exceptional dualizing degree is −2 + 1 = −1.
- A marking D through the node of Spec R[u, v]/(uv − π) is not allowed. A marking must be étale and lie in the smooth locus.
- For C = P¹_k and D = ∅, the arithmetic genus is 0 and deg ω_C = −2. This is a proper pointed prestable family and a semistable multipointed curve here, but fails the supplier’s semistability and pointed stability predicates. Its identity is a stable modification, since it contracts no component; relative ampleness for the identity imposes no positive-degree condition on C itself. Splitting the empty marking changes nothing.
- Over an algebraically closed field, for an unmarked smooth proper connected genus-one curve E with a single P¹ attached transversely at one point, the arithmetic genus is 1 + 0 + 0 = 1. The dualizing degrees on E and the tail are respectively 2·1 − 2 + 1 = 1 and 2·0 − 2 + 1 = −1. It is pointed prestable and semistable here, but its rational tail excludes the supplier’s semistability predicate, and the negative degree excludes pointed stability. The identity still contracts no component and is a stable modification; its empty marking is already split.
- For C = Spec k[u, v]/(uv) over Spec k, the relative dualizing complex is ω[1] with H⁻¹ the free rank-one module generated by the differential du/u = −dv/v; on the normalization, two disjoint lines, this generator has residues 1 and −1 at the two points over the node, so the residues sum to zero rather than being equal. Kähler differentials are not a substitute: the fibre of `Ω¹_{C/k}` at the node is two-dimensional, so that module is not invertible there.

(A^1_S, ∅) with A^1 → S is a semistable multipointed curve; (Spec O_S[u, v]/(uv − π), ∅) over a DVR is semistable but not smooth.

*Needs:* TauCetiRoadmap.SchemeAndStackFoundations §2.20 (relative dualizing complexes, `relativeDualizingModule_invertible_iff`); TauCetiRoadmap.SchemeAndStackFoundations §0.9 (noetherian approximation); TauCetiRoadmap.StableReduction Layers 2–3; Mathlib `AlgebraicGeometry.Flat`; Mathlib `AlgebraicGeometry.Etale`; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 5.2 Stable modification theorem: projectivity

For a multipointed S-curve (C, D) with a semistable modification (C′, D′), the sheaf `ω_{(C′,D′)/S}` is C-ample if and only if the modification is stable. In particular every stable modification C^st → C is projective.

Work under these precise hypotheses: (C, D) a multipointed S-curve; (C′, D′) → (C, D) a semistable modification.

One proof route is as follows. Relative ampleness is checked on fibres C′_x over points x ∈ C closed in their S-fibre (the fibrewise ampleness argument in temkin10, proof of Theorem 1.1); pass to a geometric point and use base change of ω (SchemeAndStackFoundations §2.20, `RelativeDualizingComplex.baseChange`, through §PA.5.1). The reduced geometric fibre Z over x is proper. Treat its connected components separately. Zero-dimensional components impose no positivity condition, since every invertible sheaf on them is ample. A one-dimensional connected component is a proper connected semistable curve; let its induced markings be D_Z and its attaching points, smooth in Z but singular in C′_s, be E. Non-exceptionality gives classical stability of (Z, D_Z ⊔ E), and the restriction of ω is `ω_{(Z, D_Z ⊔ E)}`, hence ample. If the modification is not stable, ω has degree ≤ 0 on an exceptional component, so it is not C-ample.

(temkin10, Theorem 1.1 and proof, arXiv v3 p. 3 (temkin10 line 104).)

**Checks.**

- The identity of A¹_k has fibre Spec k over 0. Its line bundle is ample on that zero-dimensional fibre, without a curve-degree inequality.
- The normalization of V(xy) has two point fibres over the node. Each component has dimension 0, so both are handled separately and neither is asserted to be a connected curve.
- A contracted rational component with three induced markings or attaching points has dualizing degree −2+3 = 1; with two it has degree 0 and is not stable. This pins the positive-degree criterion on one-dimensional components.

For a semistable (C, D) the identity is a stable modification, and `ω_{(C,D)/S}` is C-ample relative to the identity.

*Needs:* §PA.5.1; TauCetiRoadmap.SchemeAndStackFoundations §2.20 (base change of the relative dualizing complex); TauCetiRoadmap.StableReduction Layers 2–3 (component degrees and the pointed stability criterion).

### 5.2a One-dimensional analytic fields

**Analytic fields and types.** An analytic field is complete for a nontrivial non-archimedean valuation of height one with values in the positive reals. An analytic k-field K contains k with the extended valuation; K° and K̃ denote its valuation ring and residue field. Write p for the residue characteristic exponent, equal to 1 in residue characteristic zero. K is topologically generated by T when K is the closure of k(T) inside K. It is one-dimensional when it is finite over such a closure with T outside the completed algebraic closure of k, embedded in a completed algebraic closure of K. Put `E_{K/k} = dim_ℚ((|K^×|/|k^×|) ⊗ ℚ)` and `F_{K/k} = trdeg(K̃/k̃)`. A one-dimensional K has type 2, 3 or 4 when (E,F) is (0,1), (1,0) or (0,0), respectively (temkin10 §2.1, p. 7, temkin10 line 313; §6.2, pp. 41–42, temkin10 lines 2011–2024).

The API records the following facts.

- Analytic fields are henselian; every finite extension has a unique extended valuation and is complete.
- For one-dimensional K, E + F ≤ 1 by Abhyankar's inequality on k(T); completion and finite extension preserve E and F, hence the type.
- Topological generation requires equality with the closure, whereas one-dimensionality permits a finite extension of that closure. A finite extension of k itself is not one-dimensional.

**Checks.**

- Q_p and C((t)) with their usual nontrivial valuations are complete analytic fields; Q with its p-adic valuation is not complete, and a trivially valued field has height 0 rather than 1. Completeness and nontriviality are separate requirements.
- For any algebraically closed analytic k, the Gauss completion K of k(T) has residue field k̃(T̃) and unchanged value group: (E,F) = (0,1), type 2. It is topologically generated by T and is one-dimensional, since inf |T−k| = 1 > 0 and the completed algebraic closure of k is k.
- For such k and r outside the divisible hull of |k^×|, the radius-r Gauss completion has residue field k̃ and value group |k^×|·r^ℤ: (E,F) = (1,0), type 3. It is also topologically generated by T and one-dimensional. The radius contributes rational rank 1, not residue transcendence.
- Let k be algebraically closed and analytic, with a decreasing sequence of closed discs D(a_n,r_n) having empty intersection in k, with r_n decreasing to r > 0. On k(T) use the limiting disc norm, `|f| = lim |f|_{a_n,r_n}`, and complete to K. For each c ∈ k, eventually c is outside D(a_n,r_n), so |T−c| = |a_n−c| > r_n ≥ r, while |T−a_n| ≤ r_n. Thus inf |T−k| = r > 0 and T ∉ k. Over algebraically closed k all linear factors T−c have values in |k^×|, so the value group is unchanged; after scaling T−c, a later centre gives its constant residue, so K̃ = k̃. Therefore (E,F) = (0,0), type 4, with K topologically generated by T and one-dimensional (temkin10 §6.2, pp. 42–43, temkin10 lines 2058–2078). Treating type 4 as an algebraic field would miss the positive distance r.
- For K/k finite, E = F = 0 but every element of K lies in the algebraic closure of k. The one-dimensional hypothesis fails: (0,0) alone does not define type 4.

**Splitness.** K is k-split if, for every T ∈ K, inf |T−c| over c ∈ k equals the infimum over c algebraic over k, both computed in a completed algebraic closure of K (temkin10 §6.2, pp. 41–42, temkin10 line 2025).

The API records the following facts.

- The algebraic approximation infimum is at most the k-approximation infimum; splitness requires the reverse inequality as well.
- An algebraically closed k makes every analytic k-field k-split, since the approximation sets coincide.
- If K contains a constant α algebraic over k but outside k, then k is closed in the valued extension and inf |α−k| > 0, whereas inf |α−k^a| = 0; thus K is not k-split.

**Checks.**

- For algebraically closed k and its radius-1 Gauss field, the two distances for T are 1 and 1. Equal value groups alone would not explain the equality of approximation sets.
- For T ∈ k both infima are 0; in the type-4 disc example above they are r and r with r > 0. Splitness allows a positive infimum that is not attained.
- Let k = Q_3, let k(α)/k be unramified quadratic with |α| = 1 and residue outside F₃, and let K be the Gauss completion of k(α)(T). For c ∈ k with |c| ≤ 1 the residue difference is nonzero, so |α−c| = 1; for |c| > 1 it is |c| > 1. The two infima for α are therefore 1 and 0. This K fails k-splitness despite being one-dimensional.

**Stability.** K is stable when every finite extension L/K is defectless: `e_{L/K} f_{L/K} = [L : K]` (temkin10 §6.1, pp. 36–41, temkin10 lines 1746–1756, 1990–2010).

The API records the following facts.

- Discretely valued analytic fields and analytic fields of residue characteristic zero are stable.
- If p > 1, K is not stable exactly when some finite extension of K admits an immediate extension of degree p. With the exponent convention, the criterion for arbitrary p is the conjunction of p > 1 and that existence statement.
- For p > 1, K is stable exactly when every special coset in every finite defectless extension K′/K contains an element of minimal absolute value. The case p = 1 is the separate residue-characteristic-zero stability statement.

**Checks.**

- The unramified quadratic extension of Q_p has e = 1, f = 2 and degree 2, hence defect 1. Stability through e alone would fail.
- For F₂((t)) ⊂ F₂((t^(1/2))) and F₃((t)) ⊂ F₃((t^(1/3))), respectively, (e,f,degree) = (2,1,2) and (3,1,3), so defect is 1 even though the extensions are inseparable. These complete discretely valued fields are stable.
- For K = C((t)), p = 1 and K/K is immediate of degree 1, but K is stable. The unrestricted existence statement is true while instability is false; the conjunction of p > 1 with the existence of an immediate degree-p extension has value false, since p > 1 fails.
- For every analytic K the identity extension has e = f = degree = 1. Immediate degree 1 extensions never witness defect.

**Generator types.** An element z ∈ K ∖ k is an unramified generator, respectively a moderately ramified generator, when K is finite unramified, respectively finite tame, over the closure of k(z), in the henselian sense of LocalFieldsRamificationPartII GF.2 (temkin10 §2.1, p. 10, temkin10 lines 460–470; §6.3, p. 48, temkin10 line 2339).

The API records the following facts.

- Each generator retains the specified inclusion from the closure of k(z) into K and its finite-degree witness.
- Every unramified generator is moderately ramified.
- For a finite henselian extension, unramifiedness requires e = 1, separable residue extension and defect 1; tameness allows e prime to the residue characteristic, with the same residue separability and defect condition.

**Checks.**

- For any analytic k and its Gauss completion K, z = T has extension degree 1, e = f = 1; it is both kinds of generator.
- For an unramified quadratic k′/k, the Gauss field K of k′(T) has degree 2 over the Gauss field of k(T), with e = 1 and separable residue degree 2. T remains an unramified generator even though the two fields are not equal.
- For k = Q₃ and a radius r outside the divisible hull of |k^×|, take K the radius-r completion of k(T) and z = T². Its subfield closure has value group |k^×|·r^(2ℤ); (e,f,degree) = (2,1,2). Thus z is moderately ramified and not unramified. With k = Q₂ the same values give wild ramification, so z is neither kind of generator. In either case z = 0 ∈ k is excluded and K/k is not finite.

**Cosets controlling immediate extensions.** Assume p > 1. For a ∈ K and s > 0 define `S_{a,s}(K)` to consist of c^p − ac + d with c,d ∈ K, |p c^p| < s and |d| < s. This is an additive subgroup of K. A coset b + `S_{a,s}(K)` is split if it contains 0, critical if it is nonsplit with infimum of absolute values equal to s, and special if it is critical and either a = 0 or (a = 1 and s = 1) (temkin10 §6.1, p. 37, temkin10 lines 1773–1788).

The API records the following facts.

- Splitness is equivalent to containing an element of norm < s; the d-term is essential to this equivalence.
- A critical coset has positive infimum s and no element of smaller norm; attainment is a separate condition.
- Special cosets form the two specified subclasses of critical cosets. They are the cosets in the stability criterion and the uniformization theorem of §PA.5.2b.

**Checks.**

- In K = F_p((t)), write ρ = |t| < 1. For b = 0 the coset is split and has infimum 0, so it is neither critical nor special for any s > 0. This distinguishes membership of 0 from merely containing small elements.
- For a = 0, b = t⁻¹ and s = ρ⁻¹, the terms c^p have valuations divisible by p and d has valuation > −1. The valuation −1 of b cannot cancel: every norm is at least ρ⁻¹, attained by b. The coset is critical and special, for p = 2 and p = 3.
- For a = 1, b = 1 and s = 1 in F₂((t)), c²−c has constant residue 0 when c is integral and has negative even valuation otherwise. Hence the infimum is 1, attained by 1: this is the second special class, distinct from a = 0.
- For a = t, b = t⁻¹ and s = ρ⁻¹ in F_p((t)), integral c leaves the term of valuation −1; if v(c) < 0 then p v(c) < v(c)+1 and p v(c) ≤ −p < −1, so c^p dominates. The minimum is ρ⁻¹. This coset is critical but not special, since a is neither 0 nor 1.
- For a = 0, b = t⁻¹ and s = 1 the same valuation calculation gives infimum ρ⁻¹ > 1. The coset is nonsplit but not critical. Dropping the equality to s would misclassify it.

**Uniformization hypothesis.** The pair (k,K) satisfies this hypothesis when K is one-dimensional and either k is algebraically closed, or K has type 4 and is k-split, k equals its maximal tame extension, and, when p > 1, k is deeply ramified, meaning k° = p k° + (k°)^p (temkin10 Assumption 6.2.1 and Remark 6.2.2, p. 42, temkin10 lines 2031–2040).

The API records the following facts.

- Under this hypothesis k̃ is algebraically closed and |k^×| is divisible.
- In the second branch tame closedness supplies separable closedness of k̃ and divisibility away from p; deep ramification supplies perfection and p-divisibility when p > 1.
- In the algebraically closed branch the type can be 2, 3 or 4. Deep ramification alone does not imply tame closedness.

**Checks.**

- For algebraically closed analytic k the type-2 and type-3 Gauss fields above satisfy the first branch although neither has type 4. In mixed characteristic every a ∈ k° has a pth root in k°, so the deep-ramification equality also holds with zero p k° term.
- For the type-4 disc field over algebraically closed k, (E,F) = (0,0) and both approximation infima equal r > 0. It satisfies the hypothesis without attaining those infima; replacing k-split by attainment would exclude it.
- The completion of Q_p(p^(1/p^∞)) has surjective Frobenius on k°/p k° and hence the deep-ramification equality, but residue field F_p and an unramified quadratic extension. It fails tame closedness and is not algebraically closed, so deep ramification alone cannot supply the uniformization hypothesis.
- The completion of the maximal tame extension of Q_p has additive value group ℤ_(p), which lacks 1/p. For ℓ > 1 prime to p, the element p^(1/ℓ) has valuation 1/ℓ < 1; a pth power congruent to it modulo p would have a root of valuation 1/(pℓ), absent from ℤ_(p). Thus Frobenius on k°/p k° is not surjective. Completion does not add nonzero values, and this failure holds for p = 2 and p = 3 as well. Tame closedness supplies no replacement for deep ramification.

One proof route for the stability assertions uses the tower of degree-p steps in the proof of temkin10 Corollary 6.1.6 and special cosets without a minimum in Proposition 6.1.4; it applies only in positive residue characteristic. Henselianity and the ramification criteria use LocalFieldsRamificationPartII GF.1–GF.2, and the dimension bound uses GF.5/abhyankar-and-rank. The type-4 computations use the disc description in temkin10 §6.2, pp. 42–43.

*Needs:* TauCetiRoadmap.LocalFieldsRamificationPartII GF.1/normalization-and-prolongations; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/tame-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/unramified-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.5/abhyankar-and-rank.

### 5.2b Uniformization of one-dimensional valued and analytic fields

(i) Let k be an analytic field and L a one-dimensional analytic k-field such that (k, L) satisfies the uniformization hypothesis of §PA.5.2a. Then L has an unramified generator over k; if p > 1 and k is algebraically closed, every special coset of L contains a moderately ramified generator of L; and if L has type 2 or 3, L is stable. (ii) Let k be an algebraically closed analytic field and K an analytic k-field finite over the closure of k(y) for some y ∈ K. Then there is x ∈ K with K finite and unramified over the closure of k(x); there is ε > 0 such that every x′ ∈ K with |x − x′| < ε has the same property; and if K̃ ≠ k̃, every x ∈ K° whose residue is transcendental over k̃ with K̃ separable over k̃(x̃) has the same property. (iii) Let K/k be a finitely generated extension of valued fields of transcendence degree one with k separably closed, and assume that the valuation ring k·K°, the localization of K° at the nonzero elements of k°, is centred on a smooth point of the normal projective k-model of K. Then there is x ∈ K transcendental over k such that K/k(x) is finite and unramified (LocalFieldsRamificationPartII GF.2/unramified-extension).

For (ii), `analytic_uniformization` states existence and perturbation stability; `analytic_uniformization_residue` states the residue-coordinate clause. The algebraically closed analytic constant field is represented as a subfield k of K with the induced norm, so its inclusion is isometric. Both fields are complete with nontrivial ultrametric norms. The finite-over-a-completed-rational-subfield hypothesis includes K = k. In the residue clause transcendence already implies K̃ ≠ k̃.

Define `completedRationalSubfield` of k ⊆ K and x ∈ K as the topological closure in K of the native intermediate field generated by x over k (temkin10 Theorem 2.1.10, temkin10 lines 460–467).

- Its value H(x) is a closed subfield of K containing k and x, with the induced norm and specified inclusion into K.
- If x ∈ k and k is complete, H(x) = k.
- Finite dimensionality of K over H(x) is an additional hypothesis, rather than part of this definition.

**Checks.**

- For complete k, H(0) = H(1) = k. Closing an algebraic closure instead would not define the requested rational subfield.
- In the Gauss completion of k(T), H(T) = K and [K:H(T)] = 1; the uncompleted k(T) is merely dense.
- In the radius-r field over Q₃ with r outside the divisible hull of |Q₃^×|, H(T²) has value group |Q₃^×|·r^(2ℤ), of index 2 in |K^×| = |Q₃^×|·r^ℤ. Here [K:H(T²)] = 2, so closure does not force equality with K.

Define `analyticIntegerInclusion` for H ⊆ K as the ring map H° → K° sending each element to itself, where K° is the native valuation subring of the norm valuation and H° its inverse image in H (temkin10 Lemma 2.1.6, temkin10 lines 432–436).

- Its domain consists exactly of h ∈ H with |h| ≤ 1, and its codomain is K°.
- It is injective and preserves 1; its map on fraction fields is the specified inclusion H → K.
- The algebra used for étaleness is the algebra induced by this ring map.

**Checks.**

- For H = K the integer-ring map is the identity and sends 1 to 1, excluding a zero map.
- For an unramified quadratic extension of Q₃ it has residue degree 2 and is étale, although the integer rings differ.
- For H = F₂((t²)) ⊆ F₂((t)) = K it sends t² to t², has value-group index 2 and is not étale; injectivity alone is insufficient.

Define `finiteUnramifiedOverCompleted` of k ⊆ K and x ∈ K as finite dimensionality of K over H(x) together with étaleness of `analyticIntegerInclusion` for H(x). For complete analytic fields this is finite unramifiedness in (ii), by temkin10 Lemma 2.1.6 (temkin10 lines 432–436). It permits x ∈ k when K = k; §PA.5.2a's nonconstant generator terminology applies when K is one-dimensional.

- The finite-degree condition is retained separately from étaleness.
- The valuation on H(x) is restricted from K, so an unrelated valuation cannot satisfy the predicate.
- On one-dimensional K this agrees with the unramified-generator condition of §PA.5.2a.

**Checks.**

- For K = k complete and x = 0, the degree is 1 and the integer map is the identity; the predicate holds.
- For an unramified quadratic k′/k, the Gauss field of k′(T) has degree 2 over H(T), with separable residue degree 2 and e = 1, so the predicate holds.
- In the radius-r examples over Q₃ and Q₂, x = T² gives (e,f,degree) = (2,1,2), so the predicate fails in both the tame and wild case. At x = 0 the extension K/k is infinite, so it fails for a separate reason.

Define `residueConstants` of k ⊆ K as the subfield of K̃ generated by residues of k ∩ K°. It is the image of k̃ inside K̃ (temkin10 Theorem 2.1.10(iii), temkin10 lines 466–467).

- Reduction is the native quotient K° → K̃, whose kernel on k ∩ K° is k°°.
- The residue image of k° is already a field, so generating a subfield leaves that image unchanged.
- Transcendence and separability in the residue-coordinate theorem use this specified constant subfield and its native intermediate field generated by x̃.

**Checks.**

- For K = k this subfield is all of K̃; every residue is algebraic over it, so the coordinate hypothesis fails.
- For the Gauss field over algebraically closed k it is k̃ ⊊ k̃(T̃). The residue of T is transcendental and K̃/k̃(T̃) has degree 1, hence is separable.
- For a type-3 radius-r field over algebraically closed k, K̃ = k̃, so the residue-coordinate hypothesis fails. The existence theorem still supplies a generator.

Work under these precise hypotheses: in (i) the uniformization hypothesis; in (ii) k algebraically closed and complete, K finite over the closure of some k(y); in (iii) k separably closed, K/k finitely generated of transcendence degree one, and the centre of k·K° a smooth point of the normal projective model.

One proof route is as follows. (i) Control immediate extensions of degree p by special cosets (§PA.5.2a and temkin10 §6.1), uniformize fields topologically generated by one element, for which a special coset contains an element of k or a topological generator (temkin10 Proposition 6.2.4), and pass to finite extensions of those (temkin10 §6.3). (ii) The first clause is (i) when k is algebraically closed; the second follows because for x′ close to x the closures of k(x) and k(x′) are isometrically isomorphic over k with the same residue field and K has the same degree over both (temkin10 Lemmas 6.3.2 and 6.3.3); in the third K has type 2, the closure of k(x) is stable by (i), so the degree of K over it equals the residue degree and unramifiedness reduces to separability of K̃/k̃(x̃) (proof of temkin10 Theorem 2.1.10). (iii) Reduce to absolutely finitely generated valued fields, which have finite height (LocalFieldsRamificationPartII GF.5/abhyankar-and-rank). If k·K° ≠ K it is the discrete valuation ring of a smooth closed point z, and a uniformizer x at z works by the composition criterion (LocalFieldsRamificationPartII GF.5/unramified-composition). If k·K° = K, then K/k is separable and one inducts on the height of k: the trivially valued case is the existence of a separable transcendence basis; in positive height, a finite separable extension of height-one valued fields is unramified exactly when its completion is (temkin10 Proposition 2.2.1), which reduces the height-one step to (ii), and the composition criterion assembles the height-one step with the residue field, to which the induction hypothesis applies.

(temkin10, Theorem 6.3.1, p. 48 (temkin10 line 2339), under Assumption 6.2.1, p. 42 (temkin10 line 2031); Theorem 2.1.10, p. 10 (temkin10 line 460), proof p. 51 (temkin10 line 2487); Theorem 2.1.8, p. 10 (temkin10 line 445), proof §2.2, pp. 10–13 (temkin10 line 550).)

**Checks.**

- For algebraically closed k and its Gauss field K, H(T) = K has degree 1. Every x′ with |T−x′| < 1 topologically generates K by temkin10 Lemma 6.3.2; the residue of T is transcendental and the residue extension has degree 1.
- For K = k, every H(x) = k and every integer map is the identity, of degree 1. Choose x = 0 and ε = 1; all x′ in that ball satisfy the conclusion. Part (ii) imposes no nonconstant-coordinate hypothesis.
- In the Gauss field, replacing T by 0 changes [K:H(T)] = 1 to [K:k] infinite. Its distance from T is 1, outside the strict ball of radius 1. Omitting either finiteness or the small-distance condition admits this wrong coordinate.

In (iii) with k trivially valued: if k·K° = K the valuation of K is trivial and the conclusion is the existence of a separable transcendence basis of K/k; if k·K° ≠ K, for instance the t-adic valuation of k(t), the valuation ring is the local ring of a smooth closed point and a uniformizer there, such as x = t, is the required element.

*Needs:* Mathlib `NormedField.valuation`, `Subfield.topologicalClosure`, `IntermediateField.adjoin`, `Algebra.Etale` and `IsLocalRing.ResidueField` for (ii); §PA.5.2a; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/unramified-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.5/unramified-composition; TauCetiRoadmap.LocalFieldsRamificationPartII GF.5/abhyankar-and-rank.

### 5.3 Stable modification theorem: existence and uniqueness

Let S be integral, quasi-compact and quasi-separated with generic point η. (Uniqueness) If S is normal and (C, D) admits a stable η-modification (C^st, D^st), it is minimal: every semistable modification of (C, D) factors uniquely through it; so it is unique up to unique isomorphism and an isomorphism over the semistable locus. (Existence) For every multipointed S-curve (C, D) whose generic fibre (C_η, D_η) is semistable there are a generically étale alteration S′ → S in the integral sense of SchemeAndStackFoundations §4.16 and a stable η-modification (C′^st, D′^st) → (C, D) ×_S S′.

Work under these precise hypotheses: S integral qcqs (normal for uniqueness); (C, D) a multipointed S-curve with semistable generic fibre; alterations use SchemeAndStackFoundations §4.16, without noetherianness.

One proof route is as follows. Uniformization of one-dimensional valued fields (§PA.5.2b(iii)) gives stable modification over spectra of finite-height valuation rings with separably closed fraction field (temkin10 §4), glued from non-proper pieces using uniqueness. Globalize over an integral base by the Riemann–Zariski space of S (quasi-compactness, §PA.1.4): finitely many generically étale alterations S′_i → S with opens U_i centring the valuations, glued by uniqueness of stable modifications over a common generically étale alteration (Temkin 2010 §5).

(temkin10, Theorem 1.2, Corollary 1.3 and Theorem 1.5, arXiv v3 pp. 3–4; proofs §§4–5 (temkin10 line 140).)

For S the spectrum of a DVR and C proper smooth over η of genus ≥ 2 this is the Deligne–Mumford stable reduction theorem after a finite separable extension.

**Checks.**

- For the rank-two valuation ring V of k(x,y) with v(x) = (1,0), v(y) = (0,1) in lexicographic order, C = A¹_V with empty marking is semistable. The identity of Spec V is proper, dominant and finite on all of Spec V, and its generic degree is 1 with separable extension. It is an allowed alteration although V is nonnoetherian: the ideal of positive first value coordinate has no least value, since (a,b) > (a,b−1) for a > 0.
- Over a DVR the same identity has degree 1 and lies in both alteration carriers; the stable modification of an already semistable curve is the identity.
- P¹_K → Spec K is proper and dominant but has generic fibre dimension 1, so it is not finite over any nonempty open and is excluded by the integral alteration carrier.

*Needs:* §PA.5.1; §PA.5.2; §PA.5.2b; §PA.1.4; TauCetiRoadmap.SchemeAndStackFoundations §4.16.

### 5.4 Equivariance of stable modification

In the existence theorem, if S′ is normal, the natural action of Aut_S(C, D) × Aut_S(S′) on (C, D) ×_S S′ lifts equivariantly to the stable modification (C′^st, D′^st).

Work under these precise hypotheses: As in §PA.5.3, using its integral qcqs alteration carrier, with S′ normal.

One proof route is as follows. Each automorphism carries the stable η-modification to a stable η-modification of the same curve; by uniqueness over the normal base S′ it is the unique isomorphism, and the cocycle condition follows from uniqueness.

(temkin10, Corollary 1.6, arXiv v3 p. 4 (temkin10 line 156).)

For a G-Galois generically étale S′ → S the G-action on (C, D) ×_S S′ lifts to the stable model; used in ILO X 3.4 Step 5.

*Needs:* §PA.5.3; TauCetiRoadmap.SchemeAndStackFoundations §4.16.

### 5.5 Semistable multipointed curves are log smooth

Let (S, W) be a log regular pair and (C, D) a semistable multipointed S-curve with f : C → S smooth over S ∖ W. Then (C, D ∪ f⁻¹(W)) is a log regular pair and (C, D ∪ f⁻¹(W)) → (S, W) is log smooth.

Work under these precise hypotheses: (S, W) log regular; (C, D) semistable; f smooth over S ∖ W.

One proof route is as follows. The question is local on C and trivial on the smooth locus and over S ∖ W. At a non-smooth geometric point x over y, the strict henselization of `O_{C,x}` is `O_{S,y}{u, v}/(uv − h)` with h invertible on S ∖ W, hence h ∈ `M_{S,y}` (log regularity); write h = εa with a in the characteristic monoid P. The push-out Q of N² ← N → Z × P (1 ↦ (1,1), 1 ↦ (1, a)) gives a chart of f; the map Z × P → Q is injective with cokernel Z, so Kato's criterion (CR.5:log-algebra.3, Kato chart criterion) gives log smoothness, and log regularity of C follows from CrystallineCohomology CR.5:log-algebra.4, preservation of log regularity. The boundary is the boundary over a non-trivially logged base: a nodal curve over a trivially logged field is not log smooth with its marking alone.

(ilo14, Exposé X, §3.2.1 and Proposition 3.2.3, arXiv v1 p. 158 (ilo14 line 7271); ilo14, Exposé VI, Proposition 1.9 and proof, arXiv v1 p. 70 (ilo14 line 3126).)

(Spec Z_p[u, v]/(uv − p), V(p)) → (Spec Z_p, V(p)) is log smooth.

*Needs:* §PA.5.1; §PA.4.1; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Kato chart criterion); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Log smoothness over log regular schemes).

### 5.5a Generic constants of a relative curve and preservation of degrees

Let g : X → Y be dominant of finite type between integral noetherian quasi-excellent schemes, with smooth integral generic fibre of dimension one. Normalize Y and X first, replacing X by the normalization of the dominating proper transform over the normalized Y; these are finite degree-one modifications. Write F = k(Y), L = k(X), and let F_c be the relative algebraic closure of F in L, using Mathlib `algebraicClosure F L`. Then F_c/F is finite separable, and `Y_c := Nor_{F_c}(Y)` is finite over Y. Normality gives a factorization X → Y_c → Y. The generic curve of X → Y_c is smooth and geometrically integral. If X → Y is projective, so is X → Y_c, and Y_c → S is projective whenever Y → S is projective. No restriction on the prime factors of [F_c:F] is asserted: this changes an auxiliary curve base, while the modification of X has degree 1.

For a smooth geometrically integral generic curve, every finite field extension E/F of the curve base has L ⊗_F E a field with degree [E:F] over L. Thus, for an alteration Y′ → Y of integral schemes and a relative curve with geometrically integral generic fibre over Y, there is one dominating generic component of its base change to Y′, and its degree over X equals [k(Y′):k(Y)]. With several components of Y′, this equality holds separately for each one. It preserves P-number degrees and separability when the base alteration is separable.

The API records the following facts.

- Relative constants are finite by finite generation of L/F, and are separable because the generic curve is smooth. The normalized auxiliary base carries its specified inclusion F_c → L.
- F_c is algebraically closed in L; smoothness over F_c and geometric connectedness therefore make the generic curve geometrically integral. The assertion does not require the base field to be perfect or algebraically closed.
- After a finite extension of the curve base, the geometrically integral generic fibre stays geometrically integral. Modifications that are isomorphisms on that fibre do not change this property.
- The equality of generic degrees uses geometric integrality, not just smoothness and integrality over F. The finite extension of constants is not counted as an alteration of X.

One proof route is as follows. Finiteness of the relative constants is stacks, Fields Lemma 9.26.11, tag 037J (stacks line 1718 (Fields)). Use finite normalization from SchemeAndStackFoundations §0.20. Elements integral over the base are regular on normal X, giving the factorization to Y_c. The generic curve is smooth over F_c since F_c/F is finite étale; stacks, Varieties Lemma 33.7.14, tag 04KV, applied at its generic point, makes it geometrically connected (stacks line 528 (Varieties)). A smooth geometrically connected curve is geometrically integral: after algebraic closure its regular irreducible components are disjoint, so connectedness permits exactly one. For finite E/F, geometric integrality makes L ⊗_F E an integral domain; it is finite-dimensional over L, hence a field, of L-dimension [E:F]. This proves the component degree statement directly, including inseparable E/F (stacks, Varieties Definition 33.9.1, tag 020H, stacks line 886 (Varieties)).

**Checks.**

- Put A = Q(∛2) and B = A(ω), with ω a primitive cube root of unity. Before changing constants, A ⊗_Q A = A × B, with degrees 1 and 2 over A, although [A:Q] = 3. For P¹_A → Spec Q the replacement base is Spec A; over it every finite E/A gives the single generic field E(T), with [E(T):A(T)] = [E:A]. Taking E = B gives degree 2 on both sides; the earlier degree-3 cover of Q is not a cover of this new base.
- Let M = Q(x₁,…,x₅) with the permutation S₅-action, `F = M^{S_5}`, `A = M^{S_4}` with S₄ fixing one variable, and `B = M^{S_2 x S_3}`. Then [A:F] = 5 and B ⊗_F A has two factors of degrees 2 and 3, from the two orbits on the five variables. Neither is a {5}-number. For P¹_B over F the constants replacement is B, and a degree-n extension of B gives degree n on the generic curve; choosing one of the old factors cannot establish prime support.
- Over F = F₂(u), L = F(T) is geometrically integral and E = F(u^(1/2)) has inseparable degree 2. The tensor is E(T), a field of degree 2 over F(T); in characteristic 3 the analogous degree is 3. Separability is unnecessary for degree preservation. If instead L = F(u^(1/2))(T), its generic curve over F is not smooth and base change to E contains the nonzero nilpotent u^(1/2) ⊗ 1 − 1 ⊗ u^(1/2), whose square is 0; that field is outside the hypothesis.
- For the identity extension E = F and L = F(T), the tensor is L and both degrees are 1. Geometric-integrality reduction never inserts a positive degree into the source modification.

*Needs:* Mathlib `algebraicClosure`; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`; TauCetiRoadmap.SchemeAndStackFoundations §§0.20–0.21 and §§4.11–4.12; TauCetiRoadmap.StableReduction Layer 2.

### 5.6 Resolution of relative curves by P-alterations

Let S be a noetherian quasi-excellent scheme with scheme of generic points η, f : X → S a maximally dominating morphism of finite type and Z ⊆ X nowhere dense closed, with X_η a smooth curve over η and Z_η étale over η. Let P be a set of primes with char(S) ⊆ P, and assume S universally P-resolvable (resp. universally separably P-resolvable). Then there are a projective P-alteration (resp. separable projective P-alteration) a : S′ → S, a projective modification b : X′ → `(X ×_S S′)^{pr}` of the proper transform, and snc supports W′ ⊆ S′, Z′ ⊆ X′ with S′, X′ regular, f′ : X′ → S′ pseudo-projective, (X′, Z′) → (S′, W′) log smooth and Z′ = c⁻¹(Z) ∪ f′⁻¹(W′), c : X′ → X. If S is only universally (separably) P-resolvable in the proper sense of §PA.0.9, the same conclusion holds with a a (separable) P-alteration that is proper but not necessarily projective; b remains a projective modification, and c is then proper.

The same conclusion also holds with char(X) ⊆ P in place of char(S) ⊆ P, retaining universal P-resolvability of S and, for the separable choice of a, universal separable P-resolvability, in the projective or in the proper sense with the corresponding conclusion on a. The shrinking and extension argument below supplies this full variant.

Work under these precise hypotheses: S noetherian qe; f maximally dominating of finite type; X_η smooth curve, Z_η étale; char(S) ⊆ P (or char(X) ⊆ P in the variant); S universally (separably) P-resolvable, in the projective sense for projective a and in the proper sense for proper a.

When X_η is geometrically integral on an integral base component, choose the construction to be an isomorphism on the base-changed generic curve; the resulting X′ has geometrically integral generic fibre over every corresponding component of S′. For the degree argument in §PA.6.1, first apply §PA.5.5a to the auxiliary curve base, then use this strengthened choice. The full theorem here still allows disconnected smooth generic curves.

One proof route is as follows. Step 0–2: reduce to S integral normal, f flat quasi-projective (§PA.0.7, §PA.0.6), Z = Z^h ∪ Z^v with Z^h flat. Retain geometric integrality of the generic curve whenever it is present: all proper transforms use the whole base-changed generic curve, and curve modifications are the identity there. Step 3: stable modification (§PA.5.3, §PA.5.2) after a separable alteration S̄ → S makes (X̄, Z̄^h) a semistable multipointed S̄-curve, X̄ → X ×_S S̄ projective. Step 4: enlarge S̄ (semistability is preserved by base change) and apply tame distillation of alterations (§PA.3.6; separable variant §PA.3.7 in the separable case) so that S̄ → S′ is a tame Galois covering and S′ → S a P-alteration — here `P^w_{S̄/S}` ⊆ char(S) ⊆ P; replace S by S′. Steps 5–9: lift the Galois group G to X̄ (§PA.5.4); the action is inertia specializing (G-stable separated covers, §PA.3.1); flatten S̄ → S to make it finite and normalize; choose W ⊊ S with S̄ → S étale off W, f(Z^v) ⊆ W and f smooth off W; resolve (S, W) by universal P-resolvability. Step 10: (S̄, W̄) → (S, W) is Kummer étale (CR.5:log-algebra.4, Logarithmic Abhyankar lemma); with T̄ = Z̄ ∪ f̄⁻¹(W̄), (X̄, T̄) → (S̄, W̄) is log smooth (§PA.5.5), so (X̄, T̄) → (S, W) is log smooth and (X̄, T̄) log regular (CR.5:log-algebra.4, Log smoothness over log regular schemes, applied to the composite log smooth map); apply Gabber's log smooth modification theorem (§PA.4.6) to the tame inertia-specializing G-action and take the quotient, then monoidal desingularization (§PA.4.3). The char(X) ⊆ P form also belongs to this target. Work over each normalized irreducible component of S hit by a component of X, so the induced finite-type map is dominant; an unused base component is resolved using universal P-resolvability with empty source, and the empty-source case is treated directly. On each active component set S₀ equal to S minus the fibres at char(S) ∖ char(X); the difference is finite for the resulting dominant map, and f factors through S₀. Run distillation over S₀, extend its finite field extensions by normalization over S, extend modifications by closure of their blow-up centres, and use universal P-resolvability over S. Tameness is required only over f(X). This supplies the full source generality without treating wild primes on empty fibres as elements of P. In the proper sense the base resolution of Step 9 is only proper, so a is proper; the reduction of Step 0 still applies to a proper P-alteration S₁ → S together with a projective modification b₁ : X₁ → `(X ×_S S₁)^{pr}`, since later proper transforms are base changes of b₁ restricted to closed subschemes, so b stays projective.

(temkin17, Theorem 4.2.1 and proof, pp. 121–123 (temkin17 line 999); ilo14, Exposé X, Theorem 3.4 and proof, arXiv v1 pp. 159–162 (ilo14 line 7345).)

**Checks.**

- Let S = Spec Z_(2) ⊔ Spec Q and let X = A¹_Q map to the second component, with Z empty and P empty. Then char(S) = {2} and char(X) = ∅, so the char(X) variant applies while the char(S) condition fails. The identity alterations, with X′ = X, give the conclusion; the unused component of S is regular and needs no alteration. This detects discarding the full variant or applying a dominant-image argument to every base component.

For P = {ℓ}′ with ℓ invertible on S this is ILO X Theorem 3.4. For S = Spec k, X a smooth quasi-projective curve over k and Z ⊆ X finite étale over k, one may take a = id, X′ = X, W′ = ∅ and Z′ = Z: (X, Z) → (Spec k, ∅) is already log smooth.

*Needs:* §PA.5.5a; §PA.0.9; §PA.0.4; §PA.0.5; §PA.0.7; §PA.0.6; §PA.0.8; §PA.3.6; §PA.3.7; §PA.3.1; Mathlib Scheme.Hom.normalization and SchemeAndStackFoundations §0.20; §PA.5.3; §PA.5.2; §PA.5.4; §PA.5.5; §PA.4.6; §PA.4.3; §PA.4.1; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Logarithmic Abhyankar lemma); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Log smoothness over log regular schemes); TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### Examples

Blowing up a smooth special-fibre point on A¹_R creates an exceptional P¹ meeting the other component once; its dualizing degree is −1, so the modification is semistable and fails stability. At a node uv = π the logarithmic chart 1 ↦ (1,1) has torsion-free cokernel (temkin10 line 104; ilo14 line 3126).

### Dependencies

The statements and routes use Mathlib `NormedField.valuation`, `Subfield.topologicalClosure`, `IntermediateField.adjoin`, `Algebra.Etale` and `IsLocalRing.ResidueField`; §PA.5.5a; Mathlib `algebraicClosure`; Mathlib Scheme.Hom.normalization and SchemeAndStackFoundations §0.20; §PA.0.3; §PA.0.4; §PA.0.5; §PA.0.6; §PA.0.7; §PA.0.8; §PA.0.9; §PA.1.4; §PA.3.1; §PA.3.6; §PA.3.7; §PA.4.1; §PA.4.3; §PA.4.6; TauCetiRoadmap.SchemeAndStackFoundations §2.20; TauCetiRoadmap.SchemeAndStackFoundations §0.9; TauCetiRoadmap.StableReduction Layers 2–3; Mathlib `AlgebraicGeometry.Flat`; Mathlib `AlgebraicGeometry.Etale`; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.3 (Kato chart criterion); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Log smoothness over log regular schemes); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Logarithmic Abhyankar lemma); TauCetiRoadmap.LocalFieldsRamificationPartII GF.1/normalization-and-prolongations; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/tame-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.2/unramified-extension; TauCetiRoadmap.LocalFieldsRamificationPartII GF.5/abhyankar-and-rank; TauCetiRoadmap.LocalFieldsRamificationPartII GF.5/unramified-composition.

## Layer PA.6: Prime-to-degree desingularization

### 6.1 P-altered desingularization of morphisms

Let f : X → S be a maximally dominating morphism of finite type between noetherian quasi-excellent schemes, Z ⊆ X nowhere dense closed, and P a set of primes with char(S) ⊆ P such that S is universally P-resolvable. Then there are projective P-alterations a : S′ → S and b : X′ → X with regular sources, a pseudo-projective f′ : X′ → S′ with f ∘ b = a ∘ f′, and snc supports W′ ⊆ S′, Z′ ⊆ X′ with Z′ = b⁻¹(Z) ∪ f′⁻¹(W′) and (X′, Z′) → (S′, W′) log smooth. If S is only universally P-resolvable in the proper sense of §PA.0.9, the same holds with a and b P-alterations that are proper but not necessarily projective.

Work under these precise hypotheses: f maximally dominating of finite type; X, S noetherian qe; char(S) ⊆ P; S universally P-resolvable, in the projective sense for projective a and b and in the proper sense for proper a and b.

One proof route is as follows. Steps 1–2: normalize reduced components. Use non-separated Chow (§PA.0.7) to obtain a projective modification whose map to S factors through a local isomorphism into an S-projective scheme; carry that factorization through the argument, since a non-separated source cannot simply be made projective over S by a surjective modification. Step 3: it suffices to get Z′ ⊇ b⁻¹(Z) ∪ f′⁻¹(W′); then Z″ := b⁻¹(Z) ∪ f′⁻¹(W′) — after first replacing Z by the support of the Cartier divisor obtained by blowing up X along Z, so that b⁻¹(Z) is a Cartier support — is a union of components of Z′ (§PA.0.8), and (X′, Z″) → (S′, W′) is log smooth by §PA.4.7. For the perfect-field assertion, Step 4: if S = Spec k with k finite, pass to an infinite P-extension k̄/k (P ∋ char k is nonempty) and descend from k̄ by limits (SchemeAndStackFoundations §0.9 finite-presentation descent). Induction on d = trdeg(k(X)/k(S)), d = 0 trivial. Step 5: choose d − 1 algebraically independent rational functions over k(S), take the closure Y of their image in P^(d−1)_S, and close the graph in X ×_S Y; its projection to X is a projective modification and trdeg(k(X)/k(Y)) = 1. This relative construction is the graph argument of ilo14 X Theorem 3.5, Step 5 (ilo14 lines 7561–7568), not an application of an algebraically-closed-field fibration at an arbitrary base. Make X_η, Z_η smooth (étale) over η = Spec k(Y), by the Bertini argument over an infinite perfect k (SchemeAndStackFoundations §4.13) or by a finite purely inseparable alteration of Y followed by normalization of the generic curve (ilo14 lines 7569–7581). Its source degree is a power of the positive generic characteristic, which belongs to P; in characteristic zero no such extension is needed. Now apply §PA.5.5a: normalize and replace Y by its normalization in the relative algebraic closure of k(Y) in k(X). The map of X to the new auxiliary base has smooth geometrically integral generic fibre; the modification of X still has degree 1, and the new Y → S is projective of relative transcendence degree d − 1. Its constants extension has unrestricted degree and is not a base alteration of S. Step 6: Y is universally P-resolvable by the induction hypothesis (statement (i) in relative dimension d − 1, §PA.6.2 argument); apply resolution of relative curves (§PA.5.6) to X → Y, retaining geometrically integral generic fibre for X″ → Y″, then the induction hypothesis to Y″ → S, and take the fs fibre product (CR.5:log-algebra.2, Log fiber products) of (X″, Z″) → (Y″, V″) with (Y′, V′) → (Y″, V″): it is log smooth over (Y′, V′), hence log regular (CR.5:log-algebra.4, Log smoothness over log regular schemes), and its saturation is finite over the ordinary fibre product; the further alteration degree comes from the base-change alteration, not from a finite map to X″ without base change. Apply monoidal desingularization (§PA.4.3) to get X′ regular with snc Z′ (Zariski log structure). At generic points the log structures are trivial, so the fs fibre product equals the ordinary one. By §PA.5.5a and the retained geometric integrality, each component above a maximal point y′ of Y′ has degree [κ(y′):k(Y″)] over X″, a P-number; saturation and monoidal modifications have generic degree 1. The same equality first makes X″ → X a P-alteration from Y″ → Y. Multiplication of these degrees gives that X′ → X is a projective P-alteration. In the proper sense the base alterations supplied by universal P-resolvability, and by the induction hypothesis in that sense, are proper; a is then a composite of proper and projective P-alterations, and b, built from base changes of base alterations, proper transforms and projective modifications, is a proper P-alteration (§PA.5.6, proper variant).

(temkin17, Theorem 4.3.1(ii) and proof, pp. 123–124 (temkin17 line 1078); ilo14, Exposé X, Theorem 3.5 and proof, arXiv v1 pp. 162–165 (ilo14 line 7486).)

For P = {ℓ}′ and ℓ invertible on S this is ILO X Theorem 3.5(ii). For S = Spec Q (char(S) = ∅, P = ∅) the generic degrees are 1; for integral schemes the alterations are projective modifications, giving desingularization of morphisms of Q-varieties. For f = id_S with S regular and Z an snc support, a = b = id, W′ = Z′ = Z.

*Needs:* §PA.5.5a; §PA.0.9; §PA.0.4; §PA.0.7; §PA.0.8; §PA.0.5; §PA.5.6; §PA.4.7; §PA.4.3; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.2 (Log fiber products); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Log smoothness over log regular schemes); TauCetiRoadmap.SchemeAndStackFoundations §0.9, noetherian approximation and finite-presentation descent; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 6.2 Inheritance of universal P-resolvability

Let f : X → S be a maximally dominating morphism of finite type between noetherian quasi-excellent schemes and P a set of primes with char(S) ⊆ P. If S is universally P-resolvable, then X is universally P-resolvable; if S is universally P-resolvable in the proper sense of §PA.0.9, then so is X.

Work under these precise hypotheses: As in §PA.6.1.

One proof route is as follows. Let Y → X be an alteration and Z ⊆ Y nowhere dense closed. Y → S is maximally dominating of finite type (an alteration is proper and maximally dominating). blow up Y along Z; Bl_Z Y → Y is a projective modification and the preimage of Z is the support D of an effective Cartier divisor. Apply §PA.6.1 to Bl_Z Y → S and D: b : Y′ → Bl_Z Y is a projective P-alteration with Y′ regular and b⁻¹(D) ⊆ Z′ snc. b⁻¹(D) is the support of an effective Cartier divisor on the regular Y′ (b is maximally dominating, so local equations stay nonzerodivisors), contained in the snc support Z′; by §PA.0.8 it is an snc support. The composite Y′ → Y is a projective P-alteration (composites of projective morphisms over a noetherian base; degrees multiply). In the proper sense, §PA.6.1 gives b proper, and the composite with the projective Bl_Z Y → Y is a proper P-alteration.

(temkin17, Theorem 4.3.1(i), p. 123 (temkin17 line 1078); ilo14, Exposé X, proof of Theorem 3.5, first paragraph, arXiv v1 p. 162 (ilo14 line 7486).)

Spec of a field is universally P-resolvable for every P, so every scheme of finite type over a field k is universally P-resolvable for every P ∋ char k. Without the blow-up the argument fails: for S = X = Y = Spec of a regular two-dimensional excellent local ring, Z the closed point, the identity with W′ = Z′ = V(xy) satisfies the conclusion of §PA.6.1, but b⁻¹(Z) is a point, not an snc support.

*Needs:* §PA.6.1; §PA.0.9; §PA.0.8; §PA.0.3; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.StableReduction Layer 4.

### 6.3 Separable desingularization over a perfect field

In §PA.6.1 assume S = Spec k with k perfect (so char(S) ⊆ P means P ∋ char k when char k > 0). Then one can take a to be an isomorphism and b separable. In particular every scheme of finite type over k is universally separably P-resolvable.

Work under these precise hypotheses: S = Spec k, k perfect; P ∋ char k (any P when char k = 0).

One proof route is as follows. In the proof of §PA.6.1, Step 5 needs no inseparable alteration over an infinite perfect field (Bertini, SchemeAndStackFoundations §4.13 bertini_smoothness), and Step 4 passes from a finite field to an infinite P-extension, still perfect. In the relative-curve step use the separable alternative of §PA.5.6, whose Step 4 uses separable tame distillation (§PA.3.7); the auxiliary base Y after the constants replacement of §PA.5.5a is universally separably P-resolvable by induction. Smooth generic curves have finite separable constant fields, so this replacement adds no inseparable source extension. Over S = Spec k the statement is proved inside the same induction on relative dimension: the base alterations produced at each stage are those of the perfect-field statement in lower relative dimension, hence isomorphisms, and the relative-curve step uses its separable alternative, so a = id and b is separable.

(temkin17, Theorem 4.3.1(iii), p. 123 (temkin17 line 1094); ilo14, Exposé X, Theorem 3.5(iii) and Remark 3.5.1, arXiv v1 pp. 162–165 (ilo14 line 7486).)

For k = F_p and P = {p}: every F_p-variety has a separable projective p-power-degree alteration by a smooth F_p-variety with snc boundary.

*Needs:* §PA.6.1; §PA.3.7; §PA.5.6; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 6.4 Desingularization by char(X)-alterations

Let X be a scheme with a nowhere dense closed subset Z, admitting a morphism of finite type to a noetherian quasi-excellent scheme S with dim S ≤ 3. (i) If dim S ≤ 2, there is a projective char(X)-alteration b : X′ → X with X′ regular and b⁻¹(Z) an snc support. (ii) If S is separated, there is a char(X)-alteration b : X′ → X, proper but not necessarily projective, with X′ regular and b⁻¹(Z) an snc support. If S = Spec k with k perfect, b can moreover be chosen separable, and it is projective by (i).

Work under these precise hypotheses: X → S of finite type; S noetherian, quasi-excellent, dim S ≤ 3; Z ⊆ X nowhere dense closed; in (i) dim S ≤ 2; in (ii) S separated.

One proof route is as follows. Replace X by the disjoint union of its irreducible components with reduced structure (an alteration of X, so resolving it suffices) and treat each separately; each maps dominantly, hence maximally dominantly, to the closure of its image in S, which is again noetherian, quasi-excellent and of dimension ≤ 3. Then replace S by an open subscheme containing the image of X with char(S) = char(X): char(S) ∖ char(X) is finite for a dominant finite-type map (§PA.0.1), and take the complement of the fibres over those primes. Closures of images and open subschemes keep the hypotheses of (i) and of (ii). S is universally resolvable: in (i) in the projective sense (§PA.0.10 for dim S ≤ 1, §PA.0.11 for dim S ≤ 2), in (ii) in the proper sense (§PA.0.12); hence S is universally char(S)-resolvable in that sense. By §PA.6.2 with P = char(S) = char(X), X is universally char(X)-resolvable in the same sense; apply it to the alteration id_X. Over a perfect field use §PA.6.3.

(temkin17, Theorem 1.2.5, p. 99; proof §4.3.2, p. 124 (temkin17 line 108); temkin17, Remark 1.2.6(i), p. 99 (temkin17 line 108).)

**Checks.**

- For X = Spec Q[ε]/(ε²) and Z = ∅, reduction gives a projective degree-one alteration with regular source Spec Q. A degree-one alteration of nonreduced schemes need not be a modification.
- For X of finite type over S = Spec Z, dim S = 1 and (i) gives a projective char(X)-alteration whatever the dimension of X: the dimension bound is on S, not on X.
- For X of finite type over S = Spec Z_p[[u, v]], which is excellent, separated and of dimension three, only (ii) applies and b is proper; projectivity of b is not asserted there.

For integral X of finite type over Q, char(X) = ∅ and b is a projective modification; for general X it is a degree-one alteration of the reduced components. For X regular and Z an snc support, b = id works; for X a surface over F_p, b has p-power degree.

*Needs:* §PA.6.2; §PA.6.3; §PA.0.1; §PA.0.10; §PA.0.11; §PA.0.12; §PA.0.9.

### 6.5 Desingularization of morphisms by char(S)-alterations

Let f : X → S be a maximally dominating morphism of finite type, Z ⊆ X nowhere dense closed, X separated and S of finite type over a noetherian quasi-excellent scheme T of dimension at most three. (i) If dim T ≤ 2, there are char(S)-alterations a : S′ → S and b : X′ → X with regular sources, both projective, a quasi-projective f′ : X′ → S′ compatible with f, and snc supports W′ ⊆ S′, Z′ ⊆ X′ with Z′ = b⁻¹(Z) ∪ f′⁻¹(W′) and (X′, Z′) → (S′, W′) log smooth. (ii) If T is separated, the same holds with a and b char(S)-alterations that are proper but not necessarily projective. (iii) If S = Spec k with k perfect, a can be taken an isomorphism and b separable and projective. Without separatedness of X the same holds with f′ pseudo-projective.

Work under these precise hypotheses: f maximally dominating of finite type; X separated (otherwise f′ pseudo-projective); S of finite type over a noetherian quasi-excellent T with dim T ≤ 3; in (i) dim T ≤ 2; in (ii) T separated.

One proof route is as follows. S is universally char(S)-resolvable, in the projective sense under (i) and in the proper sense under (ii), by the argument of §PA.6.4 (Temkin §4.3.2): work componentwise, replace T by the closure of the image of S and then by an open subscheme containing it with char(T) = char(S); T is universally resolvable (§PA.0.10 and §PA.0.11 under (i), §PA.0.12 under (ii)), and §PA.6.2 applies to S → T with P = char(T). Apply §PA.6.1 with P = char(S), in its proper variant under (ii); f′ is pseudo-projective, and quasi-projective because X′ is separated, b being proper over the separated X (§PA.0.5). (iii) is §PA.6.3.

(temkin17, Theorem 1.2.9, p. 100; §4.3.3, p. 124 (temkin17 line 149).)

**Checks.**

- For k = F_p(t) and X = Spec k(t^(1/p)), take k′ = k(t^(1/p)) and X′ = Spec k′. Then X′ → X has degree 1 and X′ is smooth over k′. Over k, base change to an algebraic closure produces a nonzero nilpotent, so smoothness over k fails.
- For perfect k and X = A¹_k with empty boundary, S′ = Spec k and both alteration maps can be identities of degree 1.
- For k = Q and X = A²_k with axes boundary, the identity has characteristic chart 0 → ℕ² and a relative snc boundary over the unchanged base.

For S = Spec k and X a variety, (i) gives X′ smooth with relative snc boundary over each field component k′ of S′, by the local forms of PA.4. If k is perfect, (iii) permits S′ = Spec k.

*Needs:* §PA.6.1; §PA.6.2; §PA.6.3; §PA.0.12; §PA.0.5; §PA.6.4.

### 6.6 Refinement: char(X)-alterations of the source

In the situation of §PA.6.5, one may in addition require X′ to be a char(X)-alteration of a closed subscheme of X ×_S S′ (rather than only a char(S)-alteration of X), with a and b projective under the hypotheses of §PA.6.5(i) and proper under those of §PA.6.5(ii).

Work under these precise hypotheses: As in §PA.6.5.

The source-relative condition is part of this target: for every maximal point of X′ with field L, let F be the field of its image in X and E the field of its image in S′, in their specified embeddings into L. Then the field of the reduced scheme-theoretic image is the compositum F E ⊆ L, and [L:F E] must be a char(X)-number. This is a different degree from [L:F]. Prove this source-relative assertion along with the logarithmic induction of §PA.6.1, using the char(X) form of §PA.5.6 over the active open of the base and §PA.5.5a at each curve-base change. Temkin Remark 4.3.4 states this stronger target but gives only an outline; its last base-change step alone does not prove componentwise prime support. The target here includes the compositum degree assertion, rather than a general base-change preservation assertion.

(temkin17, Remark 4.3.4, p. 124 (temkin17 line 1121).)

If char(X) = char(S) the refinement is the theorem itself.

*Needs:* §PA.6.5; §PA.6.2; §PA.0.1; §PA.4.3; §PA.5.5a; §PA.5.6; Mathlib `AlgebraicGeometry.Scheme.Hom.image`.

### 6.7 Gabber's prime-to-ℓ alteration theorem over a field

Let k be a field, ℓ a prime different from char k, X a separated scheme of finite type over k and Z ⊆ X nowhere dense closed. Then there are a finite extension k′/k of degree prime to ℓ and a projective ℓ′-alteration h : X̃ → X over Spec k′ → Spec k, with X̃ smooth and quasi-projective over k′ and h⁻¹(Z) the support of a relative strict normal crossings divisor over k′.

Work under these precise hypotheses: k a field; ℓ ≠ char k; X separated of finite type over k; Z nowhere dense closed.

One proof route is as follows. Use the uniform equivariant construction of ILO X §§2.2–2.3, or the morphism theorem with P = {ℓ}′ and the field base, using its §PA.5.5a constants reduction before the relative-curve base changes. In the integral case one may select a component of the regular zero-dimensional base S′ = Spec k′. For reducible X use the simultaneous construction, retaining all target components; selecting one base component without a domination argument would lose surjectivity. The Cartier-boundary reduction makes h⁻¹(Z) a union of boundary components; the field local form gives smoothness and relative snc boundary. No common extension is justified merely by multiplying prime-to-ℓ degrees.

(ilo14, Exposé X, Theorem 2.1 and proof §2.3, arXiv v1 pp. 149–152 (ilo14 line 6790); ilo14, Exposé X, §3.5.3, arXiv v1 pp. 165–166 (ilo14 line 7691).)

Taking ℓ = 2 and k = F_3, every F_3-variety has an odd-degree alteration by a smooth variety over an odd-degree extension of F_3. If char k = 0 one may instead take P = ∅ in §PA.6.1 (char(Spec k) = ∅ and Spec k is universally resolvable), which gives k′ = k and generic degrees 1; for integral X, h is a projective modification.

*Needs:* §PA.6.1; §PA.6.2; §PA.0.9; §PA.4.8; §PA.0.4.

### 6.8 Gabber's prime-to-ℓ alteration theorem over a one-dimensional base

Let S be a separated integral noetherian excellent regular scheme of dimension one with generic point η, X a separated flat S-scheme of finite type, ℓ a prime invertible on S and Z ⊆ X nowhere dense closed. Then there are a finite extension η′/η of degree prime to ℓ, with S′ the normalization of S in η′, a projective ℓ′-alteration h : X̃ → X over S′ → S with X̃ regular and quasi-projective over S′, an snc divisor T̃ on X̃ and a finite set Σ of closed points of S′ such that: (i) outside Σ, X̃ → S′ is smooth and T̃ is a relative normal crossings divisor; (ii) étale-locally at every geometric point of a fibre over s′ ∈ Σ, (X̃, T̃) is (`S′[u^{±1}, t]/(u^b t^a − π)`, `V(t_{r+1} ⋯ t_m)`) with gcd(p, a, b) = 1 (§PA.4.8); (iii) h⁻¹(Z)_red is a sub-divisor of `⋃_{s′ ∈ Σ}` `(X̃_{s′})_red` ∪ T̃.

Work under these precise hypotheses: S separated integral noetherian excellent regular, dim S = 1; X separated flat of finite type over S; ℓ invertible on S.

One proof route is as follows. Use ILO X §§2.5–2.6, or the morphism theorem over the universally resolvable one-dimensional base with P = {ℓ}′, retaining its §PA.5.5a geometric-integrality condition in the curve step. For integral X choose a dominating component: the regular one-dimensional S′ is proper and quasi-finite over S, hence finite and the normalization in its generic field. For reducible X keep the simultaneous construction, not a component that misses an irreducible component of X. Set Σ to the finite vertical boundary and separate the horizontal divisor T̃ from the total logarithmic boundary; the chart of §PA.4.8 gives (i)–(iii).

(ilo14, Exposé X, Theorem 2.4 and proof §2.6, arXiv v1 pp. 152–155 (ilo14 line 6985); ilo14, Exposé X, §3.5.3, arXiv v1 pp. 165–166 (ilo14 line 7691).)

For S = Spec Z_p and ℓ ≠ p, the regular strict semistable model xy = p is already in the required local form with Σ = {(p)}, exponents (1,1) and empty horizontal boundary.

*Needs:* §PA.6.1; §PA.0.10; §PA.4.8; §PA.0.4.

### 6.9 Prime-to-ℓ alterations of varieties with snc boundary

Let X be separated and integral of finite type over a field L, ℓ a prime invertible in L and Y ⊂ X a proper closed subscheme. Then there are a finite extension L′/L of degree prime to ℓ, a connected smooth quasi-projective variety X′ over L′ and a proper surjective L-morphism π : X′ → X with L′(X′)/L(X) finite of degree prime to ℓ, such that π⁻¹(Y)_red is a strict normal crossings divisor on X′.

Work under these precise hypotheses: X separated integral of finite type over L; ℓ invertible in L; Y ⊊ X closed.

One proof route is as follows. Apply §PA.6.7 to X and Z = Y (nowhere dense since X is integral) and take a connected component X′ of X̃; it dominates X (h is maximally dominating) with degree prime to ℓ, π = `h|_{X′}` is proper and surjective, and π⁻¹(Y)_red is a union of components of the relative snc divisor. L′ := k′ has degree prime to ℓ; X′ is smooth and quasi-projective over L′.

(jannsen16, Theorem 2.11, p. 24 (jannsen16 line 1052); ilo14, Exposé X, Theorem 2.1, arXiv v1 p. 149 (ilo14 line 6790).)

For Y = ∅ the statement gives a smooth quasi-projective X′ of degree prime to ℓ over X. Jannsen's Hasse-principle proof restricts cohomology classes along π; injectivity of restriction on ℓ-primary coefficients is the reason for the degree condition.

*Needs:* §PA.6.7.

### 6.10 Odd-degree regular alterations of models over a henselian DVR

Let R be an excellent henselian discrete valuation ring with residue characteristic different from 2, S = Spec R, and X an integral projective flat S-scheme with nonempty generic fibre. Then there are a finite extension η′/Frac(R) of odd degree, with S′ the normalization of S in η′, and a projective alteration h : Y → X of odd degree with Y regular, integral and projective over S′ (and over S). No separability of η′/Frac(R) or of k(Y)/k(X) is asserted.

Work under these precise hypotheses: R excellent henselian DVR, residue characteristic ≠ 2; X integral projective flat over R with X_η ≠ ∅.

One proof route is as follows. 2 is invertible on S (it is a unit of R since the residue characteristic is not 2). Apply §PA.6.8 with ℓ = 2 and Z = ∅: η′/η of odd degree, S′ the normalization of S in η′ (a DVR: R is henselian), h : X̃ → X a projective 2′-alteration with X̃ regular and quasi-projective over S′. Take an integral component Y of X̃ (degree odd); Y is projective over S as h and X are, hence proper over the separated S′, and quasi-projective over S′, hence projective over S′.

(dp23, Proposition 3.4 and its proof, arXiv v2 pp. 8–9 (dp23 line 374); ilo14, Exposé X, Theorem 2.4 and proof 2.6, arXiv v1 pp. 152–155 (ilo14 line 6985).)

For X already regular, h = id and η′ = Frac(R). An alteration of even degree, such as the base change to a ramified quadratic extension, does not satisfy the conclusion: the odd-degree condition is what keeps mod-2 restriction maps injective.

*Needs:* §PA.6.8.

### 6.11 de Jong's equivariant (Galois) alteration theorem

Let k be an algebraically closed field, X a variety over k, G ⊆ Aut_k(X) a finite subgroup and Z ⊊ X a G-stable closed subset. There are an alteration φ₁ : X₁ → X, an open immersion j₁ : X₁ → X̄₁ and a finite subgroup G₁ ⊆ Aut X̄₁ such that: (i) G₁ preserves X₁, there is a surjection G₁ → G for which φ₁ is equivariant, and k(X)^G ⊆ `k(X₁)^{G₁}` is purely inseparable; (ii) X̄₁ is a projective nonsingular variety over k; (iii) j₁(φ₁⁻¹(Z)) ∪ (X̄₁ ∖ j₁(X₁)) is a G₁-strict normal crossings divisor. For G = 1 this makes φ₁ a Galois alteration in the sense of §PA.3.2.

Work under these precise hypotheses: k algebraically closed; X a variety over k; G finite; Z ⊊ X G-stable closed.

One proof route is as follows. Follow the proof of de Jong's Theorem 4.1 (SchemeAndStackFoundations §4.19) equivariantly: reduce to X projective, Z a divisor and X normal (dJ96 7.7–7.9). Apply the fibration lemma dJ96 4.11 to X/G and the branch locus, take the G-equivariant fibration of X, use dJ96 Lemma 4.13 for the three-point divisor, and the equivariant stable curve and nodal resolution steps (dJ96 7.10–7.16, SchemeAndStackFoundations §4.18), with G-strict normal crossings (dJ96 7.1–7.2).

(dejong96, Theorem 7.3, p. 88; proof 7.5–7.16, pp. 88–90 (dejong96 line 1447); temkin17, §1.1.1, p. 98 (temkin17 line 43).)

For G = 1 this is de Jong's Theorem 4.1 over an algebraically closed field with a Galois alteration.

*Needs:* §PA.3.2; §PA.3.1; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 6.11a Rumely's theorem: integral points after a finite extension

Let R be an excellent Dedekind ring with fraction field K such that (a) for every finite extension K′/K the Picard group of the integral closure of R in K′ is a torsion group, and (b) the residue field of R at every maximal ideal is algebraic over a finite field. Let B = Spec R and f : X → B a separated morphism of finite type with X irreducible, X_K geometrically irreducible over K and f surjective. Then there are a finite extension K′/K and a B-morphism Spec R′ → X, where R′ is the integral closure of R in K′; equivalently, X has an irreducible closed subscheme that is finite and surjective over B.

Work under these precise hypotheses: R excellent Dedekind with (a) and (b); f separated, of finite type and surjective; X irreducible with geometrically irreducible generic fibre.

One proof route is as follows. The equivalence of the two conclusions is the valuative criterion of properness in one direction and, in the other, the factorization of a point over the integral closure of R in an algebraic closure through a subring finite over R, whose image is closed because X is separated (moretbailly89 Lemma 1.3). For the existence, Moret-Bailly's proof reduces to X quasi-projective and integral by Chow's lemma (moretbailly89 1.10), then to relative dimension one by a Bertini argument (moretbailly89 Lemma 3.1.2), and chooses a relative compactification j : X → X̄ with X̄ normal, projective and flat over B (moretbailly89 §3.2, line 314). Moret-Bailly works on the normal surface X̄, where a positive multiple of every Weil divisor is Cartier because the local Picard groups at its finitely many singular points are torsion (moretbailly89 Lemma 3.3 and Théorème 2.8, lines 239 and 321), and names resolution of singularities as the alternative (moretbailly89 §1.11, line 116). Take that alternative. X̄ is excellent of dimension at most two, so §PA.0.11, with the identity alteration and Z = ∅, gives a regular scheme X̃ with a projective modification π : X̃ → X̄; X̃ is integral, since π is an isomorphism over a dense open of X̄ whose preimage is dense, and projective and flat over B. The generic fibre X̃_K → X̄_K is a proper birational morphism of integral curves onto the normal, hence regular, curve X̄_K, so it is an isomorphism and X̃_K is geometrically irreducible. The inverse image π⁻¹(X) is open and dense in X̃ and surjective over B, and a B-morphism Spec R′ → π⁻¹(X) composed with π is a B-morphism Spec R′ → X. It therefore suffices to prove the theorem for π⁻¹(X) ⊆ X̃; from here on X̄ denotes this regular model and X its open subscheme. On X̄ every Weil divisor is Cartier (the lemma below), and the pairing of a line bundle with a vertical integral curve C over a closed point b of B is the degree of its restriction to C, SchemeAndStackFoundations §5.9’s relative intersection pairing (moretbailly89 §3.5, line 345). The boundary Z = X̄ ∖ X has vertical part V containing no fibre, since X → B is surjective, and the fibres of X̄ → B are connected: X̄ is normal, so its Stein factorization (SchemeAndStackFoundations §4.9) is the spectrum of the integral closure of R in H⁰(X̄_K, O), a purely inseparable extension of K because X̄_K is geometrically irreducible, whose spectrum is a universal homeomorphism onto B. Hence the intersection form on the vertical divisors over a closed point, negative semidefinite with kernel spanned by the fibre, is negative definite on the divisors supported in V: this is Zariski's lemma, AlgebraicModuliForArithmeticGeometryPartII §4.6, applied over that Stein factorization through the reduction below (moretbailly89 §§3.5–3.6 and Lemma 3.7, lines 365 and 377). Steps I–VI then run on the regular model: extend a divisor of the ample H_K to a Weil, hence Cartier, divisor D on X̄, choose a vertical rational divisor A with (D + A) · C = 0 for every component C of V and positive on the other fibre components, which the nondegenerate form allows, and clear denominators to the Cartier divisor n₀(D + A) (Steps I–II); from negative definiteness obtain an effective Cartier divisor D₂ with support the whole boundary Z, a multiple of the horizontal part plus a divisor supported in V, with D₂ · C < 0 for every component C of V (Steps III–IV); thicken it to a Cartier divisor D₃ with Pic(nD₃) ≅ Pic(D₃) for all n > 0 by Serre vanishing on D₂ (Step V); and apply the boundary Picard theorem to the restriction of the adjusted line bundle to D₃, whose degree on every proper vertical component is zero, to make a positive power trivial there and extend a section of H_K (Step VI; moretbailly89 Proposition 3.8, lines 386–438). Rumely's original proof, for rings of algebraic integers, uses capacity theory.

(moretbailly89, Théorème 1.7 (Rumely), Lemma 1.3 and §§1.9–1.10, pp. 161–163 (moretbailly89 lines 42, 81, 89, 95); Théorème 2.3, p. 165 (moretbailly89 line 188); proof §3, pp. 168–172 (moretbailly89 line 291).)

For this regular-model route, Zariski's lemma is consumed from AlgebraicModuliForArithmeticGeometryPartII §4.6 and not restated; prove here only the reduction of the route to it. Let R′ = H⁰(X̄, O), the integral closure of R in K′ = H⁰(X̄_K, O), a purely inseparable finite extension of K by the geometric irreducibility of X̄_K. R′ is finite over R and a Dedekind domain because R is excellent (SchemeAndStackFoundations §0.20), B′ = Spec R′ → B is a universal homeomorphism, and f′ : X̄ → B′ is the Stein factorization of X̄ → B (SchemeAndStackFoundations §4.9), so that `O_{B′}` = f′_*O_X̄, and f′ is proper and flat, X̄ being integral and dominant over a Dedekind scheme. Let b′ be the unique point of B′ over the closed point b, d = [κ(b′) : κ(b)] its residue degree and e its ramification index. Then X̄_b = e `X̄_{b′}` as Cartier divisors, so the two fibres have the same components C_1, …, C_n with multiplicities differing by the factor e. For i ≠ j the local formula of SchemeAndStackFoundations §5.9 gives `(C_i · C_j)_b = d (C_i · C_j)_{b′}`, since every local term carries [κ(P) : κ(b)] = d [κ(P) : κ(b′)] times the same length; the self-intersections are determined from the off-diagonal entries by `(X̄_b · C_i)_b = 0` and `(X̄_{b′} · C_i)_{b′} = 0`, each the degree on C_i of a line bundle pulled back from a point, so they differ by the same factor d. The form over b is therefore d times the form over b′ on the vertical divisors over b, and §4.6 for f′ at b′ gives negative definiteness over b on the span of every proper subset of the components. For each closed point b the components of V over b form such a proper subset, because V contains no fibre. *Needs:* TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII §4.6 (Zariski's lemma); TauCetiRoadmap.SchemeAndStackFoundations §0.20 (finite normalization), §4.9 (Stein factorization) and §5.9 (relative intersection pairing and its local formula); TauCetiRoadmap.StableReduction Layer 4 (negative semidefinite intersection matrix); the geometric irreducibility of X̄_K established in the route above.

**Checks for the reduction.**

- The reduction needs K′ purely inseparable over K: for R′ the integral closure of a discrete valuation ring R in an unramified quadratic extension in which the closed point splits, X̄ = `P¹_{R′}` is regular, integral, proper and flat over Spec R with H⁰(X̄, O) = R′, but B′ has two points over b, the fibre X̄_b is two disjoint copies of P¹ with (C_i · C_i) = 0, and the form vanishes on the one-component subset {C_1}; the route excludes this through the geometric irreducibility of the generic fibre.
- The factor d is not 1 in general: for R = `F_p(s)[[t]]` and R′ = `F_p(s^{1/p})[[t]]`, so that e = 1 and d = p, let X̄ be the blow-up of `P¹_{R′}` at a κ(b′)-rational point of its special fibre, with fibre C + E. Over b′ the matrix is [[−1, 1], [1, −1]]; over b the node has [κ(P) : κ(b)] = p, so (C · E)_b = p, (C · C)_b = −p from (X̄_b · C)_b = 0, and the matrix is p · [[−1, 1], [1, −1]]. Both restrict to a negative number on {C}, while a reduction that forgot the residue degree would assign the b′-values to the pairing over b.
- The factor e changes multiplicities, not definiteness: for R = `F_p[[t]]`, R′ = `F_p[[t^{1/p}]]`, so that e = p and d = 1, and X̄ = `P¹_{R′}`, the fibre X̄_b = p `X̄_{b′}` has one component C of multiplicity p over b and 1 over b′, (C · C) = 0 over both, and the only proper subset of components is empty; the multiplicity vector of §4.6 is that of f′, not of X̄ → B, which is why only the definiteness statement and not the kernel vector is transported.
- On the blow-up of `P¹_R` at a κ(b)-rational point of its special fibre, over a discrete valuation ring R with uniformizer π, the model is Spec R[u, v]/(uv − π) near the node, K′ = K and d = e = 1, the fibre is C + E with matrix [[−1, 1], [1, −1]], and the form is −1 on either one-component subset and 0 on the whole fibre, as §4.6 states.

For this regular-model route, prove also the following lemma on Weil divisors. Let Y be a regular noetherian integral scheme of dimension at most two. Then every Weil divisor on Y is the divisor of a Cartier divisor, and SchemeAndStackFoundations §3.4’s `classGroup_picard_locallyFactorial` identifies Cl(Y) with Pic(Y). One proof route is as follows. It suffices that each prime divisor be locally principal at every point of its closure. At a point of codimension one the local ring is a discrete valuation ring, and the prime is generated by a uniformizer. At a closed point of codimension two the local ring A is regular of dimension two, hence Cohen–Macaulay of depth two (SchemeAndStackFoundations §§0.16–0.18); for a height-one prime p, the quotient A/p is a one-dimensional domain, of depth one, so `depth_shortExact` (§0.17) applied to 0 → p → A → A/p → 0 gives depth p = 2, and p is a maximal Cohen–Macaulay module, hence free by `IsRegularLocalRing.free_of_isCohenMacaulay` (PurityOfBranchLocus §0.3); a free ideal of a domain has rank one, because two elements a, b of it satisfy b·a − a·b = 0, so p = (a). Regular local rings of every dimension are factorial (stacks, More on Algebra, Lemma 15.123.2, Tag 0AG0 (stacks, More on Algebra line 17399)); only the two-dimensional case is proved and used here.

**Checks for the lemma.**

- On the normal cone Spec F₅[u, v, w]/(uw − v²) the Weil divisor D = V(u, v) is not Cartier at the vertex, while 2D = div(u): the local Picard group at the vertex is trivial and the class group is ℤ/2. The cone is not regular, so the lemma does not apply to it. On its blow-up at the vertex, a regular surface, the strict transform of D is Cartier: in the chart with coordinates w, y and v = wy, u = wy², it is V(y).
- On the blow-up of `P¹_R` at a κ(b)-rational point of its special fibre, a regular proper model over a discrete valuation ring R with uniformizer π which near its node is Spec R[u, v]/(uv − π), the two components V(u) and V(v) of the special fibre are there the Cartier divisors div(u) and div(v). Their intersection matrix is [[−1, 1], [1, −1]]: V(u) · V(v) = 1 at the node, and V(u) · (V(u) + V(v)) = V(u) · div(π) = 0 because the fibre is pulled back from the point. It is negative semidefinite with kernel spanned by the whole fibre, and its restriction (−1) to one component is negative definite.
- For a fibre with two components meeting transversally in two points the matrix is [[−2, 2], [2, −2]], with kernel spanned by the whole fibre and restriction (−2) to either component; a boundary V consisting of one component therefore pairs negative definitely, as the adjustment of Steps III–IV requires, while the whole fibre would not.
- For Y the spectrum of a discrete valuation ring, of dimension one, the only prime divisor is the closed point, generated by a uniformizer; class group and Picard group are both trivial and the codimension-two case of the route is empty.

For this compactification route, prove the following intermediate boundary theorem. Let R be a Dedekind ring satisfying condition (T), meaning exactly (a) and (b) above; excellence is not required for this intermediate theorem. Let Z be a separated finite-type B-scheme, each of whose irreducible components is either horizontal and quasi-finite over B or a vertical curve over a closed point of B. Define Pic⁰(Z) as the subgroup of Pic(Z) whose restriction has degree zero on every proper vertical integral component. Then Pic⁰(Z) is torsion: for every class L in it there exists n > 0 with L^⊗n trivial (moretbailly89 §§2.1–2.2 and Théorème 2.3, pp. 164–165, moretbailly89 lines 175–189). This includes nonreduced Z. For a square-zero ideal I, the identification 1 + I ≅ (I,+) and the units exact sequence give H¹(Z,I) → Pic(Z) → Pic(Z/I) → H²(Z,I). Apply this along a nilpotent filtration to reduce to Z_red, then use normalization and the horizontal and vertical component cases. For a proper normal vertical curve, viewed over its field of constants, degree-zero line bundles inject into the rational points of its Jacobian (SchemeAndStackFoundations §3.6); each point is defined over a finite field and therefore has finite order (moretbailly89 §§2.4–2.6, moretbailly89 lines 192–242). In the horizontal case, condition (T)(a) applies to integral closures even when they are not finite over R; finite normalization is used where the Nagata hypotheses hold. The boundary D₃ in Proposition 3.8 Step VI is such a Z: it is a Cartier thickening supported on horizontal finite schemes and proper vertical curves, not the whole relative surface.

The API of this subgroup records the following facts.

- Tensor product adds component degrees and inversion negates them, so zero degrees define a subgroup of Pic(Z).
- Only proper vertical components impose degree conditions; horizontal quasi-finite components are controlled by (T)(a).
- Every class in the subgroup has a positive tensor power trivial on Z, including its nilpotent structure; the exponent depends on the class.

**Checks for the boundary theorem.**

- For a vertical elliptic curve E/F₅ with y² = x³+x+1, the discriminant is −16(4+27) = 4 modulo 5, and the values of x³+x+1 for x = 0,1,2,3,4 are 1,3,1,1,4. There are 2,0,2,2,2 affine points, hence 9 with the point at infinity. Thus Pic⁰(E)(F₅) has order 9 and every class is torsion.
- For a vertical P¹_F₅ the degree map is Pic(P¹) ≅ ℤ. Its subgroup Pic⁰ is 0; O(1), of degree 1, has infinite order and is excluded. Degree zero is essential.
- Put R = O(E ∖ {O}) for that elliptic curve. The relative curve E × Spec R is a surface, with a horizontal component of relative dimension 1, so it is outside the boundary theorem. The generic-point section P gives O(P−O) of relative degree zero and infinite order: for n > 0, [n] has degree n² > 0 and cannot send the generic point of E constantly to O. Conditions (a) and (b) therefore do not make the degree-zero Picard group of a relative surface torsion.
- For the square-zero vertical thickening E × Spec F₅[ε]/(ε²), the kernel of Pic⁰(Z) → Pic⁰(E) is H¹(E,O_E) ≅ F₅, killed by 5, and Pic⁰(E) has order 9. Its classes are killed by 45, so reduction cannot be used to ignore the nilpotent structure.

*Needs for the boundary theorem:* TauCetiRoadmap.SchemeAndStackFoundations §§2.4, 2.6 and 2.11 (cohomological boundaries, quasi-coherent cohomology and Picard as first cohomology of the multiplicative group), Mathlib `AlgebraicGeometry.Scheme.Hom.normalization` and §0.20 (normalization and its finiteness under Nagata hypotheses), and §§3.3–3.4 and §3.6 (degree on proper curves, Picard groups and the Jacobian). The compactification route consumes this boundary theorem within §PA.6.11a.

**Checks.**

- The ring of integers of a number field, its localizations other than the field itself, and the coordinate ring of a smooth affine curve over a finite field satisfy (a) and (b) (moretbailly89 1.9): their class groups in finite extensions are finite and their residue fields finite.
- For X = Spec Z[1/2] → Spec Z, f is not surjective and no integral point exists over any R′: a morphism Spec R′ → Spec Z[1/2] over Spec Z would make 2 a unit in R′, but R′ has a maximal ideal over 2. Surjectivity cannot be dropped.
- For X = A¹_R the conclusion holds with K′ = K and the zero section; the hypotheses only matter when X has no section over R itself, as for the conic x² + y² = −1 over Z, which has points over Z[i].

*Needs:* the boundary theorem of §PA.6.11a; the reduction to Zariski's lemma and the Weil-divisor lemma of §PA.6.11a; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII §4.6 (Zariski's lemma); §PA.0.11 (the regular projective model); TauCetiRoadmap.SchemeAndStackFoundations §4.9 (Stein factorization), §§0.9, 0.16–0.21 (regular implies Cohen–Macaulay, `depth_shortExact`), §§2.4, 2.6, 2.11, §§3.3–3.4 (`classGroup_picard_locallyFactorial`), §3.6 and §5.9 (relative intersection pairing); TauCetiRoadmap.PurityOfBranchLocus §0.3 (`IsRegularLocalRing.free_of_isCohenMacaulay`); TauCetiRoadmap.StableReduction Layer 4 (negative semidefinite intersection matrix); TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20.

### 6.11b Sections and linear projections over a global Dedekind base

Let K be a global field, R ⊆ K a Dedekind ring with fraction field K and S = Spec R. Let X ⊆ P^N_S be a closed S-variety (integral, flat and projective over S) of relative dimension d ≥ 1 whose generic fibre is geometrically reduced and irreducible and whose smooth locus sm(X/S) is dense in every fibre of X → S. Then there is a finite extension of Dedekind schemes S′ → S such that X′ = X ×_S S′ has: (a) pairwise disjoint sections σ_1, …, σ_r : S′ → sm(X′/S′) such that every irreducible component of every fibre of X′ → S′ contains some σ_i(s′); (b) a finite morphism π : X′ → `P^d_{S′}`, the projection from a linear subspace of `P^N_{S′}` of relative dimension N − d − 1 disjoint from X′, which is étale along every σ_i and is étale over an open subscheme of `P^d_{S′}` that surjects onto S′.

Work under these precise hypotheses: K a global field; R ⊆ K Dedekind with fraction field K; X ⊆ P^N_S closed, integral, flat and projective over S, of relative dimension d ≥ 1, with geometrically reduced and irreducible generic fibre and sm(X/S) dense in every fibre.

One proof route is as follows. If R = K, sections over finite extensions are closed points of the smooth locus, and the projection exists over a finite extension because the open set of admissible linear subspaces is nonempty. Otherwise R is a localization of the ring of integers of K or of the coordinate ring of a smooth affine curve over a finite field, so R is excellent and satisfies the hypotheses of §PA.6.11a. Over a dense open U ⊆ S the fibres are geometrically irreducible; after a finite extension the geometric components of the finitely many other fibres are defined over their residue fields. For a component C of a fibre X_s, §PA.6.11a applied to sm(X/S) ∖ (X_s ∖ C), which is irreducible with geometrically irreducible generic fibre and surjective over S because sm(X/S) is dense in every fibre, gives a section through C after a finite extension; removing the images of the sections already chosen keeps these properties, since the fibres have positive dimension, so the sections can be taken pairwise disjoint. For (b), use the open subscheme V of full-rank (d+1)×(N+1) matrices whose projective kernels miss X and the projective tangent spaces along the σ_i. Every geometric fibre is a nonempty open subset of affine matrix space, hence geometrically irreducible: a general centre of dimension N−d−1 misses X and the finitely many tangent d-planes. Thus V is integral, its generic fibre is geometrically irreducible and it surjects onto S. §PA.6.11a supplies a matrix over a finite extension. Its specified surjection O^(N+1) → O^(d+1) defines the projection to P^d, with centre L the projectivization of the kernel. This projection is finite, since a positive-dimensional fibre would meet L, and étale at each σ_i, since it is unramified there between smooth schemes of the same relative dimension. Its non-étale locus meets each component of each fibre in a proper closed subset, because that component contains some σ_i(s′), so its image is a proper closed subset of each fibre of P^d, and the étale locus surjects onto S′.

(dejong96, §8.1 and §8.6, pp. 91–92 (dejong96 lines 1545, 1582); moretbailly89, Théorème 1.7 and §1.9, pp. 162–163 (moretbailly89 lines 81, 89).)

**Checks.**

- For R = Z[√−5] and I = (2,1+√−5), the quotient R³ → R⊕I has determinant class [I] ≠ 0 in Cl(R) = C₂. It supplies a projective-bundle target P(R⊕I), with no identification with P¹_R. A framed matrix quotient instead has determinant class 0 and targets P¹_R by its specified basis.
- For N = d, the identity (d+1)×(d+1) matrix is admissible, its kernel is 0 and its projective centre is empty. The projection has degree 1 and is étale everywhere.
- On a fibre with two components, sections meeting both force an étale point on each. The non-étale locus has dimension at most d−1 on each, so its finite image cannot fill the target fibre of dimension d.

For X = P^d_S with its standard embedding (N = d), the linear subspace is empty, π is the identity, one section suffices because every fibre is irreducible, and S′ = S.

*Needs:* §PA.6.11a; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; TauCetiRoadmap.StableReduction Layer 2.

### 6.12 de Jong's alteration theorem over a Dedekind base

Let K be a global field, R ⊆ K a Dedekind ring with fraction field K and S = Spec R; let X be an S-variety (integral, separated, flat and of finite type over S) and Z ⊊ X closed. There are a finite extension of Dedekind schemes S₁ → S (S₁ = Spec of the integral closure of R in a finite K₁/K), an alteration φ₁ : X₁ → X over S₁ → S and an open immersion j₁ : X₁ → X̄₁ with X̄₁ projective over S₁ such that X̄₁ is regular, j₁(φ₁⁻¹(Z)) ∪ (X̄₁ ∖ j₁(X₁)) is a strict normal crossings divisor, over a nonempty open U₁ ⊆ S₁ the scheme X̄₁ is smooth and this boundary is a relative normal crossings divisor, and for s₁ ∉ U₁ the pair (X̄₁, boundary ∪ X̄₁,s₁) is strict semistable over the completion of S₁ at s₁.

Work under these precise hypotheses: K a global field; R ⊆ K Dedekind with fraction field K; X an S-variety; Z ⊊ X closed.

One proof route is as follows. Reduce to X projective over S with Z the support of a divisor by Chow's lemma and blowing up Z, then make the generic fibre geometrically reduced and irreducible by a finite extension of K (dJ96 8.3–8.4). At the finitely many bad points choose finite extensions of the completed DVRs making the normalized special fibres generically reduced, and realise them all by one finite extension K′/K, which exists because K is a global field (dJ96 8.5). Then §PA.6.11b gives, after a further finite extension of the base, pairwise disjoint sections through the smooth locus meeting every component of every fibre and a finite projection to P^d_S étale over an open subscheme surjecting onto S (dJ96 8.6); §PA.6.11a gives a section of that étale locus over a finite extension, and the fibration and semistable-curve argument follows the trait case (dJ96 8.7–8.8, as in dJ96 6.13–6.16; SchemeAndStackFoundations §§4.18–4.20).

(dejong96, §8.1 and Theorem 8.2, p. 91; proof 8.3–8.8, pp. 91–92 (dejong96 lines 1551, 1582, 1604); temkin17, §1.1.1, p. 98 (temkin17 line 43).)

For X smooth projective over S with Z = ∅, S₁ = S and φ₁ = id work.

*Needs:* TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; §PA.0.3; §PA.6.11a; §PA.6.11b.

### Examples

For X regular and Z snc the identity has degree 1. Over Q, char(X) = ∅ and an integral resolving alteration has degree 1. Over F₃, a char(X)-alteration has degree 3^n, hence odd; over a henselian trait with residue characteristic 3, the ℓ = 2 theorem also has odd degree without asserting separability (temkin17 line 108; ilo14 line 6985; dp23 line 374).

### Dependencies

The statements and routes use SchemeAndStackFoundations §§0.16–0.18, §§2.4, 2.6, 2.11, §§3.3–3.4, §3.6, §4.9 and §5.9; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII §4.6; TauCetiRoadmap.PurityOfBranchLocus §0.3; TauCetiRoadmap.StableReduction Layer 4; the boundary theorem of §PA.6.11a; §PA.5.5a; §PA.0.1; §PA.0.10; §PA.0.11; §PA.0.12; §PA.0.3; §PA.0.4; §PA.0.5; §PA.0.7; §PA.0.8; §PA.0.9; §PA.3.1; §PA.3.2; §PA.3.7; §PA.4.8; §PA.4.3; §PA.4.7; §PA.5.6; TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.2 (Log fiber products); TauCetiRoadmap.CrystallineCohomology CR.5:log-algebra.4 (Log smoothness over log regular schemes); TauCetiRoadmap.SchemeAndStackFoundations §0.9, noetherian approximation and finite-presentation descent; TauCetiRoadmap.SchemeAndStackFoundations §§4.11–4.20; §PA.6.11a; §PA.6.11b; TauCetiRoadmap.StableReduction Layer 2.

## Downstream consumers

Jannsen’s Hasse-principle argument for higher-dimensional fields consumes the prime-to-ℓ variety alteration of §PA.6.9. LogicAndDefinabilityInNumberTheoryPartII §2.1 consumes the odd-degree regular model of §PA.6.10 for Dittmann–Pop’s Pfister-form argument. EtaleDualityAndPerverseSheavesPartII Layers EQ.0, EQ.2 and EQ.6 consume the alteration geometry with its precise coefficient and boundary hypotheses. These are outgoing interfaces: no theorem from those consumers is a prerequisite of the geometric construction here.

## Worked examples

For X = A²_k, Z = {0}, the identity and the enlarged boundary V(xy) give log smoothness over k but do not make the inverse image of Z a divisor: its codimension is 2. Blowing up Z first gives an exceptional P¹ of codimension 1; in the chart y = xv its support is x = 0. When a subsequent regular alteration carries this Cartier support into an snc boundary, the inverse image is a union of boundary components. This is the exact-boundary argument used both in the morphism theorem and in inheritance of resolvability (ilo14 X proof of Theorem 3.5, Step 3, p. 163, ilo14 line 7530).

For the A₁ toric surface uw = v², blowing up the monoidal ideal (u,w) has chart v² = u²s with s = w/u. The element v/u satisfies z² = s and is integral over the chart ring, but is not in it. Saturation adjoins z = v/u, producing the regular chart k[u,z], with v = uz and w = uz². Thus the ordinary and normalized blow-ups differ, even when the starting toric scheme is normal (ilo14 VIII Lemmas 3.4.3 and 3.4.6, pp. 110–111, ilo14 lines 4910, 4937).

For an excellent henselian DVR R with residue characteristic 3 and integral projective flat X/R, the ℓ = 2 theorem yields generic degrees 2m+1, so multiplication by the degree acts as 1 on Z/2. A ramified quadratic base change has degree 2 and multiplication by the degree acts as 0 on Z/2; it cannot replace that alteration in the restriction–trace argument. Odd degree does not imply a separable function-field extension in positive characteristic (ilo14 X Theorem 2.4, pp. 152–155, ilo14 line 6985; dp23 proof of Proposition 3.4, pp. 8–9, dp23 line 374).

## References

- temkin17: Michael Temkin, *Tame distillation and desingularization by p-alterations*, Annals of Mathematics 186 (2017), 97–126, Theorems 1.2.5, 1.2.9, 3.2.12, 3.3.6, 4.2.1 and 4.3.1. [Open journal text](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf).
- ilo14: Luc Illusie, Yves Laszlo and Fabrice Orgogozo, editors, *Travaux de Gabber sur l’uniformisation locale et la cohomologie étale des schémas quasi-excellents*, Astérisque 363–364 (2014); [arXiv:1207.3648v1](https://arxiv.org/abs/1207.3648v1), Exposés VI, VIII and X, cited by this version’s internal pages 69–170.
- temkin10: Michael Temkin, *Stable modification of relative curves*, Journal of Algebraic Geometry 19 (2010), 603–677; [arXiv:0707.3953v3](https://arxiv.org/abs/0707.3953v3), Theorems 1.1, 1.2, 1.5, 2.1.8, 2.1.10 and 6.3.1, Corollaries 1.3–1.6, Assumption 6.2.1, §§2.1–2.2, 3.2 and 6.1–6.3, pp. 2–17 and 36–51.
- dejong96: A. J. de Jong, *Smoothness, semi-stability and alterations*, Publications Mathématiques de l’IHÉS 83 (1996), 51–93, Theorem 7.3 and §§7.5–7.16, §8.1, Theorem 8.2 and §§8.3–8.8, pp. 87–92. [Numdam](https://www.numdam.org/item/PMIHES_1996__83__51_0/).
- moretbailly89: Laurent Moret-Bailly, *Groupes de Picard et problèmes de Skolem. I*, Annales scientifiques de l’École normale supérieure (4) 22 (1989), 161–179, Théorème 1.7 (Rumely), Lemme 1.3, Théorème 2.3 and §3. [Numdam](https://www.numdam.org/item/ASENS_1989_4_22_2_161_0/).
- cp19: Vincent Cossart and Olivier Piltant, *Resolution of singularities of arithmetical threefolds*, Journal of Algebra 529 (2019), 268–535; [arXiv:1412.0868v2](https://arxiv.org/abs/1412.0868v2), Theorem 1.1, Corollaries 1.2–1.3 and Remark 1.4, pp. 3–4.
- cjs: Vincent Cossart, Uwe Jannsen and Shuji Saito, *Canonical embedded and non-embedded resolution of singularities for excellent two-dimensional schemes*, [arXiv:0905.2191v2](https://arxiv.org/abs/0905.2191v2), Theorems 0.1–0.3 and Corollary 0.4, pp. 3–5; published in *Desingularization: invariants and strategy*, Lecture Notes in Mathematics 2270 (2020).
- dp23: Philip Dittmann and Florian Pop, *Characterizing finitely generated fields by a single field axiom*, Annals of Mathematics 198 (2023), 1203–1227; [arXiv:2012.01307v2](https://arxiv.org/abs/2012.01307v2), Proposition 3.4 and its proof, pp. 8–9.
- jannsen16: Uwe Jannsen, *Hasse principles for higher-dimensional fields*, Annals of Mathematics 183 (2016), 1–71, Theorem 2.11 and its application, p. 24. [Open journal text](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf).
- stacks: The Stacks project authors, *The Stacks project*, tags [081R](https://stacks.math.columbia.edu/tag/081R), [0815](https://stacks.math.columbia.edu/tag/0815), [052A](https://stacks.math.columbia.edu/tag/052A), [0AVK](https://stacks.math.columbia.edu/tag/0AVK), [0C45](https://stacks.math.columbia.edu/tag/0C45), [0BI4](https://stacks.math.columbia.edu/tag/0BI4) and [05K0](https://stacks.math.columbia.edu/tag/05K0); Resolution of Surfaces [0BGP](https://stacks.math.columbia.edu/tag/0BGP), [0BBS](https://stacks.math.columbia.edu/tag/0BBS) and [0BGL](https://stacks.math.columbia.edu/tag/0BGL); Fields [037J](https://stacks.math.columbia.edu/tag/037J), Varieties [04KV](https://stacks.math.columbia.edu/tag/04KV), [020H](https://stacks.math.columbia.edu/tag/020H), and More on Algebra [0AG0](https://stacks.math.columbia.edu/tag/0AG0). For the chapter extractions, line locators are qualified by chapter: More on Flatness lines 4197 and 4250 give 0815 and 081R, and More on Algebra line 17399 gives 0AG0.
