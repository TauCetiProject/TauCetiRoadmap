# Roadmap: endoscopic transfer and unitary trace comparison

**Summary.** Build the arithmetic invariants of stable conjugacy, normalized endoscopic transfer, the geometric fundamental lemma, and the simple stable and twisted unitary trace identities. Use these to stabilize rational Igusa traces, construct a trace-defined parameter for general linear groups, and identify it with the supplied classical correspondence, including monodromy and inner forms. A separate tower comparison identifies the actual supercuspidal cohomology with the classical parameter. The final interfaces supply pure automorphic transfer and rational Igusa spectral comparison with their signs, measures, half twists and action conventions intact.

## Scope and ownership

The local harmonic theory concerns characteristic-zero local fields; the equal-characteristic geometric argument concerns reductive groups over a finite-field curve and its Laurent-series completions. This roadmap owns the arithmetic stable-class invariants, endoscopic data and factors, orbital matching, Hitchin-specific geometry and support arguments, fundamental-lemma reductions, stable elliptic coefficients, the unitary twisted comparison, algebraic isocrystals with additional structure, and the geometry and counting of rational Igusa correspondences. It also owns the trace-defined GL parameter and its identification with the supplied classical correspondence, its segment-to-monodromy adapter, the classical inner-form character comparison, the local-tower realization, pure automorphic packet comparisons, and the rational signed trace export.

### Prerequisites and boundaries

Existing theories are consumed with their original carriers. `TauCetiRoadmap.ReductiveGroups` Layers 7 and 9 and `ReductiveGroupsPartII` RG2.1, RG2.3 and RG2.5 own reductive structure, pinned forms, root data, central extensions, the algebraic fundamental group, the group-valued Kottwitz homomorphism, Bruhat–Tits and dual-group theory. `PadicHodgeTheory` §5.5 owns the minimal `σ`-conjugacy quotient `B(G)`, its Newton and Kottwitz maps, admissibility and `localTorsorKottwitz` over finite extensions of `ℚ_p`. Sections 1.11, 7.2 and 7.4 compare and extend these supplied objects; the Kottwitz homomorphism on rational group points keeps its original owner.

`TauCetiRoadmap.ProfiniteCohomology` Layers 5, 9 and 10 and `ArithmeticGaloisDuality` D7 own continuous abelian cochains, exactness, the Galois interface and duality. `SchemeAndStackFoundations` §1.24 owns the category of crossed modules. Layer 1 adds nonabelian coefficient cohomology and its reductive abelianization; it does not construct a second continuous abelian-cohomology theory. `ClassFieldTheory` Layers 2, 7, 9 and 11 own class formations, abstract Tate–Nakayama, the local Artin map, the local Weil group and global reciprocity. `GL2AutomorphicRepresentationsAndTransfer` §R17.5.0 owns the general global Weil extensions, group, localization and character comparison. The torus pairings below specialize the class-formation input to reductive stable-class invariants; §1.3a fixes the supplied global Weil input for endoscopy.

`TauCetiRoadmap.AdelicAlgebraicGroups` AA.2 owns adelic and Tamagawa measures, quotient integration and continuous central-character extension. `GlobalNumberFields` Layers 9–10 owns algebraic Hecke characters and infinity types. Layer 6 retains only the chosen CM extension character's ramification set and parity adapter needed by the `L`-embeddings; it does not repeat either general character-extension theorem or the classification of complex characters.

`TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` SR.0–SR.5 owns smooth and finite-length categories, normalized induction and Jacquet functors, Bernstein components, the conditional Langlands standard quotient and the Iwahori block. It also supplies SR.5.2’s segment and multisegment classification with both `Z/L` conventions (*segment-representations*), and SR.5.3’s Zelevinsky involution and endpoint-shortening derivative formula (*highest-derivative-adapter*). Those classifications have no duplicate sections or declarations here. Layer 10 uses their essentially square-integrable segment constituent to attach a special Weil–Deligne block. Ladder classification and the full Tadić unitary dual are outside this scope. AutomorphicLFunctionsAndLocalFactors AL.2, **Generic finite-place newforms**, including its **GL₂ newvectors** input, supplies the all-rank generic newvector/conductor theorem. Sections 10.16–10.17 own its application to integral Weil multiplicities and the particular compact-type separator needed for the trace construction. ReductiveGroupsPartII §RG2.3.7 supplies `H¹` of connected smooth reductive integral models and §RG2.4.2 (*kottwitz-quotient*, *kottwitz-rational-surjectivity*) supplies the rational Kottwitz-kernel and surjectivity theorem; these are used without new targets. SR.5.2 (*classical-llc-normalization*) states the classical `GL_n` correspondence rec, the Weil–Deligne functor and the Breuil–Schneider normalization as an input theorem of that roadmap, with local reciprocity sending a uniformizer to arithmetic Frobenius. The classical bijection and its inverse are imported, not new targets here. Write `C_ar(π)` for that inverse and `C_geo(π)=C_ar(π)^∨` for its geometric-reciprocity transport; equivalently `C_ar(π^∨)`, with the classical duality property. Layer 10 constructs a separate trace-defined map, with the new target of identifying it with `C_geo`. No inverse map on the nonabelian Weil group is used: the dual is the algebraic operation `(r^∨,−N^t)`. For an unramified character `χ` with `χ(ϖ)=z, C_ar(χ)(Φ_ar)=z`, while `C_geo(χ)(Φ_geo)=z`; this rank-one witness fixes the transport.

`SmoothRepresentationsOfLocalGroups` SR.5.2 owns the common raw Weil–Deligne fields, special pairs, duals, direct sums and Frobenius semisimplification. `ArithmeticGaloisRepresentations` Layers 1–3 owns the `ContinuousRep` arithmetic adapter, local Euler/`ε` factors and Artin–Deligne conductors; its §2.6 supplies the Frobenius-semisimple decomposition into irreducible Weil special blocks. `AutomorphicLFunctionsAndLocalFactors` AL.1 and AL.3 owns the Tate normalization and analytic factors. Layer 10 compares those objects with representations of GL groups, without redefining the arithmetic factors or inferring monodromy from semisimple traces. Full local–global monodromy compatibility and any comparison with an excursion parameter are downstream consumers.

The general sheaf theory belongs to `EtaleCohomologyFoundations` §§F.0–F.8, `DeligneWeightsAndPurity` DWP.8, `LefschetzPencilsAndVanishingCycles` LPV.6, `ClassicalAdicEtaleCohomology` Layers 1–5, `DiamondSixOperations` S2 and `AdicCoefficientsAndComparisons` L0. Their scheme duality, perverse `t`-structures, purity and torsion nearby cycles are used unchanged. `EtaleDualityAndPerverseSheaves` §§5.6, 5.8 and 6.1–6.5 owns scheme pure decomposition, relative hard Lefschetz, cohomological correspondences and Frobenius-twisted traces. Sections 3.14a and 7.10a use its carriers and hypotheses for the Hitchin and Igusa applications. §§3.15–3.18 construct the Deligne–Mumford and perverse trace applications; §§10.4, 12.12–12.13 construct the `ℓ`-adic and equivariant analytic comparisons for these towers.

`TauCetiRoadmap.AlgebraicCurves` Layers 4–5 and 12 owns repartitions, Riemann–Roch, the completion comparison and the curve/function-field dictionary. The early curve-bundle and local-loop instances below provide only what the Hitchin argument uses, without a global-shtuka or function-field Langlands dependency. `AlgebraicModuliForArithmeticGeometry` and `SchemeAndStackFoundations` own the general algebraicity and descent criteria used for these instances.

`PELModuli` M0–M4 and `AbelianSchemesAndArithmeticModuli` own PEL carriers, universal abelian schemes, determinant conditions and canonical-model comparison. `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1–R07.2 owns `p`-divisible groups and Dieudonné theory. The Igusa liftability, structured slope data, special formal-module deformation instances and raw compact-unitary cohomology needed here are specified separately at the exact scope used. Rational alternating Igusa cohomology and its group action occur before counting. Compactified Igusa fibres, torsion concentration, positivity, integral lattices, and general relative Rapoport–Zink spaces are downstream theory.

`TauCetiRoadmap.AdicSpaces` Layer 6 owns the adic Fargues–Fontaine curve for `E=ℚ_p`, its period annuli and quotient sheaf. For `E=ℚ_p`, Tau Ceti supplies the Frobenius orbit topology through `TauCeti.FarguesFontaine.spaX`, `quotientMap`, `quotientMap_eq_iff` and `isOpenQuotientMap_quotientMap`; this topological API alone supplies neither a sheaf of complete rings nor an untilt divisor. `PerfectoidSpaces` Layers P1–P5, P7 and `DiamondsAndVStacks` D6 own marked untilts, tilting, limits and the analytic diamond functor. `PadicHodgeTheory` §7.5 owns the relative `ℚ_p` and unramified chartwise period rings, annuli, curve and untilt divisor, with rational-localization and pullback descent. Layer 12 compares that interface with its finite-`E` construction in §12.1, retaining the ramified coefficient extension, marked Frobenius transport and `GL/EL` modification chart. The `ℚ_p` quotient construction and the fixed-field diamond/site comparison are reused. General Hecke stacks and local shtukas are downstream consumers of this particular fibre.

`AutomorphicSpectralTheory` AS.6.9 owns the semisimple group orbital integral `O_γ`, its discriminant normalization `J_γ=|D(γ)|^{1/2}O_γ`, invariance, convergence and measure scaling. AS.6.18–AS.6.19 owns discrete-series pseudo-coefficients and the Euler–Poincaré trace-function existence theorem. Those definitions and existence theorems have no new aliases or targets here. The additional targets are disconnected-centralizer normalization, stable transport, Lie-algebra descent and the explicit averaged/elliptic Euler–Poincaré formulas.

`ArithmeticLocallySymmetricSpaces` §§ALS.F.5–ALS.F.7 and ALS.5b, `AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, and `AutomorphicSpectralTheory` §§0.48–0.50, AS.4 and AS.6 own relative Lie-algebra cohomology, automorphic spaces, archimedean GL parameters, Eisenstein series and invariant spectral expansions. AutomorphicSpectralTheory §4.14a owns the number-field residual index, Speh representations, existence, uniqueness and multiplicity-one classification, with arbitrary ramification. Layer 5 consumes that contract with its original indices and representations for the endoscopic spectral labels; the trace-comparison and transfer applications belong here. The generic pure-inner unitary classification and the `GSp₄` general-type comparison are conditional on two separate contracts, the unitary classification contract (§§11.0d–11.0e) and the symplectic classification contract (§§11.0g–11.0h); the latter is not deduced from a unitary theorem.

## Conventions

For local harmonic analysis, `F` is a finite extension of `ℚ_p, q` is its residue cardinality, and coefficients are complex unless an `ℓ`-adic realization is specified. Compact open Haar idempotents are `1_K/vol(K)`. Fix quotient measures, maximal-compact volume one where stated, the global Tamagawa measure, the positive real split centre, and a nontrivial additive character `ψ` with its self-dual additive measure. Central-character functions are compact modulo the stated centre rather than necessarily compact on the whole group.

Ordinary orbital integrals are `O_γ(f)`; discriminant-normalized ones are `J_γ(f)=|D^G(γ)|^(1/2) O_γ(f)`. Transfer factors, Weyl integration and normalized constant terms retain this distinction. Stable sums track rational classes through the relevant `H¹` kernel and retain disconnected-centralizer and component factors. Connectedness of a centralizer alone never identifies stable and rational conjugacy.

Geometric Frobenius `Φ` has absolute value `ω(Φ)=q⁻¹`; arithmetic Frobenius has value `q`. Arithmetic degree assigns `deg(Φ)=−1`. Geometric reciprocity sends a uniformizer to `Φ` in the abelianized Weil group; replacing arithmetic reciprocity by geometric reciprocity uses inversion on that abelianization, not an inversion homomorphism on a nonabelian Weil group. Fix the positive square root of `q`. A Tate twist by 1 has geometric eigenvalue `q⁻¹`.

Normalized induction uses `δ_P^(1/2)`. Write `ν=|det|`. Write `rec_un` for Scholze's unnormalized trace parameter; its unitary normalization is `σ_ss(π)=rec_un(π)` tensor `ω^((1−n)/2)`. In the raw special block `Sp(k), r(w)e_i=ω(w)^i e_i, N e_i=e_(i+1)`, and `N e_(k−1)=0`. Thus `r(w) N r(w)⁻¹=ω(w) N`. Unitary `St_n` has parameter `ω^((1−n)/2) Sp(n)`. The `L`-factor uses `(ker N)^I`; epsilon factors and conductors retain the Deligne monodromy correction. Frobenius semisimplification retains `N`, whereas categorical semisimplification removes it.

For unitary base change the involution is inverse conjugate transpose with the chosen antidiagonal form. The CM auxiliary character and every half twist remain part of the `L`-embedding. The simple geometric comparison assumes `[F^+:ℚ]>1` and its specified Lefschetz infinity function. Proper geometric Levi terms vanish under that criterion; proper spectral Levi terms can remain. The stable coefficient is `ι(G,H)=τ(G)/(τ(H) |Out(H,s,η)|)`. Equal nonzero blocks contribute an outer-automorphism factor `1/2`; the stable coefficient retains `τ(G)/τ(H)`. For `G₄` and `G₂,₂` it is `1/4`. The coefficient `ε=1/2` in the stable-to-twisted Igusa formula appears after cancelling `τ(H)`. This is distinct from the twisted spectral determinant factor `2^(−r)`.

For the equal-characteristic geometry, `k` is finite, `X/k` is smooth projective and geometrically connected, and `char(k)` does not divide the Weyl-group order. The line bundle `D` is arbitrary for the Hitchin carrier; degree, square-root and anisotropic assumptions appear on each result. Waldspurger's characteristic-transfer bound is a separate sufficiently-large-characteristic hypothesis.

Hyperspecial transfer over characteristic-zero local fields uses the all-residue-characteristic spherical theorem of §4.10a, including residue characteristics 2 and 3. The geometric and change-of-characteristic bounds in §§4.3–4.6 and §4.10 remain hypotheses of those intermediate results. The finite nonspherical sets `S`, `S_pf`, `Σ_min` and `Σ_lr` retain their ramification and level hypotheses at each use; no extra small-prime set is imposed. At places requiring small transferable levels use §6.14. At an unramified place with a chosen hyperspecial level retain that level and apply §4.10a. The distinguished split prime `p` in the rational Igusa branch uses its GL-product transfer.

In PEL Dieudonné comparison, record contravariant and covariant conventions separately. Acceptability orders slopes decreasingly and compares every eigenvalue across two distinct slope blocks. Scalar translation first clears inverse denominators; a negative central Frobenius shift then gives the monoid and slope conditions. Neither step substitutes for the other. For SW20's covariant height-`n` formal module, `b` lies in `B(GL_n,μ⁻¹)`, its Newton slope is `−1/n`, and the associated bundle in the modification exact sequence has degree `+1`. §12.22 states the Fargues–Scholze basic-Hecke calculations in their two native orientations, with their own source-torsor actions.

For a right geometric action, `r_(gh)=r_h∘r_g`, so direct pullback `g↦r_g*` gives a left representation on cohomology. For a left geometric action `a`, use inverse pullback `g↦a_(g⁻¹)*`. Frame inversion in §7.3 identifies these conventions. Keep the `GL_n`, division-algebra and Weil actions, the central quotient, contragredients and Tate twist in the same comparison. In Dat's convention, a tensor sector with right action `v·d=d⁻¹v` selects the dual division-algebra representation. Rational Grothendieck classes are signed alternating classes; a finite trace factorization proves virtual support and does not imply concentration or positivity.

`Suggested.lean` has no headline signatures: the pinned libraries lack the stable-class, endoscopic, Hitchin, automorphic, Igusa and tower-cohomology objects needed to state them. Its module docstring identifies the missing objects for each group of layers. The baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

## Exact supplier contracts

Each external input below is used only at the scope its roadmap states. The additional results specific to endoscopy, strict deformation spaces and local towers are numbered targets of this roadmap; their points of use are given alongside the external input.

### From Mathlib and Tau Ceti

- Mathlib `Matrix.charpoly`: The determinant of the characteristic matrix `tI−M`; detects equality of underlying Weil characteristic polynomials without determining N.
- Mathlib `Matrix.charpoly_monic`: The characteristic polynomial of a square matrix is monic, so `χ` lands in monic polynomials of degree `n`, an affine space of dimension `n`.
- Mathlib `Polynomial.discr`: The discriminant of a polynomial (via the Sylvester matrix of `f` and `f′`, with the standard sign); for `GL_n` the discriminant divisor of `𝔠` is the vanishing locus of the discriminant of the characteristic polynomial.
- Mathlib `MeasureTheory.Measure.IsHaarMeasure`: Left invariance, finiteness on compact sets and positivity on nonempty open sets. Quotient and Tamagawa measures are separate; regularity is separate unless supplied by local-group hypotheses.
- Mathlib `LaurentSeries`: Formal Laurent series `R`⸨`X`⸩ `= R`⟦`ℤ`⟧ (Hahn series with integer exponents); for a field `k, k((ε))` is the equal-characteristic local field of affine Springer fibres.
- Mathlib `PowerSeries`: Formal power series `k`⟦`ε`⟧, the ring `𝒪_v` of the equal-characteristic local field; lattices in `k((ε))^n` are finitely generated `k`⟦`ε`⟧-submodules spanning.
- Mathlib `Matrix.IsHermitian`: Hermitian matrices `(A^H = A)` over a star ring; with the conjugation of `E/F, Herm(V)` for the standard hermitian form.
- Mathlib `WittVector.Isocrystal`: A module over Frac`(W(k))` with a bijective Frobenius-semilinear operator, for perfect integral-domain `k`. Finite dimension is an additional hypothesis.
- Mathlib `WittVector.IsocrystalEquiv`: A linear equivalence commuting with the two isocrystal Frobenius operators.
- Mathlib `WittVector.StandardOneDimIsocrystal`: The one-dimensional carrier with Frobenius `p^m` times Witt Frobenius, `m` an integer.
- Mathlib `WittVector.isocrystal_classification`: For algebraically closed `k`, every isocrystal of finrank one is equivalent to a standard integral-slope isocrystal. This does not classify arbitrary finite rank or `G`-structure.
- Mathlib `AlgebraicGeometry.Scheme`: Locally ringed spaces locally isomorphic to an affine spectrum; a scheme carrier, without an Igusa moduli functor or `l`-adic six operations.
- Mathlib `AlgebraicGeometry.IsFinite.of_comp`: If `f ≫ g` is finite and `g` is separated, then `f` is finite; §8.2 applies it to the Igusa quotient leg and a complementary monoid map.
- Mathlib `Matrix.vandermonde`: Finite matrix whose `(i,j)`-entry is `v_i^j`.
- Mathlib `Matrix.det_vandermonde`: The product formula `det(V)=`product over `i<j` of `(v_j−v_i)`, over a commutative ring.
- Mathlib `Matrix.eq_zero_of_forall_pow_sum_mul_pow_eq_zero`: over a domain, distinct bases and vanishing power sums at exponents `0,…,n−1` force zero coefficients. For eventual vanishing, reindex the finite family and shift to coefficients `c_i α_i^M` for an exponent `M` in the eventual range; nonzero bases allow cancellation of `α_i^M`.
- Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti.AlgebraicGeometry.AbelianVariety.Basic`): A proper geometrically integral group scheme over a field, with derived smoothness, commutativity and geometric connectedness. This is an existing carrier, not finite-field Tate full faithfulness or Honda existence.
- Mathlib `Matrix.diagonal`: The matrix with prescribed diagonal and zero off the diagonal, used in the two-dimensional special-block regression.
- Mathlib `Matrix.trace`: The finite square-matrix trace, the sum of its diagonal entries, over an additive commutative monoid.
- Mathlib `Matrix.trace_diagonal`: The trace of a diagonal matrix over a finite type with decidable equality is the sum of its diagonal entries.
- Tau Ceti `TauCeti.ExactK0` (`TauCeti.CategoryTheory.GrothendieckGroup.Exact`), `TauCeti.ExactK0.of_conflation`, `TauCeti.ExactK0.map` and `TauCeti.ExactK0.lift`: the exact Grothendieck group of an essentially small additive category with a chosen exact structure, its conflation relation, functoriality for conflation-exact functors, and its universal additive invariant. §10.6 applies it to finite-length smooth admissible representations.

- Tau Ceti `TauCeti.FarguesFontaine.spaX`, `TauCeti.FarguesFontaine.quotientMap`, `TauCeti.FarguesFontaine.quotientMap_eq_iff` and `TauCeti.FarguesFontaine.isOpenQuotientMap_quotientMap` in `TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine.Quotient`: the Frobenius-orbit topological quotient and its open-quotient API for `E=ℚ_p`, with the adicity hypothesis on the Witt ideal. They provide no relative period sheaf or untilt divisor.
- Tau Ceti `TauCeti.brauerCohomologyEquiv` in `TauCeti.Algebra.CrossedProduct.Comparison`: the additive equivalence from the algebraic field Brauer group to continuous Galois `H²` with separable-closure units, identifying crossed-product classes with their cocycles; use this carrier for local and global invariant comparisons.
- Tau Ceti `TauCeti.companionFinTwo`, `TauCeti.det_companionFinTwo` and `TauCeti.trace_companionFinTwo` in `TauCeti.LinearAlgebra.Matrix.RationalCanonicalFormFinTwo`: the quadratic companion `[[0,−d],[1,t]]`, with determinant `d` and trace `t`. The all-rank formula of §3.4 specializes to this existing matrix at coefficients `(d,−t)`.
- Tau Ceti `TauCeti.isConj_iff_of_notMem_range_scalar` and `TauCeti.conjClassesGLFinTwoEquiv` in `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.ConjugacyClasses`: over any field `F`, non-scalar `GL₂(F)` elements are conjugate exactly when their traces and determinants agree, and the class set is `Fˣ ⊕ (F × Fˣ)`. The same module supplies `TauCeti.GL2NonSplitTorus.isConj_gl2NonSplitTorusHom_iff` for a quadratic extension of a finite field: the torus elements conjugate to a noncentral element are it and its Frobenius conjugate. The all-rank semisimple and separable-characteristic-polynomial targets in §1.3 extend the corresponding semisimple cases; the non-scalar theorem also covers nonsemisimple elements.

### Arithmetic, algebraic groups and representations

- `TauCetiRoadmap.ClassFieldTheory` §2.4 and Layer 0, item 4 (Tate–Nakayama with a free coefficient lattice), Layers 3, 6, 7, 9, 10 and 11 (class formations, local reciprocity and Weil groups, the Brauer invariant sequence, global reciprocity). §1.2 specializes the lattice theorem to tori and complexes of tori. The restriction and corestriction formulas for local invariants use Layer 5; the global invariant sequence is used with its finite-support and real-place terms.
- `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer` §R17.5.0 (The global Weil group and character comparison) supplies the relative extensions `1→C_M→W_{M/L}→Gal(M/L)→1`, compatible transitions, `W_L` with its inverse-limit topology and map to `Γ_L`, local Weil maps up to conjugacy, and the topological abelianization `W_L^ab≅C_L`. Its Weil–Hecke character comparison uses geometric reciprocity and commutes with localization, norm pullback and field restriction. Sections 1.3a and 10.22 use these carriers unchanged.
- `TauCetiRoadmap.ProfiniteCohomology` Layers 9, 10 and 12 (Hilbert 90, all-degree continuous cohomology and its long exact sequence, graded cup products). For a split torus `G_m^r`, apply Hilbert 90 to each coordinate; finite products commute with cocycles and coboundaries. The crossed-module and nonabelian constructions are §1.1.
- `TauCetiRoadmap.ReductiveGroups` Layers 1, 2, 4, 7, 8 and 9 (algebraic representations, Lie algebras, tori, Galois root data, isogenies and simply connected covers, integral pinnings). The semisimple-centralizer theorem used for stable conjugacy is stated in §1.3. Anisotropy of a torus means `X_*(T)^Γ=0` and is used in §6.11.
- `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.1.1, RG2.1.5, RG2.3.3, RG2.3.6–RG2.3.7, RG2.4.2 (*kottwitz-quotient*, *kottwitz-rational-surjectivity*), RG2.4.4 and RG2.5.1–RG2.5.2 (quasi-split forms, `π₁` and `z`-extensions, parahorics and filtrations, Lang's theorem, the Kottwitz kernel, Cartan decomposition, dual groups and `L`-groups). The rational-point Kottwitz map and its unramified kernel stay there. `PadicHodgeTheory` §5.5 supplies its descent to `B(G)` and the finite-local torsor bijection; §§1.11 and 7.2 add the dual-centre and tensor-functor comparisons.
- `TauCetiRoadmap.AdelicAlgebraicGroups` §§2.1–2.4 and 4.1 (central-character extension, quotient integration, Tamagawa normalization, local `H¹` vanishing and the simply connected Hasse principle). §1.9 applies the last two through the torsor–Galois-cohomology dictionary; it adds the reductive abelianization and adjoint comparisons.
- `TauCetiRoadmap.GlobalNumberFields` Layers 0, 5, 9 and 10 (places, adeles, Hecke characters and infinity types). Algebraic infinity types compose with norms as described there. For the continuous unitary auxiliary character, §6.3 defines composition with local and adelic norms directly, computes its archimedean parity and records its ramification; no norm functoriality for arbitrary continuous characters is attributed to Layer 9.
- `TauCetiRoadmap.ArithmeticGaloisDuality` §§R02.3.1, R02.4.3, R02.4.6 and D7 (localization, Poitou–Tate and derived continuous duality). `TauCetiRoadmap.Chebotarev` Layer 10 gives number-field Dirichlet density. The perverse-sheaf trace recognition used in the Hitchin argument is §3.18.
- `TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras` Layers 2–6 (Artin–Wedderburn and the double-centralizer theorem, central simple algebras, algebraic Brauer groups, splitting and index). Tau Ceti `TauCeti.brauerCohomologyEquiv` supplies the field comparison between the algebraic Brauer group and continuous Galois `H²`. The centre-sensitive embedding and commutant calculation for the `B`-action is §8.3, with its division-algebra specialization in §8.10.
- `TauCetiRoadmap.RepresentationTheory.InductionRestriction` Layers 5–6 (complex Clifford theory and Brauer induction for finite groups). These are used over `ℂ`. §10.21 reduces the finite-inertia Weil calculation to them after an unramified twist; it does not require a coefficient-change theorem from finite-group Clifford theory.
- `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §§SR.0.1–SR.0.4, SR.0d.1–SR.0d.2 and SR.1.1 (smooth categories, averaging, duals, derived categories and convolution). The finite-`length K₀` adapter is §10.6; the Weil-equivariant tower object and compact-mod-centre sector are §§12.12 and 12.14.
- The same roadmap, §§SR.2.2–SR.2.3 and SR.2a.1, gives normalized induction and Jacquet functors, exactness, the geometric lemma, Jacquet duality and second adjointness. Exactness induces their maps on the finite-`length K₀` of §10.6. Character–constant-term trace duality is proved in §§8.9 and 10.11.
- The same roadmap, §§SR.3.1–SR.3.4, gives finite length, Bernstein components and centre, the conditional Langlands standard quotient, and the Iwahori block criterion. §§SR.4.1–SR.4.3 gives spherical Satake. §SR.5.2 (*segment-representations*) gives the segment and multisegment conventions and classification with both `Z/L` conventions; §SR.5.3 (*highest-derivative-adapter*) gives the Zelevinsky involution and endpoint-shortening formula. §10.23 only converts these labels into monodromy blocks. §SR.3.3 supplies *harish-chandra-tempered-support*; §2.16 specializes it to `GL_r(D)` and proves irreducibility of its unitary induction and the standard-basis consequences. Character theory, elliptic orthogonality, Schneider–Zink separation, density, supercuspidal genericity and the compact-type application of supplied newforms are targets in §§2.16, 6.4, 10.16 and 10.17. AutomorphicLFunctionsAndLocalFactors AL.2, **Generic finite-place newforms**, supplies the newvector/conductor construction.
- `TauCetiRoadmap.ArithmeticGaloisRepresentations` §§1.1–1.3, 1.7–1.8, 2.4–2.7, 3.1–3.5 and 5.12 gives representation operations, Brauer–Nesbitt, the `ContinuousRep` arithmetic Weil–Deligne adapter (§2.4), irreducible Weil special-block decomposition (§2.6), factors and conductors, and potentially abelian `ℓ`-adic representations. The raw Weil–Deligne fields, special pairs, operations and Frobenius semisimplification are supplied by `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.2. The finite-inertia Weil and algebraic-realization constructions needed by the trace method are §§10.19 and 10.21–10.22; §1.3a fixes their supplied global Weil input before endoscopic data.

- `TauCetiRoadmap.PadicHodgeTheory` §5.5 supplies `sigmaConjugacy`, `B(G)`, the tensor Newton cocharacter, `kottwitzInvariant`, `B(G,{μ})` and `localTorsorKottwitz`, including every finite `F/ℚ_p` at `p=2`. Its proof starts from torus duality and simply connected derived `H¹` vanishing. In §1.11’s comparison, the torus input comes directly from ClassFieldTheory §2.4 and Layers 3, 6, specialized using ReductiveGroups Layer 4’s character lattices and ProfiniteCohomology Layer 9’s Hilbert 90; the vanishing input comes directly from AdelicAlgebraicGroups §4.1, “Local H¹ vanishing”. The real/global and abelianized dual-centre adapters remain in §1.11, and the tensor classification, PEL sign, decent representatives and `J_b` remain in §§7.2–7.6.

### Automorphic and harmonic analysis

- `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.50 supplies real reductive representations, discrete-series parameters, positive Langlands quotients, smooth Fréchet globalization and restricted tensor factorization. `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, **Archimedean GLₙ parameters**, supplies the real and complex Weil-group correspondence, duals and norm twists. `TauCetiRoadmap.ArithmeticLocallySymmetricSpaces` §§ALS.F.5–ALS.F.7 and ALS.5b.1 supplies relative Lie-algebra cochains, automorphic spaces, Wigner’s lemma, algebraic coefficients and the characteristic-zero cohomology comparison. AutomorphicSpectralTheory §§7.0a–7.0c and 7.1 supplies cyclic GL normalized characters, local transfer, trace comparison and global base change/descent/fibres; §§6.4, 6.12 and 6.24 add the reductive-component and all-place normalization adapters. The arbitrary-unitary GL induction theorem is supplied by AutomorphicSpectralTheory §7.0b; §6.1 compares its normalized operators with §5.2; the archimedean norm/restriction/induction adapter is §10.22. The definite Shimura-set `H⁰` dictionary and the `U(N−1,1)` Matsushima calculation are §§13.8–13.9 and 13.4.
- `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.1, **Local epsilon factors and Gauss sums** and **Rank-one specialisation and Hecke comparison** (target **Hecke continuation and functional equation**), gives Tate factors, measures and the Hecke functional equation. AL.2, **Matrix zeta integrals and standard denominators**, gives standard factors. AL.3, **Induction, functional equations and test realization**, **Poles, functional equations and the closed boundary**, and **Strong multiplicity one**, gives generic Rankin–Selberg theory and strong multiplicity one for isobaric sums. §§10.27 and 10.29 establish the high-ramification and nongeneric segment-pair extensions used here.
- `TauCetiRoadmap.AutomorphicSpectralTheory` §§2.1–2.6, 4.1–4.6 and 6.5–6.19 gives meromorphic intertwiners, residues, spectral completeness, invariant trace distributions, ordinary orbital integrals, pseudo-coefficients and real Euler–Poincaré functions. The GL Rankin–Selberg intertwiner normalization used in the unitary comparison is §5.2. Local Langlands quotients come from SmoothRepresentationsOfLocalGroups §SR.3.3 and AutomorphicSpectralTheory §0.48 (real standard quotients). AutomorphicSpectralTheory §4.14a supplies the full number-field residual classification; its §4.14 concerns the separate everywhere-unramified function-field case. The endoscopic labels of §5.1 use its number-field pair `(ρ,b)` and representation `ρ⊠b` unchanged.

### Curves, moduli and cohomology

- `TauCetiRoadmap.AlgebraicCurves` Layers 4–5 and 12 (Riemann–Roch, completions and regular projective models). A regular finite-type curve over a perfect constant field is smooth: regularity is geometric regularity over a perfect field, and finite presentation converts that condition to smoothness. Thus the model over its finite full constant field is the smooth projective curve used in Layer 3 (Stacks, **Varieties**, Lemmas 33.12.2 and 33.12.6, section tag `038S`).
- `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §§1.3, 2.1–2.2 and 7.1 (Quot/Hilbert charts and Artin algebraicity), together with `TauCetiRoadmap.SchemeAndStackFoundations` Layer 1, especially §1.24 (spaces, stacks, descent and crossed modules). The stack of Higgs sections, `J`-torsor Picard stack and anisotropic Deligne–Mumford criterion are proved in §§3.6, 3.10 and 3.12 using those charts.
- `TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups` §§IG.0.T2–IG.0.T4 gives the scheme Grothendieck–Lefschetz formula. §3.16 derives the finite-stabilizer Deligne–Mumford weighted formula required for Hitchin fibres.
- `TauCetiRoadmap.EtaleCohomologyFoundations` §§F.1–F.8 supplies the constructible derived categories, six operations, rational adic realization, Verdier duality and perverse `t`-structure, with intermediate extensions from `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles` §6.3. `TauCetiRoadmap.EtaleDualityAndPerverseSheaves` §5.6 supplies `pureComplexGeometricSplitting` and `decompositionTheorem`, §5.8 supplies `relativeHardLefschetzTheorem`, and §§6.1–6.5 supplies `TauCeti.EtaleDuality.CohCorr`, its compact-support operators, local terms and `fujiwaraVarshavskyTraceFormula`. Sections 3.14a and 7.10a specialize those interfaces. `TauCetiRoadmap.DeligneWeightsAndPurity` §8.12 gives proper purity. §3.15 extends the decomposition/purity statements to the smooth separated Deligne–Mumford source of the anisotropic Hitchin map; §3.18 proves the perverse trace recognition used there. `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles` LPV.6 supplies nearby-cycle and perverse formalism; the explicit strata calculation is §12.15.
- `TauCetiRoadmap.PELModuli` §§M0.7, M0.18, M1.7–M1.13, M2.5–M2.12, M4.1, M4.3–M4.6 and M5.5 gives the PEL datum, determinant condition, good-prime models, universal families, reciprocity on CM points and canonical generic fibre. §8.14 uses the CM reciprocity of §M4.1 for the infinite and `p`-adic cocharacters of a CM lift. The ramified strict quasi-EL case is §10.12; the auxiliary compact division model and its completed-local comparison are §§9.1 and 10.13.
- `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` Layers A1–A4 and A6 gives rigidity, polarizations, Tate modules, Serre–Tate equivalence, isogeny categories and polarized twisting; §§A5.1–A5.2 (lattice uniformization and Riemann forms) and §§A6.14–A6.15 (positivity of the Rosati involution and the ample cone) give the positive Riemann forms on the CM factors of §8.14. Its carriers remain unchanged.
- `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §§R07.1.5–R07.1.9, R07.2.10–R07.2.17, R07.2.20 and R07.2.25 gives `p`-divisible groups, Cartier duality, Dieudonné–Manin, the covariant conversion and universal covers; §R07.4.25 gives the filtered comparison of the Dieudonné crystal of a `p`-divisible group over `O_K` with the crystalline realization of its Tate module, for every `p`, used for the `p`-adic term of a CM lift in §8.14. §7.6 constructs the relative `O`-linear/Morita normalization and §10.5 its descent norm; §10.2 constructs the strict deformation spaces with Drinfeld levels; §§12.3–12.4 give their formal `O_E` and special `O_D` tower instances and Hodge–Tate sequences.
- `TauCetiRoadmap.ClassicalAdicEtaleCohomology` Layers 4–5 (formal specialization, torsion nearby cycles and the formal/analytic comparison, §4.5a) and `TauCetiRoadmap.AdicCoefficientsAndComparisons` L0 (derived adic coefficients at a fixed level) are used in that order. §§10.4 and 10.20 prove the `ℓ`-adic controlled-cohomology and inertia-average calculations for strict deformation spaces. §12.13 makes their finite-level comparison equivariant for pullback, proper trace and Weil descent.
- `TauCetiRoadmap.DiamondSixOperations` S0–S3 give compactifiable maps (S0), proper-support pushforward `Rf_!` for eligible maps (S1–S2), and the counit trace `tr_f` of `Rf_! ⊣ Rf^!` (S3), specializing to summation over the fibres for finite étale maps. §12.12 proves the all-dimensional analytic support comparison and the cofinal-level compact-support descent used for these towers. It forms the adic inverse limit at each finite level before taking the smooth level colimit.
- `TauCetiRoadmap.DiamondsAndVStacks` §6.9 gives full faithfulness on seminormal rigid spaces over a fixed complete field. The finite-level tower fibres here are smooth, hence seminormal. Functoriality carries their group actions and marked untilts; no larger full-faithfulness assertion is used. `TauCetiRoadmap.PerfectoidSpaces` P5 gives completed cofiltered limits of affinoid perfectoid spaces and finite-stage étale-object descent, and P7 gives tilde-limits; the cohomological support statement is §12.12.
- `TauCetiRoadmap.AdicSpaces` Layer 6 gives the fixed-coefficient Fargues–Fontaine curve for `E=ℚ_p`. `TauCetiRoadmap.PadicHodgeTheory` §7.5 supplies `relativePeriodSheaf` and its restriction/perfectoid/Witt comparisons, the unramified `φᵈ` chartwise curve, untilt Cartier divisor and pullback descent. Section 12.1 identifies its `ℚ_p` and unramified specialization with those objects, then constructs the ramified-`E` and marked tower adapters. Tau Ceti's Frobenius-orbit quotient topology is reused with the supplied complete structure sheaves.
- `TauCetiRoadmap.LocallyAnalyticDistributions` §§0.0–0.3 supplies locally convex spaces, analytic-group charts, analytic-function stages and their inductive topology. §12.16 identifies the tower analytic vectors, topology and differentiated action with the generic invariant orbit-map construction on these carriers. Its Higgs compatibility and comparison of the two tower actions belong here. This underived identification is available to the downstream `CompletedCohomologyPartII` §F.4 specialization; its derived functor and arithmetic comparison belong there.

### Classification prerequisite targets

Sections 11.0a–11.0h own the weighted fundamental lemma, its stabilization consequences, the analytic inputs of the rank-four transfers and the two separate classification constructions. The unitary classification contract consists of the following data and identities for all ranks up to the rank in use, their Levi subgroups and endoscopic groups, with this roadmap's Whittaker datum, transfer factors, additive character and measures:

- The quasi-split unitary local packets, component-character pairings and stable distributions of Mok's classification, with the twisted GL character identity, the endoscopic character identity and the quasi-split normalized local intertwining relations (§11.0d). Include the quasi-split global discrete multiplicity formula (§11.0e). These are the Mok inputs isolated in KMSW §1.5, Propositions 1.5.1–1.5.2, and used in its local/global arguments.
- The twisted weighted fundamental-lemma identities for spherical unit functions at unramified places whose residue characteristic exceeds the bound of §11.0a, for every Levi/endoscopic datum appearing in those arguments, with the recursive weighted orbital terms and normalizing factors of stabilization (§11.0a). The ordinary unweighted unit-function identity of §4.10 is insufficient.
- Weighted twisted stabilization for the twisted GL distributions used by the quasi-split classification: the invariant distributions equal the sums of stable endoscopic distributions with the specified transfer and coefficients, including proper-Levi weighted terms, for test functions that are hyperspecial units outside a finite set `V` of places containing every place of small residue characteristic (§§11.0b–11.0c). §6.25's simple comparison is not substituted for it.

The symplectic classification contract includes the separate `Sp₄/SO₅` local/global classification, normalized local intertwining relations and weighted stabilization (§§11.0g–11.0h), used by Gee–Taïbi Theorem 7.4.1. It also includes the following functorial transfers with the unitary normalization, whose analytic inputs are the targets of §11.0f:

- For every unitary cuspidal `Π` on `GL₄` over a number field, the exterior-square transfer on `GL₆` is an isobaric sum of unitary cuspidal representations, with Satake class `∧²t_v` at each unramified place (Kim Theorem 5.3.1). Include the local parameter compatibility at all places used in Gee–Taïbi §§7.3–7.4, using Kim with Henniart's completion; Kim's unramified identity alone does not assert this completion.
- The weak `GL₂×GL₂` tensor transfer to `GL₄` (Satake compatibility at almost all places, Ramakrishnan Theorem M, extended to discrete `GL₂` inputs as in Gee–Taïbi §6.1) and the weak quadratic Asai identification: a `χ`-self-dual cuspidal `Π` on `GL₄` with `ω_Π ≠ χ²` has at almost all places the Satake parameters of the Asai transfer of a cuspidal representation of `GL₂` over the quadratic extension cut out by `χ²/ω_Π` (Gee–Taïbi Proposition 6.1.3(2)). The orthogonal-type assertions of Gee–Taïbi Propositions 6.1.1–6.1.3 use these two statements. Retain the chosen Asai sign: its two choices differ by the quadratic character of the extension and have the same exterior square. The adjoint `GL₂→GL₃` lift used in those decompositions is supplied by `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer` §R17.4.13.

The contract retains the similitude character and the symplectic/orthogonal groups and factors; a unitary classification input does not provide these data. Section 11.0h constructs these transfers from the analytic inputs of §11.0f; AL.3's Rankin–Selberg factors alone do not construct them, and no strong Asai transfer is an input.

([T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White — Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), Introduction p. 6; §1.5 pp. 76–78; §2.6, Theorem 2.6.2; [T. Gee and O. Taïbi — Arthur’s multiplicity formula for GSp4 and restriction to Sp4](https://www.numdam.org/item/10.5802/jep.99.pdf), Introduction p. 472 and §6.1, Propositions 6.1.1–6.1.3 and 6.1.7, pp. 503–508; §§7.3–7.4, pp. 512–515, and §8, pp. 515–518; [H. H. Kim — Functoriality for the exterior square of GL₄ and the symmetric fourth of GL₂](https://www.ams.org/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf), Theorem 5.3.1; [G. Henniart — Sur la fonctorialité, pour GL(4), donnée par le carré extérieur](https://doi.org/10.17323/1609-4514-2009-9-1-33-45), pp. 33–45; [D. Ramakrishnan — Modularity of the Rankin–Selberg L-series, and multiplicity one for SL(2)](https://arxiv.org/abs/math/0007203v1), Theorem M, p. 54.)

All packet, pairing and multiplicity assertions in §§11.2–11.4 and their consumers in §§13.5–13.9 carry the unitary classification contract (§§11.0d–11.0e) as a hypothesis. The `GSp₄` classification consequences in §§11.1 and 13.2 instead carry the symplectic classification contract (§§11.0g–11.0h). The pure packet branch of §15.6 retains these inputs; §13.9 and its oldform dimension export separately assume finite-place temperedness of `Π`; the independent simple trace and rational Igusa branches retain their own hypotheses. The unitary contract is constructed in §§11.0a–11.0e and the symplectic contract in §§11.0a–11.0c and 11.0f–11.0h. Both rest on the weighted fundamental lemma of §11.0a, a theorem under its large-residue-characteristic hypothesis, consumed only at places outside the finite set `V` of §11.0c.

**Checks.**

- An unweighted spherical transfer identity supplies neither a proper-Levi weighted term nor either classification contract.
- A split unitary local packet is a GL singleton, but this special case alone supplies no nonsplit packet pairing or global multiplicity formula.
- The zero test gives a tautological trace equality and cannot supply weighted stabilization for arbitrary tests; both contracts require all tests in their stated trace spaces.
- For Satake roots `a,b,c,d`, the exterior-square transfer has the six roots ab,ac,ad,bc,bd,cd. An analytic exterior-square Euler product alone does not construct its isobaric automorphic realization.
- For a four-dimensional symplectic parameter with multiplier `χ, ∧²r⊗χ⁻¹` has the trivial line and the five-dimensional orthogonal quotient; this is the decomposition used in the pole argument.
- The tensor and Asai alternatives land in the orthogonal GSpin₄ branch; the adjoint lift is the separate three-dimensional representation, not a replacement for either `GL₄` transfer.
- At a place of residue characteristic 2, no weighted identity of §11.0a is asserted; the contracts place such a place in `V` and treat its local terms through §11.0b.

## How to read the build

Layers 1–4 construct the stable-class invariants, transfer and geometric fundamental-lemma machinery, including §1.2a’s torus reciprocity before transfer factors and §1.3a’s supplied global Weil input before global endoscopic data. Layer 5 identifies the supplied number-field discrete GL data with the endoscopic labels and fixes the intertwiner normalization before Layer 6 uses them on the unitary spectral side; Layer 6 adapts supplied cyclic base change, establishes induction and the restricted division-unitary descent before the local correspondence. Layers 7–8 form rational Igusa geometry and then count and stabilize its correspondences. The geometric prefix §9.1 constructs raw finite-level compact-unitary PEL models, proves properness from the division datum, and constructs coefficient cohomology and commuting actions before the cohomological parts of §§6.23 and 6.27. These trace comparisons then precede Layer 10’s independent trace construction of classical local Langlands. Layer 11 derives local unitary packets and global multiplicities from that correspondence and the explicit classification input contracts. Layer 12 realizes the classical parameter in local towers, preserving actual cohomology separately from earlier virtual traces. The pure automorphic branch of Layer 13 and the rational Igusa branch of Layer 14 are separate inputs to the calculations and joint interface of Layer 15. The strict-`O` Dieudonné normalization of §7.6 precedes the deformation and norm constructions of Layer 10. The independent character theorem §2.16 and classical JL target §4.7a precede §4.8 and the unitary trace applications. The rational parabolic cohomology theorem §1.13a precedes §§1.14 and 8.9. Within Layer 3 construct §§3.9–3.10 without density or fibre component indexing, prove §3.11 after §3.6, and then prove §3.11a’s global density, globalization, local density and component indexing. The good-open comparison of §3.18 precedes the local fundamental lemma §4.3; full anisotropic stabilization §4.3a follows it. Within Layer 6 follow its *Needs* edges, with the separate twisted character-support theorem before invariant recursion. Each section's *Needs* names a mathematical construction or a prerequisite interface; no final global Galois or integral concentration theorem is used to build these inputs.

## Layer 1: stable conjugacy and arithmetic invariants

The arithmetic input is a pointed-set theory until the braided reductive abelianization provides abelian groups. Define its stable-class invariants before endoscopic data. Local and global assertions have different hypotheses, and degree-zero images retain the real-place positivity condition.

### 1.1 Galois cohomology with coefficients in a crossed module

Let `Γ` be a profinite group and `∂ : H̃ → H` a crossed module of discrete groups (`H` acting on `H̃` by automorphisms, `∂(h·x) = h ∂(x) h⁻¹` and `∂(x)·y = x y x⁻¹`) on which `Γ` acts continuously and compatibly `(σ(h·x) = σ(h)·σ(x), ∂∘σ = σ∘∂)`. Define pointed sets `H⁻¹(Γ, H̃→H) = ker(∂)^Γ, H⁰(Γ, H̃→H)` and `H¹(Γ, H̃→H)` as the cohomology of the crossed module in the sense of Borovoi (equivalently of the two-term complex with `H̃` in degree `−1` and `H` in degree 0): a 0-cocycle is a pair `(h, u)` with `h ∈ H` and `u : Γ → H̃` continuous with `∂(u_σ) = h⁻¹σ(h)` and `u_{στ} = u_σ·σ(u_τ)`; a 1-cocycle is a pair `(u, h)` with `u : Γ×Γ → H̃` and `h : Γ → H` continuous satisfying the crossed-module cocycle identities; coboundaries are given by the actions of `H` and of maps `Γ → H̃`. For a crossed module `𝓗̃ → 𝓗` of smooth affine group schemes over a field `F` of characteristic 0, `H^i(F, 𝓗̃→𝓗) := H^i(Γ_F, 𝓗̃(F̄) → 𝓗(F̄))` for `i = −1`, 0, 1. The case `H̃ = 1` is nonabelian Galois cohomology, specified here: `H⁰(Γ, H) = H^Γ` and `H¹(Γ, H)` the pointed set of continuous 1-cocycles `a (a_{στ} = a_σ σ(a_τ))` modulo `a ~ b` iff `b_σ = c⁻¹ a_σ σ(c)`, functorial in `Γ` (inflation, restriction) and in `H`, with twisting (for a cocycle `a`, the twisted group `_aH` and the bijection `H¹(Γ, _aH) → H¹(Γ, H), b ↦ ba`) and, for a `Γ`-stable normal subgroup `H′ ⊆ H` with quotient `Q=H/H′`, the exact sequence of pointed sets through `H¹(Γ,Q)`. The fibres of `H¹(Γ,H′)→H¹(Γ,H)` are the `Q^Γ`-orbits, so `H¹(Γ,H′)/Q^Γ` identifies with the neutral fibre of `H¹(Γ,H)→H¹(Γ,Q)`. For a quotient class admitting a lift represented by `a∈Z¹(Γ,H)`, twisting identifies its fibre with `H¹(Γ,_aH′)/(_āQ)^Γ`, where `ā` is the image cocycle and the action comes from the twisted exact sequence `1→_aH′→_aH→_āQ→1`. A quotient class without a lift has empty fibre. They satisfy: (1) `H^i(Γ, 1→H) = H^i(Γ, H)` for `i = 0`, 1; (2) a morphism of crossed modules inducing isomorphisms on `ker ∂` and on `coker ∂` induces bijections on `H⁻¹, H⁰, H¹` (quasi-isomorphism invariance); (3) for `H̃ ⊆ H` a normal subgroup with `∂` the inclusion, `H^i(Γ, H̃→H) = H^i(Γ, H/H̃)` for `i = 0`, 1; (4) there is an exact sequence of pointed sets `H⁻¹(H̃→H) → H⁰(H̃) → H⁰(H) → H⁰(H̃→H) → H¹(H̃) → H¹(H) → H¹(H̃→H)`, with the usual meaning of exactness at the nonabelian terms; (5) if the crossed module is symmetric braided, for instance quasi-isomorphic compatibly with `Γ` to a two-term complex of commutative groups (as `[G_sc → G]` and `[Z(G_sc) → Z(G)]` are for `G` connected reductive, by Borovoi), the pointed sets `H⁰` and `H¹` carry a canonical abelian group structure, functorial for morphisms of such crossed modules. The kernel of a crossed module is always central in `H̃`, and an abelian cokernel does not suffice: for `∂ = 1 : ℤ/3 → ℤ/2` with `ℤ/2` acting by inversion and `Γ = ℤ/3` acting trivially, `H⁰ ≅ ℤ/3 ⋊ ℤ/2` is nonabelian.

*Hypotheses.* `Γ` profinite acting continuously on discrete groups; the action is compatible with the crossed-module structure.

([J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §1.1–1.2, Définition 1.1.1, Lemme 1.2.1, Proposition 1.2.2, pp. 9–20; [M. Kisin — Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), §3.2.7, items (1)–(2) p. 41 and (3)–(4) p. 42; [T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, §3.4 (pp. 15–16): `H¹_sc(Γ, G) ≅ H¹(Γ, G_sc → G)`.)

The interface consists of the following operations and identities.

- `H¹(Γ, H)` for a profinite `Γ` acting continuously on a discrete group `H`: continuous cocycles modulo twisted conjugation, a pointed set.
- For a cocycle `a`, the bijection `H¹(Γ, _aH) → H¹(Γ, H), b ↦ ba`, sending the base point to `[a]`.
- For `H′ ⊆ H` a `Γ`-stable normal subgroup and `Q=H/H′`, exactness of `H′^Γ → H^Γ → Q^Γ → H¹(Γ,H′) → H¹(Γ,H) → H¹(Γ,Q)`. The `Q^Γ`-orbits are precisely the fibres of `H¹(Γ,H′)→H¹(Γ,H)`; their quotient is the neutral fibre of the next map. Twisting by a chosen lift gives the corresponding description over a non-neutral quotient class.
- `H^i(Γ, H̃ → H)` for `i ∈ {−1, 0, 1}`, a pointed set, with base point the class of the identity.
- A `Γ`-equivariant morphism of crossed modules induces maps on `H^i`, compatible with identities and composition.
- A morphism inducing isomorphisms on `ker ∂` and `coker ∂` induces bijections on `H⁻¹, H⁰, H¹`.
- The seven-term exact sequence `H⁻¹(H̃→H) → H⁰(H̃) → H⁰(H) → H⁰(H̃→H) → H¹(H̃) → H¹(H) → H¹(H̃→H)` of pointed sets.
- For a normal subgroup `H̃ ⊆ H, H^i(Γ, H̃ → H) ≅ H^i(Γ, H/H̃), i = 0`, 1.
- For a symmetric braided crossed module (in particular the Picard structure transported to `[G_sc → G]` with `G` connected reductive), `H⁰` and `H¹` are abelian groups and the maps of the exact sequence from `H⁰(H)` onwards are compatible with these structures where both sides are groups.
- Inflation and restriction along continuous homomorphisms of profinite groups, compatible with the exact sequence.

Define the cocycle and coboundary relations as in Labesse §1.2 (crossed sets) or Borovoi §3 (summarised in Kisin (3.2.7)); the relations are equivalence relations by direct computation (Labesse Lemme 1.2.1). Item (1) and nonabelian `H¹`: with `H̃ = 1` the definitions collapse to `Γ`-invariants and to nonabelian `H¹` (Labesse §1.3; Serre's twisting argument). For the normal-subgroup assertion, lift `q∈Q^Γ` to `c∈H`; the formula `b_σ=c⁻¹a_σσ(c)` preserves `H′`-valued cocycles and defines the orbit relation independently of the lift. Two such cocycles become equivalent in `H` exactly when a conjugator projects to `Q^Γ`. A cocycle of `H` with neutral image in `H¹(Γ,Q)` can be conjugated into `H′`, proving the neutral-fibre assertion. Apply this argument to the twisted sequence for the other nonempty fibres. Item (2): a quasi-isomorphism of crossed modules induces a bijection on cohomology (Labesse Proposition 1.2.2), by comparing cocycles through the long exact sequence and the five lemma for pointed sets with group actions. Item (4): the connecting maps are constructed exactly as for a short exact sequence of groups; exactness is checked on cocycles (Kisin (3.2.7)(3), Borovoi Corollary 3.4.3). Item (5): the symmetric braiding gives a commutative product on cocycle classes; for `[G_sc → G]`, Borovoi's group law is transported through the quasi-isomorphism to the two-term complex of tori (§1.5). An abelian cokernel alone does not give an abelian cohomology law; require the symmetric Picard structure. The reductive crossed modules used here acquire it from the complex of tori.

**Checks.**

- For `H̃ = 1, H¹(Γ, 1 → H)` is the nonabelian `H¹(Γ, H)`, and `H⁰(Γ, 1 → H) = H^Γ`.
- For `H̃ = H` with `∂ = id`, all three groups `H⁻¹, H⁰, H¹` are trivial (the crossed module is quasi-isomorphic to `1 → 1`).
- For `[SL₂ → GL₂]` over a field `F` of characteristic 0, `H⁰(F, SL₂ → GL₂) ≅ F^×` through the determinant, and `H¹(F, SL₂ → GL₂) = 0` by Hilbert 90.
- For the crossed module `[μ₂ → 1]` over `ℝ` (kernel `μ₂` in degree `−1`), `H⁰ = H¹(ℝ, μ₂) = ℤ/2`, so `H⁰` of a crossed module is not the `H⁰` of its cokernel when the kernel is nontrivial.
- For `∂ = 1 : ℤ/3 → ℤ/2` with `ℤ/2` acting on `ℤ/3` by inversion and `Γ = ℤ/3` acting trivially, `ker ∂` is central and `coker ∂` is abelian, yet `H⁰(Γ, ℤ/3 → ℤ/2) ≅ ℤ/3 ⋊ ℤ/2 ≅ S₃` is nonabelian: item (5) needs the braiding.
- For trivial `Γ=C₂` action on `H′=H=C₂`, the map `H¹(Γ,H′)→H¹(Γ,H)` is the identity with singleton fibres, while `H¹(Γ,H)→H¹(Γ,1)` has a two-element fibre. The trivial quotient acts on the source of the first map.
- The seven-term sequence is exact for `[G_sc → G]` with `G = PGL₂` over `ℝ`.

*Needs:* `TauCetiRoadmap.SchemeAndStackFoundations` §1.24 (semilinear descent and crossed modules); `TauCetiRoadmap.ProfiniteCohomology` Layer 10 (continuous cohomology in all degrees); `TauCetiRoadmap.ProfiniteCohomology` Layer 5 (exact sequences).

### 1.2 Tate–Nakayama isomorphisms for tori

Let `S` be a torus over a field `F` of characteristic 0, split by a finite Galois extension `E/F` with group `Γ_{E/F}`, and `X_*(S)` its cocharacter module. `(a)` (Local) If `F` is local and `u_{E/F} ∈ H²(Γ_{E/F}, E^×)` is the local fundamental class, cup product with `u_{E/F}` gives isomorphisms `Ĥ^i(Γ_{E/F}, X_*(S)) → Ĥ^{i+2}(Γ_{E/F}, S(E))` of Tate cohomology groups for every integer `i`, using `S(E) = X_*(S) ⊗ E^×`. In particular `H¹(F, S) ≅ Ĥ⁻¹(Γ_{E/F}, X_*(S)) = (X_*(S)_Γ)_tors` (for finite `F/ℚ_p`, identify this cup-product map with the torus specialization of PadicHodgeTheory §5.5’s `localTorsorKottwitz`) (the inflation `H¹(Γ_{E/F}, S(E)) → H¹(F, S)` being an isomorphism by Hilbert 90 for split tori), and `H²(Γ_{E/F}, S(E)) ≅ X_*(S)^Γ/N X_*(S)`, with inflation `H²(Γ_{E/F}, S(E)) → H²(F, S)` injective; if `S` is anisotropic then `H²(F, S) = 0`. The isomorphisms are compatible with restriction and corestriction, and with inflation in a tower `E ⊆ E′` only after multiplying by the degree `[E′ : E]`. `(b)` (Global) If `F` is a number field and `C_E` the idele class group, cup product with the global fundamental class gives `Ĥ^i(Γ_{E/F}, X_*(S)) ≅ Ĥ^{i+2}(Γ_{E/F}, X_*(S) ⊗ C_E)`; in degree `−1` this identifies Kottwitz's global-mod-local group `H¹(𝔸_F/F, S) := H¹(Γ_F, S(𝔸_F̄)/S(F̄)) = H¹(Γ_{E/F}, X_*(S) ⊗ C_E)` with `(X_*(S)_Γ)_tors` (it contains the cokernel of `H¹(F, S) → H¹(𝔸_F, S)`, with quotient `ker²(F, S)`) and, dually, gives `ker¹(F, S) ≅ ker¹(F, Ŝ)^D`. `(c)` The same holds for two-term complexes of tori `[S₁ → S₂]` with finite kernel (hypercohomology in place of cohomology and the cone of `X_*(S₁) → X_*(S₂)`), compatibly with the long exact sequences, with norm and restriction maps and with central isogenies. The sign convention: some authors (e.g. Kaletha in the proof of Theorem 4.8) use `λ ↦ λ ∪ c⁻¹`, the negative of the isomorphism above; each consumer records which one it uses.

*Hypotheses.* `F` of characteristic 0 local (finite extension of `ℚ_p`, or `ℝ`, or `ℂ`) for `(a)`, a number field for `(b)`; `S` a torus split by the finite Galois extension `E/F`.

([T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5: §4 introduction; Theorem 4.8 (p. 24) and its proof (p. 25); Corollary 3.7 (p. 14); §5.3 (p. 33); [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §1.7, proof of Proposition 1.7.3 (pp. 38–39); Lemme 1.5.1 (p. 27); [R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §1.1–1.2 (p. 368).)

ClassFieldTheory §2.4 and Layer 0 item 4 give the Tate–Nakayama theorem for a `ℤ`-free lattice, including its Tor-vanishing hypothesis. Here `X_*(S)` is finite free over `ℤ`, so this is a specialization of that theorem. Apply it with `M = X_*(S)` and `C = E^×` (local, ClassFieldTheory Layer 6) or `C = C_E` (global, Layer 11). Identify `S(E) = X_*(S) ⊗ E^×` as `Γ`-modules, so `Ĥ^{i+2}(Γ_{E/F}, S(E))` is Galois cohomology of the torus; Hilbert 90 for `G_m` (ProfiniteCohomology Layer 9), applied coordinatewise after identifying a split torus with a finite product of `G_m`, gives the inflation statements in degree 1, and the injectivity in degree 2. Anisotropic vanishing: `X_*(S)^Γ = 0` gives `Ĥ⁰ = 0`, so `H²(Γ_{E/F}, S(E)) = 0` for every splitting `E`, and `H²(F, S)` is the colimit (Kaletha, Corollary 3.7(1)). Compatibilities: restriction and corestriction commute with cup products by the projection formula; inflation multiplies the fundamental class by the degree (ClassFieldTheory Layer 3, scaled inflation). Global duality: Poitou–Tate for tori in the form `ker¹(F, S) ≅ ker¹(F, Ŝ)^D` follows from `(b)` by comparing with the local statements (Kottwitz 1984 §4; recalled in Labesse Proposition 1.7.3 for the centre complex). Complexes: use the long exact sequences of hypercohomology and the five lemma (Labesse §1.7, 'Tate–Nakayama pour les complexes de tores').

**Checks.**

- For `S = G_m: (X_*(S)_Γ)_tors = 0` and `H¹(F, G_m) = 0` (Hilbert 90).
- For `S = R^1_{E/F} G_m` the norm-one torus of a quadratic `E/F: X_*(S) = ℤ` with the nontrivial element acting by `−1, (X_*(S)_Γ)_tors = ℤ/2` and `H¹(F, S) = F^×/N E^× ≅ ℤ/2` for `F` local nonarchimedean.
- For `S = R_{E/F} G_m: X_*(S)` is induced, `Ĥ^i` vanishes and `H¹(F, S) = 0` (Shapiro and Hilbert 90).

*Needs:* `TauCetiRoadmap.ClassFieldTheory` §2.4 and Layer 0, item 4 (Tate–Nakayama for a free lattice); `TauCetiRoadmap.ClassFieldTheory` Layer 3 (Tate's theorem for a class formation); `TauCetiRoadmap.ClassFieldTheory` Layer 6 (the local class formation and finite local reciprocity); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (the global class formation and global Artin reciprocity); `TauCetiRoadmap.ClassFieldTheory` Layer 10 (global carriers, the Brauer sequence, and the sum of local invariants); `TauCetiRoadmap.ProfiniteCohomology` Layer 9 (the Galois interface: Hilbert 90 and Kummer theory); `TauCetiRoadmap.ProfiniteCohomology` Layer 12 (the graded cup product in all degrees); `TauCetiRoadmap.ReductiveGroups` Layer 4 (Jordan decomposition, diagonalizable groups, tori); `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); `TauCetiRoadmap.ArithmeticGaloisDuality` §R02.4.3 (Poitou–Tate duality).

### 1.2a Local torus reciprocity and Weil-character evaluation

For a torus `T` over a characteristic-zero local field `F`, with complex dual `T̂` and its continuous `W_F`-action through a finite splitting group, construct the natural group isomorphism `H¹_cont(W_F,T̂)≅Hom_cont(T(F),ℂ×)`. The right side includes nonunitary characters. For an induced torus `Res_{E/F}G_m` it is Shapiro followed by local class field theory for E. Define the local torus character map by this isomorphism, and define `⟨a,t⟩` by evaluating the resulting character at `t`. Prove multiplicativity in both variables, independence of cocycle representatives, functoriality in `T`, and compatibility of Weil restriction with pullback along `N_{E/F}:T(E)→T(F)`. Carry arithmetic and geometric reciprocity separately: changing convention inverts the corresponding character, with the cohomology class inverted as well when its character is held fixed.

*Hypotheses.* `F` a finite extension of `ℚ_p, ℝ` or `ℂ`; `T` an `F`-torus; continuous cocycles for the usual complex topology on `T̂`. Fix a reciprocity convention before evaluating.

([R. P. Langlands — Representations of abelian algebraic groups](https://publications.ias.edu/sites/default/files/representations-of-abelian-algebraic-groups.pdf), Theorems 1 and 2`(a)`, pp. 2–3, proof pp. 3–12; [R. P. Langlands and D. Shelstad — On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §3.5, pp. 246–247.)

Use the local class formation to identify Weil homology of the cocharacter lattice with `T(F)`. Resolve that lattice by permutation lattices and apply Shapiro for the induced tori; the fundamental class gives the Tate–Nakayama comparison in the resulting homology sequences. Pair continuous Weil cocycles with this homology using `T̂×X_*(T)→ℂ×`. Divisibility of `ℂ×` and continuity give the character isomorphism, as in Langlands' proof. This constructs the full ramified correspondence, beyond finite-Galois `H¹(F,T)`. Norm functoriality follows from restriction/corestriction and the induced-torus Artin diagram.

**Checks.**

- For `T=G_m` and an unramified character `χ` with `χ(ϖ)=z`, the arithmetic convention gives `a(Φ_ar)=z` and `⟨a,ϖ⟩=z`. Keeping a fixed and reversing reciprocity gives `z⁻¹`.
- For `T=Res_{E/F}G_m` and a character `χ` of `E×` nontrivial on `O_E×`, Shapiro produces `⟨a,u⟩=χ(u)` for every unit `u`; an unramified-character dictionary cannot supply this value.
- For `T=G_m`, restriction from `W_F` to `W_E` corresponds to `χ∘N_{E/F}`. If `E/F` is unramified of degree `f` and `χ(ϖ_F)=z`, its value on `ϖ_E` is `z^f`, rather than `z`.

*Needs:* §1.2; `TauCetiRoadmap.ClassFieldTheory` Layers 2, 6–7 and 9 (class formations, local reciprocity and Weil groups); `TauCetiRoadmap.ProfiniteCohomology` Layers 10–12 (finite-quotient cohomology, Shapiro and cup products); `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (dual tori and Weil actions).

### 1.3 Rational, geometric and stable conjugacy of semisimple elements

Let `F` be a field of characteristic 0 and `G` connected reductive over F. For semisimple `δ ∈ G(F)` let `G_δ` be its centralizer and `G_δ⁰` the identity component; `δ` is regular if `G_δ⁰` is a torus and strongly regular if `G_δ` is abelian (then `G_δ = T_δ` is a maximal torus). Two semisimple `δ, δ′ ∈ G(F)` are rationally conjugate if `δ′ = g⁻¹δg` with `g ∈ G(F)`, geometrically conjugate if this holds with `g ∈ G(F̄)`. Following Labesse, let `T_δ` be the maximal torus of the centre of the centralizer in `G` of `G_δ⁰`, and let the stable centralizer `I_δ` be the subgroup of `G_δ` generated by `G_δ⁰` and the `δ`-invariants `(T_δ)^δ`; `I_δ = G_δ⁰` when `G_der` is simply connected (Steinberg's connectedness theorem) and in the situations of ordinary endoscopy with `G_der` simply connected and of cyclic base change. Then `δ′` is stably conjugate to `δ` if `δ′ = x⁻¹δx` with `x ∈ G(F̄)` and the cocycle `a_σ = x σ(x)⁻¹` takes values in `I_δ` for every `σ ∈ Γ_F`. For strongly regular `δ`, stable conjugacy is geometric conjugacy by an element `x` with `x σ(x)⁻¹ ∈ T_δ`, i.e. conjugacy over `F̄` such that the induced isomorphism `T_δ → T_δ′` is defined over F. Stable conjugacy is an equivalence relation on semisimple elements of `G(F)`, coarser than rational and finer than geometric conjugacy. The same definitions apply to the Lie algebra `𝔤(F)` (regular semisimple `X` with centralizer a maximal torus, stable conjugacy by `G(F̄)` with defined-over-`F` induced isomorphism) and, with `θ`-conjugacy `x⁻¹δθ(x)`, to a twisted space `L = Gθ` (Labesse §2.3, Waldspurger 2008 §3.1).

*Hypotheses.* `F` of characteristic 0; `G` connected reductive (for the twisted version, a connected component `L` of a reductive `G⁺` with identity component `G` having a rational point).

([J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §2.3, Définitions 2.3.1 and 2.3.4, Lemmes 2.3.2 and 2.3.3 (pp. 52–54); [R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), Introduction (p. 367) and §4.1 (p. 378); [T. C. Hales — A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), §5, Definition 5.1 (PDF p. 7); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.3 (pp. 8–9) and §3.1 (p. 24).)

The interface consists of the following operations and identities.

- `δ` semisimple with abelian centralizer.
- The stable centralizer `I_δ ⊆ G_δ`.
- The stable conjugacy relation on semisimple elements of `G(F)`.
- Stable conjugacy is an equivalence relation.
- Rational conjugacy implies stable conjugacy.
- Stable conjugacy implies geometric conjugacy.
- If `G_der` is simply connected, `I_δ = G_δ⁰`.
- Normal homomorphisms and inner twists map stable classes to stable classes.
- The Lie-algebra version on regular semisimple elements of `𝔤(F)`, compatible with the exponential near 0.

Connectedness: Steinberg's theorem that the fixed points of a semisimple automorphism of a simply connected group are connected gives `I_δ = G_δ⁰` when `G_der` is simply connected (Labesse Définition 2.3.1 and the remark following it; Lemme 2.3.3 for base change). Equivalence relation: the cocycle of a composite is the twisted product of the cocycles, and inverses give inverse cocycles; values stay in `I_δ` because conjugation by `x` identifies `I_δ` with `I_δ′` (Labesse Définition 2.3.4). The Lie algebra version is identical with Ad in place of conjugation (Ngô §1.7 uses stable classes in `𝔤` parametrized by `𝔠(F)`).

The centralizer facts used here are also targets: over `F̄` the identity component of the centralizer of a semisimple element is reductive; for simply connected `G_der` the whole centralizer is connected. For a strongly regular element it is a maximal torus. Prove reductivity from the root decomposition relative to a maximal torus containing `δ`: the roots surviving in the centralizer are exactly `α` with `α(δ)=1`. For connectedness use Steinberg's semisimple-centralizer theorem in the form recalled by Labesse §2.3, pp. 52–53, and descent for the identity component. Extend the API by reductivity of the semisimple centralizer, connectedness for a simply connected derived group and the strongly regular torus criterion. The disconnected centralizer of an involution in `PGL₂` tests the simple-connectedness hypothesis; the centralizer of a central scalar in `GL₂` is `GL₂`, not a torus; a diagonal matrix with distinct eigenvalues has its diagonal maximal torus as centralizer.

**Checks.**

- For `G = GL_n`, two semisimple elements of `GL_n(F)` are stably conjugate iff they have the same characteristic polynomial iff they are `GL_n(F)`-conjugate. The rational-conjugacy assertion holds over an arbitrary field using Mathlib `Module.End.IsSemisimple` on `Matrix.toLin'` of each matrix; this permits repeated characteristic roots. A separable characteristic polynomial is a sufficient special case. For `n=2`, the non-scalar semisimple case follows from Tau Ceti’s `isConj_iff_of_notMem_range_scalar`. Without semisimplicity, the identity and `[[1,1],[0,1]]` over `Q` have equal characteristic polynomials and are not conjugate.
- For `G = SL₂` over a `p`-adic `F` and `E/F` quadratic, the element of `SL₂(F)` acting on `E = F²` by multiplication by `u ∈ E¹ \ {±1}` and its conjugate by `diag(a, 1)` with `a ∉ N E^×` are stably conjugate but not `SL₂(F)`-conjugate.
- For `G = T` a torus, stable conjugacy is equality.
- In `PGL₂(F)`, the images of `diag(1, −1)` and of the matrix with rows (0, 1) and `(a, 0), a ∉ F^{×2}`, are geometrically conjugate (both are involutions), but the identity components of their centralizers are a split and a nonsplit torus, so they are not stably conjugate.

*Needs:* `TauCetiRoadmap.ReductiveGroups` Layer 8 (Isogeny and existence theorems); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ReductiveGroups` Layer 4 (Jordan decomposition, diagonalizable groups, tori); `TauCetiRoadmap.ReductiveGroups` Layer 2 (Lie algebra and the adjoint representation); `TauCetiRoadmap.ReductiveGroups` Layer 6 (reductive and semisimple groups).

### 1.3a Global Weil input for endoscopy

For a number field `L`, use the global Weil group, relative extensions, transitions, localization maps and character comparison supplied by `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer` §R17.5.0. In global endoscopic data pull back the pinned action of `Γ_L` along `W_L→Γ_L` and use the Weil `L`-group of ReductiveGroupsPartII §RG2.5.2. Fix embeddings of separable closures for local restriction; changing the local Weil map by conjugacy transports the restricted datum by that conjugacy.

*Hypotheses.* `L` a number field; retain the supplier's idele-class topology, compatible relative cocycles and geometric reciprocity. Abelianization is the maximal Hausdorff abelian quotient, obtained by dividing by the closure of the commutator subgroup.

([J. Tate — Number theoretic background](https://www.math.ias.edu/~goresky/pdf/3-01Tate.pdf), §§1.1–1.6, pp. 3–9, especially the construction in §1.2, p. 5, and Proposition 1.6.1, pp. 8–9.)

The global auxiliary characters in §§1.8 and 6.3 are pulled back through the supplied `W_L^ab≅C_L`. Their restrictions are the local reciprocal characters, including at ramified places. Geometric reciprocity sends a uniformizer to geometric Frobenius; arithmetic reciprocity is obtained by inversion on the abelian quotient. Section 10.22 uses the same global and local carriers for its potentially abelian pairs and algebraic realizations.

**Checks.**

- For `M=L`, the relative extension `W_{L/L}` is `C_L`; it is not `Γ_L^ab`.
- At a finite place, composing localization with `W_L→C_L` sends a local reciprocal element to the class of the idele with that element at `v` and 1 elsewhere.
- For `L⊂M⊂N` the transition `W_{N/L}→W_{M/L}` restricts on `C_N` to `N_{N/M}`; their composites agree in towers. Changing a localization by inner conjugacy gives isomorphic restricted representations.

*Needs:* `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer` §R17.5.0 (The global Weil group and character comparison); `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (pinned dual action and Weil `L`-groups).

### 1.4 Endoscopic data, twisted endoscopic data and their isomorphisms

Let `F` be a local or global field of characteristic 0, `W_F` its Weil group, `G` connected reductive over `F, θ` an `F`-automorphism of `G` (quasi-semisimple, i.e. preserving a Borel pair over `F̄`), `ω` a character of `G(F)` (local) or of `G(𝔸_F)/G(F)` (global) with class `a_ω ∈ H¹(W_F, Z(Ĝ))` (Langlands' correspondence for characters, recalled by Waldspurger 2008 §1.3), `Ĝ` the dual group with a `Γ`-stable pinning `(B̂, T̂, {X_α})` and `^LG = Ĝ ⋊ W_F` (ReductiveGroupsPartII §RG2.5.2 (`L`-groups)), `θ̂` the dual automorphism of `Ĝ` preserving the pinning and `^Lθ = θ̂ × id`. An endoscopic datum for `(G, θ, ω)` is a quadruple `(H, ℋ, s, ξ)` with: (1) `H` a quasi-split connected reductive group over `F`; (2) `ℋ` a split extension of `W_F` by `Ĥ` whose induced outer action of `W_F` on `Ĥ` is the one given by `H`; (3) `s ∈ Ĝ` such that `Int(s)∘θ̂` is semisimple; (4) `ξ : ℋ → ^LG` a continuous injective homomorphism over `W_F` such that `(a)` there is a 1-cocycle `a : W_F → Z(Ĝ)` of class `a_ω` with `s ^Lθ ξ(h) = a(h) ξ(h) s ^Lθ` for all `h ∈ ℋ`, and `(b) ξ` restricts to an isomorphism of `Ĥ` onto the identity component `Z_Ĝ(s ^Lθ)⁰` of the centralizer of `s θ̂`. Ordinary endoscopic data are the case `θ = 1, ω = 1`, written `(H, ℋ, s, ξ)` with `s ∈ Ĝ` semisimple (Langlands–Shelstad §1.2; for `G_der` simply connected one may take `ℋ = ^LH`). An isomorphism `(H, ℋ, s, ξ) → (H′, ℋ′, s′, ξ′)` is `g ∈ Ĝ` with `g ξ(ℋ) g⁻¹ = ξ′(ℋ′)` and `g s ^Lθ g⁻¹ ∈ Z(Ĝ) s′ ^Lθ`; `Out(H, ℋ, s, ξ)` is the image of these automorphisms in `Out_F(H)`, via the dual pinned isomorphism, as in Kottwitz–Shelstad (2.1.8). The kernel can be larger than `ξ(Ĥ)` for twisted data; in ordinary endoscopy it is `ξ(Ĥ)`. In the ordinary global or local case the datum is elliptic if `ξ(Z(Ĥ)^Γ)⁰ ⊆ Z(Ĝ)`; `E(G)` and `E_ℓ(G)` denote sets of representatives of isomorphism classes (resp. elliptic ones); for `F` local `E_ℓ(G)` is finite. In ordinary endoscopy, endoscopic triples `(H, s, η)` (Kottwitz's convention, used by Shin) are the data with `ℋ = ^LH` and `η = ξ|_Ĥ` when `G_der` is simply connected. For an ordinary endoscopic datum of a Levi subgroup `M ⊆ G` with `^LM ⊆ ^LG` (ReductiveGroupsPartII §RG2.5.2 (Levi `L`-embeddings)), an endoscopic datum `(M_H, ℳ, s, ξ_M)` for `M` induces one for `G` with `H ⊇ M_H` as a Levi, by taking the centralizer of `s` in `Ĝ`.

*Hypotheses.* `F` local or global of characteristic 0; `G` connected reductive, `θ` quasi-semisimple, `ω` a character.

([J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.3 (pp. 8–10); [R. P. Langlands and D. Shelstad — On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §1.2 (p. 224); [R. Kottwitz and D. Shelstad — On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), §5.1 (PDF p. 12); [R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §5.4 (p. 380); §7 (pp. 385–390).)

The interface consists of the following operations and identities.

- The structure `(H, ℋ, s, ξ)` for `(G, θ, ω)`.
- Isomorphisms of endoscopic data, a groupoid.
- The image of `Aut(e) → Out_F(H)`; retain the kernel described in Kottwitz–Shelstad §2.1, p. 19, rather than identifying it with `ξ(Ĥ)` in arbitrary twisted endoscopy.
- `ξ(Z(Ĥ)^Γ)⁰ ⊆ Z(Ĝ)`.
- For `F` local the set of isomorphism classes of elliptic data is finite.
- Induction of an ordinary datum of a Levi `M` to G.
- The principal datum `(G*, ^LG, 1, id)` for ordinary endoscopy.
- in ordinary endoscopy `(θ=1, ω=1), (H, ℋ, s⁻¹, ξ)` is again a datum; it need not be isomorphic to `(H, ℋ, s, ξ)`. This is the change used to define the primed factors in Kottwitz–Shelstad §5.1, p. 12. No such operation with unchanged `θ` and `ω` is asserted for arbitrary twisted data.
- Data of `G` and of an inner form `G′` coincide (they depend on `^LG` only).
- In ordinary endoscopy with `G_der` simply connected, data with `ℋ = ^LH` correspond to endoscopic triples `(H, s, η)`. Twisted data need not have `ℋ` isomorphic to `^LH` (Kottwitz–Shelstad §2.2, p. 20).

The outer automorphism group and its kernel are defined in [Kottwitz–Shelstad, *Foundations of twisted endoscopy*](https://www.numdam.org/item/AST_1999__255__R3_0.pdf), §2.1, (2.1.8), pp. 18–20. The datum itself is Waldspurger 2008 §1.3 (twisted, after Kottwitz–Shelstad Chapter 2) specialising to Langlands–Shelstad §1.2 for `θ = 1, ω = 1`. Finiteness of `E_ℓ(G)` for local `F`: an elliptic `s` is determined up to `Z(Ĝ)` and `Ĝ`-conjugacy by finitely many choices because `Z_Ĝ(s)⁰` has semisimple rank at most that of `Ĝ` and the elliptic condition bounds `s` modulo `Z(Ĝ)` to a finite set of torsion classes (Kottwitz 1986 §7, Proposition 7.1–7.5 for the local finiteness results). Induction from Levi subgroups: `Z_Ĝ(s)⁰ ⊇ Z_M̂(s)⁰` and the Levi embedding of `L`-groups transports `ξ_M` (Kottwitz 1986 §7; Waldspurger 2008 §1.3 for the twisted case).

**Checks.**

- For `G = GL_n` (ordinary endoscopy), `E_ℓ(G) = {(GL_n, ^LGL_n, 1, id)}`: an elliptic `s` must be central because `Z_Ĝ(s)⁰` is a Levi subgroup of `GL_n(ℂ)` whose centre is too big otherwise.
- For `G = SL₂` over a `p`-adic `F`, the elliptic endoscopic data are `G` itself and, for each quadratic extension `E/F`, the torus `H = R^1_{E/F} G_m` with `s = diag(1, −1) ∈ PGL₂(ℂ)`. For odd residue characteristic there are three quadratic extensions, hence three such torus data.
- For `G = T` a torus the only datum up to isomorphism is `(T, ^LT, 1, id)`, and Out is trivial.
- For split `G=G_m` with `θ(z)=z⁻¹, ω=1` and `s=1`, the dual endoscopic group is `(μ₂)⁰=1`. All `g∈ℂ×` are automorphisms of the datum, while `Out_F(1)=1`. Thus `Aut(e)/ξ(Ĥ)=ℂ×` would be wrong, whereas the image definition gives the trivial group.
- For `G = U(n)` quasi-split attached to `E/F` and `n = n₁ + n₂, (U(n₁) × U(n₂), s = diag(1_{n₁}, −1_{n₂}), ξ)` is an elliptic datum, `ξ` depending on a character of `E^×` extending the quadratic character of `E/F` raised to a power determined by the parities of `n₁, n₂` (Rogawski; Shin §3.2).
- For split `GL₃` with ordinary nonelliptic torus datum and `s=diag(1,2,3), s⁻¹` is not conjugate to `s` modulo the scalar centre: scaling `{1,1/2,1/3}` to have extremes 1 and 3 gives `{1,3/2,3}`, not `{1,2,3}`. Inverting `s` gives a different datum even in ordinary endoscopy.
- For `G = SL₂, s = diag(1, −1)` with `ℋ = Ĥ × W_F` (split torus action) gives a datum that is not elliptic (`Z(Ĥ)^Γ = Ĥ` is not in `Z(Ĝ)`), so it does not contribute to the elliptic part of the stable trace formula.

*Needs:* §1.3a; `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ClassFieldTheory` Layer 9 (the local Weil group).

### 1.5 Abelianized Galois cohomology of a connected reductive group

Let `F` be a field of characteristic 0 and `G` a connected reductive group over `F, ρ : G_sc → G_der ⊆ G` the simply connected cover of its derived group, `T ⊆ G` a maximal torus, `T_sc = ρ⁻¹(T), Z = Z(G)` and `Z_sc = Z(G_sc)`. The crossed module `[G_sc → G]` (`G` acting on `G_sc` by conjugation through the isogeny) is quasi-isomorphic to the complexes of tori and groups of multiplicative type `[T_sc → T]` and `[Z_sc → Z]` (in degrees `−1` and 0). Define `H^i_ab(F, G) := H^i(F, G_sc → G)` for `i = 0`, 1, an abelian group by §1.1 (5), canonically isomorphic to the hypercohomology `H^i(F, T_sc → T)` and to `H^i(F, Z_sc → Z)`; these identifications are independent of `T` and functorial in `G` for normal homomorphisms. The abelianization maps are `ab⁰ : G(F) = H⁰(F, G) → H^0_ab(F, G)` and `ab¹ : H¹(F, G) → H^1_ab(F, G)`, induced by `[1 → G] → [G_sc → G]`; they fit into the exact sequence `G_sc(F) → G(F) → H^0_ab(F, G) → H¹(F, G_sc) → H¹(F, G) → H^1_ab(F, G)`. For an inner form `G′` of `G, H^i_ab(F, G′) = H^i_ab(F, G)` canonically (the centre complex does not change). For a global field `F`, the adelic groups `H^i_ab(𝔸_F, G)` are the restricted products of the local ones, and `H^1_ab(𝔸_F/F, G)` is the global-mod-local abelianized cohomology of Labesse §1.6, defined through the quasi-toric crossed set attached to `[G_sc → G]` with adelic-modulo-rational coefficients (for a torus `T` it is Kottwitz's `H¹(𝔸_F/F, T)` of §1.2 `(b)`); the sequence `ker¹(F, G) → H¹(F, G) → H¹(𝔸_F, G) → H^1_ab(𝔸_F/F, G)` is exact (Labesse Proposition 1.6.12). It receives the cokernel of the localization `H^1_ab(F, G) → H^1_ab(𝔸_F, G)` but differs from it in general (for a torus `T` by `ker²(F, T)`).

*Hypotheses.* `F` of characteristic 0; `G` connected reductive (Labesse also allows quasi-connected groups: kernels of a surjection from a connected reductive group onto a torus).

([J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §1.6, Lemmes 1.6.1–1.6.3 and Proposition 1.6.8, pp. 28–33; the definition of `H^i_ab(𝔸_F/F, G)` after Corollaire 1.6.11 (p. 34) and Proposition 1.6.12 (p. 35); [M. Kisin — Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), §3.2.7, items (1)–(4), pp. 41–42; [P. van Hoften — Mod p points on Shimura varieties of parahoric level](https://arxiv.org/abs/2010.10496v4), arXiv v4, §§4.3.12–4.3.15, pp. 56–58.)

The interface consists of the following operations and identities.

- `H^i_ab(F, G)` for `i = 0`, 1, an abelian group.
- The abelianization maps `ab⁰ : G(F) → H^0_ab(F, G)` and `ab¹ : H¹(F, G) → H^1_ab(F, G)`.
- `H^i_ab(F, G) ≅ H^i(F, T_sc → T)` for every maximal torus `T`, compatibly with ab and independently of T.
- `H^i_ab(F, G) ≅ H^i(F, Z_sc → Z)`.
- Exactness of `G_sc(F) → G(F) → H^0_ab(F, G) → H¹(F, G_sc) → H¹(F, G) → H^1_ab(F, G)`.
- Canonical isomorphism `H^i_ab(F, G′) ≅ H^i_ab(F, G)` for an inner form `G′`, compatible with the identification of centres.
- Functoriality for normal homomorphisms `G → G′`, with `map_id` and `map_comp`.
- For `F` global, localization maps to `H^i_ab(F_v, G)` and to the restricted product `H^i_ab(𝔸_F, G)`, and the global-mod-local group `H^1_ab(𝔸_F/F, G)`.

Quasi-isomorphism: `T_sc → T` and `Z_sc → Z` map to `G_sc → G` with the same kernel (the finite group `Z_sc ∩ ker ρ`) and the same cokernel `G/ρ(G_sc) = G_ab`; apply §1.1 (2) (Labesse Lemme 1.6.1, which proves that `[Z_sc → Z] → [T_sc → T] → [G_sc → G]` are quasi-isomorphisms, and Lemmes 1.6.2–1.6.3; Borovoi's comparison). Independence of `T`: two maximal tori are conjugate over `F̄` and the induced isomorphisms of hypercohomology are canonical (inner automorphisms act trivially on the centre complex). Exact sequence: specialise the seven-term sequence of the crossed module (§1.1 (4)) to `[G_sc → G]`. Inner forms: an inner twist does not change `[Z_sc → Z]` with its Galois action (Labesse Lemme 1.6.2). Adelic and global-mod-local groups: restricted products of the local hypercohomology groups, using that for almost all places the torus complexes are unramified and the local groups are trivial on integral classes (Labesse §1.4, §1.6, Proposition 1.6.8; the global-mod-local group after Corollaire 1.6.11, p. 34, and its exact sequence, Proposition 1.6.12, p. 35).

**Checks.**

- For `G = T` a torus, `G_sc = 1` and `H^i_ab(F, T) = H^i(F, T)`, with `ab^i` the identity.
- For `G` semisimple simply connected, `[G_sc → G] = [G → G]` is quasi-isomorphic to 1 and `H^i_ab(F, G) = 0`.
- For `n≥1` and `G = GL_n, H^0_ab(F, GL_n) ≅ F^×` with `ab⁰ = det`, and `H^1_ab(F, GL_n) ≅ H¹(F, G_m) = 0`. For `n=0` both abelianized groups are trivial; over `F=ℚ` this excludes a determinant identification with `F^×`.
- For `G = PGL₂` over `ℝ, H^1_ab(ℝ, PGL₂) = H¹(ℝ, μ₂ → 1) = H²(ℝ, μ₂) = ℤ/2`, matching the two real forms `PGL₂` and `SO(3)`.
- `H^1_ab(F, G)` is not `H¹(F, G/G_der)`: for `G = PGL₂` over `ℝ, G/G_der = 1` but `H^1_ab(ℝ, PGL₂) = ℤ/2`.

*Needs:* `TauCetiRoadmap.ReductiveGroups` Layer 8 (Isogeny and existence theorems); §1.1; `TauCetiRoadmap.ReductiveGroups` Layer 6 (reductive and semisimple groups); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ReductiveGroups` Layer 4 (Jordan decomposition, diagonalizable groups, tori); `TauCetiRoadmap.ProfiniteCohomology` Layer 10 (continuous cohomology in all degrees); `TauCetiRoadmap.GlobalNumberFields` Layer 5 (full adeles and the additive quotient).

### 1.6 Inner twists and the quasi-split inner form

Let `F` be a field of characteristic 0 and `G, G′` connected reductive groups over F. An inner twist is an `F̄`-isomorphism `ψ : G_F̄ → G′_F̄` such that `ψ⁻¹∘σ(ψ)` is an inner automorphism of `G_F̄` for every `σ ∈ Γ_F`; `σ ↦ ψ⁻¹∘σ(ψ)` is a 1-cocycle with values in `G_ad(F̄)`, and pairs `(G′,ψ)` up to equivalence are in bijection with `H¹(F, G_ad)`. Here `(G′,ψ)` and `(G″,ψ′)` are equivalent when there is an `F`-isomorphism `f:G′→G″` with `ψ′⁻¹∘f∘ψ` inner over `F̄`; every class arises. Every `G` has a unique quasi-split inner form `G*` up to isomorphism. An inner twist `ψ` transports: `(i)` semisimple and strongly regular semisimple elements, and their stable conjugacy classes, from `G′(F)` to `G*(F̄)` — a stable class of `G′` that is defined over `F` gives an `F`-rational stable class of `G*`; (ii) maximal `F`-tori: every maximal `F`-torus `T′ ⊆ G′` transfers to `G*`, i.e. there is an `F`-torus `T* ⊆ G*` and `g ∈ G*(F̄)` with `Int(g)∘ψ|_{T′}` defined over `F` (Steinberg and Kottwitz: quasi-split groups contain a transfer of every maximal torus of every inner form). (iii) Centralizers: for `γ′ ∈ G′(F)` strongly regular with image `γ*` (rational, by Kottwitz's rationality theorem when `G*_der` is simply connected, and after a `z`-extension in general), `ψ` induces an inner twist of the centralizers `G′_{γ′} → G*_{γ*}`, an `F`-isomorphism of tori in the strongly regular case.

*Hypotheses.* `F` of characteristic 0; `G, G′` connected reductive over F.

([J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Définition 1.7.1 (p. 37), proof of Théorème 2.4.2 (pp. 55–56); [T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, §5.1 (p. 28); [S. Leslie — The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.1, Definition 2.6 (p. 17).)

The interface consists of the following operations and identities.

- An inner twist `(G′, ψ)` of G.
- The class of `ψ` in `H¹(F, G_ad)`.
- Inner twists with the same class are equivalent.
- The quasi-split inner form `G*` with an inner twist `G* → G`.
- For a maximal `F`-torus `T′` of `G′`, an `F`-torus `T* ⊆ G*` and an admissible isomorphism `T′ ≅ T*` induced by `ψ`.
- The induced injection from `F`-rational stable strongly regular classes of `G′` to those of `G*`.
- Compose inner twists by composing their geometric isomorphisms. The cocycle of the composite uses transport through the first twist; `H¹(F,G_ad)` is a pointed set and has no ordinary product of classes. For `ψ:G→G′` and `η:G′→G″`, the automorphism cocycle is `c_{ηψ}(σ)=ψ⁻¹ c_η(σ) ψ · c_ψ(σ)`.

Classification by `H¹(F, G_ad)`: standard twisting (§1.1, nonabelian `H¹` with twisted coefficients) applied to the automorphism group of `G` and its inner part `G_ad` (Labesse Définition 1.7.1 uses this bijection). Quasi-split inner form: existence and uniqueness via a pinning and the splitting of `Aut(G) → Out(G)` (ReductiveGroupsPartII §RG2.1.1). Transfer of tori and of rational stable classes: Steinberg's theorem that a quasi-split group with simply connected derived group has a rational point in every `F`-rational stable (geometric) semisimple class (cited as Kottwitz 1982, Theorem 4.4 in Labesse's proof of Théorème 2.4.2), reduced to that case by a `z`-extension (ReductiveGroupsPartII §RG2.1.5) and Hilbert 90 for the induced central torus. Centralizers: `ψ` restricted to the centralizer is defined over `F` up to an inner automorphism of an abelian group, hence defined over `F` in the strongly regular case.

**Checks.**

- Over a `p`-adic field the inner forms of `GL₂` are `GL₂` and `D^×` for the quaternion division algebra `D`; `H¹(F, PGL₂) = ℤ/2`.
- Two quasi-split inner forms of `G` are isomorphic over F.
- A torus has no nontrivial inner twists `(T_ad = 1)`.
- The outer form `U(n)` of `GL_n` attached to a quadratic extension is not an inner twist of `GL_n` for `n ≥ 2: ψ⁻¹σ(ψ)` involves transpose-inverse.
- Every maximal torus of `D^×` transfers to an elliptic maximal torus of `GL₂`.

*Needs:* §1.1; `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ReductiveGroups` Layer 9 (pinned Chevalley–Demazure group schemes over `ℤ`); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism); `TauCetiRoadmap.ProfiniteCohomology` Layer 9 (the Galois interface: Hilbert 90 and Kummer theory).

### 1.7 `z`-pairs for endoscopic data

Let `(H, ℋ, s, ξ)` be an endoscopic datum for `(G, θ, ω)` over a field `F` of characteristic 0. A `z`-pair is a triple `(H₁, ξ₁, ξ̂₁)` with: (1) `H₁` a quasi-split connected reductive group over `F` with simply connected derived group; (2) `ξ₁ : H₁ → H` a surjective homomorphism whose kernel `Z₁` is a central induced torus (so `H₁ → H` is a `z`-extension in the sense of ReductiveGroupsPartII §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism)); (3) `ξ̂₁ : ℋ → ^LH₁` an injective homomorphism over `W_F` whose restriction to `Ĥ` is the dual of `ξ₁`. Because `Z₁` is induced, `H₁(F) → H(F)` is surjective. The composite `W_F → ℋ → ^LH₁ → ^LZ₁ → Ẑ₁` (for any section `W_F → ℋ`) is a 1-cocycle whose class is independent of the section; it defines a character `λ₁` of `Z₁(F)` (of `Z₁(𝔸_F)/Z₁(F)` globally). In ordinary endoscopy transfer to `H` is replaced by transfer to functions on `H₁(F)` that transform under `Z₁(F)` by `λ₁⁻¹`. General twisted transfer uses the descended space `H_{1,z}(F)` constructed in §1.16; the `z`-pair alone does not trivialize its descent. `z`-pairs exist for every endoscopic datum (Kottwitz–Shelstad §2.2).

*Hypotheses.* `(H, ℋ, s, ξ)` an endoscopic datum over `F` of characteristic 0.

([J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.4 (p. 11); [T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, §5.3, pp. 33–35.)

The interface consists of the following operations and identities.

- The structure `(H₁, ξ₁, ξ̂₁)`.
- Every endoscopic datum admits a `z`-pair.
- The character `λ₁` of `Z₁(F)` (or of `Z₁(𝔸)/Z₁(F)`).
- `H₁(F) → H(F)` is surjective.
- The trivial `z`-pair when `H_der` is simply connected and `ℋ = ^LH`.

Existence: choose a sufficiently large induced-torus `z`-extension `H₁→H` so that the extension `ℋ` admits the required embedding extending `Ĥ→Ĥ₁` (Kottwitz–Shelstad §2.2, pp. 20–21; Waldspurger 2008 §1.4). Simply connected `H_der` alone does not identify a twisted `ℋ` with `^LH`, and an arbitrary `z`-extension need not be the chosen `z`-pair. For ordinary data already supplied with an identification `ℋ=^LH` and simply connected `H_der`, the identity pair is allowed. Independence of the cocycle class from the section: two sections differ by a cocycle valued in `Ĥ`, which maps trivially to `Ẑ₁` after composing with `^LH₁ → ^LZ₁` because `ξ̂₁` is dual to `ξ₁` on `Ĥ` (Waldspurger 2008 §1.4). Surjectivity `H₁(F) → H(F): H¹(F, Z₁) = 0` for an induced torus (Shapiro and Hilbert 90).

**Checks.**

- If `H_der` is simply connected and `ℋ = ^LH`, the trivial `z`-pair (`H`, id, `id`) exists and `λ₁ = 1`.
- For the ordinary unitary datum with `H = U(n₁) × U(n₂)`, simply connected derived group and `ℋ=^LH`, the trivial `z`-pair applies and the transfer factor is a function on `H(F) × G(F)`.
- For the ordinary `SL₂` toral datum supplied with `ℋ=^LH` and `H=R¹_{E/F}G_m, H_der=1` and the trivial `z`-pair suffices. The extra `ℋ=^LH` hypothesis cannot be dropped for arbitrary twisted data.
- A central extension `H₁ → H` with non-induced torus kernel (e.g. kernel `R^1_{E/F} G_m`) need not give surjective `H₁(F) → H(F)` and is not a `z`-pair.

*Needs:* §1.4; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.5.1 (the dual group and its Galois action); `TauCetiRoadmap.ProfiniteCohomology` Layer 9 (the Galois interface: Hilbert 90 and Kummer theory).

### 1.8 Elliptic endoscopic data of unitary similitude groups

Let `F = F^+F₀` be a CM field with `F^+` totally real and `F₀` imaginary quadratic, and for a vector `n⃗ = (n₁, …, n_s)` of positive integers let `G_{n⃗}` be the quasi-split group over `ℚ` of [Shin 2011 §3.1]: `G_{n⃗}(R) = {(λ, g) ∈ R^× × GL_{n⃗}(F ⊗_ℚ R) : g Φ_{n⃗} ᵗg^c = λ Φ_{n⃗}}` with `Φ_{n⃗} = diag(Φ_{n₁}, …, Φ_{n_s})` the block-diagonal matrix built from `Φ_m = ((−1)^{i+1}δ_{i, m+1−j})`. Its dual group is `Ĝ_{n⃗} = ℂ^× × ∏_{σ ∈ Φ^+} GL_{n⃗}(ℂ)` (`Φ^+` the embeddings `F → ℂ` above a fixed `τ₀ : F₀ → ℂ`), with `w ∈ W_{F₀}` acting by `(λ,(g_σ)) ↦ (λ,(g_{w⁻¹σ}))`, and `w ∉ W_{F₀}` acting by `(λ, (g_σ)) ↦ (λ ∏_σ det g_σ, (Φ_{n⃗} ᵗg⁻¹_{c w⁻¹σ} Φ⁻¹_{n⃗})_σ)`. The action need not factor through `W_ℚ/W_{F₀}`. For `G = G_N` (`N = n` in Shin's notation, `N = 2n` for Caraiani–Scholze) a set of representatives of `E_ℓ(G_N)` is `{(G_N, 1, id)} ∪ {(G_{n₁,n₂}, s_{n₁,n₂}, η_{n₁,n₂}) : n₁ + n₂ = N, n₁ ≥ n₂ ≥ 1}`, where `s_{n₁,n₂} = (1, (I_{n₁}, −I_{n₂}))` and `η_{n₁,n₂}` is induced by `GL_{n₁} × GL_{n₂} ⊂ GL_N`, where, following Caraiani–Scholze, the pair `(n₁, n₂)` may be omitted when `n₁, n₂` and `[F^+ : ℚ]` are all odd (Kottwitz 1984, condition 7.4.3). Fixing a character `ϖ : 𝔸_{F₀}^×/F₀^× → ℂ^×` whose restriction to `𝔸^×/ℚ^×` is the quadratic character of `F₀` (viewed as a character of `W_{F₀}` by class field theory), the `L`-morphism `η̃_{n₁,n₂} : ^LG_{n₁,n₂} → ^LG_N` is `w ↦ (ϖ(w)^{−N(n₁,n₂)}, (diag(ϖ(w)^{ε(N−n₁)} I_{n₁}, ϖ(w)^{ε(N−n₂)} I_{n₂}))_σ) ⋊ w` for `w ∈ W_{F₀}` and `w* ↦ (a_{n₁,n₂}, (Φ_{n₁,n₂}Φ_N⁻¹)_σ) ⋊ w*` for a fixed `w* ∈ W_ℚ \ W_{F₀}`, where `ε(m) ∈ {0, 1}` is `m` mod 2, `N(n₁,n₂) = [F^+ : ℚ](n₁ ε(N − n₁) + n₂ ε(N − n₂))/2` and `a_{n₁,n₂}² = (−1)^{N(n₁,n₂)}` (Shin writes `(−1)^{−N(n₁,n₂)} det(Φ_{n₁,n₂}Φ_N)`, which is the same number since `det Φ_m = 1`). Each such datum is elliptic, the listed data are pairwise non-isomorphic, and `Out(G_{n₁,n₂}, s, η)` is trivial unless `n₁ = n₂`, when it has order 2.

*Hypotheses.* `F = F^+F₀` CM with `F^+ ≠ ℚ` allowed (Caraiani–Scholze assume `[F^+ : ℚ] > 1` for the trace formula, not for this list); the character `ϖ` fixed as above.

([S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §§3.1–3.2, (3.1)–(3.4) and the displays for `η̃_{n₁,n₂}` and `N(n₁,n₂)`, Remark 3.2 (pp. 12–14); [A. Caraiani and P. Scholze — On the generic part of the cohomology of local and global Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.2 (pp. 67–68); [G. Laumon and B. C. Ngô — Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), §0.1 (PDF pp. 1–2).)

Compute `Ĝ_N` and its Galois action from the definition of `G_N` using ReductiveGroupsPartII §§RG2.5.1–RG2.5.2's pinned dual and Weil `L`-group carriers. Prove the action law for the two displayed branches for every `w,w′∈W_ℚ`, retaining the embedding permutations. An elliptic `s ∈ Ĝ_N` modulo the centre has, in each `GL_N(ℂ)`-factor compatible with the Galois action, eigenvalues `±1` up to the centre; the Galois-fixed connected centralizers are of the form `GL_{n₁} × GL_{n₂}` (Rogawski's classification for unitary groups, adapted to similitudes in Shin §3.2). Prove equivariance and the `L`-morphism condition for `η̃` for this full action directly from the semidirect product rule (Caraiani–Scholze non-compact §5.2, p. 68, after Rogawski 1992 §1.2); Kottwitz's condition 7.4.3 removes data that do not extend to `L`-embeddings or are not relevant when all three integers are odd. The index condition `n₂ ≥ 1` (Shin) avoids repeating the principal datum; Caraiani–Scholze print `n₂ ≥ 0` (explained in the normalization calculation).

**Checks.**

- For `F⁺=ℚ(√2)` and `F₀=ℚ(i)`, an element of `W_{F₀}` interchanging the two embeddings of `F⁺` swaps the two GL factors, despite having trivial image in `W_ℚ/W_{F₀}`.
- `N = 2, [F^+ : ℚ]` even: `E_ℓ(G₂) = {G₂, G_{1,1}}`, and `G_{1,1}` has Out of order 2 (the swap of the two factors).
- `N = 3` and `[F^+ : ℚ]` odd: the pair `(n₁, n₂) = (2, 1)` is kept and there are two elliptic data.
- `N = 2` with `[F^+ : ℚ]` odd: `n₁ = n₂ = 1` and `[F^+ : ℚ]` are all odd, so the datum `G_{1,1}` may be omitted under condition 7.4.3; for `[F^+ : ℚ]` even it is present.

*Needs:* §1.4; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.5.1 (the dual group and its Galois action); `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (the global class formation and global Artin reciprocity).

### 1.9 Kneser, Hasse principle and the abelianization comparisons

Let `G` be connected reductive over a field `F` of characteristic 0. `(a)` (Kneser; recalled from AdelicAlgebraicGroups §4.1, “Local `H¹` vanishing”) If `F` is nonarchimedean local and `G` is semisimple simply connected, `H¹(F, G) = 1`. `(b)` If `F` is nonarchimedean local, `ab¹ : H¹(F, G) → H^1_ab(F, G)` is bijective and `ab⁰ : G(F) → H^0_ab(F, G)` is surjective; if `F` is archimedean or global, `ab¹` is surjective. `(c)` (Kneser–Harder–Chernousov; recalled from AdelicAlgebraicGroups §4.1, “Hasse kernel and injectivity”) If `F` is a number field and `G` is semisimple simply connected, `H¹(F, G) → ∏_{v real} H¹(F_v, G)` is bijective. `(d)` For `F` a number field, the square formed by `H¹(F, G) → H^1_ab(F, G)` and the localization to the archimedean places, `H¹(F, G) → H¹(F_∞, G) → H^1_ab(F_∞, G)`, is cartesian and all four arrows are surjective; consequently `ker¹(F, G) := ker(H¹(F, G) → ∏_v H¹(F_v, G))` maps bijectively to its abelianized analogue `ker^1_ab(F, G)`, and for an inner form `G′` of `G` the natural map `ker^1_ab(F, G′) → ker^1_ab(F, G)` is an isomorphism, so that `ker¹(F, G′)` and `ker¹(F, G)` are in canonical bijection. `(e)` For `F` a number field and a finite subset of `H¹(F, G)`, there is a maximal `F`-torus `T ⊆ G` such that the subset lies in the image of `H¹(F, T) → H¹(F, G)`. `(f)` For `F` a number field and `G` adjoint, `H¹(F, G) → ∏_v H¹(F_v, G)` is injective; hence two inner twists `(H₁,ψ₁), (H₂,ψ₂)` of a fixed connected reductive `F`-group `H` are equivalent in the sense of §1.6 whenever their localized classes in `H¹(F_v,H_ad)` agree for every place `v`. The resulting `F`-isomorphism `f:H₁→H₂` satisfies `ψ₂⁻¹∘f∘ψ₁` inner over `F̄`. `(g)` (Serre) If `F = ℝ` and `G(ℝ)` is compact, `H¹(ℝ, G)` is in bijection with the `G(ℝ)`-conjugacy classes of elements of order dividing 2 in `G(ℝ)`, functorially in `G`; and for a connected reductive subgroup `H′ ⊆ H` over `ℝ` with `H_ad(ℝ)` compact and `H′` containing the maximal `ℝ`-split central torus of `H, ker(H¹(ℝ, H′) → H¹(ℝ, H))` is trivial.

*Hypotheses.* `F` of characteristic 0; `G` connected reductive; for `(a): F` nonarchimedean local and `G` simply connected; for `(c): G` simply connected; for `(f): G` adjoint.

([J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Théorème 1.6.6 (p. 31), Proposition 1.6.7 (pp. 31–32), Théorème 1.6.9 and Théorème 1.6.10 (p. 33), Corollaire 1.6.11 (p. 34); [M. Kisin — Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), Theorem (3.4.6), p. 46; the remark after (4.3.1)(iv), p. 75; §§4.4.1–4.4.9 with Lemma (4.4.5) and its proof, p. 81; proof of Proposition (3.4.11), pp. 47–48; [T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5: Fact 3.4 (p. 13), Corollary 3.7 (p. 14), Lemma 4.9 (p. 25).)

`(a)` Kneser's theorem is imported from AdelicAlgebraicGroups §4.1, “Local `H¹` vanishing”, which states it for torsors (every torsor under a semisimple simply connected group over a nonarchimedean local field of characteristic 0 is trivial); for smooth affine groups over a field of characteristic 0, torsors are classified by Galois `H¹`. Labesse Théorème 1.6.6 states the same, citing Kneser. ReductiveGroupsPartII supplies the vanishing over the completed maximal unramified extension (ReductiveGroupsPartII §RG2.1.1), the starting point of the Bruhat–Tits proof. `(b)` Use the exact sequence of §1.5: by `(a)` the term `H¹(F, G_sc)` vanishes, giving injectivity of `ab¹` and surjectivity of `ab⁰`; surjectivity of `ab¹` uses a fundamental (elliptic) maximal torus `T`, for which `H¹(F, T) → H^1_ab(F, G)` is onto (Labesse Lemme 1.6.5, Proposition 1.6.7; Borovoi Proposition 5.1, Theorems 5.4 and 5.7). Over a number field the surjectivity is Borovoi's Theorem 5.7. `(c)` The Hasse principle for simply connected groups is imported (AdelicAlgebraicGroups §4.1, “Hasse kernel and injectivity”) in the form: an `F`-torsor under `G` is trivial iff it is trivial at every place; with `(a)` at the finite places this gives injectivity into the real places; the real-place realization theorem supplies surjectivity (Labesse Théorème 1.6.9). `(d)` Combine `(b)` and `(c)` with the density of the image of `H^0_ab(F, G)` in `H^0_ab(F_∞, G)`, proved by dévissage to a complex of tori `[T₂ → T₁]` with `T₁` induced (Labesse Théorème 1.6.10, which states the cartesian square with `H¹(𝔸_F, G)` and reduces to `F_∞` by `(b)` at the finite places, and Corollaire 1.6.11; Borovoi's theorem, recalled by Kisin as Theorem (3.4.6), who cites it as [Bo, Thm. 5.12]). `(e)` Borovoi Theorem 5.11 as used in Kisin §4.4.7: choose a maximal torus meeting each class at every place of a finite set and use `(d)`. `(f)` The Hasse principle for adjoint groups is used by Kisin (§4.3.1, proof of Corollary 4.6.5) as a known result; by Kottwitz's duality (§1.11 `(b)`, whose proof does not use `(f)`) it amounts to `ker¹(F, Z(Ĝ)) = 0` for the finite Galois module `Z(Ĝ)` when `Ĝ` is simply connected. Prove the finite-module vanishing by decomposing the centre according to the Galois orbits of simple factors and applying restriction–corestriction and the cyclic norm calculation to the resulting root-lattice quotients, as in the duality calculation of §1.11; apply this injectivity to `H_ad` and use §1.6’s classification of marked inner twists. Equality of all local cohomology classes gives equality of the global classes and hence an equivalence of twists. Kisin’s remark after (4.3.1)(iv) retains precisely these compatible inner identifications; Kaletha §5.1, p. 28, defines their equivalence. `(g)` Serre, Galois Cohomology III §4.5, Theorem 6 (recalled by Kisin, proof of Lemma 4.4.5) for compact `G(ℝ)`; the injectivity statement is Kisin Lemma 4.4.5.

**Checks.**

- For `G = SL₂` over a `p`-adic field, `H¹(F, SL₂) = 1`, while `H¹(F, PGL₂) = H^1_ab(F, PGL₂) = ℤ/2` classifies the split and the quaternion forms.
- For `G = SL₁(D)` with `D` a quaternion division algebra over `ℚ` ramified at `∞` and one prime, `(c)` identifies `H¹(ℚ, G)` with `H¹(ℝ, G)`, which has two elements.
- For `G = SO(3)` over `ℝ` (compact), `(g)` gives `H¹(ℝ, G)` of cardinality 2: the identity and the class of rotations by `π`.
- Let A and `B` be degree-three central division algebras over `ℚ` with local invariants at (2,3,5,7) equal to `(1/3,1/3,−1/3,−1/3)` and `(1/3,−1/3,1/3,−1/3)`, respectively, and zero elsewhere. Both sums vanish, so the Brauer invariant sequence gives these classes, of index three. Locally `B_v≅A_v` or `A_v^op`, and inverse on units identifies the associated projective groups for opposite algebras. Thus `PGL₁(A_v)≅PGL₁(B_v)` at every place. Globally `B` is neither A nor `A^op`, so their adjoint groups of type `A₂` are not isomorphic. Their marked local `H¹` classes differ at 3 and 5, so `(f)` does not identify their inner twists. For the algebra classification and the transpose-inverse diagram automorphism, see [Platonov–Rapinchuk–Rapinchuk, *Algebraic Groups and Number Theory*, Vol. 1](https://doi.org/10.1017/9781139017756), §1.4.1, p. 31 (global period equals index), §2.2.2, p. 83 and §2.3.4, Proposition 2.37 and the following paragraph, pp. 100–101.

The interface inner twist equivalence for equal local classes takes two inner twists of the same `H` over a number field `F` and equality of their localized cohomology classes at every place. It returns their equivalence as inner twist objects, including the compatibility of the `F`-isomorphism with their markings.

*Needs:* `TauCetiRoadmap.AdelicAlgebraicGroups` §4.1 (Weak approximation and torsors); §§1.5–1.6; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.1 (quasi-split forms and rational tori over `Ĕ`); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.Chebotarev` Layer 10 (Dirichlet-density Chebotarev); `TauCetiRoadmap.ClassFieldTheory` Layer 10 (Brauer invariant sequence); `TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras` Layers 4–6 (central simple algebras, opposite algebras and index).

### 1.10 Degree-zero abelianization and positive rational images

Let `G` be a connected reductive group over `ℚ` with `ρ : G_sc → G`. `(a) H^0_ab(ℚ, G) = H⁰(ℚ, Z(G_sc) → Z(G))` and the sequence `G_sc(ℚ) → G(ℚ) → H^0_ab(ℚ, G) → H¹(ℚ, G_sc)` is exact, so the kernel of `ab⁰` on `G(ℚ)` is `ρ(G_sc(ℚ))`; the same holds over `ℝ` and over every `ℚ_ℓ`. `(b)` Assume the Hasse principle for `G_sc`, i.e. `ker(H¹(ℚ, G_sc) → H¹(ℝ, G_sc)) = 1` (true by §1.9 `(c)`). Let `G(ℝ)_+` be the inverse image in `G(ℝ)` of the identity component (for the real topology) of `G_ad(ℝ)`, so that `G(ℝ)_+ = Z(G)(ℝ)·ρ(G_sc(ℝ))`, and `G(ℚ)_+ = G(ℚ) ∩ G(ℝ)_+` (van Hoften's convention, §3.4; it is not the identity component of `G(ℝ)`, which Kisin (3.4.7) uses: for `G = G_m` it is `ℝ^×`, not `ℝ_{>0}`). Then `G(ℚ)_+/ρ(G_sc(ℚ))` is identified by `ab⁰` with the inverse image of `ab⁰(Z(G)(ℝ))` under `H^0_ab(ℚ, G) → H^0_ab(ℝ, G)`. `(c)` If `G` and `H` are inner forms over `ℚ`, with identifications away from `p, G(𝔸_f^p) ≅ H(𝔸_f^p)`, compatible with a fixed global inner twisting on the centre complex `[Z(G_sc) → Z(G)]`, then their positive rational images agree in `G(𝔸_f^p)/ρ(G_sc(𝔸_f^p)) × (π₁(G)_I)^σ`, the second factor being the Frobenius-invariant part of the inertia coinvariants of the algebraic fundamental group at p.

*Hypotheses.* `G` connected reductive over `ℚ`; for `(b)`: the Hasse principle for `G_sc` (a theorem by §1.9 `(c)`); for `(c): G` and `H` inner forms with compatible identifications away from p.

([P. van Hoften — Mod p points on Shimura varieties of parahoric level](https://arxiv.org/abs/2010.10496v4), arXiv v4: §4.3.12 (pp. 56–57), Proposition 4.3.13 (p. 57, proof p. 58), Lemma 4.3.14 and Corollary 4.3.15 (p. 57); §3.4 (p. 40) for `G(ℝ)_+` and `G(ℚ)_+`.)

`(a)` Exactness is the degree-zero part of the exact sequence of §1.5; the centre complex computes `H^0_ab` by the quasi-isomorphism there (van Hoften §§4.3.12–4.3.13, after Borovoi). `(b)` An element `g ∈ G(ℚ)` with `ab⁰(g)` in `ab⁰(Z(G)(ℝ))` satisfies `g = z·ρ(h)` with `z ∈ Z(G)(ℝ), h ∈ G_sc(ℝ)` in `G(ℝ)`, so `g ∈ G(ℝ)_+` (`G_sc(ℝ)` is connected); conversely, an element of `H^0_ab(ℚ, G)` with real image in `ab⁰(Z(G)(ℝ))` maps to a class of `H¹(ℚ, G_sc)` trivial at `∞`, hence trivial by the Hasse principle, so it comes from `G(ℚ)` (van Hoften Lemma 4.3.14, Corollary 4.3.15). `(c)` The inner twisting does not change the centre complex, so `H^0_ab(ℚ, G) = H^0_ab(ℚ, H)` compatibly with the local maps; apply `(b)` to both groups and compare images through the away-from-`p` identifications and the Kottwitz map at `p` (van Hoften Proposition 4.3.13).

**Checks.**

- For `G = GL₂` over `ℚ: H^0_ab(ℚ, GL₂) = ℚ^×` via det, `G(ℚ)_+` is the set of rational matrices of positive determinant, and `(b)` identifies `G(ℚ)_+/SL₂(ℚ)` with `ℚ_{>0}`.
- For `G = SL₂` (simply connected) both sides of `(b)` are trivial.
- For `G = G_m: G(ℝ)_+ = ℝ^×` and `G(ℚ)_+ = ℚ^×`, and `(b)` holds since `ab⁰(Z(G)(ℝ)) = ℝ^×`; with the identity component `ℝ_{>0}` of `G(ℝ)` in place of `G(ℝ)_+` the identification in `(b)` would fail.

*Needs:* §1.5; §1.9; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism).

### 1.11 Kottwitz's map and the duality for reductive groups

Let `F` be a field of characteristic 0 and `G` connected reductive over `F`, with dual group `Ĝ` (complex), its centre `Z(Ĝ)` with the Galois action of ReductiveGroupsPartII §RG2.5.2 (the `L`-group and its functoriality), and `A(G) := π₀(Z(Ĝ)^Γ)^D` (Pontryagin `dual`). `(a)` (Local) If `F` is local there is a unique extension of the Tate–Nakayama isomorphisms for tori to a morphism of functors `α_G : H¹(F, G) → A(G)` on the category of connected reductive groups and normal homomorphisms (Kottwitz 1986, Theorem 1.2). It factors through `ab¹` and an injective homomorphism `H^1_ab(F, G) → A(G)`. For finite `F/ℚ_p`, use the supplied pointed bijection `localTorsorKottwitz` followed by the canonical identification `(π₁(G)_Γ)_tors≅A(G)`; the target here is its agreement with `ab¹` and the dual-centre description. The group structure transported to `H¹(F, G)` is Kottwitz's. If `F = ℝ`, the fibre of `α_G` over 0 is the image of `H¹(ℝ, G_sc)`, and the image of `α_G` is the annihilator of the image of the norm `N_{ℂ/ℝ}` on `Z(Ĝ)`; `α_G` is not bijective in general and `H¹(ℝ, G)` is not a group. For a maximal torus `S ⊆ G, α_G` restricted along `H¹(F, S) → H¹(F, G)` is `α_S` followed by the restriction `A(S) → A(G)` dual to `π₀(Z(Ĝ)^Γ) → π₀(Ŝ^Γ)`; a class of `H¹(F, S)` comes from `H¹(F, G_sc)` exactly when `α_S` of it annihilates the image of `π₀(Z(Ĝ)^Γ) → π₀(Ŝ^Γ)`. Equivalently, via ReductiveGroupsPartII §RG2.5.2 (the `L`-group and its functoriality), for `F` nonarchimedean `H¹(F, G) ≅ (π₁(G)_Γ)_tors`. `(b)` (Global) If `F` is a number field, `H^1_ab(𝔸_F/F, G) ≅ A(G)` canonically; `ker¹(F, G) = ker^1_ab(F, G) ≅ ker¹(F, Z(Ĝ))^D`. Kottwitz's Tamagawa-number formula `τ(G) = #π₀(Z(Ĝ)^Γ)/#ker¹(F, Z(Ĝ))` is not part of this construction.

*Hypotheses.* `F` of characteristic 0, local for `(a)`, a number field for `(b)`; `G` connected reductive.

([R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §1.2, Theorem 1.2 (p. 368); §2.2, Theorem 2.2 (p. 374); [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 1.7.3 (pp. 38–39) and Corollaire 1.7.4 (p. 39); [T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5: Kottwitz's Theorem 1.2 as used in Corollary 3.8 (p. 15), Lemma 4.9 (p. 25), §4.7, Corollary 5.4 and Lemma 5.7.)

`(a)` For finite `F/ℚ_p`, the character lattice of `Z(Ĝ)^Γ` is `π₁(G)_Γ`; its torsion subgroup is the character group of `π₀(Z(Ĝ)^Γ)`, giving the canonical comparison with `A(G)`. Compare the supplied `localTorsorKottwitz` with the centre-complex pairing after `ab¹`: they agree on tori by the supplied torus normalization and §1.2, and a `z`-extension and maximal-torus lifts give equality for reductive `G` (Kottwitz 1986, Theorem 1.2; Labesse Proposition 1.7.3). The finite-local bijection itself is supplied, including its local Tate–Nakayama and simply connected vanishing inputs specified in the supplier contract. For real `F`, construct `α_G` from fundamental tori and the Tate–Nakayama pairing, and prove its stated image and fibres; for `ℂ` both sides are trivial. Injectivity on `H^1_ab` follows from duality for the centre complex (Labesse Proposition 1.7.3). `(b)` Global: Labesse Proposition 1.7.3 (global part), from the global Tate–Nakayama isomorphism for the centre complex (§1.2 `(b), (c)`) and the cofinality of splitting fields; `ker¹(F, G) = ker^1_ab(F, G)` is §1.9 `(d)`.

**Checks.**

- For the norm-one torus of a quadratic extension of any finite `F/ℚ₂`, the sign action on `X_*=ℤ` gives coinvariants `ℤ/2` and zero invariants. The dual-centre comparison of `localTorsorKottwitz` gives the two norm classes; replacing coinvariants by invariants would lose the nonneutral class.
- For `G = PGL₂` over a `p`-adic field: `Ĝ = SL₂(ℂ), Z(Ĝ) = μ₂, A(G) = ℤ/2` and `H¹(F, PGL₂)` has two elements (split and quaternion forms).
- For `G = SL₂: Z(Ĝ) = {1}` for `Ĝ = PGL₂(ℂ)`, so `A(G) = 0`, matching Kneser's vanishing.
- For `G = U(1)` over `ℝ` attached to `ℂ/ℝ: α_G` is a bijection `H¹(ℝ, U(1)) = ℤ/2 ≅ A(G)`.
- For `G = SU(2)` compact over `ℝ: H¹(ℝ, G)` has two elements (identity and `−1` up to conjugacy, §1.9 `(g)`) while `A(G) = π₀(Z(Ĝ)^Γ)^D` for `Ĝ = PGL₂(ℂ)` is trivial, so `α_G` is not injective over `ℝ`.

*Needs:* `TauCetiRoadmap.PadicHodgeTheory` §5.5 (the shared finite-local torsor bijection); §1.2; §1.5; §1.9; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism); `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group).

### 1.12 Integral `z`-extensions of reductive models

For a reductive group scheme `G` over `ℤ_(p)`, construct a central surjection of reductive `ℤ_(p)`-group schemes `G₁→G` with induced torus kernel and simply connected derived group `G₁^der`. Unlike the field-valued `z`-extension of ReductiveGroupsPartII, this target retains a reductive integral model, its central kernel and the base-change square to `ℚ` and `ℤ_p`. The integral torsor triviality and the rational Kottwitz-kernel theorem used in its applications are supplied at the boundary above.

The API consists of the integral `z`-extension model, its central kernel, its simply connected derived group, its generic fibre and its base change; it retains the surjection and its compatibility with change of base. Carry out the field `z`-extension construction using a Galois permutation lattice that extends across `ℤ_(p)`, and check centrality and reductivity on the fibres. The local applications combine this model with the existing integral Lang theorem and rational Kottwitz surjectivity. ([M. Kisin — Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), proof of Proposition 3.6.10, p. 58.)

**Checks.**

- `GL_n` over `ℤ_(p)` already has simply connected derived group `SL_n`: the identity extension, with trivial induced-torus kernel, is allowed.
- `GL₂→PGL₂` over `ℤ_(p)` has central kernel `G_m` and derived group `SL₂`; its generic fibre is the usual `z`-extension. This works at `p=2` as well: no étaleness of `μ₂` is required.
- A central finite cover `SL₂→PGL₂` alone is not a `z`-extension: its kernel `μ₂` is not an induced torus. Passing only to the generic fibre would miss this distinction at `p=2`.
- Base change of the `GL₂` extension to `ℤ_p` and then `ℚ_p` agrees with direct base change to `ℚ_p`, including the central `G_m` kernel.

*Needs:* `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (field `z`-extensions); §RG2.3.7 (Lang's theorem and lifting); §RG2.4.2 (*kottwitz-quotient*, *kottwitz-rational-surjectivity*); §1.9.

### 1.13 The Kottwitz sign of an inner form

Let `F` be a local field of characteristic 0, `G*` a quasi-split connected reductive group over `F` and `G` an inner form of `G*`. The Kottwitz sign is defined cohomologically by the inner-twist class and the half-root character on the simply connected derived centre. Over a nonarchimedean `F` it is `e(G)=(−1)^{r(G*)−r(G)}`, where `r` is the `F`-rank of the derived group. Over `ℝ` it is `e(G)=(−1)^{q(G*)−q(G)}`, where `q` is half the real dimension of the symmetric space of the simply connected derived group; `q` can be half-integral, but its difference for inner forms is integral. Over `ℂ` every inner form is isomorphic to the quasi-split form and `e=1`. Thus `e(G)∈{±1}`; it depends only on the class `h ∈ H¹(F, G*_ad)` of the inner twist, and is the value at `h` of a map `H¹(F, G*_ad) → {±1}`. In dual terms (Hansen–Kaletha–Weinstein): if `h` corresponds under `α_{G*_ad}` (§1.11) to `ν ∈ X^*(Z(Ĝ_sc)^Γ)`, the dual group of `G*_ad` being `Ĝ_sc`, then `e(G) = (−1)^{⟨2ρ, ν⟩}`, with `2ρ` the sum of the positive coroots of `Ĝ_sc` and the pairing taken modulo 2 after lifting `ν` to a character of a maximal torus. Properties: `e(G*) = 1`; `e(G)` depends only on the isomorphism class of the inner form; for `F` global and `G` a connected reductive group over `F, ∏_v e(G_{F_v}) = 1`.

*Hypotheses.* `F` local of characteristic 0 (product formula: `F` global); `G` an inner form of the quasi-split group `G*`.

([J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Définition 1.7.1 and Lemme 1.7.2 (p. 37); [D. Hansen, T. Kaletha and J. Weinstein — On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/abs/1709.06651v4), arXiv v4, Appendix A.2, Lemma A.2.1 (p. 85); [R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §5.1 (p. 379).)

The interface consists of the following operations and identities.

- `e(G) ∈ ℤˣ` for an inner form `G` of a quasi-split group over a local field of characteristic 0.
- for nonarchimedean `F, e(G)=(−1)^{r(G*)−r(G)}` with `r` the `F`-rank of the derived group. The real comparison instead uses the symmetric-space half-dimension `q`.
- `e(G)=(−1)^{q(G*)−q(G)}` for real inner forms, with the integral difference specified above.
- Numerical rank differences use integer subtraction in the exponent of `−1`, even when the two ranks are nonnegative integers. Their application to derived ranks is nonarchimedean; a real application needs integral `q`-values or their integral difference.
- `e(G) = (−1)^{⟨2ρ, ν⟩}` for `ν` the character of `Z(Ĝ_sc)^Γ` attached to the inner twist.
- `e(G*) = 1`.
- `∏_v e(G_v) = 1` for a connected reductive group over a number field.
- `e(G₁ × G₂) = e(G₁) e(G₂)` and `e(Res_{E/F} G) = e(G)`.

Well definedness: `α_{G*_ad}` is defined on `H¹(F, G*_ad)` (§1.11), and `⟨2ρ, ν⟩` mod 2 does not depend on the choice of positive system because two choices differ by the Weyl group, which fixes `Z(Ĝ_sc)`. Comparison with the nonarchimedean `F`-rank formula: Kottwitz, 'Sign changes in harmonic analysis on reductive groups' (cited by Kottwitz 1986 §5.1 and by Labesse Définition 1.7.1); the dual-group formula is Hansen–Kaletha–Weinstein Lemma A.2.1 (published Appendix A.2, pp. 71–72). For real discrete-series groups, Adams–Kaletha, *Discrete series L-packets for real reductive groups* (2026), Theorem 2.7.7 and its `q` convention (p. 164), and §6.1 (p. 203), give the symmetric-space convention. The general real comparison remains Kottwitz 1983, pp. 289–297, rather than a rank-parity assertion. Product formula: the sum over all places of the local invariants of a global class in `H¹(F, G_ad)` is trivial, which follows from the global duality of §1.11 `(b)` (Labesse Lemme 1.7.2, from Proposition 1.6.12).

**Checks.**

- Rank pairs `(0,0)` and `(1,0)` give signs `+1` and `−1`. The latter agrees with the quaternionic `GL₂` inner form. Derived ranks `n−1` and `r−1` give exponent `n−r`, for `1≤r≤n`.
- `e(G*) = 1` for every quasi-split `G*`.
- For `D^×` with `D` a quaternion division algebra over a `p`-adic `F`, an inner form of `GL₂, e(D^×) = −1`; more generally `e(GL_m(D)) = (−1)^{n − m}` for `D` central division of degree `d` over `F` and `n = md`.
- For the compact form `U(n)` of the quasi-split unitary group over `ℝ, e(U(n))=(−1)^{⌊n²/4⌋}: q(U(n))=0` and `q(U(a,b))=ab`, with `(a,b)=`(⌈`n/2`⌉,⌊`n/2`⌋) for the quasi-split form. In particular compact `U(3)` has sign `+1`; using its real-rank difference would incorrectly give `−1`. The compact `U(2)` and `U(4)` signs are `−1` and `+1`.
- For a quaternion algebra `B` over `ℚ, ∏_v e(B_v^×) = (−1)^{#ramified places} = 1`, recovering that a quaternion algebra over `ℚ` ramifies at an even number of places.
- `e(G)` is not `(−1)^{rank G}`: for `GL₂` and its inner form `D^×` both have absolute rank 2 but `e` differs.

*Needs:* §1.11; §1.6; `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory).

### 1.13a Cohomology of rational parabolics and Levi subgroups

For a field `F` of characteristic zero, a connected reductive `F`-group `G`, an `F`-parabolic `P` with unipotent radical `U` and an `F`-Levi `M`, inclusion and projection give inverse bijections `H¹(F,M)≅H¹(F,P)`. The map `H¹(F,P)→H¹(F,G)` is injective as a map of pointed sets, hence so is `H¹(F,M)→H¹(F,G)`. These assertions hold after twisting by any `M`-cocycle, as required for injectivity on every fibre.

*Hypotheses.* `P` and `M` are defined over `F`; `M` is a Levi of a rational parabolic, rather than an arbitrary reductive subgroup.

([S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), proof of Lemma 3.5, p. 11; [J.-P. Serre — Galois Cohomology](https://doi.org/10.1007/978-3-642-59141-9), III §2.1, Exercise 1.)

Filter `U` and each `M`-twist of `U` by `F`-split unipotent groups; additive Hilbert 90 gives trivial `H¹` for these kernels. The split extension `P=M⋉U` then gives the first bijection on every twisted fibre. For the second assertion prove rational conjugacy of parabolic subgroups of the same type in each inner twist of `G` using relative Bruhat decomposition: the rational points of its parabolic homogeneous space form one orbit. The nonabelian cohomology exact sequence for that homogeneous space gives injectivity.

**Checks.**

- For `P=G, M=G` both maps are identities.
- For a Borel of `GL₂` with diagonal Levi, `H¹(F,M)=H¹(F,P)=H¹(F,GL₂)=1` by Hilbert 90.
- For `Sp₄` over a `p`-adic field with `M=GL₁×SL₂` and a strongly regular `T` whose `SL₂` factor is elliptic, both kernels `D(T,M;F)` and `D(T,G;F)` are `H¹(F,T)≅ℤ/2`. The two rational classes remain distinct.
- Over `ℝ` the compact torus `U(1)⊂SL₂` is not a Levi of a rational parabolic: `H¹(ℝ,U(1))` has two elements but `H¹(ℝ,SL₂)=1`. The parabolic hypothesis is necessary.

*Needs:* §1.1; `TauCetiRoadmap.ReductiveGroups` Layer 7 (parabolic structure and rational conjugacy).

### 1.14 Rational classes inside a stable class

Let `F` be a field of characteristic 0, `G` connected reductive over `F, δ ∈ G(F)` semisimple and `I = I_δ` its stable centralizer. `(a)` Sending `δ′ = x⁻¹δx` (stably conjugate) to the class of `σ ↦ x σ(x)⁻¹` gives a bijection between the `G(F)`-conjugacy classes in the stable class of `δ` and the image of `D(I, G; F) := ker[H¹(F, I) → H¹(F, G)]` in `ker[H¹(F, G_δ) → H¹(F, G)]`; when `I = G_δ` (e.g. `δ` strongly regular, or `G_der` simply connected and `G_δ` connected) the conjugacy classes are in bijection with `D(I, G; F)`, and the class of `(δ, δ′)` is denoted `inv(δ, δ′)`. `(b)` If `F` is local, `D(I, G; F)` is finite, and when `I = T` is a torus and `F` is nonarchimedean it is a finite abelian group. Over `ℝ` it is only a finite pointed subset of `H¹(ℝ,T)`, and need not be a subgroup. In either case `D(T, G; F) ⊆ E(T, G; F) := ker[H¹(F, T) → H^1_ab(F, G)] = ker[A(T) → A(G)]` (Kottwitz's `𝔈(T/F)`), with equality if `F` is nonarchimedean; and via §1.2 and §1.11, `E(T, G; F)` is Pontryagin dual to Kottwitz's `𝔎(T/F)`, the subgroup of `π₀((T̂/Z(Ĝ))^Γ)` of classes whose image in `H¹(F, Z(Ĝ))` is trivial (equivalently the cokernel of `π₀(Z(Ĝ)^Γ) → π₀(T̂^Γ)`), so that characters `κ` of `E(T, G; F)` are given by `Γ`-invariant elements of `T̂/Z(Ĝ)` that lift to `T̂^Γ`, up to the identity component. `(c)` (Steinberg's relatedness lemma) If `F` is a `p`-adic field and `δ, δ′` are strongly regular and stably conjugate, they are conjugate over the completed maximal unramified extension `F̆`, because `H¹(F̆, T) = 0`. `(d)` (Rationality) If `G` is quasi-split and `G_der` is simply connected, every stable (= geometric) semisimple class of `G(F̄)` that is stable under `Γ_F` contains an element of `G(F)`. `(e)` For an `F`-Levi `M` of an `F`-parabolic of `G`, inv is compatible with `M ⊆ G` through `H¹(F, I^M) → H¹(F, I^G)`. If `δ` is strongly regular in `G`, both centralizers are the same torus `T` and the injectivity of `H¹(F,M)→H¹(F,G)` identifies `D(T,M;F)` with `D(T,G;F)`.

*Hypotheses.* `F` of characteristic 0 (local for `(b), p`-adic for `(c)`); `G` connected reductive; for `(d): G` quasi-split with simply connected derived group.

([J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §2.3 after Définition 2.3.4 (pp. 53–54); proof of Théorème 2.4.2 (p. 56); [R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), Introduction (p. 366); §4.1–4.6, definitions of `𝔇, 𝔈, 𝔎` (pp. 378–379); [D. Hansen, T. Kaletha and J. Weinstein — On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/abs/1709.06651v4), arXiv v4, Lemma 3.2.1 (p. 17); [T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, Fact 3.4 (p. 13).)

`(a)` Labesse §2.3 after Définition 2.3.4: the pair (`x`, a) gives a class in `H⁰(F, I\G)`, whose image in `H¹(F, I)` lies in `D(I, G; F)`; the fibres of `H⁰(F, I\G) → G(F)` are the kernels displayed there, giving the parametrization through the image in `ker[H¹(F, G_δ) → H¹(F, G)]` (also Kottwitz 1986 Introduction and §4.1). `(b)` Finiteness: local `H¹` of linear algebraic groups is finite (Kaletha Fact 3.4, citing Platonov–Rapinchuk Theorem 6.14); `E(T, G; F)` is the abelianized kernel and the comparison with `D` uses §1.9 `(b)`; the duality with `K(T, G; F)` is §1.2 `(a)` and §1.11 `(a)` (Kottwitz 1986 §§4.4–4.6). `(c)` Steinberg: `H¹(F̆, T) = 0` for every torus over `F̆` (ReductiveGroupsPartII:ReductiveGroupsPartII §RG2.1.1, which states that `H¹(L, H) = 1` for connected reductive `H` over the completed maximal unramified extension); conjugacy over `F̄` by `x` with `xσ(x)⁻¹ ∈ T` and vanishing of the class over `F̆` give conjugacy over `F̆` (Hansen–Kaletha–Weinstein Lemma 3.2.1). `(d)` Kottwitz 1982 Theorem 4.4 as cited by Labesse in the proof of Théorème 2.4.2; the transfer of tori in §1.6 (ii) is the same argument. `(e)` Functoriality of `H¹` for `M ⊆ G`; use the parabolic and Levi cohomology comparison of §1.13a for the injectivity assertion.

**Checks.**

- `G = GL_n: D(T, GL_n; F) = 0` for every maximal torus `T` (Hilbert 90 and Shapiro), so stable = rational conjugacy.
- `G = SL₂` over `p`-adic `F, T` elliptic attached to quadratic `E/F: D(T, SL₂; F) = H¹(F, T) = F^×/N E^× ≅ ℤ/2`, two rational classes in each regular stable class of `T`; for `T` split, `D = 0`.
- Split torus `T = G: D(T, T; F) = 0`.
- Nonsplit unitary group `G = U(1, 1)` attached to `E/F` with `T ≅ U(1) × U(1)` elliptic: `H¹(F, T) = (ℤ/2)², H^1_ab(F, G) = ℤ/2` and `D(T, G; F) = E(T, G; F) = ker` of the sum map, of order 2 (Leslie Lemma 1.8 pattern with `S₁ = {1, 2}`).
- For `G=Sp₄` over `p`-adic `F` and `M≅GL₁×SL₂`, choose a strongly `G`-regular element whose `SL₂` factor is elliptic. Its two `M(F)`-classes remain two `G(F)`-classes: both kernels are `H¹(F,T)≅ℤ/2`. This is a test of compatibility, not an example of merging classes.
- Over `ℝ` let `G=U(2,1)` and `T=U(1)³` with diagonal Hermitian form `(1,1,−1)`. Among the eight sign twists, exactly (+++),(+−−),(−+−) retain signature (2,1), so `D(T,G;ℝ)` has three elements. Their product can be (−−+), which changes the signature. By contrast `E` is the four-element even-parity subgroup. Thus the real `D` is not a group.

*Needs:* §1.13a; §1.3; §1.5; §1.9; §1.2; §1.11; §1.6; §1.1; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.1 (quasi-split forms and rational tori over `Ĕ`).

### 1.15 The global obstruction for adelic stable classes

Let `F` be a number field and `G` connected reductive over `F` with `G_der` simply connected (the standing assumption of Kottwitz 1986 §6), `γ₀ ∈ G(F)` semisimple with centralizer `I₀` (connected reductive, as `G_der` is simply connected), and `γ = (γ_v)_v ∈ G(𝔸_F)` conjugate to `γ₀` under `G(𝔸_F ⊗_F F̄)`, so that each `γ_v` is stably conjugate to `γ₀`. (Kottwitz allows `γ₀` in a quasi-split inner form `G₀` of `G`, transported by an inner twisting `ψ : G₀ → G`; the case stated here is `G₀ = G`, the one the product formula `(c)` uses.) Let `inv_v(γ₀, γ_v) ∈ D(I₀, G; F_v)` be the local invariants (§1.14) and `α_v` their images in `A(I₀/F_v) := π₀(Z(Î₀)^{Γ_v})^D`. `(a)` Let `𝔎(I₀/F)` be the group of `κ ∈ π₀((Z(Î₀)/Z(Ĝ))^Γ)` whose image in `H¹(F, Z(Ĝ))` is locally trivial; almost all `α_v` vanish, and obs`(γ) ∈ 𝔎(I₀/F)^D` is the character `κ ↦ ∏_v α_v(κ_v)` of the localizations `κ_v`. `(b)` If `G_sc` has no `E₈` factor, `γ` is `G(𝔸_F)`-conjugate to an element of `G(F)` stably conjugate to `γ₀` if and only if obs`(γ)` is trivial (Kottwitz 1986, Theorem 6.6; the `E₈` restriction comes from the Hasse principle, which is now known for `E₈` by Chernousov, so it can be removed). `(c)` For `κ ∈ 𝔎(I₀/F), ⟨`obs`(γ), κ⟩ = ∏_v ⟨inv_v(γ₀, γ_v), κ_v⟩`, the product formula used to stabilize the elliptic terms; the number of `G(F)`-classes in `G(F) ∩` (stable class of `γ₀`) adelically conjugate to `γ` is `|ker¹(F, I₀)|`-weighted as in Kottwitz 1986 §9.

*Hypotheses.* `F` a number field; `G` connected reductive with `G_der` simply connected; for `(b) G_sc` without `E₈` factors (removable by Chernousov's Hasse principle for `E₈`).

([R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §6 (standing assumptions) and §§6.1–6.6 (pp. 381–383), Lemma 6.3 and Theorem 6.6 (p. 382); §§6.7–6.10 with (6.10.1) (p. 384); §9 (pp. 391–396); [S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.2, Definition 4.2 and (4.1)–(4.2) (pp. 13–14); [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Théorème 1.6.9 (p. 33).)

Construct `obs₁(γ)` first using `G_sc(𝔸)`-conjugacy and the Hasse principle for `G_sc` (Kottwitz 1986 §6.1–6.3, Lemma 6.3), then pass to obs`(γ)` using the global duality `ker¹(F, I₀) ≅ ker¹(F, Z(Î₀))^D` of §1.11 `(b)` and Tate–Nakayama for the global-mod-local cohomology (§1.2 `(b)`). The criterion `(b)` is Kottwitz 1986 Theorem 6.6; the Hasse principle input is §1.9 `(c)`, which includes `E₈` (Labesse Théorème 1.6.9). The product formula `(c)`: Kottwitz 1986 §6.7 gives obs`(γ′) =` obs`(γ)·inv(γ, γ′)` for adelic elements of one geometric class; apply it with `γ₀`, whose obstruction is trivial, and use the local duality of §1.11 `(a)`. Kottwitz's conjecture (6.10.1), which identifies the adelic transfer factor with ⟨obs`(γ), κ⟩`, is the theorem of Langlands–Shelstad stated in §2.7 `(f)`.

The API consists of the product formula for the global stable obstruction, the rational characterization and the base point; it records respectively the product formula, the rational-realization criterion under the hypotheses of `(b)`, and triviality at `γ₀`.

**Checks.**

- For `SL₂` and a quadratic elliptic centralizer, nontrivial invariants at two distinct nonsplit finite places have sum zero. Such local classes satisfy the rational-realization criterion; testing each place separately would incorrectly reject them.

- For `G = GL_n` every adelic element stably conjugate everywhere to `γ₀ ∈ GL_n(F)` is `G(𝔸)`-conjugate to `γ₀` (obs is trivial because `𝔎(I₀/F) = 1` for centralizers that are products of restrictions of scalars of GL's).
- For `G = SL₂` and `γ₀` regular elliptic with splitting field `E`: the local invariants lie in `ℤ/2` at each place nonsplit in `E`, and obs`(γ)` is their sum; an adelic element whose invariants are nontrivial at exactly one place is not conjugate to a rational element.

*Needs:* §1.14; §1.11; §1.2; §1.9; `TauCetiRoadmap.ArithmeticGaloisDuality` §R02.3.1 (The group `G_{K,S}`, finiteness and localisation).

### 1.16 Images and norms: matching of strongly regular classes

Let `(H, ℋ, s, ξ)` be an endoscopic datum for `(G, θ, ω)` over `F` of characteristic 0, and write `G̃=Gθ`. Choose an inner twist `ψ:G→G*`, a pinned quasi-split automorphism `θ*`, lifts `u(σ)∈G*_sc` with `ψσ(ψ)⁻¹=Int(u(σ))`, and `g_θ∈G*_sc` with `θ*=Int(g_θ)ψθψ⁻¹`. Construct the central cocycle

`z(σ)=g_θ u(σ) σ(g_θ)⁻¹ θ*(u(σ))⁻¹ ∈ Z(G*_sc)`.

The dual torus map gives `ξ_T:(T*)_{θ*}≅T_H`; set `z_H=ξ_T(z)∈Z¹(F,Z(H))`. Define `H_z` by descent from `H_F̄` with action `σ⋆h=z_H(σ)⁻¹σ(h)`. It is an `H`-torsor, with the descended conjugation action of `H`, rather than a group with its ordinary descent. Construct the descended semisimple-class map from `H_z` to `G̃`; geometrically it is `T_H/Ω_H→(T*)_{θ*}/Ω^{θ*}`. This map is equivariant for the descended actions; the ordinary action on the target torus quotient does not describe the rational classes of `G̃` when `z_H` is nontrivial. Define strong `G`-regularity and matching on `H_z(F)×G̃(F)` through this map. Rational classes are `H(F)`-orbits and stable classes are geometric `H`-orbits meeting `H_z(F)`.

For the chosen `z`-pair `H₁→H` of §1.7, if `H_z(F)` is nonempty choose a geometric lift `γ₀∈H₁(F̄)` of a point of `H_z(F)`. The cocycle `z_{H₁}(σ)=γ₀⁻¹σ(γ₀)∈Z(H₁)` lifts `z_H`. Descend `H₁` with `σ⋆h₁=z_{H₁}(σ)⁻¹σ(h₁)` to obtain `H_{1,z}` and its `H`-conjugation and `Z₁`-translation actions. Prove that `H_{1,z}(F)→H_z(F)` is surjective, define its rational and stable classes using `H`, and pull back matching to `𝒟₁⊆H_{1,z}(F)×G̃(F)`. Changing `γ₀` transports the descended spaces, actions, matching and orbital distributions together. If `H_z(F)=∅`, set `𝒟₁=∅` and use the zero test-function space and stable orbital quotient in §2.11, without choosing a lift. A rational point gives a torsor identification with `H(F)`, but does not on its own identify the conjugation action with ordinary group conjugation.

In ordinary endoscopy take `θ=1, g_θ=1`, so `z=z_H=1` and use `H_z=H, H_{1,z}=H₁` with their ordinary actions. A strongly `G`-regular `γ_H∈H(F)` has an image in quasi-split `G(F)` by §1.14 `(d)` and `z`-extensions; for inner `G` it need not. For cyclic base change `G=Res_{E/F}G₀, ω=1`, the compatible componentwise inner twist has `z=1` (Waldspurger §1.9), giving the ordinary carrier and action. Every semisimple `δ∈G₀(E)` has a norm in the quasi-split inner form `H(F)`, and the norm is injective on stable twisted classes. Lie-algebra matching uses the ordinary Chevalley map `𝔠_H→𝔠`.

*Hypotheses.* `F` of characteristic 0; `(H, ℋ, s, ξ)` an endoscopic datum (ordinary or twisted).

([J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §§1.2–1.5, central cocycles, display (5), descended carriers and orbital integrals (pp. 7–12), and §1.9 (p. 16); [R. P. Langlands and D. Shelstad — On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §1.3 (p. 225) and §1.4 (p. 226); [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §2.4, Définition 2.4.1, Théorème 2.4.2, Lemme 2.4.3 (pp. 54–56); §§2.5–2.6, Propositions 2.5.2, 2.5.3, Théorème 2.6.3 (pp. 58–65).)

The interface consists of the following operations and identities.

- The descended class map from `H_z` to `G̃`, with the central cocycles, lifted `z`-pair carrier and actions above; its ordinary specialization has source H.
- Strong `G`-regularity on `H_z(F)` and its inverse image in `H_{1,z}(F)`, specialized to `H(F)` in ordinary endoscopy.
- The relation `(γ_H, δ) ∈ 𝒟`.
- Matching depends only on the stable classes of `γ_H` and of `δ`.
- For quasi-split `G` every strongly `G`-regular `γ_H ∈ H(F)` has an image in `G(F)`.
- The base-change norm map on stable classes, injective.
- Every semisimple element of `G(F) = G₀(E)` has a norm in `H(F)`.
- The Lie-algebra version `𝔠_H → 𝔠` of the class map.

Centrality and the cocycle identities follow from the inner-twist relation (Waldspurger §§1.2–1.3). Centrality makes conjugation compatible with descent. The lifted construction and its rational surjectivity use §1.4 and `H¹(F,Z₁)=1`; §1.5 defines the orbital distributions by integration over `H_γ(F)\H(F)` and stable summation. Construct the geometric map `T_H/Ω_H → (T*)_{θ*}/Ω^{θ*}` from the dual isomorphism given by `ξ` on maximal tori (Waldspurger 2008 §1.3; Langlands–Shelstad §1.3 for the ordinary case, where admissible embeddings `T_H → T` are those induced by `ξ` up to `Ĝ`-conjugacy). Strong `G`-regularity implies strong regularity in `H` (Waldspurger 2008 §1.3, citing Kottwitz–Shelstad Lemma 3.3.C). Existence of images in quasi-split `G`: Kottwitz's rationality theorem for quasi-split groups with simply connected derived group and reduction through `z`-extensions (§1.14 `(d)`). Base change norms: Labesse Définition 2.4.1 and Théorème 2.4.2 (every semisimple `δ` has a norm), Lemme 2.4.3 (injectivity on stable classes, after Kottwitz), and the descriptions of the image of the norm locally (Propositions 2.5.2–2.5.3) and globally (Théorème 2.6.3).

**Checks.**

- For the principal datum of quasi-split `G (H = G, s = 1)` the image of `γ_H` is its own stable class.
- For `G = SL₂` and `H = R^1_{E/F} G_m, γ_H = u ∈ E¹ \ {±1}` corresponds to the stable class of elements with eigenvalues `u, ū`; two `G(F)`-classes lie in it.
- For `G = R_{E/F} G_m` and `θ` the Galois automorphism, the norm of `x ∈ E^×` is `N_{E/F}(x) ∈ F^×` and the set of norms is `N E^×`.
- A nonneutral class `[z_H]∈H¹(F,H)` gives `H_z(F)=∅`: the matching set, test-function space and stable orbital quotient are empty or zero as appropriate. Surjectivity of ordinary `H₁(F)→H(F)` does not create a point of `H_z`.
- If `z_H=1`, choose `γ₀=1`. Then `z_{H₁}=1` and the descended orbital integrals are exactly the ordinary ones with the same quotient measures. For cyclic base change the componentwise construction has this specialization.
- Under a chosen torsor point `h₀`, conjugation transports to `x↦a x h₀ a⁻¹h₀⁻¹`; it is ordinary conjugation only when that extra transport is trivial. This checks the action as well as the underlying point set.
- For `G = D^×` (`D` a quaternion division algebra) and the principal datum `H = GL₂`, a split regular `γ_H ∈ GL₂(F)` has no image in `D^×`, since `D^×` has no split maximal torus.

*Needs:* §1.4; §1.3; §1.14; §1.6; `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism).

### 1.17 Centralizers, stable classes and matching for unitary Lie algebras

Let `E/F` be a quadratic extension of nonarchimedean local fields of characteristic 0 with Galois conjugation `c` and norm character `η_{E/F}, V` a nondegenerate Hermitian space of dimension `n` over `E, U(V)` its unitary group and `Herm(V)` the `F`-space of Hermitian endomorphisms (the Lie algebra of `U(V)` up to the scalar `ε` with `ε^c = −ε`). `(a)` (Centralizers) For regular semisimple `δ ∈ Herm(V)` write `F[δ] = F[X]/(char_δ) = ∏_{i=1}^m F_i` (`F_i/F` fields), `E_i = E ⊗_F F_i`, and `S₁ = {i : F_i ⊉ E}, S₂` its complement. The centralizer `T_δ` of `δ` in `U(V)` is the torus of norm-one elements of `E[δ] = E ⊗_F F[δ]`, so `T_δ(F) ≅ ∏_{i ∈ S₁} E_i¹ × ∏_{i ∈ S₂} F_i^×` with `E_i¹` the norm-one elements of `E_i/F_i`; `H¹(F, T_δ) ≅ ∏_{S₁} ℤ/2`; and `E(T_δ, U(V); F) = ker(H¹(F, T_δ) → H^1_ab(F, U(V))) = ker(∏_{S₁} ℤ/2 → ℤ/2)`, the map being the sum. `(b)` (Matching) Let `V_a, V_b` be Hermitian spaces of dimensions `a, b` with `a + b = n` and `W_{a,b} = V_a ⊕ V_b`. Regular semisimple `δ ∈ Herm(V)` and `δ′ ∈ Herm(V′)` are Jacquet–Langlands transfers of each other if they are `GL_n(E)`-conjugate after identifying `V ≅ E^n ≅ V′`; for such a matching pair let `P_{δ,δ′}` be the `F`-torsor of geometric `E`-linear Hermitian isometries `u:V_F̄→V′_F̄` satisfying `uδ=δ′u`, with right `T_δ`-action `u·t=u∘t`. For `u∈P_{δ,δ′}(F̄)`, define `inv(δ,δ′)=[z_σ]∈H¹(F,T_δ)`, where `z_σ=u⁻¹σ(u)` and `σ(u)=d_{V′}(σ)∘u∘d_V(σ)⁻¹` uses the source and target semilinear descent actions. The class is independent of `u`, and its image in `H¹(F,U(V))` is the class of the full Hermitian isometry torsor `Isom_E(V,V′)`. When `V′=V` this image is trivial and the invariant agrees with §1.14 on `D(T_δ,U(V);F)`. Regular semisimple `δ ∈ Herm(V)` and `(δ_a, δ_b) ∈ Herm(V_a) ⊕ Herm(V_b)` match if `δ` and `φ_{a,b}(δ_a, δ_b)` are Jacquet–Langlands transfers, where `φ_{a,b} : Herm(V_a) ⊕ Herm(V_b) → Herm(W_{a,b})` is the block-diagonal embedding. `(c)` (The endoscopic character) If `y ∈ Herm(V)` matches `(y_a, y_b)`, then `H¹(F, T_y) = ∏_{S₁(a)} ℤ/2 × ∏_{S₁(b)} ℤ/2 = H¹(F, T_{y_a} × T_{y_b})`, and the character `κ` attached to the elliptic endoscopic datum `(U(V_a) × U(V_b), s, ξ)` is the restriction to `E(T_y, U(V); F)` of the character `κ̃` that is trivial on the factors indexed by `S₁(a)` and nontrivial on those indexed by `S₁(b)`.

*Hypotheses.* `E/F` quadratic, `F` nonarchimedean of characteristic 0 (residue characteristic odd where the source uses it); the Hermitian spaces are nondegenerate. For the invariant in `(b), V` and `V′` have the same dimension and `δ,δ′` are regular semisimple with equal characteristic polynomials.

([S. Leslie — The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §1.5.4, Lemma 1.8 (p. 12); §2.2.1, Definition 2.6 (p. 17); §2.2.2, (2.5)–(2.6) and Lemma 2.7 (p. 18).)

`(a)` Decompose `V` along the characteristic polynomial; on each factor with `F_i ⊉ E` the centralizer is the norm-one torus of `E_i/F_i`, otherwise a split torus; Tate–Nakayama (§1.2) gives `H¹ = ℤ/2` for each norm-one factor and 0 for the others, and `H^1_ab(F, U(V)) = ℤ/2` (the discriminant) with the map the sum (Leslie Lemma 1.8, citing Rogawski 1990 §3.4). `(b)` Leslie §2.2.1 and Definition 2.6 give the matching criterion. Over `F̄`, equality of the separable characteristic polynomials decomposes the two spaces into matching eigenspaces; choosing isometries on these eigenspaces proves `P_{δ,δ′}(F̄)` is nonempty. Two such isometries differ by a unique element of `T_δ`. Descent preserves both forms and the intertwining relation, so `z_σ∈T_δ` and `z_{στ}=z_σ·σ(z_τ)`. Replacing `u` by ut changes `z_σ` to `t⁻¹z_σσ(t)`, proving independence in `H¹` (§1.1). Extending this torsor along `T_δ→U(V)` gives `Isom_E(V,V′)`, which proves the image assertion and the fixed-space kernel statement. For `δ′=x⁻¹δx` on `V`, take `u=x⁻¹` to recover §1.14’s cocycle `xσ(x)⁻¹`. The isometry torsor retains the Hermitian forms even when their unitary groups have the same adjoint inner-twist class. `(c)` Leslie Lemma 2.7 (stated there without proof as standard): compute `κ ∈ π₀(T̂^Γ)` from `s = diag(1_a, −1_b)` through the identification of `(a)` (Rogawski 1990 Chapter 3).

The API consists of the unitary Lie centralizer decomposition, its first cohomology, the rational classes, the characteristic-polynomial matching criterion and the endoscopic character; it records the torus factors, their cohomology, the kernel classifying rational orbits on a fixed Hermitian space, equality of characteristic polynomials for matching regular elements, and the displayed endoscopic character. The interfaces for the Hermitian isometry torsor, its stable conjugacy invariant and its agreement with the same-space invariant take both nondegenerate Hermitian spaces and their matching regular semisimple endomorphisms; they provide `P_{δ,δ′}`, its `H¹` class with choice independence and prescribed image, and agreement with the fixed-space invariant.

**Checks.**

- If `F_i` contains a copy of `E`, then `E⊗_F F_i≅F_i×F_i`, its norm-one torus is `Res_{F_i/F} G_m` and its `H¹` is zero. Assigning a `ℤ/2` factor to every irreducible polynomial would give an extra rational-orbit invariant.

- `n = 1: Herm(V) = F, T_δ = U(1) = E¹, H¹ = ℤ/2`, and `E(T_δ, U(V); F) = ker(ℤ/2 → ℤ/2) = 0`, so each stable class is a single class.
- For `V=⟨1⟩, V′=⟨a⟩` with `a∈F×` outside `N_{E/F}(E×)`, and `δ=δ′=1`, the intertwining-isometry torsor has equation `a·c(u)u=1`. Its class is `[a⁻¹]=[a]≠1` in `H¹(F,U(1))≅F×/N_{E/F}(E×)`. The `E`-linear conjugator `g=1` has trivial ordinary coboundary but is not an isometry; `U(1)_ad=1` also cannot recover this class.
- `n = 2, δ` with `F[δ] = F × F` and `E ⊄ F: S₁ = {1, 2}, H¹(F, T_δ) = (ℤ/2)², E = ℤ/2` (two rational classes) and for `(a, b) = (1, 1) κ` is the nontrivial character.

*Needs:* §1.1; §1.2; §1.5; §1.14; §1.16; §1.6; §1.8; Mathlib `Matrix.IsHermitian`.

### 1.18 Worked examples for stable conjugacy and endoscopic data

The following are verified from the definitions of Layer 1. (1) Split torus `T = G_m^r: E(T) = {(T, 1, id)}, D(T, T; F) = 0`, stable = rational conjugacy. (2) `GL_n` over `F: H¹(F, T) = 0` for every maximal torus (a product of `R_{F_i/F} G_m`), so `D = 0` and stable = rational conjugacy; `E_ℓ(GL_n) = {GL_n}`; `H^1_ab(F, GL_n) = 0` and `A(GL_n) = π₀(ℂ^×)^D = 0`. (3) A nonsplit unitary group `U(1,1)` or `U(2)` attached to quadratic `E/F`: elliptic maximal tori `T ≅ U(1)×U(1)` have `D(T)` of order 2 (§1.17 `(a)`), `E_ℓ(U(2)) = {U(2), U(1)×U(1)}` and the character `κ` of the second datum is the nontrivial character of `D(T)`. (4) A proper Levi with different rational classes in one stable class: in `Sp₄` over `p`-adic `F` the Levi `M = GL₁ × SL₂` contains regular elliptic elements of its `SL₂` factor whose `M`-stable class consists of two `M(F)`-classes (§1.14), and, when the element is also `G`-regular, the same two classes occur in `G`: both use the same torus and the same kernel `D(T,M;F)=D(T,G;F)`. (5) `SL₂: H¹(F, SL₂) = 1, H¹(F, PGL₂) = ℤ/2, E_ℓ(SL₂)` consists of `SL₂` and the norm-one tori of the three quadratic extensions (for `p` odd).

*Hypotheses.* `F` a `p`-adic field (`p` odd for (5)).

([J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §§1.6–1.7, 2.3 (pp. 28–39, 52–54); [S. Leslie — The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), Lemma 1.8 (p. 12).)

Each item is a direct computation with §1.2, §1.11, §1.14 and §1.4.

**Checks.**

- Each of the five examples is checked as stated.

*Needs:* §1.2; §1.11; §1.14; §1.4; §1.17.

### Examples

For a quadratic extension `E/F` of a `p`-adic field, the norm-one torus `T` has `H¹(F,T)=F×/N(E×)`, of order two. An elliptic regular element of `SL₂` with this centralizer therefore has two rational classes in its stable class, since `H¹(F,SL₂)=1`. Connectedness of `T` does not remove the second class. In contrast, a regular-semisimple `GL_n` element has centralizer a product of restrictions of scalars of `G_m`, whose `H¹` vanishes. For `GL₁` of a quaternion division algebra the rank difference from `GL₂` is one, so the inner-form sign is `−1`; the rank-difference formula retains this parity.

### Dependencies

`TauCetiRoadmap.PadicHodgeTheory` §5.5 (finite-local torsors and their torus normalization); `TauCetiRoadmap.GlobalNumberFields` Layer 8 (idele-class norms); `TauCetiRoadmap.SchemeAndStackFoundations` §1.24 (semilinear descent and crossed modules); `TauCetiRoadmap.ProfiniteCohomology` Layer 10 (continuous cohomology in all degrees); `TauCetiRoadmap.ProfiniteCohomology` Layer 5 (exact sequences); `TauCetiRoadmap.ClassFieldTheory` §2.4 and Layer 0, item 4 (Tate–Nakayama for a free lattice); `TauCetiRoadmap.ClassFieldTheory` Layer 3 (Tate's theorem for a class formation); `TauCetiRoadmap.ClassFieldTheory` Layer 6 (the local class formation and finite local reciprocity); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (the global class formation and global Artin reciprocity); `TauCetiRoadmap.ClassFieldTheory` Layer 10 (global carriers, the Brauer sequence, and the sum of local invariants); `TauCetiRoadmap.ProfiniteCohomology` Layer 9 (the Galois interface: Hilbert 90 and Kummer theory); `TauCetiRoadmap.ProfiniteCohomology` Layer 12 (the graded cup product in all degrees); `TauCetiRoadmap.ReductiveGroups` Layer 4 (Jordan decomposition, diagonalizable groups, tori); `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); `TauCetiRoadmap.ArithmeticGaloisDuality` §R02.4.3 (Poitou–Tate duality); `TauCetiRoadmap.ReductiveGroups` Layer 8 (Isogeny and existence theorems); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ReductiveGroups` Layer 2 (Lie algebra and the adjoint representation); `TauCetiRoadmap.ReductiveGroups` Layer 6 (reductive and semisimple groups); `TauCetiRoadmap.ClassFieldTheory` Layer 9 (the local Weil group); `TauCetiRoadmap.GlobalNumberFields` Layer 5 (full adeles and the additive quotient); `TauCetiRoadmap.ReductiveGroups` Layer 9 (pinned Chevalley–Demazure group schemes over `ℤ`); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.5.1 (the dual group and its Galois action); `TauCetiRoadmap.AdelicAlgebraicGroups` §4.1 (Weak approximation and torsors); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.1 (quasi-split forms and rational tori over `Ĕ`); `TauCetiRoadmap.Chebotarev` Layer 10 (Dirichlet-density Chebotarev); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.4.2 (*kottwitz-quotient*, *kottwitz-rational-surjectivity*); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.3.7 (Lang's theorem and lifting); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.3.3 (Bruhat–Tits and parahoric group schemes); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.4.4 (Cartan and Iwasawa decompositions); `TauCetiRoadmap.ArithmeticGaloisDuality` §R02.3.1 (The group `G_{K,S}`, finiteness and localisation); Mathlib `Matrix.IsHermitian`.

## Layer 2: orbital integrals and transfer factors

Fix measures and the discriminant convention first. Build the auxiliary root data and factors, prove their transport identities, and then define matching classes of functions. Fourier and archimedean transfer are separate analytic branches of the same matching interface.

### 2.1 Centralizer normalization, Lie orbital integrals and descent

Let `F` be a local field of characteristic 0 and `G` connected reductive over `F`, with compatible group and centralizer Haar measures. Unlike the group orbital integrals in the boundary input, the targets here add disconnected-centralizer normalization, stable transport and Lie-algebra descent: `(i)` following Waldspurger, `O^G_γ(f) = [G_γ(F) : G_γ⁰(F)]⁻¹ O_γ(f)`, which depends only on the `G(F)`-class of `γ`; (ii) measures on centralizers of stably conjugate (or matching) elements are transported by the inner twist between their identity components (§1.3); (iii) for regular semisimple `γ, J_G(γ, f)` is a bounded locally constant (`p`-adic) or smooth (real) function of `γ` on `G_reg(F)` for fixed `f` (Harish-Chandra), and the Weyl integration formula expresses `∫_{G(F)} f` through the integrals of `|D^G(t)| O_t(f)` over maximal tori; (iv) the Lie-algebra version: for `f ∈ C_c^∞(𝔤(F))` and `X ∈ 𝔤(F)` semisimple, `O_X(f) = ∫_{G_X⁰(F)\G(F)} f(Ad(g)⁻¹X) dg/dt` and `D(X) = det(ad X)|_{𝔤/𝔤_X}`; for `F p`-adic, the orbital integrals of nilpotent orbits are defined by the invariant measure on the orbit (Deligne–Ranga Rao) and are needed for germ expansions; `(v)` semisimple descent: near a semisimple `γ, O^G` is expressed through `O^{G_γ}` of a descended function on a neighbourhood of 0 in `𝔤_γ(F)`.

*Hypotheses.* `F` local of characteristic 0; `G` connected reductive with fixed Haar measures on `G(F)` and on the centralizers.

([R. E. Kottwitz — Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §2 'Basics of integration' (p. 403), §3 'Preliminaries about orbital integrals' (p. 406), §7 'Weyl integration formula' (p. 421); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.5 (pp. 11–12); [R. P. Langlands and D. Shelstad — On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §5.4 'Orbital integrals as fiber integrals' (p. 259).)

The interface consists of the following operations and identities.

- `O^G_γ(f) = [G_γ(F) : G_γ⁰(F)]⁻¹ O_γ(f)`, a function of the `G(F)`-class of `γ` (Waldspurger's normalization).
- For `γ′` stably conjugate to `γ`, or matching it across an inner twist, the Haar measure on `G_γ′⁰(F)` is the transport of that on `G_γ⁰(F)`, and `O_γ′` is formed with it.
- For fixed `f, J_G(·, f)` is bounded on `G_reg(F)` and locally constant (`p`-adic) or smooth (real) there.
- Weyl integration formula: `∫_{G(F)} f = Σ_T |W(G, T)(F)|⁻¹ ∫_{T(F)} |D^G(t)| O_t(f)` dt over conjugacy classes of maximal tori.
- The Lie-algebra version on `𝔤(F)`, including nilpotent orbital integrals for `F p`-adic.
- Semisimple descent: near a semisimple `γ, O^G` is expressed through `O^{G_γ}` of a descended function on a neighbourhood of 0 in `𝔤_γ(F)`.
- `O_{Ad(x)X}(f) = O_X(f)` and `O_X(f ∘ Ad(x)⁻¹) = O_X(f)` for `x ∈ G(F)` on `𝔤(F)`.

The group orbital integral, its quotient measure and its convergence are imported from AutomorphicSpectralTheory AS.6.9, with Arthur's introduction §18. Quotient measure: AdelicAlgebraicGroups §2.2 (Parabolic modulus and homogeneous integration) applies since reductive groups are unimodular; Weil's integration formula AdelicAlgebraicGroups §2.2 (Parabolic modulus and homogeneous integration) gives the integral as an iterated integral (Kottwitz, Clay notes §2). Convergence for semisimple `γ` (the argument behind AS.6.9, used here for the Lie-algebra version): the orbit `O_γ` is closed, and `G_γ⁰(F)\G(F) → O_γ(F)` is proper with finite fibres over its image (Kottwitz, Clay notes §3). Boundedness and local constancy of normalized orbital integrals near regular elements: Harish-Chandra; the `p`-adic statements are in Kottwitz's Clay notes §§3, 15–16 (Harish-Chandra's compactness lemma and semisimple descent). Nilpotent orbital integrals: the invariant measure on a nilpotent orbit extends to a Radon measure on `𝔤(F)` (Deligne–Ranga Rao), recalled in Kottwitz's Clay notes §17.

**Checks.**

- For `X` central in `𝔤(F)` (for instance `X = 0`), `O_X(f) = f(X)` with `dt = dg`.
- For `G = T` a torus, `O_X(f) = f(X)` for every `X ∈ 𝔱(F)`.
- For `G = GL₂(F), F p`-adic with `q` residue elements, `γ = diag(a, b)` with `a, b ∈ 𝒪^×` and `|a − b| = 1` and `f = 1_{GL₂(𝒪)}`, measures giving `GL₂(𝒪)` and the diagonal units volume 1: `O_γ(f) = 1` (Kottwitz, Clay notes §5).
- `O^G_{xγx⁻¹}(f) = O^G_γ(f)` for `x ∈ G(F)`, with the transported centralizer measure, and `O^G_γ(f^x) = O^G_γ(f)` for `f^x(g) = f(xgx⁻¹)`.
- The integral over `G_γ(F)\G(F)` with `G_γ` disconnected differs from the one over `G_γ⁰(F)\G(F)` by `[G_γ(F) : G_γ⁰(F)]` (e.g. `γ = diag(1, −1)` in `PGL₂`), so the two conventions must not be mixed.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` §6 (Paley–Wiener theory and trace distributions); `TauCetiRoadmap.AdelicAlgebraicGroups` §2.2 (Parabolic modulus and homogeneous integration); §1.3; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.1.1 (Functions, measures and convolution); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ReductiveGroups` Layer 2 (Lie algebra and the adjoint representation); Mathlib `MeasureTheory.Measure.IsHaarMeasure`.

### 2.2 a-data and `χ`-data for the roots of a maximal torus

Let `F` be a field of characteristic 0, `T` a maximal torus of a connected reductive `G` over `F` (or of `G*` quasi-split), `R = R(G, T)` its roots with the action of `Γ_F`, and for `α ∈ R` let `F_α ⊇ F_{±α}` be the fixed fields of the stabilizers of `α` and of `{±α}` in `Γ_F`; `α` is symmetric if `F_α ≠ F_{±α}` (then `[F_α : F_{±α}] = 2`) and asymmetric otherwise. `(a)` a-data is a family `{a_α ∈ F_α^× : α ∈ R}` with `a_{σα} = σ(a_α)` for `σ ∈ Γ_F` and `a_{−α} = −a_α`. `(b) χ`-data is a family of characters `{χ_α : F_α^× → ℂ^×}` with `χ_{σα} = χ_α ∘ σ⁻¹, χ_{−α} = χ_α⁻¹`, and, for `α` symmetric, `χ_α` restricted to `F_{±α}^×` equal to the quadratic character of `F_α/F_{±α}` (local case; for `F` global, characters of the idele class groups with the same properties). a-data is used to define the splitting invariant `λ(T_sc)` of `Δ_I` and the term `Δ_III2` uses `χ`-data to build an `L`-embedding `^LT → ^LG`; the absolute transfer factor (§2.5) does not depend on these choices (Langlands–Shelstad Theorem 3.7.A), but each of `Δ_I, Δ_II, Δ_III2` separately does. In the twisted setting, Kottwitz–Shelstad 1999 attach a-data and `χ`-data to the restricted root system `R_res(G,T)` of `(T, θ)`, with `a_{2α_res}=a_{α_res}` and `χ_{2α_res}=χ_{α_res}` whenever both are restricted roots ([*Foundations of twisted endoscopy*](https://www.numdam.org/item/AST_1999__255__R3_0.pdf), §1.3, (1.3.10), p. 16). The corrected splitting invariant of `Δ_I^new` (§2.8) instead uses twisted a-data in the sense of Kottwitz–Shelstad 2012: ordinary a-data on the full root system `R(T,G)` that are `θ`-invariant, `a_{θα}=a_α` (§2.2, (2.2.2)). The resulting `Δ_I^new` agrees with the 1999 `Δ_I` unless `R_res(G,T)` is non-reduced (§2.8).

*Hypotheses.* `F` of characteristic 0 (local or global); `T` a maximal torus of `G` over F.

([R. P. Langlands and D. Shelstad — On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §2.2 'a-Data' (p. 229) and §2.5 '`χ`-Data' (p. 235); [R. Kottwitz and D. Shelstad — On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), §2.1 (PDF p. 3), §2.2 with (2.2.2) (PDF p. 4), §5.1 (PDF p. 12).)

The interface consists of the following operations and identities.

- a-data for `(G, T)`.
- `χ`-data for `(G, T)`.
- a-data exists.
- `χ`-data exists (local and global).
- Two sets of a-data differ by `b_α ∈ F_α^×` with the same equivariance, `b_α ∈ F_{±α}^×` for symmetric `α`.
- The `L`-embedding `^LT → ^LG` attached to `χ`-data (Langlands–Shelstad §2.6).

Existence: choose `a_α` on representatives of `Γ`-orbits of roots and extend by the equivariance rules; for symmetric `α` choose `a_α` with `σ(a_α) = −a_α` for the nontrivial `σ ∈ Gal(F_α/F_{±α})`. For `χ`-data, extend characters of the idele class or multiplicative groups of `F_{±α}` by class field theory (Langlands–Shelstad §2.2 and §2.5). Use §1.2a to turn the local `χ`-characters into Weil cocycles and to evaluate the resulting torus classes. The defining properties are exactly those used to make `λ(T_sc)` and the `L`-embedding `^LT → ^LG` well defined (Langlands–Shelstad §2.3, §2.6).

**Checks.**

- For `G = SL₂` with `T` split, `R = {±α}, F_α = F`, a-data is any `a ∈ F^×` with `a_{−α} = −a`.
- For a symmetric root with `F_α = E` quadratic over `F_{±α}, χ_α|_{F_{±α}^×}` is the quadratic character `η_{E/F_{±α}}`.
- For `G = T` a torus, `R = ∅` and a-data and `χ`-data are empty.
- The family `χ_α = 1` for all `α` is not `χ`-data when some root is symmetric, since the restriction to `F_{±α}^×` must be nontrivial.
- The transfer factor does not depend on the choice of a-data and `χ`-data (§2.5).

*Needs:* §1.2a; `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ClassFieldTheory` Layer 7 (the absolute local Artin map, its normalizations, and conductors); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (the global class formation and global Artin reciprocity).

### 2.3 Harish-Chandra's character theory for real reductive groups

Let `G` be a connected reductive group over `ℝ` (more generally a real reductive group in the sense of AutomorphicSpectralTheory §0.48 (real reductive representation foundations)), `K` a maximal compact subgroup and `π` a finite-length admissible representation of `G(ℝ)` (an admissible `(𝔤, K)`-module with its Casselman–Wallach globalization). `(a)` For `f ∈ C_c^∞(G(ℝ)), π(f)` is trace class, and `Θ_π(f) = tr π(f)` is a conjugation-invariant distribution, an eigendistribution of the centre `Z(𝔤)` of `U(𝔤_ℂ)` acting through the infinitesimal character of `π` when `π` has one. `(b)` (Harish-Chandra's regularity theorem) `Θ_π` is a locally integrable function on `G(ℝ)`, real-analytic on the set `G_reg(ℝ)` of strongly regular elements: `Θ_π(f) = ∫_{G_reg(ℝ)} f(x)Θ_π(x)` dx. `(c) |D(x)|^{1/2}Θ_π(x)` is locally bounded, and on each Cartan subgroup `Θ_π` is a finite combination of exponentials divided by the Weyl denominator; for discrete series `π` with Harish-Chandra parameter `λ`, on the compact Cartan `T: Θ_π = (−1)^{q(G)} Σ_{w ∈ W_K} ε(w) e^{wλ}/Δ`, and `Θ_π` on the other Cartan subgroups satisfies Harish-Chandra’s descent and matching identities. `(d)` Characters determine finite-length representations up to semisimplification, and the characters of the tempered irreducible representations are linearly independent.

*Hypotheses.* `G` connected reductive over `ℝ` (all real reductive groups, not only the unitary groups of Layer 6–Layer 15); `π` of finite length, admissible.

([J. Arthur — An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §24 (pp. 157–160); [T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), §§5.1, 5.6 (arXiv v5).)

`(a)` Trace class property and invariance from admissibility (AutomorphicSpectralTheory §0.48 (real reductive representation foundations)) and the Casselman–Wallach globalization (AutomorphicSpectralTheory §0.49 (smooth Fréchet globalizations)). `(b)`–`(c)` Harish-Chandra's regularity theorem for invariant eigendistributions (Harish-Chandra, 'Invariant eigendistributions on a semisimple Lie group', Trans. AMS 119 (1965)), as recalled by Arthur (Clay introduction §24, pp. 158–159) and used by Kaletha. The discrete series character formula on the compact Cartan is part of Harish-Chandra's classification (AutomorphicSpectralTheory §0.48 (real discrete series)). `(d)` Linear independence of characters: standard consequence of `(b)` and the Langlands classification (AutomorphicSpectralTheory §0.48 (real Langlands classification)).

**Checks.**

- For `G = U(1) = SO(2): Θ_{χ_k}(e^{iθ}) = e^{ikθ}`.
- For `G = SL₂(ℝ)` and the discrete series `D_k^±`: on the compact Cartan, `Θ_{D_k^+} + Θ_{D_k^−} = −(e^{i(k−1)θ} − e^{−i(k−1)θ})/(e^{iθ} − e^{−iθ})`, the negative of the character of the `(k−1)`-dimensional representation.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations).

### 2.4 `κ`-orbital integrals and stable orbital integrals

For the finite invariant group with multiplicatively written law, use the character-weighted sum `∑_d κ(d)O(d)`. Reindexing the old orbital values by `d↦d₀d` multiplies the sum by `κ(d₀)⁻¹`; this finite calculation is separate from constructing the orbital distributions.

Let `F` be local of characteristic 0, `G` connected reductive, `γ ∈ G(F)` strongly regular semisimple with centralizer the maximal torus `T`, and for each `γ′` in the stable class of `γ` let `inv(γ, γ′) ∈ D(T, G; F)` be its invariant (§1.14); measures on the centralizers `T_{γ′}` are transported from T. For a character `κ` of `E(T, G; F)` (equivalently an element of Kottwitz's `𝔎(T/F)`, §1.14 `(b)`) and `f ∈ C_c^∞(G(F))`, the `κ`-orbital integral is `O^κ_γ(f) = Σ_{γ′} κ(inv(γ, γ′)) e(G_{γ′}) O_{γ′}(f)`, the sum running over representatives of the `G(F)`-classes in the stable class of `γ` (a finite set) and `e` the Kottwitz sign (trivial for tori; it enters for singular `γ` with non-quasi-split centralizers). The stable orbital integral is `SO_γ(f) = O^1_γ(f)`. For `γ` semisimple but not strongly regular one sums over the rational classes in the stable class weighted by `e(G_{γ′})` and the measure conventions of Kottwitz 1986 §5. Changing `γ` within its stable class multiplies `O^κ_γ` by `κ(inv(γ, γ′))⁻¹`, so `O^κ` is not a function of the stable class alone unless `κ = 1`; `SO_γ` is. A distribution on `G(F)` is stable if it is a limit of linear combinations of the `SO_γ`. The same definitions apply on the Lie algebra `𝔤(F)`.

*Hypotheses.* `F` local of characteristic 0; `γ` strongly regular (singular case with Kottwitz's conventions).

([T. C. Hales — A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), §6.1, (6.0.1) and (6.0.2) (PDF pp. 9–10); [S. Leslie — The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.2, (2.5) and the display after it (p. 18); [R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §5.1–5.6 (pp. 379–380); [Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.7, Définition 1.7.1 (pp. 17–18).)

The interface consists of the following operations and identities.

- `O^κ_γ(f)`.
- `SO_γ(f) = O^1_γ(f)`.
- `SO_γ = SO_{γ′}` for `γ′` stably conjugate to `γ`.
- `O^κ_{γ′} = κ(inv(γ, γ′))⁻¹ O^κ_γ`.
- A distribution is stable if it lies in the closed span of the `SO_γ`.
- The Lie-algebra version, compatible with descent near the identity.

Finiteness of the sum: `D(T, G; F)` is finite (§1.14 `(b)`). Dependence on `γ` within its stable class: `inv(γ″, γ′) = inv(γ, γ′) − inv(γ, γ″)` in the abelian group `E(T, G; F)` (Leslie (2.5); Hales §6.1). Singular case: Kottwitz 1986 §5.1–5.2 with the signs `e(I)`.

**Checks.**

- For the light sum on the one-element group, the trivial character gives `O(1)`; it does not give a zero sum.
- On a two-element group with nontrivial character, orbital values 3 and 1 give 2. Rebasing interchanges them and gives `−2`.
- For `G = GL_n, SO_γ = O_γ` and `O^κ_γ = O_γ` for the only character `κ = 1 (D(T) = 0)`.
- For `G = SL₂, T` elliptic with `D(T) = ℤ/2` and `κ` nontrivial: `O^κ_γ(f) = O_γ(f) − O_{γ′}(f)` for `γ′` the other rational class.
- `O^κ_{γ″}(f) = κ(inv(γ, γ″))⁻¹ O^κ_γ(f)` for `γ″` stably conjugate to `γ`.
- In `SL₂(ℚ₃)`, take `γ=[[0,−1],[1,0]]` and `γ′=[[0,−3],[1/3,0]]`. They have characteristic polynomial `t²+1` and represent the two rational classes in their stable class: the conjugator `diag(3,1)` has determinant 3, of odd valuation, whereas norms from the unramified quadratic extension have even valuation. Choose a compact open neighborhood `V` of `γ′` disjoint from the closed rational orbit of `γ`. With positive quotient Haar measures, `c=O_γ′(1_V)` is finite and strictly positive. For `f=1_V/c`, `O_γ(f)=0`, `O_γ′(f)=1` and `SO_γ(f)=1`. In contrast, a locally constant function supported on a single dimension-2 orbit in the dimension-3 group is zero and has both orbital integrals zero.

*Needs:* §2.1; §1.14; §1.13; §1.2.

### 2.5 The Langlands–Shelstad transfer factor

Let `F` be local of characteristic 0, `G` connected reductive with quasi-split inner form `G*` and inner twist `ψ : G → G*, (H, ℋ, s, ξ)` an endoscopic datum with a `z`-pair `(H₁, ξ₁)` (§1.7). For a strongly `G`-regular `γ₁ ∈ H₁(F)` with image `γ_H ∈ H(F)` and a strongly regular `δ ∈ G(F)` matching it (§1.16), choose an admissible embedding `T_H → T*` of the centralizer of `γ_H` into `G*`, a-data and `χ`-data for `T*` (§2.2). Define: `Δ_I(γ₁, δ) = ⟨λ(T_sc), s_T⟩` (the splitting invariant `λ(T_sc) ∈ H¹(F, T_sc)` built from a-data paired by Tate–Nakayama with the image `s_T` of `s`); `Δ_II(γ₁, δ) = ∏_α χ_α((α(γ) − 1)/a_α)` over `Γ`-orbit representatives of roots of `T` outside `H`; `Δ_III1(γ₁, δ; γ̄₁, δ̄) = ⟨inv(γ, δ; γ̄, δ̄), κ⟩`, the pairing of the relative invariant in `H¹(F, U) (U = T × T̄/Z(G))` with the endoscopic character; `Δ_III2(γ₁, δ) = ⟨a, γ⟩` using §1.2a’s evaluation for `a ∈ H¹_cont(W_F, T̂)` measuring the difference of the `L`-embeddings `^LT → ^LG` given by `χ`-data and by `ξ` through `ℋ` (with the `z`-pair); `Δ_IV(γ₁, δ) = |D_G(δ)|^{1/2}|D_H(γ_H)|^{−1/2}`. The relative transfer factor `Δ(γ₁, δ; γ̄₁, δ̄) = Δ_I Δ_II Δ_III1 Δ_III2 Δ_IV` (ratios) is independent of all choices (Langlands–Shelstad Theorem 3.7.A). An absolute transfer factor is a function `Δ(γ₁, δ)` on matching pairs with `Δ(γ₁, δ)Δ(γ̄₁, δ̄)⁻¹ = Δ(γ₁, δ; γ̄₁, δ̄)`; it is determined up to a nonzero constant. Normalizations: `(i)` for `G` quasi-split, the Langlands–Shelstad absolute factor `Δ₀ = Δ_I Δ_II Δ_III2 Δ_IV` (`Δ_III1` trivial with base point `δ̄ = δ` for `G = G*`); (ii) Kottwitz–Shelstad 2012 (§5.1) record four variants for `(H, s, ξ)`: the Langlands–Shelstad factor `Δ`, adapted to the classical local Langlands correspondence (Langlands' normalization of local class field theory, uniformizers ↔ Frobenius); its renormalization `Δ_D = Δ_I Δ_II Δ_III1 Δ_III2,D Δ_IV` with `Δ_III2,D = ⟨γ, a(χ⁻¹)⟩⁻¹`, adapted to Deligne's normalization (uniformizers ↔ inverse Frobenius); and `Δ′, Δ′_D`, the factors `Δ, Δ_D` of the datum `(H, s⁻¹, ξ)` regarded as factors for `(H, s, ξ)`. The corrected twisted factors `Δ_D = Δ_I^new Δ_II⁻¹ Δ_III Δ_IV` and `Δ′ = (Δ_I^new Δ_III)⁻¹ Δ_II Δ_IV` of §2.8 reduce to these `Δ_D` and `Δ′` in standard endoscopy (§§5.3–5.4); (iii) the Whittaker normalization `Δ_λ` fixes the constant by a Whittaker datum `λ` of `G*` through the root number `ε_L(V, ψ)` of the virtual representation `V = X^*(T*) ⊗ ℂ − X^*(T_H) ⊗ ℂ: Δ_{λ,D} = ε_L(V, ψ) Δ_I^new Δ_II Δ_III^new Δ_IV = ε_L(V, ψ) Δ_I^new Δ_II⁻¹ Δ_III Δ_IV` and `Δ′_λ = ε_L(V, ψ)(Δ_I^new Δ_III)⁻¹ Δ_II Δ_IV` (Kottwitz–Shelstad (5.5.1)–(5.5.2), for quasi-split `G` with an `F`-splitting preserved by `θ`). Every consumer records which of `Δ, Δ′, Δ_D, Δ′_D` and which normalization (base point or Whittaker) it uses, and which normalization of local class field theory (CFT Layer 7) is in force; the product formula (§2.7) does not identify two conventions without this record.

*Hypotheses.* `F` local of characteristic 0; `(H, ℋ, s, ξ)` an endoscopic datum of `G` with a `z`-pair; `δ` strongly regular in `G(F), γ₁` strongly `G`-regular in `H₁(F)`, matching.

([R. P. Langlands and D. Shelstad — On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §3.1–3.7 (pp. 240–249): `Δ_I` (p. 241), `Δ_II` (p. 243), `Δ_III1` (p. 245), `Δ_III2` (p. 246), `Δ_IV` (p. 248), Theorem 3.7.A (p. 248); [R. Kottwitz and D. Shelstad — On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), Introduction (PDF pp. 1–2), (1.0.3)–(1.0.4); §4.1 and §4.3 (PDF pp. 10–11); §§5.1–5.5 (PDF pp. 12–15); [T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), §5.3, pp. 33–35 (arXiv v5); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.4 (p. 11).)

The interface consists of the following operations and identities.

- `Δ(γ₁, δ; γ̄₁, δ̄)` on pairs of matching pairs.
- Independence of admissible embeddings, a-data and `χ`-data (LS Theorem 3.7.A).
- An absolute transfer factor: a function on matching pairs whose ratios are the relative factor.
- Two absolute factors differ by a nonzero constant.
- The Whittaker-normalized factors `Δ_{λ,D}` and `Δ′_λ` attached to a Whittaker datum of `G*`.
- The tag (`Δ, Δ′, Δ_D` or `Δ′_D`; base point or Whittaker; local CFT normalization) carried with every factor.
- `Δ′` and `Δ′_D` for `(H, s, ξ)` are the factors `Δ` and `Δ_D` of `(H, s⁻¹, ξ)`.
- For the standard factors `Δ` and `Δ_D`, replacing `δ` by `δ′` multiplies the factor by `⟨inv(δ,δ′),κ⟩`; for the primed factors `Δ′` and `Δ′_D` it multiplies it by `⟨inv(δ,δ′),κ⟩⁻¹`. The datum and factor tag determine which identity applies.
- The terms `Δ_I, Δ_II, Δ_III1, Δ_III2, Δ_IV` for fixed auxiliary data.

`Δ_I`: Langlands–Shelstad §3.2 (p. 241), `λ(T_sc)` from the a-data splitting (Langlands–Shelstad §2.3; this roadmap §2.2) and Tate–Nakayama pairing (this roadmap §1.2). `Δ_II`: §3.3 (p. 243); `Δ_III1`: §3.4 (p. 245), a relative term pairing an invariant with `κ`; `Δ_III2`: §3.5 (pp. 246–247), evaluated by §1.2a after construction from `χ`-data through the `L`-embedding of Langlands–Shelstad §2.6 (this roadmap §2.2); `Δ_IV`: §3.6 (p. 248), the quotient of Weyl discriminants. Independence of the product of choices: Theorem 3.7.A (p. 248), proved by computing how each term changes with the admissible embedding, a-data and `χ`-data (Lemmas of §§3.2–3.5). Sign corrections: Kottwitz–Shelstad 2012 show the 1999 twisted factor is not independent of `χ`-data unless `Δ_II` or `Δ_III` enters with exponent `−1` (introduction, PDF p. 2), define `Δ_D` and `Δ′` ((1.0.3), (1.0.4); §§5.3–5.4) and their Whittaker-normalized versions ((5.5.1)–(5.5.2), §5.5); for standard endoscopy they list the four variants `Δ, Δ_D, Δ′, Δ′_D` (§5.1, (5.1.1)–(5.1.2)). Conventions on local class field theory and Frobenius: KS 2012 §4.1 (Deligne's vs Langlands' reciprocity), using ClassFieldTheory Layer 7 to fix reciprocity.

**Checks.**

- For `H = G = G*` quasi-split, `s = 1`, the relative factor is identically 1, and `Δ₀(γ, δ) = 1` for `δ` stably conjugate to `γ`.
- `Δ(γ₁, δ; γ̄₁, δ̄) Δ(γ̄₁, δ̄; γ̃₁, δ̃) = Δ(γ₁, δ; γ̃₁, δ̃)`.
- For an invariant group `ℤ/3` with `κ(1)=ζ₃`, transport by 1 multiplies the standard `Δ` or `Δ_D` by `ζ₃` and the primed `Δ′` or `Δ′_D` by `ζ₃⁻¹`. These are distinct; an order-two invariant cannot test the choice of exponent.
- For `G = SL₂, H = R^1_{E/F} G_m` and a matching pair `(u, δ)` with `u ∈ E¹` regular, `D_H(u) = 1` and `D_G(δ) = −(u − ū)²`/(uū), so `|Δ_IV(u, δ)| = |(u − ū)²|_F^{1/2}`; between the two rational classes in the stable class of `δ` the factor changes by the nontrivial character of `D(T, SL₂; F) = ℤ/2`.
- `Δ_D` and `Δ′` for the same datum are not equal in general: their ratio is `(Δ_I^new Δ_III)² Δ_II⁻²`, nontrivial for the twisted `GL_n ⋊ θ` case (§2.8).

*Needs:* §1.2a; §1.4; §1.7; §1.16; §1.2; §1.14; §1.6; §2.2; `TauCetiRoadmap.ClassFieldTheory` Layer 7 (the absolute local Artin map, its normalizations, and conductors); `TauCetiRoadmap.ClassFieldTheory` Layer 9 (the local Weil group).

### 2.6 Shalika germs on `p`-adic Lie algebras

Let `F` be a `p`-adic field and `G` connected reductive over `F` with Lie algebra `𝔤`. `(a)` The set of nilpotent `G(F)`-orbits in `𝔤(F)` is finite, and each nilpotent orbit `𝒪` carries an invariant Radon measure `μ_𝒪` extending to `𝔤(F)` (nilpotent orbital integrals). `(b)` (Germ expansion) There are functions `Γ_𝒪` on `𝔤_rs(F)` (Shalika germs), one for each nilpotent orbit, such that for every `f ∈ C_c^∞(𝔤(F))` there is a neighbourhood `U_f` of 0 with `O_X(f) = Σ_𝒪 Γ_𝒪(X) μ_𝒪(f)` for all `X ∈ U_f ∩ 𝔤_rs(F)`; the germs are uniquely determined as germs at 0. `(c)` (Homogeneity) For `t ∈ F^×, Γ_𝒪(t²X) = |t|^{−dim 𝒪} Γ_𝒪(X)` (after normalizing measures compatibly); equivalently the normalized germs `Γ̄_𝒪 = |D|^{1/2} Γ_𝒪` satisfy `Γ̄_𝒪(t²X) = |t|^{dim G^{X_𝒪} − rank G} Γ̄_𝒪(X)` for `X_𝒪 ∈ 𝒪` (Kottwitz (17.11.2)). In particular the germ `Γ₀` of the zero orbit is homogeneous of degree 0, and each normalized rational regular-nilpotent germ `Γ̄_reg` is homogeneous of degree 0 under square dilations. The germs and their discriminant normalizations are locally constant on `𝔤_rs(F)`; degree-zero square homogeneity does not imply constancy on a Cartan’s whole regular locus. `(d)` (Descent) Near a semisimple element, orbital integrals have an expansion in terms of the germs of the centralizer (semisimple descent).

*Hypotheses.* `F p`-adic of characteristic 0 (the germ expansion also holds in large positive characteristic as used by Waldspurger 2006).

([R. E. Kottwitz — Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §5.9 (pp. 415–418), especially Lemma 5.2 and (5.9.8), (5.9.11), pp. 416–417; §6 'Shalika germs' (p. 418); §15 'Harish-Chandra's compactness lemma' (p. 457); §16 'Semisimple descent' (p. 458); §17 'Basic results on Shalika germs on `𝔤`' (p. 459); §27 'Deeper results on Shalika germs' (p. 512); Corollary 17.8 and (17.11.2) (p. 465); [U. Everling — An Example of Fourier Transforms of Orbital Integrals and their Endoscopic Transfer](https://nyjm.albany.edu/j/1998/4-2.pdf), §§2–3, pp. 19–21, germ expansion after Corollary 3; [J.-L. Waldspurger — Endoscopie et changement de caractéristique](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf), Introduction and §7 (Théorème 7.2, p. 62).)

`(a)` Finiteness of nilpotent orbits and the Deligne–Ranga Rao measures (Kottwitz, Clay notes §17). `(b)` Shalika's germ expansion: Kottwitz, Clay notes §6 (for `GL₂` and in general) and §17 'Basic results on Shalika germs on `𝔤`', via Harish-Chandra's compactness lemma (§15) and the density of regular orbital integrals. `(c)` Homogeneity from the scaling `X ↦ t²X` and the dimension of `𝒪` (Kottwitz, Clay notes §17); local constancy is Corollary 17.8, and deeper results are in §27. Everling’s §3 separates the rational regular-nilpotent coefficients in `SL₂`. `(d)` Semisimple descent (Kottwitz, Clay notes §16).

**Checks.**

- For `𝔤 = 𝔤𝔩₂`, the nilpotent orbits are `{0}` and the regular one; on an elliptic Cartan subalgebra the germ `Γ₀` of `{0}` is constant and the regular germ is a constant multiple of `|D(X)|^{−1/2}` (Kottwitz's `GL₂` computation, §5.9: for elliptic `γ ∈ GL₂(𝒪)` the coefficient of the identity orbit is `−2/(q − 1)`, independent of `γ`, while that of the regular unipotent orbit grows like `q^{d_γ}`).
- For `F=ℚ₃`, `E=F(√2)` and `X_u=[[0,2u],[u,0]]` with `u=3^m`, the fixed nonsplit Cartan has orbit coordinates `t=2u²` and `b=u N_{E/F}(E×)`. The germ of the rational nilpotent orbit of `[[0,0],[1,0]]` is nonzero exactly when `1∈b`. The norm valuations are even, so its normalized germ is nonzero for even `m` and zero for odd `m`, arbitrarily near zero in the same Cartan (Everling §3, p. 21).
- For `𝔤 = 𝔱` a torus there is one nilpotent orbit `{0}` and `Γ₀ = 1`.
- Over `ℚ₃`, for sufficiently small elliptic `X∈𝔤𝔩₂, Γ_reg(9X)=9Γ_reg(X)`, whereas `Γ̄_reg(9X)=Γ̄_reg(X)`: |3`|₃=1/3` and the regular nilpotent orbit has dimension two.

*Needs:* §2.1; `TauCetiRoadmap.ReductiveGroups` Layer 2 (Lie algebra and the adjoint representation).

### 2.7 Transport, descent, central extensions and the global product formula

In the setting of §2.5: `(a)` (Invariance) `Δ(γ₁, δ)` is invariant under `H₁(F)`-conjugation of `γ₁` and `G(F)`-conjugation of `δ`, and transforms under `Z₁(F)` by `λ₁: Δ(zγ₁, δ) = λ₁(z)⁻¹ Δ(γ₁, δ)`. `(b)` (Change of `z`-pair and of datum) An isomorphism of endoscopic data and a change of `z`-pair transport the factor, with the transported factor a multiple of the original by a constant determined by the change of `λ₁`. `(c)` (Central extensions) For a `z`-extension `G̃ → G` with induced kernel, the transfer factor of `G` is obtained by restriction from that of `G̃` for the corresponding datum (Langlands–Shelstad §4.4). `(d)` (Extension to `G`-regular elements) The factor extends to all `G`-regular, not only strongly `G`-regular, pairs (§4.3). `(e)` (Descent) Near a semisimple element `ε₁` of `H₁(F)` whose image matches a semisimple `η ∈ G(F)`, the factor on nearby pairs is, up to a constant, the Lie-algebra transfer factor of the descended endoscopic datum for `G_η` at the corresponding elements of `𝔥_ε` and `𝔤_η` (Langlands–Shelstad 'Descent for transfer factors', used by Waldspurger 2008 §§2.3, 3.9, 5.10–5.11). `(f)` (Global product formula) Let `F` be a number field, `(H, s, ξ)` a global endoscopic datum with `z`-pair, and `(γ₁, δ)` a pair of rational elements that match at every place (`γ₁ ∈ H₁(F)` strongly `G`-regular, `δ ∈ G(F)`). Then the canonical adelic transfer factor `Δ_𝔸 = ∏_v Δ_v` (defined using global a-data and `χ`-data and well defined because almost all local factors equal 1) satisfies `Δ_𝔸(γ₁, δ) = 1` (Langlands–Shelstad Theorem 6.4.A; Corollary 6.4.B); consequently local absolute factors can be normalized so that their product on adelic `δ=(δ_v)` is ⟨obs-invariant,`κ⟩` for the unprimed conventions `Δ` and `Δ_D`, and its inverse for `Δ′` and `Δ′_D`, with the obstruction of §1.15 measured from a matching rational base point. For a rational pair the obstruction is zero, so both products equal 1. Fix the datum, auxiliary global data, class-field reciprocity and one factor convention at every place; mixing conventions invalidates the formula.

*Hypotheses.* `F` local `(a)`–`(e)` or a number field `(f)`, characteristic 0; the conventions of §2.5 fixed uniformly.

([R. P. Langlands and D. Shelstad — On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §4.1–4.4 (pp. 249–254); §6.1–6.4, Theorem 6.4.A and Corollary 6.4.B (pp. 264–269); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §2.2 (p. 19), §2.3 (p. 21), §3.9 (p. 38), §§5.10–5.11 (pp. 70–71); [R. E. Kottwitz — Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §16 'Semisimple descent' (p. 458).)

`(a)` Langlands–Shelstad §4.1 'Invariance' and Waldspurger 2008 §2.2 (Kottwitz–Shelstad Lemma 5.1.C for the `Z₁`-behaviour). `(b)`–`(d)` Langlands–Shelstad §§4.2–4.4 (the local hypothesis, extension to `G`-regular elements, passage to central extensions). `(e)` Langlands–Shelstad 'Descent for transfer factors' (1990), as recalled by Waldspurger 2008 §2.3 and §3.9 and by Kottwitz's Clay notes §16 (semisimple descent for orbital integrals). `(f)` Langlands–Shelstad §6.4, Theorem 6.4.A and Corollary 6.4.B (p. 269): the global a-data and `χ`-data give a product of local terms each of which is trivial globally by the product formula for characters and the global Tate–Nakayama duality (§1.2 `(b)`); the comparison with the obstruction pairing uses §1.15.

**Checks.**

- For elliptic ordinary endoscopy of `GL_n` only `H=GL_n` occurs and the product formula is trivial; nonelliptic Levi data are not excluded from ordinary endoscopy; for `SL₂` over a number field and `H = R^1_{E/F} G_m` with `γ ∈ E¹` rational and regular, the product over all places of the local factors built from global a-data and `χ`-data equals 1.

*Needs:* §2.5; §1.15; §1.2; §1.7; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism); `TauCetiRoadmap.GlobalNumberFields` Layer 0 (places, completions, and the product formula); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (the global class formation and global Artin reciprocity).

### 2.8 Twisted transfer factors and the Kottwitz–Shelstad corrections

Let `F` be local of characteristic 0, `(G, θ, ω)` a twisted triple with `θ` quasi-semisimple, `(H, ℋ, s, ξ)` a twisted endoscopic datum (§1.4) with `z`-pair `(H₁, ξ₁, ξ̂₁)`, and `𝒟₁` the set of matching pairs `(γ₁, δ)` of strongly `G`-regular `γ₁ ∈ H_{1,z}(F)` and strongly `θ`-regular `δ ∈ G(F)` (§1.16). The twisted transfer factor is built from twisted a-data and `χ`-data for the restricted roots of `(T, θ)`, the twisted splitting invariant (Kottwitz–Shelstad 2012 §2.2, Lemma 2.2.1, Proposition 2.2.3) and the analogues of `Δ_II, Δ_III, Δ_IV`: (1) the corrected factors `Δ_D = Δ_I^new Δ_II⁻¹ Δ_III Δ_IV` (compatible with Deligne's normalization of local class field theory) and `Δ′ = (Δ_I^new Δ_III)⁻¹ Δ_II Δ_IV` (compatible with Langlands' classical normalization), where the 1999 product `Δ_I Δ_II Δ_III Δ_IV` is not independent of `χ`-data; (2) the new term `Δ_I^new = ⟨λ_{a}(T, θ), s_{T,θ}⟩` uses the twisted splitting invariant; it agrees with `Δ_I` unless the restricted root system is non-reduced (some power `θ^i` preserves an irreducible component of type `A_{2n}` and acts on it by a nontrivial diagram automorphism), for instance `θ =` transpose-inverse (up to inner automorphisms) on `GL(2n + 1)`, and never differs for cyclic base change; (3) the Whittaker-normalized twisted factors `Δ_{λ,D}` and `Δ′_λ`. The relative factor `Δ(γ₁, δ; γ̄₁, δ̄)` is independent of all auxiliary choices and transforms under `Z₁(F)` by `λ₁`; an absolute factor is fixed by a base point or a Whittaker datum. For cyclic base change (`G = R_{E/F} G₀, θ` a generator of `Gal(E/F), ω = 1`) with `H` the quasi-split inner form of `G₀` and `s = 1`, the transfer factor of the norm correspondence is 1 on pairs `(γ, δ)` with `γ` a norm of `δ` (Labesse's normalization of association, §3.2).

*Hypotheses.* `F` local of characteristic 0; `(G, θ, ω)` twisted triple and `(H, ℋ, s, ξ)` a twisted endoscopic datum with `z`-pair.

([R. Kottwitz and D. Shelstad — On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), Introduction (PDF pp. 1–2); §2.2, Lemma 2.2.1 (PDF p. 4), Proposition 2.2.3 (PDF p. 5); §§3.3–3.5, Proposition 3.5.2 (PDF pp. 7–9); §§5.3–5.6, (5.3.1), (5.4.1), (5.5.1)–(5.5.2) (PDF pp. 13–16); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.4 (p. 11); [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.2, Définition 3.2.1 (p. 76).)

The interface consists of the following operations and identities.

- `Δ′` or `Δ_D` for a twisted endoscopic datum with `z`-pair.
- Independence of the relative factor of auxiliary data.
- The term `Δ_I^new` from the twisted splitting invariant.
- `Δ_I^new = Δ_I` for cyclic base change.
- Whittaker-normalized twisted factors.
- For `θ = 1` the twisted factor is the ordinary one with the same convention.

Use §1.2a’s torus reciprocity pairing for the Weil-character part of `Δ_III`, with the chosen reciprocity convention. Use the twisted splitting invariant of Kottwitz–Shelstad 2012 §2.2 and its comparison with the untwisted one (§3.5, Proposition 3.5.2) to define `Δ_I^new` (§3.4). Check independence of `χ`-data for `Δ_D` and `Δ′` by the computation of Kottwitz–Shelstad 2012 §§5.3–5.4: the `χ`-data dependence of `Δ_II` and `Δ_III` cancels only with one of them inverted. Whittaker normalization: §5.5, formulas (5.5.1)–(5.5.2). Base change: Labesse §3.2 defines association with factor 1 on norms; Kottwitz–Shelstad 2012 §5.6 note `Δ_I^new = Δ_I` for cyclic base change, so Labesse's normalization is the specialization of either corrected factor with the sign convention fixed at each application.

**Checks.**

- For `G = R_{E/F} G_m, θ` the Galois automorphism, `H = G_m` and `s = 1, Δ(γ, δ) = 1` when `γ = N_{E/F}(δ)` and 0 otherwise.
- For `θ = 1` and `ω = 1, Δ′` and `Δ_D` reduce to the ordinary factors of §2.5 in the two conventions.
- In the non-reduced restricted-root case for `GL(2n+1)`, compute `Δ_I^new/Δ_I` as the product of `sgn_{F_β/F_{±β}}(2)` over the symmetric type-R3 roots coming from `H` (Kottwitz–Shelstad Proposition 3.5.2). An empty product, a square 2, or `n=0` gives 1; one contributing root with quadratic sign `−1` gives `−1`. Odd rank alone does not force the two terms to differ. This ratio compares the two splitting-invariant terms, not the entire factors `Δ′` and `Δ_D`.
- The 1999 product `Δ_I Δ_II Δ_III Δ_IV` depends on the `χ`-data (Kottwitz–Shelstad 2012, introduction), so it is not a transfer factor.

*Needs:* §1.2a; §2.5; §2.2; §1.4; §1.7; §1.16; `TauCetiRoadmap.ClassFieldTheory` Layer 7 (the absolute local Artin map, its normalizations, and conductors).

### 2.9 Transfer factors for Lie algebras

Let `F` be local of characteristic 0 (or a local field of characteristic `p` not dividing `|W|` in the equal-characteristic setting of Ngô), `G` quasi-split connected reductive and `(H, s, ξ)` an endoscopic datum (no `z`-pair is needed on the Lie algebra). Matching of regular semisimple elements of `𝔥(F)` and `𝔤(F)` is the Lie-algebra version of §1.16 (stable classes on both sides, §1.3). The Lie-algebra transfer factor `Δ(X_H, X)` on matching regular semisimple pairs is defined as in Langlands–Shelstad with `Δ_II, Δ_III2` replaced by their infinitesimal versions; on the stable class matching a given `X_H` it has the form `Δ(X_H, X) = κ(inv(X₀, X))·Δ_IV(X_H, X)·c(X_H)` for a base point `X₀ = X₀(X_H)` in that stable class, with `Δ_IV(X_H, X) = |D_G(X)|^{1/2}|D_H(X_H)|^{−1/2}`, inv the invariant of §1.14 and `c(X_H)` a nonzero number that depends on `X_H` and on the choice of base point. Use the unprimed Lie-algebra convention, so the `κ` multiplier agrees with the positive `κ`-weight in §2.4 and Ngô’s formula in §4.3; the primed variant replaces `κ` by `κ⁻¹`. The relative factor is independent of choices; for quasi-split `G` the base point can be chosen uniformly in the stable class (the Kostant-section normalization of Kottwitz, used to state Ngô's theorem, is fixed in §4.3). The relative discriminant `r_{G,H}(X_H) = val(D_G(X))/2 − val(D_H(X_H))/2` measures `|Δ_IV|`. Near the identity the group transfer factor of §2.5 descends to this Lie-algebra factor up to a constant (§2.7 `(e)`). For unitary groups the factor takes the explicit form of §2.12.

*Hypotheses.* `F` local; `G` quasi-split for the Kostant normalization; in equal characteristic, `p ∤ |W|`.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.9, Lemmes 1.9.1–1.9.2 (pp. 19–21); §1.10, Lemmes 1.10.1–1.10.2 and (1.10.3) (pp. 21–22); §1.11, Théorème 1.11.1 and §1.11.3 (pp. 23–24); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.6 (p. 12); §4.7 (p. 51); [G. Laumon and B. C. Ngô — Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), §1.5, Théorème 1.5.1 (PDF p. 10).)

The interface consists of the following operations and identities.

- `Δ(X_H, X)` on matching regular semisimple pairs.
- The absolute factor attached to a base point in each stable class.
- `r_{G,H}(a_H) = val` of the relative discriminant / 2.
- Behaviour under stable conjugacy through `κ`(inv).
- Agreement with the group factor after descent, up to a constant.

Langlands–Shelstad's construction carries over to Lie algebras with the exponential replaced by the identity (Waldspurger 2008 §1.6; Kottwitz 'Transfer factors for Lie algebras', Represent. Theory 3 (1999)). Base points: for quasi-split `G` every regular semisimple stable class over `F` contains a rational element whose centralizer data are uniform in the class (Kottwitz; the Kostant-section version is stated in §4.3, after Ngô §1.11, p. 23). The relative discriminant and `r_{G,H}`: Ngô §1.10, Lemmes 1.10.1–1.10.2 and (1.10.3), p. 22; the restatement with `Δ_G, Δ_H`: §1.11.3, p. 24. Unramified normalization and its agreement with the group factor after descent: Waldspurger 2008 §§4.6–4.7, 5.10–5.11.

**Checks.**

- For `H = G` and `s = 1, Δ(X, X′) = 1` on stably conjugate `X, X′`.
- For an elliptic datum whose group `H` is a torus (e.g. `𝔤 = 𝔰𝔩₂` and `H = R^1_{E/F} G_m`), `D_H = 1`, so `r_{G,H}(a_H) = val(D_G(a))/2` and `|Δ_IV| = |D_G(a)|^{1/2} = q^{−r_{G,H}(a_H)}`.
- `Δ(X_H, Ad(g)X) = Δ(X_H, X)` for `g ∈ G(F)`, and `Δ(X_H, X′) = κ(inv(X, X′)) Δ(X_H, X)` for `X′` stably conjugate to `X`, in the unprimed convention fixed here. For `ℤ/3` and `κ(1)=ζ₃` the multiplier is `ζ₃`, rather than `ζ₃⁻¹`; priming the datum inverts it.
- The Lie-algebra factor agrees with the group factor only after descent near a semisimple element and up to a constant; away from the identity the exponential is not defined on all of `𝔤(F)`.

*Needs:* §2.5; §1.4; §1.14; §1.16; §1.3.

### 2.10 Averaged Euler–Poincaré functions and their elliptic orbital integrals

Let `G` be connected reductive over `ℝ` with `A_G` the split component of the centre, `ξ` an irreducible finite-dimensional algebraic representation of `G_ℂ` with central character `χ` on `A_G(ℝ)⁰`, and `q(G) = ½ dim(G(ℝ)/K_∞A_G(ℝ)⁰)`. Assume `G(ℝ)` has discrete series modulo `A_G(ℝ)⁰` (equivalently a maximal `ℝ`-torus anisotropic modulo `A_G`). Use the boundary pseudo-coefficients `φ_π`; the new assertion computes their packet average and elliptic orbital integrals. `(b)` For the `L`-packet `Π(ξ^∨)` of discrete series with the infinitesimal character of `ξ^∨`, the Euler–Poincaré function `φ_ξ = |Π(ξ^∨)|⁻¹ Σ_{π ∈ Π(ξ^∨)} φ_π` satisfies `tr π′(φ_ξ) = (−1)^{q(G)} |Π(ξ^∨)|⁻¹ Σ_i (−1)^i dim H^i(𝔤, K_∞A_G(ℝ)⁰; π′ ⊗ ξ)` for every irreducible admissible `π′` whose central character on `A_G(ℝ)⁰` is `χ⁻¹`. Put `f_ξ = (−1)^{q(G)} |Π(ξ^∨)| φ_ξ` (Kottwitz's Euler–Poincaré function, `tr π′(f_ξ) = Σ_i (−1)^i dim H^i(𝔤, K_∞A_G(ℝ)⁰; π′ ⊗ ξ)`). The orbital integrals of `f_ξ` vanish at regular semisimple elements that are not elliptic, and at an elliptic semisimple `γ, O_γ(f_ξ) = (−1)^{q(G_γ)} vol(Ḡ_γ(ℝ)/A_G(ℝ)⁰)⁻¹ tr ξ(γ)`, with `Ḡ_γ` the inner form of `G_γ` that is compact modulo `A_G`, its Haar measure transported from that of `G_γ(ℝ)`, and `q(G_γ)` defined like `q(G)`; for regular elliptic `γ` the sign is 1, and `SO_γ(f_ξ)` is the sum of these values over the rational classes in the stable class of `γ`, with the signs of §2.4. `(c)` The construction applies to every inner form of a quasi-split group of arbitrary signature at `∞` (needed for the unitary groups of Caraiani–Scholze), and to a twisted space (Labesse's Lefschetz functions for base change).

*Hypotheses.* `G` connected reductive over `ℝ` with discrete series modulo `A_G(ℝ)⁰`; `ξ` irreducible algebraic with split-central character `χ`; `π′` has split-central character `χ⁻¹`. Relative cohomology uses `K_∞A_G(ℝ)⁰`, equivalently the Lie-algebra quotient by `𝔞_G`.

([S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.5, (3.11)–(3.12) (pp. 17–18); §3.6, Lemma 3.7, (3.13)–(3.15) and Remark 3.9 (pp. 18–19); [J. Arthur — An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §24, (24.2)–(24.4) (pp. 159–160); [A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), arXiv v1: §5.2, p. 74; §5.3, pp. 75–76 (published Annals pp. 735, 737–738).)

The interface consists of the following operations and identities.

- `φ_ξ = |Π(ξ^∨)|⁻¹ Σ φ_π`.
- `tr π′(φ_ξ) = (−1)^{q(G)}EP(π′ ⊗ ξ)/|Π(ξ^∨)|`.
- For each proper real parabolic `P=MN`, the normalized constant terms of the imported pseudo-coefficients and of `f_ξ` have zero class in the invariant orbital quotient of `M`, with the compatible split-central character and quotient measures.
- `O_γ(f_ξ) = (−1)^{q(G_γ)} vol(Ḡ_γ(ℝ)/A_G(ℝ)⁰)⁻¹ tr ξ(γ)` for elliptic semisimple `γ`, and `O_γ(f_ξ) = 0` for regular non-elliptic `γ`.
- The construction for every inner form, compatible with transfer to the quasi-split form.

`(a)` is imported from AutomorphicSpectralTheory AS.6.18–AS.6.19, with Clozel–Delorme 1990 §5.2. Clozel–Delorme's invariant Paley–Wiener theorem (Invent. Math. 77 (1984); Ann. Sci. ÉNS 1990) gives functions with prescribed tempered traces, as recalled by Shin (p. 18–19: credits Clozel–Delorme for existence) and Arthur (§24). `(b)` The Euler–Poincaré property follows from Wigner’s lemma (ArithmeticLocallySymmetricSpaces §ALS.F.7 (Wigner’s lemma)) and Vogan–Zuckerman (the packet cohomology calculation of §2.10), with `q(G)` as in the symmetric-space definition at the start of §2.10. Orbital integrals at elliptic elements: for regular elliptic `γ` with centralizer `T, O_γ(φ_π) = vol(T(ℝ)/A_G(ℝ)⁰)⁻¹ Θ_π(γ⁻¹)` (Weyl integration formula and the orthogonality of discrete series characters), and `Σ_{π ∈ Π(ξ^∨)} Θ_π(γ⁻¹) = (−1)^{q(G)} tr ξ(γ)` on the compact Cartan, so `O_γ(f_ξ) = vol(T(ℝ)/A_G(ℝ)⁰)⁻¹ tr ξ(γ)`; at a singular elliptic `γ` the sign `(−1)^{q(G_γ)}` of Arthur's global term (24.4) appears, which for central `γ` is `(−1)^{q(G)}`, the sign of `f_ξ(1) = (−1)^{q(G)} Σ_π d(π)` with `d(π)` the formal degrees; the character-sum identity is used only on the elliptic Cartan. For a proper `P=MN`, the pseudo-coefficient traces vanish on tempered representations induced from `M` (AutomorphicSpectralTheory AS.6.18); AS.6.19 gives the corresponding Euler–Poincaré induced-trace vanishing. The constant-term trace identity identifies these with the tempered traces of the normalized constant term on M. Real invariant Paley–Wiener density makes its invariant orbital class zero, which proves Euler–Poincaré constant term. Parabolic descent of orbital integrals then gives `O_γ(f_ξ)=0` for regular nonelliptic `γ`, whose centralizer lies in a proper real Levi. This is cuspidality of the test function in the invariant quotient, without a pointwise vanishing claim for its constant term or for discrete-series characters (Arthur §24, pp.159–160; Shin §3.5, pp.17–18). `(c)` The construction does not use quasi-splitness; the arbitrary-signature case is required by Caraiani–Scholze (compact paper, §5.2, p. 735, and the highest-weight calculation of §5.3).

**Checks.**

- For `G=G_m` over `ℝ` and `π′=ξ=1`, quotienting by the positive split centre leaves only `H⁰=ℂ`, so the trace is 1. Using `(𝔤,K_∞)` instead gives `H⁰=H¹=ℂ` and the incorrect Euler characteristic 0.
- For `G = SL₂(ℝ)` and `ξ` trivial: `q(G) = 1, Π(ξ^∨) = {D₂^+, D₂^−}`, the trivial representation has `(𝔤, K)`-cohomology `ℂ` in degrees 0 and 2, so tr 1`(φ_ξ) = (−1)·2/2 = −1`, while `tr D₂^±(φ_ξ) = (−1)·(−1)/2 = 1/2`.
- `tr π(φ_π) = 1` and `tr π′(φ_π) = 0` for tempered `π′` ≇ `π` with the same central character (the property of AS.6.18, checked on the imported functions).
- If `G(ℝ)` is compact (`A_G` trivial), `q(G) = 0, Π(ξ^∨) = {ξ^∨}` and `f_ξ = vol(G(ℝ))⁻¹ tr ξ`, so `O_γ(f_ξ) = vol(G_γ(ℝ))⁻¹ tr ξ(γ)` by Schur orthogonality.
- For `G = SL₂(ℝ), ξ` trivial and `γ` regular elliptic with centralizer `T = SO(2): O_γ(f_ξ) = vol(T(ℝ))⁻¹ > 0`, and `SO_γ(f_ξ) = 2 vol(T(ℝ))⁻¹` (two rational classes); the sign `(−1)^{q(G)} = −1` appears only at central `γ`, where `f_ξ(±1) = −(d(D₂^+) + d(D₂^−))`.
- For `G=SL₂(ℝ)`, `ξ=1`, `a_t=diag(e^t,e^(−t))` and `t>0`, the reducible normalized principal series at parameter 1 has constituents `D₂⁺`, `D₂⁻` and `1`. Its hyperbolic character gives `Θ_(D₂⁺)(a_t)+Θ_(D₂⁻)(a_t)=(e^t+e^(−t))/(e^t−e^(−t))−1=2/(e^(2t)−1)>0`, although `O_(a_t)(f_ξ)=0`. This distinguishes character values from orbital integrals of the test function.
- `O_γ(φ_ξ) = 0` for `γ` regular semisimple non-elliptic (e.g. hyperbolic elements of `SL₂(ℝ)`), so `φ_ξ` is not a positive multiple of a function concentrated near the identity.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` §§6.1, 6.18–6.19 (invariant Paley–Wiener density, pseudo-coefficients and induced Euler–Poincaré vanishing); §2.3; §2.4; §1.13; `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations); `TauCetiRoadmap.ArithmeticLocallySymmetricSpaces` §§ALS.F.5–ALS.F.7 (relative cochains and algebraic coefficients).

### 2.11 Matching test functions and transfer classes

Let `F` be local of characteristic 0, `(G, θ, ω)` with endoscopic datum `(H, ℋ, s, ξ), z`-pair `(H₁, λ₁)` and the descended carriers and actions of §1.16, and an absolute transfer factor `Δ` (§2.5, §2.8). For `f ∈ C_c^∞(G(F))` define `O^{G,ω}_{γ₁}(f) = Σ_δ Δ(γ₁, δ) O^ω_δ(f)`, the sum over representatives of `G(F)`-classes (`θ`-classes) of `δ` matching `γ₁`. A function `f^{H_{1,z}} ∈ C₁^∞(H_{1,z}(F))` (smooth, locally constant when `F` is nonarchimedean, compactly supported modulo `Z₁(F)`, with `f`(zx) `= λ₁(z)⁻¹ f(x)`) is a transfer of `f`, written `f ↔ f^{H_{1,z}}`, if `SO_{γ₁}(f^{H_{1,z}}) = O^{G,ω}_{γ₁}(f)` for every strongly `G`-regular `γ₁ ∈ H_{1,z}(F)`, and `SO_{γ₁}(f^{H_{1,z}}) = 0` when no `δ` matches `γ₁`. A transfer, if it exists, is unique only modulo the subspace of functions all of whose strongly regular stable orbital integrals vanish; the canonical object is the class of `f^{H_{1,z}}` in the space SI`(H_{1,z})` of stable orbital integrals (the quotient of `C₁^∞(H_{1,z}(F))` by that kernel), and the transfer map `f ↦ [f^{H_{1,z}}]` is linear. Here `SO` is the sum over rational `H(F)`-orbits in a stable class, integrating over `H_γ(F)\H(F)` with the transported centralizer measures. If `H_z(F)=∅`, the target spaces are zero and transfer is the zero class. Ordinary data and cyclic base change use the compatible trivial descent of §1.16. The same orbital equations apply to Lie algebras (no `z`-pair). At real places write `𝒞(G(ℝ))` for the Harish-Chandra Schwartz space and `𝒞(H₁(ℝ),λ₁)` for smooth functions satisfying `f(zx)=λ₁(z)⁻¹f(x)` that are Harish-Chandra Schwartz modulo `Z₁(ℝ)`, in Shelstad’s central-character convention. The Schwartz interface uses his tempered normalization: the embedding correction linear form of Shelstad I, §11, is purely imaginary and the attached central character is unitary. Their stable orbital quotient is formed inside that Schwartz space, separately from the compact-modulo-`Z₁` quotient. `K`-finiteness means finiteness under left and right maximal-compact translations within the specified compact-support or Schwartz space; it is not a support or decay condition. For cyclic base change, `f ∈ C_c^∞(G₀(E))` and `f^H ∈ C_c^∞(H(F))` are associated if `SO_γ(f^H) = SO_δ^θ(f)` whenever `γ` is a norm of `δ` and `SO_γ(f^H) = 0` when `γ` is not a norm (Labesse §3.2).

*Hypotheses.* `F` local of characteristic 0; an endoscopic datum with `z`-pair and an absolute transfer factor.

([J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.5 (pp. 11–12); [S. Leslie — The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.3 (p. 19); [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.2, Définition 3.2.1 (p. 76); [D. Shelstad — Tempered endoscopy for real groups I](https://sites.rutgers.edu/diana-shelstad/wp-content/uploads/sites/189/2019/10/shelstadtempend1.pdf), §§2, 11 and Theorem 14.3, author-version pp. 4–5, 31–32 and 40.)

The interface consists of the following operations and identities.

- The relation `f ↔ f^{H_{1,z}}`.
- SI`(H_{1,z}): C₁^∞(H_{1,z}(F))` modulo the kernel of all strongly regular stable orbital integrals.
- The linear map `C_c^∞(G(F)) → SI(H_{1,z})`, defined where transfer exists.
- Linearity: transfers of `f` and `f′` add to a transfer of `f + f′`.
- Two transfers of `f` have the same image in SI`(H_{1,z})`.
- The Lie-algebra version.
- Base-change association of Labesse.

Well definedness of `O^{G,ω}_{γ₁}`: finitely many classes match `γ₁` (§1.14 `(b)`), and the sum does not depend on the representatives because `Δ(γ₁, δ)O^ω_δ(f)` is a class function of `δ` (Waldspurger 2008 §1.5). Ambiguity: two transfers differ by a function in the kernel of all `SO_{γ₁}`; stable orbital integrals of strongly regular elements determine the class in SI (by definition of SI). Base change association: Labesse §3.2; Clozel (Proposition 7.2 there) shows that it suffices to test regular elements.

**Checks.**

- If `H_z(F)=∅`, every source function transfers to the unique zero target function and the stable orbital quotient is zero.

- For `H = G` quasi-split, `s = 1` and `Δ` the base-point factor, `f` is a transfer of itself.
- If `f^H` and `f′^H` are both transfers of `f` then `SO_γ(f^H − f′^H) = 0` for all strongly `G`-regular `γ`, and conversely any such difference preserves transfer.
- In the unramified situation, the characteristic function of `H(𝒪)` (suitably normalized) is a transfer of the characteristic function of `G(𝒪)` (the fundamental lemma, §4.6).
- The transfer is not a well-defined function on `H_{1,z}(F)`: adding any nonzero function whose strongly regular stable orbital integrals all vanish gives another transfer; for `H₁ = SL₂` over a `p`-adic field, such a function is `φ₁ − φ₂` with `φ₁, φ₂` supported near the two rational classes of a regular elliptic stable class and having equal orbital integrals there.

*Needs:* §2.5; §2.8; §2.4; §2.1; §1.16; §1.7.

### 2.12 The transfer factor for unitary Lie algebras

Let `E/F` be an unramified quadratic extension of `p`-adic fields (`p` odd), `V, V_a, V_b` Hermitian spaces with `a + b = n` and the elliptic endoscopic datum `(U(V_a) × U(V_b), s, ξ)` of `U(V)` (§1.8, local version). For matching regular semisimple `δ ∈ Herm(V)` and `(δ_a, δ_b)` (§1.17) let `D(δ) = ∏_{x_a, x_b}(x_a − x_b)`, the product over the eigenvalues `x_a` of `δ_a` and `x_b` of `δ_b` (the quotient of Weyl discriminants of Langlands–Shelstad's `Δ_IV`). For a nice matching pair `(δ = φ_{a,b}(δ_a, δ_b), V ≅ V_a ⊕ V_b)` the transfer factor is `Δ((δ_a, δ_b), δ) = η_{E/F}(D(δ))|D(δ)|_F`, and in general `Δ((δ_a, δ_b), δ) = κ(inv(δ, δ′)) η_{E/F}(D(δ))|D(δ)|_F` with `δ′ = φ_{a,b}(δ_a, δ_b)` and `κ` the endoscopic character (§1.17 `(c)`). `Δ` vanishes on non-matching pairs and `Δ((δ_a, δ_b), δ)` Orb`^κ(f, δ)` depends only on the stable class of `δ`. This is the specialization of §2.9 to unitary Lie algebras, in the normalization used by Laumon–Ngô and Leslie.

*Hypotheses.* `E/F` unramified quadratic, `p` odd; the endoscopic datum `U(V_a) × U(V_b)` of `U(V)`.

([S. Leslie — The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.3, (2.7) and Remark 2.8 (pp. 18–19); [G. Laumon and B. C. Ngô — Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), §1.5, Théorème 1.5.1 (PDF p. 10).)

Specialize the Lie-algebra factor: `Δ_IV` gives `|D(δ)|` and the remaining terms combine to the quadratic character `η_{E/F}(D(δ))` for the base point given by nice matching pairs (Leslie Remark 2.8 and its Appendix A of a companion paper, cited there). Behaviour under stable conjugacy: §2.9 and §1.17 `(c)`.

**Checks.**

- For a nonmatching pair with different characteristic polynomials, `Δ=0` even when the numerical resultant `D` is nonzero; the resultant formula alone does not define transfer on all pairs.

- `n = 2, a = b = 1: δ_a = x, δ_b = y` with `x ≠ y` in `F, D = x − y, Δ = η_{E/F}(x − y)|x − y|_F` on the nice pair.
- `a = n, b = 0` (the principal datum): `D = 1` and `Δ = 1`.

*Needs:* §2.9; §1.17; §1.8.

### 2.13 Fourier transforms of orbital integrals and their compatibility with transfer

Let `F` be a `p`-adic field, `G` connected reductive, `ψ` a nontrivial additive character and `B_g` a nondegenerate `G`-invariant symmetric bilinear form on `𝔤` (existing when `p` is large relative to `G`), with self-dual Haar measure for `ψ∘B_g`. For `f ∈ C_c^∞(𝔤(F))` let `f̂(Y) = ∫ f(X)ψ(B_g(X,Y))` dX. `(a)` (Harish-Chandra) For `X ∈ 𝔤_rs(F)` the distribution `f ↦ O_X(f̂)` is represented by a locally integrable function `Ô_X` on `𝔤(F)`, locally constant on `𝔤_rs(F)`, and `|D(Y)|^{1/2} Ô_X(Y)` is locally bounded. `(b)` (Waldspurger) For an endoscopic datum `(H, s, ξ)` of quasi-split `G` and the Lie-algebra transfer factors (§2.9), construct the induced nondegenerate invariant symmetric form `B_h` on `𝔥`. On every pair of matching Cartans, with admissible isomorphism `θ_{Y,X}:𝔱_Y≅𝔱_X`, require `B_h(Z,Z′)=B_g(θ_{Y,X}Z,θ_{Y,X}Z′)`. Prove independence of the admissible representatives, descent to `F`, uniqueness and nondegeneracy. Use this `B_h` and the same `ψ` for the self-dual measure on `𝔥`, its Fourier transform and its Weil constant. If `f^H` is a transfer of `f`, then `γ_ψ(𝔤) γ_ψ(𝔥)⁻¹` times the Fourier transform of `f^H` is a transfer of `f̂`, where `γ_ψ(𝔤)` and `γ_ψ(𝔥)` use the Gaussian phases `ψ(B_g(X,X)/2)` and `ψ(B_h(Y,Y)/2)`; equivalently, the transfer commutes with the Fourier transform up to this explicit constant. `(c)` Consequently, if the transfer exists for all functions supported near 0 whose Fourier transforms are supported on topologically nilpotent elements, it exists for all of `C_c^∞(𝔤(F))` (the reduction in Waldspurger's proof that the fundamental lemma implies transfer).

*Hypotheses.* `F p`-adic of characteristic 0; `p` large enough for the invariant form and exponential to behave (Waldspurger's standing hypothesis). Part `(b)` uses the induced form `B_h` and the common `ψ`, not an independent form on `𝔥`.

([J.-L. Waldspurger — Le lemme fondamental implique le transfert](https://doi.org/10.1023/A:1000103112268), introduction p. 154 and §3.2 p. 163 (induced form on matching Cartans); [R. E. Kottwitz — Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §26 'Niceness of `Ô_X` for `X ∈ 𝔤_rs`' (p. 509); §25 (p. 507); [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.3, before Théorème 3.3.1 (p. 78); [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.4 and Remark 3.4 (p. 15).)

`(a)` Harish-Chandra's local integrability theorem on the Lie algebra (Kottwitz, Clay notes §26 'Niceness of `Ô_X` for `X ∈ 𝔤_rs`', p. 509). `(b)` Transport `B_g` on matching Cartans. Admissible changes differ by Weyl conjugation, which preserves the restricted form; the resulting Weyl-invariant form extends to an invariant form on `𝔥` and descends over F. Its Cartan restriction is nondegenerate, as is the resulting reductive Lie-algebra form in characteristic zero. For the principal datum this construction gives `B_h=B_g`. Waldspurger, 'Le lemme fondamental implique le transfert', Compositio Math. 105 (1997), main theorem on Fourier transform and transfer, as recalled by Labesse (§3.3, citing its Corollaire 1.7 for inner forms) and by Ngô (introduction, p. 2) and Shin (§3.4, p. 15). `(c)` Combine `(b)` with homogeneity of germs (§2.6) and the local gluing lemma for transfer (Waldspurger 2008 §2.2).

**Checks.**

- For principal identity endoscopy of `G_m/ℚ_p`, `ψ` of conductor `ℤ_p` and `B_g(x,y)=xy`, compatibility forces `B_h=B_g`. The independent choice `p²xy` is excluded: its self-dual measure has `vol(ℤ_p)=p⁻¹` and its transform of `1_{ℤ_p}` is `p⁻¹1_{p⁻²ℤ_p}`, whereas the compatible transform is `1_{ℤ_p}`. The quadratic forms are isometric and have equal Weil constants, so a scalar cannot repair the support difference.

- For `𝔤 = 𝔱` a torus, `Ô_X(Y) = ψ(B_g(X,Y))` and transfer is the identity.
- For the elliptic datum `H=GL_n` of `GL_n, (b)` is the trivial statement that the Fourier transform preserves orbital integral identities up to `γ_ψ(𝔤)γ_ψ(𝔤)⁻¹ = 1`.

For the following one-dimensional tests use `𝔤=F=ℚ₃, B_g(X,Y)=XY, ψ` of conductor `ℤ₃` and `vol(ℤ₃)=1`.

- The transform of `1_{ℤ₃}` is `1_{ℤ₃}`.
- The transform of `1_{3ℤ₃}` is `(1/3)1_{3⁻¹ℤ₃}`.
- The transform of `1_{1/3+ℤ₃}` at `Y` is `ψ(Y/3)1_{ℤ₃}(Y)`, fixing the positive Fourier phase.

*Needs:* §2.1; §2.6; §2.9; §2.11.

### 2.14 Transfer at the real place

Let `G` be connected reductive over `ℝ` with an endoscopic datum `(H, ℋ, s, ξ), z`-pair and Langlands–Shelstad transfer factor (§2.5). `(a)` (Shelstad, compact support) For every `f ∈ C_c^∞(G(ℝ))` there is `f^{H₁} ∈ C₁^∞(H₁(ℝ))`, compactly supported modulo `Z₁(ℝ)`, whose strongly regular stable orbital integrals are the endoscopic orbital integrals of `f`. Separately, every `f ∈ 𝒞(G(ℝ))` has a transfer in `𝒞(H₁(ℝ),λ₁)`, with the central character of §2.11. These include the `K`-finite subspaces of their respective source spaces; `K`-finiteness alone imposes neither support nor decay. `(b)` Spectral form: for tempered `L`-packets the transfer is dual to the endoscopic character identities expressing the stable character of an `H`-packet, transported by `ξ`, as a combination `Σ_π Δ(φ_H, π)Θ_π` of characters of the corresponding `G`-packet. `(c)` For cyclic base change of unitary groups at `ℝ` (or `ℂ/ℝ`), `K`-finite transfer exists and is compatible with the twisted Paley–Wiener theorem (Labesse §3.5, Propositions 3.5.2–3.5.4).

*Hypotheses.* `F = ℝ`; an endoscopic datum with `z`-pair (and, for `(c)`, cyclic base change). The Schwartz and tempered spectral assertions use Shelstad’s tempered normalization of §2.11; compact-support transfer has its stated compact-modulo-centre target.

([J. Arthur — An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §27 (pp. 192–204, in particular p. 203); [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.5, Lemme 3.5.1, Propositions 3.5.2–3.5.4 and 3.5.6 (pp. 82–87).)

`(a)`–`(b)` Use [Shelstad, *Tempered endoscopy for real groups I*](https://sites.rutgers.edu/diana-shelstad/wp-content/uploads/sites/189/2019/10/shelstadtempend1.pdf), Theorem 14.3 and §§14–15, pp. 40–46, and [Part II](https://sites.rutgers.edu/diana-shelstad/wp-content/uploads/sites/189/2019/10/shelstadtempend2.pdf), Theorem 5.1, pp. 7–8, with proof §§13–14, pp. 31–39 (author-version pages). On Cartan subgroups form the transfer-factor combination of orbital integrals and verify the differential equations, Weyl symmetry, decay and imaginary-wall jump conditions characterizing stable orbital integrals. These give Schwartz-to-Schwartz geometric transfer by Theorem 14.3; the compact-support statement for compactly supported input follows by the support and jump criterion in `I` §15, pp. 45–46. Duality and Weyl integration convert it into an invariant tempered eigendistribution. Parabolic descent reduces its character expansion to the discrete elliptic case, where the Harish-Chandra character formula fixes the coefficients. Coherent continuation and the Hecht–Schmid identities extend to singular tempered parameters. The compatible geometric and spectral factors give `(b)`. `(c)` Labesse §3.5: Propositions 3.5.2–3.5.4 establish `K`-finite base-change transfer at archimedean places using the twisted trace Paley–Wiener theorem of Clozel–Delorme, and Proposition 3.5.6 for complex groups.

**Checks.**

- For principal endoscopy of `G=H=G_m/ℝ`, the trivial `z`-pair and factor 1, stable orbital integrals are evaluation. The function `f(x)=exp(−x²−x⁻²)` is Schwartz and `{±1}`-invariant, hence `K`-finite, with support all of `ℝ×`. Its unique transfer is itself, in the Schwartz target, and has no compactly supported representative. The stable-orbital kernel is zero.

- For the principal datum the transfer is the identity on stable orbital integrals.
- For `G = SL₂(ℝ)` and `H = U(1)`: the `κ`-character `Θ_{D_k^+} − Θ_{D_k^−}` is, up to the sign fixed by the transfer factor normalization, the transfer of a character of `U(1)` (Shelstad's character identity).

*Needs:* §2.5; §2.11; §2.3; `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations).

### 2.15 Transfer of Euler–Poincaré functions to endoscopic groups

Let `G` be a connected reductive group over `ℝ` with discrete series modulo the centre, `(H, s, η)` an elliptic endoscopic datum (so `H(ℝ)` also has discrete series), `ξ` irreducible algebraic and `φ_ξ` the Euler–Poincaré function (§2.10). Then a transfer of `φ_ξ` to `H` is an explicit linear combination `Σ_{φ_H} c(φ_H) φ_{φ_H}` of the averaged pseudo-coefficients `φ_{φ_H}` of the discrete `L`-packets of `H(ℝ)`, over the discrete parameters `φ_H` with `η∘φ_H` equivalent to the parameter of `Π(ξ^∨)`; each coefficient `c(φ_H)` is a sign times a pairing `⟨a, s⟩` determined by Shelstad's character identities and the normalization of the transfer factor (Kottwitz's construction). For `G` a unitary similitude group of Harris–Taylor or arbitrary signature at `∞` the coefficients are those of Shin's Lemma 3.7 with (3.13)–(3.15), and the resulting functions are Caraiani–Scholze's `φ^{n⃗}_∞`.

*Hypotheses.* `G` over `ℝ` with discrete series; `(H, s, η)` elliptic; the transfer factor normalization of §2.5.

([S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.6, Lemma 3.7 `(i)`–(ii), (3.13)–(3.15), Remark 3.9 (pp. 18–19); [S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5.2 (pp. 16–17); [A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), arXiv v1: §5.2, p. 74; §5.3, p. 76.)

Kottwitz's construction (Kottwitz, 'Shimura varieties and `λ`-adic representations', 1990, §7) via Shelstad's character identities for discrete series (§2.14 `(b)`); the explicit form used here is Shin's Lemma 3.7 and its proof (pp. 18–19) and Caraiani–Scholze §5.2. Twisted analogue for base change: Labesse's Lefschetz functions (Shin p. 19; Caraiani–Scholze compact §5.3).

**Checks.**

- For the principal datum the transfer of `φ_ξ` is `e(G)·φ_ξ^{G*}`, the Euler–Poincaré function of the quasi-split inner form (Kottwitz sign).
- For `U(1,1)` and `H = U(1)×U(1)`, the transfer is a signed sum over the two discrete parameters of `H` lifting the parameter of `ξ`.

*Needs:* §2.10; §2.14; §2.5; §1.13; §1.8.

### 2.16 Harish-Chandra's character theorem and the Weyl integration formula over `p`-adic fields

Let `F` be a non-archimedean local field of characteristic 0, `G` a connected reductive group over `F` and `π` an admissible irreducible smooth complex representation of `G(F)`. `(a)` For `f ∈ C_c^∞(G(F))` the operator `π(f)` has finite rank, and `Θ_π(f) = tr π(f)` is an invariant distribution. `(b)` (Harish-Chandra) There is a locally integrable function `θ_π` on `G(F)`, locally constant on the regular semisimple set `G(F)_rs` and invariant under conjugation, with `Θ_π(f) = ∫_G f(g) θ_π(g)` dg for every `f`; `|D^G|^{1/2} θ_π` is locally bounded. `(c)` (Weyl integration formula) For `f ∈ C_c^∞(G(F)), ∫_G f(g) dg = Σ_T |N_G(T)(F)/T(F)|⁻¹ ∫_{T(F)} |D^G(t)| O_t(f)` dt, the sum over representatives `T` of the `G(F)`-conjugacy classes of maximal `F`-tori, with the orbital integrals and measures of §2.1. `(d)` Consequently `Θ_π(f) = Σ_T |N_G(T)(F)/T(F)|⁻¹ ∫_{T(F)} |D^G(t)| θ_π(t) O_t(f)` dt, and `Θ_π` is determined by `θ_π` on the elliptic regular set together with the characters of proper Levi subgroups through the van Dijk formula for induced representations.

*Hypotheses.* `F` non-archimedean of characteristic 0 (the theorem is used only in characteristic 0 here). `π` admissible and of finite `length` (irreducible representations are admissible by SmoothRepresentationsOfLocalGroups §SR.3a.2).

([L. Clozel — Characters of non-connected reductive p-adic groups](https://doi.org/10.4153/CJM-1987-008-3), §3.3 Theorems 1–3 pp. 153–154; §3.4 pp. 154–156; §§3.5–3.9 pp. 156–167; [R. E. Kottwitz — Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), Introduction, pp. 394–396; [R. E. Kottwitz — Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §7, pp. 421–423 (7.7); [J. Arthur and L. Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §2, pp. 11–12 (Proposition 2.2).)

Finite rank of `π(f)` is admissibility: `f` is bi-invariant under some compact open `K` and `π(f)` factors through `π^K`. Clozel 1987 Theorems 1–3: descend an admissible character near a semisimple element to its connected centralizer, use the exponential chart, and express the descended distribution locally by Fourier transforms of nilpotent orbital measures. The discriminant comparison in §3.4 transfers local boundedness/integrability back to the group; Layer 2 supplies the orbital Fourier integrability. The Fourier-support input is Clozel Lemma 6, proved in §§3.5–3.9 from Howe’s small-compact orbit parametrization, the intertwining criterion, the norm estimates and the Fourier coefficient formula. The small-compact orbit calculation uses Howe’s parametrization, while Cartan decomposition is ReductiveGroupsPartII §RG2.4.4. For the group formula use the Jacobian of `(T(F)\G(F)) × T(F)_rs → G(F)_rs, (x,t) ↦ x⁻¹tx`: it is `|det(1−Ad(t)|𝔤/𝔱)|`. Its fibre has `|N_G(T)(F)/T(F)|` elements. Kottwitz §7 proves the analogous Lie-algebra formula; it does not itself state the group formula. `(d)` combines `(b)` and `(c)`; derive the parabolically induced character formula by writing the induced convolution operator on `K/(K∩P)`, taking its diagonal kernel and changing variables along N. The normalized induction factor is `δ_P^(1/2)`; this gives van Dijk’s formula with the same Haar measures. Its constant-term and contracting-Jacquet forms are spelled out in §8.9.

For `GL_r(D)`, import SmoothRepresentationsOfLocalGroups §SR.3.3’s *harish-chandra-tempered-support*: every irreducible tempered representation is a direct summand of normalized induction from a unitary square-integrable representation of a Levi, with that support unique up to conjugacy. the tempered-support decomposition for inner forms of GL is this supplied theorem specialized to `GL_r(D)`. Badulescu §2, Theorem 2.1 and its proof, pp. 5–12, proves the additional inner-GL assertion that this unitary induction is irreducible. Applying SR.3.3’s standard-quotient theorem therefore gives every irreducible a unique ordered standard quotient with essentially square-integrable blocks. Triangularity with respect to those quotients gives the standard modules as a `ℤ`-basis of the finite-length Grothendieck group (Badulescu p. 5). Keep the positive-exponent quotient convention; the split segment notation is that of SR.5.2 (*segment-representations*).

The elliptic pairing used for uniqueness is also a target: for unitary square-integrable `π,π′` with the same central character, their Harish-Chandra characters are orthonormal for the elliptic Weyl pairing on `G/Z`. Sum over elliptic maximal tori, divide by their rational Weyl groups, integrate `D(t)Θπ(t)`overline`(Θπ′(t))` on `T/Z` with compatible quotient Haar measures; the result is `δ_{π,π′}`. Use Arthur, *On elliptic tempered characters*, Theorem 6.1 and Corollary 6.2, pp. 113–115, with the discrete-series datum `M=G`: its `R`-group and determinant factor are both 1. The proof compares the geometric elliptic pairing with the spectral pairing in the cuspidal local trace formula (§4, Corollary 4.3, pp. 104–105), using the trace Paley–Wiener theorem to realize cuspidal spectral tests. Normalize the compact `T/Z` quotient measure to volume one as in Badulescu §2, pp. 9–10. This proof precedes and does not use Jacquet–Langlands. Character local integrability and regular local constancy are proved above, and Weyl integration is used with its discriminant. The API the tempered-support decomposition for inner forms of GL, tempered induction irreducible, standard basis and elliptic character pairing records these inputs. Check `D=F` recovers the split standard quotient; two distinct discrete series with fixed central character have pairing zero; a proper parabolic induction has zero elliptic character and cannot be added to an orthonormal discrete-series basis.

**Checks.**

- For `G = GL₁, θ_χ = χ` for a character `χ`, and the Weyl integration formula is the identity `∫_{F^×} f = ∫_{F^×} f`.
- For the Steinberg representation of `GL₂(F), θ_St = −1` on the regular elliptic set (the normalization check reused by the Layer 10 local correspondence).
- `Θ_π` is nonzero on `C_c^∞(G(F)_rs)` for every irreducible `π` (linear independence of characters).

*Needs:* `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.3 (Tempered representations and the conditional Langlands classification); §2.1; §2.13; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3a.2 (Uniform admissibility); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); Mathlib `MeasureTheory.Measure.IsHaarMeasure`.

### Examples

If a stable class has two rational classes with orbital values a and `b`, the stable sum is `a+b` and the nontrivial order-two kappa sum is a-`b`. At `a=b=1`, the former is 2 and the latter is 0, so replacing a kappa sum by a stable sum fails immediately. For `GL₁` the root system and discriminant correction are empty, and a transferred character is evaluated through the field norm. Rescaling a quotient measure rescales its orbital integral and must be transported to the matching side.

### Dependencies

`TauCetiRoadmap.AutomorphicSpectralTheory` §6 (Paley–Wiener theory and trace distributions); `TauCetiRoadmap.AdelicAlgebraicGroups` §2.2 (Parabolic modulus and homogeneous integration); §1.3; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.1.1 (Functions, measures and convolution); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ReductiveGroups` Layer 2 (Lie algebra and the adjoint representation); Mathlib `MeasureTheory.Measure.IsHaarMeasure`; `TauCetiRoadmap.ClassFieldTheory` Layer 7 (the absolute local Artin map, its normalizations, and conductors); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (the global class formation and global Artin reciprocity); `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations); §1.14; §1.13; §1.2; §1.4; §1.7; §1.16; §1.6; `TauCetiRoadmap.ClassFieldTheory` Layer 9 (the local Weil group); §1.15; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism); `TauCetiRoadmap.GlobalNumberFields` Layer 0 (places, completions, and the product formula); `TauCetiRoadmap.ArithmeticLocallySymmetricSpaces` §§ALS.F.5–ALS.F.7 (relative cochains and algebraic coefficients); §1.17; §1.8; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.3 (Tempered representations and the conditional Langlands classification); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3a.2 (Uniform admissibility); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction).

## Layer 3: Hitchin geometry and support

Start with the curve-bundle and local-loop instances needed by the Hitchin construction. The characteristic map and regular centralizer lead to the global Picard action and local product formula. The anisotropic fibration, `δ` bound and support theorem are the inputs to geometric endoscopic comparison.

### 3.1 Bundles on the fixed global curve

For the smooth projective geometrically connected curve `X/k` and the smooth affine quasi-split reductive `X`-group `G` used in this layer, construct the stack `Bun_G` on `k`-schemes: its fibre over `S` is the groupoid of `G`-torsors on `X×S`, with equivariant isomorphisms. Pullback in `S` and fppf descent are part of the construction. Prove algebraicity and local finite type for this fixed-curve stack, and construct its universal torsor. Quasi-compactness is neither required nor asserted. The adjoint vector bundle of a torsor supplies the linear section stack used in the Hitchin construction.

The interface consists of the following operations and identities.

- the groupoid of torsors, retaining automorphisms rather than passing to isomorphism classes.
- base change along `S′→S`, with the composition and identity isomorphisms.
- effective fppf descent for objects and morphisms.
- the universal `G`-torsor on `X×Bun_G` and its evaluation on test schemes.
- the vector bundle associated to the adjoint representation, compatible with pullback.
- algebraic, locally of finite type, with smooth atlases on bounded families.

Use torsor descent (ReductiveGroups Layer 7; SchemeAndStackFoundations Layer 1) and the Artin criterion (AlgebraicModuliForArithmeticGeometry §7.1). For a bounded family, choose a sufficiently positive twist and a presentation of the associated vector bundles by Quot charts, impose the reduction-to-`G` equations, and take the change-of-framing quotient. Cover by such bounded charts. Represent the diagonal by the isomorphism functor and use smooth torsor deformation theory on a curve. This gives the fixed-curve bundle stack of [Ngô](https://arxiv.org/abs/0801.0446v3), §4.1, p. 62.

**Checks.**

- For `G=GL₁` the fibre is the Picard groupoid: a line bundle still has its scalar automorphisms, so the stack cannot be replaced by the Picard scheme.
- For `G=GL_n`, objects correspond to rank-`n` vector bundles and isomorphisms; pullback preserves rank and determinant.
- Over an algebraic closure, degree-`d` line bundles occur for every integer `d`; `Bun_GL₁` is not quasi-compact.
- A torsor with a descent datum glues uniquely up to the specified isomorphism; a collection of local isomorphism classes without cocycle data is insufficient.

*Needs:* `TauCetiRoadmap.AlgebraicCurves` Layers 4 (repartitions, Weil differentials and Riemann–Roch) and 12 (the function-field/curve dictionary); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.SchemeAndStackFoundations` Layer 1 (descent, algebraic spaces and stacks); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §7.1 (Formal points, gluing and module obstructions).

### 3.2 The equal-characteristic local loop quotient

For a reductive group `G` over `k[[t]]`, split over an unramified extension, define the positive loop functor `L⁺G(R)=G(R[[t]])` and loop functor `LG(R)=G(R((t)))` on `k`-algebras. Construct their fpqc quotient `Gr_G=LG/L⁺G` as an ind-scheme. Equivalently, an `R`-point is a `G`-torsor on the formal disc, with a trivialization on the punctured disc, with the necessary fpqc descent; a point need not be the image of an element of `G(R((t)))` without a cover. At a closed curve point use its residue field and completed local ring, with coordinate-change compatibility. Only this local fibre is needed; no multileg factorization Grassmannian is required here.

The interface consists of the following operations and identities.

- local loop grassmannian positive loops and loops: the two functors and their inclusion.
- the fpqc quotient with its universal property.
- the equivalence with a torsor and punctured-disc trivialization.
- the LG action, with `L⁺G` stabilizing the unit point.
- closed finite-dimensional approximation stages, whose union is `Gr_G`.
- transport under a change of formal parameter, preserving the modification functor.

For `GL_n` construct bounded lattice charts `t^m R[[t]]^n⊂L⊂t^(−m)R[[t]]^n` in an ordinary finite Grassmannian, impose `t`-stability, and pass to the filtered union. Use a faithful representation and the equations of a reduction to `G` to construct the reductive quotient, with fpqc effectiveness. The affine Springer condition is a closed condition inside these stages. The local object and its role are recalled in [Ngô](https://arxiv.org/abs/0801.0446v3), §3.2 and Proposition 3.2.1, p. 43; the quotient representability is a construction target, not an inference from its set of `k`-points.

**Checks.**

- For `GL_n` over a field, points are full `k[[t]]`-lattices in `k((t))^n`; right multiplication by `GL_n(k[[t]])` changes a frame and leaves the lattice unchanged.
- Over a field `Gr_GL₁` has points `t^m k[[t]]`, indexed by `m∈ℤ`. For a nonreduced test ring, do not impose that this integer indexing determines the whole functor.
- The loop `diag(t,1,…,1)` does not fix the unit lattice; a constant integral invertible matrix does.
- Changing `t` to a unit times `t` transports both the lattice bounds and the punctured-disc trivialization; the functor does not depend on a chosen uniformizer.

*Needs:* `TauCetiRoadmap.AlgebraicCurves` Layer 5 (consequences of Riemann–Roch, and local components); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §1.3 (Coherent quotients, Plücker and partial flags); `TauCetiRoadmap.SchemeAndStackFoundations` §1.1 (descent).

### 3.3 The Chevalley quotient and the characteristic map

For `GL_n`, record the non-leading `Matrix.charpoly` coefficients from the constant coefficient upward, indexed by `Fin n`. This reverses the usual `a₁,…,a_n` order but preserves the same polynomial; the coordinate-order adapter belongs to the characteristic-map comparison API.

The algebraic quotient and characteristic map here, and the Kostant section in §3.4, are the common carriers for characteristic-zero oper applications. `FormalConnectionsOpers` F4.3 uses these carriers; its comparison with the oper-negative principal slice and chosen canonical complement, and its Drinfeld–Sokolov gauge statements over all test algebras, belong to that application. For connected reductive `G` over a characteristic-zero field, the comparison between algebraic-group invariants and infinitesimal Lie invariants is an adapter of this section: use the native Lie algebra, dual and symmetric-algebra carriers, identify the actual Cartan restriction, and retain the central affine factor. On each finite homogeneous polynomial degree, a vector killed by `Lie(G)` has stabilizer with full Lie algebra; characteristic zero makes that stabilizer smooth, and connectedness forces it to equal G. This identifies the two invariant subalgebras and their restriction maps. The characteristic bound and the general reductive section below remain part of this roadmap.

Let `k` be a field and `G` a connected reductive group over `k`, split over `k̄` with maximal torus `T`, Lie algebras `𝔤 ⊇ 𝔱` and Weyl group `W`, and assume `char(k)` does not divide `|W|`. `(a)` (Chevalley restriction) Restriction of functions gives an isomorphism `k[𝔤]^G ≅ k[𝔱]^W`, and `k[𝔱]^W` is a polynomial algebra on homogeneous generators `a₁, …, a_r` of degrees `e₁, …, e_r` (the exponents plus one); put `𝔠 = Spec k[𝔱]^W ≅ 𝔸^r`, with the `G_m`-action of weights `e_i`, and `χ : 𝔤 → 𝔠` the characteristic map. `(b) χ` is smooth exactly on the open subset `𝔤^reg` of regular elements, and `𝔤^reg → 𝔠` is surjective; the discriminant divisor `𝔇 ⊂ 𝔠` is the image of the root hyperplanes and `𝔠^rs = 𝔠 \ 𝔇` parametrizes regular semisimple stable classes: for any field extension `K/k, χ` induces a bijection between stable conjugacy classes of regular semisimple elements of `𝔤(K)` and `𝔠^rs(K)` (for `G` quasi-split). `(c)` (Outer twists) If `G` is the quasi-split form over a scheme `X` attached to an `Out(G₀)`-torsor `ρ_G` (for a split pinned `G₀`), the quotient `𝔠` and `χ` descend to `X` as `𝔠 = ρ_G ∧^{Out} 𝔠₀`, and the `G_m`-action twisted by a line bundle `D` gives the vector bundle (or cone) `𝔠_D = 𝔠 ∧^{G_m} D^×` over X. For `G = GL_n, 𝔠 = 𝔸^n` with `χ` the non-leading coefficients of the (monic, degree `n`) characteristic polynomial, and `𝔇` is the zero locus of the discriminant of the characteristic polynomial.

*Hypotheses.* `k` a field with `char(k) ∤ |W|` (Ngô's standing hypothesis); `G` connected reductive over `k`, quasi-split over `X` for `(c)`.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.1, Théorème 1.1.1 (p. 9) and Lemme 1.1.2 (p. 10); §1.3, Définition 1.3.1 and §§1.3.2–1.3.3 (p. 11).)

The interface consists of the following operations and identities.

- `𝔠 = Spec k[𝔤]^G` with `χ : 𝔤 → 𝔠`.
- `𝔠 ≅ 𝔱/W` (Chevalley restriction).
- `𝔠` is an affine space with a `G_m`-action of weights `e_i`.
- `χ` is smooth on `𝔤^reg` and surjective there.
- The discriminant divisor and `𝔠^rs`.
- Stable classes of regular semisimple elements of `𝔤(K) ↔ 𝔠^rs(K)` for quasi-split G.
- The twisted quotient `𝔠_D` over `X` for an Out-torsor and a line bundle D.

`(a)` Chevalley's restriction theorem and the polynomiality of invariants of the reflection group `W` when `char(k) ∤ |W|` (Ngô Théorème 1.1.1, p. 9). `(b)` Kostant's smoothness criterion for `χ` on `𝔤^reg` (Ngô Lemme 1.1.2, p. 10); the stable-class parametrization uses §1.3 and the Kostant section (§3.4) for existence of rational points in each fibre. `(c)` Descent along the Out-torsor (Ngô Définition 1.3.1 and §§1.3.2–1.3.3, p. 11).

**Checks.**

- For the one-by-one matrix `[c]`, the characteristic map has constant coefficient `−c`. For a two-by-two matrix it gives `(det X,−tr X)`, in that order.
- For Fin 0 the characteristic polynomial is 1 and the coefficient vector is empty.
- For `G = GL_n, 𝔠 = 𝔸^n` and `χ(X)` is the coefficient vector of the characteristic polynomial of `X` (Mathlib's Matrix.charpoly).
- For `G = SL₂, 𝔠 = 𝔸¹` with `χ(X) = −det X = (tr X²)/2` of weight 2, and `𝔇 = {0}`.
- For `G = T` a torus, `W = 1, 𝔠 = 𝔱` and `χ` is the identity.
- `χ` is not smooth away from `𝔤^reg`: for `G = SL₂, χ = −det` has vanishing differential at `X = 0`, which is not regular.

*Needs:* `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.ReductiveGroups` Layer 2 (Lie algebra and the adjoint representation); `TauCetiRoadmap.ReductiveGroups` Layer 9 (pinned Chevalley–Demazure group schemes over `ℤ`); §1.3; Mathlib `Matrix.charpoly`; Mathlib `Matrix.charpoly_monic`; Mathlib `Polynomial.discr`.

### 3.4 The Kostant section

In constant-first characteristic coordinates, the `GL_n` companion matrix has subdiagonal ones and last column `−a_i`. Its characteristic polynomial has the prescribed coefficients, so it is a section of the characteristic map; characteristic coefficients are conjugation invariant. These matrix formulas do not construct the general reductive Kostant section.

In the setting of §3.3, let `G` be split and pinned and `e=Σ_{α simple}X_α`. Choose a graded complement `V` to `[e,𝔫⁻]` in the opposite Borel Lie algebra `𝔟⁻`. Then `χ:e+V→𝔠` is an isomorphism with regular image, giving `ε:𝔠→𝔤^reg`. Under `char(k)∤|W|`, the root-differential and lattice hypotheses (C1)–(C2) of Riche hold; this complement construction works without identifying `V` with the centralizer of an opposite member of an `sl₂`-triple. Its equivariance uses `t·X=t²Ad((2ρ^∨)(t)⁻¹)X` and weights `2e_i` on `𝔠`. Over a curve, choose `D′` with `D′²≅D`. Extend the frame torsor of `D′` along `t↦(2ρ^∨)(t)⁻¹` to obtain the Kostant `G`-torsor `E_{D′}`. The doubled-weight equivariance gives a regular Higgs field in `p*ad(E_{D′})⊗p*D` over `p:𝔠_D→X`, with characteristic value the tautological invariant. Equivalently it gives a section `ε_D:𝔠_D→[𝔤_D^reg/G]`, where `𝔤_D=𝔤⊗D` is the ordinary twist; the underlying torsor is `p*E_{D′}`. For a quasi-split form, choose the complement invariant under the finite diagram action and descend along the splitting torsor. Every regular element `X` of `𝔤(K)` is `G(K̄)`-conjugate to `ε(χ(X))`. For `K` a field, `G` quasi-split and `a ∈ 𝔠^rs(K)`, sending `γ = Ad(g)ε(a) ∈ χ⁻¹(a)(K)` to the class of `σ ↦ g⁻¹σ(g)` is a bijection from the `G(K)`-conjugacy classes in `χ⁻¹(a)(K)` onto `ker[H¹(K, J_a) → H¹(K, G)]`, and the isomorphism classes of pairs `(E, φ)` (`E` a `G`-torsor over `K, φ ∈ ad(E)` with `χ(φ) = a`) are in bijection with `H¹(K, J_a)` (Ngô §§1.5.1–1.5.2; §3.5). For `G = GL_n, ε(a)` is the companion matrix of the polynomial with coefficients `a`.

*Hypotheses.* Char`(k) ∤ |W|` (Ngô's standing assumption); `G` split with a pinning (descends to quasi-split `G` with the Out-torsor).

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.2, Lemme 1.2.1 (p. 10) and (1.2.2) (p. 11); §4.2.4 (p. 63); Lemme 2.2.5 (p. 34); §1.5, 1.5.1–1.5.2 (pp. 14–15).)

The interface consists of the following operations and identities.

- `ε : 𝔠 → 𝔤^reg`.
- `χ ∘ ε = id`.
- `ε(a)` is regular.
- `G_m`-equivariance for the twisted action.
- Every regular `X` is conjugate over the algebraic closure to `ε(χ(X))`.
- The section `ε_D:𝔠_D→[𝔤_D^reg/G]` attached to `D′²≅D`, represented by `p*E_{D′}` and its regular `D`-valued Higgs field. Its composite with the characteristic map is the identity.

For the characteristic bound stated here use [S. Riche — On the Kostant section and the universal centralizer in positive characteristic and over the integers](https://arxiv.org/abs/1411.3112v2), §2.2, pp. 3–4, §3.1, pp. 6–7, and Theorem 3.2.2, pp. 8–9: the graded complement gives the regular section. The centralizer-slice presentation in Ngô Lemme 1.2.1 requires a stronger characteristic bound and is not used at small good primes. Equivariance and globalization use the doubled cocharacter action above and Ngô §4.2.4, p. 63, and Lemme 2.2.5, p. 34. Stable-class parametrization follows from the neutral `J`-gerbe (Ngô §§1.5.1–1.5.2, pp. 14–15; §3.5).

**Checks.**

- For `n=1` and coefficient `a₀`, the companion section is `[−a₀]`. For `n=2` and coefficients `(a₀,a₁)`, it is `[[0,−a₀],[1,−a₁]]`.
- At `(a₀,a₁)=(0,0)` the companion is a nonzero nilpotent with characteristic polynomial `X²`; at `n=0` both its matrix and the coefficient vector are empty.
- For `G = GL_n, ε(a)` is the companion matrix of `t^n + a_1t^{n−1} + … + a_n`, whose characteristic polynomial is that polynomial (Mathlib: Matrix.charpoly of a companion matrix).
- `ε(a)` is regular for every `a`, including `a = 0` where `ε(0) = e` is regular nilpotent.
- For `G = T, ε = id`.
- When `G` has a nonempty root system, `ε(0) = e ≠ 0` is regular nilpotent and not semisimple. For a torus the root system and discriminant are empty, `e=0`, and `ε=id` instead.
- In `SL₄` over `𝔽₅` take `e` with upper-diagonal entries 1 and `f` with lower-diagonal entries (3,4,3). They belong to an `sl₂`-triple, but `det(xI−e−tf)=x⁴−10tx²+9t²`. Its derivative at `t=0` is zero modulo 5, so the tangent direction `f` in `𝔤^f` is killed by `dχ`. Thus `e+𝔤^f` is not the required slice, even though `5∤|S₄|`. A graded complement, or the GL companion section with trace coefficient zero, avoids this failure.
- For `X=ℙ¹`, `G=SL₂` in odd characteristic and `D=O(2)=O(1)²`, the Kostant torsor has associated rank-two bundle `O(−1)⊕O(1)`. Its Higgs field is `[[0,1],[a,0]]` for `a∈H⁰(O(4))`. A map `Tot O(4)→Tot(O(2)³)` over `X` has all three coordinates in `H⁰(O(2))`, independent of `a`, since `H⁰(O(2−4m))=0` for `m≥1`; it cannot section the characteristic map. The torsor supplies the required `O(4)` entry.

*Needs:* §3.3; `TauCetiRoadmap.ReductiveGroups` Layer 9 (pinned Chevalley–Demazure group schemes over `ℤ`); `TauCetiRoadmap.ReductiveGroups` Layer 2 (Lie algebra and the adjoint representation); Mathlib `Matrix.charpoly`.

### 3.5 The regular centralizer group scheme

In the setting of §3.3 `(char(k) ∤ |W|)`, let `I → 𝔤` be the group scheme of centralizers. `(a)` There is a unique smooth commutative group scheme `J → 𝔠` with a `G`-equivariant isomorphism `χ^*J|_{𝔤^reg} ≅ I|_{𝔤^reg}`, and it extends to a homomorphism `χ^*J → I` over all of `𝔤` (Ngô Lemme 2.1.1). `(b)` The morphism `[𝔤^reg/G] → 𝔠` is a gerbe banded by `J`, neutralized by the Kostant section (Proposition 2.2.1). `(c)` If the centre of `G` is connected the fibres of `J` are connected. `(d)` (Galois description, after Donagi–Gaitsgory) With `π : 𝔱 → 𝔠` the finite flat `W`-cover, there is a canonical homomorphism `J → J¹ := (π_*(T × 𝔱))^W`, an isomorphism over `𝔠^rs` and identifying `J` with an open subgroup scheme `J′` of `J¹` whose fibres have the same identity component (Propositions 2.4.2, 2.4.7, Corollaire 2.4.8). `(e)` For an endoscopic datum with map `ν : 𝔠_H → 𝔠` there is a homomorphism `μ : ν^*J → J_H` (Proposition 2.5.1). `(f)` For `a ∈ 𝔠(X)` the pullback `J_a` is a smooth commutative group scheme over `X`; over the open where `a` is regular semisimple, `J_a = π_a ∧^W T` for the cameral `W`-torsor `π_a` (Lemme 1.4.3, (1.4.2)), and over all of `X, J_a` is an open subgroup of `(π_{a,*}(T × X̃_a))^W` with the same identity component, by `(d)`.

*Hypotheses.* Char`(k) ∤ |W|`.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §2.1, Lemme 2.1.1 (p. 32); §2.2, Proposition 2.2.1 (p. 33); §2.3, Proposition 2.3.1 and Corollaire 2.3.2 (pp. 34–35); §2.4, Lemme 2.4.1, Propositions 2.4.2 and 2.4.7, Corollaire 2.4.8 (pp. 35–40); §2.5, Proposition 2.5.1 (p. 40); §1.4, Lemme 1.4.3 and (1.4.2) (p. 14).)

The interface consists of the following operations and identities.

- `J → 𝔠`.
- `χ^*J|_{𝔤^reg} ≅ I|_{𝔤^reg}, G`-equivariantly.
- The homomorphism `χ^*J → I` over `𝔤`.
- `J` is smooth and commutative over `𝔠`.
- `J → (π_*(T × 𝔱))^W`, iso over `𝔠^rs`.
- `μ : ν^*J → J_H` for an endoscopic datum.

`(a)` Descend `I|_{𝔤^reg}`, which is commutative and smooth over `𝔤^reg`, along the smooth surjection `χ|_{𝔤^reg}` using the transitivity of the `G`-action on fibres (Ngô Lemme 2.1.1, p. 32). `(b)` Ngô Proposition 2.2.1 (p. 33); `(c)` Proposition 2.3.1 (p. 34) and Corollaire 2.3.2 (p. 35). `(d)` Ngô §2.4: Lemme 2.4.1 (smoothness of `J¹`, using `|W|` invertible), Proposition 2.4.2 (p. 36), Proposition 2.4.7 (p. 39), Corollaire 2.4.8 (p. 40). `(e)` Ngô Proposition 2.5.1 (p. 40); `(f)` Lemme 1.4.3 and (1.4.2), p. 14.

**Checks.**

- For `G = GL_n` and `a ∈ 𝔠(K), J_a = (K[t]/(P_a(t)))^×`, the unit group of the algebra of the characteristic polynomial.
- For `G = T, J = T × 𝔱` is constant.
- Over `𝔠^rs, J` is a torus: the fibre at `a` is the centralizer of any regular semisimple `X` with `χ(X) = a`.
- For `G` with a nonempty root system, `χ^*J` differs from `I` at `X=0: I₀=G`, whereas `J₀` is commutative of dimension `r`. For a torus they agree everywhere, including at zero.

*Needs:* §3.3; §3.4; `TauCetiRoadmap.ReductiveGroups` Layer 4 (Jordan decomposition, diagonalizable groups, tori); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §1.3 (Coherent quotients, Plücker and partial flags).

### 3.6 The Hitchin moduli stack, base and fibration

Let `k = 𝔽_q, X` a smooth projective geometrically connected curve over `k` of genus `g, G` a quasi-split reductive group scheme over `X` attached to an Out-torsor `ρ_G` (§3.3 `(c)`), with `char(k) ∤ |W|`, and `D` a line bundle on `X` (in Ngô's applications `D = D′^{⊗2}` with `deg D > 2g`; the carrier is defined for every `D`, including the canonical bundle `ω_X` and `D = O_X`, which Yu's counting needs). The Hitchin moduli stack `M = M_{G,D}` assigns to a `k`-scheme `S` the groupoid of pairs `(E, φ)` with `E` a `G`-torsor on `X × S` (an `S`-point of `Bun_G`, §3.1) and `φ ∈ H⁰(X × S, ad(E) ⊗ D)`. The Hitchin base `A = A_{G,D} = H⁰(X, 𝔠_D)` is a finite-dimensional affine space over `k`, and `f : M →` A sends `(E, φ)` to `χ(φ)`. Properties: `(a) M` is an algebraic stack locally of finite type over `k`: over `Bun_G` it is the stack of sections of the coherent sheaf `ad(E) ⊗ D`, and the restriction of `f` to the anisotropic locus is of finite type (§3.12); `(b)` if `deg D > 2g − 2, deg D≥0` and `G` is split, `A = ⊕_i H⁰(X, D^{⊗e_i})` has dimension `Σ_i (e_i deg D + 1 − g) = (#Φ^+ + r) deg D + r(1 − g)` by Riemann–Roch (Ngô Lemme 4.4.1, which also covers the quasi-split case), and the open `A^♥` of a whose image meets `𝔠^rs` generically is non-empty when `deg D > 2g`; `(c) M` is smooth at every point `(E, φ)` with `χ(φ) ∈ A^♥` when `deg D > 2g − 2`, and at every point with `χ(φ) ∈ A^ani` when `deg D = 2g − 2` (Ngô Théorème 4.12.1: the obstruction group `H¹(X, ad(E, φ))` vanishes there); `(d)` the Kostant–Hitchin section `A → M` (after choosing `D′` with `D′^{⊗2} = D`) sends `a` to `(E_{D′},φ_a)` from §3.4 and lands in the regular locus `M^reg`.

*Hypotheses.* `k = 𝔽_q, X` smooth projective geometrically connected of genus `g`; `G` quasi-split over `X` with `char(k) ∤ |W|`; `D` a line bundle; the listed properties need the stated degree bounds.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §4.1 (p. 62); Définition 4.2.1 (p. 62); §4.2.3–4.2.4 (p. 63); Lemme 4.4.1 (p. 64); §4.5 (p. 67); Proposition 4.6.1 (p. 69); Théorème 4.12.1 (p. 84); [H. Yu — Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/abs/1807.04659v5), §3.2.3 (p. 16).)

The interface consists of the following operations and identities.

- `M_{G,D}` as a stack over `k`-schemes.
- `A_{G,D} = H⁰(X, 𝔠_D)`.
- `f : M → A`.
- The forgetful map `M → Bun_G`.
- `M` is algebraic and locally of finite type.
- the stated dim A formula for split `G, deg D≥0` and `deg D>2g−2`, by Riemann–Roch for every invariant weight `e_i`. A more general version must assume `e_i deg D>2g−2` separately for every `i`.
- Smoothness at points over `A^♥` when `deg D > 2g − 2`, and over `A^ani` when `deg D = 2g − 2`.
- The section `a↦(E_{D′},φ_a)` of `f`, with target `M^reg` and `D′²≅D` as input.
- Compatibility with finite extensions of `k`.

Algebraicity: over each finite-type chart of `Bun_G` (§3.1), represent the Higgs-section functor by the finite-complex cone constructed below and descend it through changes of framing. Dimension and non-emptiness: Riemann–Roch on `X` for the line bundles of weights `e_i` (AlgebraicCurves Layer 4; Ngô Lemme 4.4.1, p. 64; §4.5, p. 67; Proposition 4.6.1, p. 69). Smoothness: deformation theory of Higgs pairs and the vanishing of the obstruction `H¹` under the degree hypothesis, at points over `A^♥` (Ngô Théorème 4.12.1, p. 84). The Kostant–Hitchin section: evaluate §3.4’s quotient-stack section on global invariants, retaining the torsor `E_{D′}` and its Higgs field (Ngô §4.2.4, p. 63).

The stack of Higgs sections is constructed here from AlgebraicModuliForArithmeticGeometry's Quot charts and Artin criterion. Over a finite-type chart `U→Bun_G`, let `E` be its universal bundle and `V=ad(E)⊗D` on `X×U`. Locally on `U`, represent `Rpr_*V` in degrees 0 and 1 by finite locally free modules `K⁰→K¹`, compatibly with base change. The affine scheme of sections is the kernel of the corresponding map of vector bundles, equivalently `Spec Sym(coker((K¹)∨→(K⁰)∨))`. Descent along the chart groupoid gives `M`, algebraic and locally of finite type, even where `h⁰` jumps. The API the cone chart for Higgs sections, base change and chart descent belongs to this construction (Ngô §4.2, pp. 62–63). Check `V=O_X` gives the ordinary additive space of global functions; a jump in `h⁰` need not be a vector bundle over `U`; the zero differential in `K` gives the full `K⁰` section space, while an isomorphism `K⁰→K¹` gives only its zero section.

**Checks.**

- For `G = GL₁, M = Pic_X × H⁰(X, D), A = H⁰(X, D)` and `f` is the projection.
- For `G = GL₂` and `deg D = d≥0` with `d > 2g − 2: A = H⁰(X, D) ⊕ H⁰(X, D²)` has dimension `(d + 1 − g) + (2d + 1 − g) = 3d + 2 − 2g`.
- For `X=ℙ¹` and `G=GL₂, D=O(−1)` satisfies `deg D>2g−2` but `A=0`; the unrestricted expression `3d+2` would be `−1`. This forces the nonnegative-degree or weightwise-vanishing qualification.
- For `D = O_X, A = ⊕_i H⁰(X, O_X) = 𝔠(k)` and the Hitchin map records constant characteristic values (the case of Yu's Appendix `B`).
- For `G=GL_n` with `n≥1, M` is not of finite type: its zero fibre contains `Bun_GL_n` via `φ=0`, with unbounded determinant degrees.

*Needs:* §3.3; §3.4; §3.1; `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §1.3 (Coherent quotients, Plücker and partial flags); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §7.1 (Formal points, gluing and module obstructions); `TauCetiRoadmap.AlgebraicCurves` Layer 4 (repartitions, Weil differentials, and Riemann–Roch); `TauCetiRoadmap.AlgebraicCurves` Layer 12 (the dictionary — function fields ↔ curves, and the comparison contracts).

### 3.7 Boundedness of Higgs sheaves through a good pair of line bundles

Let `X` be a smooth projective geometrically connected curve over a field `k, Ω_X` its canonical bundle, and `α = (r, d)` a class (`rank r ≥ 1`, degree `d`). A Higgs sheaf of class `α` is a coherent sheaf `V` of `rank r` and degree `d` with `θ ∈ Hom(V, V ⊗ Ω_X)`; a Higgs subsheaf is a subsheaf `W` with `θ(W) ⊆ W ⊗ Ω_X`; `(V, θ)` is semistable if `μ(W) ≤ μ(V)` for every nonzero proper Higgs subsheaf (`μ=`degree/rank at positive rank and `μ=+∞` for a nonzero torsion sheaf), and a Higgs subsheaf with `μ(W) > μ(V)` is destabilizing. A coherent sheaf `V` is strongly generated by a line bundle `L` if `Ext¹(L, V) = 0` and the evaluation `L ⊗ Hom(L, V) → V` is surjective. Then there is a pair of line bundles `(L₁, L₂) ∈ Pic^{−n}(X) × Pic^{−m}(X)` (`n, m` depending on `α` and the genus) such that: `(a)` every semistable Higgs bundle of class `α` is strongly generated by `L₁` and by `L₂`; `(b)` every indecomposable vector bundle of class `α` is strongly generated by `L₁` and by `L₂`; `(c)` for every coherent sheaf `V` of class `α` and every epimorphism `φ : L₁ ⊗ V′ → V` (`V′` a vector space), `ker(φ)` is strongly generated by `L₂`; `(d)` every unstable Higgs sheaf of class `α` has a destabilizing Higgs subsheaf strongly generated by `L₁` and `L₂`. Consequently the underlying bundles of both kinds lie in one finite-type open chart of strongly generated sheaves. The geometrically indecomposable locus in that chart is constructible and admits a finite stratification by locally closed algebraic pieces. The stack of semistable Higgs bundles is of finite type: its presentation uses Higgs fields over the bounded chart, with semistability an open condition on that parameter space.

*Hypotheses.* `X` smooth projective geometrically connected over a field `k`; Higgs fields twisted by the canonical bundle `Ω_X`; class `α` of positive rank.

([O. Schiffmann — Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://arxiv.org/abs/1406.3839v2), arXiv v2 (4 October 2014, no printed page numbers): §6.2 and the definition of strong generation in §6.3 (PDF p. 22); Lemma 6.1 (PDF p. 23); [published version](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf), §6.1 p. 336 and §6.4 pp. 339–340.)

Bound the slopes of subsheaves of semistable Higgs bundles and of indecomposable bundles of class `α` (Harder–Narasimhan filtrations and the bound on Hom from destabilizing pieces); choose `L₁, L₂` of sufficiently negative degree so that `Ext¹(L_i, V) = H¹(X, L_i⁻¹ ⊗ V) = 0` by Serre duality and `V ⊗ L_i⁻¹` is globally generated (Schiffmann, proof of Lemma 6.1). For the bounded chart take the open `Q` in Quot where the induced map `k^N→Hom(L₁,V)` is an isomorphism and `Ext¹(L₁,V)=0`, with `N=χ(L₁⁻¹⊗V)`; `[Q/GL_N]` parametrizes strongly generated sheaves of class `α`. Intersect with the locally free locus for bundles. Stratify the relative endomorphism algebra by base change and rank; nontrivial idempotents define a finite-type incidence scheme, so their image is constructible. Its complement is the geometric indecomposable locus. Noetherian induction on its closure gives a finite invariant locally closed stratification; counting uses the corresponding quotient strata, retaining descent of idempotents when distinguishing indecomposability over `k` from geometric indecomposability. For Higgs objects take the two-framing smooth Quot chart `Q₁₂` of Schiffmann §6.4 and the cotangent moment map `μ:T*Q₁₂→(𝔤𝔩(V₁)⊕𝔤𝔩(V₂))*`. The quotient `[μ⁻¹(0)/(GL(V₁)×GL(V₂))]` is the Higgs stack over this bounded sheaf chart by Serre duality; its semistable open gives the required finite-type presentation. This includes Higgs parameters rather than an open of the underlying Quot scheme alone.

**Checks.**

- For `r = 1`, every Higgs bundle of class `(1, d)` is semistable, and a line bundle `M` of degree `d` is strongly generated by every line bundle `L` with `deg L ≤ d − 2g`: then `deg(L⁻¹M) ≥ 2g`, so `Ext¹(L, M) = H¹(X, L⁻¹M) = 0` and `L⁻¹M` is globally generated.
- On an elliptic curve over an algebraically closed field, let `S` be an affine neighbourhood of `0∈Pic⁰(X)` and `P` the normalized Poincaré line bundle. A relative extension `0→P→V→O→0` can have nonsplit fibre at 0: top-degree base change and affineness lift a nonzero class of `H¹(O_X)` to `H¹(X×S,P)`. For every `t≠0`, `H¹(P_t)=0`, so `V_t=P_t⊕O`; at 0 the nonsplit extension of `O` by `O` is indecomposable. After choosing sufficiently negative framings this family lies in the bounded Quot chart, with indecomposable inverse image `{0}`, which is not open.
- On `ℙ¹`, with `L=O` and `V=O(−1), Ext¹(L,V)=H¹(O(−1))=0` but `Hom(L,V)=0`, so evaluation is not surjective and `V` is not strongly generated. Vanishing of `Ext¹` alone is insufficient.
- On `X = ℙ¹ (Ω = O(−2))` every indecomposable vector bundle is a line bundle, so `(b)` is vacuous for `r = 2`; for `V = O(a) ⊕ O(−a)` with `a ≥ 1` there is no nonzero component `O(a) → O(−a) ⊗ Ω = O(−a − 2)`, so `O(a)` is a destabilizing Higgs subsheaf, and the only semistable Higgs bundle of class (2, 0) is `(O ⊕ O, 0)`.

*Needs:* §3.6; `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §1.3 (Coherent quotients, Plücker and partial flags); `TauCetiRoadmap.AlgebraicCurves` Layer 4 (repartitions, Weil differentials, and Riemann–Roch).

### 3.8 Cameral covers and spectral curves

In the setting of §3.6, for `a ∈ A(k̄)` viewed as a map `a : X̄ → 𝔠_D`, the cameral cover is the finite flat `W`-equivariant cover `π_a : X̃_a = X̄ ×_{𝔠_D} 𝔱_D → X̄`. Let `A^♥ ⊆` A be the open subset of a with `a(X̄) ⊄ 𝔇_D` (generically regular semisimple). For `a ∈ A^♥, X̃_a` is reduced and is a `W`-torsor over the open `U_a = a⁻¹(𝔠_D^rs)`; Ngô Proposition 4.5.4 gives its connectedness under the hypotheses stated there. The regular centralizer `J_a = a^*J` is described by the cameral cover: `J_a ⊆ (π_{a,*}(T × X̃_a))^W` with equality of identity components (§3.5 `(d)`). For `G = GL_n` the cameral cover parametrizes ordered roots; over `U_a` it is the `S_n`-torsor of orderings. Its generic fibre is a connected Galois closure only when the spectral polynomial has full `S_n` monodromy; in general it has several components. The spectral curve is `Y_a ⊂ V(D)` (the total space of `D`), `Y_a = {t : t^n + a₁ t^{n−1} + … + a_n = 0}`, a finite cover of `X̄` of degree `n`; `J_a = R_{Y_a/X̄} G_m` and `M_a` is the stack of torsion-free rank-one sheaves on `Y_a` (Beauville–Narasimhan–Ramanan) when `Y_a` is integral.

*Hypotheses.* The setting of §3.6; `a ∈ A^♥` for the torsor and reducedness statements.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.4, Lemme 1.4.3 and (1.4.2) (p. 14); §4.5, Lemme 4.5.1 and Proposition 4.5.4 (pp. 67–68).)

The interface consists of the following operations and identities.

- `X̃_a → X̄`.
- The open `A^♥`.
- `W`-torsor over `U_a` for `a ∈ A^♥`.
- Reducedness for `a ∈ A^♥`.
- The spectral curve `Y_a` for `GL_n`.
- `J_a` through the cameral cover.

Base change of the finite flat `W`-cover `𝔱 → 𝔠` (Ngô §1.4 and §4.5). Reducedness and the generic `W`-torsor structure: Ngô Lemme 4.5.1 (p. 67); connectedness: Proposition 4.5.4 (p. 68). The spectral description for `GL_n: J_a` is the Weil restriction of `G_m` from the spectral curve, and `M_a` is identified with rank-one torsion-free sheaves via pushforward (Ngô §4 recalls this as the motivating example).

**Checks.**

- For `G = GL₁, W = 1` and `X̃_a = X̄`.
- For `G = GL₂` and `a = (0, a₂)` with `deg D>0` and `a₂ ∈ H⁰(X, D^{⊗2})` having only simple zeros, `Y_a` is the curve `t² + a₂ = 0` in the total space of `D`, a double cover of `X` branched at the 2 `deg D` zeros of `a₂`, smooth and geometrically connected of genus `2g − 1 + deg D` by Riemann–Hurwitz. For `X=ℙ¹, D=O` and `a₂=1` over `k̄`, the smooth cover is two disjoint copies of `ℙ¹`, so the connected-genus formula does not apply.
- Over `U_a = a⁻¹(𝔠^rs_D), X̃_a → U_a` is a `W`-torsor.
- For a nonempty root system and `a=0`, the cameral fibre is the nonreduced coinvariant fibre of `length |W|` along the zero section, and `a∉A^♥`. For a torus, `W=1` and `X̃₀=X̄` is reduced and `a=0` lies in `A^♥`. For a split spectral polynomial with `n` distinct global roots, the generic ordered-root cover has `n`! components, rather than being one connected Galois closure.

*Needs:* §3.6; §3.5; §3.3.

### 3.9 Affine Springer fibres and their local symmetry groups

Let `k` be a finite field (or `k̄`), `F_v = k((ε_v))` with ring `𝒪_v, G` a reductive group over `𝒪_v` (quasi-split, split over an unramified extension; `char(k) ∤ |W|`), `Gr_v = G(F_v)/G(𝒪_v)` the affine Grassmannian, an ind-scheme over `k` (the local loop quotient of §3.2 at `v`), and `a ∈ 𝔠(𝒪_v) ∩ 𝔠^rs(F_v)` with `γ_a = ε(a)` the Kostant section value. The affine Springer fibre `M_v(a)` is the functor of pairs `(E, φ)` on `Spec 𝒪_v × S` with `χ(φ) = a`, together with an isomorphism with `(E₀, γ_a)` over `F_v`; it is represented by the closed sub-ind-scheme `{g ∈ Gr_v : Ad(g)⁻¹γ_a ∈ 𝔤(𝒪_v)}` (Ngô Proposition 3.2.1). `(a)` (Kazhdan–Lusztig) `M_v(a)^red` is locally of finite type, and the local symmetry group `P_v(J_a)` (the group ind-scheme of `J_a`-torsors on `Spec 𝒪_v` trivialized over `F_v`) acts on it; a free abelian group `Λ` of finite rank in `P_v(J_a)` acts freely with projective quotient `M_v(a)^red/Λ` (Proposition 3.4.1). `(b)` (Dimension bounds; Bezrukavnikov) The regular open `M_v^reg(a)` is a `P_v(J_a)`-torsor of dimension `dim P_v(J_a) = δ_v(a) = (d_v(a) − c_v(a))/2` with `d_v(a) = val(Δ(a))` the valuation of the discriminant and `c_v(a)=dim 𝔱−dim 𝔱^{I_v}` the inertial rank defect after extending the residue field to `k̄` (Propositions 3.7.1, 3.7.5). The complement of the regular open has dimension strictly smaller than `δ_v(a)`. Density and component indexing are proved in §3.11a, after the global product formula. These are algebraic loop objects over `k((ε))`, not Witt-vector or diamond Grassmannians.

*Hypotheses.* `F_v = k((ε_v))` of equal characteristic; `char(k) ∤ |W|`; a regular semisimple over `F_v` and integral.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §3.2, Proposition 3.2.1 (p. 43); §3.3 (p. 45); Proposition 3.4.1 (p. 47); §3.7, Propositions 3.7.1, 3.7.5 and Corollaire 3.7.2 (pp. 50–52); §3.8 (pp. 52–54); Corollaires 3.9.6 and 3.10.2 (pp. 57–58).)

The interface consists of the following operations and identities.

- `M_v(a)` as a closed sub-ind-scheme of `Gr_v`.
- `P_v(J_a)` and its action.
- `M_v(a)^red/Λ` is projective.
- `M_v^reg(a)` is a `P_v(J_a)`-torsor of dimension `δ_v(a)`; density is the separate assertion of §3.11a.

Representability as a closed sub-ind-scheme of `Gr_v` and local finiteness (Kazhdan–Lusztig), recalled in Ngô Proposition 3.2.1 (p. 43); the affine Grassmannian is the local construction in §3.2. Symmetries and the projective quotient: Ngô §3.3 (p. 45) and Proposition 3.4.1 (p. 47). Dimension: Ngô Proposition 3.7.1 (p. 50), Corollaire 3.7.2 (p. 51), Proposition 3.7.5 (p. 52), via the Néron model of `J_a` (§3.8, Lemme 3.8.1, Corollaire 3.8.3). The strict bound on the nonregular complement is Ngô Proposition 3.7.1 and the observation preceding Corollaire 3.10.2. The global proof of density and the component theorem follows in §3.11a.

**Checks.**

- If `a ∈ 𝔠^rs(𝒪_v)` (unramified and regular semisimple modulo `ε_v`), then `d_v(a) = 0, δ_v(a) = 0` and the geometric reduced fibre of `M_v(a)` is the discrete lattice `X_*(T)`; for nonsplit unramified `T` its descent includes the Frobenius action on that lattice.
- For `G = GL₂` and `γ` with characteristic polynomial `t² − ε^n: d_v = val(4ε^n) = n` (`p` odd); if `n` is even the centralizer is split, `c_v = 0` and `δ_v = n/2`; if `n` is odd it is the ramified torus `R_{E/F}G_m, c_v = 1` and `δ_v = (n − 1)/2`.
- For `G = T` an unramified torus, the geometric reduced fibres of `M_v(a), Gr_T` and `P_v` are `X_*(T)`. An unramified anisotropic torus still has inertial defect zero; replacing it by the `F_v`-split-rank defect would give a negative dimension.
- For `γ = diag(ε, −ε)` in `𝔤𝔩₂` (split, `d_v = 2, c_v = 0, δ_v = 1`), `M_v(a)` has infinitely many irreducible components, permuted by `Λ = X_*(T) = ℤ²`, so it is not of finite type; only `M_v(a)^red/Λ` is (and it is projective).

*Needs:* §3.5; §3.4; §3.3; §3.2; Mathlib `LaurentSeries`; Mathlib `PowerSeries`.

### 3.10 The Picard stack acting on Hitchin fibres

In the setting of §3.6, for `a ∈ A(S)` let `P_a` be the Picard groupoid of `J_a`-torsors on `X × S`; as `a` varies these form a Picard stack `P → A`. Via the homomorphism `χ^*J → I` (§3.5 `(a)`), `J_a` acts on every `(E, φ) ∈ M_a` by automorphisms, so `P` acts on `M` over `A` by twisting `(E, φ)` by a `J_a`-torsor. `(a)` Given a line bundle `D′` and an isomorphism `D′⊗²≅D`, the regular open `M^reg` (`φ` regular everywhere) is a `P`-torsor over `A`, trivialized by the resulting Kostant–Hitchin section (Ngô Proposition 4.3.3). `(b) P` is smooth over `A^♥` (Proposition 4.4.2). `(c)` For `a ∈ A^♥(k̄)`, the group of connected components `π₀(P_a)` is a finitely generated abelian group described through the cameral cover: with `P′_a=Bun_{J_a⁰}` for the open subgroup of fibrewise identity components, `P′_a → P_a` is surjective with finite kernel, and the Cartier duals of `π₀(P′_a)` and `π₀(P_a)` are the diagonalizable groups `Ĉ^{W̃_a}` and `Ĉ(I_a, W_a)` attached to the monodromy of the cameral cover (Ngô Lemme 4.10.1, Proposition 4.10.2). The component indexing for `M_a` is the consequence of density in §3.11a.

*Hypotheses.* The setting of §3.6; `(a)` carries a chosen `D′` and `D′⊗²≅D`; `(b)`–`(c)` for `a ∈ A^♥`. The Picard carrier and its action require no square root.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §4.3.1 and Proposition 4.3.3 (pp. 63–64); Proposition 4.4.2 (p. 65); §4.10, Lemme 4.10.1 and Proposition 4.10.2 (pp. 77–78); Corollaire 4.14.3 (p. 88).)

The interface consists of the following operations and identities.

- `P → A`, the Picard stack of `J_a`-torsors.
- The action `P ×_A M → M`.
- Given `D′` and `D′⊗²≅D`, the Kostant–Hitchin section identifies `P` with `M^reg` over A.
- `P` is smooth over `A^♥`.
- `π₀(P_a)` with its description through the cameral cover.

Define `P_a` and the action using `χ^*J → I` (Ngô §4.3.1, p. 63); the torsor statement `(a)` uses the chosen square root to obtain a regular point over every invariant, and `J ≅ I` on the regular locus then identifies twisting with all regular objects (Proposition 4.3.3, p. 64; [published version](https://www.math.uchicago.edu/~ngo/LF.pdf), §§4.2.4, 4.3.3–4.3.4, pp. 58–59). Smoothness `(b)`: the obstruction to lifting a `J_a`-torsor lies in `H²(X, Lie J_a)`, which vanishes because `X` is a curve (Proposition 4.4.2, p. 65). `(c)` Ngô §4.10, Lemme 4.10.1 and Proposition 4.10.2 (p. 78): compute `π₀` through the Néron model and the cameral monodromy. With the same chosen square root, the density argument of §3.11a gives global component indexing from the regular torsor, before deriving local density by globalization.

Construct `P_a=Bun_{J_a}` as an algebraic Picard stack of `J_a`-torsors on `X`, with contracted product as its group law. The smooth affine commutative `X`-group `J_a` is finitely presented; use étale local trivializations of torsors and the Quot/graph charts of AlgebraicModuliForArithmeticGeometry §§1.3, 2.1 and 2.2, then its §7.1 Artin criterion. Torsor deformation and automorphism spaces are `H¹(X,Lie J_a)` and `H⁰(X,Lie J_a)`; the obstruction `H²` vanishes on a curve, giving smoothness at a smooth `J_a`. This is the `J_a`-specific Picard-stack construction of Ngô §§4.3–4.4, pp. 63–65, rather than a gerbe theorem. Add the regular-centralizer torsor stack, contracted product and tangent complex. Check `J=G_m` recovers the Picard groupoid with scalar automorphisms; tensoring by the trivial torsor is the identity; inverse torsors cancel under contracted product. A Picard variety obtained by rigidification does not have that automorphism group.

**Checks.**

- For `X=ℙ¹/𝔽₅`, `G=SL₂`, `D=O(1)` and `a=0`, the everywhere-regular fibre is geometrically empty. A regular nilpotent Higgs field would give `L=ker φ` and `E/L≅L⊗D`, hence `2 deg L+1=0` from `det E≅O`, impossible even after extending constants. The Picard groupoid still contains its trivial torsor. For `D=O(2)=O(1)²`, the Kostant pair of §3.4 supplies a regular point instead.
- For `G = GL₁, P_a = Pic_X` for every a and `π₀(P_a) = ℤ` (the degree).
- For `G = GL_n` and a with integral spectral curve `Y_a, P_a = Pic_{Y_a}` (line bundles on `Y_a`) and `π₀(P_a) = ℤ`.
- For `G = SL₂` and `a = ν(a_H)` in the image of the endoscopic base of the norm-one torus `H` of a connected étale double cover `X′ → X̄`, for nonzero `a_H` the spectral curve has normalization `X′`; it is nodal if `a_H` has only simple zeros, whereas higher-order zeros give more singular curves; `a_H=0` is nonreduced and outside `A^♥`. For nonzero `a_H, π₀(P_a)` contains `ℤ/2`, on which the character `κ` attached to `X′` is nontrivial; for a with smooth (ramified) spectral curve `π₀(P_a)` is trivial (the Prym of a ramified double cover is connected).
- On `M \ M^reg` the action of `P_a` need not be free: at a point where `φ` is not regular, the stabilizer in `P_a` is a nontrivial affine group (as required by the weak-abelian-fibration axioms), so `M_a` is not a `P_a`-torsor.

*Needs:* §3.6; §3.5; §3.8; `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §1.3 (Coherent quotients, Plücker and partial flags), §2.1 (Hilbert families and graph parameters), §2.2 (Automorphisms and bounded quotients), and §7.1 (Formal points, gluing and module obstructions).

### 3.11 The product formula for Hitchin fibres

In the setting of §3.6 and §3.9, with a chosen `D′` and `D′⊗²≅D`, let `a ∈ A^♥(k̄)` and `U ⊆ X̄` the open subset where `a` is regular semisimple, with finite complement. Gluing local data along the Kostant section gives a morphism `ζ : (∏_{v ∈ X̄ \ U} M_v(a)) ∧^{∏_v P_v(J_a)} P_a → M_a` which induces an equivalence on geometric-point groupoids. For `a∈A^ani`, replacing the local factors `M_v(a)` and `P_v(J_a)` by their reductions gives a proper Deligne–Mumford quotient and a homeomorphism to `M_a` (Ngô Proposition 4.13.1); the proper-stack assertion uses the finite-stabilizer hypotheses of §3.12. For counting points over `k (a ∈ A^ani(k))`, choose a nonempty `U′⊆U` over which the auxiliary connected-fibre model `J′→J_a` of §3.16 is unchanged, including all its level places in `X−U′`, and put `P′=Bun_{J′}`. There is an equivalence of groupoids `[M_a/P′_a] ≅ ∏_{v ∈ X \ U′} [M_v(a)/P_v(J′_a)]` by the same gluing argument as Proposition 8.4.2. Local factors retain `vol(J′_a(𝒪_v),dt_v)`, including the index relative to the full model at a modified regular place. Consequently `dim M_a = dim P_a`, with both dimensions interpreted as stack dimensions. Define the defect by Ngô's affine kernel `R_a=ker(P_a→P_a^♭)`, where `P_a^♭=Bun_{J_a^♭}` uses the finite-type Néron model and an object of the kernel includes a trivialization of its induced `J_a^♭`-torsor. Then `R_a≅∏_v R_v(a)` and `δ_a:=dim R_a=Σ_v δ_v(a)`. Keep the abelian Picard stack `(P_a^♭)⁰` distinct from its rigidified abelian variety `A_a`: if `h_a` is the dimension of its automorphism group, the dimension formula is `dim P_a=δ_a+dim A_a−h_a`. Thus `δ_a=dim P_a−dim A_a` only when `h_a=0`, in particular in the finite-stabilizer anisotropic setting. On the broad generically regular locus the affine part of the rigidified neutral Picard group alone need not recover `δ_a`; rigidification can forget the difference between global automorphisms of `J_a` and `J_a^♭`.

*Hypotheses.* A chosen `D′` and `D′⊗²≅D` for the Kostant gluing; `a ∈ A^♥` for the geometric-point equivalence; `a ∈ A^ani` with finite reduced automorphism groups for the proper Deligne–Mumford homeomorphism; `a ∈ A^ani(k)` for the point-count form. Local factors in the proper quotient are reduced.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Proposition 4.13.1 (pp. 86–87); §8.4, Propositions 8.4.2 and 8.4.3 (pp. 175–176).)

For the geometric-point equivalence use the gluing construction preceding Ngô Proposition 4.13.1, citing his earlier 'Fibration de Hitchin et endoscopie' Théorème 4.6 for the equivalence on `k̄`-points; Proposition 8.4.2 (p. 175) for the point-count form. The defect formula uses the affine kernel with its trivialization, not the dimension of an unrigidified Picard stack (Ngô arXiv v3, Proposition 4.8.2, pp. 74–75, and §4.9, (4.9.1), p. 76). Rigidify the neutral abelian Picard stack by its automorphisms to obtain `A_a`; the dimension of that gerbe is `dim A_a−h_a`. This proves the corrected stack-dimension expression without changing the gluing groupoids.

The defect interface includes the following operations and identities.

- Contracted product of torsors and their chosen normalization trivializations gives the group law on `R_a`; the trivial torsor with its identity trivialization is the identity and dual torsors give inverses.
- The local maps identify `R_a` with the product of the local affine kernels; forgetting a normalization trivialization maps to `P_a` and need not be injective on isomorphism classes of objects.
- The neutral normalized Picard stack has rigidified abelian quotient `A_a` and stabilizer dimension `h_a`; the dimension identity retains this correction, and reduces to the usual affine-plus-abelian formula when that stabilizer is finite.

**Checks.**

- If `a` is regular semisimple everywhere `(U = X̄), M_a = P_a`-torsor and `δ_a = 0`.
- For `G = GL₂` and an integral spectral curve with a single node over `v`, the fixed-degree rigidified fibre is a compactified Jacobian and `δ_a=δ_v(a)=1`. The geometric-point gluing retains degrees and scalar automorphisms before rigidification; the anisotropic proper Deligne–Mumford statement does not apply to the full `GL₂` Picard stack.

- For `G=G_m`, `X=ℙ¹/𝔽₅` and `D=O(2)`, `P_a=ℤ×BG_m`, `R_a=1`, `A_a=0` and `h_a=1`: the stack dimension is `−1=0+0−1`, whereas `δ_a=0` equals the empty local sum. The infinite degree group and scalar automorphisms remain in the gluing groupoid.
- For an integral rational one-node spectral curve, the generalized Jacobian is `G_m`: `dim R_a=1`, `dim A_a=0`, `h_a=1` and `dim P_a=0=1+0−1`. Its rigidified neutral Picard group has dimension 1.
- For a split rank-two spectral curve over `ℙ¹` formed by two sections of `O(2)` meeting transversely at two points, the total local defect is 2 but the rigidified neutral Picard group is `G_m`: the dual graph has two vertices and two edges. Here `R_a=G_m²`, the normalization has two independent scalars, and `dim P_a=0=2+0−2`. Thus `2=δ_a` must not be replaced by the affine dimension 1 of that rigidified neutral Picard group.

*Needs:* §3.6; §3.9; §3.10; §3.4.

### 3.11a Global density, globalization and local components

In the setting of §3.6 with `deg D>2g−2` and a chosen `D′` and `D′⊗²≅D`, prove that `M_a^reg` is dense in `M_a` for `a∈A^♥`. Consequently the Kostant trivialization identifies the irreducible components of `M_a` with `π₀(P_a)`. For a prescribed integral, generically regular-semisimple local invariant over `k((ε))`, construct a finite-jet order `N` such that congruence modulo `ε^N` identifies the affine Springer fibres with their local symmetry actions and quotient groupoids, compatibly with every finite residue-field extension, the component characters and Frobenius. Globalize through this finite-jet interface, rather than prescribing an exact formal germ. Global density and gluing then imply density of `M_v^reg(a)` in `M_v(a)`, its equidimensionality of dimension `δ_v(a)`, and the component bijection with `π₀(P_v(J_a))`.

For an unramified endoscopic datum `(H,κ)` and integral `G`-regular local invariant `a_H`, assume that the local centres of `G` and `H` contain no split subtori. Construct over the original `k` a smooth projective geometrically connected curve with rational marked places `v,∞`, the required endoscopic twisting torsor with its prescribed local restriction and marking at `∞`, and a sufficiently positive square twist `D=D′²`. Require `deg D>rN+2g` and `δ_H(a_H)<δ_H^bad(D)`, where `δ_H^bad(D)` is the first integer at which the codimension estimate fails, or `∞` if none does. Construct a nonempty geometrically irreducible pointed jet slice over `k`. Its nonempty open consists of invariants congruent to `a_H` modulo `ε^N` at `v`, anisotropic for both groups, in the `H`-good open of §3.18, and transverse to `D_H+R_{G,H}` away from `v`. Prove that this open has points over `k_m` for every `m≥m₀`, for one `m₀`. Thus globalization supplies suitable points for all sufficiently large extension degrees. The associated local identifications are over `k_m` and commute with its Frobenius; no comparison of just geometric fibres suffices.

*Hypotheses.* `char(k)∤|W|`; global density and Hitchin Picard components of fibre carry the chosen `D′`, `D′⊗²≅D` and the smooth-total-space degree hypotheses. For local density choose the positive global twist in the globalization construction; the original local data carry no global degree assumption.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §4.14, Proposition 4.14.1 and Corollaires 4.14.2–4.14.3, p. 88; §3.10, Proposition 3.10.1 and Corollaire 3.10.2, p. 58; §8.6.2 (uniform finite jets), §§8.6.3–8.6.6 (pointed globalizations in all sufficiently large degrees), pp. 182–184; §7.6.4, p. 153.)

Use the strict local dimension bound on the nonregular complement from §3.9 and geometric-point gluing from §3.11. On bounded finite-type charts of the local quotients the gluing has zero-dimensional geometric fibres, so the fibre-dimension theorem transports that bound; this step needs no properness over all of `A^♥`. The resulting fibre-dimension bound, together with smoothness of `M` and `A` in §3.6, makes the equations of each Hitchin fibre a regular sequence; every component has the expected dimension. No component can therefore lie in the nonregular complement. The regular torsor and its Kostant point give global component indexing. For finite-jet invariance use the local comparison of Ngô §3.5 as in §8.6.2. For globalization, simultaneous jet evaluation at `v` and evaluation at `∞` are surjective for sufficiently positive `D` by Riemann–Roch. With the marking at `∞`, the pointed jet slice is an affine bundle over a nonempty open of the split Cartan at `∞`; it is geometrically irreducible over `k`. Transversality away from `v` cuts out a nonempty open, and the anisotropic complement has codimension exceeding the jet conditions. The remaining `δ_H` is the prescribed local value, so the chosen bound puts this open in the `H`-good locus. A dense trivialization of this affine bundle identifies a dense open with an open of affine space. Its good locus contains a principal open defined by a nonzero polynomial P. Mathlib `MvPolynomial.schwartz_zippel_totalDegree` bounds the proportion of excluded `k_m`-points by `deg(P)/q^m`, giving points for every sufficiently large degree, not merely multiples of one degree. These are the constructions of Ngô §§8.6.3–8.6.6. Apply gluing to a point in the product of the other regular local opens: density of the global regular locus forces density in the chosen local factor. Its regular torsor then gives the local dimension and component statements. This order proves global density before local density.

The resulting API consists of the dimension formula for affine Springer fibres, the description of their irreducible components and the components of the Picard fibre acting on a Hitchin fibre, with the hypotheses above. The components are indexed using the chosen Kostant point.

**Checks.**

- For a regular unramified local invariant, `δ_v=0` and the reduced fibre is the discrete cocharacter lattice; every point is regular.
- For the split `GL₂` local element `diag(ε,−ε), δ_v=1` and infinitely many components are indexed by the local Picard component group, while the lattice quotient is projective.
- In the endoscopic jet slice the required transversality is away from `v`; a prescribed higher-order singularity at `v` remains unchanged by the finite-jet comparison.
- The nonempty good open of the rational pointed jet slice has `k_m`-points for all sufficiently large `m`. The positive-dimensional scheme `Spec k₂×A¹` has none for odd `m`, so positive dimension alone cannot replace the geometric irreducibility assertion.
- For an integral one-node spectral curve, line bundles are dense among rank-one torsion-free sheaves of each fixed degree; the full Picard stack still has its degree components and scalar automorphisms.

*Needs:* Mathlib `MvPolynomial.schwartz_zippel_totalDegree`; §3.13 (degree-dependent codimension bound); §3.6; §3.9; §3.10; §3.11; `TauCetiRoadmap.AlgebraicCurves` Layer 4 (Riemann–Roch and approximation).

### 3.12 The anisotropic locus: properness and Deligne–Mumford structure

In the setting of §3.6 with `deg D > 2g` and `D = D′^{⊗2}: (a)` the anisotropic locus `A^ani ⊆ A^♥`, the set of `a ∈ A^♥` for which `π₀(P_a)` is finite (equivalently the cameral monodromy has no nonzero invariant cocharacters in the full cocharacter space), is open (Ngô Lemme 6.1.1, §6.1); `(b) P^ani = P|_{A^ani}` is a separated smooth Deligne–Mumford stack of finite type over `A^ani`; `M^ani = f⁻¹(A^ani)` is a separated smooth Deligne–Mumford stack and `f^ani : M^ani → A^ani` is proper (Proposition 6.1.5); `(c)` for `a ∈ A^ani(k̄)` the fibre `M_a` is a proper Deligne–Mumford stack and the quotient of the product of local affine Springer fibres by the local symmetry groups is proper (Proposition 4.13.1); `(d)` for a reductive group with a split central torus, fixed central degree or a central lattice quotient controls the component set, but does not remove positive-dimensional automorphisms. The resulting stack is not covered by the Deligne–Mumford assertion above. Its coarse Picard analogue and any required rigidification are separate central constructions.

*Hypotheses.* Deg `D > 2g, D = D′^{⊗2}`; `char(k) ∤ |W|` For the Deligne–Mumford/proper theorem use semisimple `G`, or more generally the actual anisotropic locus with finite reduced automorphism groups of Lemma 6.1.2; fixing degree alone does not meet that condition.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §6.1, Lemme 6.1.1 and Proposition 6.1.5 (pp. 111–113); Proposition 4.13.1 (pp. 86–87).)

`(a)` Ngô §6.1 (pp. 111–112): `A^ani` is a union of strata `A_ψ` with `ψ` in an anisotropic set; openness from the semicontinuity of `π₀` (Lemme 6.1.1, p. 112). `(b)` Ngô Proposition 6.1.5 (p. 113): finiteness of `π₀` and of stabilizers gives the DM property; properness uses Higgs semistable reduction and stability (Faltings, as recalled in §6.1.3 and Lemma 6.1.4), together with the product formula for finite type; the product formula alone does not prove the valuative criterion. `(c)` Ngô Proposition 4.13.1 (pp. 86–87); smoothness of `M` at anisotropic points with `deg D = 2g − 2` is Théorème 4.12.1 (§3.6 `(c)`).

For the anisotropic source the Deligne–Mumford criterion is also part of this target. In an Artin presentation of `M`, identify the Higgs automorphism group with the global sections of the regular centralizer in its generic centralizer; on the anisotropic locus Ngô Lemma 6.1.2, p. 112, and Proposition 6.1.5, p. 113, makes these stabilizers finite and reduced under the standing characteristic hypothesis. The diagonal is therefore unramified; the Artin stack is Deligne–Mumford there. Separatedness uses the extension/uniqueness argument in the valuative criterion, independently of finiteness of stabilizers. Use this criterion only after removing a surviving split centre. The `GL₁` scalar group and the fixed-degree Picard stack in the checks below show why finiteness of a coarse set of objects would not suffice.

**Checks.**

- For `SL₂` with a smooth connected spectral double cover and `char(k)≠2`, the Prym is proper and the determinant-preserving scalar automorphisms are `μ₂`, a finite étale group. Replacing `SL₂` by `GL₂` retains a `G_m` stabilizer and fails this Deligne–Mumford test.

- For `G=GL₁` the full anisotropic locus is empty because `π₀(P_a)=ℤ`. The coarse degree-`d` Picard variety is proper, but the degree-`d` Picard stack has `G_m` stabilizers and is not Deligne–Mumford.
- For `G = SL₂` and a with irreducible spectral curve, `a ∈ A^ani` and `M_a` is a compactified Prym, proper.

*Needs:* §3.6; §3.10; §3.11; §3.9; `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §1.3 (Coherent quotients, Plücker and partial flags).

**Checks for the central boundary.**

- A degree-`d` line bundle has scalar automorphism group `G_m`; a fixed-degree condition does not kill that group.
- Rigidifying those scalar automorphisms yields the Picard variety, whose properness is a different statement from properness of the unrigidified stack.
- For semisimple `G` and an actual anisotropic point, Lemma 6.1.2 supplies finite reduced stabilizers before the Deligne–Mumford argument is applied.

### 3.13 The `δ`-stratification and the codimension estimate

In the setting of §3.6, for `a ∈ A^♥` let `δ_a=dim R_a=Σ_v δ_v(a)` with the trivialized Néron-model kernel of §3.11. `(a) A^♥ ⊗ k̄` has a unique stratification by locally closed strata `A_ψ` indexed by the cameral monodromy and local data `ψ`, on which `δ_a` is constant; `δ` is upper semicontinuous: `ψ ≥ ψ′` implies `δ(ψ) ≤ δ(ψ′)` (Ngô Proposition 5.2.4, Lemme 5.3.1). `(b)` (Local codimension) At a point of a `δ`-stratum with `δ > 0`, the local codimension of the stratum in the space of local data is at least `δ + 1` (Proposition 5.4.1). `(c)` (`δ`-regularity) If `deg D` is large relative to `δ`, the stratum `A_δ = {a : δ_a = δ} ∩ A^ani` has codimension `≥ δ` in `A^ani` (Proposition 5.4.2); hence, for each `δ₀`, if `deg D` is large enough, the open `A^{≤δ₀}` on which the inequality `codim A_δ ≥ δ` holds for all `δ ≤ δ₀` can be used in the support theorem. In characteristic `p` the estimate is only proved under this degree hypothesis (Ngô notes the issue in §5.4 and §8.6); it is the source of the restriction to an open `U ⊂ A^ani` in the global argument, with globalization choosing `deg D` large relative to the `δ` of the prescribed local data.

*Hypotheses.* Deg `D` large relative to `δ` (stated for each `δ`); `char(k) ∤ |W|`.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §5.1, Proposition 5.1.3 (p. 94); §5.2, Proposition 5.2.4 (p. 97); §5.3, Lemme 5.3.1 (p. 98); §5.4, Propositions 5.4.1 and 5.4.2 (p. 101).)

`(a)` Ngô Proposition 5.2.4 (p. 97), §5.3 and Lemme 5.3.1 (p. 98). `(b)` Proposition 5.4.1 (p. 101): deformation of local data at points with `δ_v > 0`. `(c)` Proposition 5.4.2 (p. 101), with Proposition 5.1.3 (p. 94) for the degree hypothesis: the evaluation of global sections of `𝔠_D` at finitely many points is surjective onto the jets when `deg D` is large, so local codimensions add up.

**Checks.**

- The `δ=0` stratum contains the everywhere regular semisimple locus, but also simple ramification: for `GL₂` with local polynomial `t²−ε` in characteristic different from 2, `d_v=1` and `c_v=1`, so `δ_v=(1−1)/2=0`. Thus `δ=0` does not mean the discriminant is nowhere zero.
- For `G = GL₂` the locus of spectral curves with one node has codimension `1 = δ` in `A` when `deg D ≥ 2g + 2` (one condition on the discriminant).

*Needs:* §3.6; §3.11; §3.9; §3.8; `TauCetiRoadmap.AlgebraicCurves` Layer 4 (repartitions, Weil differentials, and Riemann–Roch).

### 3.14 Weak abelian fibrations

Let `k` be a finite field (or its algebraic closure) and `S` a smooth scheme of finite type over `k`. A weak abelian fibration of relative dimension `d` consists of a proper flat map `f:M→S` with geometrically reduced, pure `d`-dimensional fibres and `M` smooth over `k`, together with a smooth commutative finite-type `S`-group `P` of relative dimension `d` acting on `M` with affine geometric stabilizers. The connected version requires `P=P⁰`. The component version allows disconnected `P` and, étale locally on `S`, uses a finite constant group `Π₀→π₀(P)` to define character summands. The Tate module of `P⁰` must be polarizable: étale locally there is an alternating pairing `T(P⁰)⊗T(P⁰)→ℚ̄_ℓ(1)` whose radical at `s` is `T(P_s^aff)` and whose quotient is perfect on `T(P_s^ab)`. Here `1→P_s^aff→P_s⁰→P_s^ab→1` is the geometric Chevalley decomposition. Set `δ_s=dim P_s^aff`; `δ`-regularity is the additional condition `codim S_δ≥δ` for every stratum. It is retained as an explicit predicate, rather than included in the basic structure.

For the Hitchin application, `δ` is the kernel defect of §3.11; in the finite-stabilizer setting its dimension agrees with the affine part of the rigidified neutral group, so the group-scheme definition above applies. Sections 3.15–3.19 use this same defect for both `G` and H. The Hitchin application uses the smooth Deligne–Mumford-stack version for both `M` and `P`, with proper `f` and finite stabilizers of the stacks; its purity input is §3.15. The hypotheses and polarization in Ngô §7.6 are verified for that version. No theorem for arbitrary Artin stacks is asserted.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §7.1.1–7.1.4, pp. 122–124; Théorème 7.1.13, pp. 127–128; Remarque 7.5.1 and §7.6, pp. 149–150.)

The interface consists of the following operations and identities.

- the proper flat map, smooth group action, affine stabilizers and polarization.
- the strata `S_δ` from the affine parts of `P⁰`.
- `codim S_δ≥δ`.
- the `Π₀`-action on perverse direct images, through `π₀(P)`, and its character projectors over `ℚ̄_ℓ`.
- restriction to an open, preserving the structure and `δ`-regularity when assumed.
- the Deligne–Mumford version, with the polarization of Ngô Proposition 7.6.1.

Use Ngô §7.1 for the scheme hypotheses and Remarque 7.5.1 for their Deligne–Mumford extension. The radical condition is stronger than merely choosing a polarization separately on each abelian quotient. For Hitchin, under §3.11a’s degree hypothesis and chosen square root `D′⊗²≅D`, the regular torsor locus identifies the sheaf of irreducible fibre components with `π₀(P)`; §7.6 establishes the required polarization.

**Checks.**

- An abelian scheme `P=M→S` acting by translation has affine stabilizers equal to 1, perfect Tate pairing, and `δ=0`.
- For an elliptic curve `E` over `k, P=M=E×(ℤ/2)` acting by translation satisfies the component version with `d=1, δ=0` and two component characters. Replacing `P` by `P⁰` loses the nontrivial character.
- For a proper flat versal family of integral locally planar curves with smooth relative compactified Jacobian, the relative Picard action has affine stabilizers and the required polarization; its `δ` is the sum of the local singularity defects. An arbitrary family without these hypotheses is not covered.
- The anisotropic Hitchin fibration over the `δ`-regular open satisfies the Deligne–Mumford version (Ngô §7.6); connectedness of its full Picard stack is not assumed.
- A positive-dimensional abelian variety acting trivially on a projective variety has a nonaffine stabilizer and fails the definition.

*Needs:* §3.10; §3.13; `TauCetiRoadmap.EtaleCohomologyFoundations` §F.8 (perverse sheaves).

### 3.14a Scheme decomposition and relative hard Lefschetz inputs

Use `EtaleDualityAndPerverseSheaves` §5.6’s `pureComplexGeometricSplitting` and `decompositionTheorem` on the rational adic constructible category, with its middle perverse structure. For a separated finite-type scheme `S₀/𝔽_q`, `ℓ≠char(k)`, and a pure arithmetic model `K₀∈Dᵇ_m(S₀,ℚ̄_ℓ)` of weight `w`, the geometric pullback splits as `K≅⊕ᵢ ᵖHⁱ(K)[−i]`; its perverse cohomology is geometrically semisimple, and `ᵖHⁱ(K₀)` is pure of weight `w+i`. For a proper map of separated finite-type schemes the same conclusions apply to its pure direct image. The splitting is neither canonical nor asserted to respect arithmetic Frobenius. For a projective `f₀:Y₀→S₀`, a pure perverse arithmetic model `P₀` and an `f₀`-ample line bundle with class `η`, use §5.8’s `relativeHardLefschetzTheorem`: `ηⁱ:ᵖH⁻ⁱ(Rf₀*P₀)≅ᵖHⁱ(Rf₀*P₀)(i)` for `i≥0`. Here `ℚ̄_ℓ` denotes the supplier’s coefficient-extension colimit from finite extensions of `ℚ_ℓ`. Apply its duality and projector operations to the finite component action; §3.15 constructs the smooth separated Deligne–Mumford extension needed for Hitchin. ([Beilinson–Bernstein–Deligne, *Faisceaux pervers*](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/faisceaux_pervers.pdf), Théorèmes 5.3.8, 5.4.5 and 5.4.10.)

**Checks.**

- On `Spec k` the geometric decomposition is that of a bounded complex of vector spaces; Frobenius need not be semisimple over `k`.
- For `ℙ¹→Spec k` and `P=ℚ̄_ℓ[1], η` identifies `H⁰` with `H²(1)`.
- An integral coefficient complex is outside these rational purity assertions; no integral splitting follows.

*Needs:* `TauCetiRoadmap.EtaleDualityAndPerverseSheaves` §§5.6 and 5.8 (scheme decomposition and relative hard Lefschetz).

### 3.15 Purity, decomposition and the `κ`-isotypic parts of the Hitchin cohomology

In the setting of §3.12, let `f^ani : M^ani → A^ani` and `K = f^ani_* ℚ̄_ℓ`. `(a) K` is pure (`M^ani` smooth, `f^ani` proper) and, by the decomposition theorem, `K ⊗ k̄` is isomorphic to the direct sum of its shifted perverse cohomology sheaves `^pH^n(K)`, each geometrically semisimple. `(b)` Over the étale cover `Ã^ani` of `A^ani` trivializing the cameral monodromy, the action of `π₀(P)` on `^pH^n(f̃^ani_* ℚ̄_ℓ)` factors through a finite quotient and gives a decomposition `^pH^n = ⊕_{κ} ^pH^n_κ` over the characters `κ` of that quotient `(κ ∈ κ^ani)`, with `^pH^n_κ` supported in `Ã_κ ∩ Ã^ani`, where `Ã_κ` is the locus of a whose cameral monodromy fixes `κ` (Ngô (6.2.5), Proposition 6.2.6). `(c)` The `κ = 1` part is the stable part `^pH^n_st`. The decomposition theorem is applied to `f^ani` with source a smooth separated Deligne–Mumford stack (Ngô Remarque 7.5.1); the supplied scheme decomposition theorem fixed in §3.14a is extended here to this smooth separated Deligne–Mumford source.

*Hypotheses.* The setting of §3.12; `ℓ ≠ char(k)`, coefficients `ℚ̄_ℓ`.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §6.2, (6.2.5) and Proposition 6.2.6 (pp. 113–114); Remarque 7.5.1 (p. 149); Corollaire 5.7.5 (p. 110).)

`(a)` Deligne's theorem that proper direct images of pure complexes are pure (DeligneWeightsAndPurity DWP.8 — Mixed complexes, weight filtrations and geometric semisimplicity) and `EtaleDualityAndPerverseSheaves` §5.6’s `decompositionTheorem` (BBD 5.4.5; §3.14a), applied as in Ngô §6.2 (p. 113) with Remarque 7.5.1 (p. 149) for Deligne–Mumford stacks. `(b)` The homotopy argument: `P` acts on `K`, its identity component acts trivially on cohomology sheaves, so `π₀(P)` acts; over `Ã^ani` it is a quotient of a constant finitely generated group with finite image (Ngô §6.2, (6.2.5) and Proposition 6.2.6, p. 114; Corollaire 5.7.5, p. 110).

For this extension choose a scheme presentation and a proper generically finite alteration by smooth schemes. Over the dense finite étale locus, the unit and trace compose to the degree; after dividing by that degree over `ℚ̄_ℓ` the constant intersection complex of the smooth stack is a direct summand. Extend the projector using the intersection-complex characterization and proper descent. Apply scheme proper purity and decomposition to the alteration and take this summand; étale descent identifies the result independently of the presentation. This proves the needed pure direct-image and geometric semisimplicity statements for `f^ani` (Ngô Remarque 7.5.1, p. 149). When a relatively ample class is chosen on the projective coarse Hitchin map, the same summand argument carries relative hard Lefschetz. No arbitrary Artin-stack decomposition theorem is asserted. Check a finite quotient `[Y/H]` gives the `H`-invariant summand of the scheme statement; for BH with `H` finite the positive-degree `ℚ̄_ℓ` group cohomology vanishes; `BG_m` has nonzero higher cohomology and fails the finite-stabilizer hypothesis.

**Checks.**

- For `G=GL₁, π₀(P_a)=ℤ` shifts degree components, so the full group does not act on one fixed-degree component and the full anisotropic locus is empty. The anisotropic decomposition theorem above cannot be applied by merely fixing a degree.
- For the trivial group the Hitchin base, fibre and Picard groupoid are points; the only component character is trivial and the cohomological decomposition has one summand.
- For `G = SL₂, κ` ranges over characters of `ℤ/2`, and the nontrivial `κ`-part attached to a connected étale double cover `X′ → X` is supported on the image of the endoscopic base `A_H`, where nonzero `a_H` gives spectral curves with normalization `X′`, nodal when `a_H` has only simple zeros. A zero of order two gives the local tacnode `y²=t⁴` in odd characteristic; `a_H=0` gives a nonreduced curve and lies outside `A^♥`.

*Needs:* §3.12; §3.10; §3.14a (supplied scheme decomposition and relative hard Lefschetz); `TauCetiRoadmap.DeligneWeightsAndPurity` DWP.8 — Mixed complexes, weight filtrations and geometric semisimplicity.

### 3.16 Counting points of Hitchin fibres

In the setting of §3.12, fix `a∈A^ani(k)` and let `U_rs⊆X` be its regular semisimple locus. Construct together a nonempty open `U⊆U_rs` and a smooth commutative finite-type `X`-group `J′_a→J_a` that is an isomorphism over `U`, has connected fibres, and has `H⁰(X̄,J′_a)=1`. At the finitely many places in `X−U`, connected models and sufficiently small congruence subgroups eliminate the finite reduced global automorphisms; these places may include regular semisimple places. Thus `P′_a=Bun_{J′_a}` is an algebraic group locally of finite type acting on `M_a`, with finite-type identity component. This auxiliary model is not required to be the open subgroup denoted `J′` in §3.5. Let `κ` be a Frobenius-invariant character of `π₀(P_a)`. With geometric Frobenius, prove
```text
Σ_n (−1)^n tr(Frob, H^n(M_a,ℚ̄_ℓ)_κ)
  = #(P′_a)⁰(k) · #[M_a/P′_a](k)_κ
  = #(P′_a)⁰(k) · ∏_{v∈|X−U|} #[M_v(a)/P_v(J′_a)](k)_κ .
```
The quotient counts sum rational isomorphism classes, with reciprocal automorphism orders and the `κ`-weight of their torsor invariant. They are not the unscaled trace on `M_a`. On the transverse endoscopic locus the `G`-local count equals `q^{deg(v) r_{G,H,v}(a_H)}` times the stable `H`-local count (Ngô Lemme 8.5.7). Translation to orbital integrals is §4.1: retain every place in `X−U`, with its actual factor `vol(J′_a(𝒪_v),dt_v)·O^κ_a(1)`, including all modified regular places.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Propositions 8.1.6 and 8.1.13, pp. 157–160; §8.4.1, Proposition 8.4.2, p. 175; Proposition 8.4.3 and Corollaire 8.4.4, p. 176; Lemmes 8.5.1 and 8.5.7, pp. 178–179.)

Apply Grothendieck–Lefschetz to the proper Deligne–Mumford fibre, using the finite-stabilizer descent of §3.15 and the scheme trace formula. Insert the finite component-character projector. Lang's theorem for `(P′_a)⁰` and the torsor calculation of Proposition 8.1.6 convert this trace into the quotient count with the factor `#(P′_a)⁰(k)`. Proposition 8.1.13 supplies the corresponding local finite-type lattice-quotient calculation. The product equivalence of Proposition 8.4.2 and multiplicativity of the torsor invariant give Proposition 8.4.3 and Corollaire 8.4.4. A trace formula for a quotient with positive-dimensional stabilizers is not obtained merely by finite-group averaging.

**Checks.**

- For an abelian variety A acting on itself by translations, `[A/A]=Spec k` has count 1, whereas the alternating trace on `H*(A)` is `#A(k)`. The connected-group factor is therefore essential.
- For the trivial group, `M_a=P′_a=1`, the empty local product is 1 and both sides are 1.
- For a geometrically connected étale double cover `X′→X` of an elliptic curve in odd characteristic, the norm-one torus `T=Res¹_{X′/X}G_m` has `H⁰(X̄,T)=μ₂`. At `a=0` every place is regular semisimple. Auxiliary level at a regular place is therefore required to obtain `H⁰(X̄,J′_a)=1`; its quotient factor remains in the product.
- If `a` is regular semisimple everywhere and `J′_a=J_a` already has trivial global automorphisms, the local product is empty and the trace is `#(P′_a)⁰(k)`. With auxiliary level, modified regular places contribute their actual factors instead. The full split `GL₁` fibration is outside the anisotropic hypotheses.

*Needs:* §3.12; §3.11; §3.9; `TauCetiRoadmap.SchemeAndStackFoundations` Layer 2 (sites and scheme cohomology); `TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups` §IG.0.T3 (the rational constructible scheme Grothendieck–Lefschetz formula).

### 3.16a Frobenius-count descent from all sufficiently large degrees

**Cofinite Frobenius-count descent.** For finite-type lattice quotients `[M/P]` and finite-order Frobenius-invariant component characters as in §3.16, retain the connected-group factors: `#P⁰(k_m)·#[M/P](k_m)_κ` is the alternating trace of `Φ^m` on the finite-dimensional compactly supported character cohomology. If two such expressions agree for every `m≥m₀`, they agree for `m=1`; the same holds with a factor `q^{rm}` after incorporating the corresponding Tate twist. For quotient counts themselves, first clear the connected-group factors on both sides using their finite-dimensional cohomology, and then cancel their nonzero `k`-point counts. ([Ngô, arXiv v3](https://arxiv.org/abs/0801.0446v3), Proposition 8.1.13, p. 160, and Corollaire 8.1.14, p. 161.)

For distinct nonzero `α_i` in a field and coefficients `c_i`, vanishing `Σ_i c_i α_i^m=0` for all sufficiently large natural `m` implies `c_i=0` for every `i`. Group equal nonzero Frobenius eigenvalues across all cohomological degrees and both sides. A consecutive block of as many exponents as there are distinct eigenvalues has matrix equal to a Vandermonde matrix times invertible diagonal powers. Mathlib `Matrix.det_vandermonde` and `Matrix.det_vandermonde_ne_zero_iff` give invertibility, and `Matrix.eq_zero_of_forall_pow_sum_mul_pow_eq_zero` gives coefficient vanishing after the shift. This proves descent in characteristic-zero cohomological coefficients even without Frobenius semisimplicity; traces ignore the nilpotent part of each generalized eigenspace.

**Checks.**

- `Spec k₂` and two copies of `Spec k` have the same count over every even-degree extension, but counts 0 and 2 over `k`. Their Frobenius spectra `{1,−1}` and `{1,1}` show why one extension or its multiples are insufficient.
- With distinct nonzero eigenvalues, any sufficiently late consecutive block gives an invertible matrix; omitting the nonzero condition permits a coefficient at eigenvalue 0 that all positive powers miss.
- The empty eigenvalue set gives zero traces in every degree, including `m=1`; a single eigenvalue gives the usual nonzero-power cancellation.
- For an abelian variety `P` acting on itself, the quotient count is 1 and the trace is `#P(k_m)`. Keeping or clearing this factor yields the same descent statement.

*Needs:* §3.16; Mathlib `Matrix.det_vandermonde`; `DeligneWeightsAndPurity` §§0.10–0.12 (traces and Frobenius powers).

### 3.17 Ngô's support theorem

Let `(f:M→S,P)` be a weak abelian fibration of relative dimension `d` over a finite field as in §3.14. Work geometrically over `k̄` and fix a finite component action `Π₀→π₀(P)` and a character `κ`. Write `K^n_κ=ᵖHⁿ(Rf_*ℚ̄_ℓ)_κ`. For an irreducible support `Z` occurring among these sheaves, group together **all** simple constituents with support `Z` in every perverse degree. If `occ(Z)` is the set of degrees in which this common-support summand is nonzero, then
```text
amp(Z) := max occ(Z) − min occ(Z) ≥ 2(d − δ_Z),
```
where `δ_Z` is the generic affine-part dimension. This is not an amplitude assertion about a single simple perverse sheaf.

For the support theorem, choose irreducible locally closed strata `S_σ` on which the constructible sheaf `(ℚ̄_ℓ[Irr(M/S)])_κ` is locally constant. Put `S_κ={s : κ factors through π₀(P_s)}`. The amplitude estimate, duality and the fibre cohomological dimension bound give `codim Z≤δ_Z` for every occurring support. If also `codim Z≥δ_Z`, hence equality holds, the common-support summand reaches top ordinary fibre cohomology `H^{2d}(Rf_*ℚ̄_ℓ)_κ`. It follows that `Z` is the closure of one of those strata contained in `S_κ`. Under `δ`-regularity the additional inequality `codim Z≥δ_Z` holds for every support, so every support has this conclusion. The controlling stratification is by irreducible fibre components, not by Tate-module monodromy.

For the anisotropic Hitchin fibration the component sheaf is identified with `π₀(P)`. On an endoscopic base, Ngô Lemme 7.6.5 supplies `codim Z≥δ_Z` for supports meeting its `H`-good open, using the `H`-codimension bound. Théorème 7.6.6 then identifies those supports with the endoscopic base images. For `κ=1` the stable part has full support on each component of the good base.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Théorème 7.1.5 and Corollaire 7.1.6, pp. 124–125; [published version](https://www.math.uchicago.edu/~ngo/LF.pdf), Théorème 7.2.1 and Propositions 7.2.2–7.2.3, pp. 113–114 (the support inequality and equality case); arXiv v3 (7.2.1)–(7.2.2) and Proposition 7.2.3, pp. 130–131; §7.3, pp. 131–133; Remarque 7.5.1, p. 149; Lemme 7.6.5 and Théorème 7.6.6, p. 153.)

The polarization and affine stabilizers give freeness over the exterior algebra from the abelian Tate module, hence the common-support amplitude bound. Verdier duality centers the occurring degrees; the bound produces a summand reaching top fibre cohomology when `codim Z≥δ_Z`. That top cohomology is controlled by `Irr(M/S)`, forcing equality and the stratum-closure conclusion. The component-character argument is the same on each `κ`-summand. In the Hitchin case, use the regular Picard torsor locus and endoscopic description of the component sheaf. Relative hard Lefschetz alone does not replace this argument.

**Checks.**

- For an elliptic curve `E→Spec k, d=1` and `δ=0`. The common support occurs in degrees 0,1,2, so `amp=2`. The individual constituent `H⁰` has amplitude 0 and disproves the single-constituent formulation.
- If `codim Z<δ_Z`, the automatic upper bound holds but the top-cohomology conclusion does not follow; the additional lower bound, or equality, is essential.
- For an abelian scheme over an irreducible base, `δ=0` and the only support is the whole base.
- In a versal family of integral planar curves satisfying the smooth-total-space and flatness hypotheses, the compactified-Jacobian support statement uses the irreducible-component sheaf, which is constant; its perverse constituents have full support.

*Needs:* §3.14; §3.15; §3.13; §3.12; §3.14a (supplied scheme decomposition and relative hard Lefschetz).

### 3.18 Geometric stabilization on the `H`-good open

In the setting of §3.17, let `κ` be a character as in §3.15, `(H, κ)` the corresponding endoscopic datum over `X` (determined by `κ` and the cameral monodromy, Ngô §1.8 and §6.3), `ν : Ã_H → Ã` the endoscopic map of Hitchin bases (finite and unramified on the anisotropic part over the transverse locus), and `r_{G,H}(D) = (#Φ − #Φ_H) deg(D)/2`. Put `Ã_H^good=(Ã_H^ani∩ν⁻¹(Ã^ani))∖Ã_H^bad`, where `Ã_H^bad` is the locus `δ_H≥δ_H^bad(D)` of §3.11a. Then over `Ã_H^good` there is an isomorphism between the semisimplifications of the graded perverse sheaves `ν^*(⊕_n ^pH^n(f̃^ani_* ℚ̄_ℓ)_κ)[2r_{G,H}(D)](r_{G,H}(D))` and `⊕_n ^pH^n(f̃^ani_{H,*} ℚ̄_ℓ)_st` (Ngô Théorème 6.4.3). The proof first establishes the comparison over a transverse dense open inside `Ã_H^good` by point counting — the local identities of §3.16 at the points of `Ã_H` where the `δ` of `G` equals the `δ` of `H` plus the explicit contribution — and then extends it within `Ã_H^good` by the support theorem. This preliminary comparison uses only the transverse local calculation, not the general local fundamental lemma. Full stabilization on the common anisotropic base is §4.3a, after §4.3.

*Hypotheses.* The anisotropic Hitchin setting of §§3.12 and 3.15; `deg D>2g`, `D=D′^{⊗2}`; restriction to `Ã_H^good` with the codimension bound of Ngô Lemme 7.6.5. This bound on the `H`-good open, rather than a global `δ`-regularity assertion for `G`, supplies the support argument.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §6.3–6.4, §6.4.2 and Théorème 6.4.3 (p. 120); §8.5, Lemmes 8.5.1 and 8.5.7 (pp. 178–179); §8.7 (p. 185).)

Transverse locus: Ngô §8.5, Lemme 8.5.1 (p. 178) gives the open set of transversal `a_H`, and Lemme 8.5.7 (p. 179) the local count identity with `q^{deg v · r_{GH,v}(a_H)}`; prove the perverse trace-recognition step as follows. Equality of traces of every power of Frobenius at every closed point determines the semisimplified lisse constituents on each smooth support by Chebotarev. Stratify by supports and pass from a perverse sheaf to its generic local systems; intermediate extension and induction over smaller supports identify the semisimplifications. For the graded direct image keep the perverse degrees and weights separate, so an equality of alternating traces alone is not used to distinguish opposite degrees. This is the trace-to-perverse argument of Ngô §8.7, p. 185, applied after purity from §3.15. Extension within `Ã_H^good`: §3.17 and Ngô Lemme 7.6.5 and Théorème 7.6.6 identify every support there with the endoscopic base. Intermediate extension carries the generic comparison across this good open. No extension over its bad complement is used here. Shift `r_{G,H}(D)`: the difference of dimensions of the Hitchin fibres of `G` and `H` over `Ã_H` (Ngô §6.4.2, p. 120).

**Checks.**

- A jet globalization with `δ_H(a_H)<δ_H^bad(D)` belongs to this comparison even when its prescribed germ at `v` is not transverse. The germ need not lie in the initial transverse calculation locus.
- For `κ = 1` and `H = G` the statement is a tautology with `r_{G,G} = 0`.
- For `G = SL₂` and `H` the norm-one torus of a connected étale double cover `X′ → X: #Φ − #Φ_H = 2`, so `r_{G,H}(D) = deg D`, and the comparison identifies the nontrivial `κ`-part over `Ã_H^good` with the stable cohomology of the Hitchin fibration of the torus `H` (whose fibres are torsors under the Picard stack of `H`-torsors), shifted by 2 `deg D` and Tate-twisted by `deg D`.

*Needs:* §3.17; §3.15; §3.16; §3.5; §1.4; §3.14a (supplied scheme decomposition and relative hard Lefschetz).

### 3.18a Truncated Hitchin fibrations and weighted point counts

Let `k` be an algebraic closure of a finite field, `G` a semisimple group over `k`, `C` a smooth projective connected curve of genus `g` with an effective divisor `D` of degree larger than `2g`, and `∞` a closed point of `C` outside the support of D. Over the open subset of the Hitchin base where the characteristic polynomial has only simple roots at `∞`, form the finite étale Galois cover `Ã` given by an ordering of those roots and the stack `M̃` of Hitchin triples `(E,θ,t)`: a Hitchin bundle together with the ordered eigenvalues `t` of `θ` at `∞` (Chaudouard–Laumon I, §1.3, pp. 3–4, and §4). For `ξ` in the real cocharacter space of the maximal torus with trivial sum, define a triple to be `ξ`-stable when every proper `θ`-stable parabolic reduction has negative `ξ`-corrected slope, the correction adding the coordinates of `ξ` indexed by the eigenspaces at `∞` that the reduction contains (for `SL_n`: `deg_ξ(F)/rank(F)<0` for every nonzero proper `θ`-stable subbundle `F`, Définition 1.1, p. 3; the general definition is §6). Prove that `ξ`-stability is an open condition and that, for `ξ` in general position (no partial sum of its coordinates over a nonempty proper subset is an integer), the `ξ`-stable locus `M̃^ξ` is a Deligne–Mumford stack, smooth over `k` and proper over `Ã` (Théorème 1.2, p. 3, and Théorème 6.9 of the arXiv version). Over `𝔽_q`, with all data defined over `𝔽_q` and `(a,t)` an `𝔽_q`-point of `Ã`, let `M` be the Levi subgroup stabilizing the eigenspace decomposition given by the irreducible factors of the characteristic polynomial. Prove that the number of `𝔽_q`-points of the `ξ`-stable fibre is independent of `ξ` and equals, up to the constant fixed by the normalization of Arthur's weight function `v_M`, the sum over `M(F)`-conjugacy classes of regular semisimple `X ∈ 𝔪(F)` with the prescribed factor characteristic polynomials of `vol(T_X(F)\T_X(𝔸)¹)·J_M(X,1_D)`, where `J_M(X,φ)=∫ φ(g⁻¹Xg) v_M(g) dg dt` is Arthur's global weighted orbital integral and `1_D` is the characteristic function of `ϖ^{−D}𝔤(𝒪)` (Théorème 1.3, p. 4, and Théorème 11.1, §11, from p. 57). The elliptic locus is the case of one factor, `M=G`, where the weight is 1 and the count is that of §3.16.

*Hypotheses.* `G` semisimple over `k`; `deg D>2g`; `∞` outside the support of `D`; `ξ` in general position for the stack statements; for the count, all data over `𝔽_q`.

([P.-H. Chaudouard and G. Laumon — Le lemme fondamental pondéré. I. Constructions géométriques](https://arxiv.org/abs/0902.2684v1), §1.3, Définition 1.1 and Théorème 1.2, p. 3; §1.4, Théorème 1.3, p. 4; §6; §11, Théorème 11.1, from p. 57.)

The route is Langton's method in the adelic form of Heinloth for the valuative criterion (CL I §§8–9), the separation and Deligne–Mumford statements (§§9–10), and the adelic description of the fibres (§7) for the count; the weight arises from the degrees of the parabolic reductions through the convex polytope attached to a triple (§5).

**Checks.**

- For elliptic `a` (one irreducible factor), `M=G`, every triple is `ξ`-stable for every `ξ`, and the count is Ngô's elliptic count of §3.16; a formula that kept a proper-Levi weight there is wrong.
- For `G=SL₂` and `a` whose characteristic polynomial splits into two distinct linear factors over `F`, the untruncated fibre is not of finite type: it contains the split triples `L₁⊕L₂` with `deg L₁=d` for every integer `d`. With `ξ=(ξ₁,−ξ₁)` and `ξ₁∉ℤ`, no split triple is `ξ`-stable, since the two inequalities `d+ξ₁<0` and `−d−ξ₁<0` are incompatible, and a nonsplit triple has `d` bounded by the inequality for its unique eigen-subbundle; the `ξ`-stable fibre is of finite type and, by the theorem, proper.
- `ξ=0` is ordinary stability and is not in general position for `n≥2`, since the sum over any proper subset is the integer 0; the theorem asserts no properness for it.

*Needs:* §3.6 (Hitchin stack and fibration); §3.8 (spectral curves); §3.9 (affine Springer fibres); §3.16 (elliptic count); §2.4 (orbital integrals); `TauCetiRoadmap.AutomorphicSpectralTheory` AS.6.10 (weighted orbital integrals); `TauCetiRoadmap.SchemeAndStackFoundations` Layer 1 (algebraic stacks); `TauCetiRoadmap.AlgebraicCurves` Layer 4 (Riemann–Roch).

### 3.18b Support and `s`-decomposition for the truncated fibration

Assume in addition that the characteristic of `k` does not divide `|W|`, that `D` is even of degree larger than `g`, and let `f^ξ: M̃^ξ→Ã` be the truncated fibration of §3.18a with `ξ` in general position. Define the good open `Ã^bon` of the base (Chaudouard–Laumon II, §9) and prove that for every `i` the perverse cohomology sheaf `ᵖH^i(Rf^ξ_*ℚ_ℓ)` is, on `Ã^bon`, the intermediate extension of its restriction to the elliptic part `Ã^ell∩Ã^bon` (Théorème 1.5.1, p. 4, and Théorème 10.5.1): no support of an irreducible constituent avoids the elliptic locus. Construct the substack of the Picard stack that respects the truncation (§6), the sheaf of connected components of the Picard stack over the cameral curve (§7), and the resulting `s`-decomposition of the cohomology of the truncated fibration indexed by the characters of that sheaf, extending Ngô's elliptic decomposition of §3.15 (Théorème 8.5.1, §8). Prove the cohomological comparison of the `κ`-parts with the stable parts of the endoscopic truncated fibrations that generalizes §3.18 (Théorème 10.7.3, §10, from p. 49). Purity holds because `M̃^ξ` is smooth and `f^ξ` proper (§1.5, p. 4).

*Hypotheses.* `char k∤|W|`; `D` even with `deg D>g`; `ξ` in general position.

([P.-H. Chaudouard and G. Laumon — Le lemme fondamental pondéré. II. Énoncés cohomologiques](https://arxiv.org/abs/0912.4512v1), §1.5, Théorème 1.5.1, p. 4; §§6–8, Théorème 8.5.1; §9; §10, Théorème 10.5.1 and Théorème 10.7.3, from p. 49.)

**Checks.**

- On the elliptic locus the statement is Ngô's support theorem of §3.17 and the decomposition of §3.15; the truncation changes nothing there.
- For `κ=1` the comparison is the stable part of the direct image, with no endoscopic group; for `κ` with `H=G` of lower dimension excluded, the `κ`-part vanishes outside the image of the endoscopic base, as in §3.18.
- The direct image of the untruncated fibration over a non-elliptic point is not a pure complex of finite type in general, since the fibre is not of finite type; the theorem concerns the truncated fibration only.

*Needs:* §3.18a; §3.15; §3.17; §3.18; §3.14a (relative hard Lefschetz and decomposition inputs); `TauCetiRoadmap.EtaleDualityAndPerverseSheaves` §§5.6 and 5.8 (pure decomposition and relative hard Lefschetz).

### 3.19 Worked examples for the Hitchin fibration

(1) Torus: for `G = T, A = H⁰(X, 𝔱 ⊗ D), M = Bun_T × A, P = Bun_T × A, δ = 0`, every `a` is regular semisimple, affine Springer fibres are discrete. For a nontrivial split torus the full Picard component lattice is infinite and the anisotropic locus is empty; the anisotropic support theorem does not apply to that full fibration. An anisotropic torus satisfying §3.12 has the separate proper-fibre case. (2) Rank-one degenerating spectral curve: for `G = GL₂`, a family of spectral curves acquiring one node at `v ∈ X` has `δ_v = 1, M_a` is the rank-one torsion-free sheaf stack of the integral nodal curve, whose fixed-degree rigidification is a compactified Jacobian; `P_a` is the full Picard stack, with degree components and scalar `G_m` automorphisms. Its rigidified degree-zero identity component is the generalized Jacobian, an extension of the Jacobian of the normalization by `G_m`. The compactified-Jacobian description fixes a degree and distinguishes the rank-one sheaf stack from its rigidification, and the product formula expresses `M_a` through the affine Springer fibre at `v` (a chain of `ℙ¹'s` modulo `ℤ`). (3) Nontrivial component character: for `G = SL₂` and `a = ν(a_H)` with `H` the norm-one torus of a connected étale double cover `X′ → X`, for nonzero `a_H` the spectral curve has normalization `X′`, is nodal when `a_H` has only simple zeros, and `π₀(P_a)` carries the nontrivial character `κ` attached to `X′`. (4) Endoscopic Hitchin fibre: for `G = SL₂` and `H` the norm-one torus of a connected étale double cover `X′ → X`, the endoscopic Hitchin base `A_H` maps to `A` by `ν`, and over its image the nontrivial `κ`-part of the cohomology is identified (§4.3a) with the stable cohomology of the `H`-fibration shifted by 2 `deg D`.

*Hypotheses.* `X` smooth projective over `𝔽_q, char ≠ 2` for (3)–(4).

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §§4–7 and §8.7 as cited in the nodes used.)

Each example is computed from §3.6, §3.10, §3.9, §3.11 and §4.3a.

**Checks.**

- In the one-node integral example, rigidifying the degree-zero Picard component gives a `G_m`-extension of the normalization Jacobian; the full Picard stack also has `ℤ` degrees and `G_m` automorphisms.
- For `a_H≠0` with a double zero, the local spectral equation `y²=t⁴` is a tacnode, while simple zeros give nodes. The zero section is nonreduced and outside `A^♥`.
- For `X=ℙ¹` and `D=O(−1)`, the `GL₂` Hitchin base is zero although 3 `deg D+2=−1`; the dimension formula requires `deg D≥0`.
- For `X=ℙ¹, D=O` and `a₂=1` over `k̄`, the smooth double cover is disconnected; positive degree and simple zeros give nonempty branching and connectedness.

*Needs:* §3.6; §3.10; §3.9; §3.11; §3.11a; §4.3a.

### Examples

For split `GL₂` and `deg(D)=d≥0` with `d>2g−2`, the base `H⁰(D)` direct-sum `H⁰(D²)` has dimension `3d+2(1−g)`. For `d>0` a smooth degree-two spectral cover with `2d` simple branch points is connected and has genus `2g−1+d` by Riemann–Hurwitz; its line bundles describe the regular fibre. At a local unramified regular point the discriminant valuation and torus rank drop are both zero, so `δ_v=(d_v−c_v)/2` is zero. A singular spectral cover can have positive `δ`, and must satisfy the codimension bound used by support, rather than being treated as a smooth Jacobian fibre.

### Dependencies

`TauCetiRoadmap.AlgebraicCurves` Layers 4 (repartitions, Weil differentials and Riemann–Roch) and 12 (the function-field/curve dictionary); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.SchemeAndStackFoundations` Layer 1 (descent, algebraic spaces and stacks); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §7.1 (Formal points, gluing and module obstructions); `TauCetiRoadmap.AlgebraicCurves` Layer 5 (consequences of Riemann–Roch, and local components); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §1.3 (Coherent quotients, Plücker and partial flags); `TauCetiRoadmap.SchemeAndStackFoundations` §1.1 (descent); `TauCetiRoadmap.ReductiveGroups` Layer 2 (Lie algebra and the adjoint representation); `TauCetiRoadmap.ReductiveGroups` Layer 9 (pinned Chevalley–Demazure group schemes over `ℤ`); §1.3; Mathlib `Matrix.charpoly`; Mathlib `Matrix.charpoly_monic`; Mathlib `Polynomial.discr`; `TauCetiRoadmap.ReductiveGroups` Layer 4 (Jordan decomposition, diagonalizable groups, tori); `TauCetiRoadmap.AlgebraicCurves` Layer 4 (repartitions, Weil differentials, and Riemann–Roch); `TauCetiRoadmap.AlgebraicCurves` Layer 12 (the dictionary — function fields ↔ curves, and the comparison contracts); Mathlib `LaurentSeries`; Mathlib `PowerSeries`; §3.14a (supplied scheme decomposition and relative hard Lefschetz); `TauCetiRoadmap.DeligneWeightsAndPurity` DWP.8 — Mixed complexes, weight filtrations and geometric semisimplicity; `TauCetiRoadmap.SchemeAndStackFoundations` Layer 2 (sites and scheme cohomology); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §2.1 (Hilbert families and graph parameters); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §2.2 (Automorphisms and bounded quotients); `TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups` §IG.0.T3 (the rational constructible scheme Grothendieck–Lefschetz formula); §1.4.

## Layer 4: the fundamental lemma and smooth transfer

Convert the Hitchin comparison into the equal-characteristic Lie-algebra identity. Keep the unramified and `G`-regular conditions on matching elements, and carry the relative discriminant. Characteristic transfer, Lie-to-group reduction, spherical Hecke transfer and smooth transfer are separate steps.

### 4.1 Local `κ`-weighted point counts are `κ`-orbital integrals

Let `k = 𝔽_q, v` a closed point of a curve over `k` with completion `F_v = k(v)((ε_v)), G` as in §3.9 and `a ∈ 𝔠(𝒪_v) ∩ 𝔠^rs(F_v)`, with a smooth connected-fibre model `J′_a→J_a` that is generically an isomorphism, as in §3.16, and `κ` a character of `H¹(F_v,J_a)`, identified with `H¹(k(v),P_v(J′_a))` by Ngô Lemme 8.2.4. Then the number of `k(v)`-points of the quotient groupoid `[M_v(a)/P_v(J′_a)]`, each point weighted by `κ` of its invariant and divided by the order of its automorphism group, equals `vol(J′_a(𝒪_v), dt_v)·O^κ_a(1_{𝔤(𝒪_v)}, dt_v)`, where `O^κ` is the `κ`-orbital integral of §2.4 of the characteristic function of `𝔤(𝒪_v)` over the stable class `a` with the measure `dt_v` on the centralizer torus; for `κ = 1` the count is the stable orbital integral multiplied by that same centralizer volume (Ngô Lemme 8.2.4, Propositions 8.2.5 and 8.2.7). Consequently the global `κ`-count of §3.16 is a product of local `κ`-orbital integrals of unit functions times explicit volumes.

*Hypotheses.* `k` finite, `char(k) ∤ |W|`; a integral and regular semisimple over `F_v`.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §8.2, Lemme 8.2.4, Propositions 8.2.5 and 8.2.7 (pp. 164–167).)

Points of `M_v(a)` over `k(v)` are lattices `g ∈ G(F_v)/G(𝒪_v)` with `Ad(g)⁻¹γ_a ∈ 𝔤(𝒪_v)` (§3.9); the quotient groupoid by `P_v(J′_a)`, including its twisted rational objects, parametrizes the `G(F_v)`-conjugacy classes of elements of `𝔤(𝒪_v)` in the stable class of `γ_a` with given invariant, weighted by the inverse volumes of their centralizers (Ngô §8.2, Lemme 8.2.4). The `κ`-twist: the invariant of a rational class in the stable class is identified with the class in `H¹(F_v, J_a)` and `κ` is evaluated on it (§1.14), giving the `κ`-weighted sum (Propositions 8.2.5, 8.2.7).

**Checks.**

- If `a` is regular semisimple modulo `ε_v` and `J′_a=J_a` is the full unramified model, the quotient groupoid is a point and `vol(J_a(𝒪_v),dt_v)·O^κ_a(1)=1`. The unscaled integral is 1 with volume-one centralizer normalization.
- For `G=G_m`, `𝒪=k[[ε]]` and integral `a`, the connected smooth model `Spec 𝒪[x,(1+εx)⁻¹]`, with law `x*y=x+y+εxy` and map `x↦1+εx`, has `J′(𝒪)=1+ε𝒪`. With `vol(𝒪×)=1`, the orbital integral is 1 and the volume is `1/(q−1)`; the quotient is `BG_m`, whose weighted count is `1/(q−1)`.
- For `G = GL_n` (`κ = 1` only) the count is the classical lattice count expressing `O_a(1_{𝔤𝔩_n(𝒪)})` as a number of `𝒪[γ_a]`-stable lattices up to the centralizer.

*Needs:* §3.9; §3.5; §2.4; §2.1; §1.14.

### 4.2 Waldspurger's non-standard fundamental lemma (Ngô)

Let `k` be a finite field, `𝒪 = k[[ε]], F = k((ε))`, and `G₁, G₂` two semisimple simply connected quasi-split groups over `𝒪` with isogenous root data, i.e. a non-standard endoscopic triple `(G₁, G₂, j_*)` in Waldspurger's sense: an isomorphism `j_* : X_{1,*} ⊗ ℚ → X_{2,*} ⊗ ℚ` of rational cocharacter spaces, Galois-equivariant, sending each coroot of `G₁` to a positive rational multiple of a coroot of `G₂` and dually (the simply connected basic case `G₁ = Sp(2n), G₂ = Spin(2n+1)`), with the Weyl group order prime to `p=char(k)`. In addition require `j_*` to identify `X_{1,*}⊗ℤ_(p)` with `X_{2,*}⊗ℤ_(p)`, so both `j_*` and its inverse are integral at `p`. Equivalently the two lattice indices in their common rational space are prime to `p` (Ngô §§1.12.5–1.12.6). Fix unramified Haar measures on the groups and compatible centralizer measures under this localized-lattice identification. Then for regular semisimple `a₁ ∈ 𝔠₁(𝒪)` and `a₂ = j(a₁) ∈ 𝔠₂(𝒪)` corresponding under the induced isomorphism of Chevalley quotients `𝔠₁ ≅ 𝔠₂` (over `𝒪` after the identification of `𝔱₁` and `𝔱₂` given by `j_*`), `SO_{a₁}(1_{𝔤₁(𝒪)}) = SO_{a₂}(1_{𝔤₂(𝒪)})` (Ngô Théorème 2; Théorème 1.12.7 in equal characteristic). Its consumer in this roadmap is the twisted fundamental lemma (§4.10), where non-standard triples arise from the descent of twisted endoscopy to centralizers; it is not needed for ordinary endoscopy or for cyclic base change.

*Hypotheses.* Equal characteristic, `p=char(k)∤|W|`; a non-standard endoscopic triple `(G₁,G₂,j_*)` with `j_*:X_{1,*}⊗ℤ_(p)≅X_{2,*}⊗ℤ_(p)`, and compatible Haar measures as above.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction, Théorème 2 (p. 2); §1.12, §§1.12.5–1.12.6 and Théorème 1.12.7 (pp. 26–27); §8.8, Théorème 8.8.2 (p. 186) and §8.8.7 (p. 187); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.7 (pp. 13–15); §§3.6–3.7 (pp. 32–35); §4.10 (p. 52).)

Ngô §8.8 (Théorème 8.8.2, p. 186): the anisotropic Hitchin fibrations of `G₁` and `G₂` have isomorphic bases and their stable perverse cohomologies have isomorphic semisimplifications first on the good open by the support argument of §3.18 with `κ=1`. Apply the finite-jet and cofinite-degree globalization of §3.11a to their common integral Chevalley base, and §3.16a to recover the local stable-count identity over the original residue field (§8.8.7, p. 187). The local identity then gives the full anisotropic stable comparison by the product formula, in the order of §4.3a. Waldspurger's definition and reduction of the non-standard triples: Waldspurger 2008 §1.7 (pp. 13–15) and §3.6–3.7. The integral identification uses Ngô Lemme 1.12.6; Waldspurger §4.10 additionally requires the root and coroot scaling factors to be units in `ℤ_(p)`. The descended non-standard triples in §4.10 retain this good-prime condition as well as the sufficiently-large-characteristic bound.

**Checks.**

- For `G₁ = G₂` and `j_*` the identity the statement is a tautology with identical measures.
- For `G₁=G₂=SL₂` in odd characteristic `p`, `j_*=p·id` satisfies the rational root-data conditions and `p∤|W|=2`, but is excluded by the localized-lattice hypothesis. Its differential is zero and its inverse has denominator `p`, so it gives no integral Chevalley-quotient isomorphism.
- `G₁ = Sp(2), G₂ = Spin(3) ≅ SL₂`: the coroots are scaled by 2 and `1/2` and the identity is between stable orbital integrals of `𝔰𝔭₂ = 𝔰𝔩₂` and `𝔰𝔬₃ ≅ 𝔰𝔩₂` at matching elements.

*Needs:* §3.11a; §3.16a; §3.17; §3.15; §3.16; §3.3; §2.4.

### 4.3 The Lie-algebra fundamental lemma in equal characteristic (Ngô)

Let `k` be a finite field with `q` elements, `𝒪 = k[[ε]], F = k((ε)), G` a reductive group scheme over `𝒪` (quasi-split, split over an unramified extension) whose Weyl group order is not divisible by `char(k)`, and `(H, κ)` an unramified endoscopic datum of `G` with `H` the corresponding reductive group scheme over `𝒪`. For `a ∈ 𝔠_H(𝒪) ∩ 𝔠_H^{G-rs}(F)` (`G`-regular semisimple) with image `ν(a) ∈ 𝔠(𝒪)`, and Haar measures giving the centralizer tori compatible volumes, `Δ_G(ν(a)) O^κ_{ν(a)}(1_{𝔤(𝒪)}) = Δ_H(a) SO_a(1_{𝔥(𝒪)})`, where `1_{𝔤(𝒪)}, 1_{𝔥(𝒪)}` are the characteristic functions of the integral points of the Lie algebras, `O^κ` is the `κ`-orbital integral and SO the stable orbital integral (§2.4), `Δ_G(a) = q^{−val(D_G(a))/2}` and `Δ_H(a) = q^{−val(D_H(a))/2}`; equivalently `O^κ_{ν(a)}(1_{𝔤(𝒪)}) = q^{r_{G,H}(a)} SO_a(1_{𝔥(𝒪)})` with `r_{G,H}(a)` the valuation of the relative discriminant divided by 2. This is the Langlands–Shelstad fundamental lemma for Lie algebras with the transfer factor of §2.9 normalized by taking as base point of each stable class the value of the Kostant section (§3.4), which Kottwitz showed agrees with the Langlands–Shelstad normalization for quasi-split `G` (Ngô §1.11, p. 23). The characteristic hypothesis is `char(k) ∤ |W|` (Ngô, arXiv v3, Théorème 1); the separate characteristic-transfer theorem below has its own stronger large-`p` bound.

*Hypotheses.* `k` finite, `char(k) ∤ |W|`; `G, H` unramified over `𝒪 = k[[ε]]` with an unramified endoscopic datum; a `G`-regular semisimple.

([Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction, Théorème 1 (p. 1); §1.11, Théorème 1.11.1 and §1.11.3 (pp. 23–24); §8.6, §§8.6.1–8.6.8 (pp. 182–185), and Corollaire 8.1.14 (p. 161); [T. C. Hales — A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), §6.1, Conjecture 6.1 (PDF p. 10); §7.2 (PDF p. 12).)

First apply central quotients and Levi descent until the relevant local centres have no split subtori (Ngô §8.6.1). Use §3.11a's uniform finite-jet order `N`, not an exact formal germ. Choose the marked curve and sufficiently positive square twist with `deg D>rN+2g` and `δ_H(a_H)<δ_H^bad(D)`. For every sufficiently large `m`, its pointed jet slice supplies a `k_m`-point in `Ã_H^good`, transverse away from `v`, with the same local jet. Preliminary stabilization on that good open (§3.18) and the product count (§3.16) give the global identity over `k_m`. At every place other than `v`, use the nonzero transverse local comparison of Ngô Lemme 8.5.7, retaining the actual model-volume factors at auxiliary level places. Cancel these factors and use the Frobenius-equivariant local fibre and symmetry identifications to obtain the desired quotient-count identity for the original local invariant over every `k_m` with `m≥m₀`. Apply §3.16a's Frobenius-count descent, with the relative-discriminant Tate factor and the connected-group factors cleared, to recover the count over `k`. Finally §4.1 converts it to the stated orbital-integral identity, with the common centralizer measures. This is Ngô §§8.6.2–8.6.8 and Corollaire 8.1.14; full anisotropic stabilization is not an input.

**Checks.**

- Counts of `Spec k₂` and two rational points agree in even degrees but disagree in degree one; the proof therefore requires every sufficiently large degree, including odd degrees.

- For `H = G (κ = 1)` both sides are equal by definition `(r = 0)`.
- For `G = SL₂` and `H` the norm-one torus of an unramified quadratic extension: with Haar measures giving `SL₂(𝒪)` and `H(𝒪)` volume 1 and the torus quotient measure compatible, `SO_a(1_{𝔥(𝒪)})=1` and `O^κ_{ν(a)}(1_{𝔰𝔩₂(𝒪)})=q^{val(D_G(a))/2}`. Rescaling the common centralizer measure rescales both orbital integrals inversely; it does not multiply this value by the centralizer volume.
- For unitary groups the statement specializes to Laumon–Ngô's theorem (§4.4).

*Needs:* §3.11a (uniform jets and cofinite-degree globalizations); §3.16a (Frobenius-count descent); §3.18; §3.16; §3.17; §3.4; §4.1; §2.9; §2.4; §1.4; `TauCetiRoadmap.AlgebraicCurves` Layer 5 (consequences of Riemann–Roch, and local components); `TauCetiRoadmap.AlgebraicCurves` Layer 4 (repartitions, Weil differentials, and Riemann–Roch).

### 4.3a Full anisotropic geometric stabilization

Under the endoscopic Hitchin hypotheses of §3.18, extend its graded perverse comparison to the entire common anisotropic base `Ã_H^ani∩ν⁻¹(Ã^ani)`, including the `H`-bad complement. The semisimplified `κ`-part of the `G` direct image, pulled back with shift `[2r_{G,H}(D)]` and twist `(r_{G,H}(D))`, equals the stable `H` direct image. Retain the square twist, sufficiently positive degree, characteristic and finite-stabilizer hypotheses of §§3.12 and 3.15. ([Ngô, arXiv v3](https://arxiv.org/abs/0801.0446v3), Théorème 6.4.3, p. 120, and §8.7, p. 185.)

Apply the local fundamental lemma of §4.3 at every singular place in the product formula, over every finite residue extension. This gives equality of global traces on the whole common anisotropic base. Purity separates the graded weights, and the trace-recognition argument of §3.18 identifies the semisimplified graded perverse sheaves. Thus the full comparison follows from the local identity after the good-open comparison has supplied its proof.

**Checks.**

- For `H=G, κ=1`, the comparison is the identity and the shift and twist vanish.
- A point in the `H`-bad complement is covered by this theorem through the local fundamental lemma, not by an application of the good-open support theorem there.
- For `SL₂` and its elliptic norm-one torus, `r_{G,H}(D)=deg D`; the comparison retains shift `2 deg D` and twist `deg D` at every common anisotropic point.

*Needs:* §4.3; §3.18 (pure trace recognition); §3.16; §3.15.

### 4.3b The weighted Lie-algebra fundamental lemma in equal characteristic (Chaudouard–Laumon)

Let `G` be a split connected reductive group over `𝔽_q` with `|W|` invertible in `𝔽_q`, `T⊂M` a split maximal torus and a Levi subgroup containing it, `K=𝔽_q((ε))` and `𝒪=𝔽_q[[ε]]`. For `G`-regular semisimple `X∈𝔪(K)` with centralizer torus `J_X`, Arthur's weighted orbital integral is `J^G_M(X)=|D^G(X)|^{1/2}∫_{J_X(K)\G(K)} 1_{𝔤(𝒪)}(Ad(g⁻¹)X) v^G_M(g) dg` with Arthur's left `M(K)`-invariant weight `v^G_M` and the quotient measure (Chaudouard–Laumon II, §1.4, pp. 2–3). For `s∈T̂` with `M̂′=Z_{M̂}(s)°` having the same connected centre as `M̂`, `M′≠M`, let `M′` be the dual split group, `Δ_{M′,M}` the Lie-algebra transfer factor, `J^G_{M′,M}(Y)=Σ_X Δ_{M′,M}(Y,X)J^G_M(X)` the endoscopic combination over `M(K)`-classes, `E(s)` the finite set of connected reductive `Ĥ⊂Ĝ` cut out by central elements as in the source, and `S^H_{M′}(Y)` the stable avatars defined by the recursion `S^H_{M′}(Y)=J^H_{M′,M′}(Y)−Σ_{s′∈Z_{M̂′}/Z_{Ĥ}, s′≠1}|Z_{Ĥ_{s′}}/Z_{Ĥ}|⁻¹S^{H_{s′}}_{M′}(Y)` (§1.4, p. 3). Prove, for every `G`-regular semisimple `Y∈𝔪′(K)`, `J^G_{M′,M}(Y)=Σ_{s′∈Z_{M̂}/Z_{Ĝ}}|Z_{Ĝ_{s′}}/Z_{Ĝ}|⁻¹S^{G_{s′}}_{M′}(Y)`, the sum running over the `s′` elliptic in `Ĝ` (Théorème 1.4.1, p. 4). The route is the cohomological comparison of §3.18b: the global weighted form over a curve (CL II §15), the `s`-decomposition and two Frobenius-trace computations (§§11–14), the passage from global to local by truncated affine Springer fibres (§§17–18) and the conclusion (§19).

Extend, as separate targets by the same route, to unramified quasi-split `G` with the Out-torsor-twisted Hitchin fibration of §3.3 in place of the split one, and to the nonstandard weighted identities between the weighted stable avatars of two groups with isogenous root data as in §4.2, which the twisted reduction of §4.10b consumes. The published text treats split groups and states that the general and nonstandard cases follow by the same methods (CL II §1.2, p. 2); here they are targets with that route, not citations.

*Hypotheses.* Equal characteristic; `char 𝔽_q∤|W|`; `G` split (or unramified quasi-split for the extension); `M′≠M` with equal connected centres; `Y` `G`-regular semisimple.

([P.-H. Chaudouard and G. Laumon — Le lemme fondamental pondéré. II. Énoncés cohomologiques](https://arxiv.org/abs/0912.4512v1), §1.2, p. 2; §1.4, Théorème 1.4.1, pp. 2–4; §§11–19, from p. 60.)

**Checks.**

- For `M=G` the weight is 1, `J^G_{G′,G}` is the `κ`-orbital integral of the unit and the identity is the Lie-algebra fundamental lemma of §4.3, with the same transfer factor and discriminant normalization.
- For a maximal torus `M=T` of a split group every `s` has `M̂′=T̂=M̂`, so the condition `M′≠M` fails and the theorem asserts nothing; the weighted identities for torus Levis carry no endoscopic content.
- The recursion defining `S^H_{M′}` has finite support, and for `H=M′` (no proper `s′`) gives `S^{M′}_{M′}=J^{M′}_{M′,M′}`, the ordinary stable weighted term of `M′` itself; a definition without the subtracted terms would make the right side of the theorem a plain endoscopic sum, which is not the statement.

*Needs:* §3.18a; §3.18b; §4.1 (point counts as orbital integrals); §4.3; §4.2; §3.3 (twisted quotient for the quasi-split extension); §2.9 (transfer factors on Lie algebras); `TauCetiRoadmap.AutomorphicSpectralTheory` AS.6.10.

### 4.4 The fundamental lemma for unitary Lie algebras (Laumon–Ngô)

Let `F` be a finite extension of `𝔽_p((t)), k` its residue field of order `q, F′/F` unramified quadratic and `p>n, p≠2`. Take the hyperspecial quasi-split `U(n)` and `H=U(n₁)×U(n₂), n₁,n₂>0`. In the anisotropic integral regular-semisimple situation of Laumon–Ngô §1.1, pp. 4–5, write the characteristic algebra as `∏_{i∈I}E′_i`, with `E_i/F` separable and disjoint from `F′`, integral anti-Hermitian generators and pairwise coprime minimal polynomials. The partition `I=I₁`⊔`I₂` gives `n₁,n₂` and `κ`. Define `Λ_J=ker[(ℤ/2)^J→ℤ/2]` and `λ⁰_J` by the self-dual lattice base point of their §1.4, pp. 8–9. With unit-volume compact measures, use the sum `O^κ_γ=Σ_{λ∈Λ_I}κ(λ−(λ⁰_{I₁},λ⁰_{I₂}))O^λ_γ`, exactly their base-point convention. Then `O^κ_γ=(−1)^r q^r SO^H_γ`, where `r` is the valuation of the cross-block resultant (Theorem 1.5.1, p. 10). General regular-semisimple elements follow from the reductions in §4.3; the characteristic-zero consequence uses §4.5. These are the inputs used by Shin and Liu–Tian–Xiao–Zhang–Zhu.

*Hypotheses.* `F` of equal characteristic `p` with `char(k) > n`; `F′/F` unramified quadratic, residue characteristic `≠ 2`.

([G. Laumon and B. C. Ngô — Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), Abstract and §0.1 (PDF pp. 1–2); §1.1 (PDF pp. 4–5); §1.5, Théorème 1.5.1 (PDF p. 10); [Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §D.2, Lemma D.2.2 and its proof (p. 369).)

Laumon–Ngô prove this by equivariant localization on the unitary Hitchin fibration. Their Lemma 1.4.3, pp. 8–9, gives `κ(λ⁰_I−(λ⁰_{I₁},λ⁰_{I₂}))=(−1)^r`. Consequently the sum based at `λ⁰_I`, which corresponds to the Kostant base point, is `(−1)^r` times their displayed sum and satisfies `O^{κ,Kostant}_γ=q^r SO^H_γ` as in §4.3. Equivalently, moving `(−1)^r q^r` to the left yields their Langlands–Shelstad factor (Theorem 1.5.1 and the following discussion, p. 10). This change of base point is necessary when comparing with §2.12's nice-pair factor. For `U(n), char(k)∤n`! is `char(k)>n`; residue characteristic 2 remains excluded here. Transfer to characteristic 0 uses §§4.5–4.6.

**Checks.**

- For `n=2, n₁=n₂=1` and the two compact torus measures of volume 1, `SO^H_γ=1`. The Laumon–Ngô sum is `(−q)^r`, whereas the Kostant-based sum is `q^r`; `r=1` distinguishes their signs.
- For `n₂=0` the partition is excluded here. Its `κ` is trivial, so `O^κ=SO` is the stable sum, which need not equal one ordinary orbital integral when a stable class has several rational classes.

*Needs:* §4.3; §2.12; §1.8.

### 4.5 Change of characteristic for orbital integrals and the fundamental lemma

Fix a finite field `𝔽_q` of characteristic `p` and let `CL_q` be the set of nonarchimedean local fields with residue field `𝔽_q` (of characteristic 0 or `p`). Fix the root datum of a connected reductive group with an action of the tame Galois group `Θ ⋉ I` (independent of `F ∈ CL_q`) and an endoscopic triple, both tamely ramified. Assume `p` is large relative to the rank of `G` (Waldspurger's standing hypothesis; this bound is separate from and in general stronger than `p ∤ |W|`). Then: `(a)` orbital integrals of the functions attached to Moy–Prasad lattices (the space `S` of the source) depend on `F` only through `𝔽_q`: there are linear forms `J^D(z, δ, ·)` on `S`, indexed by `F`-independent replacements `z` of stable classes and cohomological data `δ`, with `J_{G^D}(X, rea_F(φ)) = J^D(z, δ, φ)` for every `F ∈ CL_q` (Théorème 7.2); `(b)` if `rea_{H,F}(φ_H)` is a transfer of `rea_F(φ)` for one `F ∈ CL_q`, then `rea_{H,F′}(φ_H)` is a transfer of `rea_{F′}(φ)` for every `F′ ∈ CL_q` (Corollaire 9.2); `(c)` in the unramified case, the Lie-algebra fundamental lemma holds over `F` if and only if it holds over `F′` (Corollaire 9.3). Combined with §4.3, the Lie-algebra fundamental lemma holds for unramified data over every `p`-adic field of characteristic 0 whose residue characteristic `p` is large relative to G.

*Hypotheses.* `p` large relative to the rank of `G` (Waldspurger's hypothesis); `G` and the endoscopic datum tamely ramified (unramified for `(c)`).

([J.-L. Waldspurger — Endoscopie et changement de caractéristique](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf), Introduction (pp. 1–5); §7, Théorème 7.2 (p. 62); §9, Corollaire 9.2 (p. 70) and Corollaire 9.3 (p. 71); [Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction (p. 2).)

Translate stable classes, Moy–Prasad lattices and the tame Galois group into `F`-independent data (Waldspurger 2006, Introduction and §§1–6), using DeBacker's parametrization of nilpotent orbits and homogeneity of germs (§2.6). `(a)` Théorème 7.2 (p. 62); `(b)` Corollaire 9.2 (p. 70); `(c)` Corollaire 9.3 (p. 71), applying `(b)` to the unit functions of the hyperspecial lattices. Close local fields (Deligne, Kazhdan) are the classical form of the same principle; the source's route is the `F`-independent description above.

**Checks.**

- For `G = T` a torus the forms `J^D` are evaluations and the statements are trivial.
- For `G = SL₂` and its elliptic torus data, the `κ`-orbital integrals of the unit function computed over `𝔽_q((t))` and over the unramified extension of `ℚ_p` of residue field `𝔽_q` agree for `p` large.

*Needs:* §2.1; §2.6; §2.9; §2.11; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.3.6 (Moy–Prasad filtrations); §4.3.

### 4.5a Change of characteristic for weighted orbital integrals and the weighted fundamental lemma

Fix `𝔽_q` of characteristic `p`, the set `CL_q` of §4.5, a root datum `D` with an action of the tame Galois group `Γ=Θ⋉I`, with `p` large relative to `D` in the sense of Waldspurger 2006 §1.4 (the condition written `(P_{rang(D)})` there), a Levi datum `D_M` of `D`, and over each `F∈CL_q` the resulting unramified groups `M⊂G`. Prove: `(a)` for every `z` in the `F`-independent set `Z^{G-reg}_M` of `G`-regular Levi parameters and every `δ` in its finite group `D_z`, there is a linear form `J^G_M(z,δ,·)` on the Moy–Prasad function space `S` such that `J^G_M(X,rea_F(φ))=J^G_M(z,δ,φ)` for every `F∈CL_q`, every `X∈𝔪(F)` with parameters `(z,δ)` and every `φ∈S` (Waldspurger 2009, §7.3, Théorème, p. 1812); `(b)` for an unramified elliptic endoscopic datum `(D_{M′},η,s)` of `D_M`, the Lie-algebra weighted fundamental lemma `(LFP)_F` for the unit functions, `r^G_{M′,F}=Σ_{s′} i_{M′}(G,G(s′)) s^{G(s′)}_{M′,F}`, holds over one `F∈CL_q` if and only if it holds over every `F′∈CL_q` (§8.7, Théorème, p. 1817). Combined with §4.3b, the weighted Lie-algebra identity holds for unramified data over every `p`-adic field of characteristic 0 whose residue characteristic is large relative to D.

*Hypotheses.* `p` large relative to `D` (Waldspurger's hypothesis, stronger than `p∤|W|`); `D` and `D_{M′}` unramified for `(b)`.

([J.-L. Waldspurger — Endoscopie et changement de caractéristique : intégrales orbitales pondérées](https://www.numdam.org/item/AIF_2009__59_5_1753_0.pdf), Introduction, pp. 1753–1755; §1.1, p. 1757; §7.3, Théorème, p. 1812; §8.6, Lemme, p. 1816; §8.7, Théorème, p. 1817.)

The route extends §4.5: translate the Levi, the weight and the `(G,M)`-families into `F`-independent data (§§4–6 of the source), prove the `F`-independence of the weighted orbital integrals of Moy–Prasad functions by the induction on the datum of §7, then compare the recursively defined stable avatars over `F` with the `F`-independent ones (§8.6) and conclude (§8.7).

**Checks.**

- For `M=G` the weight is trivial and `(a)` is Théorème 7.2 of §4.5; `(b)` is Corollaire 9.3 of §4.5.
- For a torus `G=T` the forms `J^T_T(z,δ,·)` are evaluations and both statements are trivial.
- The stable avatars `s^G_{M,F}` are defined over each `F` by the recursion of §4.3b; `(b)` uses that this recursion commutes with the parameter maps `ζ_F` (Lemme 8.6). A definition of the stable avatar that depended on `F` beyond `ζ_F` would break `(b)`.

*Needs:* §4.5; §4.3b; §2.1; §2.6; §2.9; §2.11; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.3.6 (Moy–Prasad filtrations); `TauCetiRoadmap.AutomorphicSpectralTheory` AS.6.10.

### 4.6 The fundamental lemma for groups and for spherical Hecke algebras

Let `F` be a `p`-adic field of characteristic 0, `G` a connected reductive group over `F`, unramified with hyperspecial subgroup `K = G(𝒪), (H, ℋ, s, ξ)` an unramified endoscopic datum with `z`-pair, hyperspecial `K_H ⊆ H(F)`, and `Δ₀` the unramified normalization of the transfer factor (§2.5, normalized as in Hales and Waldspurger). If `p` is large relative to `G` (Waldspurger's hypotheses of 2008 §4.4), then: `(a)` (unit elements) the characteristic function `1_{K_H}`, suitably normalized for the `z`-pair and Haar measures giving `K` and `K_H` volume 1, is a transfer of `1_K: SO_{γ_H}(1_{K_H}) = Σ_δ Δ₀(γ_H, δ) O_δ(1_K)` for every strongly `G`-regular `γ_H`; `(b)` (spherical Hecke algebra) for every `f` in the spherical Hecke algebra `ℋ(G(F), K)`, the function `b(f) ∈ ℋ(H(F), K_H)` obtained from the `L`-embedding `ξ` through the Satake isomorphisms is a transfer of `f`. `(a)` follows from the Lie-algebra fundamental lemmas for the descended data of all semisimple centralizers (§4.5 and §4.3) by semisimple descent (Waldspurger 2008 Théorème 4.11 specialised to `θ = 1`, where the non-standard triples are trivial); `(b)` follows from `(a)` by Hales' reduction to unit elements.

*Hypotheses.* `F p`-adic of characteristic 0, residue characteristic `p` large relative to `G`; `G, H` unramified with hyperspecial subgroups; unramified endoscopic datum.

([J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §§4.4–4.11 (pp. 48–52) and §5 (pp. 53–73), Théorème 4.11; [T. C. Hales — A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), Conjecture 6.1 (PDF p. 10) and Remark 9.3 (PDF p. 16); [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.4 and Remark 3.4 (p. 15).)

`(a)` Waldspurger 2008 §§4.4–4.11 and §5 with `θ = 1` and `ω = 1`: descent of stable and `κ`-orbital integrals of the unit function to centralizers of topologically semisimple elements (§§5.2–5.8), equality of unramified transfer factors after descent (§§5.10–5.11), and the Lie-algebra fundamental lemma for each descended datum. `(b)` Hales, 'On the fundamental lemma for standard endoscopy: reduction to unit elements', Canad. J. Math. 47 (1995) (as recalled by Hales 2003 Remark 9.3 and by Shin §3.4, p. 15). Satake isomorphism and the map `b`: SmoothRepresentationsOfLocalGroups §SR.4.1 (The Satake transform and isomorphism) (with its unitary normalizations) and ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 (dual groups and `L`-groups).

**Checks.**

- For `H = G (s = 1), b` is the identity and `(a)`–`(b)` are tautologies.
- For the elliptic ordinary data of `GL_n` only `H=G` occurs and `b` is the identity. Nonelliptic Levi data instead use the constant-term map and its Satake description; they are not instances of `H=G`.
- The proof uses Waldspurger's bound on the residue characteristic (2008 §4.4, (H1), and the change of characteristic); the hypothesis `p ∤ |W|` of the equal-characteristic theorem does not by itself give the statement over `p`-adic fields.

*Needs:* §4.3; §4.5; §2.5; §2.7; §2.11; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.3.3 (Bruhat–Tits and parahoric group schemes); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.4.1 (The Satake transform and isomorphism); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.1.1 (Functions, measures and convolution).

### 4.7 Existence of smooth transfer (Waldspurger)

Let `F` be a local field of characteristic 0, `G` connected reductive over `F, (H, ℋ, s, ξ)` an endoscopic datum with `z`-pair `(H₁, λ₁)` and `Δ` an absolute transfer factor. Then every `f ∈ C_c^∞(G(F))` has a transfer `f^{H₁} ∈ C₁^∞(H₁(F))` (§2.11). At archimedean `F` this is Shelstad's theorem (§2.14). For `F p`-adic, Waldspurger proved that the Lie-algebra fundamental lemma for unramified data over all `p`-adic fields of sufficiently large residue characteristic implies Lie-algebra transfer for every `p`-adic `F` of characteristic 0 (through a global argument with an auxiliary place, the compatibility of transfer with Fourier transform and the germ expansion, which remove any restriction on the residue characteristic of `F` itself), and the group transfer follows by semisimple descent and the local gluing lemma; with §4.6 (unconditional by Ngô and Waldspurger) transfer is unconditional. In particular transfer exists between a connected reductive group and its quasi-split inner form (Waldspurger 1997, Corollaire 1.7).

*Hypotheses.* `F` local of characteristic 0 (any residue characteristic); an endoscopic datum with `z`-pair.

([J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.3, before Théorème 3.3.1 (p. 78); [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Introduction (p. 2); §3.4 (p. 15); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §2.2 (pp. 19–21); §2.3 (p. 21); [J. Arthur — An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §27 (pp. 192–204).)

Lie algebra: Waldspurger 1997 (its main theorem and Corollary 1.7 are recalled by Labesse §3.3 and Shin §3.4): the Fourier-transform compatibility (§2.13), homogeneity of germs (§2.6), and a global argument choosing a number field and an auxiliary place where the fundamental lemma holds for large residue characteristic (§4.5). Group: descend near each semisimple element to the Lie algebra of its centralizer (§2.7 `(e)`) and glue local transfers by Waldspurger 2008 §2.2 (lemma after Langlands–Shelstad 2.2.A). Archimedean: §2.14.

**Checks.**

- For the principal datum of quasi-split `G` the identity function transfer is valid.
- For `SL₂` and the elliptic torus data, transfer exists for every `f`, matching `κ`-orbital integrals with orbital integrals on the torus times transfer factors.

*Needs:* §4.6; §4.5; §2.13; §2.6; §2.7; §2.11; §2.14; `TauCetiRoadmap.Chebotarev` Layer 10 (Dirichlet-density Chebotarev).

### 4.7a Jacquet–Langlands for essentially square-integrable representations

For `D/F` a central division algebra of index `d` and `n=rd`, classical JL is a bijection from essentially square-integrable irreducible `GL_r(D)` representations to essentially square-integrable `GL_n(F)` representations, characterized by `Θ_{JL(π′)}(g)=(−1)^{n−r}Θ_{π′}(g′)` on corresponding regular semisimple classes whose characteristic polynomials agree. In particular it has this identity on matched elliptic classes. It commutes with central-character twists. For `r=1,d=n` this is the division-algebra correspondence used by the local tower argument; existence is independent of the LLC constructed here.

*Hypotheses.* `F` is a finite extension of `ℚ_p, r≥1` and `d≥1`. Characters are the locally integrable Harish-Chandra functions; the normalization fixes maximal compact volumes. The theorem is the all-`r,D` classical correspondence, with its fixed central character and elliptic normalization.

([Alexandru Ioan Badulescu — Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), §3.1, p.13; [Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definition before Corollary 11.3, p.29.)

Use §2.16’s untwisted character theorem and its elliptic orthogonality. Use the classical Deligne–Kazhdan–Vignéras theorem, as restated with this sign and matching in Badulescu §3.1. Its proof is not replaced by Scholze’s rank-one-division tower comparison. For the classical trace-comparison proof, globalize the division algebra and discrete-series data with auxiliary elliptic places. Compare the simple trace formulas for the split and inner general linear groups on matching elliptic tests; elliptic character orthogonality isolates each local discrete-series character and its sign. Reverse the comparison to obtain exhaustion and apply character independence for uniqueness. This is the Deligne–Kazhdan–Vignéras classical argument cited in Badulescu §3.1, p. 13; it precedes the unitary globalization and local-tower arguments here.

**Checks.**

- For a quaternion division algebra and `n=2,r=1`, the transfer of its trivial representation is unitary `St₂` and the character sign is `−1`.
- For `d=1, n=r` and the correspondence and character sign are the identity and `+1`.
- Twisting `π′` by `χ∘`Nrd twists `JL(π′)` by `χ∘det` and preserves the matching character identity.

*Needs:* §2.16 (characters and elliptic orthogonality); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §§SR.2–SR.3 (representations of `GL_r(D)`, induction and discrete series).

### 4.8 Transfer between inner forms of `GL_n` and quaternionic matching

Let `F` be a nonarchimedean local field of characteristic zero, `D` a central division algebra of degree `d, m≥1` and `n=md`. Put `G=GL_m(D), G*=GL_n(F)` and `e(G)=(−1)^{n−m}`. Match regular semisimple elements by their reduced characteristic polynomials and transport measures on the corresponding centralizer tori. For every compactly supported smooth `f` on `G` there is an associated `f*` on `G*` with `O_{γ*}(f*)=O_γ(f)` on matching regular classes and zero on classes with no inner-form match. The regular transfer factor for the principal datum is one. The tempered Jacquet–Langlands injection `π↦JL(π)` is instead characterized by `Θ_{JL(π)}(γ*)=e(G)Θ_π(γ)`, and associated functions satisfy `tr JL(π)(f*)=e(G)tr π(f)`. Split tempered representations outside the image have trace zero on `f*`.

These are two different occurrences of normalization. If one defines a signed transferred test `f†=e(G)f*`, then its matching orbital integral is `e(G)O_γ(f)`, and its trace on `JL(π)` is `tr π(f)`, since `e(G)²=1`. Any use of signed matching must transport the trace identity by this conversion. For singular semisimple matching in the associated convention the orbital factor is `e(G_γ)`, the sign of the centralizer, which equals one for regular tori; it is not uniformly `e(G)`.

([J. Cohen — Transfer of representations and orbital integrals for inner forms of GL_n](https://doi.org/10.4153/CJM-2017-017-5), §8.1, Definition 8.1 and Lemma 8.2, pp. 615–617; Theorem 8.3 and its transfer-existence input, p. 617; [J. Arthur — An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §25, Theorem 25.1, p. 168.)

Use §4.7a’s classical essentially square-integrable character relation and normalized parabolic induction to obtain the tempered injection. Weyl integration combines character signs with the unsigned regular orbital equality and gives the trace identity. For existence, prescribe the inner-form orbital-integral function on the matching regular set and zero on the nonmatching set. Harish-Chandra descent and the Shalika-germ expansions give its local germ conditions near each semisimple class; the inner-form comparison identifies the coefficients of the matching nilpotent germs. The characterization of orbital integrals then produces `f*` with these germs and compact support modulo conjugation. This is the Deligne–Kazhdan–Vignéras Theorem B.2.c.1 used in Cohen Theorem 8.3, p. 617; the descent and germ comparison also give the stated singular factor. Equality of traces on all tempered characters and Kazhdan density then identifies the transfer modulo zero regular orbital integrals. Whole-group Haar measures and centralizer measures are specified separately; assigning volume one to both maximal compact subgroups need not be transfer of invariant differentials.

**Checks.**

- For quaternion `D` and `m=1, e=−1`. With `f=1_{𝒪_D×}`, normalize its volume to one. Then `tr 1_{D×}(f)=1` and `tr St₂(f*)=−1`, while matching regular elliptic orbital integrals have equal values. The signed test `f†=−f*` has Steinberg trace `+1`.
- For `D=F, m=n` and `e=1`, take `f*=f`; both orbital and trace identities are ordinary equality.
- A split regular `GL₂` element has no `D×` match, so `O_{γ*}(f*)=0`. This excludes using the `GL₂` spherical unit as an associated function at a division place.
- At a central scalar in `D×`, the centralizer is `D×` itself and the singular associated factor is `−1`, while it is `+1` at every regular elliptic class. A constant factor `−1` on all orbital classes conflates these cases.

*Needs:* §4.7a; §4.7; §1.13; §1.6; §2.11; §2.3; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.3 (Tempered representations and the conditional Langlands classification); §2.16 (characters and Weyl integration).

### 4.9 Stable base change: fundamental lemma, transfer and identity terms

Let `E/F` be a cyclic extension of local fields of characteristic 0 of degree `ℓ` with generator `θ` of `Gal(E/F), G₀` a connected reductive group over `F, G = R_{E/F}G₀` with the automorphism `θ`, and `H` the quasi-split inner form of `G₀` (cyclic stable base change, the twisted datum with `s = 1` and `ω = 1`). `(a)` (Unit elements; Kottwitz) If `E/F` is unramified, `G₀` is unramified and `K_E = G₀(𝒪_E), K = G₀(𝒪_F)` are hyperspecial with volume 1, then `1_{K_E}` and `1_K` have matching (twisted stable / stable) orbital integrals: `SO_γ(1_K) = SO^θ_δ(1_{K_E})` when `γ` is a norm of `δ`, and `SO_γ(1_K) = 0` when `γ` is not a norm. `(b)` (Spherical Hecke algebra; Clozel, Labesse) More generally, for every `f_E ∈ ℋ(G₀(E), K_E)` and its base-change image `b_{E/F}(f_E) ∈ ℋ(G₀(F), K)`, the functions `f_E` and `b_{E/F}(f_E)` are associated (Labesse Proposition 3.7.3, with the vanishing at non-norms of Proposition 3.7.2). `(c)` (Transfer) For `F` nonarchimedean, every `f_E ∈ C_c^∞(G₀(E))` has an associated `f ∈ C_c^∞(H(F))` (Labesse Théorème 3.3.1, from Waldspurger's inner-form transfer and descent); for `F` archimedean, `K`-finite transfer exists (Labesse §3.5). `(d)` (Identity terms) If `f_E` and `f` are associated then `∫_{G₀(E)} f_E = ∫_{H(F)} f` for compatible measures (Labesse Lemme 3.2.2). `(e)` Only the standard Lie-algebra fundamental lemma enters: in Waldspurger's twisted reduction the non-standard triples arising for base change are tautological (Waldspurger 2008, §§1.9 and 4.12 and the corollary for `G₀ = U(n)` or `SL(n)`, using Laumon–Ngô). This is the finite-place twisted input of the simple twisted unitary trace formula.

*Hypotheses.* `E/F` cyclic, characteristic 0; for `(a)`–`(b): E/F` unramified, `G₀` unramified with hyperspecial subgroups.

([R. E. Kottwitz — Base change for unit elements of Hecke algebras](https://www.numdam.org/item/CM_1986__60_2_237_0.pdf), Introduction (pp. 237–239); §1, Theorem (p. 243); §4 (p. 249); [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.2, Lemme 3.2.2 (p. 76); §3.3, Théorème 3.3.1 (p. 78); §3.5 (pp. 82–87); §3.7, Propositions 3.7.2 and 3.7.3 (pp. 91–92); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), Introduction (pp. 3–4); §1.9 (p. 16); §4.12 (p. 53); [Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §D.1 (p. 367: association in Labesse's sense); §D.2, Lemma D.2.2 and its proof (p. 369).)

`(a)` Kottwitz, 'Base change for unit elements of Hecke algebras' (1986): the norm correspondence `γ ↔ δ` induces a bijection between classes contributing to the two unit-function orbital integrals, with equal integrals (Theorem of §1, p. 243), for `G_der` simply connected and in general by an unramified `z`-extension (§4). `(b)` Labesse Propositions 3.7.2–3.7.3 (pp. 91–92), citing Clozel and Labesse 1990 for the compatibility of stable orbital integrals with the norm on the whole Hecke algebra, and correcting the vanishing argument at non-norms (Remarque after 3.7.2). `(c)` Labesse Théorème 3.3.1 (p. 78) and §3.5; `(d)` Lemme 3.2.2 (p. 76) via the Weyl integration formula. `(e)` Waldspurger 2008 Introduction (base-change corollaries), §1.9 (p. 16) and §4.12 (p. 53).

**Checks.**

- `G₀ = GL₁`: the norm map `E^× → F^×` and the statement that `1_{𝒪_E^×}` and `1_{𝒪_F^×}` match for `E/F` unramified (the norm maps `𝒪_E^×` onto `𝒪_F^×`).
- `G₀ = GL_n`, unit elements: Kottwitz's earlier Lemma 8.8 already gives the matching (cited in his 1986 introduction).

*Needs:* §1.16; §2.8; §2.11; §4.6; §4.7; §4.4; §2.14; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.4.1 (The Satake transform and isomorphism).

### 4.9a Nonstandard smooth transfer and Fourier compatibility

**Nonstandard smooth transfer.** Let `F/ℚ_p` be finite, with no restriction on `p`, and let `(G₁,G₂,j_*)` be a nonstandard endoscopic triple of quasi-split semisimple simply connected `F`-groups as in Waldspurger §1.7. Match regular semisimple stable classes by the induced map of Cartan Lie algebras. With the compatible centralizer measures of Waldspurger §3.10, for every `f₂∈C_c^∞(𝔤₂(F))` there is `f₁∈C_c^∞(𝔤₁(F))` such that `SO_{X₁}(f₁)=SO_{X₂}(f₂)` on every matched regular pair; the transfer factor is 1. Reversing the triple gives the inverse on stable orbital quotients. Fix a common additive character and invariant forms related by `B₁(X,Y)=B₂(j_*X,j_*Y)` on matching Cartans, and use their self-dual additive measures. In these compatible nonstandard Fourier conventions transfer commutes with Fourier transform. The theorem includes the non-tautological `B_n/C_n`, `F₄` and `G₂` triples and restriction of scalars.

([J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.7, pp. 13–15, and §3.10, pp. 39–41; [J.-L. Waldspurger — Stabilisation de la formule des traces tordue I : endoscopie tordue sur un corps local](https://webusers.imj-prg.fr/~jean-loup.waldspurger/stabilisationIfinal.pdf), §4.10(5), pp. 78–79.)

The interface is nonstandard smooth transfer, its inverse on stable orbital quotients, and its Fourier compatibility, with the measures and forms just fixed. Extend the fundamental-lemma-to-transfer argument of §4.7 to these triples: use the common Weyl-invariant Cartan space for descent, stable rather than character-weighted germ sums, and factor 1. Transport the invariant form through `j_*`; the nonstandard Fourier comparison replaces the ordinary endoscopic comparison of §2.13(b). The global Poisson comparison uses §4.2 and change of characteristic at good unramified auxiliary places to establish the Fourier identity, while the prescribed place may have any residue characteristic. Descent in semisimple centralizers, homogeneity of stable germs and local gluing then give matching for arbitrary compactly supported smooth tests. Apply the same argument to the inverse triple. The auxiliary good-prime condition controls lattice unit identities there; it imposes no lattice-integrality condition on `j_*` at the prescribed characteristic-zero place. This is the stable-quotient isomorphism and Fourier compatibility recorded in Waldspurger I §4.10(5), distinct from the unit-function identity of §4.2.

**Checks.**

- For `G₁=G₂` and `j_*=id`, take `f₁=f₂`; transfer and Fourier compatibility are identities.
- For `Sp₆/Spin₇`, transfer is required for every test, including characteristic functions of small translated lattices. Equality for the two hyperspecial lattice units alone supplies none of these additional tests.
- Over `ℚ₂`, the smooth-transfer assertion still applies to a nonstandard triple; the good-prime integral-lattice identity of §4.2 cannot be invoked at that place. Its use is at good auxiliary places.
- The `F₄` and `G₂` root-length comparisons are included even though they are not ordinary endoscopic data; §2.13(b) alone does not cover them.

*Needs:* §4.2; §4.5; §2.6; §2.13; §4.7 (the descent, germ and global Poisson argument).

### 4.10 The twisted fundamental lemma and twisted transfer

Let `F` be a `p`-adic field of characteristic 0, `(G, θ, ω)` a twisted triple with `θ` quasi-semisimple and `(H, ℋ, s, ξ)` a twisted endoscopic datum with `z`-pair (§1.4, §1.7), with the corrected twisted transfer factors of §2.8. `(a)` (Waldspurger, Théorème 1.8) If, for all data obtained by descent to semisimple centralizers, Lie-algebra transfer holds for the ordinary data and non-standard transfer holds for the non-standard triples, then twisted transfer exists: every `f ∈ C_c^∞(G(F))` has a twisted transfer to `H₁`. `(b)` (Waldspurger, Théorème 4.11) Under the unramified hypotheses (§4.4, residue characteristic large), if the Lie-algebra fundamental lemma holds for the descended ordinary data and the non-standard fundamental lemma holds for the non-standard triples, then the twisted fundamental lemma holds for unit elements. `(c)` The ordinary Lie-algebra smooth transfer of §4.7 and the nonstandard smooth transfer of §4.9a supply the two all-test-function hypotheses of `(a)` over every characteristic-zero `p`-adic field. Separately, the ordinary Lie-algebra fundamental lemma (§4.3, §4.5) and the nonstandard fundamental lemma (§4.2, with its localized-lattice good-prime hypothesis and change of characteristic) supply `(b)` under its unramified large-residue-characteristic hypotheses. Thus twisted smooth transfer holds in the scope of `(a)`, and twisted unit transfer in the scope of `(b)`. `(d)` (Lemaire–Mœglin–Waldspurger) The twisted fundamental lemma for the whole spherical Hecke algebra reduces to the unit elements, hence holds. The twisted weighted fundamental lemma is the separate proof target of §11.0a.

*Hypotheses.* `F p`-adic of characteristic 0; for `(b), (d)`: unramified data and residue characteristic large, with every descended non-standard `j_*` and its inverse integral over `ℤ_(p)` as in §4.2; the corrected twisted transfer factors.

([J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), Introduction (pp. 1–4); §1.8 (p. 15); §3.11 (p. 41); §4.11 (p. 52); §5.12 (p. 71); [Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction (pp. 1–2) and §8.8 (pp. 186–187).)

`(a)` Waldspurger 2008 §§2–3, Théorème 1.8 (proof §3.11, p. 41): descent of twisted orbital integrals near `θ`-semisimple elements to Lie algebras of twisted centralizers, decomposition of stable classes (§3.8) and equality of transfer factors (§3.9). `(b)` Waldspurger 2008 §§4–5, Théorème 4.11 (proof §5.12, p. 71). `(c)` Apply §4.9a to every descended nonstandard triple and §4.7 to every descended ordinary datum for `(a)`. For `(b)`, apply Ngô’s unit identities (Théorèmes 1 and 2) and Waldspurger’s change of characteristic with the stated good-prime bounds. The nonstandard unit identity alone is not the smooth-transfer hypothesis of Theorem 1.8(e). `(d)` Use [Lemaire–Mœglin–Waldspurger, *Le lemme fondamental pour l’endoscopie tordue : réduction aux éléments unités*](https://arxiv.org/abs/1506.03383), §2.8, Theorems 1–2, p. 17, with the hypotheses of §2.1 and the reduction proved in §§3–5, pp. 21–88. Parabolic descent reduces to elliptic data. Dualize geometric transfer to tempered characters and compare it with the map obtained from Satake. The elliptic decomposition and twisted `R`-groups reduce equality of these maps to their unramified support; the unit-element equality fixes the remaining scalar. Their equality gives spherical transfer for every Hecke element. Keep the residue-characteristic restriction from the unit-element theorem.

**Checks.**

- For `θ = 1` (ordinary endoscopy) the non-standard triples are tautological and `(b)` is §4.6 `(a)`.
- For `G = GL_{2n+1}` with `θ` the transpose-inverse and `H = Sp(2n)`, descent produces the non-standard triple `(Sp(2m), SO(2m+1))`, so both the nonstandard smooth-transfer theorem in `(a)` and the nonstandard fundamental lemma in `(b)` are genuinely used.
- An arbitrary test on such a descended nonstandard Lie algebra requires §4.9a; the lattice unit identity cannot discharge its quantifier over all tests.

*Needs:* §4.2; §4.3; §4.5; §4.7; §4.9a; §2.8; §1.4; §1.7.

### 4.10a Spherical transfer in every residue characteristic

Let `F/ℚ_p` be finite, with arbitrary prime `p`. Let `G` be connected reductive and unramified, and let `(G̃,ω)` be an unramified twisted space with `G̃(F)` nonempty, twisting action of finite order on `Z(G)`, `ω` unramified and trivial on `Z(G)(F)^θ`, and a hyperspecial subspace `(K,K̃)`. For every unramified endoscopic datum, use compatible hyperspecial data, auxiliary extensions where needed, and the hyperspecial normalization of transfer factors. Prove that the Satake transfer of every spherical Hecke function is its geometric transfer: its stable orbital integral at each strongly `G̃`-regular element equals the transfer-factor-weighted sum of twisted orbital integrals. In particular `1_K̃` transfers to the hyperspecial unit of the endoscopic space. Haar measures give the hyperspecial subgroups volume 1; for other measures transport the identity with those volume factors. The ordinary theorem is the case `θ=1, ω=1`. There is no lower bound on `p`. (Lemaire–Waldspurger, arXiv:1511.08606v1, §1.1–§1.3, pp. 2–3; §4.3, pp. 45–49; Lemaire–Mœglin–Waldspurger, arXiv:1506.03383, §2.8, Theorems 1–2, p. 17.)

Construct the ordinary all-prime spherical theorem first by Hales' global reduction: globalization of the local unramified datum, local data separating orbital integrals, and the simple trace identity reduce the assertion at the prescribed place to unit matching at almost all places and induction for proper Levi data (Hales, *On the fundamental lemma for standard endoscopy: reduction to unit elements*, Theorem 6.1, p. 988, and §§3–6). The almost-all-place input follows from §4.6, without using the conclusion at the prescribed place. Construct the tempered spectral transfer and its compatibility with unramified support used in Lemaire–Mœglin–Waldspurger §§3–5 from smooth transfer and local character theory. Their reduction leaves the elliptic toral endoscopic case at the prescribed place. Prove that case by passage to the adjoint group, permutation of type-A factors, restriction of scalars and cyclic base change for PGL and then GL; track the transfer factors and volumes in every passage (Lemaire–Waldspurger §§2–4). Their §4.3 reduces the remaining identity to ordinary GL endoscopy, hence to the all-prime theorem just constructed. This supplies the missing local toral case and completes the spherical twisted theorem. None of these steps uses weighted stabilization or a classification theorem from Layer 11.

The spherical transfer interface includes the following facts.

- The ordinary Satake transfer is a linear unital homomorphism of spherical Hecke algebras. The spherical functions on a twisted space form a module: for a spherical function `h` on the group, transfer carries `h*1_K̃` to `b(h)*1_K̃_H`, with the corresponding endoscopic spherical map `b`. No algebra structure on a single twisted component is assumed.
- Parabolic descent agrees with the normalized constant terms and the corresponding Levi Satake maps; nonelliptic endoscopic data are retained.
- Changing hyperspecial choices by the permitted conjugacies transports the orbital identity and its normalization; changing Haar measures changes the idempotent by the reciprocal volume.

**Checks.**

- At `p=2`, for the unramified quadratic extension `E/ℚ₂` and the norm-one torus `U(1)`, let `ζ` lift an element of order 3 in the residue norm-one group. Its full hyperspecial subgroup `K=U(1)(ℚ₂)` has `1_K(ζ)=1`, whereas `1_{K(2^m)}(ζ)=0` for every positive `m`. Identity endoscopy gives stable and ordinary orbital integrals both 1 at `ζ`; a small-level replacement gives 0 and is not this theorem.
- At `p=3`, choose the residue norm-one element of order 4 in the unramified quadratic torus. Its lift gives the same values `1_K=1` and `1_{K(3^m)}=0`, and identity transfer gives `1=1` at the unchanged hyperspecial level.
- For the principal datum of a split torus, Satake transfer is the identity: the unit takes value 1 on `K` and 0 outside K. For arbitrary spherical `f,g`, transfer of `f+g` is the sum of the transfers; neither rescaling the unit nor replacing it by zero preserves its value 1.

*Needs:* §§4.6–4.10 (large-characteristic unit identities and all-test smooth transfer); §§2.14–2.16 (local character and real transfer theory); §§1.4, 1.7 and 2.8 (data, auxiliary extensions and factors); `TauCetiRoadmap.AutomorphicSpectralTheory` AS.6 (invariant and simple trace formulas); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.4.1 (Satake isomorphism).

### 4.10b Reduction of the twisted weighted fundamental lemma

Let `F` be a `p`-adic field of characteristic 0, `(G̃,ω,K̃)` unramified with a hyperspecial space, `M̃` a Levi space in good position relative to `K` and `M′` an elliptic unramified endoscopic datum of `M̃`, with `p>N(G)e_F+1` as in §11.0a. Prove that the twisted weighted fundamental lemma for strongly `G̃`-regular support, `r_M̃^{G̃,E}(M′,δ′,K̃)=r_M̃^{G̃}(transfer(δ′),K̃)` for `δ′` supported on strongly `G̃`-regular semisimple elements, follows from the untwisted weighted Lie-algebra fundamental lemma over `F` (§4.3b transported by §4.5a) together with its nonstandard weighted variants. The route is the weighted form of the descent of §4.10: descend both sides to the centralizers of the semisimple parts, where the twisted endoscopic situation of `G̃` becomes a product of ordinary and nonstandard endoscopic situations on Lie algebras, with the weights descending by the parabolic-descent formula of §11.0a; the exponential map of Waldspurger 2008 §4.3, available under the bound on `p`, transports the Lie-algebra identities to the group. (Waldspurger, *À propos du lemme fondamental pondéré tordu*, Théorème 3.8, cited by locator; the reduction is recorded in Stabilisation II, §4.4, p. 101, which names the Chaudouard–Laumon input, and in KMSW, Introduction, p. 6.)

*Hypotheses.* `p>N(G)e_F+1`; `(G̃,ω,K̃)` unramified; `M′` elliptic and unramified; strongly `G̃`-regular support.

([J.-L. Waldspurger — Stabilisation de la formule des traces tordue II](https://arxiv.org/abs/1401.7127v1), §4.4, p. 101; [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White — Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), Introduction, p. 6; [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §4.3, p. 48.)

**Checks.**

- For `θ=1` and `ω=1` the statement is the untwisted weighted identity of §§4.3b and 4.5a with no nonstandard term, and the reduction is the exponential transport alone.
- For `M̃=G̃` the weight is 1 and the statement is the ordinary twisted fundamental lemma of §4.10 for unit elements.
- At `p=2` the bound fails for every `G`, so nothing is asserted; the statement is not the all-residue-characteristic spherical theorem of §4.10a, which is unweighted.

*Needs:* §4.10 (twisted descent); §4.3b; §4.5a; §4.2 (nonstandard comparison); §11.0a (weighted distributions and descent formulas); §2.9; §2.11.

### 4.11 The fundamental lemma at unramified places of a global datum

Let `F` be a number field, `G` a connected reductive group over `F` and `(H, ℋ, s, ξ)` a global endoscopic datum with `z`-pair. Let `S` contain the archimedean places and all places where the groups, datum or chosen hyperspecial models ramify. At every `v∉S`, the hyperspecial units match and the spherical Hecke algebras transfer through the Satake map, including at residue characteristics 2 and 3. The same assertion holds for the unramified twisted data satisfying §4.10a and for base change. The product formula for global transfer factors is §2.7. An auxiliary split place outside any prescribed finite set exists by the Chebotarev density theorem.

*Hypotheses.* `F` a number field; a global unramified-outside-`S` endoscopic datum.

([S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.4 (pp. 15–16), the unramified case (3.8); [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §4.4 (p. 48).)

Apply §4.10a at each `v∉S`; its all-prime theorem supplies every unramified place without an enlarged residue-characteristic exclusion set. Chebotarev supplies the auxiliary split place.

**Checks.**

- For principal `GL₁` endoscopy, the spherical unit has value 1 on the maximal compact and its transfer also has value 1.
- An unramified unitary datum at a dyadic place uses its hyperspecial unit unchanged; the torus test in §4.10a has value 1 rather than 0.
- A ramified datum without hyperspecial data is excluded by the unramified hypothesis; smooth transfer from §4.10(a) is a separate assertion.

*Needs:* §4.10a; §4.9; §2.7; `TauCetiRoadmap.Chebotarev` Layer 10 (Dirichlet-density Chebotarev).

### Examples

For `GL₁`, the endoscopic datum is principal and the Lie transfer identity is the equality of the same integral characteristic function, with relative discriminant 1. For a regular matching pair in higher rank the ordinary identity has the factor `q^((val D_G-val D_H)/2)`. Multiplying each orbital integral by its own square-root discriminant removes that relative factor. These are equivalent normalizations, whereas omitting the factor in the ordinary identity is false. The all-prime group theorem uses §4.10a; the equal-characteristic Lie statements retain their characteristic hypotheses.

### Dependencies

§3.9; §3.5; §2.4; §2.1; §1.14; §3.17; §3.15; §3.16; §3.3; §3.18; §3.4; §2.9; §1.4; `TauCetiRoadmap.AlgebraicCurves` Layer 5 (consequences of Riemann–Roch, and local components); `TauCetiRoadmap.AlgebraicCurves` Layer 4 (repartitions, Weil differentials, and Riemann–Roch); §2.12; §1.8; §2.6; §2.11; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.3.6 (Moy–Prasad filtrations); §2.5; §2.7; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.3.3 (Bruhat–Tits and parahoric group schemes); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.4.1 (The Satake transform and isomorphism); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.1.1 (Functions, measures and convolution); §2.13; §2.14; `TauCetiRoadmap.Chebotarev` Layer 10 (Dirichlet-density Chebotarev); §1.13; §1.6; §2.3; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.3 (Tempered representations and the conditional Langlands classification); §2.16 (characters and Weyl integration); §1.16; §2.8; §1.7.

## Layer 5: number-field discrete general linear input and normalization

Consume the number-field residual classification of `TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a, **Number-field GLₙ residual blocks**, with its central-character realization modulo the centre. These discrete data enter the unitary spectral side even when the geometric side has no proper cuspidal Levi terms.

### 5.1 The supplied residual block and its endoscopic label

Use the supplier's index `(ρ,b)`, where `ρ` is unitary cuspidal on `GL_a(𝔸_F), a,b≥1, ab=m` and `ω_ρ^b=ω` for the fixed unitary central character `ω`. Write `ρ⊠b` for its supplied discrete representation, with the supplier's ordered normalized induction and local quotient realizations. AutomorphicSpectralTheory §4.14a supplies the index, quotient construction, automorphic existence, uniqueness and multiplicity one.

Every discrete GL block in the endoscopic parameter labels and the Levi sums of §6.22 uses this same pair `(ρ,b)` and this same representation `ρ⊠b`, including its local factors. A tuple of these indices for a block Levi denotes the external tensor product of the supplied representations. The endoscopic selection of such tuples and the normalized `θ`-intertwiner are the additional constructions of Layer 6. The positive-characteristic spherical classification in the supplier's §4.14 is a different input.

([Colette Mœglin and Jean-Loup Waldspurger — Le spectre résiduel de GL(n)](https://www.numdam.org/article/ASENS_1989_4_22_4_605_0.pdf), Introduction, theorem `(i)`–(ii), pp. 605–606; §I.11, pp. 640–643.)

**Checks.**

- `b=1` labels the supplied cuspidal representation `ρ` itself.
- For a unitary Hecke character `ρ` and `b=2`, the supplied residual block has central character `ρ²`; for `ρ=1` its local unramified quotient is the trivial `GL₂` representation, whereas the local Steinberg subrepresentation is a different constituent.
- Only indices satisfying `ω_ρ^b=ω` occur in the fixed-character Levi factor; the other pairs are excluded from that space.
- The `b>1` blocks remain in the discrete spectral sum; the continuous Eisenstein spectrum is not indexed by these discrete blocks.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a (**Number-field GLₙ residual blocks**).

### 5.2 GL Rankin–Selberg intertwiner normalization

**GL Rankin–Selberg intertwiner normalization.** For unitary cuspidal blocks `ρ_i` over a number field and complex exponents `s_i`, let `M(w,ρ,s)` be the standard meromorphic global operator. For each inversion `(i,j)` of `w` put `u=s_i−s_j` and

`r(w,ρ,s)=∏_(i,j) L(u,ρ_i×ρ_j∨)/(L(1+u,ρ_i×ρ_j∨) ε(u,ρ_i×ρ_j∨,ψ)),    N(w,ρ,s)=r(w,ρ,s)⁻¹M(w,ρ,s)`.

Use the same global additive character and compatible local self-dual measures in every factor. Construct the local operators with the corresponding local `L/ε` factors and identify the global normalized operator with their restricted tensor product, first in a convergence chamber and then meromorphically. No absolute Euler-product convergence on the unitary axis is asserted. The local normalized operators satisfy the permutation cocycle, the adjoint relation, and holomorphy with invertibility for purely imaginary `s` and unitary blocks; the extension to arbitrary unitary local blocks is §6.1. The API the GL intertwining normalizing factor, cocycle and unitary isomorphism fixes this normalization for the unitary trace comparison.

*Hypotheses.* Normalized upper-parabolic induction; unitary cuspidal global blocks; the local unitary-axis clause requires unitary local inducing representations and purely imaginary exponents. Scalar and operator identities are identities of meromorphic families, with values taken only at regular points.

([C. Mœglin and J.-L. Waldspurger — Le spectre résiduel de GL(n)](https://www.numdam.org/article/ASENS_1989_4_22_4_605_0.pdf), §I.1.1, formula for `r` and properties (1), (3)–(4), pp. 607–608; global factorization in the Introduction, p. 606; `TauCetiRoadmap.AutomorphicSpectralTheory` §2.5.)

**Checks.**

- The identity permutation has `r=1` and `N=id`.
- Two adjacent transpositions, with the inducing data permuted for the second operator, compose to the identity as a meromorphic family.
- At an unramified finite place, with conductor-`O` additive character and hyperspecial Haar normalization, the local normalized operator sends the normalized spherical vector to its counterpart with coefficient one.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` §§2.1–2.5 (meromorphic operators, local normalization and global factorization); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 (cuspidal Rankin–Selberg `L/ε` factors and functional equations); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (normalized induction).

### Examples

For the supplied pair `(ρ,2)` with `ρ` a unitary Hecke character, the standard exponents are `1/2` and `−1/2`. They sum to zero and the central character is `ρ²`. This residual representation contributes to the discrete Levi spectrum in §6.22 even though it is not cuspidal. For `b=1` the same supplier index gives the original cuspidal representation. In the identity-Weyl normalization the inversion product is empty and the intertwiner is the identity.

### Dependencies

`TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a (**Number-field GLₙ residual blocks**) and §§2.1–2.5 (intertwiners and factorization); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 (cuspidal Rankin–Selberg factors); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (normalized induction).

## Layer 6: stable and twisted unitary trace comparison

Build characters, Tamagawa coefficients and finite/infinity transfer before comparing the stable and twisted unitary distributions. The scalar, quotient-centre and intertwiner choices are part of the statement. The supplied cyclic GL base change and its all-place adapters, together with automorphic induction, precede the restricted unitary descent used by the classical local correspondence.

### 6.1 Irreducibility of unitary parabolic induction for `GL_n`

Let `F` be a non-archimedean local field of characteristic 0 and `π₁, …, π_m` irreducible unitary smooth representations of `GL_{n₁}(F), …, GL_{n_m}(F)`. AutomorphicSpectralTheory §7.0b supplies that the normalized parabolic induction `π₁ × ⋯ × π_m` from the standard parabolic subgroup with Levi `GL_{n₁} × ⋯ × GL_{n_m}` is an irreducible unitary representation of `GL_n(F), n = n₁ + ⋯ + n_m` (Bernstein). Consequently, for unitary `π_i` and purely imaginary exponents `s`, the normalized intertwining operators `N(σ,π,s)` between `π₁[s₁] × ⋯ × π_m[s_m]` and its permutations are holomorphic at `s` and are isomorphisms. Use the same supplier over `ℝ` and `ℂ`, including its unitary and residual Speh blocks. This section constructs the comparison with §5.2’s Rankin–Selberg normalized operators.

*Hypotheses.* `F` a local field of characteristic 0; at archimedean places use admissible unitary globalizations; induction normalized by `δ_P^{1/2}`. Each `π_i` is unitary, not merely of unitary central character; the exponents `s_i` are purely imaginary.

([M. Tadić — Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), §2.5, Theorem (J. N. Bernstein) `(i)`, p. 346; [C. Mœglin and J.-L. Waldspurger — Le spectre résiduel de GL(n)](https://www.numdam.org/item/ASENS_1989_4_22_4_605_0.pdf), §I.1.1, property (3) and its proof, pp. 607–608; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, before Proposition 4.8, p. 28.)

Consume the unitary classification and irreducibility of finite parabolic products from AutomorphicSpectralTheory §7.0b, at finite places and for `ℂ/ℝ`. Purely imaginary twists remain unitary, so the supplied irreducibility applies to these products as well. Compare its normalized operators with §5.2 using the Rankin–Selberg normalizing factors and cocycle law. Mœglin–Waldspurger §I.1.1(3), pp. 607–608, gives holomorphy on the unitary axis; the inverse permutation and cocycle make the operator an isomorphism. The same comparison uses the supplier's smooth Fréchet realizations over `ℝ` and `ℂ`. No additional construction of the unitary dual is required here.

**Checks.**

- For `GL₂` and unitary characters `χ₁, χ₂` of `F^×`, the principal series `χ₁ × χ₂` is irreducible.
- Non-example: `|·|^{1/2} × |·|^{−1/2}` is reducible, with the trivial character and the Steinberg representation as constituents; its inducing characters are not unitary, so the hypothesis cannot be weakened to unitary central character.
- For `m = 1` the statement is the irreducibility and unitarity of `π₁` itself.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` §7.0b (unitary classification and irreducibility of parabolic products); §5.2; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations).

### 6.2 Tamagawa number one for simply connected semisimple groups

For every number field `k` and every simply connected semisimple `k`-group `S`, prove `τ(S)=1`. This includes all inner forms, products and restrictions of scalars, the derived covers of type-A and type-C PEL groups and their connected reductive centralizers, and the derived covers used for arbitrary connected reductive groups in §6.18. Inner-form invariance compares `S` with its quasi-split inner form; it does not assert that `S` is quasi-split.

*Hypotheses.* Characteristic zero; `S` is the simply connected cover of the derived group, never the full unitary similitude group.

([K. F. Lai — Tamagawa number of reductive algebraic groups](https://www.numdam.org/item/CM_1980__41_2_153_0.pdf), §7, Theorem 7.1 pp. 186–187 and §7.2 pp. 187–188; [R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf), §9.3 pp. 392–393.)

Use the product formula and compatibility of Tamagawa measures with restriction of scalars from AdelicAlgebraicGroups §2.4. For quasi-split simply connected `S`, Lai Theorem 7.1 pp. 186–187 expresses `τ(S)` through the Tamagawa number of a maximal torus in a Borel subgroup (via the Eisenstein residue computation of §§5–6), and §7.2 pp. 187–188 deduces `τ(S)=1` because simple connectedness makes that torus a product of induced tori, to which Ono’s formula applies. For an inner form `S` of `S*`, prove `τ(S)=τ(S*)` by Kottwitz’s simple-trace comparison: proceed by strong induction on `dim S`. For every noncentral semisimple geometric element `s`, the connected reductive centralizer satisfies `dim((C_S(s)⁰)_der^sc)≤dim C_S(s)⁰<dim S`: a proper closed subgroup of the connected group `S` has smaller dimension, and taking the derived group and its finite simply connected cover cannot increase dimension. This supplies the induction hypothesis for every proper centralizer’s derived cover. Central elements have full centralizer and are handled separately in the central contribution; products and restrictions of scalars use their compatible measures. Then use the Hasse principle and finite Fourier inversion to compare the noncentral geometric terms, and choose Euler–Poincaré functions whose orbital integrals and central values match for invariant-differential measures. At one split finite place fix a supercuspidal coefficient and at a second place an elliptic Euler–Poincaré test, so the simple trace formula applies. At a further noncompact split place vary the test function: after subtracting the noncentral terms, a nonzero difference `τ(S)−τ(S*)` would express evaluation at the identity as a discrete sum of unitary characters. Local Plancherel has continuous spectrum at that place, so this is impossible. Thus the coefficient is zero and the two volumes agree. Use §1.9’s local vanishing and Kneser–Harder–Chernousov Hasse principle, including exceptional factors, for `S` and the simply connected covers arising in the induction. The Euler–Poincaré orbital formulas and their invariant-differential comparison are part of this target for every semisimple simply connected local inner form, including all semisimple elliptic elements and their centralizers (Clozel Theorems 4.1–4.2); combine them with §2.10’s archimedean formulas and the supplied simple trace formula. The local harmonic separation used in this comparison is also part of this target: at the auxiliary noncompact split place, construct the Plancherel decomposition of the identity distribution and use its nonzero continuous induced part to separate it from the discrete character sum arising in the comparison, as in Kottwitz §4 and Clozel §2.3. This argument precedes, and does not invoke, the full endoscopic stabilization of §6.18. Its measure comparison includes singular centralizers. See [Kottwitz, *Tamagawa numbers*](https://annals.math.princeton.edu/1988/127-3/p05), Theorem 1 and §4, pp. 629–646, and [Clozel, *Nombres de Tamagawa des groupes semi-simples*](https://www.numdam.org/item/SB_1988-1989__31__61_0.pdf), Theorems 1.1, 4.1–4.2 and §§2.3, 3.3, 5, pp. 62, 66–68, 73–79. Restriction of scalars and products preserve the resulting normalization.

**Checks.**

- `τ(SL_n)=1`, including `SL₁=1`.
- For the Siegel group `GSp₄`, the simply connected derived cover is `Sp₄` of type `C₂` and has Tamagawa number one. The same theorem applies to the simply connected derived covers of its connected reductive centralizers and their inner forms.
- For split `E₈` over `ℚ`, the involution with connected centralizer `Spin₁₆/μ₂` has derived cover `Spin₁₆`. Both ranks are 8, but dimensions decrease from 248 to 120, as required by the induction ([Garibaldi, *E₈, the most exceptional group*](https://arxiv.org/abs/1605.01721), Example 4.3, p. 9). A central element instead has full centralizer and belongs to the separate central contribution.
- A simply connected anisotropic inner form of type `C` still has Tamagawa number one; neither splitness nor isotropy is a hypothesis.
- For a norm-one torus `τ=2` can occur; the statement is not extended to arbitrary unitary groups.
- The group `GU(p,q)` itself has a central torus and is not a simply connected semisimple input.

*Needs:* `TauCetiRoadmap.AdelicAlgebraicGroups` §2.4 (Gauge forms and Tamagawa normalization); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism); §1.9; §2.10; `TauCetiRoadmap.AutomorphicSpectralTheory` §4 (automorphic spectral completeness) and §6.16 (invariant trace formula).

### 6.3 A Hecke character extending the CM quadratic character

For an imaginary quadratic field `F₀`, construct a continuous unitary Hecke character `ϖ` of `C_F₀=F₀^×\𝔸_F₀^×` whose restriction along `C_ℚ→C_F₀` is the quadratic character `ω_F₀/ℚ`. Retain its choice as data in the unitary `L`-embedding: it is not unique. Define `Ram_ℚ(ϖ)`, the rational primes below finite places where `ϖ` is nontrivial on local units; this set is finite, and every spherical transfer set `S` contains it. At the complex place write `ϖ∞(z)=(z/|z|)^m |z|^`(it); restriction to `ℝ^×` forces `m` odd and `t=0`.

*Hypotheses.* `F₀/ℚ` imaginary quadratic; `ω_F₀/ℚ` uses the global Artin convention already owned by ClassFieldTheory.

([S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1 p. 12 (`ϖ` and `Ram_ℚ(ϖ)`); §3.2 pp. 14–16.)

The interface consists of the following operations and identities.

- The data consist of a continuous unitary Hecke character and the equality of its restriction to `ω_F₀/ℚ`.
- For `x∈C_ℚ, ϖ(x)=ω_F₀/ℚ(x)`.
- `Ram_ℚ(ϖ)` is finite; outside it each local character is trivial on the unit subgroup.
- The complex angular exponent is odd and the continuous norm exponent is zero.
- Two choices differ by a character of `C_F₀/C_ℚ`; downstream `L`-embeddings retain the chosen character.
- Under the imported Artin reciprocity map, the Hecke character gives the `W_F₀`-character used in the `L`-embedding; the two conventions are transported together.

Take the extension and its restriction identity from AdelicAlgebraicGroups §2.4, using its closed-subgroup hypotheses for `C_ℚ⊂C_F₀`. Use local continuity to prove finite ramification and transport the imported Artin convention to the chosen `L`-embedding. Restrict the infinity factor to positive reals and to `−1`: the norm exponent is zero and the angular exponent is odd.

For any finite extension `L/K` of number fields define base change of a continuous Hecke character by `χ_L=χ_K∘N_{L/K}:C_L→C_K→C×`, using GlobalNumberFields Layer 8's continuous idele-class norm. This preserves unitarity and satisfies `(χ_L)_M=χ_M` in towers by norm transitivity. Locally, if `χ_K` is trivial on `U_K^a` and `N_{L_w/K_v}(U_{L_w}^b)⊆U_{K_v}^a`, then `χ_L` is trivial on `U_{L_w}^b`. This inclusion, rather than equality of conductor exponents, is the conductor bound used when enlarging S. At an unramified place a character trivial on `O_v×` pulls back to one trivial on `O_w×`. The API norm pullback of Hecke characters, transitivity of norm pullback and conductor bound under norm pullback is obtained by composition and this unit inclusion. Check the trivial character stays trivial; an unramified local character stays unramified; a ramified extension need not preserve a positive conductor exponent. For algebraic infinity types this agrees with GlobalNumberFields Layer 10's base change: substitute the archimedean norm, which sums the exponents over embeddings above a given embedding.

**Checks.**

- At the complex place `ϖ∞(−1)=−1`.
- `(z/|z|)²` restricts trivially to `ℝ×` and cannot be the required infinity factor.
- Twisting by a quotient character preserves the restriction but may change `Ram_ℚ(ϖ)`.
- The trivial Hecke character is not an extension of `ω_F₀/ℚ`.

*Needs:* `TauCetiRoadmap.GlobalNumberFields` Layer 8 (idele classes and norms) and Layer 9 (Hecke characters); `TauCetiRoadmap.AdelicAlgebraicGroups` §2.1 (Characters, logarithms and the split centre); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (the global class formation and global Artin reciprocity); `TauCetiRoadmap.GlobalNumberFields` Layer 10 (archimedean characters, infinity types, and cyclotomic arithmetic).

### 6.4 Twisted characters of `θ`-stable representations

For `G₀=GL_n` consume AutomorphicSpectralTheory §§7.0a–7.0b for normalized twisted characters and their allowed Shintani identities. This target constructs the general reductive-component character and Weyl-integration statements and compares their restriction to that `GL_n` convention. Let `E/F` be a cyclic extension of non-archimedean local fields of characteristic 0 with `Gal(E/F)` generated by `σ, G₀` connected reductive over `F` and `G = R_{E/F}G₀`, so `σ` acts on `G(F) = G₀(E)`. Let `Π` be an irreducible admissible representation of `G₀(E)` with `Π ≅ Π∘σ`, and fix an intertwiner `I_σ : Π → Π∘σ` (unique up to scalar; with `I_σ^ℓ = 1` where `ℓ = [E:F]`; for cyclic `GL_n` use the canonical operators supplied by AutomorphicSpectralTheory §7.0a, including its quotient normalization for nongeneric unitary and residual representations). `(a)` The twisted trace `f ↦ tr(Π(f) I_σ)` on `C_c^∞(G₀(E))` is given by a locally integrable function `Θ_{Π,σ}`, locally constant near `σ`-regular elements and invariant under `σ`-conjugacy `g ↦ h g σ(h)⁻¹`. `(b)` (Shintani relation, used to define base change; `G₀ = GL_n`) If `γ ∈ GL_n(E)` has `σ`-regular norm `Nγ ∈ GL_n(F)` (the norm map of AC Ch. 1 §1), the value `Θ_{Π,σ}(γ)` depends only on the conjugacy class of `Nγ`; for general `G₀` the norm is defined on stable `σ`-classes (Labesse 1999 §2.5). `(c)` The twisted Weyl integration formula expresses `∫_{G₀(E)} f` in terms of twisted orbital integrals over `σ`-conjugacy classes, with stable norms for general `G₀`; the injectivity on rational `σ`-conjugacy classes asserted here is restricted to `GL_n`. `(d)` The same holds for the coset `𝒢θ` of a non-connected group `𝒢^+ = 𝒢 ⋊ ⟨θ⟩` with `θ` of finite order acting by a quasi-semisimple automorphism, which is the form used for the unitary twisted spaces of §6.19.

*Hypotheses.* `F` of characteristic 0; `Π` irreducible admissible and `σ`-stable.

([L. Clozel — Characters of non-connected reductive p-adic groups](https://doi.org/10.4153/CJM-1987-008-3), §2 pp. 150–152; §3.3 Theorem 1 pp. 153–154 and proof §§3.4–3.9 pp. 154–167; [J. Arthur and L. Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §1, Lemmas 1.1–1.5, pp. 3–9; [J. Arthur and L. Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §2, Proposition 2.2, pp. 11–12; [P. Scholze — The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, pp. 31–32.)

Apply Clozel 1987 Theorem 1 to the representation of the finite semidirect product obtained from the chosen intertwiner. Restrict its character distribution to the `σ`-component; the value there is `tr(Π(f)I_σ)`. The discriminant and descent are those of §2 and §3.4, not a formal invocation of the connected theorem. For `GL_n` the norm is injective on `σ`-conjugacy classes by AC Ch. 1 Lemma 1.1(ii), pp. 3–4. Lemma 1.4, pp. 7–8, gives the elliptic norm criterion; the general reductive-group norm correspondence is on stable classes, with rational classes tracked separately. `(d)`: the same argument applied to the coset of a quasi-semisimple automorphism of finite order.

**Checks.**

- For `n = 1, Θ_{χ∘N,σ}(γ) = χ(Nγ)` for a character `χ` of `F^×` (the norm map is the field norm).
- If `Π` is not `σ`-stable no twisted character is defined; the statement requires `Π ≅ Π∘σ`.
- Changing `I_σ` by an `ℓ`-th root of unity `ζ` multiplies `Θ_{Π,σ}` by `ζ`.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` §§7.0a–7.0b (cyclic GL characters and transfer); §2.16; §1.16; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.5.1 (the dual group and its Galois action).

### 6.5 Kottwitz's formula for Tamagawa numbers

For the connected reductive groups `G`, their elliptic endoscopic groups `H` and connected reductive centralizers `I` used in this layer and the type-A/C Igusa formulas, let `S` be the simply connected cover of the derived group. Kottwitz’s relative formula is `τ(G)/τ(S)=|π₀(Z(Ĝ)^Γ)|/|ker¹(k,Z(Ĝ))|`. With §1.11 and §6.2 this gives `τ(G)=|π₀(Z(Ĝ)^Γ)|/|ker¹(k,G)|`. For `G_n⃗` with `r` positive blocks and `d=[F⁺:ℚ]`, the component count `|π₀(Z(Ĝ_n⃗)^Γ)|` is `2^r` if `d` is even or every block is even, and `2^(r−1)` otherwise, while `ker¹(ℚ,Z(Ĝ_n⃗))` embeds in a group of order 2 in the first case and of order 1 in the second. Hence `τ(G_n⃗)∈{2^r,2^(r−1)}`: it equals `2^r` when every block is even (`ker¹` trivial) and `2^(r−1)` when `d` is odd and some block is odd. When `d` is even and some block is odd, `|ker¹(ℚ,G_n⃗)|∈{1,2}` is not determined by the cited sources, so the coefficients carry `τ(G_n⃗)` as this ratio rather than as a fixed power of 2. For the base-change group `τ(𝒢_n⃗)=1`. The same ratio must be applied to each inner centralizer with its own `ker¹`; it is not declared trivial merely because it is a centralizer.

*Hypotheses.* Use the Tamagawa measures and split-centre quotient of AA.2. The number-one theorem applies to the simply connected derived cover, not the similitude group. The displayed absolute formula for the inner-form inputs relies on the simply connected semisimple number-one theorem, proved for every simply connected semisimple group in §6.2, including the type-C derived covers and inner centralizers used by the Igusa formulas.

([R. E. Kottwitz — Stable trace formula: cuspidal tempered terms](https://math.uchicago.edu/~drinfeld/langlands/Kottwitz.pdf), §5 pp. 625–626; §4.2 (4.2.2) pp. 623–624; [S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §1.2, display (1.2), p. 4; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1, Lemma 3.1 with (3.3) and Remark 3.2, pp. 13–14.)

Use Kottwitz 1984 §5: pass through a `z`-extension to a group with simply connected derived subgroup, apply Ono’s torus formula and the relative-ratio invariance under the central extension. This supplies `τ(G)/τ(S)`, not `τ(S)=1`. The absolute number-one input is the separate classical target. `|ker¹(F,G)| = |ker¹(F,Z(Ĝ))|` is Kottwitz 1984 (4.2.2), the duality of §1.11. Shin 2011 Lemma 3.1 pp. 13–14 computes the dual centre and its `Γ`-fixed component group, and embeds `ker¹(ℚ,Z(Ĝ_n⃗))` into `H¹(F₀/ℚ, Z(Ĝ_n⃗)^{Gal(ℚ̄/F₀)})`, of order 2 if `d` is even or every block is even and of order 1 otherwise; this gives only `τ(G_n⃗)∈{2^r,2^(r−1)}`. Remark 3.2 p. 14 fixes `ker¹(ℚ,G_n⃗)=1` when every block is even (by the argument of Kottwitz 1992 §7) and when `d` is odd with an odd block. For the base-change group use restriction of scalars, Shapiro and Hilbert 90: `ker¹` is trivial and `Z(Ĝ)^Γ` is a torus. Apply the relative formula with the derived covers. Inner centralizers use Layer 1 duality separately.

**Checks.**

- `τ(𝔾_m) = 1` and `τ(R_{F₀/ℚ}𝔾_m) = 1`.
- For `GSp₄` and each connected reductive Igusa centralizer, §6.2 evaluates the simply connected derived cover at one; the absolute formula retains that group’s own dual-centre and `ker¹` factors.
- `τ(U(1)) = 2` for the norm-one torus of an imaginary quadratic `F₀` (`π₀` of `(ℂ^×)^Γ = {±1}, ker¹` trivial).
- For `n⃗ = (1)` and `[F^+:ℚ]` odd, `|π₀(Z(Ĝ_{(1)})^Γ)| = 2^{r−1} = 1` and `ker¹` is trivial, so `τ(G_{(1)}) = 1` (Shin 2011 Remark 3.2).
- For `d` even and some odd block the sources give only `τ(G_n⃗)∈{2^r,2^(r−1)}`; a definition that sets `ker¹(ℚ,G_n⃗)=1` for every block pattern asserts more than Shin 2011 Lemma 3.1 proves.

*Needs:* `TauCetiRoadmap.AdelicAlgebraicGroups` §2.4 (Gauge forms and Tamagawa normalization); §1.11; §1.8; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism); `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); §6.2.

### 6.6 Base-change groups and the `L`-morphisms BC and `ζ̃`

The component-order formula uses `d=[F⁺:ℚ]` and positive block sizes, with `d>0` and at least one block. Its numerical extension to an empty block list has value one; this has no empty-rank unitary-similitude interpretation.

Let `F = F^+F₀` be a CM field (`F₀` imaginary quadratic, `[F^+:ℚ] ≥ 2`), `n⃗ = (n₁,…,n_s)` and `G_n⃗` the quasi-split unitary similitude group of §1.8, with the character `ϖ : 𝔸_{F₀}^×/F₀^× → ℂ^×` extending the quadratic character of `F₀/ℚ` fixed there. Put `𝒢_n⃗ = R_{F₀/ℚ}(G_n⃗ ×_ℚ F₀)`; then `𝒢_n⃗ ≅ R_{F₀/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗` and its dual group is `ℂ^× × ℂ^× × ∏_{σ ∈ Φ} GL_n⃗(ℂ)` (`Φ` the embeddings `F → ℂ`), `W_{F₀}` permuting the `σ`-factors and `w ∉ W_{F₀}` acting by `(λ_+, λ_−, (g_σ)) ↦ (λ_− ∏_{σ ∉ Φ^+} det g_σ, λ_+ ∏_{σ ∈ Φ^+} det g_σ, (Φ_n⃗ ᵗg_{c w⁻¹σ}⁻¹ Φ_n⃗⁻¹)_σ)`. The construction gives: `(a)` the base-change `L`-morphism `BC_n⃗ : ^LG_n⃗ → ^L𝒢_n⃗, (λ,(g_σ)_{σ∈Φ^+}) ⋊ w ↦ (λ, λ, (g_σ)_{σ∈Φ^+}, (g_{cσ})_{σ∉Φ^+}) ⋊ w`; `(b)` for `n₁ + n₂ = N` the `L`-morphism `ζ̃_{n₁,n₂} : ^L𝒢_{n₁,n₂} → ^L𝒢_N` extending `GL_{n₁} × GL_{n₂} ⊂ GL_N` by the `ϖ`-twist of `η̃_{n₁,n₂}` on `W_{F₀}` and the element `(a_{n₁,n₂}, a_{n₁,n₂}, (Φ_{n₁,n₂}Φ_N⁻¹)_σ)` on a fixed `w* ∉ W_{F₀}`; `(c)` the commutative square `BC_N ∘ η̃_{n₁,n₂} = ζ̃_{n₁,n₂} ∘ BC_{n₁,n₂}`; `(d)` the automorphism `θ` of `𝒢_n⃗` induced by the non-trivial element of `Gal(F₀/ℚ), θ(λ, g) = (λ^c, λ^c g^♯)` with `g^♯ = Φ_n⃗ ᵗ(g^c)⁻¹ Φ_n⃗⁻¹` (the inverse is required, as the inverse-transpose identity below checks), so that `𝒢_n⃗ ⋊ Gal(F₀/ℚ) ≅ 𝒢^+_n⃗ = 𝒢_n⃗ ⋊ {1, θ}`.

*Hypotheses.* `F = F^+F₀` CM with `F₀` imaginary quadratic; `ϖ` fixed as in §1.8; `a_{n₁,n₂}` a fixed square root of `(−1)^{N(n₁,n₂)}` with `N = n₁ + n₂, N(n₁,n₂) = [F^+:ℚ](n_1ε(N−n₁) + n_2ε(N−n₂))/2` and `ε(m) ∈ {0,1}` the parity of `m`; on `W_{F₀}` the `i`-th block of `η̃_{n₁,n₂}` and `ζ̃_{n₁,n₂}` is twisted by `ϖ^{ε(N−n_i)}` (Shin 2011 §3.2 p. 14; Caraiani–Scholze 2017 §5.5 p. 746). For even `N, ε(N−n_i) = ε(n_i)`, the form printed for `G_{2n}` in Caraiani–Scholze non-compact §5.2 p. 68 and Remark 5.4.1; for odd `N` the exponent `ε(n_i)` has the wrong parity.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, (5.4.1) and the definitions of `BC_n⃗` and `ζ̃_{n₁,n₂}`, pp. 69–70; [A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, p. 72; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1 and §3.2, pp. 12–14; [A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, proof of Corollary 5.5.5, pp. 745–746.)

The interface consists of the following operations and identities.

- `𝒢_n⃗ = R_{F₀/ℚ}(G_n⃗ ×_ℚ F₀)`.
- `𝒢_n⃗ ≅ R_{F₀/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗` over `ℚ`.
- The order-two automorphism `θ(λ,g) = (λ^c, λ^c g^♯)`.
- `θ² = id`.
- The base-change `L`-morphism `BC_n⃗ : ^LG_n⃗ → ^L𝒢_n⃗`.
- The `L`-morphism `ζ̃_{n₁,n₂} : ^L𝒢_{n₁,n₂} → ^L𝒢_N`.
- `BC_N ∘ η̃_{n₁,n₂} = ζ̃_{n₁,n₂} ∘ BC_{n₁,n₂}`.
- `𝒢_n⃗ ⋊ Gal(F₀/ℚ) ≅ 𝒢_n⃗ ⋊ {1,θ}`, with `c ↦ θ`.

Compute the dual group of `R_{F₀/ℚ}(G_n⃗)_{F₀}` from the Weil-restriction rule (ReductiveGroupsPartII §RG2.5.1 (the dual group and its Galois action)). Define `BC_n⃗` and `ζ̃` by the displayed formulas and check they are `L`-morphisms by comparing with the action of `w ∉ W_{F₀}` (Caraiani–Scholze non-compact §5.4, p. 69). The square `(c)` commutes by direct computation on `Ĝ` and on `w*` (Caraiani–Scholze non-compact (5.4.1), p. 69; Shin 2011 §3.2 and §4.4).

**Checks.**

- The numerical component-order expression at `d=0` and an empty block list is 1, by the empty list and even-degree branch. This has no number-field group interpretation because `d>0` and positive nonempty blocks are required.
- At `d=1`, block lists `[1]` and `[2,2]` give component-order expressions 1 and 4: these test the odd-degree, odd-block branch and the all-even branch of Shin 2011 Lemma 3.1. The degree-one numerical inputs test the formula; the global comparison retains its standing degree hypothesis.
- For `n⃗ = (1), 𝒢_{(1)}(ℚ) = F₀^× × F^×`.
- The `θ`-fixed points of `𝒢_n⃗(ℚ)` are `G_n⃗(ℚ)`.
- The square `BC_N ∘ η̃ = ζ̃ ∘ BC` holds on `W_{F₀}` and on `w*`.
- `𝒢_n⃗` is not `G_n⃗ ×_ℚ F₀` viewed over `F₀`: it is its Weil restriction to `ℚ`, whose `ℚ`-points are `G_n⃗(F₀)`.
- For `N = 3` and `(n₁,n₂) = (2,1)` the `W_{F₀}`-component of `ζ̃_{2,1}` twists the `GL₂`-block by `ϖ^{ε(1)} = ϖ` and the `GL₁`-block by `ϖ^{ε(2)} = 1`, and `N(2,1) = [F^+:ℚ]`; the even-rank exponents `ε(n_i)` would twist the `GL₁`-block instead.

*Needs:* §1.8; `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.5.1 (the dual group and its Galois action); §6.3.

### 6.7 The stable elliptic distribution `ST^H_e` and the coefficient `ι(G,H)`

The coefficient `ι(G,H)=τ(G)/(τ(H)|Out(H)|)` retains both denominators. In the group application both `τ(H)>0` and `|Out(H)|≥1`; evaluating a formal rational expression at denominator zero has no Tamagawa interpretation.

Let `(H,s,η)` be an elliptic endoscopic triple of a connected reductive `ℚ`-group G. Work in the space of smooth functions compactly supported modulo `A_{H,∞}⁰` (the positive real points of the maximal `ℚ`-split central torus), transforming under a fixed compatible central character `χ`; all quotient measures and traces use this same convention. For stable-cuspidal `h_∞` define `ST^H_e(h) = τ(H) Σ_{[γ_H]_st,ℓ} |π₀(H_{γ_H})(ℚ)|⁻¹ SO_{γ_H}(h)`, with the connected-centralizer measures and signs specified by Shin 2010 (7.3), p. 26. The coefficient is `ι(G,H)=τ(G)τ(H)⁻¹|Out(H,s,η)|⁻¹`. For the unitary similitude endoscopic groups of this layer the centralizers are connected, so the component factor is 1.

*Hypotheses.* Only `ℚ`-elliptic semisimple classes enter; `h_∞` must be stable cuspidal so that non-elliptic terms vanish at `∞`.

([S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §1.2 pp. 3–4; §7 (7.3) p. 26 and Theorem 7.2 p. 27; [A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Theorem 5.3.2, p. 68; Proposition 5.5.1, p. 73.)

The interface consists of the following operations and identities.

- Let `(H,s,η)` be an elliptic endoscopic triple of a connected reductive `ℚ`-group G. Work in the space of smooth functions compactly supported modulo `A_{H,∞}⁰` (the positive real points of the maximal `ℚ`-split central torus), transforming under a fixed compatible central character `χ`; all quotient measures and traces use this same convention. For stable-cuspidal `h_∞` define `ST^H_e(h) = τ(H) Σ_{[γ_H]_st,ℓ} |π₀(H_{γ_H})(ℚ)|⁻¹ SO_{γ_H}(h)`, with the connected-centralizer measures and signs specified by Shin 2010 (7.3), p. 26. The coefficient is `ι(G,H)=τ(G)τ(H)⁻¹|Out(H,s,η)|⁻¹`. For the unitary similitude endoscopic groups of this layer the centralizers are connected, so the component factor is 1.
- `ST^H_e` vanishes on `h` all of whose stable orbital integrals vanish.
- `ST^H_e` is linear in `h`.
- Define `ι(G,H) = τ(G)τ(H)⁻¹|Out(H,s,η)|⁻¹`.
- For the trivial triple, `ι(G,G) = 1`; numerically, `τ/τ/1 = 1` under `τ≠0`.
- `ι(G,H)` depends only on the isomorphism class of `(H,s,η)`.

Use the central quotient, support conditions and summation convention of Shin 2010 §1.2 and (7.3). Compactness modulo the entire centre alone does not imply finiteness: a torus would leave all rational central translates. Any finiteness assertion must be made on the specified quotient and support, not inferred from compact support modulo `Z(H)`. `ST^H_e` is a stable distribution: each `SO_{γ_H}` is stable (§2.4). `ι(G,H)` depends only on the isomorphism class of the triple.

**Checks.**

- For `G₄` and `G₂,₂`, Shin Remark 3.2 gives `τ(G₄)=2` and `τ(G₂,₂)=4`; outer order 2 gives `2/4/2 = 1/4`. After multiplying by `τ(G₂,₂)` in §6.25, the coefficient is `τ(G₄)/2=1`, with relative factor `ε=1/2`.
- For `τ(G)=τ(H)=2` and outer order 2, the coefficient is `1/2`; outer order 1 instead gives 1.
- At `τ(H)=0` the numerical rational function evaluates to 0 in Lean, so denominator nonvanishing must be checked before any group interpretation.
- For a torus the connected-centralizer component factor is 1, and the formula is `τ(T)` times the rational sum with `A_{T,∞}⁰` and the central-character convention fixed; no finiteness follows merely from compact support modulo the whole torus.
- For `G = G_{2n}` and `H = G_{n,n}, |Out(H,s,η)| = 2`, so `ι(G,H) = τ(G)/(2τ(H))`. The rational identity `τG/τH/2 = τG/(2τH)` holds for all rational inputs; the group interpretation retains `τH>0`.
- A semisimple class that is not elliptic at infinity has zero orbital integral against `h_∞` stable cuspidal. A sum of stable orbital integrals over more classes remains stable; the ellipticity test checks the selected geometric term, not stability.
- For the trivial triple `(G,1,id), ι(G,G) = 1`.

*Needs:* §2.4; §1.4; §6.5; §2.10; `TauCetiRoadmap.AdelicAlgebraicGroups` §2.4 (Gauge forms and Tamagawa normalization).

### 6.8 Unramified transfers BC*, `ζ̃*, η̃*` and their compatibilities

With §6.6, let `v` be a place of `ℚ` outside a finite set `S` containing `∞, p, ℓ` and the primes where `F` or `ϖ` ramifies. `(a)` The `L`-morphisms `BC_n⃗, ζ̃_{n₁,n₂}` and `η̃_{n₁,n₂}` induce, through the Satake isomorphism (SmoothRepresentationsOfLocalGroups §SR.4.1 (The Satake transform and isomorphism)), algebra maps `BC*_n⃗ : H^ur(𝒢_n⃗(ℚ_v)) → H^ur(G_n⃗(ℚ_v)), ζ̃*_{n₁,n₂} : H^ur(𝒢_N(ℚ_v)) → H^ur(𝒢_{n₁,n₂}(ℚ_v))` and `η̃*_{n₁,n₂} : H^ur(G_N(ℚ_v)) → H^ur(G_{n₁,n₂}(ℚ_v))`, and dual maps on unramified representations, with `tr π(η̃*φ) = tr η̃_*(π)(φ)` and the same for BC and `ζ̃`. `(b)` The squares `BC*_{n₁,n₂} ∘ ζ̃*_{n₁,n₂} = η̃*_{n₁,n₂} ∘ BC*_N` on Hecke algebras and the dual square on unramified representations commute. `(c)` Explicitly, for `Q_{n₁,n₂}` a parabolic of `𝒢_N` with Levi `𝒢_{n₁,n₂}: ζ̃*_{n₁,n₂}(f_v) = f_v^{Q} · χ_{ϖ,v}`, the normalised constant term times the character `χ_ϖ(λ,g₁,g₂) = ϖ(λ^{−N(n₁,n₂)} ∏_i N_{F/F₀}(det g_i)^{ε(N−n_i)})` with `N(n₁,n₂)` and the parity exponents of §6.6 (for even `N` these are the exponents `ε(n_i)` printed in Caraiani–Scholze non-compact Remark 5.4.1), and `ζ̃_{n₁,n₂,*}(Π_v) = n-Ind(Π_v ⊗ χ_{ϖ,v})`; these formulas extend to all `f_v ∈ C_c^∞` and all `Π_v ∈` Rep`(𝒢_{n₁,n₂}(ℚ_v))`, since both groups are products of restrictions of scalars of general linear groups.

*Hypotheses.* `v ∉ S` for the unramified statements `(a),(b)`; `(c)` holds at every place `v`.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, (5.4.2), (5.4.3) and Remark 5.4.1, pp. 69–70; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.3, Lemma 3.3, p. 15; §4.2, (4.4), p. 22; §4.4, (4.18)–(4.20), pp. 25–26.)

`(a)`: functoriality of the Satake isomorphism along `L`-morphisms between unramified groups (SmoothRepresentationsOfLocalGroups §SR.4.1 (The Satake transform and isomorphism), §SR.4.2 (Spherical parameters)). `(b)`: apply `(a)` to the commutative square of §6.6 `(c)` (Caraiani–Scholze non-compact (5.4.2)–(5.4.3), from Shin 2011 (4.18)). `(c)`: the constant-term formula `tr π(f^Q) = tr n-Ind(π)(f)` and its unramified version (Shin 2011 Lemma 3.3), with the twist by `χ_ϖ` read off from `ζ̃` (Caraiani–Scholze non-compact Remark 5.4.1).

**Checks.**

- For `v` split in `F₀, BC*_n⃗` is surjective (Shin 2011 §4.2, Case 2).
- For `n₂ = 0, ζ̃*` is the identity.
- `tr(n-Ind(Π ⊗ χ_ϖ))(f) = tr Π(f^Q · χ_ϖ)` for `f ∈ C_c^∞(𝒢_N(ℚ_v))` (constant-term adjunction).

*Needs:* §6.6; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.4.1 (The Satake transform and isomorphism); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.4.2 (Spherical parameters); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); §6.3.

### 6.9 Base-change transfer of test functions at every place

With §6.6: `(a)` (split places) if `v` splits in `F₀` (in particular `v = p` in the applications), every `f_v ∈ C_c^∞(𝒢_n⃗(ℚ_v))` has a BC-transfer `φ_v ∈ C_c^∞(G_n⃗(ℚ_v))` (Shin 2011 §4.2, Case 2), i.e. `tr π_v(φ_v) = tr(BC(π_v)(f_v) ∘ A_θ)` for the normalised `θ`-intertwiner, and the map `f_v ↦ φ_v` is surjective onto `C_c^∞(G_n⃗(ℚ_v))`; base change of irreducible representations at such `v` is injective. `(b)` (all finite places; Labesse 1999 Théorème 3.3.1) every `f_v ∈ C_c^∞(𝒢_n⃗(ℚ_v))` has a `φ_v` with matching orbital integrals, i.e. `SO_γ(φ_v)` equals the stable twisted orbital integral of `f_v` at `δ` when `γ` is a norm of `δ`, and `SO_γ(φ_v) = 0` when `γ` is not a norm. `(c)` (inverse transfer; Labesse 1999 Proposition 3.3.2) a function `φ_v ∈ C_c^∞(G_n⃗(ℚ_v))` whose stable orbital integrals vanish at every semisimple element that is not a norm is a BC-transfer of some `f_v`. `(d)` (norm criterion) a semisimple `γ ∈ G_n⃗(ℚ_v)` is a norm iff its image in the cocentre `D_n⃗ = G_n⃗/G_n⃗^der` is a norm; for `v` split in `F₀` every element is a norm (Caraiani–Scholze non-compact Lemma 5.4.3, via Labesse 1999 Proposition 2.5.3).

*Hypotheses.* `v` finite; in `(c),(d) v` may be inert or ramified in `F₀`.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, Proposition 5.4.2 and Lemma 5.4.3 with proof, pp. 70–71; [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 2.5.3 p. 61; Théorème 3.3.1 pp. 78–79 and Proposition 3.3.2 p. 79 (Numdam edition); [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.2, Cases 1–2, pp. 22–23.)

`(a)`: at split `v, 𝒢_n⃗(ℚ_v) ≅ G_n⃗(ℚ_v) × G_n⃗(ℚ_v)` with `θ` swapping factors; take `φ_v` the convolution of the two components (Shin 2011 §4.2, Case 2). `(b),(c)`: Labesse's transfer for stable base change, the twisted analogue of §4.7, stated in §4.9 `(c)`; Proposition 3.3.2 is its converse for functions supported on norms. `(d)`: Labesse 1999 Proposition 2.5.3 reduces to the cocentre of an elliptic Levi `M` containing `γ`; the explicit description of `D_n⃗` and `D_M` as tori with multiplier `λ` shows that an element of `D_M` is a norm iff its image in `D_n⃗` is (Caraiani–Scholze non-compact proof of Lemma 5.4.3, after Morel 2010 Lemma 8.3.6).

**Checks.**

- At split `v`, with `vol(K) = 1`, the BC-transfer of `1_K ⊗ 1_K` is `1_K`.
- For `n⃗ = (1)` the norm criterion reduces to the classical criterion for the multiplier torus.
- A function supported on non-norms has BC-transfer 0 under `(b)`.

*Needs:* §6.6; §4.9; §6.4; §2.11.

### 6.10 Archimedean Euler–Poincaré and twisted Lefschetz functions for unitary similitude groups

Let `G` be a unitary similitude group over `ℚ` that is an inner form of `G_N` at `∞` of arbitrary signature, `ξ` an irreducible algebraic representation of `G_ℂ`, and `Ξ = ξ ⊗ ξ` the corresponding representation of `(𝒢_n⃗)_ℂ`. Construct: `(a)` the Euler–Poincaré function `φ_{G_n⃗,ξ}` (§2.10) and Labesse's twisted Lefschetz function `f_{𝒢_n⃗,Ξ} ∈ C_c^∞(𝒢_n⃗(ℝ))`, whose twisted traces compute twisted Lefschetz numbers of `(𝔤,K)`-cohomology; they are BC-matching; `(b)` for each elliptic endoscopic `G_n⃗` of `G`, the function `φ^n⃗_∞ = e_n⃗(Δ_∞)(−1)^{q(G)}⟨μ_h, s⟩ Σ_{φ_H} det(ω_*(φ_H)) φ_{φ_H}`, the sum over discrete `L`-parameters `φ_H` of `G_n⃗` with `η̃_n⃗ ∘ φ_H` equivalent to the parameter of `ξ, φ_{φ_H}` the averaged pseudo-coefficient of the `L`-packet and `q(G) = ½ dim G(ℝ)/K_∞A_{G,∞}⁰`; `(c)` the twisted analogue `f^n⃗_∞ = e_n⃗(Δ_∞)(−1)^{q(G)}⟨μ_h, s⟩ Σ_{φ_n⃗} det(ω_*(φ_n⃗)) f_{𝒢_n⃗,Ξ(φ_n⃗)}`; then `f^n⃗_∞` and `φ^n⃗_∞` are BC-matching, and `φ^n⃗_∞` is a transfer of the Euler–Poincaré function of `G` (Kottwitz's construction, §2.15). In the pure `U(p,q)` factor construct the coefficient `F=E⊗θE` with `θ` acting by interchange of the two factors. With the Euler–Poincaré measure, Clozel–Labesse 2011 Theorems 4.1/5.1 give `SO_δ(f_F)=0` when `I_δ` has no discrete series, and otherwise `SO_δ(f_F)=e(I_δ)2^n tr(E(γ))` for `γ=gθ(g), δ=gθ` in `GL_n(ℂ)θ`. The centralizer sign `e(I_δ)` is essential, including at singular semisimple `δ`. For restrictions of scalars and similitude centres transport the factor formula with the split-centre measures and the Layer 2 transfer normalization; the pure-unitary formula is not asserted unchanged for GU.

*Hypotheses.* `G_ℝ` an inner form of `G_N` of arbitrary signature (not only Harris–Taylor signature); `ξ` irreducible algebraic; the sign `e_n⃗(Δ_∞)` and `⟨μ_h,s⟩` fixed by the transfer-factor normalisation of §2.7. At infinity use functions compact modulo `A_{G,∞}⁰` with the central character fixed by `ξ`, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; `C_c^∞` in this construction denotes this central-character space, not ordinary compact support on the whole group.

([L. Clozel and J.-P. Labesse — Orbital integrals and distributions](https://www.claymath.org/library/proceedings/cmip013c.pdf), Theorem 2.2 p. 109; Lemma 3.2 and Proposition 3.3 pp. 111–112; §4 erratum and Theorem 4.1 pp. 112–113; §5 Theorem 5.1 pp. 113–114; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.3, pp. 23–24; (5.11), p. 35; (6.7), p. 43; [A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, p. 735; §5.3, pp. 737–738; [A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, p. 70; §5.6, pp. 74–75.)

The interface consists of the following operations and identities.

- `φ_{G,ξ}`, the averaged pseudo-coefficient of the discrete packet of `ξ^∨`.
- Construct the smooth twisted Lefschetz function with coefficient `Ξ=ξ⊗θξ` and the interchange extension, retaining the regularizing multiplier and split-centre normalization.
- `tr(Π(f_{𝒢,Ξ}) A_θ)` is the twisted Lefschetz number `Σ_i (−1)^i tr(θ | H^i(𝔤,K; Π ⊗ Ξ))`.
- `f_{𝒢,Ξ}` and `φ_{G,ξ}` are BC-matching.
- `φ^n⃗_∞` as the signed combination over discrete parameters `φ_H` with `η̃∘φ_H ~ φ_ξ`.
- `f^n⃗_∞` as the matching combination of Lefschetz functions.
- `φ^n⃗_∞` is a transfer of the Euler–Poincaré function of `G` (Kottwitz).
- `f_{𝒢,Ξ}` is cuspidal: its twisted orbital integrals vanish off `θ`-elliptic elements.
- For a pure `U(p,q)` factor and semisimple `δ=gθ`, the stable integral is zero if `I_δ` has no discrete series, and otherwise `e(I_δ)2^n tr ξ(gθ(g))`; do not suppress the centralizer sign.
- Changing the Paley–Wiener multiplier while retaining value one at the coefficient parameter leaves semisimple orbital integrals unchanged.

Clozel–Labesse 2011 Theorem 2.2 computes the orbital integrals of the `K`-supported Lefschetz measure `μ_F`; the Lefschetz function is the regularization of `μ_F` by an Arthur multiplier with value one at the infinitesimal character of the coefficient (Labesse 1991, recalled before their Lemma 3.2). Lemma 3.2 makes its semisimple orbital integrals independent of the regularization; Proposition 3.3 gives the regular orbital formula. Theorems 4.1/5.1 descend to the stable centralizer with its Euler–Poincaré function and obtain the singular stable formula with `e(I_δ)`. Their §4 (pp. 112–113) is the published erratum to Theorem A.1.1 of the Clozel–Labesse appendix to Astérisque 257, which omitted that sign . `(b)`: Shin 2011 (5.11), p. 35, with the real endoscopic signs of Shin 2011 §3.6; for arbitrary signature use `q(G)` and the discrete-series packet of `G_ℝ` (Caraiani–Scholze 2017 §5.2 p. 735 and §5.3 pp. 737–738). `(c)`: Shin 2011 (6.7), p. 43; BC-matching of `f^n⃗_∞` and `φ^n⃗_∞` follows termwise from `(a)`. Use Shin §4.3 and Layer 2’s real packet transfer for the pure-unitary norm correspondence and then transport products and the common similitude split centre with the chosen central character. The quotient measures are those of §2.8 and the normalized real characters those of §§2.10–2.14; transport both through the central quotient before comparing the Lefschetz traces.

**Checks.**

- If `G(ℝ)/A_{G,∞}⁰` is compact and `ξ=1` with trivial central character, its normalized constant function represents the Euler–Poincaré trace. Compactness merely modulo the full centre does not imply this assertion.
- For arbitrary signature recompute `q(G)`, the Shimura cocharacter `μ_h`, the pairing `⟨μ_h,s⟩` and the contributing real packets. Holding `μ_h` fixed while changing signature need not preserve the endoscopic coefficients.
- For the trivial triple the coefficient is `(−1)^{q(G)}`.
- On a compact real quotient choose `ξ` and a coefficient `Ξ′` whose restriction along the base-change embedding has a different highest weight and no `ξ`-constituent. Schur orthogonality distinguishes their traces and prevents matching; mere inequality `Ξ′≠ξ⊗ξ` is insufficient.
- Choose a semisimple `δ` with `e(I_δ)=−1` and nonzero coefficient trace. The pure-unitary stable orbital integral is `−2^n tr ξ(gθ(g))`, distinguishing the corrected formula from the unsigned one.

*Needs:* §2.10; §2.15; §2.14; §6.6; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.19 Real Euler–Poincaré test functions.

### 6.11 Cuspidal groups, cuspidal Levi subgroups and cuspidal Levi subsets

A connected reductive `ℚ`-group `M` is cuspidal if `(M/A_M)_ℝ` has an anisotropic maximal real torus, where `A_M` is its maximal `ℚ`-split central torus. A Levi subgroup of the fixed unitary similitude group `G_n⃗` is cuspidal when it satisfies this condition. For a standard Levi subset `Lθ` of `𝒢_n⃗θ`, form its associated Levi `L_H=L∩G_n⃗` (equivalently the fixed group of the restricted involution); call the subset cuspidal when `L_H` is cuspidal. Define the property for a conjugate Levi subset by transport to a standard subset. The connected restriction-of-scalars Levi `L` by itself is not the group on which cuspidality is tested.

*Hypotheses.* `M` connected reductive over `ℚ`; Levi subsets in the sense of Arthur's non-connected theory.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Definition 5.5.2, p. 74; [S. Morel — On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/abs/0802.4451v2), Definition 3.1.1 p. 50; §8.2 p. 131.)

The interface consists of the following operations and identities.

- `M` is cuspidal iff `(M/A_M)_ℝ` has an `ℝ`-anisotropic maximal torus.
- `M` is cuspidal iff `M(ℝ)` has discrete series modulo `A_M(ℝ)⁰`.
- A product is cuspidal iff each factor is.
- A twisted Levi subset is cuspidal iff its associated standard fixed-unitary Levi `L_H` is cuspidal; this property is invariant under transport to conjugate standard data.
- For a CM field `F, R_{F/ℚ}GL_h` is cuspidal iff `h = 1` and `[F^+:ℚ] = 1`: otherwise `(M/A_M)_ℝ` has a non-trivial split central torus (when `[F^+:ℚ] > 1`) or a split part in every maximal torus (when `h ≥ 2`).

Use CSnc Definition 5.5.2 p. 74 and Morel §8.2 p. 131: identify the standard fixed Levi `L_H` and apply the real anisotropic-torus criterion to `L_H`. AutomorphicSpectralTheory §0.48 (real discrete series) supplies the real discrete-series criterion modulo the specified split centre. Products preserve cuspidality, whereas a surviving split central factor rules it out.

Here an `F`-torus `T` is anisotropic precisely when it has no positive-dimensional `F`-split subtorus, equivalently `X_*(T)^{Γ_F}=0`. An invariant cocharacter defines a split one-dimensional image, and every split subtorus has a nonzero invariant cocharacter, proving the criterion. The API consists of anisotropy of the torus, its characterization by invariant cocharacters and its behaviour under products; it uses this definition. Over `ℝ, G_m` fails it; the norm-one torus of `ℂ/ℝ` satisfies it because conjugation acts by `−1` on `ℤ`; the trivial torus satisfies it. Thus the condition on `(M/A_M)_ℝ` in this section includes zero-dimensional maximal tori.

**Checks.**

- `𝔾_m` is cuspidal (`A_M = 𝔾_m` and `M/A_M` is trivial).
- For `[F^+:ℚ] = 2, R_{F/ℚ}GL₁` is not cuspidal: its real centre contains a split torus of rank 2 while `A_M` has rank 1.
- A unitary group `U(a,b)` over `ℚ` relative to an imaginary quadratic field is cuspidal.
- The trivial group is cuspidal; a Levi subgroup is never required to contain a non-trivial torus.
- The full component `𝒢_n⃗θ` is cuspidal because its associated fixed group `G_n⃗` is cuspidal. Testing discrete series on `𝒢_n⃗(ℝ)`, a product of complex general linear groups, would give the wrong result.

*Needs:* §6.6; `TauCetiRoadmap.AdelicAlgebraicGroups` §2.4 (Gauge forms and Tamagawa normalization); `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations).

### 6.12 The local cyclic GL normalization adapter

Use AutomorphicSpectralTheory §§7.0a–7.0b for cyclic `GL_n` normalized characters, transfer and tempered lifting over prime-degree extensions of characteristic-zero nonarchimedean local fields. Use its Langlands-data extension for general irreducibles, retaining SR.3.3's tempered-support hypothesis. Its Shintani identity applies to the permitted essentially tempered, unitary and residual classes, and to products satisfying its irreducibility hypotheses; a general Langlands quotient is not thereby a Shintani lift.

Here identify the supplied norm, quotient measures and canonical intertwiner with the conventions of §§4.9 and 6.4. Prove the local fibre adapter used in §10.21: tempered fibres are obtained by twisting the discrete-series inducing factors separately by norm-trivial characters. The lift of a supercuspidal is supercuspidal if discrete, and otherwise is the induction of its distinct conjugate supercuspidal orbit in lower rank. These fibre consequences concern the supplied lifting map, rather than a second construction of it.

*Hypotheses.* Prime-degree cyclic extensions; fixed additive character and transported Whittaker datum; the supplied tempered-support and character-identity restrictions. No local LLC or tower realization is used to identify these conventions.

([J. Arthur and L. Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter `I`, Theorem 6.2 pp. 51–52, Propositions 6.6–6.9 pp. 58–61 and Lemma 6.10 pp. 62–64.)

Match the GL norm and centralizer measures first. Whittaker uniqueness identifies the implementing operators; descent through the supplied standard modules identifies the allowed nongeneric operators. Apply AC Propositions 6.6–6.9 to discrete-series inducing data for the factorwise fibre description; Lemma 6.10 gives the supercuspidal orbit alternative. This is the additional normalization and fibre API required by the trace-defined parameter.

**Checks.**

- In rank one the adapter gives `χ↦χ∘N`; characters trivial on norms give the same lift.
- For an unramified extension of degree `ℓ` the Satake roots become `α_i^ℓ` with both hyperspecial volumes one.
- A supercuspidal whose lift ceases to be discrete gives a full orbit of `ℓ` distinct lower-rank supercuspidals; one common twist is insufficient for a general tempered fibre with several inducing blocks.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` §§7.0a–7.0b; §6.4; §4.9; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.3.

### 6.13 Twisted character support and real Paley–Wiener theorem

For a component of a reductive group over a characteristic-zero local field with rational points, each invariant orbital distribution `I_M(γ)` is supported on characters: it vanishes on any Hecke function whose invariant twisted character transform is zero. The real twisted trace transform is onto the Paley–Wiener families of Delorme–Mezo Theorem 4: finite `K`-type support, covariance under the root-of-unity change of extension, and Fourier transforms of smooth functions supported in the radius-`t` ball on each induced spectral parameter space. Thus the real trace Paley–Wiener assumption left in Kottwitz–Rogawski and Arthur’s original disconnected induction is supplied for the components used here.

*Hypotheses.* Use Delorme–Mezo’s real reductive component, chosen maximal compact group and radius convention; only representations whose restriction to the identity component is irreducible tempered enter its primary dual. Kottwitz–Rogawski’s general support theorem assumes trace Paley–Wiener; the two results are used together, not cited as two unconditional proofs of the same statement.

([R. E. Kottwitz and J. D. Rogawski — The distributions in the invariant trace formula are supported on characters](https://doi.org/10.4153/CJM-2000-034-6), Introduction p. 804; §6 Theorem 1 and proof pp. 810–813; [P. Delorme and P. Mezo — A twisted invariant Paley–Wiener theorem for real reductive groups](https://www.i2m.univ-amu.fr/perso/patrick.delorme/reprints-delorme/2008TwistedPaley-WienerMezo.pdf), §9 Theorem 4 and proof pp. 375–377; §7 Theorem 3 pp. 364–365.)

Delorme–Mezo Theorem 4: necessity follows from finite `K`-types, the scalar extension action and the Fourier support bound. For sufficiency convert the family to the main Theorem 3 data; normalized analytic intertwiners preserve the root-of-unity covariance and the spectral relations. Kottwitz–Rogawski §6: induct on dimension/Levi order, descend to regular elliptic elements, globalize the local group, use weak approximation and the cohomological conjugacy-separation lemmas, and isolate a positive multiple of the desired local distribution in the global trace identity. The global argument is an induction in Arthur’s formula, not a cycle using the final unitary stable comparison. Weak approximation for the group and the simply connected Hasse principle in §1.9 supply the conjugacy-separation step before applying the global trace induction.

**Checks.**

- A family invariant under `A↦−A` with nonzero value cannot be the order-two twisted trace transform.
- For `θ=1`, the covariance condition becomes the ordinary real trace transform condition.
- If every twisted character vanishes on `f`, every `I_M(γ,f)` vanishes.

*Needs:* §6.6; §6.4; §1.11; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.15 (Invariantization by Levi recursion); `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations).

### 6.14 Small-level functions are base-change transfers (the level `N_0`)

Let `S_pf` be a finite set of finite primes at which `F₀` need not be split. For every `v ∈ S_pf` there is an open neighbourhood `U_v` of 1 in `G_N(ℚ_v)` such that every `φ_v ∈ C_c^∞(G_N(ℚ_v))` supported in `U_v` has the property that, for each elliptic endoscopic `G_n⃗` of `G_N` and each Langlands–Shelstad transfer `φ_v^n⃗` of `φ_v` to `G_n⃗(ℚ_v), φ_v^n⃗` is the BC-transfer of some `f_v^n⃗ ∈ C_c^∞(𝒢_n⃗(ℚ_v))`. Consequently there is an integer `N₀ ≥ 1` divisible only by primes in `S_pf` such that, for every `N` divisible by `N₀`, the characteristic function of the principal congruence subgroup `K(N)_v` has this property at every `v ∈ S_pf`. Impose `N≥3` independently for a global fine level. The analogous statement for compact open subgroups of the unitary group `U(V)` of a hermitian space over `F` is Liu–Tian–Xiao–Zhang–Zhu Lemma D.2.2: in the sense of their Definition D.2.1, every compact open subgroup of `U(V)(F⁺_v)` is transferable at a place `v` of `F⁺` split in `F`, every sufficiently small one is transferable at a place of their finite bad set `Σ⁺_min ∪ Σ⁺_lr`, and outside `Σ_min∪Σ_lr`, the hyperspecial subgroup of the fixed self-dual lattice is transferable with inertial transfer `1_{GL_N(O_{F_v})}`.

*Hypotheses.* `v ∈ S_pf` finite; the elliptic endoscopic groups are those of §1.8. The finite exceptional sets retain the source's ramification and level conditions. Hyperspecial transfer outside `Σ_min∪Σ_lr` uses §4.10a in every residue characteristic; sufficiently small transferable levels are used at the prescribed bad places.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, Lemma 5.4.4 and Remark 5.4.5, pp. 71–72; [Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Appendix D.2, Definition D.2.1 and Lemma D.2.2(1)–(3), p. 369.)

By §6.9 `(d)`, there is a neighbourhood `U_n⃗` of 1 in `G_n⃗(ℚ_v)` all of whose semisimple elements are norms, because norms in a torus contain a neighbourhood of 1. Morel 2010 Lemma 8.4.2 gives a neighbourhood `V_n⃗` of 1 in `G_N(F₀ ⊗ ℚ_v)` such that semisimple elements of `G_n⃗(ℚ_v)` conjugate into `V_n⃗` are conjugate into `U_n⃗`; intersect over the finitely many `n⃗`. If `SO_γ(φ^n⃗) ≠ 0` then `γ` matches some `δ` with `O_δ(φ) ≠ 0`, so `δ ∈ U` and `γ` is conjugate into `U_n⃗`, hence a norm; conclude by §6.9 `(c)` (Caraiani–Scholze non-compact proof of Lemma 5.4.4, after Morel 2010 Lemma 8.4.1).

**Checks.**

- For `v` split in `F₀, U_v = G_N(ℚ_v)` works.
- When `S_pf` is empty, take `N₀=1`; choose `N≥3` separately. When every prime of `S_pf` splits in `F₀`, every level satisfies the transfer condition.
- At an unramified dyadic or triadic place with hyperspecial data, §4.10a keeps the hyperspecial unit. The norm-one torus tests there have value 1, while a proper principal congruence replacement has value 0.
- The constant function `1_{G_N(ℤ_v)}` need not be transferable in this sense at a ramified `v`; small support is a genuine hypothesis.

*Needs:* §4.10a (hyperspecial transfer in every residue characteristic); §6.9; §4.7; §1.8.

### 6.15 No proper cuspidal subsets when `[F^+:ℚ] ≥ 2`

If `[F^+ : ℚ] ≥ 2` then `𝒢_n⃗θ` admits no proper cuspidal Levi subset. If `F^+ = ℚ` (`F` imaginary quadratic) the analogue fails: the unitary similitude groups `G_N` then have proper cuspidal Levi subgroups `(R_{F/ℚ}𝔾_m)^s × G_{N−2s}`, and the stable trace formula for Igusa varieties can no longer be identified with the geometric side of the twisted trace formula, which acquires additional terms.

*Hypotheses.* `F = F^+F₀` CM; the statement is about the base-change coset of §6.6.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Lemma 5.5.3 and Remark 5.5.4, p. 74; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Remark 4.6, p. 27; [S. Morel — On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/abs/0802.4451v2), §8.2 p. 131 and Proposition 8.2.3 pp. 133–135.)

For a standard proper twisted Levi subset take its associated fixed Levi `M_H` in `G_n⃗`; use the cuspidality definition from §6.11. A proper `ℚ`-Levi of `G_n⃗` has a `Res_F/ℚ GL_h` factor. Its real split centre has `rank [F⁺:ℚ]`, while its `ℚ`-split centre has rank one. The quotient by the latter still has a positive-dimensional real split centre when `[F⁺:ℚ]>1`, so an anisotropic maximal real torus is impossible. This proves vanishing for proper geometric Levi terms only. It does not remove proper-Levi spectral terms, which remain in §6.22.

**Checks.**

- For `[F⁺:ℚ]=2` the proper fixed Levi factor `Res_F/ℚ GL₁` has a rank-two real split centre and rank-one rational split centre, hence is not cuspidal.
- For `F^+ = ℚ, (R_{F/ℚ}𝔾_m)^s × G_{N−2s} ⊂ G_N` is a proper cuspidal Levi subgroup (non-example of the hypothesis).
- The lemma is used only with test functions cuspidal at `∞`.

*Needs:* §6.11.

### 6.16 Central contribution to elliptic stabilization

In the same test-function and transfer normalization as §6.18, the contribution `T_e(G;central,f)` of rational central elliptic classes equals the sum of `ι(G,H)` times the complementary stable elliptic terms omitted from Kottwitz 1986 Theorem 9.6. For a proper datum `H` the complement consists of classes that are not `(G,H)`-regular; for the quasi-split inner datum it consists of the omitted central classes. This precise complement identity is the additional target needed to pass from Theorem 9.6 to the full `T_e` formula; it is not asserted proved by that theorem.

*Hypotheses.* `G_der` simply connected; local/global transfers and product formula fixed; same real split-centre quotient and central character on both sides.

([R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf), §9.5–9.6 pp. 393–396; [S. Morel — On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/pdf/0802.4451v2), Proposition 3.3.4 and Remark 3.3.5, pp. 55–58, Remark 6.2.2, p. 93, for the unitary archimedean calculation.)

Compute the complements directly. For a proper `H`, the real transfer of the Euler–Poincaré function has zero stable orbital integral on non-`(G,H)`-regular semisimple elements: multiply the stable discrete-series character formula by the transfer denominator, cancel the `H`-roots, and the remaining `G`-root factors vanish on precisely this singular set. For unitary groups Morel's proposition proves the cancellation, including the singular limit; the remark applies it to the elliptic sum. Thus every proper-`H` complementary term is zero. For the quasi-split inner datum, match rational central elements through the common centre. Semisimple descent and the zero-nilpotent germ compare the central values of the local inner transfers, with the centralizer Haar measure and the inner-form sign retained. At the real place use the same Weyl-character limit for the Euler–Poincaré function. Multiply these local comparisons: the global product of inner-form signs is one (§1.13), and the global transfer factor is one (§2.7). The central orbital quotient is a point, so the terms are the central values multiplied by `τ(G)`. Equality of the inner-form Tamagawa numbers (§6.5) gives the central identity term by term. Add it to Theorem 9.6. This argument uses germ coefficients and the special real transfer, rather than continuity of regular orbital integrals at a singular element.

**Checks.**

- For a torus the noncentral sides are zero, so this target carries the full identity.
- Omitting the central term cannot be justified by strong regularity of the transfer relation.
- A zero test function gives zero on each complement.

*Needs:* §6.7; §1.15; §2.7; §2.15; §1.13; §6.5; §2.6; §4.7.

### 6.17 Invariant orbital and character distributions on the twisted coset

For a characteristic-zero local field `k` and the component `𝒢θ` of `𝒢⋊⟨θ⟩`, use the connected group `𝒢` for conjugation and `θ`-stable parabolic/Levi subsets. For a Levi subset `Mθ`, construct the twisted weighted orbital distribution `J_M(δθ,f)` using the component discriminant `|det(1−Ad(δ)θ on 𝔤/𝔦_δθ)|^(1/2)`, connected centralizer quotient measure, and Arthur’s `(𝒢,M)`-family weight. Construct `J_M(π,X,f)` from normalized intertwining operators for the corresponding induced `θ`-stable representation, retaining its chosen extension. Define the maps `φ_L` from weighted characters and the invariant distributions recursively by `I_M^𝒢=J_M^𝒢−Σ_{L⊊𝒢} Ĩ_M^L∘φ_L`, in both orbital and spectral variables. `Ĩ` denotes descent to the invariant character quotient. At `M=𝒢` the orbital distribution is the discriminant-normalized twisted orbital integral and the spectral distribution is the ordinary twisted character transform. The geometric test-function transfer uses unnormalized orbital integrals; convert by the displayed discriminant rather than identifying the two normalizations.

*Hypotheses.* Measures, central character and normalized intertwiner are fixed; `π` is tempered for the initial spectral transform. Functions are in Arthur’s smooth Hecke/almost-compact spaces on the component, `K`-finite at real places; the quotient is by functions whose twisted character transforms vanish. The induction through lower-dimensional Levi subsets uses character support, provided by the separate twisted Paley–Wiener/character-support theorem.

([J. Arthur — The invariant trace formula I. Local theory](https://www.claymath.org/library/cw/arthur/pdf/26.pdf), §2 (2.1) pp. 331–332; §3 (3.1) pp. 335–336; Corollary 8.3 and Proposition 9.1; [R. E. Kottwitz and J. D. Rogawski — The distributions in the invariant trace formula are supported on characters](https://doi.org/10.4153/CJM-2000-034-6), §6 Theorem 1 pp. 810–813.)

The interface consists of the following operations and identities.

- Produce the component Hecke space, weighted families, `φ_L` and the two recursive invariant families with fixed measure/extension data.
- `J_M, I_M` and `φ_L` are linear in `f`.
- At the full Levi the proper-Levi sum is empty; the result is the normalized orbital integral or twisted character transform.
- For each proper Levi, `I_M=J_M−Σ_{L⊊𝒢}Ĩ_M^L∘φ_L`; the hatted maps factor through the twisted character quotient.
- `I_M` is invariant under conjugation by the connected group, with Levi data transported accordingly.
- Arthur `I` Corollary 8.3 transports a semisimple orbital term to the connected centralizer, preserving the component discriminant and quotient measures.
- Arthur `I` Proposition 9.1 splits a tensor-product term into the local invariant/constant-term terms with its `d_M^𝒢` coefficients.
- The identity automorphism recovers AS.6’s weighted distributions and recursion, not a second untwisted construction.

Use the component kernel and the same truncation parameter/chambers as AS.6, transporting them to `θ`-stable parabolics; AS.6 supplies the untwisted machinery and does not assert these coset identities. Construct weighted orbital integrals and weighted characters with the component discriminant and global/local intertwiner conventions. Arthur `I` §§2–3 defines the invariant recursion simultaneously on components. Induct on the dimension of proper Levi subsets; character support makes the hatted distributions on the quotient well-defined. Arthur `I` Corollary 8.3 and Proposition 9.1 give the descent and splitting identities. Use the two completions of Arthur II §5: Kottwitz–Rogawski supplies support on characters and Delorme–Mezo the real twisted trace transform. These complete the disconnected induction.

**Checks.**

- For `θ=1` the orbital discriminant and recursion equal the AS.6 definitions.
- For `M=𝒢, I_M=J_M`; no subtraction is made.
- Replacing A by `−A` changes the weighted character sign, even though `A²=1` in both cases.
- For a torus with `θ=1` the discriminant is 1 and the orbital quotient is a point.

*Needs:* §6.6; §6.4; §6.13; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.10 Weighted orbital integrals; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.15 (Invariantization by Levi recursion); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); §2.1.

### 6.18 Kottwitz's stabilization of the elliptic terms

Let `G` be connected reductive over `ℚ` with `G_der` simply connected, `f = ∏_v f_v ∈ C_c^∞(G(𝔸))` with `f_∞` the Euler–Poincaré (Lefschetz) function of an irreducible algebraic representation `ξ` (§2.10). Let `T_e(f) = Σ_γ |G_γ(ℚ)/I_γ(ℚ)|⁻¹ τ(I_γ) O_γ(f)` be the elliptic part of the trace formula, the sum over the elliptic semisimple `G(ℚ)`-conjugacy classes `γ` with connected centralizer `I_γ` (Kottwitz 1986 §9.1); since `G_der` is simply connected the component factor is 1. Grouping the rational classes inside each stable class of the quasi-split inner form `G₀` gives `T_e(f) = Σ_{γ₀} τ(I₀) Σ_γ O_γ(f), γ` over the `G(ℚ)`-classes in the stable class of `γ₀` (Kottwitz 1986 (9.6.1), using `τ(I_γ)=τ(I₀)`); the adelic classes, the signs `e(γ)` and the `κ`-sum enter only in the proof. Then `T_e(f) = Σ_{(H,s,η)} ι(G,H) ST^H_e(f^H)`, the sum over isomorphism classes of elliptic endoscopic triples of `G`, where `f^H = ∏_v f^H_v` with `f^H_v` a transfer of `f_v` (§2.11, §4.7), `f^H_v` the unramified image of `f_v` at almost all `v` (§4.11), and `f^H_∞` the explicit combination of averaged pseudo-coefficients of §2.15. The `ker¹` factors and the `κ`-sum are those of §1.15.

*Hypotheses.* `G_der` simply connected (achieved by a `z`-extension otherwise); `f_∞` stable cuspidal (Euler–Poincaré), so only elliptic terms occur; transfer factors normalised as a global product equal to 1 on rational pairs (§2.7); At infinity use functions compact modulo `A_{G,∞}⁰` with the central character fixed by `ξ`, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; `C_c^∞` in this construction denotes this central-character space, not ordinary compact support on the whole group. Local/global transfer, compatibility and almost-all-place fundamental lemma are supplied by Layer 2/Layer 4. The simply connected Hasse/Tamagawa inputs of Kottwitz §9.3 are needed for the centralizers. The full elliptic identity includes the separate central-elliptic-stabilization target. Without that target, the primary theorem establishes only the noncentral identity.

([R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf), §9.1 p. 391; §§9.2–9.7 pp. 392–397, especially §9.5 and Theorem 9.6 p. 393, (9.6.1)–(9.6.6) pp. 394–395 and Lemma 9.7 p. 396; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.4, p. 36; [S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5.1, Lemma 5.1, pp. 15–16; §7, Lemma 7.1, p. 26.)

Kottwitz 1986 (9.6.1)–(9.6.4): count rational classes in an adelic stable class via `ker¹(I)→ker¹(G)`, translate the existence condition through the global Kottwitz obstruction and apply finite Fourier inversion in `κ`. Use Lemma 9.7 to identify pairs (stable `γ,κ`) with elliptic endoscopic data and transferred stable classes. Its existence/uniqueness and automorphism-orbit calculation produce the outer automorphism denominator; they are not a simple bijection before taking these orbits. Apply the transfer-factor product formula and local matching; the cohomological exact-sequence calculation in the proof produces the relative `τ₁(G)/τ₁(I)` coefficients. Use the number-one target to replace relative Tamagawa numbers by absolute ones. Theorem 9.6 gives `T_e* = Σι ST_e**` only: omit central classes on `G`, use `(G,H)`-regular classes for proper `H`, and omit central classes for its quasi-split inner datum. Add the central complement of §6.16 to obtain the full displayed `T_e` identity.

**Checks.**

- For `G` anisotropic with only the trivial elliptic endoscopic triple, `T_e(f) = ST^G_e(f^G)` with `f^G = f`.
- For `G = 𝔾_m` every class is stable and the identity is tautological.
- For a unitary similitude group `G_N` the sum runs over `(G_N,1,id)` and the `(G_{n₁,n₂}, s, η)` of §1.8.

*Needs:* §6.7; §1.15; §2.11; §4.7; §4.11; §2.15; §2.7; §6.5; §6.16; §1.11.

### 6.19 The invariant twisted trace formula for the unitary base-change spaces

On the component `𝒢_n⃗θ` of `𝒢_n⃗⋊⟨θ⟩`, the invariant global formula equates `I_geom(fθ)` and `I_spec(fθ)`. Use fixed-central-character functions compact modulo the specified positive real split centre; restrict to `𝒢(𝔸)¹` after the central-character twist, as in Shin §4.5. The geometric expansion is the sum over Levi subsets and rational classes of Arthur’s coefficients times the invariant twisted orbital distributions; the spectral expansion is the sum over discrete inducing data and intertwiner terms of the invariant twisted character distributions. The precise distributions are §6.17. The spectral expansion is Arthur II Theorem 4.4, a sum over `t ≥ 0` taken in increasing order of `t`, with the convergence estimate of Arthur II §6, Corollary 6.5; no absolute convergence of the double sum is asserted. Splitting and descent are part of the same component theory.

*Hypotheses.* `𝒢^+_n⃗` is a non-connected group whose coset `𝒢θ` is defined by an automorphism `θ` of order 2 preserving a `ℚ`-splitting; `f` has the stated central character. At infinity use functions compact modulo `A_{G,∞}⁰` with the central character fixed by `ξ`, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; `C_c^∞` in this construction denotes this central-character space, not ordinary compact support on the whole group.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, (5.5.1), p. 72; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, p. 26; [J. Arthur — The invariant trace formula II. Global theory](https://www.claymath.org/library/cw/arthur/pdf/27.pdf), §1 p. 505; Theorem 3.3 p. 512; Theorem 4.4 pp. 520–521; §6 Corollary 6.5 p. 537.)

Use Arthur II Theorems 3.3 and 4.4 for the fine geometric/spectral expansions of the component kernel, with invariant recursion from §6.17. AS.6 supplies the connected kernel/truncation interface, not the twisted theorem. Arthur’s original §1 scope restriction is removed by the separate Kottwitz–Rogawski character-support and Delorme–Mezo Paley–Wiener inputs. Record their approximation and real harmonic-analysis proof inputs explicitly. Apply Arthur II Theorem 4.4 with its ordering in `t` and the estimate of Corollary 6.5, and restrict the central character. Transfer of central characters uses the base-change split-centre map; it does not require simultaneously imposing trivial and `ξ`-central characters on the same function.

**Checks.**

- For `θ` trivial (no twist) the statement reduces to AutomorphicSpectralTheory §6.16 Invariant trace formula.
- If `𝒢θ(ℚ)\𝒢(𝔸)¹` were compact the formula would reduce to the twisted Selberg trace formula.
- For `f` cuspidal at `∞` with `[F^+:ℚ] ≥ 2`, the geometric side reduces to elliptic terms (§6.21).

*Needs:* §6.17; §6.13; §6.6; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.6 (Coarse trace formula); `TauCetiRoadmap.AutomorphicSpectralTheory` §6.12 Fine geometric expansion; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.13 Fine spectral expansion.

### 6.20 The archimedean invariant vanishing and character identity

In Morel’s base-change component for a quasi-split cuspidal fixed group `H` with simply connected derived subgroup, let `f∞` be a twisted pseudo-coefficient of the `θ`-discrete representation with parameter `φ|W_ℂ`, for the discrete-series packet associated with a regular algebraic coefficient of H. After splitting, a term for `M` can survive only when `A_M=A_M,ℝ`. For such `M, I_M^𝒢(γ,f∞)=0` if the associated fixed Levi `M_H` is not cuspidal. If it is cuspidal, `I_M^𝒢(γ,f∞)=|D^M(γ)|^(1/2) Φ_M^𝒢(γ,f∞)`, where the discriminant uses the semisimple part of `γθ` and `Φ` is the `θ`-discrete packet character expression of Morel §8.2. It is zero on non-`θ`-semisimple `γ`. These identities yield Morel Proposition 8.2.3; its spectral coefficients still incorporate discrete data from proper Levi subsets.

*Hypotheses.* Use Morel’s hypotheses and central-character spaces; no claim for an arbitrary disconnected reductive group or arbitrary infinity function. The `θ`-discrete characters have the infinitesimal character and central character of the chosen regular algebraic coefficient; the boundary relations and unipotent limits below are taken in that same central-character space.

([S. Morel — On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/abs/0802.4451v2), §8.2 Proposition 8.2.3 and proof pp. 133–135; Lemmas 8.2.5/8.2.6 pp. 135–136; Lemma 8.1.10 p. 130.)

Apply Arthur `I` Proposition 9.1 and Corollary 9.2 to isolate the infinity factor and force equality of rational and real split centres. For a noncuspidal associated fixed Levi, Morel Lemma 8.2.6 first descends a regular element to a proper real Levi and uses cuspidality. Local centralizer orbital integrals and their regular density extend zero to singular and unipotent elements. For a cuspidal `M`, prove the regular character identity by induction on `M` using the differential equations, growth estimate and boundary relations for `θ`-discrete characters; the full-group case is Morel Lemma 8.1.10. Use Morel Lemma 8.2.5 and connected-centralizer unipotent orbital limits to extend from regular semisimple elements. Substitute in the split geometric expansion. The separate global no-proper-cuspidal theorem then removes the proper geometric terms when `[F⁺:ℚ]>1`.

**Checks.**

- For the full component the fixed Levi is `H`, which is cuspidal; testing cuspidality on complex `GL_n` would incorrectly erase this term.
- A noncuspidal fixed Levi gives zero even at a singular semisimple element, not merely on the regular set.
- At degree one a proper cuspidal fixed Levi may survive; infinity cuspidality alone does not imply the simple geometric identity.

*Needs:* §6.17; §6.10; §6.11; §2.14; `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations).

### 6.21 The simple twisted geometric side equals a stable elliptic sum

Assume `[F^+:ℚ] ≥ 2`. Let `φ^n⃗ = (φ^n⃗)^S φ^n⃗_{S_f} φ_{G_n⃗,ξ} ∈ C_c^∞(G_n⃗(𝔸))` and `f^n⃗ = (f^n⃗)^S f^n⃗_{S_f} f_{𝒢_n⃗,Ξ} ∈ C_c^∞(𝒢_n⃗(𝔸))` with `(φ^n⃗)^S` and `φ^n⃗_{S_f}` BC-transfers of `(f^n⃗)^S` and `f^n⃗_{S_f}` (§6.8, §6.9) and the archimedean functions of §6.10. Then `I^{𝒢_n⃗θ}_geom(f^n⃗θ) = Σ_γ SO^{G_n⃗(𝔸)}_γ(φ^n⃗) = τ(G_n⃗)⁻¹ ST^{G_n⃗}_e(φ^n⃗)`, the middle sum over `ℚ`-elliptic semisimple stable conjugacy classes of `G_n⃗(ℚ)`; equivalently the geometric side is the sum over `θ`-elliptic `θ`-conjugacy classes `δ` of `𝒢_n⃗(ℚ)` of `vol(I_{δθ}(ℚ)A_{𝒢θ}\I_{δθ}(𝔸)) O_{δθ}(f^n⃗)`.

*Hypotheses.* `[F^+ : ℚ] ≥ 2` (used through §6.15); `f^n⃗` cuspidal at `∞` (the Lefschetz function); BC-matching at every finite place; At infinity use functions compact modulo `A_{G,∞}⁰` with the central character fixed by `ξ`, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; `C_c^∞` in this construction denotes this central-character space, not ordinary compact support on the whole group.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Proposition 5.5.1 and proof, pp. 72–74; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, Proposition 4.5 and Corollary 4.7, p. 27; [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 4.3.2 and Théorème 4.3.4 (§4.3, pp. 102–103); [A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Proposition 5.3.1, p. 737; [S. Morel — On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/abs/0802.4451v2), Proposition 8.2.3 pp. 133–135 and Lemma 8.2.6 p. 136; [L. Clozel and J.-P. Labesse — Orbital integrals and distributions](https://www.claymath.org/library/proceedings/cmip013c.pdf), Theorems 4.1/5.1 pp. 113–114.)

Apply §6.20 (Morel Proposition 8.2.3 and Lemmas 8.2.5/8.2.6). The fixed-Levi definition of cuspidality and `[F⁺:ℚ]>1` leave only the full geometric term; no second finite cuspidal place is required. Clozel–Labesse’s corrected singular-centralizer orbital formula and the real norm matching give the elliptic semisimple expression. Use the same quotient measures and transported central character; a regular-only orbital formula would not justify the singular sum. Shin Proposition 4.5 and Corollary 4.7: `T_el=J(Zθ) I_geom` and `T_el=(τ(𝒢)J(Zθ)/(τ(G)d(G,𝒢)))ST_e`. Here `τ(𝒢)=1` and `d(G,𝒢)=1` because `H¹(ℝ,𝒢)=0`. Cancel `J(Zθ)` to obtain `I_geom=τ(G)⁻¹ST_e`. The intermediate central-volume factor is not silently set to one.

**Checks.**

- For `n⃗ = (1)` the identity reduces to a statement about the elliptic part of the twisted trace formula of a torus.
- Dropping `[F^+:ℚ] ≥ 2` (`F` imaginary quadratic) makes the identity false in general: extra cuspidal-Levi terms appear (Caraiani–Scholze non-compact Remark 5.5.4).
- Both sides vanish when `f^n⃗_v = 0` at one place.

*Needs:* §6.19; §6.15; §6.10; §6.8; §6.9; §6.7; §6.5; §6.20.

### 6.22 The spectral side of the simple twisted trace formula

With `f^n⃗` as in §6.21, `I^{𝒢_n⃗θ}_spec(f^n⃗θ) = Σ_M |W_M| |W_{𝒢_n⃗}|⁻¹ |det(Φ_n⃗⁻¹θ − 1)_{𝔞^{𝒢θ}_M}|⁻¹ Σ_{Π_M} tr(n-Ind^{𝒢_n⃗}_Q(Π_M)_ξ(f^n⃗) ∘ A′)`, where `M` runs over Levi subgroups of `𝒢_n⃗` containing a fixed minimal Levi `M₀, W_M` and `W_{𝒢_n⃗}` are Weyl groups relative to `M₀` (the denominator is the Weyl group of `𝒢_n⃗`, Caraiani–Scholze 2017 §5.5, with the Weyl denominator taken in the ambient twisted group), `Φ_n⃗⁻¹θ` acts as `−1` on `𝔞^{𝒢θ}_M` so the determinant is non-zero, `Q` is a parabolic with Levi `M, Π_M` runs over the irreducible `Φ_n⃗⁻¹θ`-stable subrepresentations of the relatively discrete spectrum `R_{M,disc}` (each occurring with multiplicity one by multiplicity one for general linear groups), the subscript `ξ` is the twist by the character of `A^0_{𝒢,∞}` determined by `ξ`, and `A′` is the normalised intertwining operator on `n-Ind(Π_M)_ξ` composed with `θ` (Shin 2011 §4.5). Each `n-Ind(Π_M)_ξ` is a `θ`-stable isobaric irreducible automorphic representation, and its archimedean component is cohomological for `Ξ` when its trace against `f_{𝒢,Ξ}` is non-zero. The quotient `𝔞_M^{𝒢θ}` is by the `θ`-fixed full-group split space, not by the full split space. Thus even `M=𝒢` can have nonzero anti-invariant dimension `r`, and the coefficient is `2^(−r)`, not automatically one. The inducing data include residual Speh representations. `A′` is the global normalized intertwiner `M_Q|Qs(0)ρ_Q(s,0,θ;Π_M)` of Shin Lemma 4.11, with the `ξ` central twist; choosing an arbitrary order-two extension does not reproduce its trace sign. For the unitary twisted GL group and test functions of Shin §4, the invariant twisted spectral distribution is the sum over Levi `M` of `|W_M|/|W_G|` times `|det(Φ⁻¹θ−1)` on `a_M^(Gθ)|⁻¹`, times traces on the relatively discrete Levi spectrum of the normalized intertwining composite. After the stated central character twist, Shin Corollary 4.14 identifies this composite with the normalized `θ`-intertwiner `A′` on the induced representation. At the full Levi the determinant is `2^r` for `r` nonzero components of the endoscopic datum `vecn`, so its reciprocal spectral coefficient is `2^(−r)`; at a maximal proper Levi it is `2^(r+1)`.

*Hypotheses.* `f^n⃗_∞` a twisted Lefschetz function; the discrete spectrum of the general linear Levi `M` as described by Mœglin–Waldspurger. Use Shin’s real Lefschetz function and central-character normalization. Convergence and the invariant trace formula come from AS.6, independently of Igusa cohomology.

([S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, Proposition 4.8 and Corollary 4.14, pp. 28–30; [A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Proposition 5.3.3 and Remark 5.3.4, p. 738; [A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.6, proof of Lemma 5.6.2, pp. 75–76; [C. Mœglin and J.-L. Waldspurger — Le spectre résiduel de GL(n)](https://www.numdam.org/item/ASENS_1989_4_22_4_605_0.pdf), §I.1.1(3) and proof pp. 607–608; [Sug Woo Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Proposition 4.8 and Remark 4.10, p. 28; Lemma 4.11, p. 29; Corollary 4.14, p. 30 (author copy).)

Shin Proposition 4.8: start with Arthur’s spectral expansion and its chosen parameter ordering. The infinity infinitesimal character eliminates the additional Weyl terms; the surviving involution acts by `−1` on the indicated quotient, giving determinant `2^dim`. Shin Lemma 4.11 and Corollary 4.14: use the global functional equation and normalized intertwiner to fix `A′` and its square; the `ξ` twist restricts to `𝒢(𝔸)¹`. Proper spectral Levi terms remain. Use AutomorphicSpectralTheory §4.14a for the number-field residual classification and multiplicity one, with the unchanged pairs `(ρ,b)` and representations `ρ⊠b` of §5.1 in each GL factor of the Levi. Mœglin–Waldspurger §I.1.1(3) gives irreducibility of unitary induction and holomorphic invertible normalized operators at the unitary point; its proof invokes Bernstein’s non-archimedean theorem (§6.1) and the archimedean theorem of §6.1. Nonzero Lefschetz trace forces the required cohomological infinity component. Use the invariant spectral expansion and group the regular Weyl terms. Use the `Φ⁻¹θ` involution to identify the single surviving regular element. Insert those supplied residual blocks into each Levi discrete summand. Transport the intertwining operator through the explicit central twist and retain its determinant coefficient.

**Checks.**

- For a full Levi with anti-invariant dimension `r`, the term is `2^(−r) tr(Π(f)A′)`, including residual `Speh Π`; for a single GL block `r=1` its determinant coefficient is `1/2`.
- The coefficient `|det(Φ⁻¹θ − 1)|⁻¹` equals 1 when `𝔞^{𝒢θ}_M = 0`.
- Non-`θ`-stable discrete `Π_M` contribute zero.
- A proper spectral Levi can contribute even when every proper geometric Levi term is zero; the two expansions have different indexing data.
- For a full Levi with two nonzero endoscopic blocks the determinant is 4 and its reciprocal coefficient is `1/4`.
- Absorbing the normalization operator into an unnamed scalar fails the target.

*Needs:* §6.19; §6.10; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.13 Fine spectral expansion; §6.4; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); `TauCetiRoadmap.AutomorphicSpectralTheory` §4 (Automorphic spectral completeness); `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations); §6.1; `TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a (**Number-field GLₙ residual blocks**); §6.6; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.16 Invariant trace formula.

### 6.23 The simple trace formula for division-algebra unitary groups

Let `F = F_0K` be a CM field with `F₀` totally real of even degree over `ℚ` and `K` imaginary quadratic, `D` a central division algebra over `F` of dimension `n²` with an involution * of the second kind, and `G` the unitary similitude group of `(D, *)` chosen as in Scholze's Lemma 8.1: signature `(1, n−1)` at one infinite place of `F₀` and `(0, n)` at the others, `G_{ℚ_p} ≅ GL_n(F_w) × (D′)^× × ℚ_p^×` at a prime `p` split in K. Then `G(ℚ)\G(𝔸)/A_G` is compact, with the division-place test-function restriction the stabilised elliptic sum reduces to the term of `G` itself, and for test functions with a component at a place where `D` is a division algebra (as used by Kottwitz and Scholze), the contributions of the proper elliptic endoscopic groups vanish; for `f = f^∞ f_∞` with `f_∞` Kottwitz's Euler–Poincaré function of `ξ`, the elliptic part of the trace formula equals `Σ_π m(π) tr(π_f(f^∞)) tr(π_∞(f_∞))`, where `π` runs over automorphic representations of G. Further, `π_f` contributes to the `ξ`-cohomology only if `π_∞` is cohomological, and the global Jacquet–Langlands correspondence relates such `π` (with the stated local conditions on `D`) to cuspidal or residual automorphic representations of `GL_n` over F.

*Hypotheses.* `D` a division algebra (the ramification hypothesis of Scholze Remark 8.3 needed for the global Jacquet–Langlands step); `[F₀:ℚ]` even (needed for the existence of `D`, *, and for base change); `p` split in `K`; `D` splits away from the pair `x`,xᶜ over `x₀`, with local division-algebra data of Scholze §8 Lemma 8.1; the distinguished place `w` used for cohomology is different from `x`,xᶜ. Proper-endoscopy vanishing uses the division-place component, not anisotropy alone.

([P. Scholze — The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8, Lemma 8.1 and Remarks 8.2–8.3, p. 19; [P. Scholze — The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10, Corollary 10.1, p. 26; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.4, p. 36.)

Existence of `(D,*,h₀)` with the signatures: Scholze Lemma 8.1 (Kottwitz 1992; Harris–Taylor §I.7). Compactness: `D` is a division algebra, so `G` is anisotropic modulo centre and AutomorphicSpectralTheory §6.17 (Trace formula for compact quotients) applies. Vanishing of proper endoscopic contributions and the identity of the elliptic part with the spectral side: Kottwitz's argument for simple Shimura varieties (Kottwitz 1992, Invent. Math. 108), used by Scholze §§9–10 (Corollary 10.1); applied in §6.18 in the case of the trivial triple. The global Jacquet–Langlands step is cited by Scholze through Harris–Taylor and Clozel's base change, §6.27.

**Checks.**

- For `n = 1 G` is a torus and the identity is the Poisson-type formula for the compact torus quotient.
- Replacing `D` by a split algebra leaves the scope of this construction; no assertion that every split-algebra unitary quotient is noncompact is made.
- For `f_∞` the Euler–Poincaré function, non-cohomological `π_∞` contribute zero.

*Needs:* §9.1 (raw compact-unitary models, coefficient cohomology and actions); `TauCetiRoadmap.AutomorphicSpectralTheory` §6.17 (Trace formula for compact quotients); §6.18; §2.10; `TauCetiRoadmap.PELModuli` §M0.7 (The similitude group); `TauCetiRoadmap.PELModuli` §M5.5 (Unitary PEL data with prescribed signatures).

### 6.24 All-place compatibility for supplied global cyclic base change

Use AutomorphicSpectralTheory §§7.0a–7.0c and 7.1 for cyclic GL normalized characters, local transfer, the cyclic trace comparison, and global base change, descent, self-twist alternatives and constituent-wise fibres. The representations and maps are the supplier's. For a prime-degree cyclic extension `E/F` of number fields, prove that its almost-everywhere base change of cuspidal unitary data, and of their permitted induced products, matches those local maps at every place with this roadmap's measures, duals and central twists. At a real place becoming complex, restrict the supplied `W_ℝ`-parameter to `W_ℂ`; at a split place use cyclic permutation of the local tensor factors.

*Hypotheses.* Prime-degree cyclic `E/F`; use unitary cuspidal global data and the supplier's unitary/residual character theorem when an individual nongeneric character is substituted. The Langlands-data extension at other local quotients carries no extra Shintani assertion. Archimedean parameters use AutomorphicLFunctionsAndLocalFactors, **Representation prerequisites**, **Archimedean GLₙ parameters**.

([J. Arthur and L. Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter III, Proposition 4.4 pp. 210–211 and Theorem 5.1 pp. 212–213; Chapter `I` §6, pp. 51–64.)

Start with the supplier's trace comparison and global lifting theorem. Vary the test at one place and apply local character independence to its normalized character expansion; the adapter of §6.12 identifies the finite-place operators. Use the supplied unitary/residual character identities for those constituents. At infinity compute restriction in the supplied archimedean dictionary. Strong multiplicity one identifies this all-place lift with the supplier's almost-everywhere map, preserving its global descent and fibre statements.

**Checks.**

- For a Hecke character the all-place map is composition with the idele norm, including `N_ℂ/ℝ(z)=|z|²`.
- For `χ(x)=`sgn`(x)^ε|x|^t` at a real place, complex base change is `|z|^(2t)`; it forgets `ε`.
- In the self-twist case base change retains all distinct conjugate cuspidal blocks, rather than becoming a cuspidal representation.
- At an unramified place of residue degree `r` the roots become `α_i^r`, agreeing with §6.12.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` §§7.0a–7.0c and 7.1; §6.12; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, **Archimedean GLₙ parameters**.

### 6.25 Stable–twisted identity for unitary similitude groups

Assume `[F^+:ℚ] ≥ 2`. For every vector `n⃗` and every pair of BC-matching functions `φ^n⃗ ∈ C_c^∞(G_n⃗(𝔸)), f^n⃗ ∈ C_c^∞(𝒢_n⃗(𝔸))` as in §6.21 (unramified outside `S`, small level at `S_pf` as in §6.14, any function at split primes, Euler–Poincaré and Lefschetz functions at `∞`), `ST^{G_n⃗}_e(φ^n⃗) = τ(G_n⃗) I^{𝒢_n⃗θ}_spec(f^n⃗θ)`, with the spectral side expanded as in §6.22. Combined with §6.18, for `G` an inner form of `G_N` with `G(𝔸_f) ≅ G_N(𝔸_f)` and any `f` on `G(𝔸)` with Euler–Poincaré `f_∞, T_e^G(f) = Σ_{G_n⃗ ∈ E^ℓ(G)} ι(G,G_n⃗) τ(G_n⃗) I^{𝒢_n⃗θ}_spec(f^n⃗θ)`, where for each `n⃗` the function `f^n⃗` is chosen BC-matching with the transfer `f^{G_n⃗}`. This holds for every `rank N` and both parities (with the pairs excluded by Kottwitz's condition 7.4.3 omitted) and for `G_ℝ` of arbitrary signature.

*Hypotheses.* `[F^+:ℚ] ≥ 2`; the transfers `f^{G_n⃗}` exist as BC-transfers at every place (§6.9, §6.14); Euler–Poincaré function at `∞`; At infinity use functions compact modulo `A_{G,∞}⁰` with the central character fixed by `ξ`, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; `C_c^∞` in this construction denotes this central-character space, not ordinary compact support on the whole group.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §§5.5–5.6, Proposition 5.5.1 and Theorem 5.6.1, pp. 72–75; [A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Theorem 5.3.2 and Proposition 5.3.3, pp. 737–738; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 4.7, p. 27.)

Combine §6.21 with the twisted trace formula `I_geom = I_spec` (§6.19). Insert into the elliptic stabilization §6.18; the factors `ι(G,G_n⃗)τ(G_n⃗) = τ(G)|Out|⁻¹` and the factor ½ for `n₁ = n₂` come from `|Out(G_{n,n})| = 2` (§6.7). The widening to every rank, both parities and arbitrary signature is Caraiani–Scholze 2017 §5.2–5.3; the non-compact case with level `N₀` is Caraiani–Scholze non-compact §§5.4–5.6.

**Checks.**

- For `N = 1` the identity is the base-change identity for the torus `G₁`.
- For `n₁ = n₂ = N/2` the coefficient carries the factor ½ seen as `ε_n⃗` in Caraiani–Scholze non-compact Theorem 5.6.1.
- The hypothesis excludes `F^+ = ℚ`: proper cuspidal Levi subgroups of the form `Res_{F/ℚ} G_m^s × G_{2(n−s)}` may contribute, so Remark 5.5.4 does not justify the displayed identification there. It does not assert failure for every test function; the zero test still gives zero on both sides.

*Needs:* §6.21; §6.22; §6.18; §6.14.

### 6.26 Cyclic automorphic induction for `GL_n` (Arthur–Clozel)

Let `E/F` be a cyclic extension of number fields of degree `ℓ` (prime or not) and `π_E` an automorphic representation of `GL_m(𝔸_E)` induced from cuspidal. Say that an automorphic representation `π_F` of `GL_{mℓ}(𝔸_F)` is automorphically induced from `π_E` if at almost all places `v` unramified in `E`, the Satake parameter of `π_{F,v}` is the induction of those of `π_{E,w}`: at `v` split in `E` it is the direct sum over `w | v`, and at an arbitrary unramified `v` it is `⊕_{w|v} Ind_{W_{E_w}}^{W_{F_v}}`. Then there exists one and only one such `π_F`, and `π_F` is induced from cuspidal. For `ℓ` prime and `π_E` cuspidal, `π_F` is cuspidal iff `π_E` is not isomorphic to its Galois conjugate `π_E^σ`; the induction is transitive along towers of cyclic extensions; and its base change to `E` is the isobaric sum of the Galois conjugates of `π_E`. For a cyclic extension `L/K` of degree `r` and an automorphic representation `Π` of `GL_a(A_L)` induced from unitary cuspidal data, there is a unique automorphic induction `AI_L/K(Π)` on `GL_`(ar)`(A_K)` in that class, characterized by induction of unramified Weil parameters almost everywhere. At split places its parameter is the direct sum over the places above; at inert places it is `Ind_(W_Lw)^(W_Kv)`. For prime degree and cuspidal `Π`, induction is cuspidal precisely when the Galois orbit has size `r`. Transitivity handles the stated cyclic towers.

*Hypotheses.* `E/F` cyclic; `π_E` induced from cuspidal Use the induced-from-cuspidal class of AC III §6. The prime-degree cuspidality criterion is distinguished from the general transitivity statement.

([J. Arthur and L. Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 3 Definition 6.1 and Theorem 6.2 p. 215; Corollary 6.5 p. 218; [P. Scholze — The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §14, p. 35; [James Arthur and Laurent Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter III, Definition 6.1 and Theorem 6.2, p. 215; proof, pp. 215–217; Lemma 6.4, pp. 217–218; Corollary 6.5, p. 218.)

Use prime-degree cyclic base change and its cuspidal fibres to construct induction as in AC Ch. 3 §6, Theorem 6.2 p. 215; iterate along a cyclic tower. Verify the unramified induced Satake parameter at every splitting type, then apply strong multiplicity one and Rankin–Selberg pole counting. This proof does not introduce an additional unspecified character-twisted trace formula. Uniqueness from strong multiplicity one; cuspidality criterion from the Rankin–Selberg pole count (AutomorphicLFunctionsAndLocalFactors AL.3 — Rankin–Selberg theory and function-field factors) and §6.24 (AC Ch. 3 Theorem 6.2, p. 215, and Corollary 6.5, p. 218, proof to p. 219). Construct the induced Satake parameters at split and inert places. Use the cyclic base-change descent alternatives to produce the global representation. Use strong multiplicity one for uniqueness and induction by stages for transitivity. Compute the central character by the determinant of the induced local parameter, including the permutation determinant character.

**Checks.**

- For `m = 1` and `ℓ = 2`, the induction of a Hecke character `χ` of `E` is the classical automorphic induction (`θ` series) to `GL₂(𝔸_F)`.
- The induction of the trivial character of `𝔸_E^×` is the isobaric sum of the characters of `𝔸_F^×/F^×N(𝔸_E^×)`.
- If `π_E ≅ π_E^σ` the induction is not cuspidal.
- For rank-one input and quadratic `L/K, det Ind χ` equals the transfer of `χ` times the quadratic extension character.
- A Galois-invariant cuspidal input induces a noncuspidal isobaric sum.

*Needs:* §6.24; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 — Rankin–Selberg theory and function-field factors.

### 6.27 Base change and descent between unitary groups and `GL_n` over CM fields

For exactly the division-algebra unitary similitude datum of Scholze §8 (totally real `F₀` of even degree, `F=F₀K, D` split away from `x`,xᶜ and the signatures of Lemma 8.1), let `Π` be cuspidal, conjugate self-dual, regular algebraic on `GL_n(𝔸_F)`, with `Π_x` essentially square-integrable. Scholze Theorem 10.5 gives an algebraic Hecke character `ψ` of `K` and `π_f` occurring in `ξ`-cohomology such that at every rational prime `p′` split in `K` and every `w′|p′` different from `x`,xᶜ the `GL_n`-factor of `π_{p′}` is `Π_{w′}`, while its similitude `GL₁`-factor is `ψ_{u′}`. One may arrange `ψ` unramified at a prescribed such `p′`. At a split place the entire pair consisting of the `GL₁` multiplier character and all `GL_n`-factors determines the local similitude representation. Broader quasi-split base change and converse descent are not established by this source and require a separate theorem at their broader scope.

*Hypotheses.* `F₀` totally real of even degree in the division-algebra case; `p` and the descent place split in `K`; `Π` cuspidal, conjugate self-dual, regular algebraic, with a square-integrable component.

([P. Scholze — The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8 Lemma 8.1 and Remark 8.3 pp. 19–20; §10 Theorem 10.5 p. 27.)

Prove the restricted assertion by comparing the compact-unitary trace identity for matching split and nonsplit test functions, isolating the fixed infinity type by its Euler–Poincaré function, and applying the simple GL trace formula and strong multiplicity one. Globalize a prescribed local essentially square-integrable factor by the cuspidal test of §6.23. The vanishing of proper parabolic terms makes the surviving base change cuspidal; the same trace isolation gives uniqueness and the stated descent image. This is the argument of Scholze §10, Theorem 10.5, p. 27, with precisely the division and infinity hypotheses of §8, pp. 19–20 (his Harris–Taylor VI.2.10 case). Keep the similitude character `ψ`: equality of the `GL_n`-factor alone is not injective on representations of `GL₁×GL_n`. Shin 2011 Corollaries 6.5 and 6.7 concern cohomology and Hodge data and do not state this base change or descent.

**Checks.**

- At a split place distinguish `ψ_{u′}` on `GL₁` from `Π_{w′}` on `GL_n`; omitting `ψ` loses injectivity.
- A `Π` with no square-integrable component at `x` is outside Theorem 10.5.
- The rank-one `U(1)` map `z↦z/z̄` is not the whole similitude-group construction.

*Needs:* §9.1 (raw compact-unitary models, coefficient cohomology and actions); §6.25; §6.23; §6.9; §6.24; §4.8.

### 6.28 Worked checks for the simple stable and twisted formulas

(1) Torus check: for `N = 1, G₁` is the similitude torus of a CM field; `E^ℓ(G₁) = {G₁}, τ(G₁) = 1` when `[F^+:ℚ]` is odd (Shin 2011 Remark 3.2), and the stable–twisted identity reduces to the base-change character matching for the similitude torus including its multiplier; `z↦z/z̄` alone applies to `U(1)`, not `G₁`. (2) Non-example: for `F` imaginary quadratic `(F^+ = ℚ)`, the coset `𝒢_2θ` has the proper cuspidal subset coming from `(R_{F/ℚ}𝔾_m) × G₀`, so §6.21 fails without extra terms. (3) Unramified `GL₂` check: for `N = 2` and `v` split in `F₀`, BC* sends the Hecke operator `T_v` to the Hecke operator of `GL₂(F_w)` and the trace identity of §6.8 is the Satake identity. (4) Local base change of the Steinberg representation of `GL₂` is the Steinberg representation, and the twisted character at a `σ`-regular element equals `−1` on elliptic norms, matching `θ_St = −1` (§2.16). (5) Coefficient check: for `G = G₄` and `H = G_{2,2}, τ(G)=2, τ(H)=4` and `|Out|=2` give `ι(G,H)=1/4`. In §6.25 the factor `τ(H)` cancels, leaving `τ(G)ε_{(2,2)}` with `ε_{(2,2)}=1/2`, as in Caraiani–Scholze non-compact Theorem 5.6.1.

*Hypotheses.* The data of the individual nodes.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Remark 5.5.4, p. 74; §5.6, Theorem 5.6.1, p. 75; [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Lemma 3.1, p. 13.)

Each item is a direct specialisation of the named node.

**Checks.**

- Each of (1)–(5) is a numerical or structural identity that a wrong normalisation (missing ½, wrong sign of the Steinberg character, wrong Tamagawa number) would violate.

*Needs:* §6.25; §6.15; §6.8; §6.12; §6.5.

### 6.29 Public cohomological unitary weak base change and descent

Let `E/F` be CM with `[F:ℚ]≥2` and `U` an inner form of the quasi-split unitary group in Labesse §5. Let `σ` be a discrete automorphic representation with discrete-series infinity component satisfying property (*): all representations with its finite part have infinity pseudo-coefficient trace of one common sign. Labesse Corollary 5.3 gives a weak base change to an isobaric sum of `θ`-stable discrete GL blocks, with local matching at unramified and split finite places and compatible infinitesimal character at infinity. If every block is cuspidal, the infinity component is its actual archimedean base change. Conversely, when `E/F` is unramified at all finite places and `U` is quasi-split at finite inert places, Theorem 5.4 descends a `θ`-stable cuspidal cohomological `GL_N` representation to a discrete cohomological `σ`. Under its extra discrete-series, spherical-inert and (*) hypotheses a cuspidal `σ` has multiplicity one. This is weak unitary base change with precisely these hypotheses; it does not prove all-place transfer in the separate Harris–Taylor division-algebra setting.

*Hypotheses.* Use the central-character, inner-form and discrete infinity hypotheses of Labesse Theorem 5.1. Property (*) holds in the compact infinity case and with the sufficiently regular coefficients specified on p. 42; it is not assumed for every cohomological representation. The converse retains the everywhere-finitely-unramified CM extension and finite-inert quasi-splitness hypotheses.

([J.-P. Labesse — Changement de base CM et séries discrètes](https://webusers.imj-prg.fr/~michael.harris/CBCM.pdf), Théorème 4.12 p. 40; Theorem 5.1 pp. 41–42; property (*) p. 42; Corollary 5.3 pp. 43–44; Theorem 5.4 pp. 45–46.)

Labesse Theorem 5.1 compares the unitary trace to the twisted GL trace with the discrete-series test function and controlled endoscopic terms. The common-sign property isolates the finite part without cancellation. Corollary 5.3 obtains a `θ`-stable discrete isobaric weak lift, with the precise split/unramified and infinity compatibilities. For the converse Theorem 5.4 uses the additional finite-place hypotheses to match the cuspidal `θ`-stable GL trace and recover the cohomological unitary representation. Its multiplicity-one assertion uses the additional spherical-inert and (*) assumptions.

**Checks.**

- At compact infinity, property (*) prevents cancellation of the finite part.
- A residual discrete GL block does not imply actual infinity base change from infinitesimal-character compatibility alone.
- A ramified finite inert place prevents direct application of the stated descent theorem.

*Needs:* §6.25; §6.22; §6.10; `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations).

### Examples

With `τ(G)=τ(H)=2` and an endoscopic outer-automorphism group of order two, the endoscopic coefficient is `1/2`. At a full twisted Levi with two nonzero blocks, the anti-invariant determinant factor is `1/4`; it is a different coefficient and must not replace `1/2`. For the inverse-conjugate-transpose involution, (gh)`^(−t)=g^(−t)h^(−t)`; using conjugate transpose without inversion reverses the factors. Changing an order-two intertwiner by `−1` changes its twisted trace, which is why the global normalized extension is part of the spectral statement.

### Dependencies

§9.1 (raw compact-unitary geometric prefix); `TauCetiRoadmap.AutomorphicSpectralTheory` §7.0b (unitary induction classification); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations); `TauCetiRoadmap.AdelicAlgebraicGroups` §2.4 (Gauge forms and Tamagawa normalization); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.5 (arithmetic invariants: `π₁, z`-extensions and the Kottwitz homomorphism); `TauCetiRoadmap.GlobalNumberFields` Layer 8 (idele classes and norms) and Layer 9 (Hecke characters); `TauCetiRoadmap.AdelicAlgebraicGroups` §2.1 (Characters, logarithms and the split centre); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (the global class formation and global Artin reciprocity); `TauCetiRoadmap.GlobalNumberFields` Layer 10 (archimedean characters, infinity types, and cyclotomic arithmetic); §2.16; §1.16; `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.5.1 (the dual group and its Galois action); §1.11; §1.8; `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); §2.4; §1.4; §2.10; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.4.1 (The Satake transform and isomorphism); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.4.2 (Spherical parameters); §4.9; §2.11; §2.15; §2.14; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.19 Real Euler–Poincaré test functions; `TauCetiRoadmap.ReductiveGroups` Layer 7 (structure theory); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.3 (Tempered representations and the conditional Langlands classification); `TauCetiRoadmap.AutomorphicSpectralTheory` §6.16 Invariant trace formula; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.15 (Invariantization by Levi recursion); §4.7; §1.15; §2.7; §1.13; §2.6; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.10 Weighted orbital integrals; §2.1; §4.11; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.6 (Coarse trace formula); `TauCetiRoadmap.AutomorphicSpectralTheory` §6.12 Fine geometric expansion; `TauCetiRoadmap.AutomorphicSpectralTheory` §6.13 Fine spectral expansion; `TauCetiRoadmap.AutomorphicSpectralTheory` §4 (Automorphic spectral completeness); `TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a (**Number-field GLₙ residual blocks**); `TauCetiRoadmap.AutomorphicSpectralTheory` §6.17 (Trace formula for compact quotients); `TauCetiRoadmap.PELModuli` §M0.7 (The similitude group); `TauCetiRoadmap.PELModuli` §M5.5 (Unitary PEL data with prescribed signatures); §4.10; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 — Rankin–Selberg theory and function-field factors; §4.8; Mathlib `MeasureTheory.Measure.IsHaarMeasure`.

## Layer 7: algebraic isocrystals and rational Igusa geometry

Construct algebraic isocrystals and their additional-structure comparisons, then finite liftable Igusa torsors, the quasi-isogeny monoid and rational cohomology. The perfect isomorphism-torsor comparison is an early geometric result. These objects are available before any fixed-point count or stable trace identity.

### 7.1 The good-prime PEL scheme used by Igusa geometry

Fix unramified integral PEL data of type A or `C` at `p`, a hyperspecial `p`-level, and sufficiently small neat prime-to-`p` level, with a fixed polarization degree and integral lattice. Starting with the lower PEL algebraic space and its universal abelian scheme, prove that this particular moduli space is a smooth quasi-projective scheme over the unramified reflex localization. Its special fibre is the scheme on which the central leaves and finite Igusa covers below are formed. This target concerns the open good-prime model; it does not construct a toroidal or minimal compactification.

The interface consists of the following operations and identities.

- the scheme representing the specified PEL functor and its identification with the PEL algebraic space.
- the universal abelian scheme, endomorphism action, polarization and prime-to-`p` level transported through that identification.
- the bounded polarized Hilbert locus, its change-of-basis action and universal family.
- prove that its level-rigidified stable-orbit quotient exists as a quasi-projective scheme, with a descended ample line and universal polarized family.
- first construct the fine moduli scheme of the fixed polarization type and full prime-to-`p` level `N≥3`, with a chosen relatively ample line; scheme representability and quasi-projectivity are part of this target.
- the map to that polarized base, after fixing the actual polarization degree and sufficiently fine compatible level. A coarse moduli map alone does not furnish the universal family.
- a relatively ample line bundle and the resulting quasi-projective immersion.
- the scheme-theoretic fibre over the residue field with its universal `p`-divisible group.
- prime-to-`p` level maps and Hecke correspondences, compatible with the representing functor.

Prove separatedness and the quasi-finiteness of the forgetful map by rigidity and boundedness of endomorphisms compatible with the fixed positive Rosati involution and integral lattice. Use the algebraic-space form of Zariski's main theorem over the polarized abelian moduli scheme to obtain a scheme realization and quasi-projectivity, checking the finite-type and separated hypotheses. Pull back the universal family and the chosen ample line on the polarized base; prove the good-prime smoothness from PELModuli’s local model. Neatness removes stabilizers but is not the scheme-realization proof. Construct the polarized base by a bounded Hilbert presentation of polarized abelian varieties, with the symmetric relatively ample embedding and level rigidification, and prove that its geometric quotient is quasi-projective. For the geometric quotient, take a sufficiently high tensor power of the symmetric polarization line so its higher cohomology vanishes and its sections give a fixed Hilbert polynomial. The Hilbert locus of embedded polarized group varieties with identity and full level is locally closed; translating the level frame removes stabilizers. The linearized determinant-of-sections line separates the stable orbits, so its invariant sections construct the quasi-projective geometric quotient and descend an ample power. For a fixed nonsymmetric polarization type use the symmetric tensor power and retain the original polarization as a homomorphism to the dual in the Hilbert data; the bounded degree cuts out its locus. Descent of the universal family follows from the free level-rigidified action. This is the fine polarized-moduli scheme theorem in Faltings–Chai, *Degeneration of Abelian Varieties*, I.4.3–4.4 and I.4.11, pp. 19, 23–24, specialized to this datum. The Hilbert charts are those of AlgebraicModuliForArithmeticGeometry §2.1. No compactification ampleness theorem is used. The model is used in [Shin, *Counting points on Igusa varieties*](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, pp. 13–15. The Hilbert quotient and the separated quasi-finite forgetful map give the scheme realization and ample line for that datum.

**Checks.**

- In the type `C` Siegel case with full prime-to-`p` level `N≥3`, recover the fine polarized abelian moduli scheme and its universal family.
- At a good prime, the special fibre retains the determinant condition and the endomorphism action; the underlying abelian scheme alone is insufficient.
- A non-neat level can have nontrivial geometric stabilizers and cannot use the fine-moduli identification above.
- A finite étale Igusa cover of a nonproper central leaf remains nonproper; quasi-projectivity supplies neither properness nor boundary-free ordinary cohomology.

*Needs:* `TauCetiRoadmap.PELModuli` §M2 (Representability and smooth good models); `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` Layers A1 (Rigidity and normalized line bundles) and A2 (Duality, polarizations and ample classes); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §2.1 (Hilbert families and graph parameters); `TauCetiRoadmap.SchemeAndStackFoundations` §§1.2–1.6 (Algebraic spaces).

### 7.2 Algebraic `G`-isocrystals and `sigma`-conjugacy

For connected reductive `G/ℚ_p`, use PadicHodgeTheory §5.5’s `sigmaConjugacy` and quotient `B(G)` on the common field `L=ℚ̆_p=Frac W(𝔽̄_p)`, with its Witt Frobenius `σ`. Write changes of trivialization as `b′=g⁻¹bσ(g)`; the equivalent left-action convention `b′=h b σ(h)⁻¹` uses `h=g⁻¹` and induces the same quotient, without changing `σ` or the invariant maps. A `G`-isocrystal is an exact faithful `ℚ_p`-linear tensor functor `Rep_Qp(G)→`Isoc`(k)`; its underlying `L`-valued fibre functor is isomorphic to scalar extension of the usual one. The functor attached to `b` sends `(V,ρ)` to `(V⊗L,ρ(b)σ)`. Isomorphism classes identify with `B(G)`; the automorphism functor of this tensor functor gives `J_b`. Finite rank is separate from the pinned isocrystal carrier; the full slope classification comes from R07.2, not its rank-one Mathlib special case.

*Hypotheses.* Connected reductive `G`; algebraically closed residue field; rational, not integral, coefficients.

([R. E. Kottwitz — Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), §§3–4.2, pp.211–213; [S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §4.2, Definition 4.5 and Lemmas 4.6–4.7, pp.10–11.)

The interface consists of the following operations and identities.

- `(V,ρ)↦(V⊗L,ρ(b)σ)`, preserving tensor products, duals and exact sequences.
- The change by `g` identifies `b` with `g⁻¹bσ(g)`.
- The supplied `B(G)` identifies with isomorphism classes of these tensor functors, compatibly with both displayed conjugacy conventions.
- Tensor automorphisms of the functor equal the `σ`-centralizer functor of `b`.
- Two Frobenius-compatible tensor natural isomorphisms are equal if their components on every finite-dimensional algebraic representation are equal; under a trivialization these components are `ρ(g)`.

Use the pinned semilinear carrier and the representation/comodule tensor category and fibre-functor reconstruction of ReductiveGroups Layer 1. Trivialize the `L`-valued fibre functor; changing its trivialization changes `b` by `σ`-conjugation. Frobenius-compatible tensor isomorphisms are exactly those conjugators. Steinberg vanishing over `L` trivializes the fibre functor. For tensor descent, apply ordinary faithfully flat descent to each finite-dimensional representation and its tensor morphisms; the reconstructed automorphism preserves those morphisms exactly when it lies in G. This identifies tensor descent data with `b` up to `σ`-conjugacy.

**Checks.**

- For `G=G_m` the class of `p^m` has integral slope `m` and agrees with StandardOneDimIsocrystal; `m=0` is the unit isocrystal.
- For `GL₂, Φ(e₁)=e₂` and `Φ(e₂)=p e₁` gives slope `1/2` twice, and is not a sum of two rank-one integral-slope objects.
- If `b′=g⁻¹bσ(g)`, multiplication by `g` intertwines Frobenius. Replacing `σ(g)` with `g` makes that intertwining equation fail unless `σ(g)=g`.

*Needs:* `TauCetiRoadmap.PadicHodgeTheory` §5.5 (the common `B(G)` carrier); Mathlib `WittVector.Isocrystal`; Mathlib `WittVector.IsocrystalEquiv`; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.15 (The Dieudonné–Manin classification of isocrystals); `TauCetiRoadmap.ReductiveGroups` Layer 1 (representations = comodules).

### 7.3 The early rational Igusa trace object

For the CSnc split-prime quasi-split unitary PEL datum and a completely slope-divisible representative `X_b`, form the finite-level Mantovan Igusa varieties over its central leaf by trivializations of the slope-graded truncated `p`-divisible group, with the liftable-automorphism condition. The perfection of their inverse limit identifies with the perfect isomorphism torsor. The frames respect the `O_F` action and the paired polarizations up to one common scalar multiplier, and fppf locally lift to every larger truncation level. Define the rational alternating smooth cohomology class `[H_c(Ig^b,Λ)]=Σ_i(−1)^i[H_c^i]` over the finite-level tower, with `J_b(ℚ_p)×G(A_f^p)` actions. The object is not assumed positive, concentrated or integral.

*Hypotheses.* Use CSnc’s unramified PEL datum, neat prime-to-`p` levels and completely slope-divisible `X_b`. The central-leaf/torsor/cohomology construction is used here; compactified fibres and integral concentration are downstream. Preserve the common polarization multiplier across all paired slope factors and the seminormal/perfect-base hypotheses in the torsor construction.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), §§2.2–2.3, Proposition 2.2.3, Theorem 2.2.4, Definition 2.3.5 and Remark 2.3.7, pp. 14–20; [Ana Caraiani and Peter Scholze — On the generic part of the cohomology of Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definitions 4.3.6 and §5.2, pp. 716–718, 732–733.)

The interface consists of the following operations and identities.

- Construct finite Igusa torsors with liftable truncated automorphisms.
- Identify their perfection with the full perfect torsor. Invert `j_i:Σ_i→gr_i(A[p∞])` to the convention `ρ_i=j_i⁻¹`; over a perfect base the split slope filtration identifies these graded frames with the full isomorphism torsor.
- Prime-to-`p` and `J_b` correspondences act compatibly with finite level.
- Project rational cohomology to its alternating Grothendieck class.
- Scalar extension transports the trace object without imposing positivity.

Specialize the lower PEL universal family and define the Newton class and central leaf by its `p`-divisible isomorphism type. Use the liftable-automorphism finite-level torsors and slope decomposition to construct the Igusa level system. Compare the perfected finite-level tower with the isomorphism torsor and construct the quasi-isogeny group correspondences. Write `P` for the map from the perfect torsor to the inverse-limit finite tower, `a_j` for the left action on inverse frames `ρ↦jρ`, and `r_δ` for the right Mantovan action on frames. Then `P∘a_{δ⁻¹}=r_δ∘P`. Take rational compact-support cohomology and its alternating class with all group actions: `P*` identifies `r_δ*` with `a_{δ⁻¹}*`, the inverse-pullback left representation. Inversion also inverts the common polarization multiplier. This conversion commutes with finite-level pullbacks and prime-to-`p` Hecke correspondences.

**Checks.**

- A complex with the same one-dimensional trivial representation in degrees 0 and 1 has zero Euler class but nonzero cohomology.
- The perfection map induces an `ℓ≠p` étale cohomology isomorphism.
- An arbitrary automorphism of `X_b[p^m]` not liftable to the required slope structure is not a finite Igusa level frame.
- The scalar kernel in the group action is retained.

*Needs:* `TauCetiRoadmap.PELModuli` §M2.8 (Representability and smoothness); `TauCetiRoadmap.PELModuli` §M2.6 (Formal smoothness at good primes); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2 (Dieudonné theory); `TauCetiRoadmap.DiamondSixOperations` Layer S2: The exceptional direct image for eligible maps of small `v`-stacks; `TauCetiRoadmap.AdicCoefficientsAndComparisons` Layer L0: Adic coefficients.

### 7.4 Newton and Kottwitz invariants with the PEL sign

For connected reductive `G/ℚ_p`, use PadicHodgeTheory §5.5’s tensor Newton map `ν̄_G:B(G)→N(G)`, descended `kottwitzInvariant` `κ_G:B(G)→π₁(G)_Γ`, their functoriality and compatibility under rational abelianization. Here `D` is the slope protorus with `X*(D)=ℚ`, and `N(G)` consists of Galois-fixed geometric conjugacy classes of maps `D→G`. Compare the tensor functors of §7.2 with those supplied slopes. For quasi-split `G` and a conjugacy class `μ`, the PEL notation `B(G,−μ)` is the supplied `B(G,{−μ})`: `κ=−μ^natural` and `ν̄≤(−μ)^diamond` in the dominant order (choose the dominant member before Galois averaging). This is a definition of the admissible locus, not a claim that every element occurs in a PEL special fibre. For the dual Dieudonné convention used below, BT slopes `λ` give `ν` weights `−λ`.

*Hypotheses.* Fix a based root datum for dominance; `μ` and Galois action are specified.

([M. Rapoport and M. Richartz — On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/item/CM_1996__103_2_153_0.pdf), §§1.7–1.15, pp.156–162; [S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §4.1, pp.8–10; §4.3, p.12; §5, p.15.)

The interface consists of the following operations and identities.

- Identify the supplied tensor Newton weights with the slopes of G-isocrystal of element in every representation.
- The comparison with the supplied invariant commutes with every homomorphism `f:G→H`: `κ_H(f_*b)=π₁(f)_Γ κ_G(b)`, with `ν_H=f∘ν_G` up to conjugacy.
- Identify the PEL sign convention with membership in the supplied `B(G,{−μ})`, retaining both its `κ` equality and dominant Newton inequality.
- Inner forms have the canonical common `π₁` with its Galois action; no arbitrary map of dual centres is assumed.

Transport the supplied invariant maps along the common quotient of §7.2. Under dual Dieudonné theory, dualizing negates slope weights and determinant valuation; apply this in every representation to obtain the PEL sign adapter. The general construction and functoriality of `κ` are PadicHodgeTheory §5.5’s inputs (RR Theorem 1.15), not additional constructions here.

**Checks.**

- `G_m: κ(p^m)=m` and `ν(p^m)=m`; the admissible locus for `−μ` consists of the single class `−μ`.
- The rank-two slope `+1/2` example of §7.2 has `κ=1`. Its dual has slope `−1/2` twice and `κ=−1`.
- For `GL_n` a central slope `r` is basic even when `nr≠0`; basic means central `ν`, not trivial `κ`.
- For a non-Galois-invariant `μ` the bound uses the average of its dominant conjugates, rather than `μ` itself.
- For `GL_n, κ` is `v_p(det b)` and `ν̄` lists slopes; `Σ` of BT slopes `λ_i` gives `κ=−Σλ_i` with multiplicities.

*Needs:* `TauCetiRoadmap.PadicHodgeTheory` §5.5 (Newton, Kottwitz and admissibility interfaces); §7.2; `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.1 (quasi-split forms and rational tori over `Ĕ`).

### 7.5 Decent representatives, Newton Levi and `J_b`

For quasi-split connected reductive `G/ℚ_p` and `[b]∈B(G)`, choose a representative whose Newton map `ν_b` is rational and an integer `s>0` with `bσ(b)⋯σ^{s−1}(b)=(sν_b)(p)` and `sν_b` integral. Then `b∈G(L_s), M_b=Z_G(ν_b)` is a `ℚ_p`-Levi and `b` is basic in `M_b`. The functor `R↦{g∈G(L⊗_Qp R):g=bσ(g)b⁻¹}` is represented by a reductive `ℚ_p`-group `J_b`, an inner form of `M_b` with descent cocycle `Int(b)`. Fix an `L_s`-inner isomorphism `ψ:J_b→M_b`; transport stable classes to `G` geometrically. Changing `b` by `σ`-conjugation changes `J_b` by an isomorphism canonical up to inner automorphism. The pair (`M_b,[b]` in `B(M_b)`) has a rational-conjugacy orbit independent of these choices. This last statement concerns classes in `B(M_b)`, not rational conjugacy of every pair of actual representatives.

*Hypotheses.* Quasi-split `G` for rational Newton Levi; decency integer can be enlarged.

([R. E. Kottwitz — Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), §4.3, pp.213–214; §§5.2 and 6.2–6.5, pp.215–216,219–220; [M. Rapoport and M. Richartz — On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/item/CM_1996__103_2_153_0.pdf), §1.11–1.12, pp.158–159; [S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.2, p.10.)

The interface consists of the following operations and identities.

- The displayed Frobenius-commuting equation describes `R`-points for every `ℚ_p`-algebra R.
- `ψ` identifies `J_b` and `M_b` only after splitting the inner twist.
- If `b′=g⁻¹bσ(g)`, conjugation by `g⁻¹` identifies the point functors, up to inner automorphism for another choice.
- Replacing `s` by a positive multiple preserves decency and makes all slope products integral.
- The rational-conjugacy class of the pair `(M_b,[b]_M)` is independent of a rational Newton representative.

Use Kottwitz §§4.3 and 6.2 to choose rational `ν` and solve the decency equation after finite unramified extension. Descend the Levi by `Int(b)`; centrality of the decency product makes the cocycle valid. Identify the fixed functor with the descended group, and prove its independence using `σ`-conjugators. The representability argument must identify the descended fixed-point functor, not only its rational points.

**Checks.**

- `b=1` gives `ν=0, M_b=G` and `J_b=G`.
- `GL₂` with isoclinic slope `1/2` has `J_b=D^×` for the quaternion division algebra; it is not `GL₂(ℚ_p)` as a rational group.
- `GL₂` with distinct slopes 0 and `−1` has `M_b=G_m×G_m` and `J_b` split; the two-block slope order is retained.
- Kottwitz Proposition 6.3 identifies classes in `B(M)`; no assertion `b′=gbg⁻¹` for arbitrary decent representatives is an API item.

*Needs:* §7.2; §7.4; §1.6.

### 7.6 PEL Dieudonné comparison and quasi-isogeny groups

For unramified integral simple PEL data of type A or `C` (positive involution, split matrix `B_p` over unramified centres, self-dual `O_B`-stable lattice and positive `h`), use the dual of the usual contravariant rational Dieudonné module. It sends `μ_{p∞}` to `L(−1)`, and a polarized BT group with `B_p`-action to a hermitian isocrystal with pairing valued in `L(−1)`. The determinant condition cuts out the classes in `B(G,−μ)` that arise from these BT groups. For `Σ` of class `b`, rational quasi-isogenies preserving the action and polarization up to scalar identify with `J_b(ℚ_p)`, canonically up to inner automorphism. Quasi-isogenies to another such BT group are exactly its Frobenius-compatible hermitian isocrystal isomorphisms.

*Hypotheses.* The comparison is over `F̄_p` in the isogeny category; the pairing is nondegenerate and its similitude scalar is retained. Type `D` is excluded. The membership condition does not assert nonemptiness of every Shimura Newton stratum.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §4.2–4.3, Lemmas 4.7 and 4.14, pp.10–13.)

Apply Dieudonné full faithfulness and Cartier duality from R07.2. Dualize and track the Tate twist through the pairing: all `λ` become `−λ`. Apply the concrete/tensor dictionary of Shin §4.2 and identify the automorphism functor.

The relative integral classification used in the local deformation and norm constructions is also a target here. For a perfect residue field with its `O/ϖ`-embedding, strict `O`-linear Dieudonné theory classifies height-`n`, dimension-one `ϖ`-divisible `O`-modules by free rank-`n` modules over `O⊗_{W(κ_O)}W(k)`, with relative `σ`-semilinear `F, V` and `FV=VF=ϖ`, the prescribed length-one Hodge quotient, and the structural `O`-action on Lie. In a basis over `κ_r` the relative `F` is `βσ` in the double coset of `diag(ϖ,1,…,1)`. Integral changes of basis give exactly integral `σ`-conjugacy, and inverting `ϖ` gives the quasi-isogeny category. This is the strict relative specialization of the ordinary Dieudonné equivalence, with its `O`-action and Lie condition imposed, not an identification of relative and absolute Frobenius. For the étale `O_A^op`-linear rank-one object, Morita decomposition makes its contravariant endomorphism algebra `O_A` and writes `F=β⁻¹σ₀`; this gives the first classification stated above. See Scholze §2, pp. 7–8, and Proposition 4.2 with proof, pp. 11–12. Add relative Frobenius for strict Dieudonné modules, integral conjugacy and Morita opposite to the API. These classification statements depend only on R07's ordinary integral Dieudonné equivalence, not on the deformation-ring construction of §10.2.

**Checks.**

- A basis change `g` replaces `β` by `g⁻¹βσ(g)`, so ordinary conjugacy would give the wrong integral classification.
- Relative height one has Hodge length one; an étale rank-one object has invertible absolute `F` and uses `β⁻¹`, so substituting the dimension-one deformation coset fails.

- The multiplicative BT group has slope 1 before dualization and weight `−1` after it; the étale group has weight 0.

*Needs:* §7.2; §7.4; §7.5; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.10 (Dieudonné classification of `p`-divisible groups); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.1.7 (The Cartier dual of a `p`-divisible group); `TauCetiRoadmap.PELModuli` §M0.18 (The Kottwitz determinant condition).

### 7.7 Central leaves and completely slope-divisible families

Fix the good-reduction PEL special fibre `X_K` over `F̄_p` and a polarized `O_B`-BT group `Σ=⊕Σ_i` with slopes `1≥λ₁>⋯>λ_r≥0`. Its central leaf `C_Σ` is the reduced locus where the geometric BT group with all additional structures is isomorphic to `Σ`, inside the Newton stratum with class `b`. It is smooth and closed in that stratum, not necessarily closed in `X_K`. A BT group `H` is completely slope divisible if it has a filtration whose graded pieces have slopes `λ_i` and, for one common `s>0, p^{−sλ_i}F^s` is an isomorphism on each graded piece and induces the required isogenies on the filtered pieces; use the exact filtration/isogeny condition of Mantovan §3. For a completely slope-divisible `Σ, H=A[p∞]|C_Σ` has this filtration, equivariant for `O_B`, and the polarization pairs grade `i` with the complementary slope `1−λ_i`. Over a perfect field the filtration splits; it need not split over `C_Σ`.

*Hypotheses.* Unramified integral PEL type A or `C`, hyperspecial level at `p` and neat prime-to-`p` level; reduced schemes, all geometric fibres. The good-prime scheme realization is §7.1; neatness and M2 alone do not supply it. Choose `Σ` satisfying the determinant condition.

([E. Mantovan — On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §3, Proposition 1 and Proposition 2, pp.7–10; [S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, pp.15–16.)

The interface consists of the following operations and identities.

- `x` lies in `C_Σ` iff `A_x[p∞]≅Σ` with `O_B`-action and polarization up to a common unit.
- `C_Σ→X^b` is a closed immersion into its Newton stratum, with reduced structure.
- BT morphisms preserve the filtration; `O_B` acts on its pieces and duality pairs complementary slopes.
- Over a perfect field the completely slope-divisible group is the sum of its graded pieces; this is not imposed on the entire family.
- Prime-to-`p` level projections and Hecke maps preserve the central-leaf system.
- Two reduced locally closed subschemes of `X_K` defining the same geometric structured BT-isomorphism locus agree; the Newton-stratum immersion retains the reduced structure.

Use M2 for the good-prime smooth algebraic space and §7.1 for its scheme realization, with the universal BT group. Apply the central-leaf and slope-filtration results quoted in Mantovan §3; prove the structured slope-filtration and smoothness inputs at the stated scope. Morphisms preserve slopes, and duality exchanges `λ` and `1−λ`; this gives the inherited action and graded pairings.

**Checks.**

- For an ordinary elliptic BT group over `F̄_p` the pieces are `μ_{p∞}` and `ℚ_p/ℤ_p`, of slopes 1 and 0.
- For a single slope the filtration has one graded piece; the leaf still remembers the integral BT group, not just its rational isocrystal.
- If the polarization is principal, the multiplicities at `λ` and `1−λ` agree; an isolated slope 0 without a slope 1 partner cannot be such a polarized datum.
- A family with nontrivial extensions may have split perfect fibres; replacing `H` by the direct sum of grades as a family is not part of this definition.
- Fixing an isogeny class defines the Newton stratum; fixing an isomorphism class defines the finer central leaf.

*Needs:* `TauCetiRoadmap.PELModuli` §M2.8 (Representability and smoothness); `TauCetiRoadmap.PELModuli` §M2.6 (Formal smoothness at good primes); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.1.5 (The levels of a `p`-divisible group are its torsion, and multiplication by `p` is an epimorphism); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.16 (Slopes, Newton polygon and a-number of a Dieudonné module); §7.6; Mathlib `AlgebraicGeometry.Scheme`; §7.1.

### 7.8 Finite-level Igusa moduli and deck groups

For `m≥0` define `Ig_{K^p,m}` over `C_{Σ,K^p}` by `O_B`-equivariant isomorphisms `j_i:Σ_i[p^m]→gr_i(A[p∞])[p^m]`, compatible with the graded polarization up to one common unit modulo `p^m`, which extend étale locally to every higher truncation. With `Γ_b=Aut_O_B,λ(Σ)⊂J_b(ℚ_p)` and `U_p(m)=ker(Γ_b→Aut(Σ[p^m]))`, this functor is a finite étale `Γ_b/U_p(m)`-torsor over the leaf. It is smooth, finite type and usually nonproper. Higher level maps are finite étale and are restriction of the `j_i`. At `m=0`, the torsion group `Σ[p⁰]` is zero, the level structure is unique, `U_p(0)=Γ_b`, and `Ig_{K^p,0}=C_{Σ,K^p}` with trivial deck quotient. Restriction to level zero is the structure map to the leaf. The `U_p(m)` for `m≥1` form a basis of compact open subgroups of `Γ_b`. `Ig_∞` denotes the inverse system and its inverse-limit geometric points, not a new finite-type scheme.

*Hypotheses.* The central leaf and slope-divisible `Σ` of the preceding target; `m≥0`. The lifting condition is part of the moduli problem; arbitrary truncated isomorphisms are not substituted for it.

([E. Mantovan — On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, Definition 3 and Proposition 4, pp.10–11; [S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, pp.15–16.)

The interface consists of the following operations and identities.

- Its `S`-points consist of the liftable structured graded trivializations, including a single common similitude unit.
- The moduli functor is represented by a finite étale `Γ_b/U_p(m)`-torsor.
- For `m′≥m`, restrict `j_i` to `p^m`; transitions compose and commute with deck transformations.
- The kernel of the `Γ_b`-action is `U_p(m)`, not every automorphism of the truncated group.
- Geometric points at level `U=K^p×U_p(m)` identify with `Ig_∞(F̄_p)/U`.
- Two `S`-points are equal iff their graded level-`p^m` maps `j_i` agree for every `i`; higher lifts certify liftability and are not extra chosen point data.

Represent the liftable truncation trivializations and impose the closed `O_B` and polarization conditions. Use formal rigidity of isoclinic groups to transport fibre trivializations over completed local rings, as in Mantovan Proposition 4. The compact integral automorphism group gives the deck quotient, whose action is free and transitive on every fibre; compatible lifts identify the inverse-limit frame sheaf with the compact integral automorphism torsor, and quotienting by the level kernel gives the finite étale torsor. Fibrewise automorphisms of the truncation that fail higher liftability do not enter this quotient.

**Checks.**

- For `Σ=μ_{p∞}⊕ℚ_p/ℤ_p, Γ_b≅ℤ_p^××ℤ_p^×` with the common similitude equal to the product; at `m≥1` the fibre has `φ(p^m)²` points.
- At `m=0` the finite Igusa variety is the central leaf, its degree is 1, and its deck kernel is all of `Γ_b`.
- Restriction from `m+1` to `m` reduces each unit modulo `p^m` and gives the quotient deck map; for `m=0` it forgets the frame entirely. At general level the torsor degree is `|Γ_b/U_p(m)|`.
- A truncated automorphism not liftable to all higher `m` is absent from the deck group, even if it preserves the visible level-`m` pairing.
- If the central leaf is nonproper, its nonempty finite étale cover cannot be declared proper merely because the cover map is finite.

*Needs:* §7.7; §7.5.

### 7.9 The slope-separated quasi-isogeny monoid

Order the BT slopes decreasingly. For `δ∈J_b(ℚ_p)` with `δ⁻¹` an integral isogeny, let `e_i` be the least integer such that `ker δ_i⁻¹⊂Σ_i[p^{e_i}]`, and `f_i` the largest integer such that `Σ_i[p^{f_i}]⊂ker δ_i⁻¹`. Define `S_b` by these isogeny conditions and `f_{i−1}≥e_i` for `i≥2`. Kernel gluing gives `δ:Ig_{K^p,m}→Ig_{K^p,m−e₁}` for `m≥e₁` and compatible prime-to-`p` Hecke maps. `Γ_b, p⁻¹` and `fr^{−s}` lie in `S_b`, where `fr^{−s}` acts with valuations `−sλ_i`; `J_b(ℚ_p)=⟨S_b,p,fr^s⟩`. This is an action of a monoid on a level system; it does not assert geometric actions of arbitrary `J_b`-elements at a fixed level.

*Hypotheses.* `Σ` split into completely slope-divisible components with additional structures; common `s` integral on all slopes.

([E. Mantovan — On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, Lemma 5 and discussion before and after it, pp.11–13; [S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, pp.16–17.)

The interface consists of the following operations and identities.

- Membership is integral `δ⁻¹` together with all successive kernel inequalities.
- For `m≥e₁`, quotient by the glued subgroup and descend the remaining `j_i` to level `m−e₁`.
- Compositions agree after passing to a common sufficiently large source level.
- `Γ_b,p⁻¹,fr^{−s}` belong; adjoining inverse central powers generates `J_b(ℚ_p)`.
- The `S_b` and `G(A_f^p)` actions commute on the level system.
- The product of two elements of `S_b` belongs to `S_b`; its compatible level map is the composition after increasing the source level. The identity belongs and gives the level transition.

Glue the finite flat subgroup with the prescribed graded kernels using `f_{i−1}≥e_i`, then take the abelian quotient and its induced structures. Functoriality of quotients yields the monoid law after enough level has been chosen. Negative scalar and Frobenius powers put each quasi-isogeny into this cone; prove the filtered finite-flat kernel gluing.

**Checks.**

- `δ=p⁻¹` belongs, despite not being an integral automorphism; all kernel bounds equal 1. At `m=1` its level-loss map lands in `Ig_{K^p,0}=C_{Σ,K^p}`, with no residual frame.
- For two slopes `λ₁>λ₂` and integral exponents `a₁<a₂, δ_i=p^{−a_i}` has `f₁=a₁<e₂=a₂`, and is excluded.
- `fr^{−s}` belongs because `sλ_{i−1}≥sλ_i`; its inverse need not belong. Here `e_i=f_i=sλ_i`, in decreasing order.
- With one slope there is no successive inequality, but `δ⁻¹` must still be an isogeny.

*Needs:* §7.8; §7.6; `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A3.3 (Quotients by finite locally free subgroups); `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A3.7 (Polarized Weil pairings).

### 7.10 Rational Igusa cohomology and the full group action

For `ℓ≠p` and an algebraic representation `ξ` of `G`, let `L_ξ` be its rational `ℓ`-adic coefficient system on the PEL model and its pullback to finite Igusa varieties. Define `H_c^k(Ig_b,L_ξ)=colim_{K^p,m}H_c^k(Ig_{K^p,m},L_ξ)`, using finite étale level pullbacks. The `S_b×G(A_f^p)` action extends uniquely to `J_b(ℚ_p)×G(A_f^p)`, since `p⁻¹` and `fr^{−s}` act invertibly on rational cohomology. These are smooth admissible representations, vanish for `k>`2dim `C_Σ`, and their `K^p×U_p(m)` invariants equal finite-level cohomology. Set `[H_c]=Σ_k(−1)^k[H_c^k]`, and evaluate test functions by Haar integration with compatible quotient measures. This uses finite-dimensional invariant spaces, not finite-dimensionality of the full infinite-level representation.

*Hypotheses.* Neat level, `ℓ≠p`, rational `ℓ`-adic coefficients, and `ξ` algebraic. Choose an identification `ℚ̄_ℓ≅C` when discussing complex characters.

([E. Mantovan — On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, Lemma 6 and Proposition 7, pp.13–14; [S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, p.17 and §6, equation (11), p.17.)

The interface consists of the following operations and identities.

- `H_c^k(Ig_b,L_ξ)^{K^p×U_p(m)}≅H_c^k(Ig_{K^p,m},L_ξ)`.
- The `J_b`-action is the unique extension that inverts `p⁻¹` and `fr^{−s}`.
- Take the finite alternating sum in the smooth admissible Grothendieck group.
- `e_g=1_{UgU}/vol(U)` has the correspondence trace; `1_{UgU}` has `vol(U)` times that trace.
- Pullback along finite étale level maps composes; its normalized trace is a retraction over rational `ℓ`-adic coefficients, giving the stated level invariants in the colimit.

Apply finite-level algebraic étale cohomology and its six operations. Mantovan Lemma 6 identifies the central actions with level projection and Frobenius; rational cohomology inverts both. Admissibility follows by exact averaging for the finite deck quotient and the level-invariant identity; dimension gives the bounded alternating sum.

**Checks.**

- On a finite étale zero-dimensional fibre of size `d`, the identity correspondence has trace `d`, whereas `1_U` has integrated trace `vol(U)d`.
- For a fixed `U`, the trace factors through the finite-dimensional `U`-invariant subspace; the full representation is not required to be finite-dimensional.
- Absolute Frobenius acts invertibly on rational `ℓ`-adic cohomology. This assertion does not replace an integral torsion-concentration theorem.
- For a nonproper leaf the target is `H_c`, not ordinary `H`; their traces need not agree.

*Needs:* §7.8; §7.9; §2.16; `TauCetiRoadmap.EtaleCohomologyFoundations` §§F.2–F.4 (finite étale pullback/trace and rational compact supports); Mathlib `MeasureTheory.Measure.IsHaarMeasure`; `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A4.1 (The integral Tate module).

### 7.10a Cohomological correspondence inputs for Igusa traces

Use the scheme correspondence and fixed-locus carriers of `EtaleDualityAndPerverseSheaves` §6.1 and its `TauCeti.EtaleDuality.CohCorr` from §6.2. For separated finite-type schemes over `𝔽̄_q`, `c=(c₁,c₂):C→X×X`, and a bounded constructible finite-Tor complex `K` over a finite extension `E/ℚ_ℓ`, `ℓ≠char(k)`, a lift is `u:c₁^*K→c₂^!K`, equivalently `c₂!c₁*K→K`. The supplied API `TauCeti.EtaleDuality.CohCorr.rgammac`, comp, pushforward, trace map and local term, together with `traceAdditivity`, gives the compact-support operator for proper `c₁`, composition, admissible pushforward, Verdier trace classes and local terms on proper open-and-closed fixed components.

For the finite Igusa coefficient correspondences of §§7.9–7.10, use the common finite-field descent of §7.11 and apply §6.5’s `fujiwaraVarshavskyTraceFormula` with `U=X`: `c₁` is proper, `c₂` is quasi-finite, and `K` carries its Weil descent. For sufficiently large `n`, the first leg `Frob_qⁿ∘c₁` has a finite fixed locus and the compact-support trace is the sum of stalk traces of the Frobenius-composed coefficient lift. The bound depends on the correspondence; a finite family uses a common bound. The Igusa specialization identifies this operator with the Haar-normalized Hecke action of §7.10 and the central Frobenius transport of §7.11; the geometric translation ensuring these hypotheses is §8.5. This uses the supplied generic theorem on its original carriers. ([Varshavsky](https://arxiv.org/pdf/math/0505564v2), §§1.1–1.2, 2.3, Theorem 2.3.2(a)–(b), and §5.)

**Checks.**

- On a point with `K=Eᵈ`, the identity operator has trace `d`.
- Multiplying a coefficient lift by a scalar multiplies its trace by that scalar. Section 8.2’s normalized lift acts as `e_g=1_{UgU}/vol(U)`; the raw characteristic function has `vol(U)` times that operator.
- The identity of a positive-dimensional nonproper `X` does not have a finite fixed locus; the Frobenius threshold cannot be omitted.

*Needs:* `TauCetiRoadmap.EtaleDualityAndPerverseSheaves` §§6.1–6.5 (correspondences, local terms and Frobenius-twisted trace formula); §7.9; §7.10.

### 7.11 A finite-field model compatible with the central Frobenius action

After enlarging a common decency integer `s` to contain the reflex residue field, each finite Igusa level admits a model `J_{K^p,m}/F_{p^s}` whose absolute `p^s`-Frobenius, transported to `F̄_p` and interpreted with the level-transition identifications, is `fr^{−s}`. For a finite family of `S_b`-Hecke correspondences, enlarge the field and source levels so the schemes, both legs and coefficient lifts descend to one finite field. This is a descent theorem, stronger than the elementary fact that a finite-type `F̄_p`-scheme has some finite-field model.

*Hypotheses.* Use the central `fr^{−s}` defined by the fixed slope-divisible `Σ`, and compatible levels and polarization.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Lemma 6.3, p.19; [E. Mantovan — On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, Lemma 6, p.13.)

Mantovan Lemma 6 compares quotient-by-Frobenius with absolute Frobenius and level projection. Construct the compatible descent datum by the isomorphism `p^{−sλ_i}F^s` on each slope piece. Verify effectivity and coefficient compatibility; At a finite rigidified Igusa level the level morphisms are finite étale; on affine charts, the isomorphism above gives the semilinear cyclic descent maps on the finite étale coordinate algebras. Their cocycle identity follows from the slope decomposition and `p^(−sλ_i)F^s`, and finite étale descent glues these algebras. Enlarge `s` so the finitely many charts, overlaps and correspondence legs are defined over the same finite field; the gluing maps descend with them. The resulting Frobenius is the specified `fr^(−s)`, not an arbitrarily chosen finite-field model. The isogeny Frobenius is interpreted together with the finite-level projections, since absolute Frobenius on a positive-dimensional scheme is not an isomorphism of schemes.

**Checks.**

- An arbitrary finite-field model is insufficient: its Frobenius must be the specified central `fr^{−s}`, with the negative sign.

*Needs:* §7.9; §7.8.

### Examples

An ordinary `p`-divisible group has BT slopes (1,0). A negative Frobenius shift has eigenvalue valuations (-sN,0), strictly increasing in the chosen decreasing-slope order; the positive shift reverses them. The element `diag(1,p)` is acceptable by its valuations, but its inverse has a denominator and it need not belong to the geometric monoid. After a negative scalar shift by `p^`(-a), followed by negative Frobenius, the valuation pair (-a-sN,-a) has integral inverse and the kernel bounds are in the required order. In the basic one-slope case the inter-slope inequality is vacuous, while inverse integrality remains necessary.

### Dependencies

`TauCetiRoadmap.PadicHodgeTheory` §5.5 (the shared `B(G)`, invariant maps and admissibility); `TauCetiRoadmap.PELModuli` §M2 (Representability and smooth good models); `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` Layers A1 (Rigidity and normalized line bundles) and A2 (Duality, polarizations and ample classes); `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` §2.1 (Hilbert families and graph parameters); `TauCetiRoadmap.SchemeAndStackFoundations` §§1.2–1.6 (Algebraic spaces); Mathlib `WittVector.Isocrystal`; Mathlib `WittVector.IsocrystalEquiv`; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.15 (The Dieudonné–Manin classification of isocrystals); `TauCetiRoadmap.ReductiveGroups` Layer 1 (representations = comodules); `TauCetiRoadmap.PELModuli` §M2.8 (Representability and smoothness); `TauCetiRoadmap.PELModuli` §M2.6 (Formal smoothness at good primes); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2 (Dieudonné theory); `TauCetiRoadmap.DiamondSixOperations` Layer S2: The exceptional direct image for eligible maps of small `v`-stacks; `TauCetiRoadmap.AdicCoefficientsAndComparisons` Layer L0: Adic coefficients; `TauCetiRoadmap.ReductiveGroupsPartII` §§RG2.5.1–RG2.5.2 (the dual group, its Galois action and the `L`-group); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.1.1 (quasi-split forms and rational tori over `Ĕ`); §1.6; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.10 (Dieudonné classification of `p`-divisible groups); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.1.7 (The Cartier dual of a `p`-divisible group); `TauCetiRoadmap.PELModuli` §M0.18 (The Kottwitz determinant condition); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.1.5 (The levels of a `p`-divisible group are its torsion, and multiplication by `p` is an epimorphism); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.16 (Slopes, Newton polygon and a-number of a Dieudonné module); Mathlib `AlgebraicGeometry.Scheme`; `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A3.3 (Quotients by finite locally free subgroups); `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A3.7 (Polarized Weil pairings); §2.16; §7.10a (supplied correspondence and trace interfaces for Igusa); Mathlib `MeasureTheory.Measure.IsHaarMeasure`; `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A4.1 (The integral Tate module).

## Layer 8: Igusa counting and stabilization

Finite coefficient correspondences and scalar/Frobenius shifts lead to polarized fixed points, effective triples and their masses. Prestabilization separates the global obstruction. The effective Levi transfer at `p`, including its inverse cocycle pairing and modulus factor, then assembles the stable rational trace.

### 8.1 Acceptable support and acceptable functions

The numerical acceptability condition is the strict cross-block valuation inequality. Empty or single-block lists satisfy it vacuously; in geometry the eigenvalue lists have the specified positive block dimensions. This inequality alone does not construct acceptable functions or quasi-isogenies.

For `δ∈J_b(ℚ_p)` write `δ_i` on the BT slope `λ_i`. It is acceptable when every pair of eigenvalues satisfies `v_p(e_i)<v_p(e_j)` for `i<j`. Equivalently transport its semisimple stable class through the inner twist to `M_b` and require `v_p(α(δ_s))>0` iff `⟨α,ν_b⟩>0` for every root outside `M_b`, with `ν_i=−λ_i`. The parabolic `P(ν_b)` has positive roots with `⟨α,ν_b⟩<0`. A locally constant compactly supported `φ` on `G(A_f^p)×J_b(ℚ_p)` is acceptable if its support is in `G(A_f^p)×S_b` with acceptable `δ` and it admits a finite double-coset expansion at neat level `U` whose algebraic correspondences have finite fixed-point sets and satisfy the compact-support stalk-trace formula. Support acceptability alone is weaker than this definition. The normalized function `e_g=1_{UgU}/vol(U)` is used when comparing with a correspondence.

*Hypotheses.* The finite moduli, geometric monoid and rational coefficient correspondences constructed here. Eigenvalues are computed after algebraic closure and by semisimplification for nonsemisimple `δ`.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Definitions 6.1–6.2, p.19; [S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.3, Definitions 3.1–3.2 and Lemma 3.4, p.11.)

The interface consists of the following operations and identities.

- For decreasing BT slopes, all valuations on an earlier block are less than all on a subsequent block.
- The root criterion through the inner twist agrees with the slope criterion for `ν=−λ`.
- Multiplication by `fr^{−sN}` sends `v_i` to `v_i−sNλ_i`; multiplication by a uniform scalar adds the same valuation to every block.
- Support in `S_b` and acceptable elements, a finite neat double-coset presentation, fixed-point finiteness and the stalk-trace identity are all required.
- Sums and scalar multiples of acceptable functions are acceptable after common refinement of their levels.

Translate the dual slope weights to the root condition, keeping `ν=−λ`. Use finite double-coset expansions and include the geometric trace conditions as data of the predicate. The large-Frobenius theorem proves these conditions for shifted functions; it is not used circularly in their definition.

**Checks.**

- For the cross-block valuation inequality, two singleton blocks `{0},{1}` pass; `{1},{0}` and `{0},{0}` fail. Every cross-block pair must be checked.
- An empty or one-block numerical family passes vacuously. Empty valuation sets in several blocks also pass the predicate, but cannot describe nonzero geometric slope blocks.
- For slopes (1,0), `δ=(1,p)` is acceptable and `δ=(p,1)` is not.
- One slope makes every `δ` acceptable as an element, but a `δ` with `δ⁻¹` not an isogeny is not in `S_b`.
- With two slopes, `1_{Γ_b}` fails element support acceptability because it contains the identity with equal valuations.
- For `λ=(1,0), fr^{−sN}` has valuation pair `(−sN,0)`, acceptable for `N>0`; the positive shift reverses the order.

*Needs:* §7.5; §7.9; §7.10.

### 8.2 Finite-level Hecke correspondences and coefficient lifts

For `U=K^p×U_p(m)`, `g∈G(A_f^p)×S_b` and a sufficiently small source level `V⊂W=U∩gUg⁻¹`, construct `c_g=(c₁,c₂):Ig_V→Ig_U×Ig_U`, with `c₁` the quotient/right-action map and `c₂` the level projection. The first leg is finite, hence proper; the second is finite étale, hence quasi-finite. These are properties of the legs over the usually nonproper `Ig_U`.

The universal rational quasi-isogeny gives `v_g:c₁^*L_ξ≅c₂^*L_ξ`. Since `c₂` is finite étale, `c₂^!=c₂^*`; adjunction gives the coefficient lift `u_g:c₂!c₁^*L_ξ→L_ξ` by `v_g` followed by the finite étale trace. Divide this lift by `d=[W:V]`. Its compact-support operator is the action of `e_g=1_{UgU}/vol(U)` on the `U`-invariants of §7.10, using direct pullback for the right action as in §7.3. In particular the graph `(r_g,id)` at unchanged level gives `r_g*`.

*Hypotheses.* The `p`-component of `g` belongs to `S_b`. Choose levels high enough for the quotient map and the complementary monoid map in the finiteness proof, then pass to any lower target level by its finite projection. A finite family uses common levels. The coefficient lift and its finite-field descent carry the universal quasi-isogeny and its rational normalization.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, pp.16–17, §6, equations (10)–(14) and Lemma 6.3, pp.17–20; [E. Mantovan — On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, Lemmas 5–6 and the intervening monoid and Frobenius constructions, pp.11–13; [Stacks, Tag 035D](https://stacks.math.columbia.edu/tag/035D).)

The interface consists of the following operations and identities.

- At sufficiently high source level, put the quotient/right-action map first and the level projection second.
- The quotient/right-action leg `c₁` is finite, hence proper, with compatible finite-level factorizations by central maps.
- The projection `c₂` is finite étale, hence quasi-finite.
- The universal quasi-isogeny, étale identification and trace give `d⁻¹u_g:c₂!c₁^*L_ξ→L_ξ`, with compact-support operator `e_g`.
- Refining `V` by degree `d′` multiplies the unnormalized trace lift by `d′`; division by the new `[W:V]` preserves the operator and its local terms after pushforward to the common correspondence.
- Fibre-product composition and the supplied `CohCorr.comp` agree with Hecke convolution after common level refinement and these degree normalizations.

For finiteness of the first leg, choose a central `z=p^(−a)fr^(−sN)` with `η=zδ⁻¹∈S_b`, where `δ` is the `p`-component of `g`. Such `a,N` exist by clearing denominators in `δ` and then separating the slopes in the kernel inequalities of §7.9. Use the inverse away-`p` component for the companion. At compatible sufficiently high source and intermediate levels, the monoid law identifies the composite of the `g`-map and this companion with the central `z`-map followed by level projections. Mantovan Lemma 6 identifies the scalar generator with a level projection followed by an isomorphism, and the negative Frobenius generator with absolute Frobenius and a level projection. Thus the composite is finite: level projections are finite étale and Frobenius is finite on these finite-type schemes over a perfect field. The companion map is separated, since its schemes are separated over the field. Apply the pinned `AlgebraicGeometry.IsFinite.of_comp` (Stacks Tag 035D) to make the original quotient leg finite; SchemeAndStackFoundations §0.29 supplies the scheme Frobenius and its finiteness over a perfect field. Composing with finite target projections gives finiteness at lower target levels as well. This argument establishes finiteness independently of any point-set fibre count.

Construct `v_g` in the pullback orientation using the universal quasi-isogeny on rational Tate realizations of `ξ`. Pull back along the proper `c₁`, apply `v_g`, then trace along `c₂`. On a common tower refinement, the fibres of `c₂` enumerate `U/V`; each right coset in `UgU/U` occurs `[W:V]` times, so division by this degree gives the sum of direct pullbacks for those cosets. Haar integration of `e_g` gives exactly that sum, whereas `1_{UgU}` gives `vol(U)` times it. The law `r_(gh)=r_h∘r_g` gives `r_g* r_h*=r_(gh)*`; finite étale base change and trace transitivity give the same law for the normalized `CohCorr` operators. Under §7.11’s descent, multiplication by the central `fr^(−s)` composes the action leg `c₁` with Frobenius and leaves the projection leg unchanged. Its Weil coefficient lift is the first-leg Frobenius lift of §7.10a.

**Checks.**

- For `g=1`, division by `[U:V]` makes projection pullback followed by trace the identity. At `V=U` the untwisted fixed locus is `Ig_U`; at a refined source it is `Ig_V`, whose normalized trace pushes down to the same identity.
- On a three-point finite étale torsor indexed by `ℤ/3`, `r_δ(i)=i+1` has pullback `r_δ*1_{0}=1_{2}`. The reversed correspondence `(id,r_δ)` instead gives `1_{1}`; its kernel is still zero, so `ker δ⁻¹` cannot remove the inversion.
- On a nonabelian right regular torsor, direct pullbacks satisfy `T_g T_h=T_(gh)`. Reversed legs give `T_(g⁻¹)` and reverse the multiplication order; identity and involution examples alone cannot distinguish them.
- A nonproper affine leaf admits finite quotient and projection legs. A negative Frobenius generator can make the first leg inseparable; it is finite, with no étaleness assertion for that leg.
- If `UgU` has `d₀` right `U`-cosets and the geometric source is refined by degree `d`, its trace counts `d d₀` branches before dividing by `d`; the normalized operator counts `d₀`.
- A permutation of `Ig_∞(𝔽̄_p)` alone supplies neither an algebraic correspondence nor its coefficient lift.

*Needs:* §7.9; §7.8; §7.10; §7.11; §7.10a (supplied correspondence and trace interfaces for Igusa); Mathlib `AlgebraicGeometry.IsFinite.of_comp`; `TauCetiRoadmap.SchemeAndStackFoundations` §0.29 (scheme Frobenius and finiteness over perfect fields).

### 8.3 Finite-field Tate full faithfulness and Honda classification

For abelian varieties `A,B` over `F_q` and `ℓ≠p, Hom_Fq(A,B)⊗ℤ_ℓ≅Hom_Gal(T_ℓA,T_ℓB)`. Their rational endomorphism algebras are semisimple, Frobenius acts semisimply, and equal Frobenius characteristic polynomials are equivalent to `F_q`-isogeny. Simple `F_q`-isogeny classes correspond to conjugacy classes of `q`-Weil algebraic integers `π`. If `K=Q(π)` and `D=End_Fq⁰(A)`, then `Z(D)=K`; `inv_v D` is `1/2` at real places, 0 at complex places and finite places away from `p`, and `[K_v:ℚ_p]v(π)/v(q)` modulo `Z` at `v|`p. If `e` is the index of `D`, then 2dim `A=e[K:Q]`. Honda existence, including the real Weil-number cases, is a separate proof input from Tate full faithfulness.

*Hypotheses.* Finite base field; integral Tate modules for full faithfulness, rational isogeny category for the classification.

([J. Tate — Endomorphisms of abelian varieties over finite fields](https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf), §1, Main Theorem and Lemmas 1–4, pp.134–136; §2, Propositions 1–2, pp.136–139; §3, Theorems 1–2, pp.139–141; [W. C. Waterhouse — Abelian varieties over finite fields](https://www.numdam.org/item/ASENS_1969_4_2_4_521_0.pdf), Chapter 2, the named Tate theorem, p.526, and Honda theorem, p.527; local invariants and dimension formula, pp.527–528.)

Tate §2 uses polarization and finiteness of bounded-degree polarized varieties to realize stable isotropic subspaces by endomorphisms; a commutant argument proves surjectivity at split primes. Compare ranks at other primes and integral saturation, then use `A×B` and its matrix corners for Hom. Use the centralizer description and local division invariants for simple objects. Honda’s converse realizes each Weil number; combine the existence theorem with the endomorphism-invariant computation, including real Weil numbers. The centre-sensitive module criterion below imposes additional endomorphism actions.

The `B`-action step also needs the following centre-sensitive embedding result, rather than just equality of Brauer classes. If `A` is central simple over `K` and `E/K` a finite field extension, then a `K`-embedding `E↪`A exists exactly when `[E:K]·`ind`(A⊗_K E)` divides `deg(A)`. Write `A=End_Δ(V)`; an embedding is an `E⊗_KΔ^op`-module structure on V. Artin–Wedderburn computes the dimension of its simple modules and gives the divisibility condition; taking the required number of copies proves sufficiency. More generally, for a semisimple `K`-algebra `B=∏B_i` acting on `V`, decompose `V=⊕V_i` and require each `V_i` nonzero and divisible by the dimension of a simple module for `B_i⊗_KΔ^op`. This retains every centre `K_i` and all multiplicities. These are [C.-F. Yu, *Embeddings of fields into simple algebras*](https://arxiv.org/abs/1105.2895), Theorems 2.5 and 2.7, pp. 8–9 (the equivalent introduction statements are Theorems 1.2–1.3, pp. 2–3). Compare algebraic and cohomological field Brauer groups by Tau Ceti `TauCeti.brauerCohomologyEquiv`, before applying ClassFieldTheory's local invariants. The API the field-embedding criterion for central simple algebras, semisimple action characterization and commutant Brauer class feeds §8.10. The same target supplies the matrix-module equivalence used in §§8.10 and 8.14: for a field `N` and `n≥1`, a finite-dimensional left `Mat_n(N)`-module `V` corresponds to the `N`-space `e₁₁V`, with inverse `W↦Nⁿ⊗_N W`. Matrix units give the mutually inverse maps and identify endomorphism algebras. This is the split Artin–Wedderburn case of the module construction in Yu §2, pp. 6–9, using RepresentationTheory.SemisimpleAlgebras Layers 2–3.

**Checks.**

- A quadratic field embeds in `M₂(K)`; it embeds in a quaternion division algebra exactly when it splits that algebra.
- A degree-three field cannot embed in `M₂(K)`, even if it splits it: splitting without the degree divisibility is insufficient.
- For `B=K×K` both summands of `V` must be nonzero. A one-dimensional `V` cannot carry a faithful `B`-action.
- For the standard `Mat_n(N)`-module `Nⁿ`, `e₁₁Nⁿ` has dimension 1 and its inverse reconstructs `Nⁿ`.
- At `n=1` the matrix-module equivalence is the identity on finite-dimensional `N`-spaces.
- At `n=0` the zero matrix ring has only the zero unital module, so it cannot be equivalent to all finite-dimensional `N`-spaces; the positive-size hypothesis is necessary.

- For an ordinary elliptic curve, the two `p`-slopes are 0 and 1 and `D` is the imaginary quadratic field. Real `π` with `π²=q` can yield a quaternion algebra and must not be discarded as a CM-only case.

*Needs:* Tau Ceti `TauCeti.brauerCohomologyEquiv` (field Brauer comparison); `TauCetiRoadmap.ClassFieldTheory` Layer 10 (global carriers, the Brauer sequence, and the sum of local invariants); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.17 (Isogeny classification of `p`-divisible groups over a perfect field); Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A4.1 (The integral Tate module); `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A6 (Arithmetic Hom and exports); `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A6.10 (The characteristic polynomial and the trace); `TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras` Layer 6 (the Brauer group and splitting fields).

### 8.4 The corrected adelic cohomology map used in global cancellation

For a number field `F` and connected reductive `G`, the canonical map `H¹(F,G(A_F))→A_F(G)`, expressed through the algebraic fundamental group and global duality, is functorial for homomorphisms of reductive groups. The separate map `β_G` from `H¹(F,G(A_F)/Z(G)(F))` is used for a fixed `G` and its exact-sequence arguments; no functoriality under arbitrary homomorphisms is asserted for it. In particular an inclusion of groups need not carry the centre of the source into the centre of the target and need not induce the required map on these quotients.

*Hypotheses.* Global cohomology with the standard adelic Galois action; `A_F(G)` is the dual-component group in Layer 1.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §2, Lemma 2.4, p.5; [S. W. Shin — Errata](https://math.berkeley.edu/~swshin/errata.pdf), p.1, first entry.)

Use the functorial map on algebraic fundamental groups, not a nonexistent functor on central quotients. Apply global duality to the adelic cohomology map. In the cancellation proof use `β` only within each fixed group, and the corrected unquotiented map for cross-group comparison.

**Checks.**

- The diagonal torus of `GL₂` has centre equal to itself, whose image is not central in `GL₂`; it defeats the uncorrected quotient functoriality claim.

*Needs:* §1.11; §7.4.

### 8.5 Scalar clearing and negative Frobenius shifts give the fixed-point trace

Put `c=(1,p)` and `t=(1,fr^s)`, central elements of `G(A_f^p)×J_b(ℚ_p)`, and define `φ_{a,N}(x)=φ(x c^a t^N)` for any compactly supported locally constant `φ`. There is `a₀` such that, for every `a≥a₀`, there is `N₀(a)` with `φ_{a,N}` geometrically acceptable for every `N≥N₀(a)`. Its support is translated by `c^{−a}t^{−N}`: scalar clearing makes every inverse slope-block map integral, and Frobenius then imposes the kernel inequalities and strict slope separation. The compact-support trace equals the finite sum of coefficient-stalk traces at Frobenius–Hecke fixed points, with the stated Haar/coset normalization. For fixed `a`, first choose `N₁(a)` so support lies in `S_b` and the acceptable cone, descend that finite correspondence family to a compatible `q`-model, and apply further Frobenius twists `n=N−N₁(a)` with `q^n>d(a)`. A common descent exponent may be enlarged for this family. Thresholds depend on `φ` and `a`. Frobenius alone does not clear a denominator on a zero-slope block.

*Hypotheses.* Finite-field model and coefficient lifts as in the preceding targets; `ℓ≠p`, finite-dimensional rational stalks.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Lemma 6.3 and its proof, pp.19–20; [Y. Varshavsky — Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara](https://arxiv.org/pdf/math/0505564v2), §2.3, Theorem 2.3.2`(a),(b)`, pp.20–21; [E. Mantovan — On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, pp.11–13, the `S_b` and `T_b` monoids and Lemma 6.)

Compact support gives uniform denominator bounds on all `δ_i⁻¹`. Choose `a₀` so `p^aδ_i⁻¹` is an isogeny for all support elements and all `a≥a₀`. Frobenius preserves integrality because BT slopes are nonnegative. For each fixed `a`, multiplying by `fr^{−sN}` adds `sNλ_i` to the inverse kernel bounds and subtracts it from element valuations; the positive successive slope gaps eventually give `f_{i−1}≥e_i` and strict acceptability. Mantovan p.12 supplies the two central generators. Fix a and `N₁(a)` after these support conditions hold. Construct and descend the finite family for `φ_{a,N₁(a)}`, including coefficients, and enlarge the common `s` and the initial shift if required. Section 8.2 puts the quotient/action in `c₁`; centrality and §7.11 give the shifted legs `(F^n∘c₁,c₂)` for `n=N−N₁(a)`, on a fixed descended correspondence. The coefficient lift is composed with the Weil structure as in Varshavsky Remark 2.3.3(c); level refinements use §8.2’s degree normalization. Thus the underlying correspondence is fixed while `n` grows. Apply §7.10a’s Frobenius-twisted trace theorem with `c₁` proper, `c₂` quasi-finite, `U=X` and `q^n>d(a)`. Fixed points are isolated and local terms are stalk traces. Sum the normalized finite double-coset expansion. This proves the scalar-plus-Frobenius trace statement with both monoid membership and the first-leg Frobenius identification.

**Checks.**

- For the identity on a smooth nonproper curve, Frobenius twisting has finitely many fixed points, whereas the untwisted identity has a positive-dimensional fixed locus.
- For central `c` and `t`, the support of `x↦φ(x c^a t^N)` is `supp(φ)c^(−a)t^(−N)`. In `GL₁, φ=1_{O×}` and `c=ϖ` give support `ϖ^(−a)O×`; reversing the translation would put it at valuation `+a`. The zero function remains zero for every shift.
- For `Σ=μ_{p∞}⊕ℚ_p/ℤ_p` and `φ_p=1_{pΓ_b}`, the zero-slope block of every `fr^{−sN}`-translated support element is `p` times a unit, so its inverse is nonintegral. First multiplying by `p^{−a}` with `a≥1` removes this obstruction; increasing `N` then separates the two slopes.

*Needs:* §8.1; §8.2; §7.11; §7.10a (supplied correspondence and trace interfaces for Igusa); §7.9.

### 8.6 Polarized isogeny classes and Igusa point orbits

Let PIC be the set of `B`-linear polarized abelian varieties `z=(A,λ,ι)` over `F̄_p` up to `B`-linear quasi-isogeny carrying `λ` to a positive rational multiple, whose prime-to-`p` hermitian Tate module is `V⊗A_f^p` and whose polarized rational BT group is `Σ` up to quasi-isogeny. Put `H_z=Aut_B⁰(A,λ)`, the rational quasi-isogeny similitude group. After fixing comparison isomorphisms, the fibre of `Ig_∞` geometric points over `z` is `H_z(Q) \ (G(A_f^p) × J_b(ℚ_p))`. A fixed point of a coset operator determines a rational acceptable element `a∈H_z(Q)`, modulo rational conjugacy at this intermediate orbit step. For the final effective-triple parameter set, define FPAV to consist instead of a near-equivalence class of `z` and an `H_z(A)`-conjugacy class `[a]` of an acceptable rational `a`. Near equivalence requires isometry of the structured Tate spaces at every `ℓ≠p` and of the polarized rational BT modules at `p`, not merely the same unpolarized Newton polygon.

*Hypotheses.* PIC has the PEL determinant and positivity conditions; all comparisons retain the similitude scalar. `H_z` is reductive and compact modulo centre at infinity by the Rosati positivity.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §7, Definition 7.2 and Lemmas 7.3–7.4, pp.22–24; §9, Definitions 9.4,9.7 and Lemmas 9.5–9.6, pp.28–29.)

The interface consists of the following operations and identities.

- The stated additional structures, determinant and rational comparison conditions define membership.
- A chosen comparison identifies the fibre with the displayed rational double quotient.
- Compare polarized hermitian structures at every finite place, not just rational slopes.
- A near-equivalence class and an adelic conjugacy class containing an acceptable rational a form a parameter.
- Changing comparisons conjugates `H_z` and transports every orbit parameter.

Forget the level and graded trivializations to obtain `z`; rational quasi-isogenies are the stabilizers of the comparison choices. Tate and Dieudonné full faithfulness identify the automorphism groups and the double quotient. Separate rational orbits, needed for local orbital integrations, from adelic orbits, used to aggregate the final mass.

**Checks.**

- The same `z` can have many Igusa points at a finite level; PIC is not a point-level moduli set.
- Isomorphic unpolarized rational BT modules with inequivalent hermitian pairings do not automatically define the same near-equivalence class.
- Several rational `H_z`-conjugacy classes can lie in one adelic class; FPAV groups them, while the preliminary orbit sum keeps them separate.
- Changing a comparison conjugates its `H_z` embedding and does not change the quotient or the eventual conjugacy class.

*Needs:* §7.8; §7.6; §8.3; `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A6 (Arithmetic Hom and exports); `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A2 (Duality, polarizations and ample classes).

### 8.7 Effective `p`-adic types with common-refinement equivalence

For a CM field or totally real field `M` with its complex-conjugation involution `c`, a `p`-adic type has an effective rational divisor `η` on its `p`-places satisfying `η+cη=[p]`, where `[p]` has coefficient `e(x/p)`. A general type is `(M=∏M_t,η,(n_t)_t,κ:F→M)` with a nonempty finite index set, positive integral multiplicities and the compatible `F`-action. A simple type means that `M` is a field and its multiplicity is 1; minimality is a separate condition. Under a field embedding `M_t→M′_u`, pullback sends `η_x` to `e(y/x)η_x` at `y|x`. Common refinement is specified by partitions of the source factor indices into nonempty blocks, individual `F`-linear field embeddings into each common factor, equality of the pulled-back divisors and equality of the sums of multiplicities. Repeated equivalent simple factors may merge, so these maps are not embeddings of the product algebras. A minimal simple type embeds compatibly into every equivalent simple type; a general minimal type has minimal simple factors and no two equivalent factors. Every class has a unique `F`-minimal representative up to `F`-algebra isomorphism and relabelling. The associated BT slopes are `η_x/e(x/p)`. This records geometric isogeny classes over `F̄_p` after choosing a finite field of definition and all endomorphisms, rather than a fixed-`F_q` Frobenius polynomial.

*Hypotheses.* `F=Z(B)`; `η` rational effective; multiplicities nonzero, not signed.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8, Definitions 8.1–8.2, Remark 8.3 and the common-refinement/minimality discussion, pp.24–25.)

The interface consists of the following operations and identities.

- All `η_x≥0` and `η_x+η_cx=e(x/p)`.
- At `y|x` set `η′_y=e(y/x)η_x`; iterated pullbacks compose.
- Factorwise common-refinement equivalence respects the `F`-action; repeated equivalent simple factors merge by addition of multiplicities. It does not require an embedding of the product algebra into the merged algebra.
- Every equivalence class has an `F`-minimal representative unique up to `F`-algebra isomorphism and relabelling; simplicity (one field, multiplicity 1) by itself does not imply minimality.
- `η_x/e(x/p)` is unchanged under ramified pullback.
- With the same labelled fields, multiplicities and `F`-structure, equality of every coefficient `η_{t,x}` gives equality of raw types; after quotienting, equality is factorwise common-refinement equivalence.

Normalize valuations of a Weil number by `v(q)` and account for ramification in pullback. For a simple type pass to a common Galois CM field over `F` and descend along the subgroup preserving the divisor. Then merge equivalent minimal simple factors by summing multiplicities. Compare types by the factorwise refinement relation, requiring embeddings only on the corresponding factors after a common refinement. Use the involution identity to pair slopes `λ` and `1−λ`.

**Checks.**

- For a split `p` in an imaginary quadratic field, coefficients (1,0) define slopes (1,0); (1,1) violates `η+cη=[p]`.
- For `M=Q` and `c=id, η_p=1/2` is the allowed simple real type, not 0 or 1. More generally at a `c`-fixed `p`-place, `η_x=e(x/p)/2` and its normalized slope is `1/2`.
- If `e(y/x)=2`, a coefficient `η_x=1/2` becomes `η′_y=1`, while the normalized slope stays unchanged.
- Two identical minimal factors of multiplicities 2 and 3 refine to one with multiplicity 5; signed cancellation is forbidden.
- Over `F=Q`, the type `M=Q(i), η_x=e(x/p)/2` and multiplicity 1 is simple but descends from the half type on `Q`, so it is not minimal.

*Needs:* §8.3.

### 8.8 Effective Levi endoscopy for the Igusa `p`-factor

For a local endoscopic datum `(H,s,η)` of `G` at `p`, let `E_p^eff(J_b,G;H)` be the isomorphism classes of endoscopic data `(M_H,s_H,η_H)` for the inner form `J_b` of `M_b` whose associated acceptable semisimple stable pairs `(δ,κ)` occur, and whose extension through `M_b⊂G` gives `(H,s,η)`. Realize `M_H` as a `ℚ_p`-Levi of `H` with a cocharacter `ν_{M_H}` mapping geometrically to `ν_b`; choose compatible `L`-morphisms and fix representatives of the finite coset set `Out(H,s,η)/Out_G(M_H,s_H,η_H)`, giving embeddings `I(M_H,H)`. For each effective stable pair there is a unique embedding coset, up to the permitted automorphism of the Levi datum, carrying its `M_H`-class to the given `H`-class. Its elements are acceptable for every embedded cocharacter `iν_{M_H}`. Empty effective Levi sets contribute zero.

*Hypotheses.* Fix the decency inner twist, the global datum localized at `p`, and compatible based dual embeddings. The quotient is a set of cosets with representatives, not an assertion that the subgroup is normal.

([S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.1–6.2, equations (6.1)–(6.7) and Lemma 6.2, pp.17–21.)

The interface consists of the following operations and identities.

- Existence of an acceptable `J_b` stable pair and extension to the chosen `H` datum determines relevance.
- Choose one embedding for each `Out(H)/Out_G(M_H)` coset.
- A relevant `H`-class has one contributing embedding coset modulo permitted Levi automorphisms.
- `ν_{M_H}` transports `ν_b`; every chosen embedding carries acceptable elements to its own acceptable cone.
- No relevant datum implies a zero `p`-function.

Restrict the centralizing dual datum to `M_b` and use the inner-form relevance condition for `J_b`. Construct the Levi in `H` and compare the two dual/`L`-group diagrams. Inject `Out_G(M_H)` into `Out(H)`, choose coset representatives, and prove uniqueness from the corresponding stable-pair parametrization. Acceptability follows from inclusion of root systems.

**Checks.**

- For `H=G*` the Newton Levi datum is `M_H=M_b`; the inner relevance still depends on `J_b`, not on whether `H` is quasi-split.
- If the two outer groups coincide, `I` has one representative; multiplying the summand by the full outer group size is wrong.
- If no acceptable `J_b` class matches the `H` datum, the effective set is empty and the construction contributes zero.
- Two different embedding representatives may transport `ν` differently; testing acceptability against one fixed untransported cocharacter is not the rule.

*Needs:* §7.5; §8.1; §1.4; §1.16.

### 8.9 Acceptable Levi functions, ordinary orbital integrals and normalized Jacquet modules

For connected reductive `G₀/ℚ_p`, a rational cocharacter `ν` with Levi `M=Z_{G₀}(ν)`, and `φ∈C_c^∞(M(ℚ_p))` supported on `ν`-acceptable elements, assume `O_m^M(φ)=0` for semisimple `m` with disconnected centralizer. There exists a lift `φ̃∈C_c^∞(G₀(ℚ_p))` with `O_g^{G₀}(φ̃)=δ_{P(ν)}(m)^{−1/2}O_m^M(φ)` if `g` is rationally conjugate to an acceptable `m`, and zero otherwise. Such `m` is unique up to `M(ℚ_p)`-conjugacy. Its stable version is `SO_g(φ̃)=δ_{P(ν)}(m)^{−1/2}SO_m(φ)` when `g` is stably conjugate to an acceptable `m`, and zero otherwise. For irreducible admissible `π, tr π(φ̃)=tr J_{P(ν)^op}^{G₀}(π)(φ)`, where `J_P=Jac_P⊗δ_P^{−1/2}`. This normalized lift has a half-modulus orbital factor. The variant with full `δ_P⁻¹` orbital factor instead satisfies `tr π(φ̃_full)=tr Jac_{P(ν)^op}(π)(φ)=tr J_{P(ν)^op}(π)(φδ_P^{−1/2})`.

*Hypotheses.* The root acceptability sign and `P(ν)` convention are those fixed above; quotient Haar measures on corresponding centralizers are compatible.

([S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §1.2, p.4; §3.3–3.4, Lemmas 3.4–3.6,3.9 and Corollary 3.10, pp.11–12; [M.-F. Vignéras — Caractérisation des intégrales orbitales sur un groupe réductif p-adique](https://repository.dl.itc.u-tokyo.ac.jp/record/39626/files/jfs280338.pdf), §1.n, Theorems A–`B`, pp. 948–949, and §1.o(3), p. 950, for fixed central character.)

Acceptable eigenvalue valuations force a conjugating Weyl element to preserve `P(ν)`; rational conjugacy therefore stays in M. The stable rational-class bijection uses the injectivity `H¹(M)→H¹(G₀)` of §1.13a through the rational parabolic. Set `φ₀=φδ_P^{−1/2}` and prescribe its conjugacy-summed orbital function W. Realize `W` by the orbital-integral characterization: it is conjugation invariant, supported compactly modulo conjugacy and locally constant on the regular set; after descent at each semisimple point its germ expansion is the one transported from M. Acceptability keeps the transverse roots away from zero on the compact support and identifies the descended centralizer with that in M. Hence the transported germ coefficients are genuine unipotent orbital coefficients; outside the acceptable conjugacy saturation they are zero. A finite cover of the support modulo conjugacy and a partition of unity patch these local realizations. Use `|D_{G₀}^M(m)|=δ_P(m)`, Weyl integration and Casselman’s character comparison to derive the normalized opposite-Jacquet identity. In the acceptable chamber `Θ_π(m)=δ_P(m)^{−1/2}Θ_{J_{P^op}π}(m)`; the relative Weyl discriminant contributes `δ_P(m)`, so the half-modulus orbital factor cancels the remaining half. Shin’s linked author copy, Lemma 3.9`(i)`–(ii), p.12, prints a full orbital modulus together with a normalized Jacquet trace; these cannot hold simultaneously under its §1.2 definitions. The half-modulus version here is the consequence of the displayed Weyl/Casselman calculation. Its use without an extra input twist agrees with Shin, *Galois representations arising from some compact Shimura varieties*, §5.6, (5.33)–(5.36), p.41.

The trace/constant-term compatibility used here is part of this target. For normalized induction `i_P^Gσ`, define `f^P(m)=δ_P(m)^{1/2}∫_K∫_N f(k⁻¹mnk)`dn dk with the chosen compatible Haar measures. Then `tr(i_P^Gσ)(f)=tr σ(f^P)`. Prove it by realizing induction on `K`, writing its convolution kernel and integrating its diagonal; this is the induced-character calculation. For a finite-`length π` and `m` regular in a chamber strictly contracting `N`, the Casselman character identity is `Θπ(m)=δ_P(m)^{1/2}Θ_{r_Pπ}(m)` for normalized `r_P`. Canonical lifting of Jacquet-fixed vectors identifies the contracted Hecke operators; taking their finite-dimensional traces proves the identity. In the twisted case require `θ` to preserve the parabolic and include its intertwiner in both traces. Scholze LLC Lemmas 6.1–6.3, pp. 15–16, give precisely the twisted contraction and constant-term calculation used in §10.11. Add acceptable function induced trace, contracting Jacquet character and twisted Jacquet trace. Check `P=G` gives the `K`-conjugacy average of `f`, with the same invariant traces as `f` (and equality as functions when `f` is `K`-conjugation invariant); using an unnormalized Jacquet module removes the displayed half-modulus; for `GL₂` a diagonal element with distinct slopes chooses one contracting chamber, and cannot justify the identity in the opposite chamber.

**Checks.**

- For `GL₂` diagonal `M` and `ν=(−1,0), m=(1,p)` has `δ_P(m)=`p. The normalized orbital coefficient is `p^{−1/2}`. For `π=1, J_{P^op}(1)=δ_P^{1/2}`, so Weyl integration gives `p·p^{−1/2}=p^{1/2}`, agreeing with the normalized Jacquet trace. At residue cardinality `q=4` the numerical equality is `4·(1/2)=2`, whereas `4·(1/4)=1≠2`.
- The full `δ_P⁻¹` orbital coefficient pairs with the unnormalized opposite Jacquet module; for the same `GL₂` trivial representation it gives trace 1. Using it with normalized `J` gives the wrong value.
- The regular pair `(1,−1),(−1,1)` is `G`-conjugate but not `M`-conjugate and is not acceptable. Extending the lift formula beyond its acceptable support would fail the required `M`-conjugacy uniqueness.
- For `P=G` the modulus and relative discriminant are 1, and the orbital and trace identities reduce to the identity on invariant distributions.

*Needs:* §1.13a; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §§SR.2.2–SR.2.3 (Jacquet functors, induction and canonical lifting); §8.1; §2.1; §2.16.

### 8.10 Geometric `B`-linear isogeny classification and division invariants

Nonzero `B`-linear abelian varieties over `F̄_p` up to `B`-linear isogeny correspond to the minimal effective `p`-adic types with multiplicities and compatible `κ`, subject to the Morita dimensions of B. For a simple factor of centre `M_t` the `B`-linear endomorphism division algebra `C_t` has `inv_x C_t=1/2−inv_x(B⊗_F M_t)` at real `x, −inv_x(B⊗_F M_t)` at finite `x∤p`, and `η_x f(x/p)` modulo `Z` at `x|p` under the standing split `B_p` hypothesis. Its `p`-component has slope `η_x/e(x/p)` and height `[M_{t,x}:ℚ_p]`sqrt`([B:F])`sqrt`([C_t:M_t])`; multiply by `n_t` and sum for the full type. This classifies unpolarized `B`-linear objects. A principal polarization and the prescribed hermitian local forms are not supplied by the divisor alone.

*Hypotheses.* Simple central `B` over `F` with the PEL involution; `p`-adically split `B`; admissible `B`-action dimensions. Work over `F̄_p`, permitting finite-field extension containing all endomorphisms.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8, Proposition 8.4 and Corollary 8.5 with their proofs, pp.25–26.)

Choose a finite model with all endomorphisms defined and normalize its Weil numbers; finite extensions become common refinements. Apply Tate–Honda factorwise, the CFT invariant exact sequence, and the semisimple-algebra double-centralizer theorem, together with §8.3’s matrix-module equivalence, field Brauer comparison and centre-sensitive embedding criterion to impose the `B`-action. Take the commutant algebra; tensor-product invariants subtract `inv B`, with the real `1/2` contribution retained. Dimensions determine multiplicities and BT heights.

**Checks.**

- For `B=Q` and the real type `η=1/2, C` has the real and `p`-adic quaternion invariants `1/2`, giving the supersingular elliptic case.

*Needs:* §8.7; §8.3; `TauCetiRoadmap.ClassFieldTheory` Layer 10 (global carriers, the Brauer sequence, and the sum of local invariants); `TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras` Layer 6 (the Brauer group and splitting fields).

### 8.11 Scalar and Frobenius shifts determine finite virtual-character identities

Let `Π₁,Π₂` be finite virtual complex smooth admissible representations of `G(A_f^p)×J_b(ℚ_p)`, or finite irreducible families visible after fixing the away-`p` tests and a `p`-level. Agreement of their traces on every geometrically acceptable function implies agreement on every compactly supported locally constant function. For fixed `φ` use `φ_{a,N}(x)=φ(x c^a t^N), c=(1,p), t=(1,fr^s)`. Its trace difference is a finite sum `Σ_j c_j u_j^{−a}z_j^{−N}`, with nonzero scalar and Frobenius central eigenvalues `u_j,z_j`. For each `a≥a₀` the geometric theorem gives vanishing for every `N≥N₀(a)`. Group by equal `z_j` and apply a Vandermonde system to consecutive large `N`; the resulting vanishing of all grouped coefficients gives the difference on `φ_{a,0}` equal to zero. Then group by equal `u_j` and apply a second Vandermonde system to consecutive large `a`, giving the difference on `φ_{0,0}=φ` equal to zero. If a family requires a larger descent power of Frobenius, group its eigenvalues for that power; evaluating the resulting zero coefficients at `N=0` gives the same first conclusion. The finite Grothendieck decomposition supplies scalar central actions; no diagonalizability of a central action on arbitrary extensions is assumed.

*Hypotheses.* Finite number of constituents for the fixed-level/test-function family; scalar central action on each irreducible. The scalar-plus-Frobenius translated functions `φ_{a,N}` are eventually acceptable as specified above; the Frobenius threshold may depend on `a`. Both central translations preserve the fixed `p`-level.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Lemma 6.4 and proof, pp.20–21; [A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, Lemma 5.5.1, pp.741–743; [A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), §5.6, Lemma 5.6.2, pp.75–76.)

In the finite irreducible Grothendieck decomposition, central `p` and `fr^s` act by nonzero scalars. Negative support translation gives the inverse powers `u_j^{−a}z_j^{−N}`. Fix any `a≥a₀` and group equal Frobenius eigenvalues. The `r` consecutive equations for `N≥N₀(a)` have a nonzero diagonal factor and a Vandermonde matrix on the distinct `z_j⁻¹`; all grouped coefficients vanish, so the difference on `φ_{a,0}` is zero. This holds for every `a≥a₀`. Group equal scalar eigenvalues and repeat the same finite Vandermonde argument in `a`. Its coefficients vanish and their sum gives the original trace identity on `φ`. A single Frobenius argument would leave the scalar translate instead of `φ`.

**Checks.**

- With eigenvalues 2 and 3, two consecutive equations `c₁·2^{−N}+c₂·3^{−N}=0` have determinant `−2^{−N−1}3^{−N−1}≠0`. A single equation would not suffice. Equal eigenvalues must first be grouped.
- At `N=0` the matrix `[[1,1],[1/2,1/3]]` has determinant `−1/6`.
- If every Frobenius eigenvalue is 2 but the scalar eigenvalues are 2 and 3, the first grouping proves an equation `c₁·2^{−a}+c₂·3^{−a}=0` for all large `a`. Two consecutive scalar equations then force both coefficients to vanish. Their `a=0` sum cannot be inferred from a single fixed-a equation.

*Needs:* §8.5; §2.16; Mathlib `Matrix.vandermonde`; Mathlib `Matrix.det_vandermonde`.

### 8.12 Acceptability recovers the endomorphism centre and adelic centralizers

For `z∈`PIC and an acceptable rational `a∈H_z(Q)`, let `M_z` be the centre of `End_B⁰(A)` and `F[a]` the `B`-central field algebra generated by `a`. Then `M_z⊂F[a]`. Under the chosen Tate and Dieudonné comparisons, `Z_{G(A_f^p)×J_b(ℚ_p)}(a)=ι(Z_{H_z}(a)(A_f))`. In particular the finite-place centralizer used in the orbit integral is the adelic group of a rational reductive centralizer; an isomorphism of the unpolarized BT groups alone would not provide this conclusion.

*Hypotheses.* a acceptable, semisimple in the counting formula, with all PEL structures retained.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8, Lemma 8.6 and its proof, pp.26–27.)

The strictly separated eigenvalue valuations determine which embeddings of `F[a]` carry each slope. Hence the normalized `p`-divisor descends to `F[a]`; minimality of the type forces `M_z⊂F[a]`. Tate/Dieudonné commutants now identify the local centralizers at all finite places, with compatible hermitian structure.

**Checks.**

- If two slope blocks have equal eigenvalue valuations, the recovery argument fails; regularity by itself cannot replace acceptability.

*Needs:* §8.7; §8.10; §8.6; §8.1.

### 8.13 Igusa triples, centralizer isocrystals and the effective obstruction

An Igusa triple of type `b` is `(γ₀;γ,δ)`, where `γ₀∈G(Q)` is semisimple and `R`-elliptic, `γ∈G(A_f^p)` is geometrically conjugate to `γ₀` place by place, and `δ∈J_b(ℚ_p)` is acceptable and geometrically conjugate to `γ₀` through the fixed inner identification. Identify `γ₀` by rational stable conjugacy, `γ` by ordinary `G(A_f^p)`-conjugacy, and `δ` by ordinary `J_b(ℚ_p)`-conjugacy. Write `I₀=Z_G(γ₀)`, connected for these type `A/C` groups with simply connected derived group, and `I_δ=Z_{J_b}(δ)`, its `p`-adic inner form. Transport the hermitian isocrystal while identifying `γ₀` with `δ` to obtain a basic `b_δ∈B((I₀)_Qp)`. Define `α_p=κ_{I₀}(b_δ), α_v` from the rational-class cocycle for `γ_v` at `v≠p,∞`, and `α_∞` from `μ` on an elliptic real torus. For this elliptic `I₀` set `K(I₀/Q)=(⋂_v Z(Î₀)^{Γ_v}Z(Ĝ))/Z(Ĝ)`. Extend the local characters to `Z(Î₀)^{Γ_v}Z(Ĝ)`, with restrictions `−μ` on `Z(Ĝ)` at `p, +μ` at infinity and zero elsewhere. Their product descends to `α∈K(I₀/Q)^D`. The triple is effective iff `α=1`. The induced minimal `p`-adic type includes positive integral multiplicities determined by Morita heights; its construction respects this equivalence relation.

*Hypotheses.* Standing simple unramified PEL type `A/C, b∈B(G,−μ)`; local and global dual-centre dictionaries supplied by Layer 1. `K` is the finite obstruction group defined here, not the entire group `π₀Z(Î₀)^Γ`.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §10, Definition 10.1, pp.29–30; Definition 10.3 and Lemma 10.4, pp.30–31; Definition 10.7 and Lemmas 10.8–10.9, pp.33–35; [S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.2, Lemma 4.3 and proof, p.14.)

The interface consists of the following operations and identities.

- The three semisimple/stable matching conditions and `p`-acceptability define membership.
- Stable rational conjugacy of `γ₀` and ordinary adelic/`p`-adic conjugacy of `γ,δ` are the three relations.
- Transport gives basic `b_δ` in `B(I₀)` and its inner automorphism group is `I_δ`.
- `κ(b_δ)`, away-`p` rational cocycles and the `μ`-character define the local components.
- Their descended product `α` is trivial precisely for an effective triple.
- The normalized divisor and Morita heights define a refinement-invariant type with positive integral multiplicities.
- The descended `α` is unchanged under stable rational replacement of `γ₀` and ordinary replacement of `γ,δ` with every comparison transported; auxiliary local lifts may change but their restrictions defining `α` do not.

Use separated valuations to assign each `p`-place of `F[γ₀]` to a unique BT slope; descend the normalized divisor to its minimal centre. Use local module dimensions, Brauer invariants and the real symplectic parity to show the multiplicities are positive integers independent of `p`-place. Transport Frobenius into `I₀` and compute `κ`; the restrictions at `p` and infinity cancel on `Z(Ĝ)`, so the local product defines the obstruction on K. Prove independence from all transport choices.

**Checks.**

- The `p`-component restricts to `−μ` and the infinite component to `+μ` on `Z(Ĝ)`; choosing `+μ` twice prevents descent.
- Two `σ`-conjugate elements in `G(L)` need not be ordinary conjugate in `J_b(ℚ_p)`; the triple quotient never identifies them on that basis.
- For `K=Z/2`, summing its two characters gives 2 for `α=1` and 0 for the nontrivial obstruction.
- If distinct factors have identical minimal type, combine their positive multiplicities rather than claiming the first constructed type is already minimal.

*Needs:* §7.4; §8.12; §8.10; §1.11; §1.15; §1.14.

### 8.14 Polarized realizations, global cohomology and near-equivalence fibres

For a polarized `B`-linear `z`, its polarized quasi-isogeny forms with the same real positivity are classified by `ker(H¹(Q,H_z)→H¹(R,H_z))`. Those forms near equivalent to `z` are the locally trivial subset `ker¹(Q,H_z)`, defined as the kernel of localization at every place. Their `H`-groups have the common inner-form identification induced by central cocycles. For an admissible effective triple below, its prescribed `B`-action, positive real pairing and finite-place hermitian/isocrystal data admit a polarized realization; this existence uses global Brauer embeddings and the hermitian Hasse principle, not unpolarized Tate–Honda alone. Any conversion to an integral lattice or prime-to-`p` level separately respects the PEL determinant and self-dual local conditions.

*Hypotheses.* The quasi-isogeny category permits positive rational polarization similitudes; integral principal-polarization assertions need the indicated lattice step.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §9, Lemmas 9.2–9.6, pp.28–29; §12, Lemma 12.1, Corollary 12.2 and Lemma 12.3, pp.37–41.)

Twist the structured object by `H_z`; positivity is the real localization condition. Local Tate and Dieudonné comparison detects near equivalence, giving exactly `ker¹`, not all real-trivial classes. Kottwitz, *Points on some Shimura varieties over finite fields*, Lemma 9.2, p. 402, obtains a positive rational `B`-polarization by density of rational points in the open cone of real `B`-polarizations. Lemma 17.1, pp. 434–435, constructs the cocycle classification: Hilbert 90 trivializes the cocycle in the full endomorphism group, transports the symmetric isogeny, and the real-trivial condition makes a rational scalar multiple positive. Lemma 17.2, p. 435, identifies equality of the finite-place structures with `ker¹`.

For existence with prescribed triple, follow Shin Lemma 12.3, pp. 39–41. The `p`-adic type and §8.3's centre-sensitive index criterion first give an unpolarized `B`-object and then a positive `B`-polarization. Subtract its local dual-centre invariants from the prescribed ones. Effectivity makes their global sum zero and their real component trivial, so the localization exact sequence of §1.11 realizes the differences by a global `H¹` class; the preceding positivity criterion realizes its polarization. Repeat for the centralizer of `γ₀`. Compatibility of these two corrections uses the surjection between their locally trivial `H¹` kernels (Shin Lemma 12.3, p. 41). The resulting isometry transports `γ₀` to the required automorphism. Integral self-dual lattices and the prime-to-`p` level are added only after this rational construction; at `p` check the determinant condition on §7.6's Dieudonné module.

The CM lifting input is a further target of this section. Define a CM isogeny lift for an abelian variety over `F̄_p` equipped with a faithful action of a commutative semisimple CM algebra of dimension twice its dimension: after a finite field of definition and finite residue extension, it is an equivariant isogeny from the reduction of a characteristic-zero CM abelian scheme with that rational algebra action. A finite extension of the `p`-adic field is allowed; neither an unramified lift nor a lift of a prescribed integral lattice or principal polarization is asserted. For simple factors choose a CM splitting field containing the Frobenius field; Tate's Theorem 2 (§3, p. 102) and Lemmas 3–6 (§§3–4, pp. 101–105) give this equivariant isogeny construction. Specifically choose a CM type with the prescribed `p`-adic multiplicities, construct its polarized complex torus and algebraize it, descend to a number field, and obtain good reduction after a finite extension (Lemma 4, pp. 102–103). The slope formula of Lemma 5, pp. 103–104, and the root-of-unity comparison of Lemma 6, p. 105, identify the reduction up to isogeny. Matrix multiplicities are recovered by Morita equivalence, and products by idempotents. The characteristic-zero descent and potential-good-reduction assertions in this construction are part of this target, rather than an assumed theorem about every abelian variety.

For the cancellation calculation, let `T` be an elliptic maximal torus in the polarized `B`-linear quasi-isogeny group, and let `N` be its commutant in `End⁰_B(A)`; equivalently `T` consists of the units of `N` whose product with their `c`-conjugate is a common rational scalar. Transfer `N` to a rational `B`-module `W` with a nondegenerate `∗⊗c`-pairing. Require the same geometric `B⊗_F N`-module multiplicities as on the realizations of A. Define the local characters `α_v(N,W;A,λ)` by the prime-to-`p` comparison torsors, the class of the dual Dieudonné module in `B(T_Qp)`, and at infinity the cocharacter of the positive complex structure on `W_R` commuting with `B` and N. In particular the infinite character is computed using W's pairing. It is not fixed independently of W. Their restrictions have product one on `T̂^Γ`. This cancellation of the local invariants applies before `A` has the prescribed PEL finite-place pairings.

Here is the proof at the torus level. Given another rational paired comparison `W′`, the torsor `Isom_{B,N,sim}(W,W′)` defines `t∈H¹(Q,T)`. With this orientation, `α_v(W′)−α_v(W)=−loc_v(t)`, where `loc_v` includes the local Tate–Nakayama map. This identity holds at every place, including infinity: the positive complex structures select the possibly different CM types there. Global reciprocity gives `Σ_v loc_v(t)|T̂^Γ=0`. Thus the product is independent of `W` without requiring `W_R≅W′_R` as paired `B`-modules. Likewise, replacing `λ` by a compatible positive polarization changes the finite invariants by the localizations of a global `T`-class. Its infinite localization is zero, because the two polarizations lie in the same positive cone. Apply §1.11's global exact sequence to this class as well.

Compute the product on a weak CM isogeny lift with its own Betti space `W₀` and a positive polarization transported from that lift. To keep the `B`-action, decompose by `N`-idempotents and use the split factors `B⊗_F N_t≅Mat_n(N_t)` and their rank-one CM Morita factors, as in the first paragraph of Shin Lemma 11.1, p. 36. In the type `A/C` torus case `N` is CM and is free of rank two over its `c`-fixed algebra (Kottwitz §14, pp. 419–420): the real polarized centralizer is compact modulo its scalar centre, with complex-conjugate torus weights. The transferred `N` is maximal in `C=End_B(V)`, so `N` splits `C`; since the Brauer classes of `C` and `B` are opposite, it also splits B. The local embedding and involution step below supplies this transfer without using the cancellation conclusion. Apply §8.3's centralizer/index criterion to obtain the matrix multiplicities. Lift the rank-one factors with their `N_t`-action and recover the matrix action on repeated copies. The positive `∗⊗c`-involution gives a compatible positive Riemann form on these CM factors, using AbelianSchemesAndArithmeticModuli §§A5.2, A6.14–A6.15; transport its polarization through the equivariant rational isogeny. This only lifts the rational action, not the integral Lie module. Smooth proper prime-to-`p` comparison makes every `α_ℓ` zero for `ℓ≠`p. For the torus representation of the lifted object, the filtered crystalline comparison and the CM reciprocity cocharacter give `κ_T(b)=−μ₀` in `X_*(T)_Γp`; its positive Betti complex structure gives `+μ₀` at infinity. This is the calculation of Kottwitz Lemma 13.1, pp. 415–416, applied with the matrix multiplicities retained; Kottwitz Lemma 15.2, pp. 425–428, performs exactly this `B`-linear reduction: Hilbert 90 for `N` over its `c`-fixed algebra makes the transported involution on `B⊗_F N≅Mat_d(N)` the adjoint of a Hermitian matrix, which is then diagonalized, so that the diagonal idempotents are self-adjoint and the polarization splits into `d` copies of a CM factor. Both terms restrict to the same global character lattice and cancel. Product factors share the same weight-one multiplier. Kottwitz Lemma 13.2, pp. 416–418, supplies the comparison-torsor and polarization changes just used. No assertion about the lift's PEL Lie signature enters this proof.

There is also a structured realization target with a stronger input. the PEL realization of the CM lift takes a point `s` of the fixed unramified good-reduction PEL model of type A or `C` with connected reductive group, its polarized quasi-isogeny group `H_s`, and a maximal torus `T⊂H_s`. Put `N=Z_{End⁰_B(A_s)}(T)`, with its Rosati involution `c`. It produces a positive `B⊗_F N`-polarization `λ₀` and a rational paired `B⊗_F N`-module `W₀` such that `W₀⊗A_f^p≅V^p(A_s,λ₀)` and `W₀⊗R≅V⊗R` as paired `B`-modules. Kisin–Madapusi Pera–Shin, Corollary 2.3.15, p. 36, constructs a CM special point for `T`; Lemma 2.3.13, pp. 34–35, gives a nonempty `T`-intertwining isogeny torsor. After forgetting polarization the isogeny locus is an open subset of the rational vector space of `B,N`-linear homomorphisms, so it has a rational point (Remark 2.3.16(3), p. 36). Transport the CM polarization along that quasi-isogeny and use its Betti space. The real signature and embeddingwise Lie ranks come from the special point's membership in the prescribed Hodge class, not from invariance under isogeny. The CM point is algebraic on the PEL canonical model and has good reduction after finite extension. This target does not assume a polarization-preserving rational isogeny, nor serve as an input to constructing an initially unpolarized PEL point.

The remaining API is reduction of the CM lift, the equivariant rational isogeny after finite extension, and Betti comparison, its paired prime-to-`p` comparison when the polarization is transported from the lift. General CM reciprocity, PEL canonical models, the positive cone and crystalline comparison are imported from the suppliers below; this section constructs their particular realization and torus-cancellation instances.

([M. Kisin, K. Madapusi Pera and S. W. Shin — Honda–Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), §2.3, Proposition 2.3.11, pp. 33–34, Lemma 2.3.13, pp. 34–35, Corollary 2.3.15 and Remark 2.3.16(3), p. 36.)

([J. Tate — Classes d'isogénie des variétés abéliennes sur un corps fini (d'après T. Honda)](https://numdam.org/item/SB_1968-1969__11__95_0.pdf), §3, Theorem 2, p. 102; §§3–4, Lemmas 3–6, pp. 101–105; [R. E. Kottwitz — Points on some Shimura varieties over finite fields](https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf), §13, Lemmas 13.1–13.2, pp. 415–418; §15, Lemma 15.2, pp. 425–428.)

**Checks.**

- For ordinary CM elliptic reduction at a split prime, CM multiplicities (1,0) give slopes (1,0); the conjugate type interchanges them. A type chosen independently of the `p`-adic multiplicities need not lift the specified rational action.
- A supersingular elliptic curve can be isogenous to a CM reduction while its full quaternion endomorphism algebra has no faithful action on characteristic-zero elliptic homology. Only the selected commutative CM algebra is required to lift.
- At a `c`-fixed `p`-place the half slope contributes `−μ₀` at `p` and `μ₀` at infinity in the global character group; their product is one, although neither local contribution is asserted trivial.
- Changing a paired comparison by a global `t` with nonzero real localization changes `α_∞` by `−loc_∞(t)`. Omitting this term destroys reciprocity; requiring it to vanish would incorrectly restrict the cancellation theorem to one real signature.
- Changing a positive CM polarization by a totally positive element of `N⁺` has zero real torsor class, whereas a coefficient negative at one real embedding changes the positive complex structure and is not a positive polarization on the same CM object.
- For an existing PEL point and a maximal torus of its polarized isogeny group, PEL realization retains the prescribed real signature even if the constructed isogeny changes the integral `p`-divisible lattice. The signature is read on the new special point, and no equality of the two integral Lie modules is inferred.
- Triviality at infinity alone does not imply triviality at all finite places.
- For `N=Q(ζ₈)⊃F=Q(i)` and `p=3`, the embeddings `ζ₈↦ζ₈^k` fall into the two 3-adic classes `{1,3}` and `{5,7}`, and `i↦i^k`. A CM type of `F`-signature (1,1), namely `{1,3}` or `{5,7}`, has Shimura–Taniyama slopes 1 and 0 (Tate, Lemma 5, pp. 103–104), so it reduces to an ordinary surface; the types `{1,5}` and `{3,7}` have signature (2,0) or (0,2) and slopes ½,½. Hence the supersingular A of signature (1,1) in the worked obstruction below has no characteristic-zero lift carrying this `N`-action, in agreement with the norm calculation there.

A worked obstruction distinguishes the structured target's hypotheses. Take `p=3, F=Q(i), K=Q(√2), N=FK` and the supersingular elliptic curve `E:y²=x³−x` over `F̄₃`. Its order-four automorphism acts by `i`, and its 3-Frobenius `π` satisfies `πi=−iπ`. The `F`-linear isogeny `f=diag(1,π)` takes `A=E²` with action `(i,−i)`, of Lie signature (1,1), to `A′=E²` with scalar `i`-action, of signature (2,0). Embed `√2` in `Mat₂(F)` by the matrix with rows (0,2),(1,0). The positive Hermitian matrix `diag(1,2)` makes this embedding self-adjoint. Transport its `N`-action and polarization from `A′` to `A`; `N` is maximal commutative in `End⁰_F(A)`. For the original product principal polarization on `A, Σ=A[p∞]` satisfies the unramified `O_F` determinant condition of signature (1,1); take the PEL space with Hermitian matrix `diag(1,−1)`, which is self-dual and quasi-split at 3. The identity gives the required unpolarized integral `O_F`-identification with `Σ`.

Nevertheless no `N`-paired rational comparison has that real signature and all the prescribed prime-to`−3` pairings for any positive `N`-compatible polarization on A. Indeed the CM lift of `A′` gives the reference `N`-line pairing with `F`-Hermitian matrix `diag(1,2)`. Every other `c`-compatible pairing on an `N`-line differs by `a∈K×` and changes its determinant by `N_{K/Q}(a)`. Every positive `N`-compatible polarization on `A` differs from the reference polarization by a totally positive `u∈K×`, since the centralizer of `N` in `End⁰(A)` is N. A comparison of real signature (1,1) would therefore have `N_{K/Q}(a/u)<0`. Matching at `ℓ≠3` makes this determinant ratio a local norm from `F_ℓ`. At 3, `K₃≅F₃`, so it is automatically a norm from `F₃` as well. It is thus a norm at every finite place and a nonnorm at infinity, contradicting the quadratic norm reciprocity law of ClassFieldTheory Layer 10. Similitudes do not remove this obstruction: in `F`-dimension two a scalar changes the determinant by a square, itself a norm. Here `N` is not Rosati-stable for the PEL-compatible product polarization. An unpolarized integral identification with `Σ` and an arbitrary maximal `N` cannot replace the structured target's hypotheses.

*Needs:* §8.3; `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A5 (Complex uniformization and families), §A4 (Realizations and deformations), and §A6 (Arithmetic Hom and exports); `TauCetiRoadmap.PELModuli` §M2 (Representability and smooth good models) and §M4 (Canonical models, twists and integral level changes); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.4.25 (Breuil–Kisin/Dieudonné comparison, with its rational crystalline realization); §8.6; §8.10; §7.6; §7.4; §1.11; `TauCetiRoadmap.ClassFieldTheory` Layer 10 (global carriers, the Brauer sequence, and the sum of local invariants); `TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras` Layer 6 (the Brauer group and splitting fields); §8.13.

### 8.15 Adelic polarized fixed-point parameters equal effective triples

The map `FPAV_b→KT_b` sending `(z,[a])` to the stable rational class `γ₀` matching a and the ordinary adelic classes `(γ,δ)` induced by its Tate/Dieudonné comparisons is a bijection onto effective triples. Its domain uses near-equivalence classes of `z` and adelic `H_z(A)`-conjugacy of `a`. Rational `H_z(Q)`-conjugacy classes within this adelic class, and the `ker¹(Q,H_z)` polarized twists, are counted subsequently in the orbit mass. A triple without vanishing `α` has no polarized fixed-point realization.

*Hypotheses.* All additional structures and the definition of FPAV above; acceptable semisimple `a`.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §12, Lemma 12.1 and Corollary 12.2, pp.37–39; Lemma 12.3, pp.39–41.)

For effectivity choose an elliptic maximal torus `T` in `Z_{H_z}(a)`, elliptic also at the finite places where `I₀` is not quasi-split. The local and global embedding-with-involution argument transfers `T` to `I₀`; its commutant `N` acts on `A` and `V` and carries a to `γ₀` (Kottwitz §14, pp. 419–422, especially Lemma 14.1 and proof, pp. 420–422, applied to this torus in the proof of Lemma 15.2, pp. 425–426; Shin Lemma 12.1, pp. 37–38). The invariant for `(N,V;A,λ′)`, with a compatible positive polarization `λ′`, maps to the triple invariant by functoriality of local `H¹, κ` and the real cocharacter. Apply §8.14's torus cancellation with comparison `W=V`. Its proof may pass through a CM Betti space of a different real signature, because its real correction is included. This proves effectivity without a Lie-preserving CM lift. The same argument for an initially unpolarized type realization, and then for its centralizer, gives the vanishing auxiliary `α` and `β` of Shin Corollary 12.2, p. 39. It does not first assume that this realization belongs to PIC.

For surjectivity construct the `B`-linear type of an effective triple, globalize its endomorphism embedding by §8.3, and choose a positive polarization by §8.14. Compare its local structures with the prescribed triple. Their invariant sums agree by the preceding `α` and `β` vanishing. The localization exact sequence therefore gives global `H¹` corrections with trivial real component; the positive-cone criterion realizes the corrections by polarizations. Repeat for the `γ₀`-centralizer and use the surjection on locally trivial `H¹` kernels to make the two corrections compatible (Shin Lemma 12.3, pp. 39–41). The resulting rational isometry gives `z` and a with the required finite data. The hermitian Hasse principle and local full faithfulness make any two realizations near equivalent and identify a adelically, proving injectivity. Integral PEL representatives and self-dual lattices are supplied only after this rational construction, as in §8.14. Its structured PEL realization concerns existing PEL points and is not used in this existence argument.

**Checks.**

- A rational-conjugacy domain would generally have several elements over one triple; it is not the bijection asserted here.

*Needs:* §8.6; §8.14; §8.13; §8.4.

### 8.16 Unstabilized Igusa counting with centralizer masses

For an acceptable `φ` and algebraic `ξ, tr(φ|[H_c(Ig_b,L_ξ)])=Σ_{(γ₀;γ,δ) effective} vol(I_∞(R)¹)⁻¹ |A_Q(I₀)| tr ξ(γ₀) O^{G(A_f^p)×J_b(ℚ_p)}_{(γ,δ)}(φ)`. Here `A_Q(I₀)` is the Pontryagin dual of `π₀(Z(Î₀)^Γ)`; `I_∞` is the inner form of `I₀` compact modulo the real split centre; `I_∞(R)¹` is its character-norm-one subgroup. The measures come from the Tamagawa measure on `I₀(A)¹`, descend to the finite adeles by the real-volume quotient, and are transported compatibly to the inner centralizers of `γ` and `δ`. The sum is finite for the fixed acceptable support. The displayed coefficient aggregates near-equivalence twists and rational orbits; it is not the reciprocal of a finite automorphism group.

*Hypotheses.* Compatible Haar quotient measures, algebraic coefficient representation and fixed finite double-coset expansion.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §13, Theorem 13.1 and proof, pp.41–42.)

Apply the compact-support fixed-point trace and the PIC double-quotient description. Sum rational a-orbits to get centralizer quotient volumes; use the acceptable-centralizer identity to obtain rational reductive groups. Aggregate the `ker¹` polarized twists, apply the effective-triple bijection, and use the Tamagawa/dual-component identities from Layer 6.

**Checks.**

- Rescaling a centralizer Haar measure rescales its orbital integral inversely and its associated volume directly, leaving their product unchanged.

*Needs:* §8.5; §8.15; §8.12; §6.5; §2.1.

### 8.17 Finite obstruction Fourier expansion and transfer away from `p`

For each triple, `1_{α=1}=|K(I₀/Q)|⁻¹Σ_{κ∈K(I₀/Q)}⟨α,κ⟩`. The dual-component/Tamagawa identity `|A_Q(I₀)|/|K(I₀/Q)|=τ(G)|ker¹(Q,G)|` rewrites the counting formula as a sum over stable rational pairs `(γ₀,κ)`. With local transfer factors satisfying `∏_vΔ_v(γ_H,γ₀)=1`, invert the `κ`-characters when grouping rational classes into the three factors `O^p, O_p` and `O_∞` of Shin (5.5). For effective triples the product of local Kottwitz signs is 1. Ordinary Langlands–Shelstad transfer of `φ_v` for `v≠p,∞` gives `h_v^H`; hyperspecial unit functions transfer to unit functions at almost all unramified places with unit Haar normalization. The archimedean Lefschetz function `h_∞^H` realizes `O_∞`, is compact modulo `A_H(R)⁰` with its specified central character, and kills nonelliptic or nontransfer classes. These supplied identities stabilize the two factors away from `p`, leaving the acceptable `J_b` factor.

*Hypotheses.* Standing type `A/C` data; compatible global/local measures and transfer-factor normalization; decomposable `φ` followed by linear extension. General `ker¹(Q,G)` is retained. No twisted fundamental lemma is needed in this route.

([S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5, equations (5.2)–(5.7), Lemma 5.1, pp.15–17.)

Use finite-character orthogonality and Layer 6 Tamagawa identities. Parametrize `(γ₀,κ)` by elliptic endoscopic data and matching `γ_H` via Layer 1 norm correspondence. Apply ordinary local transfer and ordinary group fundamental lemma; use Layer 6 archimedean transfer and the product-sign identity from the realized rational centralizer.

**Checks.**

- The Fourier expansion vanishes for `α≠1`; omitting it would incorrectly count ineffective triples.

*Needs:* §8.16; §8.4; §1.16; §1.13; §4.7; §4.6; §6.5; §6.10.

### 8.18 The Igusa `p`-invariant equals the inner-transfer cocycle pairing

Normalize `Δ_{M_H}^{M_b}(γ_H,γ₀)=|D_G^{M_b}(γ₀)|_p^{−1/2}|D_H^{M_H}(γ_H)|_p^{1/2}Δ_H^G(γ_H,γ₀)`. For each effective Levi datum there is a nonzero constant `c_{M_H}`, independent of the matching acceptable semisimple elements, such that `c_{M_H}Δ_{M_H}^{J_b}(γ_H,δ)=⟨α̃_p(γ₀,δ),κ̃⟩⁻¹Δ_{M_H}^{M_b}(γ_H,γ₀)`. The lifts `α̃_p,κ̃` are the extended dual-centre characters used in prestabilization. The identity includes singular semisimple matches by descent. For `H=G*, M_H=M_b` and the trivial datum, `c_{M_b}=e(J_b)`. Split `J_b` does not force all `c_{M_H}=1` for nontrivial data.

*Hypotheses.* Compatible `L`-embeddings, inner twists, Haar measures and local transfer-factor conventions fixed throughout.

([S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.3, equations (6.8)–(6.9), Lemma 6.3 and Remark 6.4, p.21; §6.4, pp.23–26; §8.1, pp.27–28.)

For regular matches express the ratio of inner transfer factors by Tate–Nakayama duality for `(T₀^der×T₀′^der)`/anti-diagonal `Z(G^der)`. Lift `b` and the conjugator to the derived group and compute its cocycle; functoriality of `κ` identifies the cocycle pairing with `α̃_p` and the same `κ̃`, leaving a constant independent of elements. For a singular centralizer, lift its basic `b_δ` through an elliptic torus and perturb by a sufficiently close regular `t`. Compare `κ` under the torus map and use transfer-factor descent; retain the inverse in the pairing.

**Checks.**

- For basic `GL₂` with `J_b` the quaternion multiplicative group, the trivial datum has `c=e(J_b)=−1`; setting every constant to `+1` changes the trace.

*Needs:* §8.8; §8.13; §8.17; §1.2; §2.7.

### 8.19 The Igusa endoscopic function at `p`

For acceptable `φ_p∈C_c^∞(J_b(ℚ_p))` and each effective Levi datum set `φ_p⁰=φ_p·δ̄_{P(ν_b)}^{1/2}`, where the modulus is transported to `J_b` through its inner identification. Choose its ordinary endoscopic transfer `φ_{M_H}` to `M_H` supported on the intersection of the open `iν_{M_H}`-acceptable cones, using Shin’s cutoff argument; its regular orbital integrals retain matching. For each `i∈I(M_H,H)`, apply the normalized half-modulus acceptable-Levi lift of §8.9 directly to `φ_{M_H}`, obtaining `φ̃_{M_H,i}`. Thus `SO_H(φ̃_{M_H,i})=δ_{P(iν_{M_H})}^{−1/2}SO_{M_H}(φ_{M_H})`; there is no additional multiplication of its input by `δ_{P(iν_{M_H})}^{−1/2}`. Define `h_p^H=Σ_{M_H}Σ_i c_{M_H}φ̃_{M_H,i}`; use zero when the effective set is empty. Its stable orbital integral at every `(G,H)`-regular semisimple `γ_H` equals the `κ`-weighted `O_p` factor of prestabilization for matching effective data, and vanishes for ineffective/nonmatching classes. The character identity of the Levi lift fixes the normalized opposite Jacquet functor used in subsequent spectral reduction.

*Hypotheses.* Acceptable support, effective data, and transfer factors normalized by the preceding constant theorem. Choose the acceptable-cone support cutoff. Verify the disconnected-centralizer vanishing required by the Levi lift; prove this applicability at the stated general-group scope.

([S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.3, equations (6.10)–(6.11) and Lemma 6.5, pp.22–23.) The half-modulus convention is fixed by §8.9 and by [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.6, (5.33)–(5.36), p.41. In the linked *Stable trace formula* author copy, the additional input twist preceding (6.10) is incompatible with that equation and the printed full-modulus lift: it would give `δ_H^{−3/2}SO_{M_H}(φ_{M_H})` instead of the required `δ_H^{−1/2}SO_{M_H}(φ_{M_H})`. The present construction is specified by the latter orbital identity and the normalized Jacquet trace.

The interface consists of the following operations and identities.

- Multiply `φ_p` by the transported `δ_P^{1/2}` before transfer.
- Ordinary matching defines the stable orbital class of `φ_{M_H}`.
- Apply the normalized acceptable-Levi lift directly; its orbital integral supplies `δ_{P(iν)}^{−1/2}`.
- Sum `c_{M_H}` times the lifts over effective data and embedding cosets.
- On `(G,H)`-regular semisimple classes its SO equals the defined `κ`-weighted `O_p`, and is zero on nonmatching classes. The singular stable Lefschetz formula of §6.10 kills the nonregular contributions in the global sum.
- Changing the representatives with the matching data transported preserves stable orbital integrals; pointwise equality of functions is not required.
- For fixed effective data and transfer normalization, `φ_p↦h_p^H` is linear in its stable orbital class on the stated regular domain. Different lifts with the same matching orbital data give the same class.

Use ordinary local endoscopic transfer `J_b→M_H` and the square-root modulus on its source. The source half-modulus and the half-modulus orbital factor of the lift, together with the discriminant relation, give the required `O_p` term. Uniqueness of the contributing embedding coset prevents overcounting. The constant theorem supplies exactly the inverse `κ` character.

**Checks.**

- Empty `E_p^eff` gives `h_p^H=0`, including every stable orbital integral.
- For the quaternion basic `GL₂` case and `H=G*`, the source transfer has the inner-form sign and the additional constant is `−1`, as the normalization theorem requires.
- For the trivial datum of ordinary `GL₂, J_b=M_H=M_b` is the diagonal torus. The source factor `δ_P^{1/2}` and the lift's orbital factor `δ_P^{−1/2}` cancel, giving `O_G(h_p)=O_{J_b}(φ_p)`, as prestabilization requires. An additional `δ_P^{−1/2}` on the lift's input leaves an erroneous `δ_P^{−1/2}`. For `π=1` the trace is the integral of `δ_Pφ_p`, since `J_{P^op}(1)⊗δ_P^{1/2}=δ_P`.
- If a class has one relevant embedding coset, only that summand has nonzero SO; the finite sum must not multiply it by the outer group order. With several cosets, choosing only one can omit a nonzero contribution.

*Needs:* §8.8; §8.9; §8.18; §4.7.

### 8.20 Adelic endoscopic test functions and stable choice independence

For a decomposable acceptable `φ=φ^pφ_p` and `ξ`, assemble `h^H=h^{H,p}h_p^Hh_∞^H`. The finite away-`p` factors are ordinary transfers with hyperspecial units at almost all places; `h_p^H` is the preceding finite Levi sum; `h_∞^H` is the Lefschetz function of §6.10, compact modulo `A_H(R)⁰` and transforming by `χ_H` determined by `ξ` and the `L`-embedding. Extend linearly to finite sums of decomposable `φ`. The stable elliptic distribution depends only on the matching orbital data with compatible global measures, not on particular transfer functions, representatives of equivalent complete `L`-data, or reciprocal local rescalings `Δ_v→a_vΔ_v` with `∏a_v=1`. Fix the full `L`-morphism: a different extension of `η` to the Weil group can change the stable orbital data. Arbitrary unrelated rescaling of one local transfer factor is not an invariance.

*Hypotheses.* Compatible global transfer factors, split-centre quotients and Tamagawa measures; `h_∞` central character retained. The full `L`-morphism is fixed, or transported through an equivalence of complete `L`-data.

([S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5.2, pp.16–17; §7, equation (7.1), Lemma 7.1, pp.26–27.)

The interface consists of the following operations and identities.

- Use ordinary away-`p` transfer, the `p`-Levi sum and `h_∞` with the `ξ`-central character.
- Extend from decomposable functions by finite linear combinations.
- At almost all unramified places a normalized hyperspecial unit supplies the factor.
- Reciprocal local transfer-factor rescalings with product one preserve global stable orbital integrals.
- Transport an equivalence of complete `L`-data, including the `L`-morphism, all embeddings and local factors, before comparing stable distributions. Distinct nonequivalent extensions of `η` need not agree.

Almost-all unit transfers define the restricted tensor product. Multiply the three orbital identities to recover the prestabilized summand. Apply the global product constraint to the local scalars; datum isomorphisms transport both embeddings and orbital classes.

**Checks.**

- Scaling only `Δ_p` by `a≠1` without compensating elsewhere changes the normalization; it is not a permitted invariant operation.
- Multiplying one finite factor by a and another by `a⁻¹` leaves the global stable orbital product unchanged.
- For a group with noncompact real split centre, retain compact-mod-centre support and its central character; requiring ordinary compact support discards the Lefschetz function.
- Twisting a Weil-group extension of `η` by a nontrivial unramified central character changes the Satake pullback of a Hecke function detecting that character; this is not choice independence for fixed complete `L`-data.

*Needs:* §8.17; §8.19; §6.10; §6.7.

### 8.21 Stable elliptic Igusa trace formula with all mass factors

For acceptable `φ` and `ξ` as above, `tr(φ|[H_c(Ig_b,L_ξ)])=|ker¹(Q,G)|Σ_{(H,s,η)∈E_ℓ(G)}ι(G,H)ST_e^H(h^H)`, with `ι(G,H)=τ(G)/(τ(H)|Out(H,s,η)|)`. The stable elliptic distribution is the Layer 6 one, with the component-centralizer coefficient, Tamagawa measures and real split-centre quotient; on the contributing connected regular centralizers the component coefficient is 1. Functions `h^H` use the fixed global transfer normalization and the `c_{M_H} p`-constants. The formula is a distributional equality on the geometric acceptable domain, independent of matching function choices. It makes no claim that this geometric construction of `h^H` works for all compactly supported functions without the acceptable support.

*Hypotheses.* Type `A/C` PEL data, `b∈B(G,−μ)`, rational `ℓ`-adic cohomology identified with complex coefficients.

([S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §7, Theorem 7.2 and proof, p.27.)

Multiply the three local orbital identities and identify each stable elliptic summand. Count datum automorphisms to obtain `|Out|⁻¹`, and divide the prefactor `τ(G)|ker¹|` by the `τ(H)` built into `ST_e`. Use global stable choice independence and extend from decomposable acceptable functions by linearity.

**Checks.**

- For `H=G*` the outer factor is 1, but the `ker¹` prefactor and Tamagawa ratio still have to be evaluated, rather than silently dropped.

*Needs:* §8.16; §8.17; §8.19; §8.20; §6.7.

### 8.22 Unitary specialization and the endoscopic coefficients

For the unitary similitude PEL data used by Caraiani–Scholze, localize at split `p` and write the quasi-split form as `G_{2n}`. Its elliptic data are the trivial `G_{2n}` datum and `G_{n₁,n₂}` with `n₁+n₂=2n, n₁≥n₂>0`, omitting the pair when both `n_i` and `[F⁺:Q]` are odd. Use the parity-twisted `L`-embeddings of Layer 1, not an untwisted block embedding of Weil groups. The unramified Hecke factor is pullback along that `L`-embedding. Evaluate `ker¹(Q,G)=1` for these particular groups by the unitary Hasse calculation of PELModuli §M0.9 and §1.11 before dropping the general prefactor. For acceptable `φ` the result is `tr(φ|[H_c])=Σ_Hι(G,H)ST_e^H(h^H)`. Combining §6.25’s stable-to-twisted identity and base-change test functions yields `τ(G)Σ_H ε_H I_spec^{H̃θ}(f^{H̃}θ)`, with `ε_H=1/2` only for equal nonzero blocks and 1 otherwise. The determinant and central-character coefficients are those of §6.22.

*Hypotheses.* Precisely the global unitary data and sufficiently divisible neat away-`p` principal level of CS non-compact §§5.1,5.3,5.4; `p` splits in the imaginary quadratic subfield. The infinity factors on proper endoscopic groups use their nontrivial coefficient systems `Ξ` of §6.10, not an assertion that every endoscopic `Π_∞` is trivial-coefficient cohomological. For the displayed twisted `I_spec` formula impose `[F⁺:Q]>1`, as in CSnc Theorem 5.6.1; the general acceptable stable identity is not restricted by this spectral specialization. Trivial coefficient system for the displayed CS non-compact formula; general `ξ` uses the matching archimedean central character.

([A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Theorem 5.2.3, pp.734–735; [A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), §5.2, pp.67–68; §5.3, Theorem 5.3.2, p.68; §5.6, Theorem 5.6.1, pp.74–75.)

Use Layer 1 classification and parity `L`-embedding formulas. The degenerate `n₂=0` presentation is the trivial datum and is not counted twice. Apply the general formula and evaluate `ker¹` using PELModuli §M0.9 and §1.11 before cancelling that prefactor. Use Layer 6 compatible base change, small-level transfers, archimedean functions and stable/twisted comparison, then evaluate the outer automorphism index. Retain `[F⁺:Q]>1` at the `I_disc=I_spec` step; it is an explicit hypothesis of §6.21.

**Checks.**

- For equal blocks the outer swap gives the coefficient `1/2`; for unequal positive blocks it gives no extra half.

*Needs:* §8.21; §1.8; §6.25; §6.8; §6.14; §1.11.

### 8.23 Worked normalization tests for assembly

The assembled layer must pass the following simultaneous checks: ordinary two-block slopes (1,0) require negative Frobenius shifts; the rank-one basic element condition is vacuous but geometric acceptability is not; quaternion basic `GL₂` has `c=e(J_b)=−1` for the trivial datum; the acceptable `GL₂` normalized Levi lift has `δ_P^{−1/2}` orbital scaling and opposite normalized Jacquet trace; a nonzero `K`-obstruction cancels under finite Fourier summation; `n₂=0` is counted only as the trivial unitary datum; equal positive blocks give the outer-swap half; and character extension groups repeated central eigenvalues before taking a Vandermonde determinant. Zero-slope blocks require the separate central scalar `p^{−a}` before Frobenius shifting, and removing that scalar translation requires the second Vandermonde step. Type refinement must merge repeated factors and must distinguish simple from minimal.

*Hypotheses.* All functions and Haar measures use the conventions fixed in this reader.

([S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Definitions 6.1–6.2 and Lemmas 6.3–6.4, pp.19–21; §8, Definitions 8.1–8.2 and the minimality discussion, pp.24–25; [S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.4, Lemma 3.9, p.12; §6.3, Remark 6.4, p.21; [A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), §5.6, Theorem 5.6.1, p.75.)

Compute the slope valuations, the upper-triangular `GL₂` modulus and the quaternion sign. For the ordinary scalar `δ=p`, check that its zero-slope inverse stays nonintegral under every Frobenius shift, whereas `p⁻¹δ` clears the denominator. Evaluate the two characters of `Z/2`, and the equal-block swap quotient. Use the explicit determinant for central eigenvalues 2 and 3 and check what changes if they coincide. Repeat the determinant argument for scalar eigenvalues after the Frobenius grouping, and test merging two copies of the half type with multiplicities 2 and 3.

**Checks.**

- For slopes (1,0), `a_i−Nλ_i` for `a=(5,0)` is separated only for `N>5`. For `ν=(−1,0), m=(1,p), δ_P=p` and the normalized orbital lift coefficient is `p^{−1/2}`; the full `p⁻¹` coefficient pairs with the unnormalized Jacquet module. For eigenvalues 2,3 the determinant of rows `N,N+1` is `−2^{−N−1}3^{−N−1}`, nonzero.
- The ordinary support `pΓ_b` never enters `S_b` under Frobenius alone. For `F=Q`, two half types on `Q` with multiplicities 2 and 3 merge to the half type of multiplicity 5 under factorwise refinement, while `Q×Q` cannot embed as a unital `Q`-algebra into Q.

*Needs:* §8.1; §8.18; §8.9; §8.13; §8.22; §8.11.

### Examples

Let a compact support include `p` times a unit in the ordinary zero-slope block. Negative Frobenius powers leave that factor equal to `p` times a unit, so they never make its inverse integral. A preliminary scalar `p^`(-a), `a>=1`, clears this obstruction. The trace extension then applies two finite character-separation arguments, first in Frobenius and then in the scalar. For `p`-adic types, two identical field factors with multiplicities 2 and 3 refine to one factor of multiplicity 5 by factorwise embeddings. They cannot merge by a unital embedding of the product of two fields into a field, because its two orthogonal idempotents would both have to survive.

### Dependencies

§7.5; §7.9; §7.10; §7.8; §7.10a (supplied correspondence and trace interfaces for Igusa); Tau Ceti `TauCeti.brauerCohomologyEquiv` (field Brauer comparison); `TauCetiRoadmap.ClassFieldTheory` Layer 10 (global carriers, the Brauer sequence, and the sum of local invariants); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.17 (Isogeny classification of `p`-divisible groups over a perfect field); Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A4 (Realizations and deformations) and §A5 (Complex uniformization and families); `TauCetiRoadmap.PELModuli` §§M2, M4 (Good models and canonical models); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.4.25 (Rational crystalline comparison); `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A6 (Arithmetic Hom and exports); `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A6.10 (The characteristic polynomial and the trace); `TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras` Layer 6 (the Brauer group and splitting fields); §1.11; §7.4; §7.11; §7.6; `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` §A2 (Duality, polarizations and ample classes); §1.4; §1.16; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §§SR.2.2–SR.2.3 (Jacquet functors, induction and canonical lifting); §2.1; §2.16; Mathlib `Matrix.vandermonde`; Mathlib `Matrix.det_vandermonde`; §1.15; §1.14; §6.5; §1.13; §4.7; §4.6; §6.10; §1.2; §2.7; §6.7; §1.8; §6.25; §6.8; §6.14.

## Layer 9: raw compact-unitary cohomology

Construct finite-level compact-unitary coefficient cohomology and its genuine geometric actions. Graded automorphic multiplicity spaces and alternating classes are both retained. Construct this geometric prefix before §§6.23 and 6.27; Layer 10 then proves its own point-count comparison on the same raw object.

### 9.1 Raw compact-unitary PEL cohomology

For a Harris–Taylor compact unitary PEL datum with the required split place `E` and local division invariant, construct the neat finite-level canonical models and their integral PEL models at `p`, the universal `p`-divisible group, and `RΓ_c` of the geometric generic fibre with its algebraic coefficient local system. Retain prime-to-`p` Hecke correspondences, local `p`-level correspondences and `W_E` descent. This raw object and its nearby cycles precede any associated global Galois representation or local–global compatibility theorem. At a neat finite level retain the graded finite-dimensional coefficient cohomology and the derived complex, with commuting Hecke and Weil actions. For an isolated finite-length automorphic summand, form its multiplicity Hom space or the action of a specified central idempotent; the Weil action preserves that space because it commutes with the correspondence action. No idempotent isolating an arbitrary global representation is assumed to exist.

*Hypotheses.* The division algebra, involution, signatures, neatness and local level are required to satisfy the Harris–Taylor moduli hypotheses. Compactness is a theorem of this datum, not a consequence of neatness.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §4.1, Theorem 4.1.2 and its proof, pp. 28–29; [Sug Woo Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.1, pp. 30–31 (author copy).)

The interface consists of the following operations and identities.

- Construct the raw compact unitary PEL model at a neat level.
- Associate the specified algebraic coefficient representation.
- Level correspondences act on raw cohomology with pullback and proper trace.
- The geometric generic-fibre complex compares with the integral-model nearby-cycle complex.
- The Weil descent action commutes with each prime-to-`p` and local-level correspondence on the derived complex and on every cohomological degree.
- For an isolated coefficient-field automorphic type `π`, form `Hom_Hecke(π,H^i)`, carrying the induced Weil action. A central idempotent `e`, when supplied, yields `eH^i` with the same action.
- For a chosen Hecke idempotent `e` and `w` in `W_E, w(e v)=e(w v)`; coefficient extension and finite-level transition preserve this identity.

Start with the canonical generic-fibre PEL moduli problem and universal family of PELModuli, for the compact division-unitary datum. Division of the auxiliary algebra excludes rational isotropic flags, so the valuative criterion has no semiabelian boundary and the generic fibre is proper. At a `p`-level use the closure of the generic Drinfeld-level condition inside the finite level-structure moduli over the no-level integral model; finite forgetful maps preserve properness. This constructs the raw integral models without a smoothness assertion at ramified p. Construct the algebraic local system from the universal abelian scheme and its idempotents. The strict completed-local comparisons needed later are the additional target §10.13, not a good-prime PEL input. Define the descent action before taking Hecke summands. Apply functoriality of pullback and proper trace to prove its commutation with each correspondence. Use that commutation to induce the Weil action on Hom spaces and on the images of chosen idempotents; finite-dimensionality at finite level follows from proper étale cohomology.

**Checks.**

- On the compact datum, the proper-support comparison is the canonical map `RΓ_c→RΓ`.
- Trace after pullback for a finite neat covering multiplies by its degree.
- A noncompact unitary datum requires boundary terms and cannot be substituted into the compact calculation.
- For `V=V₁⊕V₂` and `e` projecting to `V₁`, a commuting Weil action restricts to `V₁`; an action exchanging the two summands does not satisfy the commutation hypothesis.
- The same representation in adjacent cohomological degrees cancels in the Euler class; each graded multiplicity remains visible in the raw object.
- After finite coefficient extension, the chosen projector and Weil action extend together, and the multiplicity comparison requires its usual finite-presentation hypothesis.
- The construction cannot invoke the Galois representation later extracted from it.

*Needs:* `TauCetiRoadmap.PELModuli` §M2.8 (Representability and smoothness); `TauCetiRoadmap.PELModuli` §M2.6 (Formal smoothness at good primes); `TauCetiRoadmap.PELModuli` §M4.3 (PEL generic fibres are canonical models); `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles); `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles` LPV.6: Perverse nearby cycles; `TauCetiRoadmap.ArithmeticLocallySymmetricSpaces` §§ALS.F.5–ALS.F.7 (relative cochains and algebraic coefficients); `TauCetiRoadmap.AdicCoefficientsAndComparisons` Layer L0: Adic coefficients.

### Examples

At a neat finite level, two correspondences whose actions are `(g,1)` and `(1,τ)` commute because the Hecke correspondence is defined over the field carrying the Weil descent. Passing to a projector `e` for a finite compact-level Hecke summand yields `eH^i` with an actual Weil action in each degree. The alternating multiplicity sum can have negative dimension; extracting a genuine representation requires a separate parity or concentration assertion. A zero projector gives the zero complex and zero traces, rather than an auxiliary nonzero scalar.

### Dependencies

`TauCetiRoadmap.PELModuli` §M2.8 (Representability and smoothness); `TauCetiRoadmap.PELModuli` §M2.6 (Formal smoothness at good primes); `TauCetiRoadmap.PELModuli` §M4.3 (PEL generic fibres are canonical models); `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles); `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles` LPV.6: Perverse nearby cycles; `TauCetiRoadmap.ArithmeticLocallySymmetricSpaces` §§ALS.F.5–ALS.F.7 (relative cochains and algebraic coefficients); `TauCetiRoadmap.AdicCoefficientsAndComparisons` Layer L0: Adic coefficients.

## Layer 10: trace parameters and classical comparison

The local construction starts with strict `O`-deformations, controlled nearby cycles, norms and descent. An independent compact-unitary trace argument gives positive rational Weil classes; the compact-type newvector argument supplies integrality. Cuspidal bijectivity and pair factors precede the segment-to-monodromy adapter, full Weil–Deligne correspondence and inner-form quotient.

### 10.1 The classical normalization dictionary

Fix `F/ℚ_p` finite, residue cardinality `q`, a uniformizer `ϖ`, geometric `Φ` in `W_F`, and `ω(w)=q^{deg(w)}`, with arithmetic degree `+1` and `deg(Φ)=−1`. Use `Art_geo:F×→W_F^ab` sending `ϖ` to `Φ`; it equals arithmetic reciprocity composed with inversion on the abelianization. Fix the positive complex square root of `q`, and put `σ(π)=rec_un(π)⊗ω^{(1−n)/2}`. Normalized parabolic induction uses `δ_P^{1/2}`. For a WD object `D=(V,r,N), L(s,D)=det(1−q^{−s}r(Φ)|(ker N)^I)⁻¹`; `ε(s,D,ψ)` is the imported Deligne local constant with its monodromy determinant, with `ψ`-self-dual additive Haar measure. All analytic and Galois `ε`-functions use the same AL.1 Tate `s`-variable, not an unspecified scalar normalization.

*Hypotheses.* `n≥1`; complex coefficients; nontrivial continuous additive `ψ`; multiplicative maximal compact volume 1.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.2`(a)`–`(b)`, p.3; Notation p.6; [Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §1.1–1.2, pp.588–589; §2.3–2.4, p.594.)

The interface consists of the following operations and identities.

- The scalar character `ω^t` evaluates at geometric `Φ` as `q^{−t}`.
- `σ=rec_un⊗ω^{(1−n)/2}`, with inverse twist `ω^{(n−1)/2}`.
- The imported Arithmetic `L` polynomial is the reciprocal of the analytic `L`-function after `X=q^{−s}`; both epsilon normalizations agree at rank one.
- `Art_geo(x)=Art_arith(x)⁻¹` in `W_F^ab`; this does not define inversion as a map on nonabelian `W_F`.

Use the local Weil group and both reciprocity normalizations from ClassFieldTheory, and the existing WD factor definitions from ArithmeticGaloisRepresentations. Compute the half-twist once: `rec_un=σ⊗ω^{(n−1)/2}`; compare every induction, dual and similitude factor with this equation. At rank one identify Deligne’s constant with AL.1’s Tate epsilon, including the Haar measure and `s`-variable.

**Checks.**

- An unramified `χ` with `χ(ϖ)=α` has `L(s,σχ)=(1−αq^{−s})⁻¹`.
- `rec_un` for the trivial `GL₂` representation is `1⊕ω`, whereas `σ` is `ω^{−1/2}⊕ω^{1/2}`.
- An `n_i`-dimensional induction block `rec_un,i` enters `rec_un,n` with twist `ω^{(n−n_i)/2}`; a uniform dimension-free twist fails this identity.
- For a rank-one `χ, σ(χ)=χ∘Art_geo⁻¹`; a uniformizer acts through `χ(ϖ)`.

*Needs:* `TauCetiRoadmap.ArithmeticGaloisRepresentations` §2.5 (Local factors); `TauCetiRoadmap.ArithmeticGaloisRepresentations` §2.7 (Local constants); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.1 — Tate zeta distributions and Hecke `L`-functions; `TauCetiRoadmap.ClassFieldTheory` Layer 7 (the absolute local Artin map, its normalizations, and conductors); `TauCetiRoadmap.ClassFieldTheory` Layer 9 (the local Weil group).

### 10.2 Strict `O`-module deformations with Drinfeld levels

For `r≥1` and `β∈GL_n(O_r)diag(ϖ,1,…,1)GL_n(O_r)`, let `H_β` be the height-`n`, dimension-one strict `ϖ`-divisible `O`-module over `κ_r` with relative contravariant Dieudonné `F=βσ`. Construct its marked deformation ring `R_β` and Drinfeld level-`m` cover `R_β,m`: the `n` sections `X_i` of `H[ϖ^m]` satisfy the full relative Cartier-divisor identity `∑_{a∈(O/ϖ^m)^n}[∑a_iX_i]=[H[ϖ^m]]`. Then `R_β≃O_r[[T₁,…,T_{n−1}]]` noncanonically; the finite level cover is regular and generically étale with `GL_n(O/ϖ^m)`-action. The formal level space may have several components. It has an equivariant finite-type algebraization along a finite special-fibre subscheme, as in Scholze Theorem 2.4.

*Hypotheses.* The `O`-action on `Lie H` agrees with the structural `O`-action; `κ_r` has the specified `κ`-embedding; marked deformations preserve that strict action.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definitions 2.1–2.2, Proposition 2.3 and Theorem 2.4, pp.7–8.)

The interface consists of the following operations and identities.

- A chosen integral `σ`-conjugator, hence a chosen isomorphism of `H_β`, transports marked deformation problems; identity and composition of isomorphisms give the corresponding transport laws. Changing the conjugator by an automorphism changes the transport by that automorphism.
- Changing the ordered sections gives the `GL_n(O/ϖ^m)`-action and commutes with reduction of level.
- Level `m+1→m` is induced by multiplying sections by `ϖ` and composes with forgetting all levels.
- The generic-level fibre is the torsor of bases of the étale `O/ϖ^m`-module, agreeing with the étale Tate-module bases.

Use the strict relative `O`-linear classification in §7.6. Relative `F=βσ` and the étale norm parameter `F=β⁻¹σ₀` use different `β` conventions and opposite endomorphism algebras; both are contravariant. Prove representability of the strict formal `O`-module deformation functor and its Cartier-divisor level covers by the Drinfeld construction of Scholze Proposition 2.3: lift the `O`-action and level coordinates, impose the torsion divisor equations, and use the connected–étale splitting to reduce regularity and dimension to the connected case. Use strict truncated-`O`-module algebraization, Artin approximation and normalization as in Theorem 2.4; the resulting equivariant algebraization is part of this target for arbitrary ramification of `F/ℚ_p`.

**Checks.**

- At `n=1, R_β` has no deformation variables; the connected level-`m` generic fibre has `(O/ϖ^m)×` acting on generators.
- For `n=1,m≥1` the all-zero sections fail the level condition on the geometric generic fibre, where `H[ϖ^m]` has `q^m` distinct points. On the geometric special fibre of a connected height-one formal `O`-module they satisfy it: both Cartier divisors are `q^m[0]`.
- At connected height `k<n`, geometric level components are indexed by surjections `(O/ϖ^m)^n→H_et[ϖ^m]`; they cannot be collapsed to one local component.
- The relative deformation dimension is `n−1`; the `GL_n(O/ϖ^m)`-torsor assertion concerns the generic fibre.

*Needs:* §7.6; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.10 (Dieudonné classification of `p`-divisible groups); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.1 (Finite flat group schemes and `p`-divisible groups); `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles).

### 10.3 The classical Jacquet–Langlands input for trace parameters

Use §4.7a's essentially square-integrable correspondence, character sign and central-character twists for the division-algebra traces in this layer. The division case `r=1` is the correspondence used by the tower comparison; it is independent of the trace-defined GL parameter.

([Alexandru Ioan Badulescu — Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), §3.1, p. 13.)

**Checks.**

- The trivial quaternionic representation has `GL₂` transfer `St₂` and sign `−1`.
- At `d=1` this input is the identity correspondence.
- A central-character twist is retained in both the division trace and its GL transfer.

*Needs:* §4.7a.

### 10.4 The nearby-cycle test function

Let `τ∈Φ^r I_F` with `r≥1, h∈C_c^∞(GL_n(O),Q)`, and `ℓ≠`p. Form `[RΨ_β]=∑_i(−1)^i lim_m H⁰(R^iψ_{Spf R_β,m} ℚ̄_ℓ)`, with commuting `W_{F_r}` and compact-group actions. Set `h∨(g)=h((g⁻¹)^t)` and `φ_{τ,h}(β)=tr(τ×h∨|[RΨ_β])` on the preceding `β`-coset, zero elsewhere. Interpret the convolution trace at a finite level fixing `h`. Define `f_{τ,h}` as any cyclic-transfer representative with matching twisted orbital integrals, an element of the orbital-integral quotient rather than a distinguished test function.

*Hypotheses.* Choose `ℚ̄_ℓ≃C` only after rationality; compact-group Haar volume is 1; `τ` has positive geometric Frobenius exponent.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.1 and definition before it, p.3; Theorems 2.5–2.6, p.8.)

The interface consists of the following operations and identities.

- On the `β`-coset its value is the finite-level alternating trace; off the coset it is zero.
- Increasing `m` once `h` is biinvariant preserves the value by finite-cover invariants.
- The assignment `h↦φ_{τ,h}` is `Q`-linear.
- Matching twisted orbital integrals determine `f_{τ,h}` modulo the common orbital-integral kernel and hence determine its admissible traces.

Use the formal-to-adic nearby-cycle comparison and finite-level cohomology, then pass through level invariants. Take alternating traces with the inverse-transpose `h` convention; transfer using §4.9's cyclic fundamental lemma and transfer. Independence of the transfer representative on representation traces uses the specified `p`-adic character and density theory.

The cohomological input is a target at these particular strict-`O` algebraizations. At each finite level the formal/adic nearby-cycle comparison gives finite-dimensional cohomology, vanishing outside 0,`…,n−1`; formally smooth disc extensions preserve it. The finite-type algebraization of §10.2 transfers the finite-level automorphism and Weil actions to this comparison. Congruence-near-identity automorphisms act trivially at sufficiently small congruence level, giving local constancy; alternating traces of `τ` with a finite-order level operator are rational and independent of `ℓ`. Prove these assertions by algebraization, Berkovich's comparison, and the controlled-cohomology trace argument of Scholze, *Deformation spaces*, Theorem 2.8, pp. 9–10, Proposition 3.15, pp. 17–18, and Propositions 4.2–4.3, pp. 19–21. Form `ℓ`-adic coefficients at a fixed level before the smooth level colimit. Extend the API by algebraization of strict O-module nearby cycles, formal disc invariant and independence of the trace from ℓ. Check a disc factor changes neither the stalk cohomology nor its trace; changing `ℓ` leaves a given finite-order trace unchanged; a nontrivial level operator is retained until it belongs to the cohomologically trivial congruence subgroup.

**Checks.**

- `h=0` gives `φ=0` and a transfer class with zero traces.
- For `n=1`, a unit `β` has valuation 0 and `φ_{τ,h}(β)=0`, since support has valuation 1 in `F_r`.
- For a compact-group character `χ, tr(h∨|χ)=tr(h|χ∨)`; an unramified geometric generator does not remove this compact dual.
- Do not replace the alternating trace by a single-degree trace.

*Needs:* §10.2; §4.9; `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length).

### 10.5 Dieudonné norms in the étale and basic cases

For a finite semisimple `ℚ_p`-algebra A with maximal order `O_A`, integral `σ₀`-conjugacy classes of `β∈(O_A⊗Z_{p^r})×` parametrize étale `O_A^op`-linear `p`-divisible groups `H` over `F_{p^r}` for which `H[p]` is free of rank one over `O_A^op`/p. The contravariant Dieudonné module is `O_A⊗Z_{p^r}`, with `F=β⁻¹σ₀`. The geometric descent operator `γ=α∘Frob_H^{−r}` determines an `O_A×`-conjugacy class `Nβ`. The characteristic polynomials of `Nβ` and `ββ^{σ₀}⋯β^{σ₀^{r−1}}` agree; this does not specify an element-valued norm in a noncommutative algebra. For the relative basic case let `D/F` have invariant `1/n`, normalize `v_D(ϖ)=n`, and let `B_r` be the basic `β` in the deformation coset. Marking the unique geometric height-`n` formal `O`-module gives descent in `D_{−r}`; invert it to obtain the `O_D×`-conjugacy class `Nβ` in `D_r={d:v_D(d)=r}`.

*Hypotheses.* `r≥1`; `σ₀` is arithmetic Witt Frobenius; `σ` is relative arithmetic Frobenius in the `O`-module case.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Proposition 4.2 pp.11–12; Proposition 4.6 pp.12–13.)

The interface consists of the following operations and identities.

- Send an integral `σ₀`-class to its geometric Frobenius descent class up to `O_A×`-conjugacy; in the basic case send an integral `σ`-class to its inverted descent class up to `O_D×`-conjugacy.
- Changing a marking conjugates `Nβ` and leaves invariant test-function values unchanged.
- For `β∈B_r` the inverted descent norm has `v_D(Nβ)=r`.
- The norm class and the ordered product `ββ^{σ₀}⋯β^{σ₀^{r−1}}` have equal characteristic polynomials. For commutative A the construction agrees with the ordinary extension norm.

Track contravariance, the opposite endomorphism algebra and the inverse `β` parameter when passing from relative `F=βσ` to the étale `F=β⁻¹σ₀` description; no covariant Dieudonné functor is used. Use integral Dieudonné classification for the étale case; conjugate marked lattices produce the same norm class. In the basic case classify geometric formal modules, identify endomorphism height with `v_D`, and invert the negative-height descent operator.

The strict relative integral classification and Morita convention are those of §7.6; apply them before forming the descent norm.

**Checks.**

- For `A=ℚ_p` and `β∈Z_{p^r}×, Nβ` is the usual norm `Z_{p^r}×→ℤ_p×`.
- For `n=1` and `β=ϖu` in `F_r, v_F(Nβ)=r`, rather than `−r`.
- For `n=2, v_D(ϖ)=2` and a height-one basic `β` with `r=1` has norm valuation 1; using the central-field valuation as `v_D` fails.
- The arithmetic Witt Frobenius is distinct from the geometric Weil element in the trace.

*Needs:* §7.6; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.17 (Isogeny classification of `p`-divisible groups over a perfect field); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.10 (Dieudonné classification of `p`-divisible groups).

### 10.6 The additive Langlands–Jacquet quotient

For `n=rd` let `R(GL_n(F))` and `R(GL_r(D))` be finite-length Grothendieck groups. Classical JL extends to an injective additive map `JL_add` from the inner group to the split group by mapping each Langlands standard-module basis element to the normalized induction of its transferred essentially square-integrable blocks. Let `S_{n,D}` be the span of standard modules whose block ranks are not all divisible by `d`; these have no matching inner Levi. Then `R(GL_n)=im(JL_add)⊕S_{n,D}`, and the canonical surjection `LJ_D` is the inverse on the first summand and zero on the second. It satisfies `Θ_π(g)=(−1)^{n−r}Θ_{LJ_D([π])}(g′)` on matching regular semisimple classes. This `LJ_D` already has the classical positive normalization on essentially square-integrables; multiplying it by a second sign is wrong. Its value on an irreducible can be zero or a signed virtual combination.

*Hypotheses.* Standard-module bases require both split and inner-form Langlands classifications; a Grothendieck class is not an irreducible representation.

([Alexandru Ioan Badulescu — Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), Proposition 3.1 p.14; Theorem 3.2 pp.14–16; Proposition 3.3 p.17.)

The interface consists of the following operations and identities.

- Extend classical JL on the standard-module `Z`-basis to `JL_add`.
- Project onto `im(JL_add)`, then invert, giving `LJ_D`.
- `LJ_D∘JL_add` is the identity on the inner Grothendieck group.
- `ker LJ_D=S_{n,D}`, the span of the nonmatching standard modules.
- On matching regular semisimple classes the character has sign `(−1)^{n−r}`, including virtual outputs.

Use the standard-module basis theorem and classical JL on its essentially square-integrable blocks to define `JL_add`. Character compatibility of normalized induction gives its identity on matching classes and proves injectivity. Split the standard basis by divisibility of every block rank. Project along `S_{n,D}` and invert the transferred standard basis; character independence on inner forms proves the characterization.

For these groups, take the finite-length exact subcategory of the smooth admissible category and its exact Grothendieck group. Use the existing `TauCeti.ExactK0`, `TauCeti.ExactK0.of_conflation`, `TauCeti.ExactK0.map` and `TauCeti.ExactK0.lift`: they give `[V]=[V′]+[V″]` for every short exact sequence and the induced homomorphism for every additive trace invariant. The finite-length subcategory is extension-closed and essentially small (use finite filtrations with admissible irreducible factors and the sets of their extension classes), so the hypotheses of this exact-category construction hold. Normalized parabolic induction and Jacquet restriction are exact and preserve finite length, hence induce the product and restriction maps on these `K₀` groups. A compactly supported locally constant test function has a finite-rank operator on an admissible representation; its trace is additive along the same short exact sequences. This realizes the exact-sequence relation for finite-length classes, parabolic induction on the Grothendieck group, the Jacquet map on the Grothendieck group and the admissible trace on the Grothendieck group. Check a split exact sequence gives the sum of traces; the nonsplit `GL₂` principal-series extension gives `[St₂]+[1]`; exact functors send the zero class to zero. No generic class for an infinite-length representation is used. The finite-length and exactness inputs are SmoothRepresentationsOfLocalGroups §§SR.3.1 and SR.2.2–SR.2.3; the application to the standard basis is Badulescu §3.1, pp. 13–16.

**Checks.**

- For `d=1` the two groups coincide, `S=0` and `LJ_D` is the identity.
- For quaternion `D, LJ_D([St₂])=[1_{D×}]` without an extra negative sign.
- For quaternion `D, [Ind_B^{GL₂}(ω^{1/2}⊠ω^{−1/2})]=[St₂]+[1]` lies in `S`, so `LJ_D([1])=−[1_{D×}]` and the two constituent images cancel.
- No assertion that `JL_add` sends every irreducible to an irreducible, or that `LJ_D([π])` is an actual positive representation.

*Needs:* §4.7a; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` SR.0: the smooth category and its basic API; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length); Tau Ceti `TauCeti.ExactK0`, `TauCeti.ExactK0.of_conflation`, `TauCeti.ExactK0.map`, `TauCeti.ExactK0.lift`.

### 10.7 Rationality and local constancy of the test function

For every preceding `τ,h, φ_{τ,h}` is compactly supported, locally constant, `Q`-valued and independent of `ℓ` and the embedding `ℚ̄_ℓ≃C`. For a fixed normal level `K` under which `h` is biinvariant, its trace is the finite sum `vol(K)∑_{g∈GL_n(O)/K}h(g)tr(τ×g∨|RΨ_β^K)`. Thus denominators are permitted for rational `h` and normalized convolution; integrality of a virtual Weil multiplicity is a separate result, not integrality of every rational-valued test function.

*Hypotheses.* Strict deformation algebraization from the preceding node; finite nearby-cycle cohomology in degrees 0,`…,n−1`.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorems 2.5–2.6, p.8; [Peter Scholze — The Langlands–Kottwitz method and deformation spaces of p-divisible groups](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf), Theorem 2.8 pp.9–10; Proposition 3.15 pp.17–18; Propositions 4.2–4.3 pp.19–21.)

Use Berkovich comparison at the finite algebraization to establish finiteness and bounded degrees. Apply the congruence-near-identity cohomology invariance theorem to prove local constancy in `β`. Twist by the finite compact-group action and apply the `ℓ`-independent alternating trace theorem; the rational trace argument is Scholze Theorem 2.6. The controlled-cohomology variant gives the same mechanism in Deformations Propositions 3.15, 4.2–4.3.

**Checks.**

- Scaling `h` by a rational denominator scales `φ` by that denominator; no unconditional integer-valued claim survives this test.

*Needs:* §10.4; `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles).

### 10.8 Norm comparison of orbital integrals and traces

For `h` invariant under maximal-order units, `φ_h(β)=h(Nβ)` has matching twisted/ordinary orbital integrals in both the étale integral-algebra case and the basic `B_r↔D_r` case. Give the ambient maximal compact subgroups volume one. For each matching class choose one Haar measure on its quasi-isogeny centralizer and transport it through the norm identification to the other centralizer; no simultaneous volume-one normalization is imposed on distinct lattice stabilizers. Then `∫φ_h=∫h`, with the integration domains respectively the unit groups or `B_r,D_r`. The basic identity is restricted to basic classes and the matched centralizer measures.

*Hypotheses.* Étale `h` compactly supported on `O_A×`, or basic `h` compactly supported on `D_r` and invariant under `O_D×` conjugacy.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Proposition 4.3 and Corollary 4.5 p.12; Proposition 4.7 and Corollary 4.8 p.13.)

Write both orbital integrals as sums over marked integral Dieudonné lattices modulo the common quasi-isogeny group `Γ`. With ambient compact volume one, the summand of a lattice class `x` is `h̃(x)/vol_Γ(Γ_x)`, where `Γ_x` is its actual compact open stabilizer. Prove that the norm equivalence on integral objects is equivariant for the quasi-isogeny-group identification and identifies their automorphism subgroups, so corresponding lattice classes have equal stabilizer volumes and equal weights. This proves matching of the weighted sums. Apply the untwisted and twisted Weyl integration formulas with these transported centralizer measures and the stated ambient normalizations to obtain the integral equality.

**Checks.**

- At `n=1` this reduces to integration along the field norm with its compact normalization.
- At `r=1`, take `A=M₂(ℚ₃)`, `γ=diag(1,4)` and `L=ℤ₃e₁+ℤ₃(e₁+e₂)/3`. In this basis `γ=[[1,−1],[0,4]]` is integral invertible étale Frobenius. Its centralizer `(ℚ₃×)²` stabilizes `L` through `{(a,b)∈(ℤ₃×)²:a≡b mod 3}`, an index-two subgroup of the maximal compact. With maximal compact volume one it has volume `1/2`, so this lattice contributes `2h̃(L)`.
- The standard lattice in that same rational object has stabilizer `(ℤ₃×)²` and contributes `h̃(ℤ₃²)` with the same measure. The element `diag(1,−1)` fixes the standard lattice and fails to preserve L.
- For `r=1` the norm is the identity and matches each actual stabilizer and its weight, including both lattices above.

*Needs:* §10.5; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length).

### 10.9 Connected–étale descent of nearby cycles

For `H_β=H_β⁰×H_β^et` of connected height `k, 1≤k≤n`, level-`m` components are indexed by surjections `v:(O/ϖ^m)^n→H_β^et[ϖ^m]`. For a fixed rank-`k` kernel `V`, its stabilizer is `P_V(O/ϖ^m)`. The corresponding formal pieces are power-series extensions by `n−k` variables of the connected height-`k` deformation space. Nearby cycles are canonically the connected nearby cycles tensored with the finite regular representation of `GL_{n−k}(O/ϖ^m)`, inducing a virtual compact-group identity `[RΨ_β]=Ind_{P_k(O)}^{GL_n(O)}([RΨ_{β⁰}]⊗C_c^∞(GL_{n−k}(O)))`. In the final `h`-trace formula the étale norm acts by right multiplication by `(Nβ^et)⁻¹`; retain the transposed action on the undualized sheaf.

*Hypotheses.* Use the contravariant `β` convention and inverse-transpose `h`; no `k=0` formal dimension-one object occurs.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Proposition 5.1`(i)`–(vi), pp.13–14.)

Separate connected and étale torsion and classify surjective level maps and their kernels. Use formal smoothness of the connected-part projection and invariance of nearby cycles under a formal disc. Induce over the compact group and dualize the compact action to obtain the specified right multiplication in the trace.

**Checks.**

- `k=n` gives the original connected nearby cycles and a trivial étale factor; `k=1<n` retains the finite regular étale factor.

*Needs:* §10.2; §10.4; §10.5; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles).

### 10.10 Induction and Jacquet compatibility of the quotient

In the graded finite-length representation ring `R(F)=⊕_{n≥0}R(GL_n(F))`, the subgroup `S(D)=⊕S_{n,D}`, including all degrees not divisible by `d`, is the Hopf ideal generated by essentially square-integrable generators of rank not divisible by `d`. Its quotient is the `GL_r(D)` graded representation ring through `LJ_D`. The product is normalized parabolic induction and the coproduct is the sum of semisimplified normalized Jacquet modules. For corresponding Levi partitions whose blocks all have ranks divisible by `d`, LJ commutes with induction and, after quotienting every tensor factor by the nonmatching ideal, with Jacquet restriction. It is not an equality of unquotiented Jacquet modules for arbitrary split partitions.

*Hypotheses.* The degree-zero unit is retained; virtual classes, normalized induction and normalized Jacquet restriction are used throughout.

([Alexandru Ioan Badulescu — Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), Theorem 3.6 and Lemma 3.7 with proof, pp.19–23.)

Use the polynomial-ring presentation by essentially square-integrable standard generators; divisibility describes the ideal and quotient product. Compare Jacquet modules of a transferred essentially square-integrable generator, using Badulescu Lemma 3.7. For the underlying Jacquet comparison, evaluate the transferred character on sufficiently contracting regular elements of each matching Levi. Casselman’s character identity of §8.9 identifies this value with the Jacquet-module character; the classical JL character relation identifies the two ambient-group values. Matching discriminants and the normalized modulus factors give the signed Levi character relation, and character independence determines the virtual Jacquet module. Nonmatching Levis have no such inner block and give zero in the quotient. Extend on the standard basis through the geometric lemma; discard tensor summands with a nondivisible degree before comparing coproducts.

**Checks.**

- For `n=2,d=2` the split (1,1) Jacquet tensor term vanishes in the quotient, since both factor degrees are nondivisible.

*Needs:* §10.6; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.3 (Coefficient change, Ext and local blocks).

### 10.11 Harmonic descent and normalized induction

Assume the character-parameter construction in all ranks below `n`. For `π=i_P^{GL_n}(π₁⊠⋯⊠π_t), t≥2`, with irreducible blocks of ranks `n_i`, the transferred test trace is `tr(f_{τ,h}|π)=tr(τ|⊕_i rec_un(π_i)⊗ω^{(n−n_i)/2})tr(h|π)`. The trace on an induced finite-length representation is additive; the constituent-level conclusion uses the type-and-density reduction. In the unnormalized Jacquet-module calculation each connected height-`k` term carries the modulus factor `q^{(n−k)r}`, where `q=|κ_F|`.

*Hypotheses.* Normalized induction and unnormalized intermediate Jacquet modules are explicitly distinguished; `r≥1`.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Lemmas 6.1–6.3 and Theorem 6.4, pp.15–16.)

Use the geometric descent formula on a block diagonal `β` and the norm integral for the étale block. Apply twisted character–Jacquet compatibility and twisted Weyl integration to the unnormalized Jacquet-module constituents. Insert `δ_P^{1/2}` and the lower-rank character identities; compare exponents to obtain the direct sum. The `p` printed in the 2010 Lemma 6.1 prefactor is interpreted by the corrected residue-cardinality computation explained in the normalization calculation.

**Checks.**

- For `n=2,n₁=n₂=1` both `rec_un` blocks have twist `ω^{1/2}`; multiplying by `ω^{−1/2}` gives the unitary parameter sum.

*Needs:* §10.9; §10.8; §10.1; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length); §6.23; §6.27; §6.25.

### 10.12 The auxiliary quasi-EL test-function calculation

For the local auxiliary datum `O= M_n(O_F)^op×O_{D′}^op` with `D′` a semisimple product, the associated structured `p`-divisible group has deformation ring `R_H≃R_β` and level space `R_H,m≃R_β,m×(O_{D′}/p^m)×` for its étale generators. The nearby cycles factor as `RΨ_β⊗C_c^∞(O_{D′}×)`. Consequently `φ_{τ,h,h′}` is associated to `f_{τ,h}∨×h′` in the `GL_n×D′×` factors. The central `G_m`/similitude factor is kept separately with its reciprocity character and `p^{−r′}`-coset; it cannot be absorbed into the `GL_n` parameter.

*Hypotheses.* The local datum arises at a rational prime split in the auxiliary imaginary quadratic field; `h,h′` compactly supported at integral level.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definition 7.1, Propositions 7.2–7.3, Corollary 7.4 and Lemma 7.5, pp.17–19; [Peter Scholze — The Langlands–Kottwitz method and deformation spaces of p-divisible groups](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf), Proposition 3.14 p.17; Proposition 4.10 and Remark 4.11 p.22.)

Use the specified structured `p`-divisible-group carrier and identify `δ₀` up to `σ`-conjugacy with `((β⁻¹)^t,1,β′)`. Compare the ordered level bases to strict `O`-module levels and the étale generator set. Tensor nearby cycles, use the étale norm identity, and apply inverse transpose to the first factor. Track the central character through Deformations Proposition 4.10 and Remark 4.11.

Define the ramified quasi-EL object used in this calculation as a strict `ϖ`-divisible `O_F`-module together with the matrix-algebra Morita action, the independent étale `O_{D′}^op`-linear factor and their ordered level generators. Its determinant condition is imposed on Lie through the structural `O_F` embedding; `F/ℚ_p` is allowed to be ramified. Morita equivalence recovers the dimension-one formal module, and étale lifting is unique, so the deformation functor is the product of that strict deformation functor with the discrete generator set. This proves the displayed factorization rather than appealing to an unramified PEL deformation theorem. The API the strict Morita datum for the quasi-EL comparison, deformation product and etale generators follows Scholze Definition 7.1 and Proposition 7.2, pp. 17–18.

**Checks.**

- The étale factor has zero tangent space, although its distinct unit generators give different level points.
- For ramified `F` the relative formal deformation dimension remains `n−1`; multiplying it by `[F:ℚ_p]` would count the structural `O_F` action incorrectly.

- For `n=1` the extra étale generator factor persists, even though the connected deformation space is zero-dimensional.

*Needs:* §10.4; §10.8; §10.1; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.1 (Finite flat group schemes and `p`-divisible groups); `TauCetiRoadmap.PELModuli` §M2 (Representability and smooth good models).

### 10.13 The simple unitary point count on raw cohomology

On the shared early raw compact-unitary cohomology `H_ξ`, specialize Scholze’s auxiliary CM division data: `F=F_0K, [F₀:Q]` even, unitary signature `(1,n−1)` at one infinite place and compact at the others, `D` division only at the chosen conjugate split pair `x,x^c`, and `p` split in `K` with the selected local factor `w≠x,x^c`. The alternating trace `tr(τ×h∨h′e_{ℤ_p×}f^p|H_ξ)` is the weighted sum of effective Kottwitz triples with coefficient trace `tr ξ(γ₀)` and twisted orbital integral of `φ_{τ,h,h′}`. Replacing that local function by its matched transfer gives `n·tr(τ×h∨h′e_{ℤ_p×}f^p|H_ξ)=tr(f_{τ,h}∨h′e_{p^{−r′}ℤ_p×}f^p|H_ξ), r′=r[κ_F:F_p]`. The PEL generic fibre is a disjoint union indexed by `ker¹(Q,G)`, not a canonically single Shimura variety.

*Hypotheses.* Use proper flat closure and sufficiently small level; either the special simple division model or the precise properness contract of Deformations Theorem 5.7.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), §8 pp.19–22; Lemmas 9.1–9.2, Theorem 9.3 and Corollary 9.4 pp.23–25; [Peter Scholze — The Langlands–Kottwitz method and deformation spaces of p-divisible groups](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf), Theorem 5.2 p.24; Propositions 5.4–5.5 p.25; Theorem 5.7 pp.26–27; §§6–7 pp.27–32.)

Instantiate the raw PEL tower of Layer 9, coefficient projectors and commuting Weil/Hecke actions in the auxiliary data. Identify formal neighbourhoods and their level covers by Serre–Tate, and count fixed points with effectivity, centralizers, volumes and coefficient traces. Use only Layer 6’s independent simple compact trace comparison and the local function comparison; neither the downstream local–global compatibility theorem, nor the downstream monodromy compatibility theorem, nor Layer 12 concentration, nor the downstream excursion-parameter comparison is an input.

For these division data construct the arbitrary-ramification integral model as follows. Start with the canonical PEL generic fibre and its prime-to-`p` level, use the abelian-scheme moduli with the `O_B` action and polarization, and take its schematic flat closure over the reflex valuation ring. Properness follows from the division/anisotropy condition and the valuative extension of the polarized abelian object; flatness is imposed by the closure rather than inferred from a good-prime smooth model. The Serre–Tate equivalence identifies the completed-local problem, with the action, determinant and level conditions, with §10.12’s strict quasi-EL deformation problem. Scholze, *Deformation spaces*, Theorem 5.2, p. 24, Propositions 5.4–5.5, p. 25, and Theorem 5.7, pp. 26–27, supply this construction; Scholze LLC §8, pp. 19–22, specializes it. The API the flat closure of the auxiliary division-algebra PEL model, proper and completed local quasi-EL fixes the model and comparison. Check flatness excludes vertical components; the ramified model is not asserted smooth; changing the marked `p`-divisible object transports the completed local comparison, rather than identifying all completed local rings canonically.

**Checks.**

- Discarding `ker¹(Q,G)`, the similitude coset, the factor `n`, or the effective-triple invariant must fail the normalization check.

*Needs:* §9.1; §10.12; §6.23; §6.27; §6.24; `TauCetiRoadmap.PELModuli` §M4 (Canonical models, twists and integral level changes); `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles).

### 10.14 Positive Weil traces from early unitary globalization

**Cohomological globalization and parity.** For every essentially square-integrable `π` of `GL_n(F)`, and every generalized Speh representation in Scholze Lemma 3.2(ii), construct auxiliary CM division-unitary data of §10.13, an irreducible admissible finite part `π_f` of its similitude group, and an algebraic coefficient `ξ` with nonzero graded multiplicity `W_ξ^*(π_f)`. Require `π_w=π∨⊗χ` for an unramified character `χ` and an unramified similitude character `π_{p,0}`. Prove that the multiplicity occurs in a common cohomological parity, that its alternating class `W` has `dim W=na` with a nonzero signed integer `a`, and hence that `sign(a)W` is effective of dimension `n|a|`. These assertions concern the actual graded cohomology of the auxiliary datum before a local parameter is constructed. ([Scholze, *The Local Langlands correspondence for GL_n over p-adic fields*](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), §10 opening, pp. 25–26, Theorem 10.2, p. 26, and Theorem 10.7, p. 28; Theorem 10.2 cites Harris–Taylor Corollary VI.2.5 and Lemma VI.2.11.)

The essentially square-integrable branch uses cuspidal globalization with the prescribed local factor, conjugate self-duality, regular algebraicity and a supercuspidal auxiliary component (Theorem 10.7), followed by the restricted descent of §6.27. The generalized Speh branch constructs its unitary cohomological realization directly as in Theorem 10.2, using the Harris–Taylor VI.2.5 and VI.2.11 compact-unitary comparison. Import the general `GL` residual representation and its multiplicity-one realization from AutomorphicSpectralTheory §4.14a; this does not itself supply a unitary preimage. In the unitary comparison retain the residual discrete term, the prescribed local Speh quotient up to unramified twist, its cohomological infinity type and the unramified multiplier character. Nonvanishing of the corresponding Euler–Poincaré term gives the required nonzero finite part. The parity calculation is the compact-unitary cohomological calculation recalled at the start of Scholze §10, not a consequence of regular algebraicity alone. Its signed dimension identity and the raw geometric trace of §10.13 provide the divisor `a`. Neither this realization nor its parity uses the later local–global compatibility or monodromy theorem. The API consists of the raw compact-unitary globalization of a Speh representation, the raw compact-unitary globalization of a discrete series representation and their common parity; it provides these two realizations and the parity/dimension assertion on their raw multiplicities.

**Checks.**

- The allowed Speh representation `u(1,2)=1_GL₂`, its dual and every unramified twist are nongeneric: the upper unipotent acts trivially, so a nontrivial Whittaker functional must vanish. Such a factor cannot occur in a cuspidal `GL₂` representation; it uses the Speh cohomological branch, not §6.27.
- At `n=1` the two input descriptions coincide, and the construction retains the separate similitude character and the algebraic coefficient.
- An odd common parity gives `W=−V` and `a<0`; then `W/a=V/|a|` is positive. Nonzero graded pieces in opposite parities would not supply this positivity.

For these realizations, Corollary 10.1 gives `tr(f∨_{τ,h}|π_w)=a⁻¹tr(τ|W⊗χ_sim)tr(h∨|π_w)`, where `χ_sim` is the Weil character of `π_{p,0}|_{W_F}`. Using `tr(f∨|π_w)=tr(f|π_w∨)`, obtain the positive rational class `rec_un(π)=a⁻¹W⊗χ_sim⊗χ`, where local characters use geometric reciprocity. This class has dimension `n` and satisfies the local trace identity. ([Scholze](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Corollary 10.1, Theorem 10.2 and Corollary 10.3, pp. 26–27.)

Take `f_{τ,h}` supported on determinant valuation `r`. If `χ(ϖ)=u` and `τ` lies over `Φ^r`, then `tr(f∨_{τ,h}|π_w)=u^{−r}tr(f_{τ,h}|π)`, while `tr(h∨|π_w)=tr(h|π)`. Multiplying Corollary 10.1 by `u^r` gives `a⁻¹W⊗χ_sim⊗χ`. Its positivity follows from the common parity and sign of `a` above.

**Checks.**

- Choose `u≠u⁻¹`: removing `u^{−r}` multiplies the Weil trace by `u^r`, fixing the direction of the unramified twist.
- The dimension of the positive rational class is `dim W/a=n`, including the odd-parity case with both numerator and denominator negative.
- The multiplier `χ_sim` is unramified but need not be trivial; dropping it changes the Frobenius trace even with `χ=1`.

*Needs:* §10.13; §9.1; §6.23 and §6.27 (essentially square-integrable branch); §6.24; §10.1; `AutomorphicSpectralTheory` §4.14a (general `GL` residual blocks).

### 10.15 The compact-group Lubin–Tate virtual comparison

Let `D/F` have invariant `1/n` and `ρ` an irreducible `D×` representation whose classical transfer `π=JL(ρ)` is supercuspidal. Extend the alternating nearby-cycle tower class from `K×(D××W_F)⁰` to `K×D××W_F` by compact induction, with `K=GL_n(O)` and `v_D(d)=deg(τ)`, with arithmetic degree `deg(Φ)=−1`. Define `M(ρ)=Hom_{D×}(ρ,c-Ind[RΨ])`. Then `M(ρ)=(−1)^{n−1}π∨|_K⊗rec_un(π)` as a virtual `K×W_F` representation. The `ρ` argument is fixed by the character projector in the proof of Corollary 11.3; the extra dual on `ρ` in its printed statement is corrected by the character-projector calculation. Here `rec_un(π)` initially denotes the positive rational class furnished by globalization. This identity asserts neither concentration in one degree nor a full `GL_n(F)`-equivariant realization.

*Hypotheses.* Use `0≤i≤n−1` nearby cycles, the inverse norm action `d⁻¹`, and the same Haar measures as the norm identities.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 11.1, Proposition 11.2, Corollary 11.3 and Remark 11.4, pp.28–29.)

The basic deformation tower is independent of `β` over the completed maximal unramified base; bounded finite-level cohomology gives its admissible compact action. Use local cyclic base change and its twisted character identity for `π`; its twisted character vanishes off the basic locus in this comparison. Insert classical JL with sign `(−1)^{n−1}` and integrate over the basic norm correspondence. The integral of `tr(d⁻¹|R)Θ_ρ(d)` projects to `Hom_{D×}(ρ,R)`, not `Hom_{D×}(ρ∨,R)`. The remaining `h∨` trace then yields `π∨|_K`; independence of compact and Weil characters identifies the virtual class.

**Checks.**

- For `n=1` the sign is `+1`. A character `ρ` of order greater than two distinguishes the `ρ` and `ρ∨` projectors: averaging `ρ(d)ρ(d⁻¹)` gives 1, whereas averaging `ρ(d)²` gives 0 on a finite quotient where `ρ²` is nontrivial.

*Needs:* §10.14; §10.8; §10.4; §4.7a; §6.23; §6.27; §6.24; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length).

### 10.16 Integral Weil multiplicities from newvectors

For every supercuspidal `π, rec_un(π)` is an integral virtual `W_F` representation. For an irreducible generic `GL_n(F)` representation with `ψ` of conductor `O`, AutomorphicLFunctionsAndLocalFactors AL.2, **Generic finite-place newforms**, gives a least `c≥0` with `dim π^{K₁(c)}=1` and vanishing at smaller nonnegative levels; `c` is the exponent of `q^{−s}` in its epsilon monomial. Since `K₁(c)` is compact open in `K=GL_n(O)`, the compact restriction `π∨|_K` has an irreducible `K`-type of multiplicity one. Projecting the preceding virtual identity to that type proves integer multiplicities, independently of positivity.

*Hypotheses.* `K₁(0)=K` and for `c>0 K₁(c)` is the integral subgroup whose last row is `(0,…,0,1)` modulo `ϖ^c`; supercuspidals are generic.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Corollary 11.5 and proof, p.30; [Hervé Jacquet, Ilya Piatetski-Shapiro and Joseph Shalika — Conducteur des représentations du groupe linéaire](https://www.math.columbia.edu/~hj/conducteur.pdf), §5.1 theorem and §5.2, pp.211–212; [Hervé Jacquet — A correction to Conducteur des représentations du groupe linéaire](https://msp.org/pjm/2012/260-2/pjm-v260-n2-p09-s.pdf), Theorem 1 p.517; §§2–3 pp.519–524, especially Remark 1 p.523.)

First prove genericity of every supercuspidal `GL_n(F)` representation using the nonzero highest mirabolic derivative and its one-dimensional Whittaker functional (Bernstein–Zelevinsky, *Representations of the group GL(n,F) where F is a local non-Archimedean field*, Proposition 5.15 and Theorem 5.16, pp. 49–50, and §5.18, p. 50). Consume the subgroup, least conductor, one-dimensional fixed space and epsilon-conductor equality from AutomorphicLFunctionsAndLocalFactors AL.2, **Generic finite-place newforms**, including its **GL₂ newvectors** input. The additional API the multiplicity-one newvector type extracts the compact multiplicity-one type for integral Weil multiplicities. Decompose the compact `K`-restriction: a one-dimensional `K₁(c)`-fixed space selects precisely one type and one multiplicity. Take the type-isotypic alternating nearby-cycle class; its integer coefficients equal `(−1)^{n−1}rec_un(π)`.

**Checks.**

- For an unramified character of `GL₁, c=0` and the trivial `O×` type has multiplicity one.
- A ramified `GL₁` character of conductor `c>0` has no `K₁(c−1)`-invariants and has a one-dimensional `K₁(c)`-fixed space.
- Twisting `ψ` by a nonunit changes the epsilon exponent; the equality with `c` uses `ψ` of conductor O. An arbitrary generic representation need not have a hyperspecial fixed vector.

*Needs:* `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.3 (Pairings, canonical lifting, Iwahori invariants and Whittaker functionals); §10.15; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.2, **Generic finite-place newforms** (including **GL₂ newvectors**).

### 10.17 Type isolation and the trace-to-parameter reduction

Let `ρ` be a unitary supercuspidal representation of `GL_d(F), t≥2` and `n=dt`. Its generalized Speh Langlands quotient `S` is formed from `ρ[(t+1)/2−i], 1≤i≤t`. There is `h∈C_c^∞(GL_n(O))` with `tr(h|S)≠0` and `tr(h|θ)=0` for every tempered irreducible `θ` outside the properly induced family formed from `t` unitary unramified twists of `ρ`. In particular `h` has zero trace on every square-integrable representation. Separately, a test function whose traces vanish on all tempered nonsquare-integrables and all generalized Speh representations has zero trace on every irreducible smooth representation. With the lower-rank character construction, Scholze Lemma 3.2 therefore reduces `rank n` to proper-induction traces, positive rational Weil traces for essentially square-integrable and Speh representations, and integral virtual Weil multiplicities for supercuspidals. Positivity and integrality then give actual dimension-`n` semisimple Weil representations.

*Hypotheses.* Characteristic-zero admissible representations; the compact type is finite-dimensional; the density statement applies to all finite-length test traces.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Lemmas 3.1–3.2 and their proofs, pp.9–11.)

The compact type separation and the trace-density assertion stated above are targets of this section. Construct the Schneider–Zink type attached to the repeated supercuspidal line, and use its tempered occurrence criterion ([Schneider–Zink, *K-types for the tempered components of a p-adic general linear group*](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/temtype.pdf), §5, Proposition 11, p. 30) to obtain the separator. Kazhdan’s density theorem identifies the common kernel of all irreducible characters with the orbital-integral kernel; apply it on each Levi after taking normalized constant terms. Scholze Lemma 3.1, pp. 9–10, gives the precise combination of the two assertions and the segment relation used here. The API the Speh-type separator, Speh trace nonzero and tempered occurrence records the compact test and its partition-order criterion. The compact test separates `S` from square-integrables; it does not isolate an essentially square-integrable unramified family. For the vanishing criterion, take normalized constant terms along proper parabolics and apply Kazhdan density on their Levi factors. The alternating segment/`Speh` relation then treats square-integrables, followed by density on `GL_n`. For Lemma 3.2, use the SR.3.2 Bernstein centre and universal-unramified-twist APIs. The trace scalar varies regularly on each cuspidal component and descends through self twists and Weyl identifications, yielding a central multiplier. Proper induction and the compact Speh test compare its trace with `f_{τ,h}`; the vanishing criterion extends the identity to every constituent. Use independence of semisimple Weil characters. Positive rational coefficients become nonnegative integers only after the independent supercuspidal integrality input.

**Checks.**

- The compact separator has nonzero trace on `S` and zero trace on all square-integrables.
- The separator may have nonzero trace on the specified properly induced tempered family; imposing vanishing on every tempered representation would force its Speh trace to vanish by the density criterion.
- At `t=1` the representation is square-integrable, so the asserted separator cannot exist. A positive rational multiplicity `1/2` still fails the actual-representation conclusion until integrality is imposed.

*Needs:* `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.2 (Bernstein components and the centre); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length); §10.11; §10.14; §10.16.

### 10.18 The character-defined semisimple Weil parameter

For every irreducible smooth complex `π` of `GL_n(F)`, construct the unique `n`-dimensional semisimple continuous `W_F` representation `rec_un(π)`, with finite inertia image, satisfying `tr(f_{τ,h}|π)=tr(τ|rec_un(π))tr(h|π)` for all `τ` projecting to a positive power of geometric Frobenius and compact `h` on K. Its unitary normalization `σ_ss(π)=rec_un(π)⊗ω^{(1−n)/2}` is additive on supercuspidal support. This construction specifies a Weil representation only; it carries no operator `N` and does not recover the usual `L`-factor of an arbitrary constituent from that support.

*Hypotheses.* `F` is finite over `ℚ_p, n≥1`; finite-length traces and transferred orbital-integral classes are defined by §2.16.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.2`(a)`–`(b)` p.3; Lemma 3.2 pp.9–10; Corollaries 10.3 and 11.5 pp.26–30.)

The interface consists of the following operations and identities.

- Construct `rec_un` on isomorphism classes of irreducible admissible representations.
- All transferred test traces equal the specified Weil trace times `tr(h|π)`.
- The actual semisimple Weil dimension is `n`.
- `σ_ss` of each irreducible subquotient of normalized induction is the sum of the `σ_ss` of the inducing blocks.

Proceed by rank, using harmonic descent in lower ranks; type and density reduce the new rank to essentially square-integrable/`Speh` positivity and supercuspidal integrality. Combine positive rational coefficients with integral multiplicities to obtain an actual dimension-`n` representation; use the type-and-density lemma to extend the character identity to each constituent. Uniqueness follows from semisimple Weil-character independence on the positive Frobenius cosets. Use the induction formula to identify the cuspidal-support sum.

**Checks.**

- For a `GL₁` character `χ`, the geometric Frobenius trace is `χ(ϖ)`.
- For unitary `St₂` and trivial `GL₂, σ_ss=ω^{−1/2}⊕ω^{1/2}`; semisimple traces do not distinguish their monodromy. Their full local `L`-functions differ, as does monodromy.
- A rational class with a constituent of coefficient `1/2` fails the integral-multiplicity test and is not the constructed actual Weil representation.

*Needs:* §10.17; §10.7; §10.1.

### 10.19 Restricted global Weil extraction without monodromy

For a cuspidal `Π` on `GL_n` over the auxiliary CM field with `Π∨=Π^c`, regular algebraic infinity and `Π_x` essentially square-integrable, there is an actual `ℓ`-adic Galois representation `R(Π)` of dimension an for some `a≥1`. At every finite `v∤ℓ` its semisimple Weil restriction is a copies of `rec_un(Π_v)`. In the regular `L`-algebraic convention it is a copies of `σ_ss(Π_v)`, after the explicitly chosen global Hecke-character twist. This is an equality of semisimple Weil classes, with no `N` statement. Every local essentially square-integrable `π` can be globalized up to unramified twist with `Π_x` supercuspidal.

*Hypotheses.* The character construction and normalized-induction formula have already been proved; use the specific auxiliary division group and retain its similitude character.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorems 10.5–10.7, pp.27–28; Corollary 13.2 p.33.)

Apply the early restricted unitary-to-GL globalization to `Π∨`, so the split `GL_n` component is `Π_v∨`. With `W` the resulting multiplicity class and a its signed multiplicity, set `A=|`a| and `R(Π)=`sign`(a)W⊗χ_ψ`. This is effective of dimension An; the positive `χ_ψ` follows directly from Corollary 10.1 from the positive character twist in that identity. Use the established local trace identity at split places and Chebotarev. For a general `v`, choose a real quadratic `R` linearly disjoint from `F`, with the rational prime below `x` split in `R` and the completions of `R` and `K` at the prime below `v` isomorphic. Over `FR/F₀R` the place above `v` is split and its completion is still `F_v`. Cyclic base change preserves the hypotheses; Chebotarev compares the normalized global restrictions. This is not an imaginary quadratic extension split at `v`. Use the separate essentially square-integrable globalization from Harris–Taylor VI.2.6; use a conjugate-self-dual Hecke character to pass to the `L`-algebraic normalization.

**Checks.**

- An equality of semisimple Weil traces cannot be used to infer Steinberg `N≠0`.

*Needs:* §10.18; §6.23; §6.27; §6.24; §9.1; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, **Archimedean GLₙ parameters**.

### 10.20 Functoriality of the semisimple parameter

The maps `σ_ss` satisfy: rank-one geometric reciprocity; normalized-induction constituent sum; `σ_ss(π⊗χ∘det)=σ_ss(π)⊗σ_ss(χ)`; and for cyclic prime-degree `E/F` and supercuspidal `π, σ_ss(BC_{E/F}π)=σ_ss(π)|_{W_E}`, with the lift allowed to be nonsupercuspidal. They commute with field isomorphisms. If `σ_ss(π)` is unramified, `π` has an Iwahori-fixed vector, equivalently its supercuspidal support consists of unramified rank-one characters.

*Hypotheses.* The local cyclic-lift normalization is fixed by its twisted character identity; no full WD base-change theorem is used.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 12.1 and proof, pp.30–31, including footnote 8.)

Prove rank one by the height-one tower and twists by restricted global extraction; use its cyclic global comparison for prime-degree local lifting. The induction sum has already been proved. For the Iwahori criterion reduce to supercuspidals of `rank ≥2` and show `σ_ss(π)^I=0`. Average `φ_{τ,h}` over inertia. Use `(1−q^r)tr_ss=tr` on derived inertia invariants and the specified `β`-independent nearby-cycle description, then compact JL orthogonality; use this exact all-`F` extension rather than assume it from the `ℚ_p` calculation.

The inertia-average calculation is a target here for the strict-`O` deformation spaces. Its API is the inertia-flag cohomology of strict nearby cycles, basic parameter independence and inertia average trace. For basic `β` of connected height `k`, at finite full level `m` the groups `H^j(RI_F RΨ_β)`, with their `W_{F_r}` descent and compact-group action, are independent of `β`. The connected factor, after choosing its level frame, is

`Ind_{P_{j,k}(O/ϖ^m)}^{GL_k(O/ϖ^m)}(St_j⊠1)(−j),  0≤j≤k`,

and is zero in other degrees. Here `St_j` is the kernel of the flag-summing maps for free direct summands over `O/ϖ^m, St₀=1`, and `P_{0,k}=P_{k,k}=GL_k` with the evident endpoint conventions. Retain the formal-disc and étale factors of §10.9. These are level-`m` flag representations, not in general inflations from `GL_k(κ_F)`; their limit is the restriction of the corresponding smooth `p`-adic parabolic-induction representation. The flag resolution and its exactness are Scholze, *Some simple Shimura varieties*, Lemma 5.5 and Corollary 5.6, pp. 13–14. For general `F` replace the `ℚ_p` Shimura algebraizations in that proof by §10.2’s equivariant finite-type strict-`O` algebraizations; the same Cartier-level flag stratification and purity calculation use `κ_F`, so every `p^r` in the Frobenius calculation becomes `q^r`. Scholze LLC Theorem 12.1`(v)`, pp. 30–31, footnote 8, makes precisely this replacement. The inertia cohomology spectral sequence gives

`(1−q^r) tr_ss(Φ^r×h∨ | RΨ_β)=tr(Φ^r×h∨ | RI_F RΨ_β)`.

Since the right side is `β`-independent, compact JL orthogonality kills its supercuspidal `rank ≥2` contribution. Check `r≥1` makes `1−q^r` invertible; a residue degree two field uses `q=p²`; `n=1` has nonzero inertia-fixed parameter and is excluded from that vanishing argument. At `k=2` and `m>1`, flags modulo `ϖ^m` test the full congruence-level representation, so replacing it by residue-field flags fails. This gives both the cohomology description and its all-`F` trace consequence.

**Checks.**

- Unramified `σ_ss` implies Iwahori invariants, not necessarily hyperspecial invariants: `St₂` is the basic counterexample.

*Needs:* §10.2; §10.4; §10.9; §10.18; §10.19; §10.15; §6.23; §6.27; §6.24; `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.4 (The split Iwahori block and nonsplit components).

### 10.21 Supercuspidal trace parameters

For each `n≥1`, prove that the character-defined map `π↦σ_ss(π)` of §10.18 is a bijection from supercuspidal irreducible smooth complex `GL_n(F)` representations to irreducible continuous `n`-dimensional complex `W_F` representations with finite inertia image. Unlike the imported classical bijection, this statement concerns the map extracted from nearby-cycle traces; its identification with `C_geo` is §10.30. The proof uses only the five functorial properties and local cyclic lifting; it does not use numerical LLC or the factor-compatibility theorem being proved below.

*Hypotheses.* `F/ℚ_p` finite; the cyclic local lifting results of §§6.12 and 6.24 give existence, ambiguity by cyclic characters, and nonsupercuspidal-lift decomposition.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definition 12.2 and Theorem 12.3 with proof, pp.31–32; [James Arthur and Laurent Clozel — Simple Algebras, Base Change, and the Advanced Theory of the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter `I` Theorem 6.2 pp.51–57, Proposition 6.7 pp.59–60, Lemma 6.10 pp.62–64.)

For a continuous complex Weil representation with finite inertia image, first treat an irreducible representation and choose its unramified twist so that Frobenius has finite-order image: a power of Frobenius centralizes the finite inertia image and is scalar by Schur’s lemma. The twisted irreducible then factors through a finite quotient; apply this separately to the summands of a semisimple representation. Apply finite-group Clifford theory there; restriction to a normal cyclic-prime-index subgroup is a multiplicity-one orbit sum, either irreducible or the sum of the conjugate lower-rank representations. Unramified twists restore the original representation. This also proves the finite-inertia Brauer-induction reduction used in §10.28, by applying finite-group Brauer induction before restoring the twist. These are the Weil representation inputs for Scholze Theorem 12.3, pp. 31–32, and Theorem 14.1, pp. 35–36. Choose a prime-cyclic tower making the parameter unramified. At its first loss of supercuspidality, Arthur–Clozel `I` Lemma 6.10 decomposes the lift as the orbit induction of pairwise distinct lower-rank supercuspidals. Rank induction and Clifford theory prove irreducibility. For a given irreducible Weil representation descend from the first reducible restriction: realize its orbit constituents in lower rank and lift their normalized induction. Descend through the remaining cyclic steps using `I` Theorem 6.2; match the unique cyclic character twist on the Weil side and use `I` Proposition 6.7 for uniqueness.

**Checks.**

- A rank-two irreducible Weil induction from a noninvariant quadratic character corresponds to a supercuspidal; a reducible sum of two characters cannot.

*Needs:* `TauCetiRoadmap.RepresentationTheory.InductionRestriction` Layer 6 (Artin and Brauer induction); `TauCetiRoadmap.ClassFieldTheory` Layer 9 (the local Weil group); §10.20; §6.23; §6.27; §6.24; `TauCetiRoadmap.ArithmeticGaloisRepresentations` §1 (continuous representations and integral models); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length); `TauCetiRoadmap.RepresentationTheory.InductionRestriction` Layer 5 (Clifford theory over a normal subgroup).

### 10.22 Potentially abelian automorphic–Weil pairs

A potentially abelian pair over a number field `L` consists of a cuspidal automorphic `Π` of `GL_n/L` and a continuous `n`-dimensional global Weil representation `Σ`, with `σ_ss(Π_v)=Σ|_{W_{L_v}}` at every finite place and archimedean LLC agreement at every infinite place. The word pair retains `Σ`, rather than just a predicate on `Π`. An algebraic `Σ` restricts at each complex embedding to characters `z^p z̄^q` with integral `p,q`. Regular `L`-algebraic `Π` means `Π_∞⊗|det|^{(n−1)/2}` is regular algebraic in the cohomological convention. Algebraic global Weil representations have `ℓ`-adic realizations matching all `v∤ℓ`.

*Hypotheses.* `Σ` is potentially abelian: its restriction to the Weil group of some finite extension is a direct sum of characters. Fix the field comparison `ι` and the local reciprocity convention. GlobalNumberFields gives the character carriers and infinity types; `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer` §R17.5.0 supplies the global Weil input fixed in §1.3a; the algebraic realization for these `Σ` is constructed here.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Definition 13.1, Corollary 13.2 and Lemmas 13.3–13.4, pp. 32–34.)

The interface consists of the following operations and identities.

- Gives equality of semisimple Weil isomorphism classes at each finite place.
- Gives the archimedean LLC association at every infinite place.
- For algebraic `Σ` and `ι:ℚ̄_ℓ≃C`, its `ℓ`-adic realization agrees at every `v∤ℓ`.
- An algebraic rank-one Hecke character and its class-field Weil character give a pair.

Use the already-proved local `σ_ss` at finite places, and the existing archimedean LLC endpoint. Construct `ℓ`-adic realizations for algebraic characters by global class field theory and then use finite-extension descent for `Σ`. Finite-place comparison is stable under isomorphism of either member; the realization and normalizing character are constructed below.

Use the global Weil extensions, transition maps, localization and abelianization supplied by `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer` §R17.5.0, with §1.3a’s endoscopic conventions.

For an algebraic character, construct its `ℓ`-adic avatar by cancelling its algebraic infinity type on principal ideles and inserting that type at places above `ℓ`; continuity and reciprocity descend it to `Γ_L`. For potentially abelian `Σ`, perform this construction after a finite extension where it splits into characters, then descend the finite permutation and intertwining data. The cocycle identities are retained under `ι`, so the descent is a representation, not just a matching collection of Frobenius polynomials. Scholze Lemmas 13.3–13.4, pp. 33–34, prove this realization and its finite-place agreement away from `ℓ`. Check a rank-one algebraic character gives its usual avatar; a nonintegral infinity exponent is excluded; changing a local Weil embedding by conjugacy gives an isomorphic restricted representation.

The archimedean normalization uses the unitary LLC of AutomorphicLFunctionsAndLocalFactors, **Representation prerequisites**, **Archimedean GLₙ parameters**: a character `z^a z̄^b` of `C×` corresponds to the same character of `W_C`, and `|det|^t` corresponds to the norm character `|·|^t`. The algebraic normalization of a rank-`n` parameter is the unitary parameter twisted by `|·|^{(1−n)/2}`; cyclic base change is restriction and automorphic induction is induction, with that rank-dependent twist restored at each endpoint. Substitution on `W_C` proves the infinity-type formulas, including the induced two-dimensional `W_R` blocks. For a CM field choose the character `φ` in Scholze Corollary 13.2, p. 33: `φ^c=φ⁻¹` and `φ_∞|·|^{(n−1)/2}` is algebraic. Then twisting by `φ` corrects the half-integral weights while preserving conjugate self-duality. In the solvable induction of Lemma 13.6, pp. 34–35, a finite-order descent obstruction is corrected by the Artin character there, before asserting conjugate self-duality. The parity, even totally real degree and splitting assumptions of §10.24 are retained. Add potentially abelian pair algebraic avatar, normalizing character and archimedean restriction. Check `n=1` has no half shift; `n=2` may require half-integral infinity exponents before correction; omitting `φ` changes the algebraicity condition even if unramified finite places agree.

**Checks.**

- For an algebraic Hecke character, both local endpoints equal the local reciprocal character, including ramified finite places.
- A record with finite agreement only outside a finite set fails the finite comparison at a missing place.
- At a complex embedding a character `z↦|z|^{√2}` fails the integral-weight algebraicity condition.

*Needs:* §1.3a; §10.21; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, **Archimedean GLₙ parameters**; `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations); `TauCetiRoadmap.GlobalNumberFields` Layer 9 (Hecke and ray class characters); `TauCetiRoadmap.GlobalNumberFields` Layer 10 (archimedean characters, infinity types, and cyclotomic arithmetic); `TauCetiRoadmap.ArithmeticGaloisRepresentations` §1 (continuous representations and integral models).

### 10.23 The segment-to-monodromy adapter

For the raw special block, use `N e_j=e_(j+1)` and geometric Frobenius `e_i↦q^(−i)e_i`. Their covariance is `F N=q⁻¹N F`. The matrix identity holds over `ℚ` at `q=0` or `q=1` as a numerical formula, but an invertible Weil action requires the actual residue cardinality `q>1`. The length-`k` block satisfies `Nᵏ=0` and `Nᵏ⁻¹≠0` when `k>0`. The normalized special block is obtained by the separately specified half twist.

Use SmoothRepresentationsOfLocalGroups §SR.5.2’s `GL_n` segment classification (*segment-representations*) and special pairs, together with §SR.5.3’s endpoint-shortening formula (*highest-derivative-adapter*). For a segment `Δ=[ρ⊗|det|^a,…,ρ⊗|det|^b]`, with `ℓ=b−a+1` a positive integer, send its essentially square-integrable constituent `D(Δ)` to `σ_ss(ρ)⊗ω^a⊗Sp(ℓ)`. Here `Sp(ℓ)` has weights 1,`ω,…,ω^{ℓ−1}` and `N e_i=e_{i+1}, N e_{ℓ−1}=0`, as in the imported unnormalized special object. The normalized unitary Steinberg block is `ω^{(1−ℓ)/2}Sp(ℓ)`. This construction defines only the adapter, not another multisegment classification or WD carrier.

*Hypotheses.* `a,b` may include the fixed half-integral normalization; the SR segment orientation must select the essentially square-integrable constituent, independently of its `Z/L` naming convention.

([Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.2–2.3 pp.593–594; §2.5–2.6 p.595.)

The interface consists of the following operations and identities.

- Attach the tensor special block to the imported segment class.
- Its dimension is `ℓ·dim σ_ss(ρ)`.
- Forgetting `N` gives the sum of the `ℓ` cuspidal twists, matching `σ_ss(D(Δ))`.
- `N` has `length ℓ` on each Weil multiplicity block, so the top nonzero power is `N^{ℓ−1}` when `ℓ>0`.
- The light pinned projection sends `t` to `diag(1,t)`.
- The light projection has `N e₀=e₁` and `N e₁=0`.
- `F(t)N=t` NF`(t)`, the arithmetic-Frobenius covariance in the imported special object.

Use the existing segment endpoint, essentially square-integrable classification and standard-data uniqueness from SR.3.3 and SR.5.2 (segments), with SR.5.3 (involution). Tensor the imported irreducible Weil representation with its twist and special block; use the imported monodromy covariance, not a newly invented WD record. Verify the arithmetic-Frobenius two-dimensional projection `F(t)=diag(1,t), N=[[0,0],[1,0]]` in the pinned matrix carrier. This projection is a normalization check, not a full WD implementation.

**Checks.**

- At length 2, the raw monodromy matrix is `[[0,0],[1,0]]`, has square zero and is nonzero; at `k=1` it is zero. At `k=0` the empty matrix ring has `1=0`, so the nilpotence-index nonvanishing claim must require `k>0`.
- At `q=3` and length 2, the raw Frobenius matrix is `diag(1,1/3)`, and `F N F⁻¹=(1/3)N`. At `q=1` it is the identity; at `q=0` and `k=2` it is `diag(1,0)` and is not invertible. The numerical covariance still holds, but these latter values are not residue cardinalities.
- `Sp(1)` is trivial with `N=0` and `D([ρ])` maps to `σ_ss(ρ)`.
- For `ℓ=2, ker N` is the second basis line and `N²=0` while `N≠0`.
- The same `F(t)` with `N` and with 0 has identical trace and characteristic polynomial, but their kernels have dimensions 1 and 2.
- The unitary `GL₂` Steinberg block has `N≠0`, one-dimensional `ker N` and Frobenius weights `ω^{−1/2},ω^{1/2}`.

*Needs:* §10.21; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.2 (shared raw Weil–Deligne fields, special pairs and operations); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.3 (Coefficient change, Ext and local blocks); Mathlib `Matrix.diagonal`; Mathlib `Matrix.trace`; Mathlib `Matrix.trace_diagonal`; Mathlib `Matrix.charpoly`.

### 10.24 Harris non-Galois automorphic induction

Let `F_{30}⊃F_{20}⊃F_{10}` be totally real fields of even degrees over `Q`, with `F_{30}/F_{10}` solvable Galois. Put `F_i=F_{i0}K` for an imaginary quadratic `K` and `n=[F_{20}:F_{10}]`. Let `x` of `F₁` split over `F_{10}` and be inert in `F₃`. For an algebraic Hecke character `χ` of `F₂` require `χ^c=χ⁻¹`, infinity characters `z^{p_τ}z̄^{−p_τ}` with pairwise distinct integers `p_τ`, and stabilizer of `χ_x∘Norm_{F₃/F₂}` in `Gal(F₃/F₁)` exactly `Gal(F₃/F₂)`. Then there is a potentially abelian cuspidal automorphic representation of `GL_n/F₁` associated to `Ind_{W_{F₂}}^{W_{F₁}}χ` at every place; its `x`-component is supercuspidal. This is the specified solvable-closure theorem, not arbitrary non-Galois induction.

*Hypotheses.* A chosen embedding and place identify the local induced character; regularity and stabilizer hypotheses are essential.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorems 13.5–13.6 and proofs, pp.34–35; [James Arthur and Laurent Clozel — Simple Algebras, Base Change, and the Advanced Theory of the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter III Theorem 4.2 pp.202–203 and Theorem 6.2 pp.215–216.)

First prove Scholze Theorem 13.5: compare `ℓ`-adic realizations using restricted global extraction and Chebotarev, and fix a cyclic descent twist through its supercuspidal `x`-component. Induct on the solvable Galois degree and choose a prime-cyclic `F₄/F₁`. If `F₄⊂F₂` use cyclic automorphic induction; otherwise base change to `F₄` and descend its invariant cuspidal representation. Use strong multiplicity one, the `x`-component and the conjugate-self-duality correcting Artin character to select the descended representation; apply the all-place upgrade.

**Checks.**

- At `n=1` this is the original Hecke character; a `χ` with larger stabilizer fails the irreducible `x`-component hypothesis.

*Needs:* §10.22; §10.19; §6.23; §6.27; §6.24; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, **Archimedean GLₙ parameters**.

### 10.25 Full special-block factors and conductors

This target evaluates the imported arithmetic local-factor operations on the trace-labelled segment adapter of §10.23; it does not construct a second WD carrier, conductor or epsilon factor. For `W=σ_ss(ρ)` and the raw block `B=W⊗ω^a Sp(ℓ), L(s,B)=L(s+a+ℓ−1,W)` and `a(B)=ℓa(W)+(ℓ−1)dim W^I`. For raw `Sp(ℓ)⊗Sp(m)`, the decomposition is `⊕_{j=1}^{min(ℓ,m)}ω^{j−1}Sp(ℓ+m+1−2j)`. Consequently `L(s,B⊗B′)=∏_j L(s+a+a′+ℓ+m−1−j,W⊗W′)`. Its `γ` factor is `∏_{i=0}^{ℓ−1}∏_{k=0}^{m−1}γ(s+a+a′+i+k,W⊗W′,ψ)`; recover epsilon by `ε=γ L(s)/L(1−s,dual)`, retaining the imported monodromy determinant. The formulas are identities of rational/meromorphic functions, including poles, with the rank-one Tate `s`-variable.

*Hypotheses.* `ℓ,m≥1`; Frobenius-semisimple WD, finite inertia; conductors are the imported Artin/Swan conductors.

([Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.3–2.4, p.594; [Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.2`(d)` p.3 and footnote 9 p.35.)

Take inertia invariants of `ker N`: only the terminal raw special weight survives. Use the special-block tensor decomposition to compute the pair `L`-polynomial; multiplicativity of `γ` on WD short exact sequences computes `γ` from the Weil weights. Use the full Deligne epsilon definition and `a(B)=Sw(r)+dim V−dim(ker N)^I` to derive the conductor and epsilon identities.

**Checks.**

- For normalized `St₂` twisted by unramified `χ(ϖ)=α, L(s)=(1−αq^{−s−1/2})⁻¹` and conductor 1; the zero-monodromy object with the same Weil weights has two Euler factors and conductor 0.

*Needs:* §10.23; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.2 (shared raw Weil–Deligne fields, special pairs and operations); `TauCetiRoadmap.ArithmeticGaloisRepresentations` §2.6 (monodromy and special-block decomposition); `TauCetiRoadmap.ArithmeticGaloisRepresentations` §2.5 (Local factors); `TauCetiRoadmap.ArithmeticGaloisRepresentations` §2.7 (Local constants).

### 10.26 The trace-defined Weil–Deligne parameter

For irreducible `π=L(δ₁,…,δ_t)`, define the trace-based map `LLC_WD(π)=⊕_i` SegmentWDAdapter`(δ_i)`, using the uniquely determined unordered multiset of ordered Langlands standard blocks. This adapter uses the trace-defined supercuspidal map, rather than redefining the imported classical correspondence `C_geo`; their equality is the target of §10.30. It is a Frobenius-semisimple WD isomorphism class of dimension `n`. Forgetting `N` and taking Weil semisimplification gives `σ_ss(π)`. Inverse construction decomposes a Frobenius-semisimple WD object into irreducible Weil special blocks, translates each to a segment and takes the unique standard-data Langlands quotient. Frobenius semisimplification retains `N`; categorical semisimplification kills `N` and is a different operation.

*Hypotheses.* Use SR.5.2’s shared WD carrier and ArithmeticGaloisRepresentations §2.6’s special-block decomposition; no new equivalence relation or general monodromy classification is specified here.

([Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.1–2.2 p.593; §2.5 p.595; §2.7–2.9 pp.595–596.)

The interface consists of the following operations and identities.

- Map the imported unique standard data to the direct sum of its special WD blocks.
- Decompose the WD object and recover the unique Langlands quotient, inverse on isomorphism classes.
- Forgetting `N` and semisimplifying `r` equals `σ_ss(π)`.
- The WD dimension equals the `rank n` of `GL_n`.
- Concatenating standard block multisets, then reordering and taking their Langlands quotient, corresponds to WD direct sum; it is not a direct-sum operation on irreducible representation spaces.

Use uniqueness of `GL_n` Langlands data from SR.3.3 and SR.5.2 (segments), with SR.5.3 (involution), and uniqueness of WD special-block decomposition from ArithmeticGaloisRepresentations §2.6. Apply the segment adapter to each block and the imported WD direct sum; permutation of blocks changes only the isomorphism representative. Construct the inverse using the supercuspidal bijection and match both multisets. Compare forgotten Weil weights with the earlier character-parameter induction formula.

**Checks.**

- A supercuspidal `π` maps to its irreducible `σ_ss` with `N=0`.
- Unitary `St₂` maps to `ω^{−1/2}Sp(2)`, so `N≠0` and `ker N` has dimension 1.
- The trivial `GL₂` representation maps to `(ω^{−1/2}⊕ω^{1/2},0)`, which has the same Weil semisimplification as `St₂` and is not isomorphic to its WD object.
- Both inverse compositions preserve every special-block length; matching only the Weil semisimplification is insufficient.

*Needs:* §10.23; §10.18; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.2 (shared raw Weil–Deligne fields, special pairs and operations); `TauCetiRoadmap.ArithmeticGaloisRepresentations` §2.6 (monodromy and special-block decomposition); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.3 (Coefficient change, Ext and local blocks).

### 10.27 Henniart’s highly ramified functional-equation argument

For two local supercuspidal terms whose Weil representations are induced from characters, choose simultaneous potentially abelian cuspidal globalizations with the required local factors up to unramified twist. At the finitely many unwanted ramified places choose a global Hecke character `η`, trivial at the distinguished place and sufficiently ramified elsewhere. The analytic and Weil stability theorems below imply that, once dimensions and determinants match, the twisted pair `L`-factors there are 1 and their epsilon factors agree with the same `ψ` and Haar measures. The two global pair functional equations then isolate the `L/ε` identity at the distinguished place. Brauer induction makes this reduction available for every pair of virtual supercuspidal terms.

*Hypotheses.* `F/ℚ_p` is finite; all local additive characters and measures agree. The conductor threshold depends on the fixed pair and `ψ`. Simultaneous globalization uses the solvable induced-character case of §10.24, allowing an unramified twist at the distinguished place.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 14.1, Lemma 14.2 and proof, pp.35–36.)

Use the solvable-induction theorem and the local-to-global embedding/character approximation construction for both induced Weil terms. Identify determinants by global class field theory and strong multiplicity one. Use the local highly ramified stability and character approximation stated below. Divide analytic and Weil global functional equations, cancel the matching unramified and archimedean factors, and separate the remaining rational `L`-factor and epsilon monomial with the local functional equation.

The auxiliary character has the following approximation property. Given a distinguished finite place `v₀` of `L`, a finite set `S` disjoint from `v₀` and integers `A_v`, there is a finite-order idele-class character `η` with `η_{v₀}=1` and `a(η_v)≥A_v` for `v∈S`; ramification at additional auxiliary places is allowed. At each `v∈S` choose a finite-order local character of conductor at least `A_v`, and prescribe the trivial character at `v₀`. ArithmeticGaloisDuality §R02.4.6, **Grunwald–Wang with its exact dyadic obstruction**, extends this finite collection: in the exceptional case permit global order `2n` instead of `n`, leaving all prescribed local restrictions unchanged. Global reciprocity turns the resulting finite Galois character into the required idele-class character. Thus neither bounded order nor a fixed ramification set is asserted. The local triviality is on all `L_{v₀}×`, not just its units. This distinction is needed when cancelling the functional equations.

For fixed generic `π` of `GL_a(F)` and `π′` of `GL_b(F)`, there is A such that `a(χ)≥A` gives `L(s,(π⊗χ)×π′)=L(1−s,(π∨⊗χ⁻¹)×π′∨)=1`. Its epsilon factor depends only on `a,b`, the two central characters, `χ` and `ψ`. More explicitly, choose characters `α_i,β_j` whose products are those central characters; it is the product of the rank-one epsilon factors `ε(s,χα_iβ_j,ψ)`. Jacquet–Shalika, [*A lemma on highly ramified ε-factors*](https://www.math.columbia.edu/~hj/Highly%20ramified.pdf), Proposition 4.1 and §4.2, pp. 326–327, and Proposition 5.1, p. 331, prove these claims: induction on ranks reduces the functional equation to essential Whittaker vectors and rank-one factors. The conductor is chosen beyond the finitely many levels fixing these vectors. The dual `L`-factor is included, so equality of `γ` factors gives equality of epsilon factors.

The corresponding Weil assertion follows from Deligne–Henniart, [*Sur la variation, par torsion, des constantes locales*](https://publications.ias.edu/sites/default/files/Number43.pdf), Theorem 4.6 and Lemma 4.7, pp. 110–111: apply the theorem to `V−(dim V)·1` after choosing `χ` with ramification break more than twice the largest break of these constituents. The proof uses the refined Brauer decomposition and the norm/Gauss-sum comparison in §§2–3. Consequently for fixed `V`, sufficiently ramified `χ` has `(V⊗χ)^I=0`, and `ε(V⊗χ,ψ)=ε(χ,ψ)^{dim V}det(V)(c_χ)`, where `c_χ` is fixed by the rank-one relation `χ(1+x)=ψ(c_χ⁻¹x)` on sufficiently deep units. The same `c_χ` and self-dual measure are used on both sides. Thus equal dimension and determinant give identical constants. The analytic rank-one product above has determinant `ω_π^bω_π′^a`, exactly `det(V⊗V′)` once the determinant comparison is known. Finite Brauer induction of global Weil representations gives their global functional equation from Tate's rank-one functional equation; ClassFieldTheory supplies the idelic norm and transfer, not this functional equation.

The API consists of the high-ramification threshold for pair factors, the rank-one stable product, a Hecke character trivial at the specified place and highly ramified at the other specified places, and the global functional equation of a potentially abelian pair; all of it belongs to this argument. Check `η_{v₀}(ϖ)=1` as well as triviality on units; a twist below `A` is not covered; unequal determinants may give different stable epsilon factors. At new auxiliary ramified places both original pairs are unramified, so their factors after a ramified rank-one twist already agree by the unramified-tensor formula and the determinant comparison. No second approximation or recursive enlargement of `S` is needed.

**Checks.**

- A character ramified at the distinguished place does not isolate the original local pair; its component must be trivial there.

*Needs:* `TauCetiRoadmap.ArithmeticGaloisDuality` §R02.4.6 (Grunwald–Wang with its exact dyadic obstruction); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (global reciprocity); §10.24; §10.20; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.1 — Tate zeta distributions and Hecke `L`-functions; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 — Rankin–Selberg theory and function-field factors; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, **Archimedean GLₙ parameters**.

### 10.28 Supercuspidal pair-factor compatibility

For supercuspidal `π₁,π₂` of `GL_{n₁}(F),GL_{n₂}(F), σ_ss` respects duals and central characters and satisfies `L(s,π₁×π₂)=L(s,σ_ss(π₁)⊗σ_ss(π₂))` and `ε(s,π₁×π₂,ψ)=ε(s,σ_ss(π₁)⊗σ_ss(π₂),ψ)`. The same identities hold multiplicatively on the free abelian group of supercuspidals in all ranks. This virtual cuspidal-support extension is not the usual `L`-function of a general irreducible `GL_n` representation.

*Hypotheses.* The two epsilon sides use the rank-one dictionary and the same nontrivial `ψ`/self-dual measure.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 14.1 and footnote 9, pp.35–36.)

Apply the finite-quotient-after-unramified-twist reduction of §10.21 and finite-group Brauer induction over `ℂ` to reduce to virtual induced-character terms; restore the twists using their character extensions to the relevant Weil subgroups. Use highly ramified isolation for pairs of such terms and multiplicativity to recover arbitrary pairs. Use the global determinant comparison for `det σ_ss=ω_π`; detect duality by the pole of the pair `L`-function.

**Checks.**

- For supercuspidals of unequal ranks the pair `L`-function is 1; rank-one equality is Tate’s local identity.

*Needs:* §10.21; §10.27; `TauCetiRoadmap.ArithmeticGaloisRepresentations` §1 (continuous representations and integral models); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 — Rankin–Selberg theory and function-field factors; `TauCetiRoadmap.RepresentationTheory.InductionRestriction` Layer 6 (the virtual-character ring, Artin and Brauer induction).

### 10.29 Analytic factors for segments and Langlands quotients

For essentially square-integrable segment representations `δ,δ′`, the analytic standard and pair `L/γ/ε` factors equal the special-block formulas of the preceding node after replacing `W,W′` by their supercuspidal analytic endpoints. For every irreducible `π=L(δ₁,…,δ_t)` in ordered Langlands standard data, `L(s,π)=∏_i L(s,δ_i)`, and for `π′=L(δ′₁,…,δ′_u)`, each pair `L,γ,ε` factor is the product over `i,j` of the corresponding `δ_i×δ′_j` factor. This includes nongeneric quotients and their canonical analytic factor definitions; it is stronger than multiplicativity for irreducible generic normalized inductions.

*Hypotheses.* `Δ_i` are essentially square-integrable, ordered by decreasing real exponent; use the imported unique Langlands quotient, not an arbitrary irreducible subquotient of the same induced module.

([Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.6 p.595 and §2.8 p.596.)

These segment formulas and the nongeneric extension are targets here. In Henniart’s uncentred convention `δ=St_a(ρ), δ′=St_b(ρ′)`, put `ν=|·|`. Then `L(s,δ×δ′)=∏_{j=1}^{min(a,b)}L(s,ν^{a+b−1−j}ρ×ρ′)`, while `γ(s,δ×δ′,ψ)=∏_{i=1}^a∏_{j=1}^bγ(s,ν^{i+j−2}ρ×ρ′,ψ)`. Recover `ε` from `γ=εL(1−s,dual)/L(s)`; translate to the centred unitary blocks by twisting `ρ` and `ρ′` by `ν^{−(a−1)/2}` and `ν^{−(b−1)/2}`. Prove the segment `L`-polynomial by the essential Whittaker integrals and their functional equation (JPSS §9, as recorded in Henniart §2.6, p. 595). For a nongeneric Langlands quotient define its factors by the unique ordered essentially square-integrable data and the displayed products (Henniart §2.8, p. 596); permutation of equal exponents leaves every product unchanged. This is a definition on canonical data followed by comparison, not multiplicativity for an arbitrary subquotient. Combine the supercuspidal-pair endpoint with the special-block formulas to identify every standard-data product.

**Checks.**

- For the trivial `GL₂` quotient, use two length-one Langlands blocks. Substituting the length-two Steinberg block incorrectly removes an Euler factor.

*Needs:* §10.25; §10.28; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.3 (Coefficient change, Ext and local blocks); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.2 — Godement–Jacquet standard functions; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 — Rankin–Selberg theory and function-field factors.

### 10.30 Identification with the classical correspondence

For each `n≥1`, prove `LLC_WD(π)=C_geo(π)` for every irreducible smooth complex `π` of `GL_n(F)`, with `C_geo` imported and normalized at the boundary. The new assertion identifies the independently trace-defined map with that existing correspondence; the classical bijection is not planned a second time. Transport its dual, character-twist and field-isomorphism properties to the trace map; `det(r)=ω_π` through geometric reciprocity. Standard `L/ε` and all pair `L/ε/γ` factors agree, with full monodromy. For every generic `π` and `ψ` of conductor `O`, its newvector exponent equals the Artin–Deligne conductor of `LLC_WD(π)`. Equality with a later geometric semisimple `GL_n` parameter is an output theorem in the downstream excursion-parameter comparison, consuming this endpoint, not an input to its construction.

*Hypotheses.* Same normalization, complex square root, `ψ` and measures throughout; the nongeneric analytic extension is §10.29.

([Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 1.2`(c)`–`(d)` and discussion, pp.3–4; [Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.9 p.596; Theorem 1.8 p.591 and Corollary 1.8 p.592, proof §4.5 p.600.)

Apply the characterization by pair factors in Henniart Theorem 1.8, p. 591, to the trace-defined supercuspidal map and the imported geometric classical map, using §10.28. Extend their equality by the common segment/special-block rule and unique Langlands data. The inverse in §10.26 is consequently the imported classical inverse, not a separately owned correspondence. The supercuspidal dual/twist/determinant theorem and the standard-data dual operation extend these properties to every block and quotient. Use analytic Langlands-quotient products and special-block products for all factor identities. Use the generic newvector theorem and the imported WD epsilon/conductor dictionary. No argument replaces `N` by zero when the Weil representation is already semisimple.

**Checks.**

- In rank one this is reciprocity with `N=0`. For `St₂` versus trivial `GL₂` the monodromy and conductor checks distinguish parameters despite identical semisimple Weil traces.

*Needs:* `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.2 (*classical-llc-normalization*, the supplied classical correspondence); §10.26; §10.29; §10.16; §10.25; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.2 (shared raw Weil–Deligne fields, special pairs and operations); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length).

### 10.31 The inner-form parameter from standard data

For irreducible `π′` of `GL_r(D)`, take its unique ordered inner Langlands standard data `δ′₁,…,δ′_t`, transfer each essentially square-integrable block by classical JL, and set `LLC_D(π′)=⊕_i LLC_WD(JL(δ′_i))`. This is a dimension-rd Frobenius-semisimple WD class. Its image consists exactly of WD classes each of whose indecomposable special-block dimensions is divisible by `d`, and its inverse uses the classical inverse on each essentially square-integrable block and the inner Langlands quotient. The split quotient `Q(π′)` of the transferred standard data has this same WD parameter. No general identity `LJ_D([Q(π′)])=[π′]` or equality `JL_add([π′])=[Q(π′)]` is asserted: Badulescu’s version explicitly treats the general `Q` character identity as a conjecture.

*Hypotheses.* Use SmoothRepresentationsOfLocalGroups §SR.3.3’s supplied tempered support, specialized and combined with inner-GL induction irreducibility in §2.16, to obtain the standard-data classification without an additional tempered-support hypothesis.

([Alexandru Ioan Badulescu — Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), §3.3, definition of `Q` p.24 and Proposition 3.9 p.25; Proposition 3.11 p.26; §3.4.1 conjecture p.27; [Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.7–2.9 pp.595–596.)

The interface consists of the following operations and identities.

- Take the direct sum of full WD parameters of classical JL transfers of the inner standard blocks.
- A WD class is in the image precisely when every indecomposable block dimension is divisible by `d`.
- Invert each classical block and take the unique inner Langlands quotient.
- The split quotient `Q` of transferred standard data has exactly this WD parameter.

Apply the classical essentially square-integrable bijection and the split full WD block adapter to every inner standard block. Use uniqueness of inner standard data and arithmetic special blocks to prove independence and the inverse image criterion. Relate `Q` only through its defining split standard data. Keep the triangular additive-transfer relation separate from an irreducible quotient claim.

**Checks.**

- For `d=1` the construction agrees with `LLC_WD` on `GL_r(F)`.
- For `r=1,d=2`, the trivial `D×` representation maps to `ω^{−1/2}Sp(2)`, through `St₂`.
- The zero-monodromy sum `ω^{−1/2}⊕ω^{1/2}` has total dimension 2 but two one-dimensional indecomposable blocks, so it is outside the quaternion parameter image.

*Needs:* §10.30; §4.7a; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.2 (shared raw Weil–Deligne fields, special pairs and operations); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length).

### 10.32 Principal-series nontransfer and virtual cancellation

For a nontrivial inner form `d>1` and `n` divisible by `d`, every irreducible generic principal series induced from `n` rank-one characters has a full parameter with `n` one-dimensional, zero-monodromy blocks and hence no corresponding `GL_{n/d}(D)` representation under `LLC_D`. Its irreducible induced standard class has `LJ_D=0`. At a reducibility point only the entire induced standard class is killed; individual irreducible constituents can have nonzero signed transfers. For quaternion `D`, the reducible `GL₂` standard module with constituents `St₂` and 1 has LJ images `+1_{D×}` and `−1_{D×}`. The trivial `GL₂` constituent has no inner parameter although its LJ image is nonzero.

*Hypotheses.* For the first claim the normalized principal series is irreducible; at reducibility use Grothendieck additivity, not an assertion about each constituent.

([Alexandru Ioan Badulescu — Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142), Theorem 3.2 pp.14–16; Proposition 3.3 p.17; [Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.7–2.9 pp.595–596.)

Use the split Langlands data and WD block image criterion. Every rank-one standard block fails divisibility by `d`, so the standard class belongs to `ker LJ_D`. At the `GL₂` reducibility point the classical `St₂` transfer and the exact constituent relation determine the negative trivial-representation image.

**Checks.**

- An assertion that every nonrelevant irreducible has zero LJ fails on trivial `GL₂`.

*Needs:* §10.31; §10.6; §10.26; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.3 (Coefficient change, Ext and local blocks).

### 10.33 Worked classical normalization checks

Compute the following shared regression cases. An unramified `GL₁` character `χ(ϖ)=α` has `N=0, L=(1−αq^{−s})⁻¹`, and conductor 0. For `GL₂`, the trivial representation has `σ_ss=ω^{−1/2}⊕ω^{1/2}, N=0` and `L=(1−q^{−s+1/2})⁻¹(1−q^{−s−1/2})⁻¹`; unitary `St₂` has the same `σ_ss, N` of rank 1, `L=(1−q^{−s−1/2})⁻¹` and conductor 1. For unramified `θ` on the Weil side of an irreducible unramified-quadratic induction, a genuinely non-Frobenius-invariant character must be ramified: an unramified character of `W_E` is invariant and its induction is reducible. For a regular tame character of the residue units of `E`, its irreducible quadratic Weil induction has `N=0`, no inertia invariants, `L=1` and Artin conductor 2; the bijection gives its supercuspidal endpoint. Finally, at residue degree two the connected-height-one harmonic descent coefficient in rank two and `r=1` is `q=p²`, not p.

*Hypotheses.* `E/F` is the unramified quadratic extension and the tame residue character satisfies `θ^q≠θ`; its local character extension to `W_E` is fixed through geometric reciprocity.

([Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf), §2.3–2.4 p.594 and §2.7–2.9 pp.595–596; [Peter Scholze — The Local Langlands correspondence for GL_n over p-adic fields](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 12.3 pp.31–32; Lemma 6.1 p.15.)

Evaluate the imported rank-one Euler factor and arithmetic special block at geometric Frobenius. Use the two Langlands data multisets and `ker N` to compute `GL₂` Euler polynomials and the monodromy conductor term. Use induced Weil restriction on inertia, tame Swan conductor 0 and the degree-two residue cardinality to check the other two boundary calculations; the type classification is imported from SR.4.

**Checks.**

- The tame example requires a noninvariant residue character; unramified quadratic induction of an unramified character is not a supercuspidal example.

*Needs:* §10.30; §10.32; §10.11; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.2 (shared raw Weil–Deligne fields, special pairs and operations); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.4 (The split Iwahori block and nonsplit components).

### Examples

For an unramified character `chi` with `chi(ϖ)=α`, rank-one reciprocity gives `L(s,chi)=(1-α q^(−s))⁻¹`. The trivial `GL₂` representation has `rec_un=1` direct-sum `ω` and unitary-normalized parameter `ω^(−1/2)` direct-sum `ω^(1/2)`, with `N=0`. `St₂` has the same underlying Weil weights but `N` has rank one. Its kernel is the terminal `ω^(1/2)` line, so its `L`-factor has one factor and its conductor is 1, while the trivial representation has conductor 0. At `q=3` the raw matrices `F=diag(1,1/3)` and `N=[[0,0],[1,0]]` satisfy `F N F⁻¹=(1/3)N`, not `3N`.

### Dependencies

§1.3a (supplied global Weil input for endoscopy); `TauCetiRoadmap.ArithmeticGaloisRepresentations` §2.5 (Local factors); `TauCetiRoadmap.ArithmeticGaloisRepresentations` §2.7 (Local constants); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.1 — Tate zeta distributions and Hecke `L`-functions; `TauCetiRoadmap.ClassFieldTheory` Layer 7 (the absolute local Artin map, its normalizations, and conductors); `TauCetiRoadmap.ClassFieldTheory` Layer 9 (the local Weil group); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.10 (Dieudonné classification of `p`-divisible groups); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.1 (Finite flat group schemes and `p`-divisible groups); `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.1 (Cuspidal support and finite length); §4.8; §6.23; §6.27; §6.25; §4.9; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.17 (Isogeny classification of `p`-divisible groups over a perfect field); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` SR.0: the smooth category and its basic API; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.3 (Coefficient change, Ext and local blocks); `TauCetiRoadmap.PELModuli` §M2 (Representability and smooth good models); §9.1; §6.24; `TauCetiRoadmap.PELModuli` §M4 (Canonical models, twists and integral level changes); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.3 (Pairings, canonical lifting, Iwahori invariants and Whittaker functionals); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 — Rankin–Selberg theory and function-field factors; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.2 (Bernstein components and the centre); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, **Archimedean GLₙ parameters**; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.3.4 (The split Iwahori block and nonsplit components); `TauCetiRoadmap.RepresentationTheory.InductionRestriction` Layer 6 (Artin and Brauer induction); `TauCetiRoadmap.ArithmeticGaloisRepresentations` §1 (continuous representations and integral models); `TauCetiRoadmap.RepresentationTheory.InductionRestriction` Layer 5 (Clifford theory over a normal subgroup); `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations); `TauCetiRoadmap.GlobalNumberFields` Layer 9 (Hecke and ray class characters); `TauCetiRoadmap.GlobalNumberFields` Layer 10 (archimedean characters, infinity types, and cyclotomic arithmetic); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.2 (shared raw Weil–Deligne fields, special pairs and operations); Mathlib `Matrix.diagonal`; Mathlib `Matrix.trace`; Mathlib `Matrix.trace_diagonal`; Mathlib `Matrix.charpoly`; `TauCetiRoadmap.ArithmeticGaloisDuality` §R02.4.6 (Grunwald–Wang with its exact dyadic obstruction); `TauCetiRoadmap.ClassFieldTheory` Layer 11 (global reciprocity); `TauCetiRoadmap.RepresentationTheory.InductionRestriction` Layer 6 (the virtual-character ring, Artin and Brauer induction); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.2 — Godement–Jacquet standard functions; §7.6; Tau Ceti `TauCeti.ExactK0`, `TauCeti.ExactK0.of_conflation`, `TauCeti.ExactK0.map`, `TauCeti.ExactK0.lift`.

## Layer 11: local unitary packets and global classification

The prerequisite chain is §11.0a for the weighted fundamental lemma, §§11.0b–11.0c for the local and global weighted stabilization, then §§11.0d–11.0e for the quasi-split unitary classification, and §§11.0f–11.0h for the analytic inputs of the rank-four transfers and the separate symplectic classification. These packet statements occur after the full GL local correspondence. Tempered and positive-exponent extended local unitary packets must be distinguished before forming the generic global multiplicity formula. `GSp₄` transfer uses the separate `Sp₄/SO₅` classification chain and the weighted stabilization constructed in §11.0c from §§11.0a–11.0b.

### 11.0a Weighted orbital terms and the weighted fundamental lemma

For a characteristic-zero nonarchimedean field `F`, fix a connected reductive group, a twisted space `(G̃,ω)`, a Levi space `M̃`, compatible quotient Haar measures and a measure on the real vector space `a_M̃^G̃`. Extend the weighted orbital integrals of AutomorphicSpectralTheory AS.6.10 to these twisted data. Define the weight by the volume of the convex hull of the parabolic Iwasawa projections, and the invariant distribution by subtraction over proper Levi spaces. Construct the stable and endoscopic weighted distributions by induction on Levi dimension and endoscopic dimension, retaining the auxiliary data, component factors and transfer factors of Layers 1–2. Their source is the geometric orbital-distribution space of the Levi and their target is the dual of the test-function space on `G̃(F)`; a weighted distribution is not a new ordinary orbital integral. (Waldspurger, arXiv:1401.7127v1, §§1–3 and §§4.1–4.3.)

The interface includes the following facts.

- Weights and weighted distributions obey parabolic descent, splitting under products, simultaneous conjugation of the Levi and auxiliary data, and the prescribed Haar scaling; the zero-dimensional weight for `M̃=G̃` is 1.
- Invariantization subtracts the already constructed proper-Levi terms to give invariant test distributions; the original weighted orbital integrals are not asserted to be invariant under arbitrary conjugation of the test alone. Stable invariantization and endoscopic transfer use the same Levi indices and normalizations.
- Spherical weighted distributions are independent of auxiliary extensions after transport, and extend from strongly regular support to geometric distributions by the weighted germ expansion.

The weighted fundamental lemma is the following family of identities, under Waldspurger's unramified hypotheses: `(G̃,ω,K̃)` is unramified with a hyperspecial space `K̃`, and the residue characteristic `p` of `F` satisfies `p > N(G)e_F + 1`, where `e_F` is the absolute ramification index of `F` and `N(G) = sup(ψ(rank G), dim G)`, with `ψ(n)` the largest integer `d ≥ 1` whose Euler totient is at most `n` (Waldspurger 2008, §4.3, p. 48; Stabilisation I, §6.1, hypothesis (Hyp), p. 130). For every Levi `M̃` in good position relative to `K`, every elliptic unramified endoscopic datum `M′` of `M̃` and every stable geometric distribution `δ′` on `M′`, prove `r_M̃^{G̃,E}(M′,δ′,K̃)=r_M̃^{G̃}(transfer(δ′),K̃)`. The left side is the sum of stable weighted terms indexed by the extensions of `M′` to endoscopic data of `G̃`, with the coefficients of Waldspurger §4.3, equation (1). Include the untwisted specialization and nonsplit unramified groups. This is Stabilisation II, Théorème 4.4 (p. 100), under the standing hypothesis of its §4 (p. 97). For `δ′` with strongly `G̃`-regular semisimple support it is the twisted weighted fundamental lemma in its usual form, and its proof route is §4.10b: reduction to the untwisted weighted Lie-algebra identity and its nonstandard variants, which §4.3b proves in equal characteristic and §4.5a transports to characteristic zero. The passage from strongly regular support to all geometric distributions is the weighted germ expansion (Stabilisation II, §§4.5–4.9, from p. 101). At places whose residue characteristic violates the bound no identity is asserted here; §11.0c places every such place in its finite set V.

*Hypotheses.* `F` nonarchimedean of characteristic 0; `(G̃,ω,K̃)` unramified with a hyperspecial space; `p > N(G)e_F + 1`; `M̃` in good position relative to `K`; `M′` elliptic and unramified.

([J.-L. Waldspurger — Stabilisation de la formule des traces tordue II](https://arxiv.org/abs/1401.7127v1), §4, p. 97, and §4.4, Théorème, pp. 100–101; §§4.5–4.9; [J.-L. Waldspurger — Stabilisation de la formule des traces tordue I : endoscopie tordue sur un corps local](https://webusers.imj-prg.fr/~jean-loup.waldspurger/stabilisationIfinal.pdf), §6.1, p. 130; [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §4.3, p. 48, and §4.4, hypothesis (H1), pp. 48–49.)

**Checks.**

- For `M̃=G̃`, the weight is the volume of a point in dimension zero, namely 1; its spherical identity specializes to unweighted unit transfer. Setting all proper-Levi weights to 1 is not this specialization.
- In a one-dimensional weight space with the chosen lattice of covolume 1, parabolic projections 0 and 1 have convex-hull volume 1, whereas coincident projections 0 and 0 give volume 0. An ordinary orbital weight gives 1 in both cases and cannot replace this construction for a proper Levi.
- With identity endoscopy on a torus and its unit-volume maximal compact, a point distribution at an integral element evaluates the spherical unit to 1 on both sides; outside the compact it evaluates to 0 on both sides. The zero distribution gives 0, but does not prove the universally quantified identity.
- For `G=GL₁` the totient bound gives `ψ(1)=2` (the totients of 1 and 2 are 1, that of 3 is 2), so `N(GL₁)=2` and the hypothesis over `ℚ_p` is `p>3`: the identity is asserted for `p≥5` and not for `p=2,3`. For `G=GL₂`, `ψ(2)=6` and `dim G=4`, so `N(GL₂)=6` and the hypothesis is `p>7` over `ℚ_p` and `p>13` over a quadratic ramified extension. A bound stated with `p∤|W|` alone would admit `p=3` for `GL₂` and is not the hypothesis of the source.

*Needs:* Layers 1–2 (data, transfer, descent and germs); §§4.2, 4.3b, 4.5a, 4.10a and 4.10b (nonstandard, weighted equal-characteristic, weighted change of characteristic, spherical and twisted weighted comparisons); `TauCetiRoadmap.AutomorphicSpectralTheory` AS.6.10 and AS.6.15 (ordinary weighted integrals and invariantization); `TauCetiRoadmap.ReductiveGroupsPartII` §RG2.3.6 (Moy–Prasad lattices).

### 11.0b Local stabilization of weighted orbital integrals

For a local field `F` of characteristic 0, a twisted datum `(G̃,ω)`, a Levi space `M̃` and an elliptic relevant endoscopic datum `M′` of `M̃`, construct the endoscopic weighted distribution `I^{G̃,E}_{M̃}(M′,δ′,f)` from the stable weighted distributions of the endoscopic data of `G̃` extending `M′`, with the coefficients of §11.0a. Prove that for every stable strongly regular distribution `δ′` on `M′` and every test `f` the endoscopic and invariant weighted distributions agree: `I^{G̃,E}_{M̃}(M′,δ′,f)=I^{G̃}_{M̃}(transfer(δ′),f)`, at nonarchimedean places and at real places. Construct the difference of the two sides as a cuspidal error distribution `ε_M̃`, prove its scalar transfer formula, the global zero-sum relation obtained by globalizing at two places, and its vanishing by comparison of the real and imaginary scalar parts together with induction on proper Levi spaces. (Mœglin–Waldspurger, arXiv:1412.2981v1, §3, pp. 8–37, and §§7.1–7.7, pp. 88–106; the statements are recorded as the local inputs of Mœglin–Waldspurger VI, §§4.6–4.7, pp. 85–86.)

*Hypotheses.* `F` local of characteristic 0; `(G̃,ω)` with the normalizations of Layers 1–2; `M′` elliptic and relevant; `δ′` with strongly regular support, extended to geometric distributions by the germ expansion of §11.0a.

**Checks.**

- For `M̃=G̃` the identity is the ordinary transfer identity of §§2.14 and 4.10, with no weight.
- For a torus with identity twist the only Levi is the torus itself and the only datum is principal, so the identity is `I(f)=I(f)`; at the zero test both sides are 0.
- At a nonarchimedean place of residue characteristic 2 the identity is asserted for every test `f`, with no spherical restriction and no residue-characteristic bound: the local stabilization, unlike §11.0a, is not an unramified statement.

*Needs:* §11.0a (weighted distributions and their germ expansions); §§1.2–1.15 (globalization invariants and product factors); §§2.14–2.16 and 4.10 (local transfer and characters); `TauCetiRoadmap.AutomorphicSpectralTheory` AS.6.10 and AS.6.15.

### 11.0c Global weighted geometric and spectral stabilization

For a number field `F` and a global twisted reductive datum `(G̃,ω)` with the normalizations of Layers 1–2, let `V_ram` be the smallest finite set of places containing the archimedean places and every place at which `G` or `ω` is ramified, `G̃` has no hyperspecial space, or the residue characteristic `p` fails `p>5` and `p>N(G)e_v+1` (Mœglin–Waldspurger VI, §1.1, p. 3). Construct the twisted invariant trace distributions and their stable endoscopic counterparts, including all proper-Levi geometric and spectral terms. For every finite `V ⊇ V_ram` and every admissible test `f=f_V 1_{K̃^V}` (smooth and compactly supported modulo the fixed split centre, with the archimedean finiteness conditions of the trace formula), prove `I^{G̃}(ω,f)=Σ_{G′} i(G̃,G′) SI^{G′}(f^{G′})`: the geometric identity (Mœglin–Waldspurger VI, §5.10, pp. 96–97, proved in Mœglin–Waldspurger X, §8.6, p. 113) and the corresponding discrete spectral identity, also after fixing the infinitesimal character and the spherical character outside `V`, summing over their preimages on each endoscopic group (Mœglin–Waldspurger X, Introduction equations (1)–(3), pp. 1–3, §§4.5–4.9, pp. 61–69, and §§8.1, 8.5–8.6, pp. 106–113). The weighted fundamental lemma of §11.0a enters only at the places outside `V`, where `f` is the hyperspecial unit; the places in `V`, including every place of small residue characteristic, contribute through the local stabilization of §11.0b. The untwisted specialization supplies the stabilization for unitary inner forms.

Construct weighted spectral transfer by normalized intertwining and meromorphic continuation, and use the refined geometric and spectral expansions to obtain the displayed identity. These are targets for the full weighted trace spaces; the simple comparison in §6.25 is only a specialization with vanishing geometric Levi terms.

*Hypotheses.* `F` a number field; `V ⊇ V_ram` finite; `f` admissible and a hyperspecial unit outside V.

**Checks.**

- For a torus with identity twist, there is one Levi and one principal endoscopic datum with coefficient 1, so the formula is `I(f)=I(f)`; at the zero test both sides are 0.
- For a proper Levi whose weight projections are 0 and 1 in the normalized rank-one coordinate of §11.0a, the underlying weighted term uses weight 1. For projections 0 and 0 it uses weight 0; invariantization must retain the recursive corrections, and a simple-trace replacement deletes this distinction.
- If two endoscopic spectral characters map to the same fixed character outside `V`, their contributions with traces 2 and 3 add to 5. Keeping only one preimage gives 2 or 3 and fails the refined identity's indexing.
- For `G̃=GL₄⋊θ` over `ℚ` and the Levi space of type `GL₂×GL₂`, the place `2` lies in `V_ram` because `2≤5`; the weighted term of this Levi at `2` is part of the local distribution of `f_V` and is stabilized by §11.0b, and §11.0a is not invoked there. A stabilization that applied §11.0a at `2` would use an identity this roadmap does not assert. For `GL₄` over `ℚ`, `ψ(4)=12` (the totient of 12 is 4 and every larger integer has totient above 4) and `dim GL₄=16`, so `N(GL₄)=16` and `V_ram` contains every prime `p≤17`; at a prime `p≥19` where `G̃` is unramified the term is the hyperspecial unit and §11.0a applies.

*Needs:* §11.0a (weighted identities outside `V`); §11.0b (local stabilization inside `V`); §§1.2–1.15 (globalization invariants and product factors); §§2.14–2.16 and 4.10a (local transfer and characters); `TauCetiRoadmap.AutomorphicSpectralTheory` AS.6.6 and AS.6.12–AS.6.16 (trace expansions and invariantization); §§5.1–5.2 (spectral labels and normalization).

### 11.0d Quasi-split unitary local classification

For every quadratic extension of characteristic-zero local fields and every rank `N≥1`, construct the quasi-split unitary local Arthur packet multisets, their component-character pairings and stable distributions in Mok's Whittaker normalization. Prove the twisted GL character identity, the ordinary endoscopic character identity and the normalized local intertwining relation. For bounded `L`-parameters the packet is a multiplicity-free tempered set, the pairing is injective, and at nonarchimedean places it is bijective; these packets partition the tempered dual. Include the extended positive-exponent local parameters needed for localization. (Mok, Theorem 2.5.1, pp. 32–33; local transfer of test functions §3.1, pp. 39–44; characterization of the local classification §3.2, pp. 45–49; normalization of intertwining operators §3.3, pp. 50–66; the local intertwining relation §§3.4–3.5, pp. 67–83; proofs for tempered parameters in §7, pp. 188–228, and for nontempered parameters in §8, pp. 229–244.)

The route is the simultaneous induction on `N` of §§11.0d–11.0e: the local theorems for rank `N` are proved by globalization, the stable twisted GL comparison of §11.0c and the global multiplicity formula for lower ranks. The rank-one base is §1.2a, and GL local parameters use Layer 10. No inner-form unitary theorem from §§11.2–11.4 is an input to this quasi-split construction.

The interface includes component pairings, stable distributions and their transfer identities, and normalized self-intertwining operators with the identity and composition laws, all compatible with the fixed Whittaker datum and auxiliary character.

**Checks.**

- At rank one, local torus reciprocity gives a singleton and component pairing 1; the identity Weyl element has normalized intertwiner 1. Multiplication of that operator by `−1` fails this normalization.
- For the identity inner twist `G=G*`, the input of §11.2 is this construction. At a split quadratic algebra the rank-`N` packet is the singleton supplied by GL local Langlands, not a choice of a cyclic base-change fibre.
- A bounded parameter whose packet were assigned a representation twice would contradict multiplicity-freeness; the nontempered packets of §8 of the source may have multiplicities and are not asserted multiplicity-free.

*Needs:* §§11.0a–11.0c; §1.2a; Layers 5 and 10; §§6.3–6.8 (unitary embeddings and character normalizations); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (normalized induction and Jacquet functors).

### 11.0e Quasi-split unitary global classification

Over a quadratic extension of number fields, define discrete global parameters by conjugate-self-dual unitary cuspidal GL constituents and algebraic `SL₂` factors with total dimension `N`, the prescribed sign and distinct pairs. Construct localization, the product pairing and the epsilon character. Prove that the discrete spectrum is the sum of the global packet multisets selected by equality of the product pairing with the epsilon character; for generic parameters this gives multiplicity one. (Mok, Theorem 2.5.2 and Remark 2.5.3, pp. 34–35; stabilized trace formulas §4, pp. 84–99; the standard model and the global intertwining relation §5, pp. 100–148; the critical cases §6, pp. 149–187; completion of the induction §9, pp. 245–268.)

This is the global half of the simultaneous induction of §11.0d, using the stabilization of §11.0c for the twisted general linear group and for the unitary groups of rank at most `N`, with the weighted fundamental lemma of §11.0a at the places outside V. This produces the unitary classification contract used in §§11.2–11.4, with the global discrete-spectrum decomposition on the supplied automorphic carrier.

**Checks.**

- For a generic global parameter with trivial component group, the character condition is `1=1` and gives multiplicity 1. For component group `C₂`, a product pairing of `−1` on its generator and epsilon character `+1` gives multiplicity 0.
- A global parameter with two equal cuspidal constituents is not discrete; it is excluded by the distinct-pairs condition, and the theorem asserts nothing about it.
- The finite set `V` of §11.0c may be enlarged without changing the discrete spectrum; the multiplicity formula is independent of the choice of `V ⊇ V_ram`.

*Needs:* §11.0d; §§11.0a–11.0c; Layers 5 and 10; `TauCetiRoadmap.AutomorphicSpectralTheory` AS.4 (automorphic spectrum).

### 11.0f Analytic inputs for the rank-four transfers

Construct the following `L`-functions and local factors with the stated analytic properties.

Exterior-square inputs. Let `π` be a unitary cuspidal representation of `GL₄(𝔸_F)` and `σ` a unitary cuspidal representation of `GL_m(𝔸_F)`, `m=1,2,3,4`. Define `L(s,σ⊗π,ρ_m⊗∧²ρ₄)` and the local `γ`-factors by the Langlands–Shahidi method for the maximal Levi subgroup of the split spin group `Spin(2m+6)` whose derived group is `SL_m×SL₄` (Kim §3, pp. 149–152). Prove: the normalized local intertwining operators are holomorphic and nonzero for `Re s ≥ 1/2` at every place (Kim Proposition 3.1, p. 149, whose rank-one `D_{n−3}` case is Asgari's local theorem); for a Hecke character `χ` highly ramified at a nonempty set `S` of finite places and `σ` unramified outside `S`, the twisted `L`-function `L(s,(σ⊗χ)⊗π,ρ_m⊗∧²ρ₄)` is entire (Kim Proposition 3.4, p. 150) and bounded in vertical strips (Kim Theorem 3.5, p. 151, from Gelbart–Shahidi Theorem 4.1 under Proposition 3.1); the second constant-term factor `L(s,σ,∧²⊗ω²)` has no zero on `Re s ≥ 1` (Kim, proof of Proposition 3.4); the partial twisted exterior-square `L`-function `L^S(s,χ⊗π,ρ₁⊗∧²ρ₄)` is holomorphic for `Re s>1` and has a pole at `s=1` exactly when `χ²ω_π=1` and the Jacquet–Shalika period is nonzero (Kim Proposition 3.9, pp. 151–152, from Jacquet–Shalika's exterior-square integral). At a place where `π_v` is not supercuspidal, prove that the Langlands–Shahidi `γ`- and `L`-factors agree with the Artin factors of `∧²` of the Langlands parameter by multiplicativity (Kim Propositions 2.4–2.6 and §5.2); at the remaining places `v∣2,3` with `π_v` supercuspidal, prove the same agreement by Henniart's characterization of the exterior-square local factors (Henniart 2009, pp. 33–45, cited by locator).

Triple-product inputs. For unitary cuspidal `σ,π₁,π₂` of `GL₂(𝔸_F)`, define `L(s,σ×π₁×π₂)` by the Langlands–Shahidi method for the Levi `GL₂×GL₂×GL₂` of the simply connected group of type `D₄`, prove its continuation and functional equation, holomorphy after highly ramified twist and boundedness in vertical strips (Gelbart–Shahidi, Corollary 1, p. 80, and Corollary 4.4; Kim–Shahidi 2002, cited by locator), and the agreement of its local factors with the Rankin–Selberg `GL₂×GL₄` factors of `σ×(π₁⊠π₂)` at every place where `π_{1,v}` and `π_{2,v}` are not both supercuspidal (Kim Lemma 5.1.1, p. 168). The integral-representation form of the same `L`-function through Garrett's integral with Ikeda's local factors, and boundedness through Arthur truncation, is Ramakrishnan's route (Ramakrishnan §§3.3–3.4) and is not a second target.

Restriction input. For `G ⊂ G′` connected reductive over `F` with `G′ = G·Z` for a central torus `Z` of `G′` (the pairs `Sp₄ ⊂ GSpin₅` and `GSpin₄^α ⊂ Res_{E/F}GL₂`), prove that every discrete automorphic representation of `G` is a subrepresentation of the automorphic restriction of a discrete automorphic representation of `G′`, with Satake parameters related by the dual map at almost all places (Gee–Taïbi, Lemma 5.1.1 and Theorem 5.1.2, pp. 502–503, from Hiraga–Saito Theorem 4.14, cited by locator).

*Hypotheses.* `F` a number field; all representations unitary cuspidal (discrete for the restriction input); the Langlands–Shahidi normalizations of AutomorphicSpectralTheory's Eisenstein series and intertwining operators.

([H. H. Kim — Functoriality for the exterior square of GL₄ and the symmetric fourth of GL₂](https://www.ams.org/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf), §3, pp. 149–152, Propositions 3.1, 3.4, 3.9 and Theorem 3.5; §5.1, Lemma 5.1.1, p. 168; §5.2; [S. Gelbart and F. Shahidi — Boundedness of automorphic L-functions in vertical strips](https://www.ams.org/journals/jams/2001-14-01/S0894-0347-00-00351-9/S0894-0347-00-00351-9.pdf), Theorem 4.1 and Corollaries 1–2, pp. 79–80; [D. Ramakrishnan — Modularity of the Rankin–Selberg L-series, and multiplicity one for SL(2)](https://arxiv.org/abs/math/0007203v1), §§3.3–3.4; [T. Gee and O. Taïbi — Arthur’s multiplicity formula for GSp4 and restriction to Sp4](https://www.numdam.org/item/10.5802/jep.99.pdf), §5.1, pp. 502–503.)

**Checks.**

- For `m=1` and `π` with Satake roots `a,b,c,d` at an unramified place, the local factor of `L(s,χ⊗π,ρ₁⊗∧²ρ₄)` is the product over the six roots `ab,…,cd` of `(1−χ(ϖ)·r·q^{−s})⁻¹`; a definition with four roots or with the symmetric square's ten roots is wrong.
- For `π` the automorphic induction of a character of a quartic extension, `∧²π` contains a one-dimensional constituent exactly when the pole criterion of Proposition 3.9 holds; the pole criterion is not a cuspidality criterion for `∧²π`.
- For the triple product with `σ` a character, `L(s,σ×π₁×π₂)` is the `GL₂×GL₂` Rankin–Selberg `L`-function twisted by `σ`, supplied by AL.3; the `D₄` construction must agree with it.
- For `Sp₄ ⊂ GSpin₅` with `Z` the centre `GL₁`, the restriction of a discrete representation of `GSpin₅` is a finite direct sum of discrete representations of `Sp₄`; the trivial representation of `Sp₄` restricts from the characters of `GSpin₅`, not only from the trivial one.

*Needs:* `TauCetiRoadmap.AutomorphicSpectralTheory` AS.1.2–AS.1.15a (Eisenstein series, constant terms, intertwining operators and their continuation) and AS.4 (automorphic spectrum); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 (Rankin–Selberg factors and functional equations) and AL.3.9.5–AL.3.9.6 (converse theorems); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (normalized induction); Layer 10 (GL local parameters).

### 11.0g Symplectic and orthogonal local classification

Independently of §§11.0d–11.0e, for a characteristic-zero local field and a split symplectic or quasi-split special orthogonal group `G`, construct the local Arthur packets `Π̃_ψ` over the unitary dual modulo the outer automorphism for even orthogonal groups, their pairings with the component group `S_ψ`, and the stable linear form `f↦f^G(ψ)` characterized by the twisted transfer from the twisted general linear group. Prove the endoscopic character relation defining the packets and pairings, the tempered and multiplicity-free property of the packets of bounded parameters with injective (and, at `p`-adic places, bijective) pairing, the partition of the tempered dual, and the normalized local intertwining relation. Retain the outer-automorphism quotient for even orthogonal groups. (Arthur, TIFR survey, Theorem 1, p. 4, and Theorem 1′, pp. 11–12, identified there with the book's Theorems 1.5.1 and 2.2.1; the book's local chapters 6–7 prove them, cited by locator.)

The route is Arthur's simultaneous induction, parallel to §§11.0d–11.0e, using the stabilization of §11.0c for the twisted general linear group and the classical groups of lower rank, with the weighted fundamental lemma of §11.0a outside V.

**Checks.**

- The identity Weyl element has intertwiner 1 in the symplectic construction. A unitary pairing carries no assertion about this operator or about the even-orthogonal outer quotient.
- For `Sp₂=SL₂` and a bounded parameter with component group `C₂`, the packet has two elements at a `p`-adic place and the pairing is a bijection onto the two characters of `C₂`; at a real place the pairing may be only injective.
- For an even orthogonal group the packet is a set of orbits under the outer automorphism; a construction that chose one representation in each orbit would carry data the theorem does not assert.

*Needs:* §§11.0a–11.0c; Layers 5 and 10; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2.

### 11.0h Symplectic and orthogonal global classification and the rank-four transfers

For a number field and `G` as in §11.0g, use formal global parameters built from self-dual cuspidal GL constituents and algebraic `SL₂` factors, not a hypothetical global Langlands group, and prove the global discrete multiplicity formula: the discrete spectrum is the sum over discrete parameters `ψ` and over the packet members whose pairing equals the epsilon character `ε_ψ`, with Arthur's multiplicity coefficient `m_ψ ∈ {1,2}`, the value 2 occurring only for even orthogonal groups. (Arthur, TIFR survey, Theorem 2, p. 7, identified there with the book's Theorem 1.5.2, and p. 5 for the replacement of the hypothetical global group by formal cuspidal data; the book's global chapter 8 proves it, cited by locator.) This is the global half of the induction of §11.0g and supplies the `Sp₄/SO₅` classification used by §11.1.

Construct, for unitary cuspidal GL inputs over a number field, the exterior-square transfer `GL₄→GL₆`, the weak tensor transfer `GL₂×GL₂→GL₄` and the weak quadratic Asai identification. The exterior-square transfer is Kim's: apply the converse theorem with `GL_m`-twists, `m≤2`, to the candidate `⊗_v ∧²π_v`, using the entire, bounded and functionally equivalent twisted `L`-functions of §11.0f, obtain the isobaric decomposition of Kim Theorem 5.3.1 with unitary cuspidal constituents, and complete the local compatibility at every place by the local-factor agreement of §11.0f. The weak tensor transfer is Ramakrishnan's Theorem M in the weak sense, by the converse theorem with the triple-product `L`-functions of §11.0f, extended to discrete `GL₂` inputs as in Gee–Taïbi §6.1. The Asai identification is Gee–Taïbi Proposition 6.1.3(2): for `χ`-self-dual cuspidal `Π` with `ω_Π ≠ χ²`, the stabilization of §11.0c for the twisted `GL₄` datum locates the contribution of `Π` on the stable spectrum of the quasi-split `GSpin₄^α`, and the restriction input of §11.0f for `GSpin₄^α ⊂ Res_{E/F}GL₂` identifies its Satake parameters with the Asai parameters of a cuspidal representation of `GL₂(𝔸_E)`; no strong Asai transfer is constructed or used. Retain both Asai signs as a choice of embedding: they differ by the quadratic character, so their exterior squares agree. The adjoint `GL₂` lift is supplied by GL2AutomorphicRepresentationsAndTransfer §R17.4.13. (Gee–Taïbi, §6.1, pp. 503–508; Kim, Theorem 5.3.1, p. 177; Henniart, pp. 33–45; Ramakrishnan, Theorem M, p. 54; Asgari–Raghuram, §2.2, pp. 4–5, for the identification of the `GSpin*(4)` transfer with the Asai homomorphism.)

The interface retains parameter compatibility in the place ranges just specified, the similitude character and the isobaric decompositions. Together with the local classification of §11.0g it constructs the symplectic classification contract of §11.1; no unitary packet theorem supplies it.

**Checks.**

- As a check of the parameter operation, for Frobenius roots `1,2,3,4`, the exterior-square roots are `2,3,4,6,8,12`; their product is `24³=13824`, agreeing with `det(∧²r)=det(r)³`. Four roots or a square instead of a cube fail; these roots are not asserted to arise from a unitary cuspidal global input.
- For two rank-two parameters with roots `1,2` and `3,5`, tensor transfer has roots `3,5,6,10` and determinant 900, equal to `2²·15²`. At a split quadratic place the Asai parameter operation is this tensor product, also of dimension 4; this is an algebraic check before imposing global cuspidality or unitarity.
- For the four-dimensional trivial symplectic representation with multiplier 1, `∧²` has dimension 6 and the invariant symplectic line has dimension 1; the orthogonal quotient has dimension 5. This representation-level check is not a cuspidal global input to §11.1.
- For split `SO₄` and a parameter that is the sum of two distinct two-dimensional symplectic constituents, `m_ψ=2`, because the group is of type `D₂` and both constituent degrees are even; the sum of a three-dimensional and a one-dimensional constituent for `SO₄` has `m_ψ=1`, and for `Sp₄` every `m_ψ` is 1. A formula with `m_ψ=1` throughout is wrong for even orthogonal groups.

*Needs:* §11.0g; §§11.0a–11.0c; §11.0f (analytic inputs and the restriction theorem); Layers 5 and 10; `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer` §R17.4.13 (adjoint lift); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 (Rankin–Selberg factors) and AL.3.9.5–AL.3.9.6 (converse theorems); `TauCetiRoadmap.AutomorphicSpectralTheory` AS.4 and AS.6 (spectrum and invariant trace formula).

### 11.1 Transfer between `GSp_4` and `GL_4` for general-type representations

Let `F` be a number field, `Π` a cuspidal automorphic representation of `GL₄(𝔸_F)` and `χ : 𝔸_F^×/F^× → ℂ^×` unitary with `Π ≅ Π^∨ ⊗ (χ∘det)`. Exactly one of `L^S(s, Π, ∧² ⊗ χ⁻¹)` and `L^S(s, Π, Sym² ⊗ χ⁻¹)` has a pole at `s = 1`; in the first (symplectic) case `Π` descends to a discrete automorphic representation `π` of `GSp₄(𝔸_F)` with central character `χ`, and in the second to a discrete representation of the quasi-split quadratic form `GSpin₄^α` prescribed by its orthogonal parameter. A discrete `π` of `GSp₄` arising this way is of general type; it is cuspidal and stable, every `π′` with `π′_v` in the `L`-packet of `π_v` for all `v` is automorphic and occurs with multiplicity one, the `L`-parameter of `π_v` composed with `GSp₄ ⊂ GL₄` is `rec(Π_v)`, and if `π` is algebraic then `Π` is algebraic (the forward implication stated in BCGP §1.8.22).

*Hypotheses.* Use the symplectic classification contract of §§11.0g–11.0h, with the fixed normalizations. `Π` and `χ` unitary with `Π` cuspidal, as in Gee–Taïbi Proposition 6.1.7. The `GSp₄` classification and multiplicity consequences use its `Sp₄/SO₅` classification, local intertwining and twisted stabilization chain, built on the weighted fundamental lemma of §11.0a at the places outside the finite set `V` of §11.0c. The contract includes Kim’s unitary isobaric exterior-square transfer, its Henniart local completion, the weak tensor transfer and the weak Asai identification for the orthogonal alternative. The ordinary spherical twisted fundamental lemma is not the weighted assertion.

([T. Gee and O. Taïbi — Arthur’s multiplicity formula for GSp4 and restriction to Sp4](https://www.numdam.org/item/10.5802/jep.99.pdf), Proposition 6.1.7 and Remark 6.1.8 pp. 507–508; Theorem 7.4.1 pp. 512–514; introduction p. 472; [G. Boxer, F. Calegari, T. Gee and V. Pilloni — Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.8.22, p. 15; [G. Boxer, F. Calegari, T. Gee and V. Pilloni — Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.6, p. 8.)

Gee–Taïbi §6.1, pp. 503–508, uses the weak tensor transfer and the Asai identification of §11.0h and the adjoint lift of GL2AutomorphicRepresentationsAndTransfer §R17.4.13. Proposition 6.1.7(2)`(b)` applies Kim Theorem 5.3.1 to realize `∧²Π⊗χ⁻¹` as a unitary isobaric sum; the remaining standard factor has no zero at 1 by AL.3’s unitary nonvanishing. Its pole argument uses the twisted spectral comparison and the orthogonal/symplectic pole dichotomy to isolate the unique GSpin endoscopic group. The symplectic form is `GSpin₅≃GSp₄`; the orthogonal form is quasi-split `GSpin₄^α`, not an arbitrary inner form of split `GSpin₄`. Remark 6.1.8 gives the trivial global component group for the general-type parameter. Theorem 7.4.1 pp. 512–514 applies the `Sp₄/SO₅` local/global classification, restriction of packets and strong multiplicity-one comparison to prove the general-type multiplicity and local-parameter assertions. The weighted stabilization of §11.0c enters the `Sp₄/SO₅` classification of §§11.0g–11.0h used in Theorem 7.4.1; packet restriction and the pole dichotomy are applied within that chain. BCGP §1.8.22 supplies the forward algebraicity implication.

**Checks.**

- For a non-CM holomorphic cuspidal `GL₂` form of weight at least two whose symmetric cube is cuspidal, `Sym³` of its two-dimensional parameter preserves an alternating form up to `det³`, giving the symplectic case.
- If `Π` is an isobaric sum the representation is not of general type.
- The orthogonal alternative is not a `GSp₄` representation: it goes through `GSpin₄`.

*Needs:* the symplectic classification contract (§§11.0g–11.0h); `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer` §R17.4.13 (adjoint lift); `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 — Rankin–Selberg theory and function-field factors.

### 11.2 Tempered local unitary packets with inner-twist pairings

For a local field of characteristic zero, a quasi-split unitary group `G*`, an extended pure inner twist `(G,ξ,z)`, and a bounded local `L`-parameter `φ` (Arthur `SL₂` trivial), KMSW Theorem* 1.6.1 gives a finite relevant packet `Π_φ(G,ξ)` and pairing into `Irr(S_φ♮,χ_z)`. It is empty if `φ` is irrelevant. Packet members are tempered, the pairing is injective, and at nonarchimedean places it is a bijection to the prescribed component characters. At real places the bijection is over the specified union of pure inner forms, not necessarily on a single form. The packet is independent of `z` while its pairing uses `z`. The normalized endoscopic character identity includes `e(G)` and evaluation at `s_e s_φ`, with transfer factors normalized by `(ξ,z)`. When `E=F×F`, the actual group is an inner form `GL_m(D)` with `N=m·deg(D)`. A relevant parameter has a singleton on this group, given by §10.31 at nonarchimedean places and KMSW §1.6.3 at archimedean places. It is the split `GL_N` singleton when the inner form is split, in particular for an ordinary pure inner twist of split `GL_N`.

*Hypotheses.* Use the unitary classification contract of §§11.0d–11.0e, with the fixed normalizations. Bounded `L`-parameters only, in the generic case of KMSW v1 Theorem* 1.6.1(5). Sections 11.0a–11.0e construct the Mok and weighted-stabilization inputs; the weighted fundamental lemma of §11.0a enters only outside the finite set `V` of §11.0c, as KMSW Introduction p. 6 records. Use the chosen Whittaker normalization and extended pure inner twist. At a split quadratic algebra require relevance for the actual `GL_m(D)`: each discrete parameter block has dimension divisible by `deg(D)` (KMSW §1.6.3). The split `GL_N` parameters are those of the local Langlands correspondence for `GL_N`: §10.30 at non-archimedean places and AutomorphicLFunctionsAndLocalFactors, **Representation prerequisites**, **Archimedean GLₙ parameters**, at real and complex places, with the normalization of §10.22.

([T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White — Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.1 Theorem* 1.6.1 pp. 79–80; Proposition 1.6.2 p. 81; §1.6.3, Theorem 1.6.4 and the relevant singleton construction, pp. 81–85.)

Use the local classification and normalized endoscopic identity of KMSW §1.6.1; relevance and the central character `χ_z` determine which inner form receives each member. Use the injectivity/bijection clauses with their field-dependent scope. Proposition 1.6.2 transports a change of `z` without claiming that its pairing is unchanged. The proof passes through quasi-split classification and normalized local intertwining relations. Use the normalized local intertwining relation to identify the stable character distribution and its component-group pairing; elliptic endoscopic descent determines the discrete packets, and normalized parabolic induction determines the non-discrete packets. Retain the conditional scope stated in KMSW for the intertwining and global classification inputs.

**Checks.**

- An irrelevant parameter gives the empty packet on that form.
- At a split place the relevant packet is a singleton on its actual `GL_m(D)`. For a quaternion division algebra, `N=2` and the bounded parameter of unitary `St₂` (Deligne `SL₂` standard, Arthur `SL₂` trivial) gives `{1_D×}` on `D×` and `{St₂}` on split `GL₂`.
- For an ordinary pure inner twist at a split place, Hilbert 90 makes the group split and the singleton is on `GL_N`; an independently chosen cyclic GL base-change fibre is not a unitary packet.
- A real packet can be smaller than the full component-character set on one inner form; surjectivity is over the prescribed union.

*Needs:* §11.0c; §1.8; §2.7; §4.10a; §10.30; §10.31; `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations).

### 11.3 Extended local unitary packets by positive-exponent induction

For `ψ∈Ψ⁺(G*)` write the KMSW §1.6.4 decomposition `ψ=ψ_M·φ_λ` with `ψ_M` bounded on a relevant Levi `M*` and `λ` in the positive chamber, giving an unramified character `χ_λ`. If the Levi datum is irrelevant for `G`, set `Π_ψ(G,ξ)=∅`. Otherwise transfer the extended pure inner twist to `M` and set `Π_ψ(G,ξ)={I_P(π_M⊗χ_λ): π_M∈Π_ψM(M,ξ_M)}`. Transport the pairing by `Irr(S_ψ♮,χ_z)=Irr(S_ψM♮,χ_zM)`, using KMSW (1.6.3)–(1.6.4). These induced admissible representations may be reducible or nonunitary for a general `Ψ⁺` parameter. Do not replace them by irreducible Langlands quotients without an additional theorem. For `λ=0` and tempered `ψ` this recovers the tempered packet. Retain Weyl-conjugacy independence and the choice-sensitive pairing.

*Hypotheses.* Use the unitary classification contract of §§11.0d–11.0e, with the fixed normalizations. In the generic global localization used here the bounded Levi packet is a tempered `L`-packet. A general nongeneric bounded Arthur parameter would require the broader bounded packet theorem, which is not specified here. Normalize parabolic induction and `χ_λ` as in KMSW; the inner twist must be relevant for that Levi.

([T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White — Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.4 pp. 86–87, equations (1.6.3)–(1.6.4); Remark 1.7.2 p. 89.)

The interface consists of the following operations and identities.

- Store `ψ`, its relevant positive-exponent Levi decomposition, the induced members and transported component pairing.
- An irrelevant Levi decomposition gives no members.
- At `λ=0` for a bounded `L`-parameter the construction is the tempered packet.
- Members are the normalized induced representations `I_P(π_M⊗χ_λ)`, not silently their Langlands quotients.
- The component pairing is transported through KMSW (1.6.3)–(1.6.4) and retains the `χ_z` restriction.
- Weyl-conjugate decompositions give canonically identified induced packets and transported pairings.
- At `E=F×F`, use the relevant bounded packets on Levi factors of the actual `GL_m(D)`, with the inner-form parameter interface of §10.31 when `F` is nonarchimedean and KMSW §1.6.3 otherwise, then the same positive-exponent induction. For a split form this specializes to `GL_N`; the output remains the induced module specified above.

Separate positive real exponents from the bounded parameter and use the relevant Levi decomposition in KMSW §1.6.4. Construct normalized induction from each bounded Levi packet member and transport its component-character pairing through (1.6.3)–(1.6.4). Record these as actual induced modules, preserving possible reducibility. Weyl reordering of the linear factors and the canonical induced representation identifications give independence of the representative decomposition. A change of `z` transports the pairing via the central character, not literal equality of pairings.

**Checks.**

- Zero exponents recover the bounded packet.
- A Levi incompatible with the chosen inner form contributes no member.
- At a reducibility point the induced module is retained; its quotient alone is not the constructed object.
- Permuting conjugate linear Levi blocks transports to the same normalized induced representation.

*Needs:* §11.2; §10.31; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations); §1.8.

### 11.4 Endoscopic classification of unitary groups for generic parameters

Let `U` be a pure inner form of a unitary group for a CM extension `F/F⁺`, with its inner twist and local normalization fixed. For a generic global parameter `ψ=⊞_i Π_i`, with distinct cuspidal conjugate self-dual constituents of the prescribed parity and total `rank N`, KMSW Theorem* 1.7.1 supplies the `ψ`-part of the discrete spectrum: it is the direct sum of global packet members whose product pairing restricted to `S_ψ` equals `ε_ψ`, with multiplicity one, and `ε_ψ=1` for generic `ψ`. This conditional theorem uses the unitary classification contract (§§11.0d–11.0e) and the generic pure-inner argument of KMSW v1 (Introduction p. 6); its scope excludes the full nongeneric assertion. Tempered local parameters have the relevant packets and inner-twist pairings of Theorem* 1.6.1; general localizations of a generic global parameter require the extended packet construction and are not asserted tempered. In particular, unitary local base change is defined by the unitary `L`-embedding and twisted endoscopy, not by cyclic `GL_n` base change.

*Hypotheses.* Use the unitary classification contract of §§11.0d–11.0e, with the fixed normalizations. Generic global parameter and pure inner twist; do not include the nongeneric or arbitrary-inner assertion beyond the scope proved in KMSW v1 pp. 88–89. Local pairings depend on the chosen extended pure inner twist; at real places the component-character bijection uses the union over the pure inner forms specified in Theorem* 1.6.1(5).

([Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Appendix C.3, Proposition C.3.1; [G. Boxer, F. Calegari, T. Gee and V. Pilloni — Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.6, p. 8; [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White — Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.1 Theorem* 1.6.1 pp. 79–80; §1.7.1 Theorem* 1.7.1 and Remark 1.7.2 pp. 88–89; [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White — Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.4 pp. 86–87.)

Use KMSW §1.7.1 pp. 88–89 for the generic pure-inner multiplicity statement and `ε_ψ=1`; the paper explicitly distinguishes the case it proves, relative to its stated inputs, from the announced general theorem. Use §11.2 for the bounded Levi parameters, and §11.3 (KMSW §1.6.4 pp. 86–87) for non-tempered localizations. Construct the global packet from these local components and the stated multiplicity rule. Apply the stable discrete trace formula and its endoscopic character identities with the local intertwining relation in the scope stated in KMSW; compare the component-group characters with the global `ε`-character. For the generic pure-inner case this gives the displayed multiplicity rule. Liu–Tian–Xiao–Zhang–Zhu Proposition C.3.1 p. 363 gives only the relevant cuspidal cohomological specialization, and cannot replace that broader packet construction.

**Checks.**

- For `N = 1` the classification is the description of automorphic characters of `U(1)` through base change.
- At a place split in `F, U(F^+_v) ≅ GL_N(F_v)` and this roadmap is a singleton given by `ψ_v`.
- For a simple generic global parameter, the allowed packet members satisfy the global pairing condition; each such occurring member has multiplicity one. The formula does not assert every local packet choice occurs.

*Needs:* §6.25; §6.18; §4.10; §11.3.

### Examples

At a split quadratic algebra a relevant bounded packet is a singleton on the actual `GL_m(D)`; the quaternion `D×` singleton of the Steinberg parameter is its trivial representation. Ordinary pure inner forms at split places give split `GL_N`, as in §11.4. Extended packets use normalized positive-exponent induction on the relevant inner Levi and retain the induced module. At a real nonsplit place the component-character bijection belongs to the specified union of inner forms; forcing it on each single inner form fails the relevance test. A generic global parameter can have a non-tempered localization, requiring positive-exponent local induction even though its global Arthur `SL₂` is trivial. A symplectic cuspidal `GL₄` parameter belongs to the `GSp₄` alternative; the orthogonal alternative goes to the specified quasi-split GSpin₄ form.

### Dependencies

`TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` AL.3 — Rankin–Selberg theory and function-field factors; §1.8; §2.7; §4.10; §10.30; §10.31; `TauCetiRoadmap.AutomorphicSpectralTheory` §§0.48–0.49 (real reductive representations and globalizations); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); §6.25; §6.18.

## Layer 12: local towers and their cohomology

Classify the required formal-module instances, build both towers with all integer height components, and compare their infinite-level spaces. Carry the central quotient and Weil descent through compact-support cohomology. Actual supercuspidal concentration and the normalized Hecke-fibre action comparison require their own global realization and action arguments.

### 12.1 The relative marked-untilt modification chart

Let `S` be a perfectoid test space of characteristic `p`, equipped with its map to the residue field of the `GL_n` or EL datum, and let `S♯` be a marked mixed-characteristic untilt over the reflex field. Use `PadicHodgeTheory` §7.5’s relative period rings, annuli and chartwise curve at `E=ℚ_p` and unramified `E`, with their pullback descent. Its analytic presentation gives the relative period domain `S` dot`× Spa(ℤ_p)`, the Cartier immersion `i∞:S♯→S` dot`× Spa(ℤ_p)`, and its restrictions to the relative period annuli used for the Frobenius quotient, retaining the marked untilt. In an affinoid chart the immersion is cut out by a primitive generator `ξ` of `ker θ:W(R⁺)→R♯⁺`. For general `E` replace `W(R⁺)` by the completed ramified Witt ring described below and `θ` by `θ_E`. A chosen generator changes by a unit; the divisor and its ideal sheaf do not. Multiplication by `ξ` must be injective with closed image on every rational chart. A single global affinoid closedness assertion does not suffice.

For the tower datum `b`, form the corresponding Frobenius-equivariant bundle on the relative annuli and descend the bundle and the marked divisor to the relative curve chart. This is the constant-`b` family needed by the tower, with pullback in S. Use this chart to express the modification `0→F→E_b→i∞* Lie(X)→0`: the Lie quotient has the stated `μ`-relative position, and a Tate-module trivialization identifies `F` with the trivial bundle in the tower moduli problem. In the covariant height-`n`, dimension-one convention used below, `b∈B(GL_n,μ⁻¹)`, its Newton slope is `−1/n` and `E_b` has degree `+1`. The construction includes Frobenius transport of the marked divisor; it does not assert that a Frobenius-shifted mark is equal to the original mark.

The interface consists of the following operations and identities.

- the relative analytic domain and its diamond `S×Spd(ℤ_p)`, with the stated marked untilt.
- the Cartier ideal and quotient complete structure sheaf, including the plus rings.
- the divisor and the closed injective multiplication map on each rational chart, compatible on overlaps.
- the translated mark and divisor with the associated Frobenius pullback isomorphism.
- the bundle associated to `b` on the relative annuli and its Frobenius descent, compatible with `S′→S`.
- the modification of relative position `μ` and its exact bundle sequence.
- identification of the skyscraper quotient with the Lie module of the `p`-divisible group.
- the comparison of the kernel bundle with the Tate local system and its framing, retaining group actions.

Use the relative analytic construction and the Cartier closedness argument in [Scholze–Weinstein, *Berkeley lectures on p-adic geometry*](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition 11.2.1 and Proposition 11.3.1, pp. 92–95, with Definitions 5.3.2 and 5.3.7 and Proposition 5.3.8, pp. 38–40. On rational charts, obtain the lower norm bound for `ξ` from its nonvanishing on rank-one boundary points, so division by `ξ` respects the complete topology. Glue the ideal and quotient sheaves, transport them under Frobenius, and apply the existing period-annulus quotient construction in families. For the bundle and modification use §22.1 and Proposition 22.3.1, pp. 207–209, and the exact sequence and period-map comparison in Theorem 24.2.5, pp. 227–229. The kernel-to-Tate comparison additionally uses [Scholze–Weinstein, *Moduli of p-divisible groups*](https://arxiv.org/abs/1211.6357), Proposition 5.1.6, pp. 49–50. These comparisons attach the tower’s marked data to the relative foundation supplied by PadicHodgeTheory §7.5; the ramified finite-`E` coefficient construction is stated below, and the fixed-field quotient topology comes from AdicSpaces.

For a finite coefficient field `E/ℚ_p`, let `E₀` be its maximal unramified subfield, `q` its residue cardinality and `ϖ_E` its uniformizer. Construct the ramified Witt period rings `W_{O_E}(R⁺)=(W(R⁺)⊗_{W(κ_E)}O_E)^∧_{ϖ_E}` and their rational annuli after inverting `ϖ_E` and a Teichmüller pseudouniformizer. The Frobenius is the `q`-power Frobenius, fixing `O_E`. Glue the annuli to `Y_{S,E}`, then form `X_{S,E}=Y_{S,E}/φ^ℤ`, with its descended structure sheaf. This reuses AdicSpaces Layer 6's quotient construction and its annular arguments after replacing `p` by `ϖ_E` and `φ_p` by `φ_q`; it does not obtain a general `E`-curve by merely renaming the `ℚ_p`-curve. An untilt over `E` gives the primitive Cartier ideal by the relative `θ_E` map. The coefficient-field construction is [Fargues–Scholze, *Geometrization of the local Langlands correspondence*](https://arxiv.org/pdf/2102.13459v4), §II.1.1, Propositions II.1.1–II.1.4, pp. 47–50; Definition II.1.15 and Propositions II.1.16–II.1.18, pp. 54–55. The radius function satisfies rad`∘φ=q·`rad, giving freeness and total discontinuity; its annuli glue the structure sheaf on the quotient. The marked `E`-untilt is the Cartier divisor of Proposition II.1.18. These geometric results precede the Hecke and excursion constructions. Extend the API with the coefficient-field annuli of the tower untilt chart, the `q`-Frobenius and the coefficient-field curve. Prove the unramified comparison for the tower untilt chart: for `E=ℚ_p`, and for the degree-`f` unramified extension with its specified residue-field embedding, canonically identify these complete rings and plus rings, annuli, curve and untilt Cartier divisor with PadicHodgeTheory §7.5’s relative-period and `φᶠ` chartwise-curve interface. Use the common Teichmüller expansions and Gauss completions for the ring maps, rational-localization compatibility for gluing, and Frobenius descent for the curve comparison. The identifications commute with pullback in `S`, radius restriction, `φ_p^f` and change of a primitive divisor generator by a unit; the completed local divisor ring is the supplied `B_dR⁺`. The graded scheme presentation is the supplier’s `Proj(⊕_{m≥0} C̃^(φᶠ=p^m))`, with its adic realization (Kedlaya–Liu, §§8.7, 8.9 and Definitions 9.3.9, 9.3.11, cited by PadicHodgeTheory §7.5). For ramified `E` the divisor uses `θ_E` and the structural `E`-untilt.

**Checks.**

- At `E=ℚ_p`, tower untilt chart unramified comparison identifies the rings, plus rings, curve and divisor with PadicHodgeTheory §7.5 on every perfectoid chart. For unramified degree `f`, it intertwines the acting Frobenius with `φ_p^f`; an arbitrary pullback square in `S` remains commutative after this identification.
- In an affinoid untilt chart, the quotient by `ξ` recovers the marked untilt's complete ring and plus ring. Replacing `ξ` by a unit multiple leaves the Cartier immersion unchanged.
- Restriction to a rational subdomain commutes with the ideal and quotient; closedness must hold there as well. Omitting this test can produce a quotient presheaf that is not the closed adic subspace.
- For height one with `μ=1` and `b=p⁻¹`, the bundle has degree `+1` and the Lie quotient has length one. The modification kernel has degree zero.
- Pullback of `S` preserves the marked divisor and the exact sequence; a Frobenius translation carries the mark along and does not silently identify two labelled legs.
- A trivialized Tate local system identifies the degree-zero kernel with the trivial bundle. A slope-zero assertion without that local-system comparison does not provide the framing.

*Needs:* `TauCetiRoadmap.PadicHodgeTheory` §7.5 (relative periods and unramified chartwise curves); `TauCetiRoadmap.AdicSpaces` Layer 6 (the Fargues–Fontaine curve); `TauCetiRoadmap.PerfectoidSpaces` Layers 1–2 (perfectoid fields and tilting), 5 (finite-stage descent) and 7 (tilde-limits); `TauCetiRoadmap.DiamondsAndVStacks` §6.9 (Seminormal rigid full faithfulness); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2 (Dieudonné theory).

### 12.2 Tower datum and action conventions

Fix a finite extension `E/ℚ_p`, residue cardinality `q, n≥1`, the central division algebra `D/E` with invariant `1/n`, and an algebraic closure `Λ` of `ℚ_ℓ` with `ℓ≠`p. Fix `q^(1/2)` in `Λ`. Write `|w|=q^(−v(w))` for `v`(geometric Frobenius)`=1`, so `Λ(1)` has character `|w|`. Towers carry the Dat left `GL_n(E)×D×` action; cohomology uses inverse pullback to turn this into a left action. Regard the Weil group as an abstract acting group, with `ℓ`-adic continuity checked on inertia separately. A change to right moduli actions is a named conversion, not an identification of formulas.

*Hypotheses.* `E` has characteristic zero; `Λ` has characteristic zero; `n≥1`.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §2.2.1, p. 12; §3.1.5 with footnote 6, p. 16; Fait 3.3.2, p. 22; §3.5, pp. 24–27; [Laurent Fargues and Peter Scholze — Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4), IX.7.3–IX.7.4, p. 338.)

The interface consists of the following operations and identities.

- The specified square root of `q` and the characters `|·|^a` on `W_E`.
- A left moduli action induces a left cohomology action by inverse pullback.
- Arithmetic and geometric Frobenius elements are mutual inverses; the corresponding unramified eigenvalues are reciprocal.
- Equality requires equality of field, frame, reciprocity, coefficient and square-root choices.

Use the local field, division algebra and reciprocity convention from Layer 10. Record the chosen frame and quasi-isogeny actions before applying inverse pullback. Extend Tate twists to half-integers using the fixed square root of `q`; changing that root changes the unramified quadratic twist.

**Checks.**

- `Λ(1)(Frob_ar)=q` and `Λ(1)(Frob_geom)=q⁻¹`.
- At `n=1` the middle degree and half-Tate exponent are both zero.
- Replacing `q^(1/2)` by `−q^(1/2)` multiplies an odd half-twist by the unramified quadratic character.
- Changing left/right actions also changes which contragredient an isotypic notation selects.

*Needs:* §10.20; §10.30; §10.26; §4.7a; §10.23; §10.25.

### 12.3 The formal `O_E`-module tower

Choose a one-dimensional formal `O_E`-module `H` of `O_E`-height `n` over the algebraic closure of the residue field. Use the formal `O_E`-module deformation construction with full Drinfeld levels of §10.2. The additional framed deformation functor at level `m` classifies `(G,ρ,α_m)`, where `G` deforms `H, ρ` is an `O_E`-linear quasi-isogeny on the special fibre and `α_m` is a full Drinfeld level structure on `G[ϖ_E^m]`. Its rigid generic fibres form the Lubin–Tate tower `M_LT,m` over `brevé E`. At level zero each quasi-isogeny-height component is `an (n−1)`-dimensional open ball. Higher generic-fibre levels are finite étale with the specified congruence deck group.

*Hypotheses.* Full Drinfeld level structure is imposed integrally, not an arbitrary basis over a nonreduced base. Fix `H` and a uniformizer `ϖ_E`.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §3.2, pp. 18–21; [Peter Scholze and Jared Weinstein — Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357), §6.5, Definitions 6.5.1 and 6.5.3; Theorems 6.5.2 and 6.5.4, pp. 66–68.)

The interface consists of the following operations and identities.

- Construct the space representing framed deformations with full level `m`.
- For `m≥r`, forget the extra level structure; compositions agree.
- The quasi-isogeny height is a locally constant integer function.
- Over a fixed lower generic level, full lifts form the expected congruence torsor.
- An isomorphism respects the formal module, framing quasi-isogeny and every level vector.

Use §10.2’s strict `O_E` deformation representability and Drinfeld full-level Cartier-divisor conditions. Represent each height component and pass to its rigid generic fibre. Use the étaleness of `ϖ`-power torsion in characteristic zero to construct the finite étale level maps. Glue the components using quasi-isogenies; do not replace the infinite height union by the height-zero component.

The period comparison also needs the `O_E`-linear Hodge–Tate datum. For a tower point `G` over `O_C`, the underlying `p`-divisible group has its Tate lattice `T(G)`, the Hodge–Tate subspace `W=Lie(G)⊗C⊂T(G)⊗C(−1)`, and the modification `0→T(G)⊗O_X→E(G₀)→i∞*W→0`. `O_E`-linearity follows by functoriality; strictness forces the structural embedding on the Lie quotient. Scholze–Weinstein, *Moduli*, Theorem 5.1.4 and Proposition 5.1.6, pp. 49–50, Theorem 5.2.1, pp. 51–54, and the EL specialization in §6.5, pp. 66–68, give the classification and sequence; they are not deformation-representability theorems. Keep the underlying `p`-divisible sequence before passing to the `O_E`-relative component. The API Lubin–Tate Hodge–Tate subspace, bundle modification and strict lie component retains this distinction. Check height one gives a one-dimensional Lie quotient; for `E/ℚ_p` ramified the underlying Tate module has `ℤ_p-rank n[E:ℚ_p]`; forgetting the Lie embedding loses strictness. The same equivariant sequence with the special Lie ranks gives the `O_D` version of §12.4.

**Checks.**

- For `n=1` each level-zero component is zero-dimensional; the components still range over Z.
- The degree from full level `m` to level zero is `|GL_n(O_E/ϖ_E^m)|` on the generic fibre.
- On the generic fibre a linearly dependent `O_E/ϖ_E^m` frame is not full. On the connected special fibre zero sections can be full when the Drinfeld Cartier-divisor condition holds; integral fullness cannot be defined by pointwise linear independence.
- The level-zero ball has dimension `n−1`.
- The `GL_n(E)` action is on the tower of correspondences; a general element need not preserve an individual integral level.

*Needs:* §10.2; §12.2; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2 (Dieudonné theory).

### 12.4 The special `O_D`-module tower

The Drinfeld formal moduli functor classifies special formal `O_D`-modules of dimension `n` and `O_E`-height `n²`, with a framing quasi-isogeny. Here special means the prescribed rank-one eigenspace condition for the maximal unramified subfield of `D` on `Lie G`. Represent this integral moduli problem at level zero by `M̂_Dr,0`, with universal special module `X_u`, and let `M_Dr,0` be its rigid generic fibre. For `m≥1`, define `M_Dr,m` over `M_Dr,0` by the finite étale `O_D`-linear frame torsor `Isom_O_D((ϖ_E⁻ᵐO_D/O_D)_{M_Dr,0},X_u[ϖ_Eᵐ])`. These higher levels are generic-fibre spaces. At the bottom level the period domain is `Ω_E^(n−1)=P_E^(n−1)` minus all `E`-rational hyperplanes, with the height components retained.

*Hypotheses.* Use the maximal order `O_D`, `n≥1`, and `m≥0`. The indexing here is `ϖ_E`-power level; with `Π_Dⁿ=ϖ_E` it corresponds to `Π_D`-level `nm`. Specialness and the determinant condition are imposed on the integral level-zero formal moduli. Higher torsion frames are imposed after passage to characteristic-zero generic fibres.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §§3.1.3–3.1.4, p. 16, and §3.1.5, pp. 16–17; [Peter Scholze and Jared Weinstein — Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357), §7.3, pp. 71–73.)

The interface consists of the following operations and identities.

- At zero, take the generic fibre of the integral special-module moduli; for `m≥1`, represent the generic-fibre torsion-frame functor above. For `m≥1` its deck group is `O_D×/(1+ϖ_EᵐO_D)`.
- Restriction of generic-fibre frames gives finite étale maps for `m≥r≥0`; these compose and commute with the tower actions.
- Lie eigenspaces for the unramified subfield have the prescribed ranks.
- The period map lands in `Ω_E^(n−1)`.
- An isomorphism preserves the `O_D` action, framing and level structure.

Construct the integral level-zero framed deformation functor by imposing the Lie eigenspace ranks on the `O_D`-linear Dieudonné display. The formal Drinfeld model represents it; its rigid period map identifies the level-zero domain with the rational-hyperplane complement (Dat §3.1.3, p. 16; Scholze–Weinstein §7.3, pp. 71–73). On this generic fibre, `X_u[ϖ_Eᵐ]` is finite étale and étale locally free of rank one over `O_D/ϖ_EᵐO_D`. Its isomorphism sheaf with the constant module is therefore the finite étale frame cover, with the stated deck group. For `m≥r`, restriction along `ϖ_E⁻ʳO_D/O_D⊂ϖ_E⁻ᵐO_D/O_D` gives the forgetting map (Dat §3.1.4, p. 16). The level-zero universal family and its equivariance induce the actions on these covers. These generic-fibre covers supply the classical tower and its cohomology.

**Checks.**

- At `n=2` the formal module has dimension 2 and height 4, while the rigid moduli has dimension 1. Over an algebraically closed special-fibre field `k`, its formal local ring is `k[[X,Y]]`; the identity ideal `(X,Y)` has height two and is not principal. The identity section is not an effective Cartier divisor, so the one-dimensional Lubin–Tate divisor-level condition does not define these levels.
- At `m≥1`, the generic-fibre cover has degree `|O_D×/(1+ϖ_EᵐO_D)|`; forgetting to zero retains the framed special module and discards only its torsion frame.
- An `E`-rational hyperplane point is excluded from `Ω_E^(n−1)`.
- For `n=1` the period domain is a point and `D=E`.
- For `n=2` the period domain is `P¹` minus `P¹(E)`.
- `GL_n(E)` acts through the framing algebra and `D×` through level changes, exchanging the roles of the two groups in LT.

*Needs:* §12.2; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2 (Dieudonné theory).

### 12.5 Period maps and their equivariance

Construct the Grothendieck–Messing period map from the Dieudonné Lie quotient and the infinite-level Hodge–Tate period map from the framed Tate module. On LT the GM target is the flag variety for the frame and the HT target is the flag variety for `E^n`; the group acting trivially on each target is specified. On the dual Drinfeld datum these targets exchange. Period maps are maps of adic spaces or diamonds on their stated levels, and the GM map is étale on the classical generic fibre.

*Hypotheses.* Use the determinant condition, the chosen covariant/contravariant Dieudonné convention and fixed frames. For general `E` retain the `O_E` action rather than silently using the `ℚ_p` height as `n`.

([Peter Scholze and Jared Weinstein — Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357), §6.1, pp. 54–56 (Proposition 6.1.3, p. 55); §7.1, Proposition 7.1.1, p. 68; Proposition 7.2.2, p. 70; [Lue Pan — On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366), §§5.2.2–5.2.4, pp. 55–57 (v1).)

The interface consists of the following operations and identities.

- Send a deformation to its Dieudonné Lie quotient.
- Send the infinite Tate frame to its Hodge–Tate filtration.
- Both maps commute with extension of the complete coefficient field.
- Duality exchanges the two period morphisms with the specified flag identifications.

Form the Lie quotient of the crystalline deformation and the Tate Hodge–Tate filtration. Check functoriality under quasi-isogeny and level changes. Use the universal-cover description to identify the exchanged quotients under duality. Prove étaleness using Grothendieck–Messing deformation theory; local coordinates then have an invertible derivative.

**Checks.**

- Both targets are points at `n=1`.
- Forgetting finite level leaves GM unchanged; a change of full Tate frame transforms HT by the linear-group action. HT therefore requires the infinite frame.
- On an LT one-dimensional GM chart, the derivative of the period coordinate is invertible.
- The rational hyperplane complement in the Drinfeld case is tested separately from the LT GM image.

*Needs:* §12.3; §12.4; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2 (Dieudonné theory).

### 12.6 The universal-cover moduli at infinite level

For an EL datum `(B,V,H,μ)`, define `M_∞` on complete Huber pairs over `brevé E` by triples `(G,ρ,α)`, with `α` an integral full Tate frame on geometric points, equivalently the rational frame after allowing quasi-isogenies. In the universal-cover description an element is a `B`-linear map `s:V→H̃_η` whose quasi-logarithm has a locally free quotient `W` of the prescribed rank and such that `0→V→H̃_η→W→0` is exact on every geometric point. The determinant condition fixes the `μ`-type of W.

*Hypotheses.* Use a basic EL datum for tower duality; the moduli description itself has the hypotheses of SW13 6.5.4. Integral and rational functors are distinguished.

([Peter Scholze and Jared Weinstein — Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357), Theorem 6.3.4 and the description following it, pp. 59–61; Theorem 6.5.4, pp. 67–68.)

The interface consists of the following operations and identities.

- A deformation, quasi-isogeny and full Tate frame give a point.
- Project to the `B`-linear universal-cover map `s`.
- Rank, determinant type and the geometric exact sequence characterize the rational points.
- Rational-frame moduli do not depend on the integral lattice.
- The triple and universal-cover descriptions commute with Huber-pair base change.

Use universal covers and Tate modules from FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.25 and the Hodge–Tate classification of §§12.3–12.4. Translate a frame to the `B`-linear universal-cover map and its Lie quotient. Use local `p`-divisible classification to reconstruct `G` from the map and prove full faithfulness. Prove the geometric-point exactness condition is preserved under base change; it cannot be omitted in favor of the rank condition alone.

**Checks.**

- A map whose quasi-logarithm has the right rank but whose geometric kernel is larger than `V` fails the moduli criterion.
- Reduction of the integral frame modulo `ϖ_E^m` gives the full finite level `m`.
- Replacing the lattice by `ϖ_E` times it changes integral framing but leaves the rational functor isomorphic.

*Needs:* §12.3; §12.4; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2 (Dieudonné theory); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.25 (The Tate module sheaf and the universal cover of a `p`-divisible group).

### 12.7 Commuting actions and effective Weil descent

The finite-level correspondences and the infinite-level towers carry commuting `GL_n(E), D×` and `W_E` actions compatible with level maps, period maps and base change. A Weil element moves the quasi-isogeny height by its valuation contribution. In Dat conventions the height-zero stabilizer is {`(g,d,w): |det(g)`Nrd`(d)⁻¹|_E=|w|`}; the full-height representation is induced from this stabilizer. The diagonal `E×` in `GL_n(E)×D×` acts trivially.

*Hypotheses.* Use the datum and action choices above. Weil descent includes the height translation, not just an action on coefficients.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §3.5, especially (3.5.1), pp. 24–26; [Peter Scholze and Jared Weinstein — Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357), Proposition 6.5.5, p. 68.)

Define the two algebraic-group actions on frames and framing quasi-isogenies. Construct the Frobenius descent isomorphism from the special-fibre frame and check its cocycle. Compute determinants and reduced norms on heights to obtain the stabilizer equation. Verify the cocycles commute with level changes and induce the announced cohomology actions.

**Checks.**

- At `n=1` the triple `(g=ϖ,d=1,w=Φ_geo)` satisfies `|g/d|=q⁻¹=|w|` and preserves height zero. The triple `(ϖ,1,1)` does not, detecting reversal of the Weil height contribution.

- A uniformizer in only one group factor translates height; the diagonal central element does not.
- The height-zero component alone is not invariant under the full product group.

*Needs:* §12.3; §12.4; §12.5.

### 12.8 Preperfectoidness and completed tower limits

The infinite-level EL moduli is preperfectoid and is a tilde-limit of the finite generic levels. After base change to an algebraically closed complete extension `C` and the specified strong completion, the resulting infinite-level space is perfectoid. The tilde-limit assertion gives the topological inverse limit and dense colimit of affinoid rings, not an equality of uncompleted rings.

*Hypotheses.* Use the precise completion and Huber-pair topology of SW13. Tilde-limit is the imported perfectoid-tower notion.

([Peter Scholze and Jared Weinstein — Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357), Theorem 6.3.4, pp. 59–61; Theorems 6.5.4 and 6.4.1, pp. 64–68.)

Use the universal-cover embedding into a perfectoid ambient space. Impose the rank and exactness conditions by the local chart analysis of SW13 6.3. Identify finite-level frame quotients and the completed affinoid colimit. Base change and complete before applying the perfectoid conclusion.

**Checks.**

- A level-zero open ball is not itself asserted perfectoid.
- For `E=ℚ_p`, the height-one determinant tower is the cyclotomic tower.
- For general `E`, it is the height-one Lubin–Tate tower with deck group `O_E×`; cyclotomic norm transport does not identify the towers. For unramified quadratic `E/ℚ_p` the deck group has `p`-adic dimension two, while the cyclotomic deck group has dimension one.

*Needs:* §12.6; `TauCetiRoadmap.PerfectoidSpaces` §§5.1–5.12 (finite-stage descent) and Layer P7 (tilde-limits).

### 12.9 The basic minuscule modification functor

For the basic isocrystal of a one-dimensional height-`n` formal `O_E`-module, define the `v`-functor of modifications of its Fargues–Fontaine vector bundle at a marked untilt with minuscule Lie quotient and a Tate lattice/frame. For `E=ℚ_p`, the SW20 covariant convention has `μ=(1,0,…,0)` and `b∈B(GL_n,μ⁻¹)`; the Newton slope of `b` is `−1/n`, while `E_b` in the exact sequence has degree `+1` and slope `+1/n` in the curve convention. The modification is `O^n→E_b` with the Lie cokernel after the stated covariant conversion. For `E≠ℚ_p` use the `O_E`-linear EL datum in `Res_{E/ℚ_p}GL_n`, with its determinant condition. This is only the tower-specific fibre; general local shtukas are downstream of it.

*Hypotheses.* Use the finite-flat local classification and distinguish the covariant Newton convention from the degree of its curve bundle. Include the untilt divisor and full `O_E`-compatible Tate framing.

([Peter Scholze and Jared Weinstein — Berkeley lectures on p-adic geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 24.2.5, pp. 227–229; Corollary 24.3.5, pp. 230–231.)

The interface consists of the following operations and identities.

- A minuscule modification with its marked untilt and Tate frame gives a point.
- Forget the full frame to a lattice-level point.
- `O_E` linearity and the determinant condition cut out the formal-module EL fibre.
- Pull back bundles, divisors and frames along a perfectoid base map.

Use the marked Cartier untilt divisor of §12.1. Form the minuscule modification using the `p`-divisible-group exact sequence; its positive-degree bundle is not replaced by its dual. Impose `O_E` linearity and the EL determinant condition to pass from `ℚ_p` to E. Define lattice level quotients and their universal `ℚ_p/O_E` local systems.

**Checks.**

- The SW20 multiplicative datum is `b=p⁻¹, μ=1`; swapping `b` for `p` violates this convention.
- For `E/ℚ_p` of degree `e`, restriction of scalars has `ℚ_p` rank en while the `O_E` rank remains `n`.
- Reducing the universal Tate frame gives the specified congruence-level local system.
- The Newton sign of `b` and the degree sign of `E_b` are distinguished by the exact sequence; they cannot be copied from the FS `O(−1/n)` orientation.

*Needs:* §12.6; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2 (Dieudonné theory); §12.1; `TauCetiRoadmap.DiamondsAndVStacks` §6.9 (Seminormal rigid full faithfulness).

### 12.10 Gross–Hopkins coordinates and infinitesimal operators

In the rank-two LT chart of CDN20, write the Gross–Hopkins period coordinate as `A/B` and put `g=AB′−A′B`. Étaleness makes `g` invertible. The vector fields `f_i d/dz` with `f₁=A²/g, f₂=B²/g` and `f₃=AB/g` give the infinitesimal action of the Lie algebra of `D×/F×` (`D` the quaternion division algebra) on functions on the tower, in the source’s chosen basis. In particular `f₁ f₂′−f₂ f₁′=2f₃`, so the first two vector fields have the required bracket. The formulas are coordinate-dependent and glue through the period-map transformation rule.

*Hypotheses.* Rank two, the coefficient field and Lie-algebra basis of CDN20 §4.2. Derivatives are in the selected LT deformation coordinate `z`.

([Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł — Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928), Proposition 4.8, p. 38 (arXiv copy).)

Use GM étaleness to establish `g≠0` on the chart. Differentiate the projective linear action on the period coordinate. Pull the induced vector fields back through the étale period map. Compute the bracket using the quotient rule, then verify compatibility on chart overlaps.

**Checks.**

- The denominator is `g`, not `g²`, in each `f_i`.
- The bracket coefficient is `2f₃` in the chosen basis.
- For `A=z, B=1, g=−1` and `(f₁,f₂,f₃)=(−z²,−1,−z)`.
- For `A=1, B=z, g=1` and `(f₁,f₂,f₃)=(1,z²,z)`.
- Multiplying both A and `B` by two multiplies `g` by four and leaves every `f_i` unchanged.

*Needs:* §12.5; §12.3; `TauCetiRoadmap.LocallyAnalyticDistributions` §0.3 (Polydiscs, charts and compact manifolds).

### 12.11 Infinite-level EL duality

For a basic EL datum set `B̌=End_B⁰(H)`, take the dual datum described by SW13 §7.2, and identify the two linear groups in the exchanged order. There is a `G(E)×J(E)`-equivariant isomorphism `M_∞≅M̌_∞`. Its universal-cover formula is `š(f)(v)=f(s(v))`. Under the identified flag varieties the GM period of one side is the HT period of the other. For the LT datum its dual is the Drinfeld datum. Standard Drinfeld linear-group conventions may require inverse transpose; include this automorphism in the comparison.

*Hypotheses.* The EL datum is basic, so the full endomorphism algebra has the needed centralizer property. The statement is at infinite level; equal numbered finite levels are not asserted isomorphic.

([Peter Scholze and Jared Weinstein — Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357), Proposition 7.2.2 and Theorem 7.2.3, pp. 70–71; §7.3, pp. 71–73 (the inverse-transpose remark on the linear-group action is in the proof of Theorem 7.3.1, p. 71).)

Compute the dual EL weights using `Hom(V₀,V)` and `Hom(V₁,V)`. Apply the pairing formula to the universal-cover map. Use the exactness condition to identify the dual quotient and construct the inverse. Check both period maps and group actions on the universal-cover formula.

**Checks.**

- For `n=2` the inverse-transpose convention sends the unipotent matrix `[[1,1],[0,1]]` to `[[1,0],[−1,1]]`. Omitting this automorphism would intertwine the wrong linear-group action even if the period spaces were identified.

- Applying duality twice gives the canonical original datum.
- GM and HT exchange rather than each being individually fixed.

*Needs:* §12.6; §12.5; §12.8.

### 12.12 The equivariant compact-support complex

For `T=LT` or Dr and rational coefficients `Λ=ℚ̄_ℓ`, define `C_T,Λ` by the derived smooth level colimit of `RΓ_c(M_T,K×brevé E C,Λ)`. For integral coefficients choose `Λ₀=ℤ_ℓ` or the ring of integers of a finite extension of `ℚ_ℓ`, at each finite level derive the composite `Γ_!^sm∘lim_sh` on the `Λ₀/ℓ^r`-systems in its equivariant étale topos, and then take the smooth level colimit. Here `lim_sh` is the inverse-limit functor on sheaves, applied before compactly supported sections; it is not an inverse limit of global compact-support cohomology groups. Rationalize over the corresponding fraction field; coefficients in `ℚ̄_ℓ` are obtained by extending over finite coefficient fields. A quotient `ℚ̄_ℓ/ℓ^r` is zero and is never the integral coefficient system. Trace maps, pullback maps and the action conventions are retained in the derived category of smooth `GL_n(E)×D×` representations with commuting `W_E` action. Compact supports are the finite-level proper-support construction, not ordinary global sections of the infinite union.

*Hypotheses.* Use finite levels locally of finite type and the smooth representation category. Do not commute the coefficient inverse limit and level colimit without a separate theorem.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §3.3, Faits 3.3.2–3.3.5 and the definition of `RΓ_c`, pp. 21–24.)

The interface consists of the following operations and identities.

- Construct `RΓ_c` at one finite level and coefficient exponent.
- Pull back along a finite étale level map.
- Trace in the reverse direction; trace∘pullback is multiplication by the degree.
- Derived reduction modulo `ℓ^r` agrees with the finite coefficient tower.
- Equal compatible maps of the finite-level diagrams induce equal maps of their derived smooth colimits. No claim that every morphism between colimits comes from one finite level is made.

Use torsion compact-support cohomology from ClassicalAdicEtaleCohomology and the fixed-level adic coefficient systems of AdicCoefficientsAndComparisons L0, followed by the analytic comparison and smooth colimit below. Build the finite-level complexes with pullback for level refinement and trace in the opposite direction. Take the derived smooth colimit and define the commuting Weil action by descent. Check coefficient reduction and extension of the algebraically closed base field.

More precisely, the equivariant category here is the localization of complexes of smooth `GL_n(E)×D×` representations with a commuting action of the abstract group `W_E`, at maps that are quasi-isomorphisms on the underlying complexes. Construct it before passing to the homotopy category: the bar resolution retains the derived `W_E`-invariants and higher coherence. Equivalently use homotopy-coherent functors from `B(W_E^disc)` into the stable derived category. An action merely on an object of the triangulated homotopy category is insufficient. The levelwise descent maps define an object of this localization; continuity on inertia is checked on each finite-level `ℓ`-adic object separately. No smoothness assertion for the entire Weil action is made.

The proper-support comparison is a target for these finite-level smooth rigid spaces in every dimension `n−1`. The adic-to-diamond étale-site equivalence identifies pullback and extension by zero for open immersions. On a quasicompact compactifiable chart factor the structural map as an open immersion followed by a proper map; proper base change identifies the two proper direct images, hence their composites `Rp_*j_`! and the finite étale traces. Exhaust by these charts to obtain the nonquasicompact proper-support functor. This follows the construction of [Scholze, *Étale cohomology of diamonds*](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), §15, pp. 89–92, Definition 22.4, pp. 129–130, and Definitions 22.13 and 22.18, pp. 135–139 (14 April 2026 version). It proves the analytic support comparison here rather than assuming it from a curve example in DiamondSixOperations.

For the tower limit, finite étale objects and their finite diagrams descend on each quasicompact chart by PerfectoidSpaces P5; proper supports are taken through those finite-level representatives. Passing to any cofinal system of levels gives the same compact-support colimit and its equivariant topos. Dat §3.3, Faits 3.3.4–3.3.5, pp. 22–24, identifies its cohomology with `colim_K H_c^i(M_K,Λ)` and proves compatibility with finite derived coefficient reduction. Construct integral coefficients by deriving Dat’s fixed-level composite `Γ_!^sm∘lim_sh` on the adic sheaf system (Dat §3.3, pp. 21–23); its finite coefficient comparison is part of Fait 3.3.5 and the scalar-extension assertion following it. Rational scalar extension then commutes with the filtered colimit by flatness. No inverse-limit/level-colimit interchange is needed. The additional API consists of the analytic-diamond support of the tower cohomology, the cofinal-level comparison, Weil descent, the equivariant derived complex and its derived Weil invariants. Forgetting the Weil action recovers the original smooth complex; the trivial action on `Λ` has derived invariants `RΓ(W_E^disc,Λ)`, including higher group cohomology; a nontrivial equivariant extension may split after forgetting the action. For example, an unramified Frobenius acting by a nontrivial two-by-two unipotent matrix gives a nonsplit extension of the trivial Weil representation by itself. The abstract-group bar construction is distinct from continuous inertia cohomology; continuity of the geometric action is checked separately. Check a cofinal congruence-level subsequence gives the same complex; a compactly supported finite-level class retains that support after refinement; the ordinary cohomology of the full infinite union cannot replace the proper-support colimit.

**Checks.**

- For a degree `d` level covering, trace∘pullback is `d` times the identity.
- On a countable disjoint union of points, compactly supported integral sections are `⊕_i Λ₀`. The inverse limit of `⊕_i Λ₀/ℓ^r` also contains `(ℓ^i)_i`, which has infinite support, so moving the global compact-support functor inside that inverse limit is invalid.
- In ordinary vector spaces the identity of `⊕_{i≥0}Λ` cannot factor through one finite-dimensional stage of `colim_n Λ^n`. Thus the colimit API cannot replace arbitrary morphisms by a single finite-level representative without a compact-source hypothesis.
- The `n=1` tower has its compact-support cohomology in degree zero.
- On a nonproper positive-dimensional tower, replacing `RΓ_c` by `RΓ` changes the functor and is rejected.
- Cohomology agrees with the usual smooth tower `H_c^i`.

*Needs:* §12.7; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.0 (the smooth category and its basic API); `TauCetiRoadmap.DiamondSixOperations` Layer S2: The exceptional direct image for eligible maps of small `v`-stacks; `TauCetiRoadmap.AdicCoefficientsAndComparisons` Layer L0: Adic coefficients.

### 12.13 Equivariant tower cohomology comparison

There is an isomorphism `C_LT,ℤ_ℓ≅C_Dr,ℤ_ℓ` in the equivariant derived category, compatible with the smooth `GL_n(E)×D×` structure (hence with the Hecke operators of both level systems), with `W_E` and with coefficient reduction. It induces all degree-wise cohomology comparisons after extending to `Λ`. The proof passes through the equivalence of the appropriate equivariant tower topoi and proper-support functors; a bare perfectoid-space isomorphism does not suffice.

*Hypotheses.* Use the same action convention on both complexes. The finite-level descent theorem compares cofinal level presentations, not equal `m`.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), Theorem 3.4.1 and Corollary 3.4.2, p. 24.)

Use EL duality to identify the common infinite-level presentation. Descend equivariant finite étale objects and compact supports through cofinal finite levels. Construct the equivalence of tower topoi and show it intertwines the derived support functors. Pass through integral coefficient inverse systems and then rationalize; compare inertia continuity as well as abstract Weil equivariance.

The formal-to-analytic comparison used at finite level is required with its naturality, not merely as an abstract isomorphism of vector spaces. Construct it on the algebraization of each formal chart from the same specialization map. Its naturality for étale pullback and the proper trace makes the comparison commute with the two directions of a level correspondence. Apply this also to the Frobenius descent correspondence, including its height shift. Finite diagrams of these charts descend to a common finite level, so the cocycle and commuting group actions hold before taking the colimit. Dat Theorem 3.4.1 and Corollary 3.4.2, p. 24, compare the equivariant topoi and the `Γ_c` functors in this form. Thus §12.12’s support comparison, the finite-level nearby-cycle comparison and the tower-topos equivalence give the announced map with coefficients, Hecke correspondences and Weil descent all retained.

**Checks.**

- The comparison is an isomorphism of smooth `GL_n(E)×D×` complexes, so it intertwines the Hecke operators of both towers; it commutes with coefficient reduction.
- A degree-wise comparison only after forgetting `W_E` fails this target.

*Needs:* §10.4; §12.11; §12.12; `TauCetiRoadmap.PerfectoidSpaces` §§5.1–5.12 (finite-stage descent) and Layer P7 (tilde-limits); `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles).

### 12.14 Central quotient and tensor sectors

Quotient a tower by the action of `ϖ_E^Z` in its linear group, using Dat §3.5; the remaining height classes are indexed by `Z/nZ`. First define the full-tower sector at central character `ω`: the left `GL_n(E)` character is `ω` and the left `D×` character is `ω⁻¹`, while `ρ` has central character `ω`. To use the quotient model, arrange `ω(ϖ_E)=1` by a specified unramified twist, and retain that twist when returning to the full tower. For an irreducible `D×`-representation `ρ` in that sector define `H_c^i[ρ]=H_c^i⊗_{Λ[D×]}ρ`, turning the cohomology left `D×` action into a right action by `v·d=d⁻¹v`. In this characteristic-zero, fixed-central-character quotient `D×/ϖ_E^Z` is compact, so sector extraction is exact and agrees with `Hom_D(ρ∨,H_c^i)`.

*Hypotheses.* The left `D×` character of the relevant cohomology summand is the inverse of the central character of `ρ`; the diagonal centre acts trivially. The `Λ` representation is smooth; exactness uses characteristic zero and compactness modulo the fixed centre.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §3.5 and the notation before Theorem 4.1.2, pp. 24–28.)

The interface consists of the following operations and identities.

- Form the quotient tower and its fixed-character component.
- Tensor the right `D×` cohomology module with `ρ`.
- Tensor extraction corresponds to `Hom_D(ρ∨,−)`.
- Sector extraction is exact over `Λ` in the fixed compact-mod-centre setting.
- Untwisting `ω(ϖ_E)` transports both the smooth and Weil factors.

Form the discrete central quotient with its cohomology action. Untwist the central character, retaining the induced Weil twist. Apply averaging on the compact quotient to establish exact sector extraction. Identify tensor coinvariants with the multiplicity of `ρ∨` by the evaluation pairing.

**Checks.**

- For a constituent `ρ∨⊗V`, extraction by tensoring with `ρ` gives V.
- Quotienting the height translation by `ϖ_E` leaves `n` height residue classes.
- Exact averaging is not asserted over integral or mod-`ℓ` coefficients when the compact quotient has `ℓ`-torsion.
- Changing the uniformizer is accompanied by the corresponding central-character identification.

*Needs:* §12.12; §12.7; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.0 (the smooth category and its basic API).

### 12.15 Independent nearby-cycle decomposition

For the compact unitary model above, decompose the relevant Newton-stratum nearby-cycle terms into Igusa factors and local formal-module deformation cohomology, with the stratum shifts, coefficient duals, `W_E` descent and Hecke actions retained. Extracting the supercuspidal local sector has only the contribution yielding degree `n−1`. For a supercuspidal block the two extreme weight bounds coincide and force its local factor into degree `n−1`; this uses an actual degree bound, rather than an Euler characteristic.

*Hypotheses.* Use the actual compact unitary integral model and the supercuspidal sector. This target does not assert all non-supercuspidal monodromy or elliptic derived decompositions.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), Theorem 4.1.2 and its proof, pp. 28–29 (with Lemma 3.5.13, p. 27).)

Use [Boyer, *Monodromie du faisceau pervers des cycles évanescents de quelques variétés de Shimura simples*](https://www.math.univ-paris13.fr/~boyer/recherche/MP-faisceautique.pdf), §2.2, Theorems 2.2.4–2.2.6, pp. 10–11, and §5.5, Proposition 5.5.1 and Corollary 5.5.2, pp. 27–28 (author-version numbering). The Newton strata of heights tg carry Harris–Taylor local systems attached to a supercuspidal representation of `GL_g`; their intermediate extensions give the graded pieces of nearby cycles, with Tate shifts determined by the monodromy filtration. On a stratum of height `(t+a)g` the restriction has the induced Steinberg–Speh local system and the degree specified in Theorem 2.2.5. The nonzero arrows of Theorem 2.2.6 give the weight spectral sequence. Smooth duality (Proposition 5.5.1) gives opposite extreme-weight bounds on its local deformation cohomology; Corollary 5.5.2 puts all weights between the endpoints indexed 0 and `s−1`, where `s=n/g`. In the supercuspidal case `s=1` these endpoints coincide: only the local degree `n−1` survives. The supersingular completed stalk comparison identifies the resulting complex with the local LT tower, preserving Hecke and Weil actions (Dat §5.1, Theorem 5.1.3, pp. 35–36). This argument needs only the `s=1` consequence of the strata calculation.

**Checks.**

- The spectral sequence must prove actual sector concentration, not just cancellation of Euler characteristics.
- All `W_E` actions must be the descent actions of the same model.

*Needs:* §9.1; §12.3; §12.12; `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles` LPV.6: Perverse nearby cycles.

### 12.16 Duality and locally analytic vectors

For `E=ℚ_p` and `n=2`, on an affinoid perfectoid tower chart `Spa(B,B+)` covered as in Pan §5.3.5, the `GL₂(ℚ_p)`-locally analytic vectors in `B` equal the `D×`-locally analytic vectors. Duality exchanges the two periods and the invariant differential constructions: for the weight convention `χ=(n₁,n₂), k=n₂−n₁≥0`, Pan’s two order-`(k+1)` operators are equal up to the nonzero rational normalization constant `c′` after the prescribed line-bundle identifications. The constant is not declared equal to one without normalizing coordinates.

*Hypotheses.* Use Pan v1’s chart topology, polarization and weight convention. Regard the continuous chart action on the Banach space `B` as a locally `ℚ_p`-analytic-vector problem, also when its scalars contain `C_p`. The chart analytic-vector carrier is identified with the generic orbit-map carrier below; the Higgs compatibility is specific to these charts.

([Lue Pan — On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366), §§2.1.1–2.1.6, pp. 11–13; Theorems 5.2.8, 5.3.4, 5.3.8; Corollary 5.3.9; Theorem 5.3.20, pp. 59, 63–65, 67 (v1).)

Use the explicit local series description of Pan 5.2.8 to prove the `GL₂`-analytic inclusion in the `D×`-analytic vectors. Use duality and the exchanged period map to apply the analogous description 5.3.8 for the reverse inclusion. Transport the Kodaira–Spencer line-bundle identifications under duality. Apply the uniqueness characterization of the differential operator in 5.2.15 to obtain 5.3.20, retaining `c′`.

For either acting `p`-adic Lie group `H`, a vector `b∈B` is locally analytic when its orbit map on some compact open analytic subgroup `H₀` is given by a convergent `B`-valued power series. Identify `B^{H-la}` with the generic orbit-map carrier `colim_(H₀,h) C^an_h(H₀,B)^{H₀}`, formed from the supplied scalar analytic-function stages by completed Banach tensor with `B` over `ℚ_p`, with its `B`-valued restricted-series realization. Here `(g·f)(x)=g·f(g⁻¹x)`, and evaluation at the identity has inverse `b↦(x↦x·b)`. At each analytic stage prove these maps are mutually inverse continuous linear maps onto the analytic vectors with their orbit-series norm. Compatible restriction to a common smaller subgroup and radius makes them a topological linear isomorphism on the locally convex inductive limits, independent of the cofinal chart/radius system. This is the identification of the tower analytic vectors through orbit maps; its output action is right translation `(r_g f)(x)=f(xg)`, transported by evaluation to the original left action on B. This supplies a proved identification with the generic underived carrier, its topology and differentiated action, also for the tower specialization of downstream `CompletedCohomologyPartII` §F.4. Differentiate the convergent orbit series termwise to obtain the continuous `Lie(H)` action on each radius, compatible with restriction of radii; the bracket identity follows by differentiating the group law. Multiplication satisfies the Leibniz rule. On the charts in Pan §5.2.5 and §5.3.5, the Hodge–Tate pullback of the horizontal nilpotent line annihilates these vectors; the explicit Kodaira–Spencer computation is Pan Theorems 5.2.6 and 5.3.6, pp. 57–58 and 64. This is the Higgs compatibility used in the two series descriptions, not an assertion about arbitrary affinoid continuous actions. The API the convergent tower orbit series, lie derivative, radius restriction and nilpotent line annihilates belongs here. Check invariant constants have zero derivative; the derivative of a product obeys Leibniz; a continuous orbit map lacking a convergent local expansion is excluded. Restricting to smaller analytic subgroups leaves the union unchanged.

**Checks.**

- An invariant constant has derivative zero for both group actions; multiplication of analytic vectors satisfies the Leibniz rule.
- Restriction to a smaller open analytic subgroup preserves the union of analytic-vector spaces; a continuous orbit map without a convergent local series is excluded.
- For an invariant constant `b`, the inverse of evaluation is the constant orbit function `x↦b`. For the translation action on `C(ℤ_p,ℚ_p)`, a continuous function lacking a locally convergent power series belongs to neither analytic-vector carrier.
- Under the orbit-map isomorphism, right translation of functions transports to the original left action, and differentiation gives the same Lie action at every common radius.
- At `k=0` the transported operator has order one; for general `k` it has order `k+1` and a nonzero scalar. Changing the coordinate normalization requires transporting that scalar.

*Needs:* §12.11; §12.5; §12.10; `TauCetiRoadmap.LocallyAnalyticDistributions` §§0.0–0.3 (locally convex spaces, analytic-function stages, charts and inductive topology).

### 12.17 Classical tower versus the basic Hecke fibre

The diamonds of the classical `LT/Dr` EL tower levels are isomorphic to the corresponding basic minuscule modification functor at those levels. The isomorphism respects the universal Tate local system, the two period maps, the framing/level actions and Weil descent. The infinite-level comparison and its cohomological realization are exported from Layer 12. No general `EL`/PEL Rapoport–Zink representability or full Hecke/Satake construction is claimed here.

*Hypotheses.* At hyperspecial/parahoric level impose SW20 connectedness and local-model hypotheses; in the PEL extension `p≠2`. For the required formal `O_E`-module case use the EL restriction-of-scalars specialization.

([Peter Scholze and Jared Weinstein — Berkeley lectures on p-adic geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorem 24.2.5 and Corollary 24.3.5, pp. 227–231.)

Map a `p`-divisible deformation to its vector-bundle modification via the local classification theorem. Show the Tate kernel is the trivial bundle and reconstruct the `p`-divisible group on geometric points. Use the GM étale map and the universal lattice local system to promote the geometric-point comparison to a diamond isomorphism. Match all levels by the same local system and transport actions; combine with the independent tower-cohomology comparison.

**Checks.**

- At `n=1` and first full `ϖ`-level, over a point with a chosen Tate lattice the nonzero frames of its residue line form `(O_E/ϖ)×`, with `q−1` elements. The zero-dimensional period flag by itself does not recover this finite-level fibre.

- A pointwise bijection alone fails the diamond-isomorphism target.
- At `n=1` the modification is a line-bundle modification of degree one, with its rank-one Tate lattice and height translation; forgetting the lattice would lose the level data.

*Needs:* §12.9; §12.11; §12.13; §12.5.

### 12.18 Automorphic trace comparison and local extraction

Apply the independent compact-unitary trace comparison to the raw cohomology and isolate the global automorphic constituents with prescribed supercuspidal local factor. The nearby-cycle decomposition then extracts the local LT Weil representation and identifies it with the Layer 10 normalized parameter of the contragredient in Dat’s tensor convention, fixing the scalar and the central character. The proof must be independent of the downstream local–global compatibility theorem and of the downstream excursion-parameter comparison.

*Hypotheses.* Use independent Layer 6 trace identities and Layer 10 classical parameter conventions. Use the early cyclic base change of Layer 6 rather than a later tower realization.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §4.1, pp. 28–29.)

Use independently available global test functions to isolate the chosen finite local supercuspidal factor. Compare geometric raw cohomological traces and automorphic spectral traces including component and volume factors. Use the nearby-cycle decomposition to identify the surviving local factor. For the scalar and normalization use Boyer, *Monodromie*, Proposition 5.2.3, pp. 24–25: the Igusa/Harris–Taylor local-system Euler characteristic is the global automorphic multiplicity times the normalized local reduction. Its proof is the compact-unitary trace comparison with a discrete-series test at an auxiliary place and an unramified test at the distinguished `p`-adic split place. Combine this with the actual concentration of §12.15, so there is no Euler cancellation to invert. Boyer §2.3, Theorems 2.3.3 and 2.3.5, p. 12, gives the `G×D×W` action extension and ordinary LT representation. Apply the equivariant smooth duality of Dat Lemma 3.5.13, p. 27: compactly supported degree `n−1+i` is the dual of ordinary degree `n−1−i`, with twist `(1−n)`. This gives exactly Dat Theorem 4.1.2, pp. 28–29, including the contragredient parameter and its half twist.

**Checks.**

- No edge from the downstream local–global compatibility theorem or the downstream excursion-parameter comparison enters this proof.
- A character identity must be upgraded to a degree-wise sector isomorphism using the independent concentration theorem.

*Needs:* §9.1; §12.15; §6.23; §6.10; §10.26; §10.30; §4.7a.

### 12.19 Arithmetic descent of the rank-two central quotient

For the rank-two Drinfeld tower in CDN23’s conventions, the quotient `M_n^ϖ` by the chosen central uniformizer action descends from `brevé E` to `E` with its `G′` action. Its base change to a finite extension `K/E` is therefore the arithmetic space `M_n,K^ϖ`, with the specified continuous Galois action on étale cohomology. Descent is obtained from the Weil cocycle including the height translation, not by discarding the descent datum after geometric base change.

*Hypotheses.* Restrict this additional endpoint to the rank-two setting and fields covered by CDN23. Use the precise central quotient and quotient group `G′` of that source.

([Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł — Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §0.2.1, p. 4 (published copy).)

Compute the component action through determinant, reduced norm and local reciprocity as in CDN23 §0.2.1. The central scalar `ϖ I₂` translates height by 2, so the quotient retains height classes `ℤ/2`. A Frobenius generator translates by `±1` and exchanges these classes. Retain this finite permutation in the Weil descent cocycle. Prove that the cocycle on the finite-level formal/rigid models extends continuously to Galois descent and is effective, using the descended models of CDN23 §0.2.1; a finite permutation of components alone does not prove effectivity on the whole space. Match `G′` and the coefficient Galois action after finite extension.

**Checks.**

- Arithmetic `H_et(M_n,K^ϖ,−)` is not confused with geometric `H_et(M_n,C^ϖ,−)`.
- On the two height classes Frobenius acts by `0↦1↦0`, while `ϖ I₂` acts by `h↦h+2=h` in `ℤ/2`. Replacing the Frobenius action by the identity gives the wrong value at 0.
- The square of Frobenius fixes each height class; this does not assert that it acts trivially on a finite-level cover or its cohomology. The full descent cocycle survives the group-action comparison.

*Needs:* §12.7; §12.14.

### 12.20 Actual supercuspidal cohomology in Dat conventions

Let `ρ` be an irreducible smooth `D×` representation such that `π_ρ=JL(ρ)` is supercuspidal, with central character treated as above. For the full tower, or its correctly untwisted quotient model, `H_c^i(M_LT)[ρ]=0` for `i≠n−1` and `H_c^(n−1)(M_LT)[ρ]≅π_ρ⊗rec_E(π_ρ∨)|·|^((1−n)/2)` as `GL_n(E)×W_E` representations. The same identity holds for the Dr tower in the common Dat action convention. These are actual cohomology groups, not virtual representations. Here `[ρ]` is the tensor convention already defined.

*Hypotheses.* Ell`≠p` and characteristic-zero coefficients. Use the compact-unitary realization of §§12.15 and 12.18 and the degree concentration proved in §12.15. Only the `d_ρ=1` (supercuspidal) specialization of Dat is used.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), Theorem 4.1.2 (credited to Boyer), p. 28.)

Specialize Dat 4.1.2 to `d_ρ=1`. Only `i=0` is defined in its degree `n−1+i` indexing; the vanishing for `1≤i≤n−1` follows from Boyer’s range, with all indices outside `0≤i≤d_ρ−1` excluded. Identify the unique smooth factor with `JL(ρ)` and retain rec of its contragredient. The ordinary-to-compact conversion in §12.18 fixes the contragredient and the twist, while §12.15 supplies the actual vanishing; the trace formula alone would not supply it. Use the integral equivariant tower comparison to transfer the degree-wise result to Dr.

**Checks.**

- The degree is exactly `n−1` and the exponent is `(1−n)/2`.
- The Weil factor is `rec(π_ρ∨)`; replacing it by `rec(π_ρ)` without changing conventions fails.

*Needs:* §12.14; §12.18; §12.13.

### 12.21 Perfectoid Stein covers and Mittag–Leffler

In the setting of CDN23 §3 — the Lubin–Tate tower of `GL_n(F)` at infinite level over `ℂ_p`, for every `n≥1` (the paper applies it with `n=2`), and hence the Drinfeld tower through the duality isomorphism — choose an increasing Stein affinoid perfectoid cover `{U_s}`. For every `i` and `k≥1` the restriction inverse system `{H_et^i(U_s,Z/p^k)}` is Mittag–Leffler. Thus its derived inverse-limit obstruction `R¹lim` vanishes. This `p`-primary statement is separate from the `ℓ≠p` compact-support realization and does not assert that arbitrary perfectoid covers are Mittag–Leffler.

*Hypotheses.* The cover is a Stein affinoid perfectoid cover as in CDN23 3.10. The source’s compact `p`-adic Lie level group acts on its standard exhaustion.

([Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł — Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Lemma 3.10 and Corollary 3.11, pp. 35–36.)

Reduce by dévissage to `k=1`. Tilt each `U_s` and use Artin–Schreier plus affinoid perfectoid acyclicity; for `i≥2` the groups vanish. For `i=1` use density of the Stein restriction maps and the Artin–Schreier quotient. For `i=0` use the compact Lie-group description of components and stabilization of the ascending closed-subgroup chain.

**Checks.**

- The `i=0` argument is included; higher acyclicity alone does not settle it.
- The exhaustion must satisfy CDN23 Lemma 3.10, pp. 35–36; a general perfectoid covering is not a substitute.

*Needs:* §12.8; `TauCetiRoadmap.PerfectoidSpaces` §§5.1–5.12 (finite-stage descent) and Layer P7 (tilde-limits); §12.19.

### 12.22 The two basic Hecke orientations

For a supercuspidal `π` of `GL_n(E)`, put `σ=JL⁻¹(π)` and let `ρ_π` be its classical Weil parameter. In the standard geometric orientation of the basic minuscule modification, the `σ` input has LT output `π⊗ρ_π`; the reverse Dr orientation with input `π` has output `σ⊗ρ_π∨`. Both statements use the perverse normalization `Λ[n−1]((n−1)/2)`, so the supercuspidal output is in degree zero. The inputs are the smooth representation sheaves on the source strata, and extraction uses the right action of the corresponding source torsor. These statements fix the two native orientations; they do not identify their tensor selectors with Dat's notation `[ρ]`.

*Hypotheses.* The basic class has invariant `1/n`; `π` is irreducible supercuspidal; the square root and Weil convention are fixed as in §12.2.

([Laurent Fargues and Peter Scholze — Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4), IX.7.4, p. 338; [Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §§3.3–3.5 and Theorem 4.1.2, pp. 21–29.)

Identify each modification fibre with its classical tower by §12.17. Apply the classical supercuspidal realization to that fibre with its own source-torsor right action; Verdier duality exchanges the standard and reverse modifications and dualizes the Weil factor. The shift and half twist remove the middle degree and its weight. This is the geometric calculation in FS IX.7.4; the Dat realization remains the separate statement of §12.20 with its explicit inverse-pullback action. No further natural isomorphism between those conventions is part of this target.

**Checks.**

- At `n=1` both normalization exponents vanish and the two Weil factors are dual characters.
- Applying the two orientations successively gives `σ⊗ρ_π⊗ρ_π∨`; the source-torsor selectors are retained in the composite.
- Replacing `rec(π∨)` in the Dat formula without converting the source action does not establish either native-orientation statement.

*Needs:* §12.17; §12.20; §12.2; §10.26; §10.30; §4.7a; §10.18; §10.23; §10.25.

### Examples

For `n=1` the period target is a point and the tower still carries its level and Weil actions. All integer heights are present: composing a framing quasi-isogeny with a uniformizer shifts height, and the inverse gives negative heights. In SW20 covariant conventions the multiplicative height-one object has `b=p⁻¹`, Newton slope `−1` and bundle degree `+1`; the modification `O` to `E_b` has a one-dimensional Lie cokernel. For a supercuspidal division sector, actual compact-support cohomology is concentrated in degree `n−1`. Its Dat tensor action selects the dual division representation and the corresponding dual Weil parameter with the stated half twist. This actual statement is stronger than the virtual compact-`GL(O)` calculation in Layer 10.

### Dependencies

`TauCetiRoadmap.AdicSpaces` Layer 6 (the Fargues–Fontaine curve); `TauCetiRoadmap.PadicHodgeTheory` §7.5 (relative periods and unramified chartwise curves); `TauCetiRoadmap.PerfectoidSpaces` Layers 1–2 (perfectoid fields and tilting), 5 (finite-stage descent) and 7 (tilde-limits); `TauCetiRoadmap.DiamondsAndVStacks` §6.9 (Seminormal rigid full faithfulness); `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2 (Dieudonné theory); §10.20; §10.30; §10.26; §4.7a; §10.23; §10.25; §10.2; `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.2.25 (The Tate module sheaf and the universal cover of a `p`-divisible group); `TauCetiRoadmap.PerfectoidSpaces` §§5.1–5.12 (finite-stage descent) and Layer P7 (tilde-limits); `TauCetiRoadmap.LocallyAnalyticDistributions` §0.3 (Polydiscs, charts and compact manifolds); `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.0 (the smooth category and its basic API); `TauCetiRoadmap.DiamondSixOperations` Layer S2: The exceptional direct image for eligible maps of small `v`-stacks; `TauCetiRoadmap.AdicCoefficientsAndComparisons` Layer L0: Adic coefficients; §10.4; `TauCetiRoadmap.ClassicalAdicEtaleCohomology` §4 (Formal specialization and semistable nearby cycles); §9.1; `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles` LPV.6: Perverse nearby cycles; §6.23; §6.10; §10.18.

## Layer 13: pure automorphic transfer and level comparison

This branch uses pure automorphic transfer and the generic packet formulas. Local quotient compatibility, definite–indefinite switches and finite compact-level dimensions keep each relevance, temperedness and central-character hypothesis. No rational Igusa trace or torsion-concentration result proves these assertions.

### 13.1 Weak unitary base change and standard pairs

Let `F/F+` be CM, `V` a standard definite or standard one-place-indefinite hermitian space, and `π` an automorphic `U(V)` representation. A weak automorphic base change is an automorphic representation `Π` of `GL_N(A_F)` that is a finite isobaric sum of discrete automorphic representations and whose unramified local parameters match local base change at all but finitely many places of `F+`. A standard pair requires `π_f` to occur in the stated raw Shimura cohomology (degree zero in the definite case, some degree in the indefinite case). Strong multiplicity one gives uniqueness of `Π` when it exists; weak base change alone specifies neither every bad local factor nor every packet member.

*Hypotheses.* Standard means the signatures and finite-local conditions of LTXZZ Definition 3.2.7. Use finite isobaric sums, not only cuspidal `GL_N` representations.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Definitions 3.2.3 and 3.2.7; Proposition 3.2.8, pp. 144–146.)

The interface consists of the following operations and identities.

- The good-place unramified parameters match the fixed `L`-embedding.
- Record the `GL_N` isobaric datum and its central character.
- Two isobaric transfers with the same almost-everywhere parameters are isomorphic.
- Expose the raw finite-part cohomological occurrence and the standard signatures.

Use the canonical models of the abelian-type unitary Shimura varieties Sh`(V,K)` attached to `Res_{F+/Q}U(V)` (these are not PEL moduli of similitude groups) and, for definite `V`, the finite Shimura sets; take their raw cohomology. Define the unramified parameter-matching predicate. Use strong multiplicity one for uniqueness in the isobaric class. Record that LTXZZ attributes existence to Shin’s cohomological base change for unitary similitude groups (their reference `[72]`, Theorem 1.1, adapted as in their Proposition D.1.3) and, for definite `V`, also to Labesse (their reference `[42]`, Corollaire 5.3); both run through independent stable trace identities.

**Checks.**

- At a split place `U(V)(F+_v)≅GL_N(F_w)`, the selected component is the corresponding `GL_N` representation.
- Almost-everywhere equality does not certify an arbitrary chosen ramified packet member.
- For a definite space the occurrence witness is degree-zero Shimura-set cohomology.
- Residual Speh possibilities remain until cuspidality is separately established.

*Needs:* §6.27; §6.25; §6.8; §6.6; §6.24; `TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a (**Number-field GLₙ residual blocks**); `TauCetiRoadmap.ShimuraVarieties` §6.7 (Canonical models of abelian type).

### 13.2 Automorphic inputs to `GSp₄` solvable descent

Export cyclic `GL₄` descent and the general-type `GL₄↔GSp₄` transfer contract required in BCGP 1.8.22 and Proposition 7.5.3. For a `χ`-self-dual cuspidal `GL₄` representation, symplectic type is detected by a pole at 1 of the twisted exterior-square `L`-function, and general-type descents have all-place standard-parameter matching and multiplicity one. The BCGP solvable-descent applications take as input a given irreducible Galois representation over `Q` with multiplier `ε⁻¹`, its given automorphic realization over a solvable CM or totally real extension, and the stated Tate twist; the construction of those Galois realizations is external to this part.

*Hypotheses.* Use the symplectic classification contract of §§11.0g–11.0h, with the fixed normalizations. The `GSp₄` packet classification and transfer of §11.1 is an input, including the similitude central character. Keep the twists and `|·|²` central character in BCGP 7.5.3; no descent is asserted without irreducibility over the extension.

([George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni — Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), §1.8.22, p. 15; Proposition 7.5.3 and proof, p. 175 (arXiv copy).)

Use cyclic descent iteratively over the solvable chain, retaining the class-field twists. Use §11.1’s symplectic-type/general-type transfer classification to identify the descended automorphic parameter. Check the oddness obstruction excluding orthogonal type in the regular `|·|²`-self-dual `Q` case. Leave comparison with the given Galois realization and its construction to the downstream Galois consumer.

**Checks.**

- The similitude character is part of the exported parameter.
- No edge from the downstream automorphic Galois construction is introduced into the pure automorphic branch.

*Needs:* §6.24; §6.26; §11.1.

### 13.3 Automorphic induction of a quadratic Hecke character

Export the quadratic rank-one automorphic induction theorem used by BCGP Lemma 10.2.4: if a given irreducible two-dimensional potentially abelian de Rham Galois representation is not finite up to twist, the consumer identifies it as `Ind_(G_K)^(G_F)ψ_p` for a quadratic `K/F` and an algebraic Hecke character `ψ` with distinct conjugates. The automorphic output required here is the cuspidal `AI_K/F(ψ)`, with the induced unramified parameters and determinant including the quadratic extension character. The classification of the given Galois representation is the consumer’s input, not a new construction here.

*Hypotheses.* The Hecke character and the quadratic induction identification are supplied as input. Distinct conjugates are essential to cuspidality.

([George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni — Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), Lemma 10.2.4, p. 213 (arXiv copy).)

Apply the rank-one prime-degree automorphic induction theorem. Use the nontrivial Galois orbit to prove cuspidality. Compute the induced unramified parameters and central character. Expose the finite-up-to-twist alternative as a separate consumer case.

**Checks.**

- If `ψ` is Galois-invariant, the induced automorphic representation is an isobaric sum, not cuspidal.
- The determinant includes the quadratic permutation character.

*Needs:* §6.26.

### 13.4 Pure cohomological unitary transfer

For a standard pair `(V,π)`, the independent unitary stable trace comparison and complex spectral decomposition produce the weak isobaric base change `Π`. At split and good unramified places the character/Satake identities use the chosen `L`-embedding, and at infinity `Π` has the corresponding cohomological infinitesimal character. The identities include the central character and normalized intertwiner coefficients. They are exported to the downstream automorphic Galois construction without using Igusa concentration or any constructed global Galois representation.

*Hypotheses.* Use the Layer 6 stable/twisted trace identities, the regular algebraic infinity type and the admissible finite test functions of the standard pair. LTXZZ Proposition 3.2.8, p. 146, gives the cohomological specialization of Shin’s base change; for definite `V` the corresponding existence result is Labesse Corollaire 5.3.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Proposition 3.2.8, p. 146; [Sug Woo Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4, Proposition 4.8, p. 28, and Corollary 4.14, p. 30.)

Use the complex spectral decomposition of raw cohomology and real Lefschetz test functions. Transfer finite test functions using Layer 4 and compare twisted discrete spectra. Use the residual classification and cyclic base-change steps to identify the isobaric `GL_N` constituents. Apply strong multiplicity one to identify the good-place character and infinity type. The stable comparison first identifies the unramified Hecke character in the twisted GL discrete spectrum; the regular algebraic infinity character and residual classification determine its isobaric constituents. Shin’s Proposition 4.8 and Corollary 4.14, pp. 28–30, give this comparison, and Labesse, *Changement de base CM et séries discrètes*, §5, Corollaire 5.3, pp. 45–47, gives the definite specialization with discrete infinity type.

**Checks.**

- The proof has no prerequisite in Layer 14 or the downstream integral concentration theorem.
- The theorem makes good-place and infinity assertions, not all-place packet matching.

*Needs:* §13.1; §6.22; §6.26; §6.10; §6.25; §6.27; §6.9; §6.8; §6.6.

### 13.5 Local unitary Langlands quotient compatibility

For an unramified quadratic nonarchimedean extension `E/F` and a unitary group `U(V)`, write an irreducible local representation as a Langlands quotient with tempered data `τ₀` on a smaller unitary group and `τ_i` on `GL_(r_i)`, and unramified characters `α_i` with `α_i(ϖ)=a_i` and `1<a₁<⋯<a_t`, following LTXZZ C.1. Thus `α_i=ν^{−log_q(a_i)}`, where `ν=|·|_E` and `q` is the residue cardinality of E. Its `GL_N` base change is the Langlands quotient of the symmetric list `τ_t^(∨c)α_t⁻¹, …, τ₁^(∨c)α₁⁻¹, BC(τ₀), τ_1α₁, …, τ_tα_t`. Spherical base change matches Satake via the fixed `L`-embedding. The displayed GL list has decreasing `ν`-exponents and uses the normalized upper-parabolic quotient. These are classification outputs from §§11.2 and 11.4; defining weak global transfer does not prove them.

*Hypotheses.* Use the unitary classification contract of §§11.0d–11.0e, with the fixed normalizations. The tempered local unitary classification and base-change theorem is §11.2. Retain `1<a₁<⋯<a_t` and the resulting decreasing `GL ν`-exponents in normalized upper-parabolic induction.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Appendix C.1, pp. 351–352.)

Use the Langlands classification to identify the unique standard module. Apply local base change to tempered unitary data and the conjugate-dual paired GL blocks. Match the dominant exponents and pass to the unique irreducible quotient. Verify the spherical case using Satake, not a global a.e. argument.

**Checks.**

- The GL list has total `rank N₀+2Σr_i`.
- In rank two, `α(ϖ)>1` gives `α⁻¹,α` in decreasing `ν`-exponent order. For `α=ν⁻¹ᐟ²` the GL quotient is trivial; reversing that list selects the Steinberg quotient.
- Replacing conjugate dual by ordinary dual gives a different list over a CM extension.

*Needs:* §11.4; §6.8; §6.6; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.3 (Coefficient change, Ext and local blocks); §10.26; §10.30; §13.1.

### 13.6 Relevant generic packet multiplicity one

For a relevant `GL_N(A_F)` representation `Π` in the sense of LTXZZ 1.1.3 (cuspidal, conjugate self-dual with its specified infinity type), and a standard definite or standard indefinite `V`, every irreducible admissible `π` on `U(V)` whose local base change equals `Π_v` at every place occurs in the discrete automorphic spectrum with multiplicity one. Conversely, an automorphic `π` with weak base change `Π` matches `Π` at every place. At nondistinguished infinity `π_v` is trivial; at the distinguished indefinite infinity its allowed components are the `N` discrete series with Harish–Chandra set `{(1−N)/2,(3−N)/2,…,(N−1)/2}`.

*Hypotheses.* Use the unitary classification contract of §§11.0d–11.0e, with the fixed normalizations. Relevant generic cuspidal `Π` and the standard hermitian spaces are essential. Use §11.4’s generic global multiplicity formula together with the local packets of §§11.2–11.3; the assertion excludes arbitrary nongeneric Arthur parameters.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Proposition C.3.1, p. 363.)

Apply the generic global unitary packet theorem with the appropriate inner-form relevance conditions. Use the global multiplicity formula to prove occurrence and multiplicity one for the specified standard forms. Upgrade weak transfer to all-place matching using that same classification theorem. Compute the infinity components from the fixed cohomological parameter.

**Checks.**

- There are `N` allowed distinguished indefinite infinity components, not an arbitrary multiplicity `N` for a single automorphic `π`.
- An arbitrary weak transfer does not prove this theorem without the relevant generic hypotheses.

*Needs:* §13.4; §13.5; §11.4.

### 13.7 Transferable compact levels

A compact open `K_v` in `U(V)(F+_v)` is transferable if for each endoscopic `H` the characteristic function `1_Kv` has an endoscopic transfer `f_Kv^H` associated to a compactly supported GL-side function `φ_Kv^H` under base change, and for the full-rank quasi-split `H` the GL-side function may be supported on a maximal compact. An inertial transfer is the selected full-`rank φ_Kv`. The characteristic function is unnormalized: conversion to the idempotent divides by `vol(K_v)`.

*Hypotheses.* Use the unitary classification contract of §§11.0d–11.0e, with the fixed normalizations. Fix transfer factors from Layer 2 and the associated-function convention and Haar measures from Layer 4. A transfer is a selected witness, not a unique test function. The level sets retain their source hypotheses; hyperspecial places use §4.10a, and the prescribed small levels use §6.14.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Definition D.2.1 and Lemma D.2.2, p. 369.)

The interface consists of the following operations and identities.

- Gives associated transfer functions for every relevant H.
- Project to the selected full-rank GL transfer.
- Hyperspecial levels outside `Σ_min∪Σ_lr` use the unit function under both fundamental lemmas, above their residue-characteristic bounds.
- With `e_K=1_K/vol(K)`, divide each associated transfer witness by the same source volume `vol(K)`. Thus the inertial transfer of `e_K` is `φ_K/vol(K)`; normalized intertwiners do not absorb this scalar.
- Matching packet traces depend on the transfer class, not the chosen representative.

Form the associated-test-function predicate for each elliptic endoscopic datum. Specify a witness for the full-rank transfer and its maximal-compact support. Use split identity transfer, hyperspecial fundamental lemmas, or the small-level theorem as appropriate. Keep the selected witnesses and prove trace independence at this roadmap-sum level.

**Checks.**

- Under the split `GL_N` identification, a chosen `1_K` transfers to itself with the same Haar measure.
- `tr π(1_K)=vol(K) dim π^K`, while `tr π(e_K)=dim π^K`.
- An arbitrary ramified nonsplit `K` is not declared transferable without the required witnesses.
- At good inert places outside `Σ_min∪Σ_lr` the hyperspecial transfer is the `GL_N` hyperspecial characteristic function.

*Needs:* §6.14; §6.9; §6.8; §4.6; §4.9; §4.10; §4.7; §13.5.

### 13.8 Definite and indefinite packet switches

For even `N=2r`, standard definite `V` and indefinite `V′` agree outside one inert finite place `p` and the distinguished infinity. If `π` has trivial infinity, cuspidal base change and its `p`-component lies in the special set `S` of LTXZZ C.2.5, replace it by the matched `S′` component and any distinguished discrete series with Harish–Chandra set `{1/2−r,…,r−1/2}`; the resulting `π′` has discrete multiplicity one. For odd `N=2r+1`, the reverse switch from a cuspidal-base-change indefinite `π′` with unramified `p`-component and infinity set `{−r,…,r}` to the definite unramified matching component has multiplicity one.

*Hypotheses.* Use the unitary classification contract of §§11.0d–11.0e, with the fixed normalizations. Use the exact even `S/S′` local packet comparison or the odd unramified comparison. The spaces are fixed isomorphic at every unchanged place.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Corollaries C.3.2 and C.3.3, p. 364; Proposition C.2.5, p. 362.)

Preserve local base change at unchanged places by the fixed identifications. Apply the local packet comparison at `p`, including the lattice and parity hypotheses. Use the classified infinity components to preserve the global parameter. Invoke relevant packet multiplicity one for the resulting all-place matching representation.

For the definite member, identify `H⁰(Sh_K,ℚ̄_ℓ)` with functions on its finite complex uniformization `G(Q)\G(A_f)/K`, after the fixed coefficient-field comparison. With an algebraic coefficient `V`, the equivariance at infinity identifies this with the algebraic-coefficient automorphic functions of ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7. Hecke correspondences act by the same finite double-coset sums, so the identification is equivariant, not just a dimension equality. The complex uniformization is the zero-dimensional Shimura datum, and all higher complex cohomology vanishes. This gives the definite eigenspace in LTXZZ Corollary C.3.2, p. 364, and Proposition D.2.3, pp. 368–372. Check the constant function on each point gives one basis vector; a disconnected finite set contributes one dimension per point; forgetting a nontrivial coefficient equivariance changes its automorphic multiplicity.

**Checks.**

- Even and odd switches have different directions and finite-place assumptions.
- Without membership in `S`, the even `p`-component cannot be freely replaced.

*Needs:* §13.6; §13.5; §11.4; §6.8.

### 13.9 Packet oldform dimension identities

Use all the data of LTXZZ D.2: even `N=2r`, relevant `Π` with `Π_w` tempered at every finite place `w` of the CM field, disjoint `Σ_min` and `Σ_lr, Σ_min` containing the bad places, both together containing the ramified places of `Π`, inert nonsplit places in `Σ_lr` with special maximal `K_v`, hyperspecial levels outside `Σ_min∪Σ_lr`, and transferable `K_v` at `Σ_min` as in §6.14. Put `c_v=1` at `v∈Σ_lr` exactly when `Π_v` is normalized induction of `α_r⁻¹,…,α₂⁻¹,St₂,α₂,…,α_r` with `|α_i|=1`, otherwise `c_v=0`. For the raw inertial transfers `φ_Kv` of §13.7 put `φ̃_Kv=φ_Kv/vol(K_v)`, the transfers of `e_Kv`. Then the definite `Π`-eigenspace dimension is `|∏_(v∈Σ_min)(tr(Π_v(φ_Kv)A_Πv)/vol(K_v)) ∏_(v∈Σ_lr)c_v|`, equivalently the product with `φ̃_Kv` and no volume denominators; the indefinite middle-degree dimension is `N` times this value.

*Hypotheses.* Use the unitary classification contract of §§11.0d–11.0e, with the fixed normalizations and, separately, finite-place temperedness `∀ w finite, Π_w` tempered. Relevance fixes cuspidality, conjugate self-duality and the infinity type; it does not include this Ramanujan input. Use the specified normalized local intertwiners and fixed common transfer measures. Every invariant-dimension factor uses `e_Kv`; raw transferred traces carry the inverse source volume `vol(K_v)⁻¹`. This includes conversion from the level-dependent unit-volume Haar measures of LTXZZ Remark 5.8.2 to the fixed measures of §13.7. At `Σ_lr` the zero/one `c_v` is already the trace of `e_Kv`, and the hyperspecial factors outside `Σ_min∪Σ_lr` are likewise idempotent traces equal to one. Middle-degree concentration is the characteristic-zero tempered cohomological-packet Matsushima calculation for this standard datum. The finite-place hypothesis also supplies the local special-maximal zero/one calculation.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Definition 1.1.3, p. 110; Proposition 3.2.4(1), p. 145; Lemma C.2.4, pp. 360–361; Remark 5.8.2, p. 225 (level-dependent measures); Proposition D.2.3 and its setup, pp. 368–372.)

Use relevant packet classification and the tempered cohomological infinity type to restrict raw cohomology to the specified infinity components. At each special-maximal finite place use the separate finite-place temperedness hypothesis with LTXZZ Lemma C.2.4 to obtain the zero/one `c_v`. LTXZZ derives this finite-place hypothesis from its Proposition 3.2.4(1), using Caraiani’s Ramanujan theorem; here it is an explicit input of the oldform statement, independent of the unitary classification contract (§§11.0d–11.0e). Sum `dim π_v^K` over local packet members at the remaining bad places. Prove the identity between packet sums of invariants and normalized traces by passing to an auxiliary totally real quadratic extension in which every place of `Σ_min` splits, every place of `Σ_lr` is inert and the base change of `Π` stays cuspidal, and by using Shin’s definite-case dimension formula there (LTXZZ pp. 370–371, citing their references `[71]` and `[72]`). Apply the transferred trace identity to `e_Kv` and its transfer `φ̃_Kv` with normalized intertwiners. By linearity this divides each raw trace at `Σ_min` by `vol(K_v)`; the standard infinity packet contributes 1 in the definite case and `N` in the indefinite case.

The characteristic-zero cohomology calculation used here is a target for the specified real group `U(N−1,1)×U(N)^{d−1}`. At sufficiently small level the compact Shimura manifold has Matsushima decomposition

`H^j(Sh_K,V_ξ)⊗C ≅ ⊕_π m(π) π_f^K⊗H^j(𝔤,K_∞;π_∞⊗ξ)`.

For the relevant tempered cohomological packet at the noncompact factor, relative rank defect is zero and the only contributing degree is `N−1`. Its `N` discrete-series members each contribute a one-dimensional relative Lie-algebra cohomology space there; the compact factors contribute in degree zero. Use ArithmeticLocallySymmetricSpaces §ALS.5b.1 for Matsushima’s comparison and compute the discrete-series relative cochains of §§ALS.F.5–ALS.F.7, compute `q₀=N−1` and `ℓ₀=0`, and count the `N` Weyl cosets for this packet. This is the infinity factor in LTXZZ Proposition D.2.3, pp. 368–372. No analogous vanishing is claimed for arbitrary nontempered residual packets. Thus the factor `N` used below follows from the relevant-tempered hypothesis and this real calculation.

**Checks.**

- At a split place let `K₀=GL₂(O_v)` have volume one and `K=ker(GL₂(O_v)→GL₂(k_v))`. For an unramified irreducible tempered principal series, `dim σ^K=q+1`, `[K₀:K]=q(q−1)²(q+1)` and `tr σ(1_K)=1/(q(q−1)²)`. Dividing by `vol(K)` recovers `q+1`; at `q=3`, the raw trace is `1/12`, the volume is `1/48` and the invariant dimension is 4.

- At `N=2` the two relevant discrete-series members each contribute in degree one, while the definite infinity member contributes once in degree zero. Trivial coefficients alone do not imply temperedness; the degree-concentration assertion still requires the relevant-tempered hypothesis.

- If some `c_v=0` both specified eigenspaces vanish by the special-maximal calculation with finite-place temperedness. Relevance and the unitary classification contract (§§11.0d–11.0e) alone do not furnish that local hypothesis.
- For `N=2` and all local factors one, the indefinite dimension is twice the definite dimension.

*Needs:* §13.7; §13.6; §13.8; §11.4; §6.10; §6.14; §6.9; §6.25; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, **Archimedean GLₙ parameters**; `TauCetiRoadmap.ArithmeticLocallySymmetricSpaces` §§ALS.F.5–ALS.F.7 (relative cochains and algebraic coefficients).

### Examples

For cyclic prime degree `r`, an automorphic representation without the class-field self twist has cuspidal base change. With the self twist its lift is the sum of `r` distinct conjugate lower-rank cuspidals; at `rank r` a quadratic-character example gives two characters after quadratic base change. In a definite Shimura set the degree-zero Hecke eigenspace is the space of algebraic automorphic forms on the finite double cosets. In the indefinite unitary case each relevant discrete series contributes one dimension in degree `N−1`; the sum over `N` discrete series gives the stated dimension factor, subject to relevance, finite-place temperedness and finite compact-level transfer.

### Dependencies

§6.27; §6.25; §6.8; §6.6; §6.24; `TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a (**Number-field GLₙ residual blocks**); `TauCetiRoadmap.ShimuraVarieties` §6.7 (Canonical models of abelian type); §6.26; §11.1; §6.22; §6.10; §6.9; §11.4; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.5.3 (Coefficient change, Ext and local blocks); §10.26; §10.30; §6.14; §4.6; §4.9; §4.10; §4.7; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors`, **Representation prerequisites**, **Archimedean GLₙ parameters**; `TauCetiRoadmap.ArithmeticLocallySymmetricSpaces` §§ALS.F.5–ALS.F.7 (relative cochains and algebraic coefficients).

## Layer 14: rational Igusa spectral comparison

Use the early rational Igusa object and stabilized trace to form the exact CSnc test functions. Newton reduction includes the opposite-Jacquet normalization and modulus twist. Signed equality precedes finite virtual factorization; Hecke separation recovers aggregate character coefficients without promoting them to positive multiplicities.

### 14.1 The CSnc test-function package

Use `G=G_(2n)` for `F=F+F₀` and `p` split in `F₀` as in CSnc §5.6. For auxiliary sets `S_pf(N₀)⊂S_pf(N)`, write `φ=φ_p φ_Spf φ^S`. Initially `φ_p` on `J_b(ℚ_p)` is acceptable in the Newton-slope sense of Layers 7–8; `φ^S` is the base-change image of an unramified `GL_(2n)` test function; at `S_pf` use the characteristic functions of the sufficiently small principal congruence levels specified in CSnc. For each elliptic endoscopic `G_vecn` choose the transferred finite functions and the real Lefschetz function `f_vecn,∞`. Retain the Haar measures, transfer-factor `L`-map and normalized `θ`-intertwiner.

*Hypotheses.* Use all field, split-prime, small-level and set inclusions in CSnc §5.6. At unramified hyperspecial places use §4.10a without a residue-characteristic restriction; prescribed small levels satisfy §6.14. Acceptability restricts `φ_p` at first; the extension to arbitrary `φ_p` is a separate theorem.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), §5.6 setup and Theorem 5.6.1, pp. 74–75; [Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), Definition 5.3.1, p. 68.)

The interface consists of the following operations and identities.

- Assemble the test functions from acceptable `φ_p` and the specified finite levels.
- Give the selected transfer for each elliptic endoscopic datum.
- Give the normalized Lefschetz test function.
- Track each unnormalized characteristic function under a change to a Hecke idempotent.

Use Layers 7–8 acceptability to construct the Newton/Levi transfer at p. Use the split auxiliary-place transfer and the unramified base-change map elsewhere. Use the real Lefschetz function with the source infinity type. Record characteristic-function volumes and the endoscopic coefficient without replacing them by normalized unit functions.

**Checks.**

- `φ_p=0` makes every endoscopic and geometric trace zero.
- A principal-congruence level not satisfying the stated smallness and auxiliary-place conditions is not admitted by the source theorem.
- At an auxiliary compact level `K, 1_K=vol(K)e_K`; its trace includes that volume.
- All three finite parts and the infinity test function are present.

*Needs:* §7.3; §6.6; §6.8; §6.9; §6.14; §6.10; §8.1; §8.19; §8.9; §8.18; §6.22.

### 14.2 Normalized Newton reduction to the inner form

Define `Red_b,vecn`:Groth`(G_vecn(ℚ_p))→`Groth`(J_b(ℚ_p))` by summing over the effective endoscopic Levi triples and allowed Levi embeddings, applying their signed normalized opposite-parabolic Jacquet functors, the specified `L`-map transfer (normalized induction among products of GL groups), and the Langlands–Jacquet map to the inner form. Include the transfer character and modulus factor belonging to the selected Layers 7–8 test-function normalization. In Shin’s conventions `Red=`(`n`-Red)`⊗barδ_(P(ν_b))^(1/2)`. The untwisted three-step composite in CS17 §5.4 is Shin’s `n`-Red. The trace identity in CS17 Lemma 5.4.2 requires its tensor product with `barδ_(P(ν_b))^(1/2)`; use this twisted Red also in CSnc’s spectral comparison. The conversion is a mathematical normalization requirement of that identity. A naive unsigned Jacquet-then-JL composition is insufficient.

*Hypotheses.* Fix `b`, its Levi `M_b`, inner form `J_b`, effective endoscopic triples and transfer factors. The character/modulus conversion is the trace calculation of §§8.19 and 8.22, in the CSnc/CS17 conventions specified here.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1 and Lemma 5.4.2, pp. 739–740; [Sug Woo Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.5, (5.14)–(5.16), pp. 36–37 (author copy).)

The interface consists of the following operations and identities.

- Apply the signed sum of Jacquet, GL transfer and inner-form maps.
- Red is additive on virtual representations.
- Expose its effective Levi terms, signs and normalization character.
- The character pairs with the Layers 7–8 transferred test function.
- At split `p`, independent field factors factor with the specified central factor.

At split `p` these groups and their Levis are GL products with a central similitude factor. The construction uses GL-product induction, normalized Jacquet functors and additive inner-form transfer. Enumerate effective Levi triples and admissible embeddings. Apply the normalized Jacquet functor for the prescribed opposite parabolic with its transfer sign. Apply the endoscopic GL-product map and signed Langlands–Jacquet transfer. Insert the prescribed modulus/character twist and prove additivity on Grothendieck groups.

**Checks.**

- For `vecn=(2n)`, the effective endoscopy reduces to the single Levi `M_b` term, with its transfer sign.
- `Red(−[π])=−Red([π])`; no positivity follows.
- Omitting `e_p(J_b)` for a nonsplit inner form breaks the transferred trace equality.
- For a proper endoscopic group all allowed Levi contributions are retained.

*Needs:* §8.8; §8.9; §8.18; §8.19; §6.6; §6.8; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); §10.6; §10.10.

### 14.3 Test transfer is dual to Newton reduction

For acceptable `φ_p` and the fixed transfer `φ_vecn,p`, every virtual `π_p` on `G_vecn(ℚ_p)` satisfies `tr π_p(φ_vecn,p)=tr Red_b,vecn(π_p)(φ_p)`. This identity is exact in the chosen measures and normalization; each transfer step is dual to the corresponding representation step. The local identity is for acceptable `φ_p`, where `φ_vecn,p` is defined; the global trace expansion that uses it is extended to arbitrary compactly supported smooth `φ_p` by the Frobenius-twist argument of Shin 2009, Lemma 6.4, as in the proofs of CS17 Lemma 5.5.1 and CSnc Lemma 5.6.2.

*Hypotheses.* Use the signed and normalized reduction above. For the extension, use the Layers 7–8 acceptable-function extension theorem.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Lemma 5.4.2, p. 740; [Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), Proof of Lemma 5.6.2, pp. 75–76.)

Pair normalized opposite Jacquet modules with the constant-term transfer. Factor transfer through `M_b` and use the signed inner-form character identity. Apply the GL-product induction transfer and the modulus twist. First translate by a sufficiently large scalar power to clear inverse denominators, then by a sufficiently large negative Frobenius power to obtain acceptable support (§8.5). For each scalar exponent use the finite central-character exponential identity to recover Frobenius power zero; a second Vandermonde argument in the scalar exponent recovers the original test (§8.11).

**Checks.**

- The equality is tested on a nontrivial inner form and a proper endoscopic datum.
- An extension by simply declaring all `φ_p` acceptable fails.

*Needs:* §14.2; §14.1; §8.9; §8.18; §8.19; §8.11.

### 14.4 The signed source Igusa trace identity

For the CSnc test functions, `tr(φ|[H_c(Ig^b,Λ)])=τ(G)Σ_vecn ε_vecn I_spec^(G_vecn θ)(f_vecn θ)`, where the sum is over the source elliptic endoscopic groups and `ε_vecn=1/2` for the balanced proper datum `vecn=(n,n)`, and 1 for the other listed data. All global signs and normalization constants inside the invariant distributions are retained. This exact identity is not replaced by the unsigned linear-span statement in Lemma 5.6.2.

*Hypotheses.* `Φ_p` is acceptable: CSnc §5.6 assumes this in the first instance and Theorem 5.6.1 is proved under it; only the factorized expansion is extended to arbitrary `φ_p`. Use the source datum, `τ(G)`, transferred functions and real Lefschetz normalization. The alternating class and its finite-level smooth traces are well defined.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), Theorem 5.6.1, pp. 74–75.)

Apply the Layers 7–8 geometric Igusa trace expression and its stabilization. Use Layer 6 to compare the stable distribution with the twisted GL distribution. Insert the explicit endoscopic automorphism coefficient for each `vecn`. Use the independent invariant geometric/spectral trace identity to replace the geometric distribution by `I_spec`.

**Checks.**

- For the balanced proper datum the coefficient is `1/2`, not 1.
- The zero `φ_p` boundary case gives zero on both sides.

*Needs:* §7.3; §14.1; §14.3; §6.25; §6.22; §6.7; §6.19; §8.22; §8.11.

### 14.5 Finite spectral factorization with virtual coefficients

After fixing the CSnc test functions, the rational alternating Igusa trace lies in the finite span of terms `tr(Red_b,vecn(π_vecn,p)(φ_p)) · tr(Π_vecn,Spf(f_vecn,Spf)A_Spf) · tr(ζ_vecn,*Π_vecn^S(f_2n^S))`. Here `Π_vecn` is a `θ`-stable irreducible isobaric automorphic representation whose infinity component is cohomological for one of the coefficient systems `Ξ(φ_vecn)` entering `f_vecn,∞` (none of them is trivial when `vecn` is proper: the explicit highest-weight calculation of CS17 §5.3), `π_vecn,p` is its split-`p` base-change preimage, and Red is the twisted reduction above. The coefficients are virtual spectral coefficients; no sign, multiplicity or positivity is supplied merely by the span assertion.

*Hypotheses.* Finiteness is for fixed infinity type and fixed finite test functions/levels, not a uniform finite list over all levels. Use split-`p` injectivity to define the required preimage.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), Lemma 5.6.2 and Remark 5.6.3, pp. 75–76; [Ana Caraiani and Peter Scholze — On the generic part of the cohomology of Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Lemma 5.5.1, pp. 741–743.)

Insert the independent twisted spectral decomposition and residual Levi classification. Factor the test-function tensor product and normalized intertwiner into the three finite parts. Use local trace duality to replace the `p` component by Red. Retain the exact signed identity separately; CSnc’s span proof explicitly suppresses some constants and signs.

**Checks.**

- A noncuspidal isobaric constituent is not discarded.
- Terms with the same unramified eigencharacter are grouped with their summed virtual coefficient.

*Needs:* §14.4; §14.3; §6.22; `TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a (**Number-field GLₙ residual blocks**); §13.4.

### 14.6 Separation of unramified Hecke characters

At fixed finite level and infinity type, the distinct unramified `GL_(2n)` eigencharacters appearing in the finite spectral expansion are linearly independent as functions on the spherical Hecke algebra. Thus varying `f_2n^S` isolates the total virtual coefficient of each eigencharacter. Distinct endoscopic or Levi contributions with the same image character need not be separated: their contributions sum in the same coefficient.

*Hypotheses.* Use the finite list of characters in the fixed-level expansion and characteristic-zero coefficients. The unramified parameter map is the specified `ζ_vecn`,* map.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Corollary 5.5.2 and Remark 5.5.3, p. 743; [Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), Remark 5.6.3, p. 76.)

Identify distinct isobaric GL representations by strong multiplicity one. Apply linear independence of distinct algebra characters on a finite list, choosing a separating finite product of local Hecke operators. Use this separation to isolate the coefficient distribution in `φ_p`. Retain coincidences under the endoscopic parameter map as one virtual coefficient rather than assigning positivity to each term.

**Checks.**

- Two different characters can be separated by some finite Hecke operator combination.
- Repeated copies of the same character cannot be independently separated.

*Needs:* §14.5; `TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a (**Number-field GLₙ residual blocks**).

### 14.7 Rational Igusa export without concentration

Export to the downstream integral concentration theorem and the downstream local–global compatibility theorem the fixed-level rational trace expansion, its unramified eigencharacter support, and the exact local Red factorization with virtual coefficients. A client may infer a rational support constraint or a localized virtual trace equality. Inferring an actual cohomology constituent, integral nonvanishing, torsion control or middle-degree concentration requires its own additional theorem; these claims are not consequences of an alternating trace identity.

*Hypotheses.* Use the signed identity for exact coefficients and the span theorem for support. Higher consumers import the early rational object defined in this part.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), §5.6, pp. 74–76; [Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Lemma 6.1.11, pp. 267–268.)

Package the three-part factorization and character-separation maps. State the exact coefficient data needed for each rational client. List separately the integral and concentration hypotheses a stronger client must prove. Check that there is no return dependency from the downstream integral concentration theorem or the downstream local–global compatibility theorem.

**Checks.**

- The complex [`Λ` —`0→ Λ`] in adjacent degrees has zero alternating class but nonzero cohomology in both degrees; [`Λ` —`id→ Λ`] is acyclic.
- The export is independent of integral concentration.

*Needs:* §14.4; §14.5; §14.6; §7.3.

### Examples

In the nonbasic two-block case `δ_barP^(1/2)` is a nontrivial unramified character, so multiplying normalized Newton reduction by it changes the central character. Using the untwisted reduction against the same `p`-function therefore fails trace duality. If two virtual summands have the same spherical character, Hecke tests see their sum; coefficients 1 and `−1` cancel. Distinct characters can be separated by a finite Vandermonde argument. With the local test `φ_p=0` every term of the signed identity is zero, including all proper endoscopic contributions.

### Dependencies

§7.3; §6.6; §6.8; §6.9; §6.14; §6.10; §8.1; §8.19; §8.9; §8.18; §6.22; §8.8; `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` §SR.2.2 (Jacquet functors and parabolic induction); §10.6; §10.10; §8.11; §6.25; §6.7; §6.19; §8.22; `TauCetiRoadmap.AutomorphicSpectralTheory` §4.14a (**Number-field GLₙ residual blocks**); §13.4.

## Layer 15: normalization calculations and coherent outputs

The finite ledger records coefficients only after the analytic and spectral finiteness results. Torus measures, spherical `GL₂` parameters, proper endoscopy and division inner forms supply independent numerical comparisons, which are then carried into the joint export.

### 15.1 A finite signed coefficient ledger

The finite ledger records signed multiplicities, endoscopic coefficients and the three local/auxiliary/spherical trace factors. Its diagonal-matrix identity is a finite-sum comparison only. The empty sum is zero, and a zero local factor kills every summand. The geometric trace formula must supply the finite expansion before forming this ledger.

For a finite set `s` of spectral terms and rational numbers `mult_i, sign_i, local_i, bad_i, unram_i`, form the ledger `Σ_(i∈s) mult_i sign_i local_i bad_i unram_i`. The fields stand respectively for virtual spectral multiplicity, the endoscopic/inner-form coefficient, local Red trace, auxiliary twisted trace and spherical eigenvalue. This finite calculation is a normalization check on fixed test functions; it is not a definition of the infinite automorphic trace formula.

*Hypotheses.* Every analytic/spectral finiteness and trace identity has already been proved before instantiating the ledger.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), Theorem 5.6.1 and Lemma 5.6.2, pp. 74–76.)

The interface consists of the following operations and identities.

- Evaluate the finite signed coefficient sum over the rational numbers.
- Adding multiplicity functions adds the trace.
- If every local factor is zero, the trace is zero.
- For finite index types `ι, κ` and a map `f : ι → κ`, if the coefficient and three trace factors depend only on `f(i)`, the full sum equals the sum over `κ` with multiplicity `Σ_{f(i)=j} mult_i`. Empty fibres have zero multiplicity.
- Over all of a finite index type, the ledger equals the Mathlib trace of the diagonal matrix whose entries are the five-fold products.

The factorization theorem supplies the finite indexing set. The virtual multiplicity and the sign/endoscopic constant remain separate factors of the rational sum. Prove additivity and invariance under merging terms with identical remaining trace factors.

**Checks.**

- The ledger on the empty finite set is 0. On any finite set with every local trace zero it is also 0, irrespective of multiplicities.
- One numerical term with multiplicity and trace factors all 1 and prescribed coefficient `1/2` evaluates to `1/2`; this Check does not identify `ι(G,H)` for a balanced datum.
- Two terms with identical trace factors and multiplicities 1 and `−1` have sum zero.
- A term with multiplicity 2, sign `−1` and trace factors 3,5,7 evaluates to `−210`.
- For two terms with products 2 and 3 the ledger equals Matrix.trace of the diagonal matrix `diag(2,3)`, namely 5.

*Needs:* §14.5; §14.4; Mathlib `Matrix.trace`; Mathlib `Matrix.trace_diagonal`.

### 15.2 Torus transfer and measure conversion

For identity transfer on a local torus `T` with matching Haar measures, orbital integral at `t` is evaluation `f(t)`, stable and ordinary conjugacy coincide, and the transfer factor is one. For a compact open `K⊂T, e_K=1_K/vol(K)`, so for a smooth character `χ` trivial on `K, tr χ(1_K)=vol(K)` and `tr χ(e_K)=1`; if `χ` is nontrivial on `K` the corresponding traces are zero. Rescaling Haar measure by `c` rescales the characteristic-function trace by `c` and rescales `e_K` by `c⁻¹`.

*Hypotheses.* Use identity endoscopy and the same quotient measure on the trivial conjugacy orbit.

([James Arthur and Laurent Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter `I`, §4–§5, pp. 40–50; [Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Definition D.2.1, p. 369.)

Compute the torus conjugacy orbit, which is a point. Integrate the character over `K` and use its trivial/nontrivial alternatives. Track the measure in the idempotent normalization. Insert this calculation into the pure and Igusa transfer conventions.

**Checks.**

- At `vol(K)=3` the trivial character trace of `1_K` is 3, not 1.
- A nontrivial character on `K` integrates to zero.

*Needs:* §13.7; §14.1; §6.9; §6.7.

### 15.3 Unramified `GL₂` cyclic base-change check

Recall the normalization of SmoothRepresentationsOfLocalGroups §§4.1 and 4.3: for normalized unramified `GL₂(E)` principal series with Satake eigenvalues `α,β, vol(GL₂(O_E))=1`, the characteristic function of `K diag(ϖ_E,1) K` has eigenvalue `q^(1/2)(α+β)`; the central double coset of `ϖ_E I` has eigenvalue `αβ`. The normalized Hecke polynomial is `X²−q^(−1/2)T₁ X+T₂`. Under unramified cyclic degree-`r` base change the eigenvalues become `α^r,β^r`. For one fixed Weil representation the two Frobenius eigenvalues are reciprocal. Under the correspondence conversion `C_geo=C_ar^∨`, both the representation and the Frobenius are inverted, so `C_geo(π)(Φ_geom)` retains the Satake eigenvalues `α,β`. The `q`-half factors stay attached to the stated normalized Satake map.

*Hypotheses.* Normalized induction, fixed `q^(1/2)`, the standard `L`-embedding and the stated Haar measure. `T₂` is the central double coset, not the second elementary Hecke operator under a different scaling.

([James Arthur and Laurent Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter `I`, §4 and the end of §5, pp. 40–50; Theorem 6.2, pp. 51–52.)

Unlike the boundary Satake theorem, this target proves compatibility with §6.24’s cyclic base-change map at unramified local places. Restrict the unramified Weil character to degree-`r` Frobenius, giving `α^r` and `β^r`, and compute the two elementary symmetric functions. Invert the Weil Frobenius convention explicitly instead of changing only one coefficient.

**Checks.**

- For `α=2, β=3` the normalized polynomial is `X²−5X+6`.
- For `r=2` it becomes `X²−13X+36` at the parameter level.

*Needs:* §6.24; §13.5; §12.2; §6.8; §6.6; §4.9.

### 15.4 Proper unitary endoscopy and coefficient check

For the CSnc balanced elliptic endoscopic datum `G_(n,n)` of `G_(2n)`, the standard parameter map is the block direct sum with the specified endoscopic character twists, and the source exact Igusa trace has coefficient `ε_(n,n)=1/2`. The twisted spectral normalization has its own Levi determinant factor; it is not an additional replacement for `ε`. The corresponding Red sum uses the effective Levi embeddings and transfer signs of this proper datum.

*Hypotheses.* Use the source’s fixed `L`-embedding and character choices from Layer 6. The check tests the proper datum, not only the full-rank identity endoscopy.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), Theorem 5.6.1, p. 75; [Sug Woo Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Remark 4.10 and §5.5, pp. 28, 36–37.)

Construct the two-block `L`-parameter with the source character twists. Compute the automorphism coefficient `ε` for the balanced endoscopic datum. Compare the signed Igusa identity with the normalized twisted spectral coefficient ledger. Use local Red trace duality for the same proper datum.

**Checks.**

- A single normalized spectral term contributes half its unit coefficient before the other specified factors.
- Dropping one effective Levi term can change the virtual local coefficient.

*Needs:* §14.4; §14.2; §6.22; §15.1; §6.7; §6.5; §6.6; §6.25.

### 15.5 Division-algebra transfer and sign check

For `GL₂(E)` and its quaternion division inner form `D×`, the Jacquet–Langlands character relation on matching regular elliptic elements has sign `(−1)^(2−1)=−1`. The trivial `D×` representation transfers to the Steinberg `GL₂` representation, whose elliptic character is the negative of the trivial inner-form character. In a Red trace the inner-form/Kottwitz sign must agree with the transferred test-function normalization; equality without that sign is rejected.

*Hypotheses.* Matching elliptic elements and transfer measures/factors come from §§4.8, 6.5 and 6.25. This is the nontrivial inner-form worked example.

([Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), §2.1, pp. 6–12, in particular Remark 2.1.14, p. 10; Theorem 4.1.2, p. 28; [Sug Woo Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.5–§5.6, pp. 36–41.)

Use the independent local Jacquet–Langlands character theorem of §4.7a. Specialize to the trivial `D×` representation and identify its Steinberg transfer. Evaluate the elliptic character relation. Trace the same sign through the local Red/test transfer and the finite coefficient ledger.

**Checks.**

- At rank two the elliptic sign is `−1`.
- At rank one `D=E` and the corresponding sign is `+1`.

*Needs:* §4.7a; §10.6; §10.10; §14.2; §14.3; §15.1.

### 15.6 Coherent automorphic and Igusa exports

Provide separate imports for Layer 13 pure automorphic transfer and Layer 14 rational Igusa trace comparison, plus their joint export. Coherence consists of conversion theorems for arithmetic/geometric Frobenius, half Tate twists, inverse-pullback/dual Hecke action, normalized versus unnormalized induction, Haar idempotents, Kottwitz signs and virtual stable multiplicities. The five worked examples are the torus measure calculation, unramified `GL₂` parameters, balanced proper unitary endoscopy, quaternion inner form, and CSnc’s exact trace with `φ_p=0`. The coherence maps are the proved transfer and tower-action comparisons of §§6.25 and 12.13; the worked calculations test their coefficients. The two basic-Hecke formulas of §12.22 are exported with their native source-torsor actions. A comparison between those actions and Dat’s tower convention is a separate downstream theorem, rather than part of this coherence assertion.

*Hypotheses.* Each branch satisfies its own hypotheses; clients need only the branch they consume. The pure packet and oldform export carries the unitary classification contract (§§11.0d–11.0e); the oldform dimension export separately requires `Π_w` tempered at every finite place `w`. Any `GSp₄` classification export carries the symplectic classification contract (§§11.0g–11.0h). Each level-dependent branch retains its chosen hyperspecial levels through §4.10a and its prescribed sufficiently small transferable levels through §6.14; the oldform branch exports the fixed-measure formula of §13.9: each raw `Σ_min` trace is divided by `vol(K_v)`, or equivalently uses the transfer of `e_Kv`. The `Σ_lr` and hyperspecial factors are also idempotent traces. Exact coefficients require the signed identity, while the factorization alone supplies virtual support.

([Ana Caraiani and Peter Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf), §5.6, pp. 74–76; [Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4), Appendices C.3 and D.2, pp. 363–364, 368–372; [Laurent Fargues and Peter Scholze — Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4), IX.7.4, p. 338.)

List the shared convention choices and compare their effects on each branch. Run the torus, `GL₂`, proper-endoscopic and division-inner-form calculations with the selected functions. Use the zero local-function boundary case to test the signed Igusa identity. Export the pure branch independently to the downstream automorphic Galois construction and the rational branch to the downstream local–global compatibility theorem/the downstream integral concentration theorem without reverse edges.

**Checks.**

- The split `GL₂` congruence level with `q=3` exports invariant dimension 4 from raw trace `1/12` and volume `1/48`; a normalized intertwiner alone leaves the raw trace unchanged.

- At an unramified auxiliary place of residue characteristic 2 or 3, the export retains the original hyperspecial unit via §4.10a: the torus tests of that section give value 1, not the value 0 of a proper principal congruence replacement.
- A pure-branch client retains the unitary classification contract (§§11.0d–11.0e) for classification and oldform assertions, finite-place temperedness for oldform dimensions, and the symplectic classification contract (§§11.0g–11.0h) for `GSp₄` classification assertions, independently of any integral concentration theorem.
- A rational Igusa client receives no integral concentration assertion.

*Needs:* §13.4; §13.9; §14.7; §15.2; §15.3; §15.4; §15.5; §15.1; §12.22.

### Examples

A single ledger term with all trace factors 1 and coefficient `1/2` has trace `1/2`. A term with virtual multiplicity 2, inner-form sign `−1` and trace factors 3,5,7 has trace `−210`. Two identical trace terms with multiplicities 1 and `−1` cancel. Over a two-element full index set, products 2 and 3 give a ledger value of `5`, equal to the trace of the diagonal matrix `diag(2,3)`. These finite identities check the coefficients after the full trace formula has justified the finite test expansion.

### Dependencies

§14.5; §14.4; Mathlib `Matrix.trace`; Mathlib `Matrix.trace_diagonal`; §13.7; §14.1; §6.9; §6.7; §6.24; §13.5; §12.2; §6.8; §6.6; §4.9; §14.2; §6.22; §6.5; §6.25; §4.7a; §10.6; §10.10; §14.3; §13.4; §13.9; §14.7; §12.22.

## Downstream consumers

Pure cyclic and unitary automorphic transfer comes from Layers 6 and 13. Relevant-packet multiplicity and finite-level oldform dimensions additionally assume the unitary classification contract (§§11.0d–11.0e); oldform dimensions also require finite-place temperedness of `Π`. `GSp₄` classification consequences assume the symplectic classification contract (§§11.0g–11.0h). These exports are independent of Igusa concentration. Global automorphic Galois constructions consume those results and the raw cohomology of Layer 9. Their stronger local–global monodromy assertions consume the full classical parameter of Layer 10 rather than only its semisimple traces.

The downstream roadmap IgusaVarietiesAndTorsionConcentration consumes the common `B(G)`, tensor-isocrystal classification, Newton and Kottwitz maps and `J_b` of §§7.2, 7.4–7.5, the perfection/isomorphism-torsor comparison of §7.3, and the liftable finite covers, deck kernels, transitions and level-loss monoid of §§7.8–7.9, including level zero. Its inverse trivializations use the inversion and left/right action conversion in §7.3, compatible with the rational realization of §7.10. These common objects retain their carriers here; that consumer owns the additional compactification, integral-cohomology and concentration extensions.

Rational Igusa clients consume the geometry of Layer 7, the signed stable formula of Layer 8, and the virtual spectral factorization and character separation of Layer 14. Integral and torsion concentration requires additional geometry and coefficients. General local-shtuka and excursion-parameter theory consumes the particular tower fibre and normalization comparison of Layer 12; it is not an input to the classical correspondence.

## References
- [Bao Châu Ngô — Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3). arXiv:0801.0446v3 (2 May 2008), 197 pp., printed page = PDF page from p. 2; published in Publ. Math. IHÉS 111 (2010), 1–169 (locators are those of v3).
- [R. P. Langlands and D. Shelstad — On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf). Math. Ann. 278 (1987), 219–271; GDZ scan (no text layer), printed page = PDF page `+ 217`.
- [R. E. Kottwitz — Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf). Math. Ann. 275 (1986), 365–399; GDZ scan (no text layer), printed page = PDF page `+ 363`.
- [R. E. Kottwitz — Base change for unit elements of Hecke algebras](https://www.numdam.org/item/CM_1986__60_2_237_0.pdf). Compositio Math. 60 (1986), 237–250; Numdam copy.
- [R. Kottwitz and D. Shelstad — On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1). arXiv:1201.5658v1 (26 January 2012), 19 pp.
- [T. C. Hales — A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2). arXiv:math/0312227v2 (30 December 2003), 18 pp.; also Clay Math. Proc. 4 (2005), 643–658; PDF page numbers are cited.
- [G. Laumon and B. C. Ngô — Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2). arXiv:math/0404454v2 (8 October 2004), 99 pp.; published Ann. of Math. 168 (2008); arXiv page numbers.
- [J.-P. Labesse — Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf). Astérisque 257 (1999), `vi + 116` pp.; Numdam copy with text layer; printed page = PDF page `− 7`.
- [J.-L. Waldspurger — Endoscopie et changement de caractéristique](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf). Author's preprint (71 pp.) of J. Inst. Math. Jussieu 5 (2006), 423–525; preprint page numbers.
- [J.-L. Waldspurger — L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf). Author's preprint dated 15 May 2006 (83 pp.) of Mem. Amer. Math. Soc. 194 (2008), no. 908; preprint page numbers.
- [R. E. Kottwitz — Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf). In Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 393–522; Clay Institute copy of the volume; printed page = PDF page `− 13`.
- [J. Arthur — An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf). In Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 1–263; the same Clay Institute volume.
- [S. W. Shin — Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf). Author's copy (62 pp.) of Ann. of Math. 173 (2011), 1645–1741; author-copy page numbers.
- [S. W. Shin — A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf). Author's copy (30 pp.) of J. Inst. Math. Jussieu 9 (2010), 847–895; author-copy page numbers.
- [A. Caraiani and P. Scholze — On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2). arXiv:1909.01898v2 (22 November 2023), 90 pp.; author copy noncompact.pdf has the same cited pagination. Published Ann. of Math. 199 (2024), 483–590; citations use preprint pages.
- [S. Leslie — The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3). arXiv:1911.07907v3 (13 March 2025), 89 pp.; published Ann. of Math. 201 (2025).
- [T. Kaletha — Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5). arXiv:1304.3292v5 (9 February 2015); published Ann. of Math. 184 (2016), 559–632; arXiv page numbers.
- [R. E. Kottwitz and D. Shelstad — Foundations of twisted endoscopy](https://www.numdam.org/item/AST_1999__255__R3_0.pdf). Astérisque 255 (1999), §1.3, p. 16, and §2.1, pp. 18–20.
- [M. Kisin — Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf). Author's typeset preprint (99 pp., PDF dated 27 August 2016) of J. Amer. Math. Soc. 30 (2017), 819–914; page numbers of that copy.
- [P. van Hoften — Mod p points on Shimura varieties of parahoric level](https://arxiv.org/abs/2010.10496v4). arXiv:2010.10496v4 (3 September 2024); published Forum Math. Pi 12 (2024); arXiv page numbers.
- [D. Hansen, T. Kaletha and J. Weinstein — On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/abs/1709.06651v4). arXiv:1709.06651v4 (17 March 2022); published Forum Math. Pi 10 (2022), e13, with Appendix A.2 on pp. 71–72; other locators use arXiv page numbers.
- [A. Caraiani and P. Scholze — On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Ann. of Math. 186 (2017), 649–766; published page numbers. The preprint is arXiv:1511.02418v1; its pp. 74–76 correspond to published pp. 735–738.
- [O. Schiffmann — Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://arxiv.org/abs/1406.3839v2). arXiv:1406.3839v2 (4 October 2014), no printed page numbers (PDF pages cited); published Ann. of Math. 183 (2016).
- [H. Yu — Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/abs/1807.04659v5). arXiv:1807.04659v5 (18 July 2022); published Ann. of Math. 197 (2023).
- [Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu — On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Invent. Math. 228 (2022), 107–375, the NSF Public Access Repository copy (printed page = PDF page `+ 106`).
- [P. Scholze — The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1). arXiv:1010.1540v1, 37 pp.; printed page = PDF page; published Invent. Math. 192 (2013), 663–715.
- [J. Arthur and L. Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf). Annals of Mathematics Studies 120, Princeton University Press, 1989; scan hosted in the Arthur archive of the Clay Mathematics Institute; locators give printed pages (printed = PDF `− 16`).
- [M. Tadić — Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf). Ann. Sci. École Norm. Sup. (4) 19 (1986), 335–382; Numdam copy, printed page = PDF page `+ 334`.
- [G. Boxer, F. Calegari, T. Gee and V. Pilloni — Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1). arXiv:2502.20645v1 (28 February 2025), 230 pp.; printed page = PDF page.
- [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White — Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1). arXiv:1409.3731v1 (2014); printed page = PDF page. Scope of unconditional statements is explicitly restricted in §§1.6–1.7.
- [L. Clozel — Characters of non-connected reductive p-adic groups](https://doi.org/10.4153/CJM-1987-008-3). Canadian Journal of Mathematics 39 (1987), 149–167; printed = PDF `+ 148`.
- [R. E. Kottwitz — Stable trace formula: cuspidal tempered terms](https://math.uchicago.edu/~drinfeld/langlands/Kottwitz.pdf). Duke Mathematical Journal 51 (1984), 611–650.
- [K. F. Lai — Tamagawa number of reductive algebraic groups](https://www.numdam.org/item/CM_1980__41_2_153_0.pdf). Compositio Mathematica 41 (1980), 153–188.
- [J. Arthur — The invariant trace formula I. Local theory](https://www.claymath.org/library/cw/arthur/pdf/26.pdf). Journal of the AMS 1 (1988), 323–383.
- [J. Arthur — The invariant trace formula II. Global theory](https://www.claymath.org/library/cw/arthur/pdf/27.pdf). Journal of the AMS 1 (1988), 501–554.
- [R. E. Kottwitz and J. D. Rogawski — The distributions in the invariant trace formula are supported on characters](https://doi.org/10.4153/CJM-2000-034-6). Canadian Journal of Mathematics 52 (2000), 804–814; printed = PDF `+ 803`.
- [P. Delorme and P. Mezo — A twisted invariant Paley–Wiener theorem for real reductive groups](https://www.i2m.univ-amu.fr/perso/patrick.delorme/reprints-delorme/2008TwistedPaley-WienerMezo.pdf). Duke Mathematical Journal 144 (2008), 341–380; printed = PDF `+ 340`.
- [L. Clozel and J.-P. Labesse — Orbital integrals and distributions](https://www.claymath.org/library/proceedings/cmip013c.pdf). In On the stabilization of the trace formula, Clay Math. Proc. 13 (2011), 107–115; locators are volume printed pages.
- [S. Morel — On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/abs/0802.4451v2). arXiv:0802.4451v2 (2018 corrected author version); locators are its printed pages.
- [J.-P. Labesse — Changement de base CM et séries discrètes](https://webusers.imj-prg.fr/~michael.harris/CBCM.pdf). Public French author copy, 53 pp.; locators are printed pages, equal to PDF page numbers in §5.
- [T. Gee and O. Taïbi — Arthur’s multiplicity formula for GSp4 and restriction to Sp4](https://www.numdam.org/item/10.5802/jep.99.pdf). Journal de l’École polytechnique — Mathématiques 6 (2019), 469–535; locators are printed pages.
- [C. Mœglin and J.-L. Waldspurger — Le spectre résiduel de GL(n)](https://www.numdam.org/item/ASENS_1989_4_22_4_605_0.pdf). Annales scientifiques de l’École normale supérieure 22 (1989), 605–674; printed = PDF `+ 603`.
- [L. Clozel and J.-P. Labesse — Appendice A. Changement de base pour les représentations cohomologiques de certains groupes unitaires](https://www.numdam.org/item/AST_1999__257__119_0.pdf). Appendix to J.-P. Labesse, Cohomologie, stabilisation et changement de base, Astérisque 257 (1999), pp. 119–133; Numdam copy.
- [S. W. Shin — Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf). Author copy of Duke Math. J. 146 (2009), 509–568; 44 pages, locators below use author-copy printed pages, equal to PDF pages.
- [E. Mantovan — On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf). Author copy of Duke Math. J. 129 (2005), 573–610; locators use author-copy pages.
- [R. E. Kottwitz — Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf). Compositio Math. 56 (1985), 201–220; published Numdam scan; locators use printed journal pages.
- [M. Rapoport and M. Richartz — On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/item/CM_1996__103_2_153_0.pdf). Compositio Math. 103 (1996), 153–181; published Numdam scan.
- [Y. Varshavsky — Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara](https://arxiv.org/pdf/math/0505564v2). arXiv:math/0505564v2, author preprint of Geom. Funct. Anal. 17 (2007), 271–319.
- [S. W. Shin — Errata](https://math.berkeley.edu/~swshin/errata.pdf). Author-maintained two-page errata.
- [J. Tate — Endomorphisms of abelian varieties over finite fields](https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf). Invent. Math. 2 (1966), 134–144; published scan.
- [W. C. Waterhouse — Abelian varieties over finite fields](https://www.numdam.org/item/ASENS_1969_4_2_4_521_0.pdf). Ann. Sci. ENS 2 (1969), 521–560; published Numdam scan. Honda existence is stated, not proved here.
- [Peter Scholze — The Langlands–Kottwitz method and deformation spaces of p-divisible groups](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf). Author PDF titled Deformation spaces of `p`-divisible groups, dated 2 October 2011, 33 pages; prepublication pagination
- [Guy Henniart — Une caractérisation de la correspondance de Langlands locale pour GL(n)](https://www.numdam.org/item/BSMF_2002__130_4_587_0.pdf). Bulletin de la Société Mathématique de France 130(4) (2002), 587–602, published Numdam PDF
- [Alexandru Ioan Badulescu — Correspondance de Jacquet–Langlands étendue à toutes les représentations](https://arxiv.org/pdf/math/0201142). arXiv:math/0201142v2, dated 8 April 2003, 38 pages; use this version’s numbering
- [Hervé Jacquet, Ilya Piatetski-Shapiro and Joseph Shalika — Conducteur des représentations du groupe linéaire](https://www.math.columbia.edu/~hj/conducteur.pdf). Mathematische Annalen 256 (1981), 199–214; published scan on Jacquet’s page, one cover page
- [Hervé Jacquet — A correction to Conducteur des représentations du groupe linéaire](https://msp.org/pjm/2012/260-2/pjm-v260-n2-p09-s.pdf). Pacific Journal of Mathematics 260(2) (2012), 515–525, publisher PDF
- [Peter Scholze and Jared Weinstein — Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357). arXiv:1211.6357, author PDF; printed page numbering of that file
- [Peter Scholze and Jared Weinstein — Berkeley lectures on p-adic geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Authors’ March 27, 2020 version of Annals of Mathematics Studies 207
- [Jean-François Dat — Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf). Author PDF of Invent. Math. 169 (2007), 75–152; internal printed pages
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł — Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928). arXiv:1704.08928 author copy; published in JAMS 33 (2020), 311–362; citations use preprint numbering
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł — Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf). Forum of Mathematics, Pi 11 (2023), e16, published Cambridge PDF, 62 pages
- [Lue Pan — On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366). arXiv:2209.06366v1, 14 September 2022; preprint theorem/page numbering, not Annals 203 (2026)
- [Laurent Fargues and Peter Scholze — Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4). arXiv:2102.13459v4; geometric locators in §II.1 and the basic-Hecke calculation in IX.7.4 use this version
- J. Cohen, *Transfer of representations and orbital integrals for inner forms of `GL_n`*, Canadian Journal of Mathematics 70 (2018), 595–627, [published version](https://doi.org/10.4153/CJM-2017-017-5), §8.1, Definition 8.1 and Lemma 8.2, pp. 615–617.
- J. Adams and T. Kaletha, *Discrete series L-packets for real reductive groups*, Essential Number Theory 5 (2026), 139–219, [published version](https://msp.org/ent/2026/5-1/ent-v5-n1-p04-s.pdf), Theorem 2.7.7, p. 164, and §6.1, p. 203.
- G. Faltings and C.-L. Chai, *Degeneration of Abelian Varieties*, Springer 1990, I.4.3–4.4 and I.4.11, pp. 19, 23–24; the fine-level quasi-projectivity statement there recalls Mumford’s geometric-quotient theorem.

- [C.-F. Yu — Embeddings of fields into simple algebras over global fields](https://arxiv.org/abs/1105.2895). arXiv:1105.2895, Theorems 2.5 and 2.7, pp. 8–9.
- [D. Vogan — The unitary dual of GL(n) over an archimedean field](https://www.math.utah.edu/~ptrapa/math-library/vogan/vogan-GLn.pdf). Invent. Math. 83 (1986), 449–505; Theorems 17.4 and 17.6, pp. 501–502.
- [J. Bernstein and A. Zelevinsky — Representations of the group GL(n,F) where F is a local non-Archimedean field](https://doi.org/10.1070/RM1976v031n03ABEH001532). Russian Math. Surveys 31:3 (1976), 1–68; Proposition 5.15, Theorem 5.16 and §5.18, pp. 49–50.
- [P. Schneider and E.-W. Zink — K-types for the tempered components of a p-adic general linear group](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/temtype.pdf). Author version, §5, Proposition 11, p. 30; published J. reine angew. Math. 517 (1999), 161–208.
- [P. Scholze — Some simple Shimura varieties](https://arxiv.org/abs/1003.2451). arXiv:1003.2451; Lemma 5.5 and Corollary 5.6, pp. 13–14.
- [P. Scholze — Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf). Author version dated 14 April 2026; §15 and §22 use this version’s pagination.
- [J. Tate — Number theoretic background](https://www.math.ias.edu/~goresky/pdf/3-01Tate.pdf). Automorphic Forms, Representations and `L`-functions, Proc. Sympos. Pure Math. 33, part 2 (1979), 3–26; §§1.1–1.6, pp. 3–9.
- [H. Jacquet and J. Shalika — A lemma on highly ramified ε-factors](https://www.math.columbia.edu/~hj/Highly%20ramified.pdf). Math. Ann. 271 (1985), 319–332; Proposition 4.1, §4.2 and Proposition 5.1, pp. 326–327, 331.
- [P. Deligne and G. Henniart — Sur la variation, par torsion, des constantes locales d’équations fonctionnelles de fonctions L](https://publications.ias.edu/sites/default/files/Number43.pdf). Invent. Math. 64 (1981), 89–118; Theorem 4.6 and Lemma 4.7, pp. 110–111.
- [P. Boyer — Monodromie du faisceau pervers des cycles évanescents de quelques variétés de Shimura simples](https://www.math.univ-paris13.fr/~boyer/recherche/MP-faisceautique.pdf). Author version, 34 pp.; locators use its numbering, in particular §§2.2–2.3 and §§5.5–5.7.
- [R. E. Kottwitz — Tamagawa numbers](https://annals.math.princeton.edu/1988/127-3/p05). Ann. of Math. 127 (1988), 629–646; Theorem 1 and §4.
- [L. Clozel — Nombres de Tamagawa des groupes semi-simples (d’après Kottwitz)](https://www.numdam.org/item/SB_1988-1989__31__61_0.pdf). Séminaire Bourbaki, exposé 702, Astérisque 177–178 (1989), 61–82; Theorem 1.1, §§4–5.
- [R. Kottwitz — Points on some Shimura varieties over finite fields](https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf). JAMS 5 (1992), 373–444; Lemma 9.2, p. 402; §13, Lemmas 13.1–13.2, pp. 415–418; §14, Lemma 14.1, pp. 418–422; §15, Lemma 15.2, pp. 425–428; Lemmas 17.1–17.2, pp. 434–435.
- [D. Shelstad — Tempered endoscopy for real groups I: geometric transfer with canonical factors](https://sites.rutgers.edu/diana-shelstad/wp-content/uploads/sites/189/2019/10/shelstadtempend1.pdf). Author version, Theorem 14.3, pp. 40–42, and §15, pp. 45–46; published in Representation Theory 12 (2008), 1–40.
- [D. Shelstad — Tempered endoscopy for real groups II: spectral transfer factors](https://sites.rutgers.edu/diana-shelstad/wp-content/uploads/sites/189/2019/10/shelstadtempend2.pdf). Author version, Theorem 5.1, pp. 7–8, proof §§13–14, pp. 31–39; published in Automorphic Forms and the Langlands Program (2010), 236–276.
- [B. Lemaire, C. Mœglin and J.-L. Waldspurger — Le lemme fondamental pour l’endoscopie tordue: réduction aux éléments unités](https://arxiv.org/abs/1506.03383). Author version, §2.8, Theorems 1–2, p. 17; proof §§3–5, pp. 21–88.
- [M.-F. Vignéras — Caractérisation des intégrales orbitales sur un groupe réductif p-adique](https://repository.dl.itc.u-tokyo.ac.jp/record/39626/files/jfs280338.pdf). J. Fac. Sci. Univ. Tokyo Sect. IA Math. 28 (1982), 945–961; §1.n, Theorems A–`B`, pp. 948–949, and §1.o(3), p. 950.
- [J.-L. Waldspurger — La formule de Plancherel pour les groupes p-adiques, d’après Harish-Chandra](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FF540ECB59B31AFC0A7874C87F54EE0A/S1474748003000082a.pdf/div-class-title-la-formule-de-plancherel-pour-les-groupes-span-class-italic-p-span-adiques-d-apres-harish-chandra-div.pdf). J. Inst. Math. Jussieu 2 (2003), 235–333; Proposition III.4.1, p. 269, and its exponent lemmas, pp. 265–268.
- [J. Arthur — On elliptic tempered characters](https://www.claymath.org/library/cw/arthur/pdf/40.pdf). Acta Math. 171 (1993), 73–138; Theorem 6.1 and Corollary 6.2, pp. 113–115, with the cuspidal local trace formula, Corollary 4.3, pp. 104–105.
- [S. Riche — On the Kostant section and the universal centralizer in positive characteristic and over the integers](https://arxiv.org/abs/1411.3112v2). arXiv:1411.3112v2 (12 December 2014); §2.2, pp. 3–4, §§3.1–3.2, pp. 6–9.
- [J. Tate — Classes d’isogénie des variétés abéliennes sur un corps fini (d’après T. Honda)](https://numdam.org/item/SB_1968-1969__11__95_0.pdf). Séminaire Bourbaki, exposé 352 (1968), pp. 95–110; Theorem 2, p. 102, and Lemmas 3–6, pp. 101–105.
- [M. Kisin, K. Madapusi Pera and S. W. Shin — Honda–Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf). Public author version, 41 pp.; locators use its printed page numbers, especially §2.3, pp. 30–36.
- [R. P. Langlands — Representations of abelian algebraic groups](https://publications.ias.edu/sites/default/files/representations-of-abelian-algebraic-groups.pdf). Author reproduction of the 1997 Pacific Journal of Mathematics memorial volume article; Theorems 1 and 2`(a)`, pp. 2–3, proof pp. 3–12.
- [H. H. Kim — Functoriality for the exterior square of GL₄ and the symmetric fourth of GL₂](https://www.ams.org/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf). J. Amer. Math. Soc. 16 (2003), 139–183; Theorem 5.3.1.
- [G. Henniart — Sur la fonctorialité, pour GL(4), donnée par le carré extérieur](https://doi.org/10.17323/1609-4514-2009-9-1-33-45). Moscow Math. J. 9 (2009), 33–45; local compatibility completing the exterior-square transfer.

- [B. Lemaire and J.-L. Waldspurger — Le lemme fondamental pour l’endoscopie tordue : le cas où le groupe endoscopique elliptique non ramifié est un tore](https://arxiv.org/abs/1511.08606v1). §§1.1–1.3, pp. 2–3; §§2–4, pp. 6–49.
- [T. C. Hales — On the fundamental lemma for standard endoscopy: reduction to unit elements](https://doi.org/10.4153/CJM-1995-051-5). Canadian Journal of Mathematics 47 (1995), 974–994; §§3–6, especially Theorem 6.1.

- [J.-L. Waldspurger — Stabilisation de la formule des traces tordue I : endoscopie tordue sur un corps local](https://webusers.imj-prg.fr/~jean-loup.waldspurger/stabilisationIfinal.pdf). Author's preprint; §4.10, pp. 78–79; §6.1, hypothesis (Hyp), p. 130; preprint page numbers.
- [J.-L. Waldspurger — Stabilisation de la formule des traces tordue II](https://arxiv.org/abs/1401.7127v1). §§1–3; §4, standing hypothesis p. 97; §4.4, Théorème, pp. 100–101; §§4.5–4.9.
- [C. Mœglin and J.-L. Waldspurger — Stabilisation de la formule des traces tordue VI : la partie géométrique de cette formule](https://arxiv.org/abs/1406.2257v1). arXiv:1406.2257v1 (9 June 2014); §1.1, the set `V_ram`, p. 3; §§4.6–4.7, pp. 85–86; §5.10, pp. 96–97.
- [C. Mœglin and J.-L. Waldspurger — Stabilisation de la formule des traces tordue X : stabilisation spectrale](https://arxiv.org/abs/1412.2981v1). §§3.2–3.9, 4.5–4.9, 7.1–7.7 and 8.1–8.6; arXiv page numbers.
- [P.-H. Chaudouard and G. Laumon — Le lemme fondamental pondéré. I. Constructions géométriques](https://arxiv.org/abs/0902.2684v1). arXiv:0902.2684v1 (16 February 2009), 71 pp.; published in Compositio Math. 146 (2010), 1416–1506; arXiv page and theorem numbers.
- [P.-H. Chaudouard and G. Laumon — Le lemme fondamental pondéré. II. Énoncés cohomologiques](https://arxiv.org/abs/0912.4512v1). arXiv:0912.4512v1 (22 December 2009), 102 pp.; published in Ann. of Math. 176 (2012), 1647–1781; arXiv page and theorem numbers.
- [J.-L. Waldspurger — Endoscopie et changement de caractéristique : intégrales orbitales pondérées](https://www.numdam.org/item/AIF_2009__59_5_1753_0.pdf). Ann. Inst. Fourier 59 (2009), 1753–1818; Numdam copy; printed page numbers.
- J.-L. Waldspurger, *À propos du lemme fondamental pondéré tordu*, Math. Ann. 343 (2009), 103–174; Théorème 3.8; cited by locator (publisher copy only).
- [C. P. Mok — Endoscopic classification of representations of quasi-split unitary groups](https://arxiv.org/abs/1206.0882v5). Theorems 2.5.1–2.5.2 and Remark 2.5.3, pp. 32–35; §§3.1–3.5, pp. 39–83; §§4–9, pp. 84–268; arXiv v5 page numbers.
- [J. Arthur — The Endoscopic Classification of Representations](https://www.claymath.org/library/cw/arthur/pdf/arthur-endoscopic-tifr.pdf). TIFR survey, Theorems 1, 1′ and 2 (pp. 4, 11–12 and 7), identified there with Theorems 1.5.1, 2.2.1 and 1.5.2 of the book; formal cuspidal-data convention, p. 5.
- J. Arthur, *The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups*, AMS Colloquium Publications 61 (2013); Theorems 1.5.1, 1.5.2 and 2.2.1, Chapters 6–8; cited by locator (publisher copy only).
- [S. Gelbart and F. Shahidi — Boundedness of automorphic L-functions in vertical strips](https://www.ams.org/journals/jams/2001-14-01/S0894-0347-00-00351-9/S0894-0347-00-00351-9.pdf). J. Amer. Math. Soc. 14 (2001), 79–107; Theorem 4.1 and Corollaries 1–2, pp. 79–80.
- [D. Ramakrishnan — Modularity of the Rankin–Selberg L-series, and multiplicity one for SL(2)](https://arxiv.org/abs/math/0007203v1). Ann. of Math. 152 (2000), 45–111; Theorem M, p. 54; §§3.3–3.4; printed page numbers of the arXiv copy.
- [M. Asgari and A. Raghuram — A cuspidality criterion for the exterior square transfer of cusp forms on GL(4)](https://arxiv.org/abs/0712.4315v1). arXiv:0712.4315v1; §2.2, pp. 4–5; published in Clay Math. Proc. 13 (2011).
- H. H. Kim and F. Shahidi, *Functorial products for GL₂×GL₃ and the symmetric cube for GL₂*, Ann. of Math. 155 (2002), 837–893; triple-product `L`-functions by the Langlands–Shahidi method for `D₄`; cited by locator.
- M. Asgari, *Local L-functions for split spinor groups*, Canad. J. Math. 54 (2002), 673–693; the rank-one `D_{n−3}` case of Kim's Proposition 3.1; cited by locator.
- H. Jacquet and J. Shalika, *Exterior square L-functions*, in *Automorphic forms, Shimura varieties, and L-functions II* (Perspectives in Math. 11, 1990), 143–226; §8, Theorem 1, as recorded in Kim's Proposition 3.9; cited by locator.
- K. Hiraga and H. Saito, *On L-packets for inner forms of SL_n*, Mem. Amer. Math. Soc. 215 (2012), no. 1013; Theorem 4.14, as recorded in Gee–Taïbi's Theorem 5.1.2; cited by locator.
