# Roadmap: Gross–Zagier formulas and arithmetic heights, part II — unitary special cycles and the arithmetic fundamental lemma

**Summary.** Build the arithmetic intersection theory of special cycles on unitary Rapoport–Zink spaces and unitary Shimura varieties of signature (n−1,1), and use it to prove the Kudla–Rapoport identities, the arithmetic Siegel–Weil formulas and the strongly regular arithmetic fundamental lemma. Starting from the unitary formal moduli, integral models and uniformizations of PELModuliPartII, the supported K-theory of formal schemes of SchemeKTheoryOperationsPartII, the hermitian lattices and unramified densities of GeometryOfNumbersAndQuadraticArithmetic and the Weil representation of MetaplecticAutomorphicForms, the roadmap constructs special cycles, their derived classes and Euler intersection numbers, and compares them with derivatives of local densities in four local settings: unramified self-dual (Li–Zhang), unramified almost self-dual (Li–Zhang with Li–Rapoport–Zhang), ramified exotic smooth (Li–Liu) and ramified Krämer (He–Li–Shi–Yang). Globally it constructs special cycles, their K-theory classes and local arithmetic degrees on the RSZ models, proves the unramified and modified arithmetic Siegel–Weil formulas, and, through derived CM cycles, modular generating series of arithmetic divisors and Zhang's relative trace comparison, proves the arithmetic fundamental lemma for strongly regular elements over ℚ_p (Zhang, Theorem 15.1) in its semi-Lie version for p ≥ n and in its group version for p ≥ n + 1 and for n ≤ 3. The Krämer identity is proved in rank n ≤ 3 and, in rank n ≥ 4, under the hypothesis (H_m), 4 ≤ m ≤ n, of §8.6, the identity for lattices whose largest fundamental invariant is odd, which no published argument proves in that rank; the modified arithmetic Siegel–Weil formula at ramified places of a hermitian space of dimension n ≥ 4 is stated under the same hypothesis. The four local identities differ in their dualities, interpolation variables, derivative normalizations and correction terms; these differences are part of the statements.

## Scope and ownership

GrossZagierAndArithmeticHeights stops at Shimura curves: its Layers 6–9 own the arithmetic theta kernels, including the Picard-valued generating series of Hecke correspondences on products of two Shimura curves and its weight-two modularity (GrossZagierAndArithmeticHeights §6.20), the CM local intersections and the global Gross–Zagier and anticyclotomic formulas for modular and quaternionic Shimura curves. This Part II begins at higher-dimensional unitary special cycles. It owns the special cycles on the unitary Rapoport–Zink spaces of principal, almost self-dual, exotic and Krämer type, their derived classes, Euler intersection numbers, horizontal and vertical decompositions and Fourier properties; the cohomology and Tate classes of the unitary Deligne–Lusztig and symplectic incidence strata that these decompositions use; the density sides of the four local identities, including the exotic and Krämer density formulas and correction coefficients; the four Kudla–Rapoport identities; the global special cycles, their K-classes, uniformizations and local arithmetic degrees; the arithmetic Siegel–Weil formulas; the automorphic Green functions of special divisors and the unitary Borcherds products over ℚ with their integral divisors, which give the arithmetic modularity of these generating series; the Chow-valued modularity of Kudla divisors on GSpin Shimura varieties over totally real fields (Yuan–Zhang–Zhang), in its general form, whose quaternionic case p = 2 on products of Shimura curves is the series of GrossZagierAndArithmeticHeights §6.20 with that roadmap's normalizations and is neither re-proved nor consumed here, together with the generic-fibre orthogonal Borcherds products over ℚ and Borcherds' obstruction criterion in half-integral weight that its rational case uses, and its pullback to the unitary Shimura varieties, which give the Chow-valued modularity of the unitary divisor series over every totally real field; the derived CM cycles, their pairings with modular generating series of arithmetic divisors, the relative trace series of the AFL comparison and the strongly regular arithmetic fundamental lemma.

The following are owned elsewhere and imported by section. The unitary Rapoport–Zink spaces of all four types are PELModuliPartII §§1.1–1.2, 2.1–2.2, 3.3–3.4, 5.1, 5.3 and 5.7; their canonical rank-one sources §§1.3, 3.5 and 5.2; their special Hom spaces §§1.5, 2.3, 3.6 and 5.8; the rank-raising embedding and diagonal graph §§1.4 and 1.6; the auxiliary isogeny space of the almost self-dual comparison with its generic projections and the single divisor Z(x₀) through which its second projection factors §§2.4–2.5; the relative and absolute exotic comparison §4.6; the exotic Bruhat–Tits strata and connected components §3.7; the comparison of signature conventions §0.7; the RSZ datum, integral CM moduli, Eisenstein, level and sign data §§6.1 and 6.5–6.8; the localized and semi-global RSZ models with their smoothness and representability §§7.1–7.2 and 7.6, the exotic and Krämer integral models §§7.3–7.4 with the Krämer and almost self-dual geometry §§7.8–7.9, and their global gluing with levels §7.10; the integral Hecke system §8.5; and the basic-locus uniformizations §§9.3 and 9.5–9.9. Grothendieck–Messing deformation theory of Barsotti–Tate groups, including the homomorphism-lifting criterion, is AbelianSchemesAndArithmeticModuli §A4.CR.7.2, and its form for abelian schemes is §A4.7. Tate modules, Tate's full-faithfulness theorem and covariant Dieudonné modules are FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.22 and R07.2.20. Canonical and quasi-canonical lifts, quadratic orders and the degrees of their fields of definition are LubinTateFormalModulesAndQuasiCanonicalLifts §§6.1–6.2, 6.4–6.5 and 7.1; the endomorphism-lifting lengths along quasi-canonical lifts, in the unramified and the ramified quadratic case, are GrossZagierAndArithmeticHeights §7.2. Hermitian lattices, duals, fundamental invariants, the unramified local densities, Siegel polynomials, the Cho–Yamauchi weight, the overlattice formula and the functional equation are GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9 and 3.2. Supported K-theory, Tor and Euler pairings on locally noetherian formal schemes are SchemeKTheoryOperationsPartII Layers 0–4; supported cycle classes, the rational multiplicativity of the codimension filtration on regular schemes and the identification Gr₁G₀ ⊗ ℚ ≅ CH₁ ⊗ ℚ are SchemeKTheoryOperations §§6.12 and 7.7. The hermitian uncertainty principle (Li–Zhang, Proposition 8.1.6) is MetaplecticAutomorphicForms §3.3a; the Weil index, Weil operators, unitary dual-pair splittings, hermitian oscillator normalizations, Siegel–Weil sections, the anisotropic Siegel–Weil formula and coherent and incoherent section collections are MetaplecticAutomorphicForms §§2.1, 2.5, 3.3, 3.3b, 6.2, 6.4 and 6.7. Local and adelic Schwartz–Bruhat Fourier analysis with self-dual measures is AnalyticNumberTheoryPartII §§5.3g–5.3h. Normalized induction, Eisenstein series and their continuation are AutomorphicSpectralTheory §§1.1, 1.2 and 2.4. Canonical models of Hodge-type Shimura varieties, their connected components, level towers and functoriality are ShimuraVarieties §§0.5, 2.7, 6.2–6.4, 8.1, 8.5 and 8.7; the Betti–(𝔤, K) comparison and Matsushima's formula for groups anisotropic modulo their centre are ArithmeticLocallySymmetricSpaces ALS.5b.1 and ALS.5b.4 with AutomorphicSpectralTheory §§5.10, 5.12 and 5.14; the cohomology of Vogan–Zuckerman modules is AutomorphicFormsOnReductiveGroups §5.4; Hodge decomposition and the exponential sequence on compact Kähler manifolds are ComplexKahlerGeometry §§4.5 and 6.3, and projective GAGA is ComplexComparisonPartII §C1.9. Harmonic Maass forms for Weil representations of even lattices, their Fourier expansions and the ξ-operator exact sequences are QSeriesPartitionsAndMockModularForms §§8.3, 8.5 and 8.6; integral toroidal compactifications of PEL Shimura varieties at good primes, their properness for a complete cone decomposition and Fourier–Jacobi expansions of Hodge-line sections are ShimuraCompactifications §§7.3, 7.5 and 7.15. Compact-support ℓ-adic cohomology of schemes over finite fields, with its open–closed localization sequence, is EtaleCohomologyFoundations §§0.7–0.8, F.2.5 and F.4.1–F.4.6. Arithmetic divisors with Green functions and their pairing with proper one-cycles, valued in ℝ modulo excluded prime logarithms, are ArakelovGeometryAndAbelianHeights §§1.8–1.10. The Fourier vanishing criterion for continuous automorphic functions on SL₂ over a totally real field with conductor-adjusted level (Zhang's Lemma 13.6) is AutomorphicFormsOnReductiveGroups §4.4 `fourierUnitVanishing`.

Four directions that use the same objects have different end theorems and are not targets here: the arithmetic inner product formula for unitary groups (Li–Liu), whose theorems MotivesAndAlgebraicCycles §7.19 states with the almost self-dual identity of §4.5 as an explicit local premise; heights of special divisors on GSpin Shimura varieties; p-adic arithmetic inner product formulas; and CM values of higher Green functions. Generic local Jacquet–Rallis theory belongs to EndoscopicTransferAndUnitaryTraceComparison and EndoscopicTransferAndUnitaryTraceComparisonPartII: the spherical Jacquet–Rallis fundamental lemmas in the GL_n(F₀)-group and augmented Lie-algebra formulations are stated by EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5, the regular matching and twisted orbital distributions in those formulations are requested by that roadmap from EndoscopicTransferAndUnitaryTraceComparison, with transfer taken there as a relation between named test functions; the existence of smooth transfer and its compatibility with the Weil action, which Zhang's global comparison uses at every finite place (Z §13.2, footnote 9, p. 63; §14, p. 68; Appendix A, Theorem A.1, p. 73), and the passage to Zhang's formulations on S_n are requested from EndoscopicTransferAndUnitaryTraceComparison below, as passages from the existence of smooth transfer and the fundamental lemma in the homogeneous formulation that GanGrossPrasadUnitaryGroups requests from that roadmap, not as second proofs of them; this roadmap owns only Zhang's global relative trace series built from these. The arithmetic fundamental lemma for arbitrary regular semisimple elements, and over p-adic fields other than ℚ_p, is not proved here in rank n ≥ 4, nor is its group version over ℚ_p at p = n ≥ 5, whose deduction from the semi-Lie version needs the converse of §9.5(b) at q = n: §14.6 formulates the general statement and identifies §14.5 as its strongly regular case over ℚ_p, while in rank n ≤ 3 its group version is §9.8 over every finite extension of ℚ_p with p odd. The statement (H_n) of §8.6, the Krämer identity for lattices of odd largest fundamental invariant in rank n ≥ 4, is not proved here either: §8.7 and §13.10 are stated under it in that rank and are unconditional in rank n ≤ 3.

## Conventions

Locally, F/F₀ is a quadratic extension of nonarchimedean local fields of characteristic zero with odd residue characteristic p, q = #k_F₀, and a ↦ ā is the Galois involution. In the unramified case ϖ is a common uniformizer and the residue field of F has q² elements. In the ramified case π (Li–Zhang's and He–Li–Shi–Yang's notation) or u (Li–Liu's) is a uniformizer of F with π̄ = −π, and π₀ = π² is a uniformizer of F₀. F̆ is the completion of the maximal unramified extension of F. Valuations of hermitian norms are F₀-valuations unless a statement says otherwise; fundamental invariants of a lattice are π-adic exponents in the ramified case.

The special Hom form is h(x,y) = λ_Ē⁻¹ ∘ y^∨ ∘ λ_X ∘ x on V = Hom⁰_(O_F)(Ē, X), linear in x and conjugate-linear in y (PELModuliPartII §1.5). GeometryOfNumbersAndQuadraticArithmetic §2.7.1 uses forms conjugate-linear in the first variable; its input is H(x,y) = h(y,x) (§0.1). The local unramified spaces have signature (1,n−1) with rank-one source Ē of signature (0,1); the global negative-line convention is (n−1,1), and switching between them conjugates the source action, target action and framing together (PELModuliPartII §0.7).

The four local settings use different duals and interpolation variables:

| Local comparison | Dual of a lattice Λ | Interpolation variable | Analytic side |
|---|---|---|---|
| Unramified self-dual | Λ^∨ = {x : h(x,Λ) ⊂ O_F} | X = (−q)^(−k) | ∂Den(L) = −D′_L(1) |
| Unramified almost self-dual | same, rank n+1 | X = (−q)^(−k) | (q+1)·Int_Y(L) = ∂Den_Λ(L) − Den(L) |
| Ramified exotic smooth, n even | trace dual {x : h(x,Λ) ⊂ u⁻¹O_F} for the scaled form | X = q^(−s) | ∂Den(L) = −D′_L(1) |
| Ramified Krämer | hermitian sharp dual Λ^♯ = {x : h(x,Λ) ⊂ O_F} | X = q^(−2k) | ∂Den = −2·D′ plus dual-vertex corrections c_(2j) |

In each dual of the table x ranges over the rational span Λ ⊗ F of the lattice, not over the ambient space: for a full-rank lattice this is the dual in V, and for a lattice of lower rank with nondegenerate span it is the dual inside that span, the only reading under which the dual quotient has finite length and the fundamental invariants exist (taken in V, the dual of a lattice of rank m < n contains the whole orthogonal complement of its span). A lattice is integral when it lies in the dual of its setting, and nondegenerate when its rational span is nondegenerate, whatever its rank; integrality does not depend on where the dual is taken, since in either reading Λ ⊂ Λ^∨ says h(Λ, Λ) ⊂ O_F for the two hermitian duals and h(Λ, Λ) ⊂ u⁻¹O_F for the trace dual. Valuations and types always refer to the stated form of that setting.

All derived intersections keep their higher Tor terms. The Euler characteristic of a bounded complex F of coherent sheaves on a formal scheme X over Spf O_F̆ is χ(X, F) = Σ_(i,j) (−1)^(i+j)·length_(O_F̆) H^i(X, H_j(F)), the Euler characteristic of derived global sections (LZ §1.8, p. 9). It is taken only when the homology sheaves are supported on a proper scheme over Spf O_F̆ annihilated by a power of the uniformizer, which makes every H^i(X, H_j(F)) a finite-length O_F̆-module, zero for all but finitely many (i, j). Only when that support is zero-dimensional does it reduce to the alternating sum Σ_j (−1)^j·length H_j(F) of the lengths of the homology sheaves. A class in supported K-theory, its image in a graded quotient, a numerical class and an effective cycle are different objects; in particular a vertical derived class is not identified with a vertical subscheme.

Fourier transforms on a hermitian space use the trace pairing ψ(Tr_(F/F₀) h(x,y)) for an additive character ψ of F₀ of conductor O_F₀ and the self-dual Haar measure; every Fourier eigenvalue below states the Weil index it includes. The nonsplit unramified and the exotic curve functions have Fourier eigenvalue −1. A q appearing inside a density polynomial is the residue cardinality of the base field. Li–Zhang's local Whittaker normalization produces log(q²) in the derivative, Li–Liu's produces log q; the two are related by the parameter conversion of §4.6, not by substituting one logarithm for the other.

At infinity, dd^c = −(2πi)⁻¹∂∂̄ and principal arithmetic divisors carry the Green function −log|f|² (ArakelovGeometryAndAbelianHeights §1.8). In the hermitian normalization the Kudla Green function is −Ei(4πa·R(u,z)) with R(u,z) ≤ 0 the norm of the negative projection; the orthogonal function of Mihatsch–Zhang uses the nonnegative function −2R(u,z) and the factor 2π (§12.3). Finite arithmetic degrees carry the logarithm of the actual residue cardinality; complex contributions carry one half of the sum over embeddings. The arithmetic Siegel–Weil normalization divides by the reflex degree [E:F₀]; the AFL pairing divides by τ(Z^ℚ)·[E:F]. These denominators are fixed separately and are never interchanged.

Standing hypotheses of the global layers: F/F₀ is a CM extension of number fields, Φ a CM type with a distinguished embedding φ₀, V an F/F₀-hermitian space of signature (n−1,1) at φ₀ and (n,0) at the other members of Φ, and E the reflex field of the RSZ datum (PELModuliPartII §6.1). Levels are neat on both the CM and the unitary factor whenever a scheme rather than a stack is used.

Lean. `Suggested.lean` is the acceptance test of the roadmap: it states those headline theorems that are statable at the pinned Mathlib and Tau Ceti. The headline theorems are the four local Kudla–Rapoport identities (§§3.5, 4.5, 6.8, 8.7), the unramified and modified arithmetic Siegel–Weil formulas (§§13.8, 13.10), the Chow-valued modularity of the generating series of Kudla divisors on GSpin Shimura varieties and of special divisors on unitary Shimura varieties over every totally real field (§§12.6a, 12.6b and 12.7), the modularity of the CM intersection series over ℚ for n ≥ 3 (§12.9) and the strongly regular arithmetic fundamental lemma over ℚ_p, in its semi-Lie version for p ≥ n and its group version for p ≥ n + 1 and for n ≤ 3 (§14.5); the Krämer identity in rank n ≥ 4, and the modified arithmetic Siegel–Weil formula at ramified places in that rank, are stated under the hypothesis (H_m), 4 ≤ m ≤ n, of §8.6. None of them is statable at the pins: the local identities need Rapoport–Zink formal schemes, their special cycles, the derived Euler characteristic of coherent sheaves on formal schemes and hermitian local densities; the Siegel–Weil formulas need integral models of unitary Shimura varieties, arithmetic degrees and derivatives of unitary Siegel Eisenstein series; the Chow-valued modularity needs canonical models of GSpin and unitary Shimura varieties with their special divisors and vector-valued Hilbert modular forms for the Weil representation; the modularity of the CM series needs arithmetic Chow groups of the integral models; and the arithmetic fundamental lemma needs Rapoport–Zink spaces and Jacquet–Rallis orbital integrals. So `Suggested.lean` consists of its module docstring, which names these missing carriers, and declares nothing. This roadmap therefore has no backticked name of its own: a backticked identifier in this README is a pinned Mathlib or Tau Ceti declaration or a named target of a roadmap on main, and the targets of other roadmaps are cited by section.

## Exact supplier contracts

### From Mathlib

The pinned Mathlib and Tau Ceti are those of the content repository's `lake-manifest.json`. The finite-degree polynomial identities of the density normalizations use Mathlib `Polynomial`, `Polynomial.eval` and `Polynomial.derivative` over ℚ. The fundamental invariants of the exotic trace dual (§5.1) are the exponents of the decomposition of a finitely generated torsion module over a principal ideal domain into cyclic prime-power modules, Mathlib `Module.equiv_directSum_of_isTorsion` (Mathlib/Algebra/Module/PID.lean), which gives existence; their uniqueness is read off from the lengths of the successive quotients u^k M/u^(k+1) M. Nonarchimedean local fields are Mathlib `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean); it is a predicate on a field with a valuative relation and a topology and supplies no quadratic extension, hermitian form or Haar normalization. Mathlib has no formal schemes.

### From Tau Ceti

The pinned Tau Ceti has the affine formal spectrum of an adic ring: its underlying space of open primes `TauCeti.FormalScheme.Spf.carrier` (TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean) and its structure sheaf `TauCeti.FormalScheme.Spf.structureSheaf`, the limit of the structure sheaves of the thickenings (TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean). It has no category of locally noetherian formal schemes, no morphisms or coherent sheaves on them, no supported K-theory of formal schemes and no Rapoport–Zink spaces. Its `Matrix.localDensity` (TauCeti/NumberTheory/IntegralLattice/LocalDensity/Basic.lean) is the density of a symmetric matrix over ℤ_p, the limit of the normalized counts of solutions of Xᵗ·A·X = A; it has no hermitian form, no quadratic extension and no density Den(M, L) of two lattices, so it is not the hermitian density of §3.1. Its Chow groups of locally noetherian schemes, `TauCeti.AlgebraicGeometry.Chow.ChowGroup` (TauCeti/AlgebraicGeometry/Chow/Basic.lean), have no Shimura variety to apply to here. Neither pin has hermitian local densities, unitary Siegel Eisenstein series, orbital integrals or arithmetic Chow groups. These come from the roadmaps below or are constructed here.

### From TauCetiRoadmap.PELModuliPartII

Consume §§1.1–1.6 (the unramified framed functor, its representability and smoothness, the canonical rank-one source, the rank-raising embedding, the unramified special Hom space and the diagonal graph): the signature-(1,n−1) framed space N_n over Spf O_F̆, formally smooth of relative dimension n−1; the canonical lift Ē of signature (0,1); the closed immersion δ: N_(n−1) → N_n, X ↦ X × Ē; the nonsplit special Hom space V_n with the form above; and the graph Δ = (id, δ). Consume §0.7 (comparison of signature conventions). Consume §§2.1–2.5 (the almost self-dual framed functor and deformation theorem, its special Hom space, the auxiliary isogeny space and the generic projection comparison): the almost self-dual space N_n¹, regular and semistable of relative dimension n−1; the split space W_n with W_n ⊥ ⟨x₀⟩ ≅ V_(n+1), h(x₀,x₀) = ϖ; the auxiliary isogeny space Ñ with projections π₁, π₂, and on generic fibres π₁ finite étale of degree q+1 and π₂ an isomorphism onto its image. These generic statements do not give the integral finite flatness of π₁ or the exceptional divisors; those are §4.2. Consume §§3.3–3.7 (the relative exotic framed space, its good reduction, the principal ramified CM source, the exotic normalized special Hom space and the connected components with their strata): the exotic space for even n, smooth of relative dimension n−1 with exactly two connected components, the u⁻²-normalized nonsplit special Hom space, and the Bruhat–Tits stratification by trace-dual vertex lattices, each stratum meeting each component in a smooth projective generalized Deligne–Lusztig variety of dimension t(Λ)/2−1, with V_Λ ∩ V_Λ′ = V_(Λ+Λ′) when Λ+Λ′ is a vertex lattice and empty otherwise. Consume §4.6 (absolute and relative exotic spaces over an unramified base, with the isometry of their special Hom spaces). Consume §§5.1–5.3, 5.5, 5.7 and 5.8 (the Krämer filtration, the ramified rank-one source, the Krämer framed space, its framing parity, its regularity theorem and its special Hom space): the Krämer space with its rank-(n−1) filtration, semistable of relative dimension n−1, its two framings and the special Hom space of either sign. Consume §§6.1 and 6.5–6.8 (the strict fake Drinfeld datum of the RSZ construction, the integral Eisenstein conditions, the integral CM moduli, the integral unitary level data and the adjusted sign condition), §§7.1 and 7.6 (the localized RSZ moduli over O_E[1/d], a smooth separated Deligne–Mumford stack of relative dimension n−1, a quasi-projective scheme at small level, finite over the PEL moduli of the product datum), §7.2 (the semi-global RSZ moduli over O_(E,(ν))), §§7.3–7.4 (the exotic integral model and the global Krämer modification), §§7.8–7.9 (regularity and semistable reduction of the Krämer model; flatness, regularity and semistable reduction of the almost self-dual model), §7.10 (the global integral gluing with levels), §8.5 (the integral level and Hecke system) and §§9.3 and 9.5–9.9 (the nearby framing datum, the uniformization morphism, the exotic and inert basic-locus uniformizations, the CM partition and product, and the Krämer completion compatibility); the exotic global form of §9.6 is h′ = (u²/ϖ)·h with ϖ a uniformizer at the place, so u²/ϖ is a unit there. Special cycles on any of these spaces are not constructed there; they are constructed here.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Consume §A4.CR.7.2 (the crystalline Dieudonné crystal of a Barsotti–Tate group over a base on which p is locally nilpotent, and Grothendieck–Messing: deformations along nilpotent divided-power thickenings are lifts of the Hodge filtration, and a homomorphism lifts exactly when its crystalline evaluation preserves the lifted filtrations) and §A4.7 (the same criterion for polarized abelian schemes). Extra O_F-actions impose simultaneous stability; nothing beyond these criteria is assumed.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Consume §R07.1.8 (the Tate module of a p-divisible group over a mixed-characteristic base), §R07.1.22 (Tate's theorem: over a complete discrete valuation ring of characteristic zero with perfect residue field of characteristic p, homomorphisms of p-divisible groups are the Galois-equivariant homomorphisms of their Tate modules), §R07.2.10 (Dieudonné classification over a perfect field) and §R07.2.20 (the covariant Dieudonné module and the comparison of conventions).

### From TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts

Consume §6.1 (the canonical lift), §6.2 (Frobenius-marked quasi-canonical lifts), §6.4 (quadratic orders), §6.5 (the quadratic level classification) and §7.1 (quadratic ring-class degrees): the canonical lift, the Frobenius-marked level-s quasi-canonical lifts with endomorphism order O_s = O_F₀ + ϖ₀ˢO_F, their classification and the degrees of their fields of definition, with the base-field uniformizer indexing the conductor in both the ramified and unramified cases.

### From TauCetiRoadmap.GrossZagierAndArithmeticHeights

Consume §7.2: over a quadratic extension of a mixed-characteristic local field, unramified or ramified, the endomorphism ring of the canonical lift modulo π_L^(n+1) and the exact lifting length of a special-fibre endomorphism along a level-s quasi-canonical lift, stratum by stratum. These lengths are the input to the rank-two intersection numbers of §§1.4, 5.5 and 7.5.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §2.7: the integral hermitian lattices of 2.7.1, their duals (2.7.2) and their fundamental invariants read off the dual quotient (2.7.3), in the unramified and Krämer settings, whose dual {x : h(x, Λ) ⊂ O_F} is the O_F-dual of 2.7.2 for the form H(x,y) = h(y,x) and whose integral lattices satisfy H(L,L) ⊆ O_F; in the exotic setting the dual is the trace dual {x : h(x, Λ) ⊂ u⁻¹O_F}, under which a trace-self-dual lattice can have h(Λ,Λ) = u⁻¹O_F ⊄ O_F, and no rescaling by an element of F₀ turns it into an O_F-dual (an element of F₀ has even u-adic valuation), so 2.7.1–2.7.3 are not used there and §5.1 defines the trace dual and its invariants. Consume §2.9 (signed hermitian spaces over local fields of odd residue characteristic and their determinant classes). Consume §3.2: the hermitian local density (3.2.2), the normalized Siegel polynomial (3.2.4), the Cho–Yamauchi weight (3.2.5), the overlattice formula 3.2.6 and the functional equation 3.2.7; their scope is an unramified quadratic extension.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:ramified-hermitian-densities): §3.2 extended to ramified quadratic F/F₀ of odd residue characteristic, namely the local density Den(M,L), its vanishing whenever L ⊗ F admits no isometric embedding into M ⊗ F (in particular for nondegenerate M and L of equal rank with χ(M) ≠ χ(L); for rank(M) > rank(L) different signs do not force vanishing), its interpolation polynomials in X = q^(−s) for the trace-dual hyperbolic lattices of the exotic setting and in X = q^(−2k) for the hermitian-sharp hyperbolic plane of the Krämer setting, and their finite overlattice expansions.

### From TauCetiRoadmap.SchemeKTheoryOperationsPartII

Consume §0.5 (regular immersions and effective Cartier divisors of formal schemes), §0.6 (formal support), §0.7 (Tor sheaves); §1.4 (the supported group K₀^Y), §1.7 (the supported cup product), §1.8 (the Tor pairing on a regular formal scheme); §2.1 (regular supported dévissage, with its resolution-property hypothesis), §2.2 (the codimension filtration), §2.4 (rational multiplicativity of the codimension filtration on affine regular formal schemes), §2.5 (K-groups of locally noetherian formal schemes by noetherian exhaustion); §§3.1–3.4 (closed-union decomposition, Tor vanishing in the expected dimension and on an expected-dimensional part, Cartier pullback); §4.1 (schemes proper over Spf A), §4.2 (the Euler degree), §4.3 (the derived Euler pairing), §4.5 (zero-dimensional pairings), §4.6 (Cartier-divisor pairings) and §4.7 (proper pushforward and the projection formula). Their support, properness and regularity hypotheses remain in force. The product theorem §2.4 is stated for affine formal schemes; a cokernel formula for supports does not give injectivity or commutation with inverse limits.

What SchemeKTheoryOperationsPartII must provide (gap:nonaffine-formal-filtration-product): §2.4 extended so that on a regular locally noetherian formal scheme exhausted by quasi-compact opens, such as a unitary Rapoport–Zink space, the codimension filtration on supported K₀ is rationally multiplicative for the supported cup product, compatibly with the noetherian exhaustion.

### From TauCetiRoadmap.SchemeKTheoryOperations

Consume §6.12 (for separated regular noetherian schemes of finite dimension: the strict comparison of supported K₀, Adams operations with supports and the rational inclusion F^a·F^b ⊂ F^(a+b) for the supported product on intersected supports) and §7.7 (supported cycle classes, CH^p_Y(X)_ℚ ≅ Gr^p_F K₀^Y(X)_ℚ, and Gr₁G₀(Y)_ℚ ≅ CH₁(Y)_ℚ for a proper support in a catenary pure-dimensional regular scheme, with the map to Zhang's proper one-cycle quotient). These are statements for schemes, not formal schemes.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §§5.1, 5.3–5.4, 5.7 and 5.8 (Chow groups, first Chern classes, Chern classes, K₀ and G₀, the Chern character on smooth schemes of finite pure dimension over a field, and Hirzebruch–Riemann–Roch χ(X, E) = deg(ch(E)·td(T_X))_n for a locally free E on a smooth projective X of dimension n over a field, extended to K₀(X) by additivity) for the proper smooth strata of Layers 2, 5 and 7.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles and TauCetiRoadmap.EtaleCohomologyFoundations

Consume MotivesAndAlgebraicCycles §§2.4 and 2.7 (cycle classes from Chern classes; the ℓ-adic étale realization over a finite field with its Galois action, Tate twists, traces and Poincaré duality on smooth proper varieties) and, for the separated schemes of finite type over a finite field of Layers 2 and 5 (the unitary Deligne–Lusztig strata, the exotic strata and their open parts), EtaleCohomologyFoundations §0.7 (`ClassicalAlgebraic.supportLocalization`: for a closed subscheme i: Z → X with open complement j: U → X, the triangles i_*i^!K → K → Rj_*j^*K and j_!j^*K → K → i_*i^*K, with excision and naturality of the connecting maps), §0.8 (`ClassicalAlgebraic.properSupports`: the compactification-defined Rf_! for separated finitely presented morphisms of qcqs schemes on torsion coefficients, and the compact-support localization triangles it gives), §F.2.5 (compact-support cohomology RΓ_c(X, K) over a field, with its open–closed localization sequence) and §§F.4.1–F.4.6 (normalized adic systems, the classical adic realization and the rational ℚ_ℓ realization with finite-dimensional cohomology and continuous Frobenius action) for the passage from torsion to ℚ_ℓ coefficients. These are scheme statements; no analytic adic space and no analytification enters. No Tate conjecture and no general semisimplicity of Frobenius is assumed; the specific eigenvalue and semisimplicity statements are §§2.1 and 5.4.

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

Consume §5.3g (for a finite-dimensional vector space V over a completion F_v of a number field with a nondegenerate bilinear pairing B: the standard character ψ_v and its rescalings ψ_v(a·), treated through the pairing aB; the self-dual Haar measure and Fourier inversion, f̂̂(x) = f(−x) for symmetric B; lattice-indicator transforms (1_(a+L))^ = vol(L)·ψ_v(B(a,·))·1_(L^⊥) with vol(L)·vol(L^⊥) = 1; partial transforms along an orthogonal decomposition) and §5.3h (adelic Schwartz–Bruhat functions, Poisson summation, restriction to a subspace and integration along its orthogonal). Every finite extension of ℚ_p is the completion of a number field at a finite place (Krasner's lemma), so §5.3g applies to F₀ and to a hermitian space V over F viewed as an F₀-vector space with the symmetric pairing Tr_(F/F₀) h; an additive character of F₀ of conductor O_F₀ is ψ_v(a·) for some a with a·O_F₀ = 𝔇⁻¹, the inverse different of F₀/ℚ_p, since the largest fractional ideal on which ψ_v is trivial is 𝔇⁻¹ and that of ψ_v(a·) is a⁻¹𝔇⁻¹ = O_F₀.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Consume §2.1 (the Weil index), §2.5 (Weil operators on generators), §3.3 (unitary dual-pair splittings), §3.3a (the hermitian uncertainty principle: if a Schwartz–Bruhat function on a positive-dimensional nondegenerate hermitian space has support in {val h(x,x) > 0} and its trace-self-dual transform has support in {val h(x,x) ≥ 0}, it vanishes), §3.3b (the hermitian Weil operators in the Li–Zhang, Li–Liu and Zhang normalizations, with γ_V), §4.5 (the adelic Weil representation), §5.1 (theta kernels), §6.2 (Siegel–Weil sections), §6.4 (the anisotropic Siegel–Weil formula) and §6.7 (coherent and incoherent section collections).

### From TauCetiRoadmap.QSeriesPartitionsAndMockModularForms

Consume §8.3 (harmonic weak Maass spaces H_k(Γ, ρ) and the subspace H⁺ of forms whose ξ-image is cuspidal), §8.5 (for a nondegenerate even lattice L and k ≠ 1, the decomposition F = F⁺ + F⁻ of a form in H_k(Γ, ρ_L), the finiteness of its principal part, and ker ξ_k = M!_k) and §8.6 (the exact sequences 0 → M!_k → H_k → M!_(2−k) → 0 and 0 → M!_k → H_k⁺ → S_(2−k) → 0 for the Weil representation). They are used with k = 2 − n ≤ −1 for the lattice (L, Q) of signature (2n−2, 2) in §§12.4–12.5. §8.5 also supplies, in §12.6a(e)–(f), the Weil representations ρ_Λ and ρ_Λ⁻ of an even lattice Λ of signature (p, 2) and of (Λ, −Q), with ρ_Λ(T)e_μ = e(Q(μ))e_μ, and the central parity F_μ = exp(πi(k − σ/2))F_(−μ), σ the signature, at k = 1 − p/2 ≠ 1.

### From TauCetiRoadmap.ShimuraCompactifications

Consume §7.3 (for a smooth compatible cone decomposition Σ, the integral toroidal compactification of a PEL Shimura variety at a prime where the datum has good reduction: a smooth separated algebraic stack of finite type, an algebraic space at neat level, with its boundary stratification), §7.5 (its properness over the base when Σ is moreover complete; an incomplete Σ need not give a proper model: for a rank-one torus the fan consisting of the zero cone alone gives G_m, while the complete fan with the two rays gives ℙ¹) and §7.15 (Fourier–Jacobi expansions of sections of powers of the Hodge line along its boundary). A complete smooth Σ is chosen wherever properness is used. They are applied in §12.5 to the RSZ datum at the primes not dividing d, through the finite comparison of the localized RSZ model with PEL moduli of the product datum (PELModuliPartII §7.6).

### From TauCetiRoadmap.ShimuraVarieties

Consume §0.5 (the decomposition of a finite-level Shimura variety into finitely many connected components Γ_j∖X⁺ with arithmetic Γ_j), §2.3 (the graded ring of admissible automorphic sections of powers of the canonical bundle), §2.7 (Baily–Borel algebraization: the finite-level Shimura variety is an open subscheme of its normal projective minimal compactification, which for a compact quotient is the variety itself), §2.8 (Koecher's principle: when the group has no ℚ-quotient PGL₂, the boundary of the minimal compactification has codimension at least two and holomorphic automorphic sections extend over it), §6.2 (canonical models of Hodge type, applied to GSpin data), §§6.3–6.4 (connected Shimura towers and the connected and full canonical formulations), §8.1 (the canonical algebraic level tower), §8.5 (functoriality of canonical models in morphisms of Shimura data) and §8.7 (the Galois action on connected components). They are used in §§12.6a–12.6b for the GSpin Shimura variety of a quadratic space of signature (p, 2) and its comparison with the unitary Shimura variety; special divisors on these varieties are not constructed there.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

Consume ALS.5b.1 (for neat level, the natural isomorphisms between Betti cohomology, de Rham cohomology and (𝔪_G, K_∞)-cohomology of smooth automorphic functions, compatible with level maps) and ALS.5b.4 (the automorphic comparison map and, under FrankeInput, which AutomorphicSpectralTheory §§5.10, 5.12 and 5.14 prove, the decomposition of cohomology by cuspidal support; for a group anisotropic modulo its centre there is a single summand, Matsushima's formula). They are used in §12.6a for the first Betti number of compact GSpin Shimura varieties.

### From TauCetiRoadmap.ComplexKahlerGeometry and TauCetiRoadmap.ComplexComparisonPartII

Consume ComplexKahlerGeometry §4.5 (the holomorphic exponential sequence, Pic_hol(M) ≅ H¹(M, O^×) and the identification of its connecting map with the integral first Chern class) and §6.3 (Hodge decomposition on compact Kähler manifolds, so b₁ = 2h^(0,1)), and ComplexComparisonPartII §C1.9 (projective and proper coherent GAGA, identifying algebraic and analytic line bundles on a projective variety). With b₁ = 0 they give H¹(M, O) = 0 and the injectivity of c₁ on Pic(M) ⊗ ℚ used in §12.6a(b).

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §1.1 (normalized induced families), §1.2 (Eisenstein series in the convergence chamber), §2.4 (meromorphic continuation and functional equations) and §§5.10, 5.12 and 5.14 (Franke's comparison, the Franke–Schwermer decomposition and the Kostant-weight statement, which together prove the hypothesis FrankeInput of ArithmeticLocallySymmetricSpaces ALS.5b.4, so that for a group anisotropic modulo its centre the automorphic decomposition of cohomology is Matsushima's formula; used in §12.6a). Continuation does not give a Siegel–Weil identity; that is MetaplecticAutomorphicForms §6.4 with the normalization of §13.4.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume §4.4 `fourierUnitVanishing`: for a totally real field F₀, a finite set B of finite places, the additive character with conductor exponents c_v (c_v the largest integer for which ψ_v is trivial on ϖ_v^(−c_v)O_(F₀,v)), and a continuous left SL₂(F₀)-invariant function on SL₂(𝔸_F₀) at compact-open level that is invariant at each v ∈ B under m(ϖ_v^(c_v))⁻¹·SL₂(O_(F₀,v))·m(ϖ_v^(c_v)), m(t) = diag(t, 1): if its Fourier coefficients at all ξ ∈ F₀^× with v(ξ) = 0 for every v ∈ B vanish identically in the archimedean variable, the function is constant, and it is zero if it has nonzero parallel weight (Z Lemma 13.6). It is used over F₀ = ℚ in §14.3; its proof, by induction on B with strong approximation for SL₂, is that roadmap's. Consume also §5.4 (Vogan–Zuckerman modules A_𝔮(λ): their (𝔤, K)-cohomology with matching coefficients is Hom_(L∩K)(Λ^(i−R)(𝔩 ∩ 𝔭), ℂ) in degree i, R = dim(𝔲 ∩ 𝔭), so zero below R, and every irreducible unitary representation with nonzero cohomology is of this form); it is used in §12.6a for 𝔰𝔬(p, 2), where R ≥ 2 for every proper θ-stable 𝔮 when p ≥ 3.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

Consume §1.8 (arithmetic divisors (D,g) with Green functions of logarithmic type on regular schemes flat and of finite type over O_K or O_K[1/S], principal divisors (div f, −log|f|²)), §1.9 (metrized line bundles and ĉ₁) and §1.10 (the pairing of ĈH¹ ⊗ ℚ with proper one-cycles, valued in ℝ or in ℝ_S = ℝ/span_ℚ{log p : p below S}, with horizontal, vertical, principal and Green formulas).

What ArakelovGeometryAndAbelianHeights must provide (gap:arithmetic-chow-star-products): §§1.8–1.10 extended to Gillet–Soulé arithmetic Chow groups ĈH^p of proper regular arithmetic varieties in every codimension, with Green currents of logarithmic type, the star product for properly intersecting divisors, the arithmetic intersection product and the arithmetic degree normalized by one half of the sum over complex embeddings.

### From TauCetiRoadmap.PELModuli

Consume §M1.3 (unitary O_F-abelian schemes and signature type), §M1.13 (level change and the Hecke action), §M3.4 (complex points of PEL moduli), §M3.8 (the hermitian space of homomorphisms from a CM object) and §M6.1 (finite étale level-forgetting and Hecke maps).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §2.1 (centralizer-normalized orbital integrals of a connected reductive group and of its Lie algebra, with semisimple descent), §2.4 (κ-orbital and stable orbital integrals) and §2.13 (Fourier transforms of Lie-algebra orbital integrals and their compatibility with transfer). These are orbital integrals for conjugation; they are the model for, and do not contain, the η-twisted GL_(n−1)(F₀)-orbital integrals on S_n, whose finiteness is proved in §9.3. Consume also the Jacquet–Rallis regular matching across pure forms and the η(det)-twisted orbital distributions, in the GL_n(F₀)-group and augmented Lie-algebra formulations, that EndoscopicTransferAndUnitaryTraceComparisonPartII requests from it under the contract it calls jr-local-comparison. That contract takes transfer as a relation between named test functions and contains neither the existence of smooth transfer nor its compatibility with partial Fourier transforms; these are gap:jr-smooth-transfer-existence and gap:jr-transfer-weil-compatibility below. Its ordinary endoscopic transfer and ordinary fundamental lemma do not give Jacquet–Rallis matching or orbital-integral identities.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:relative-fundamental-lemma): for every unramified quadratic extension F/F₀ of nonarchimedean local fields of characteristic zero, every residue characteristic included, and every m ≥ 1, the Jacquet–Rallis fundamental lemma in the homogeneous formulation, with the transfer factor and quotient measures of the request GanGrossPrasadUnitaryGroups makes under the same name, namely that the characteristic function of Res_(F/F₀)(GL_m × GL_(m+1))(O_F₀) matches the characteristic function of the hyperspecial subgroup of U(W) × U(W ⊕ ⟨1⟩) stabilizing a self-dual lattice Λ ⊂ W and Λ ⊕ O_F·e, where e spans ⟨1⟩ and has norm 1, for the m-dimensional hermitian space W containing a self-dual lattice, and zero on the other m-dimensional hermitian space, together with its Lie-algebra form in every rank and, for the split algebra F₀ × F₀, the elementary spherical base-change transfer.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:relative-finite-transfer): for every finite extension F₀ of ℚ_p, p = 2 included, every quadratic étale F₀-algebra F and every m ≥ 1, the existence of smooth transfer in the homogeneous Jacquet–Rallis formulation in both directions, with the transfer factor and quotient measures of the request GanGrossPrasadUnitaryGroups makes under the same name, so that every compactly supported smooth function on Res_(F/F₀)(GL_m × GL_(m+1))(F₀) has a matching family on the groups U(W) × U(W ⊕ ⟨1⟩) over the m-dimensional hermitian spaces W and every compactly supported smooth function on one U(W) × U(W ⊕ ⟨1⟩), extended by zero to the others, has a matching function on Res_(F/F₀)(GL_m × GL_(m+1))(F₀).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-zhang-formulation-fl): for an unramified quadratic extension of p-adic fields of odd residue characteristic, the passage from the GL_n(F₀)-group formulation, with the space X_n of invertible hermitian matrices on the unitary side, and the augmented Lie-algebra formulation of EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5, from the matching and η-twisted orbital distributions that that roadmap requests from EndoscopicTransferAndUnitaryTraceComparison, and from the fundamental lemma in the homogeneous formulation that GanGrossPrasadUnitaryGroups requests from it (gap:relative-fundamental-lemma), to Zhang's formulations on S_n = {γ ∈ GL_n(F) : γγ̄ = 1} under GL_(n−1)(F₀) and on S_(n−1) × (F₀^(n−1) ⊕ (F₀^(n−1))*) under GL_(n−1)(F₀): regular semisimple matching with U(V_n) under U(V_(n−1)) and with U(V_(n−1)) × V_(n−1), the transfer factors ω(γ) = η̃(det(γ)^(−⌊n/2⌋)·det(γ^i e)_(i=0)^(n−1)) and ω(γ,u′) = η̃(det(γ)^(−⌊(n−1)/2⌋)·det(γ^i u₁)_(i=0)^(n−2)) with the natural unramified extension η̃(x) = (−1)^(v_F(x)) of η, and the Jacquet–Rallis fundamental lemma for the unit test functions in both of Zhang's versions for every residue cardinality q, including q ≤ n, in the form that the unit function transfers to the pair whose component on the nonsplit unitary group is zero, so that its normalized orbital integrals vanish at the regular semisimple elements matching the nonsplit group.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-smooth-transfer-existence): for every finite extension F₀ of ℚ_p, p = 2 included, and every quadratic étale F₀-algebra F, a ramified or unramified field or the split algebra F₀ × F₀ (where Zhang's comparison also asks the test functions to match in the elementary way of Z Remark 13.2, p. 63), with Zhang's regular semisimple matching and the transfer factors of gap:jr-zhang-formulation-fl formed with a fixed extension η̃ of η to F^×, the existence of smooth transfer in both of Zhang's formulations (Z Definitions 2.1–2.2, p. 10), in both directions, so that every Schwartz function on Zhang's side has a transfer to the unitary side for the hermitian spaces of the given dimension and every Schwartz function on the unitary side for one hermitian space, extended by zero to the others, has a transfer on Zhang's side, deduced from the existence of smooth transfer in the homogeneous formulation that GanGrossPrasadUnitaryGroups requests from it (gap:relative-finite-transfer).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-transfer-weil-compatibility): for every F₀ and F as in gap:jr-smooth-transfer-existence, the compatibility of smooth transfer in Zhang's semi-Lie formulation with the partial Fourier transform in the vector variable, so that ω(h)Φ′ matches ω(h)Φ for every h ∈ SL₂(F₀) whenever Φ′ matches Φ, where ω(h) denotes the local Weil representations of the two sides (Z Appendix A, Theorem A.1, p. 73).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII

Consume §4.4 (the spherical rank-shifted Jacquet–Rallis comparison between GL_n(F₀) under η-twisted GL_(n−1)(F₀)-conjugation and the space X_n of invertible hermitian matrices of both isometry classes under U(V_(n−1)), for an unramified quadratic extension and every residue cardinality, which at the unit of the spherical Hecke algebra is the Jacquet–Rallis fundamental lemma in the group formulation, with the vanishing for the other hermitian form) and §4.5 (the augmented spherical Jacquet–Rallis transfer between gl_n(F₀) × F₀^n × (F₀^n)* and Herm(V_n) × V_n, which at the unit is the fundamental lemma in the augmented Lie-algebra formulation). Both are stated for the reference hermitian forms with Haar measures giving the hyperspecial subgroups volume one, the normalization of §9.3; the passage to Zhang's formulations on S_n is gap:jr-zhang-formulation-fl above.

## How to read the build

Layers 0–3 prove the unramified Kudla–Rapoport identity: special cycles and their derived intersections (Layer 0), Bruhat–Tits strata and horizontal cycles (Layer 1), Tate classes and local modularity of vertical classes (Layer 2), and the density side with the induction that closes the identity (Layer 3). Layer 4 compares the almost self-dual model with the self-dual one through the Li–Rapoport–Zhang resolution and carries its exceptional correction. Layers 5–6 prove the exotic smooth identity in even rank, and Layers 7–8 the Krämer identity: in rank two from the explicit intersection numbers of §7.5a, and in higher rank by an induction that reaches every lattice except those with odd largest fundamental invariant, which are the statement (H_n) of §8.6, proved in rank three and, in rank n ≥ 4, where no published argument covers it, the hypothesis under which the identity is stated. Layer 9 builds the local intersection numbers of the arithmetic fundamental lemma and their reductions and local constancy; it depends on Layers 0–2 but not on Layers 3–8. Layers 10–12 construct global special cycles, derived CM cycles, modular generating series of arithmetic divisors and their pairings. Layer 13 proves the arithmetic Siegel–Weil formulas from Layers 3, 4, 8 and 10, with the Kudla Green function of Layer 12. Layer 14 combines the CM pairing with Zhang's relative trace series to isolate local orbits and prove the strongly regular AFL. Each target lists in its *Needs* line what its statement and its proof route use.

## Layer 0: Unramified special cycles, strata and derived intersections

Over an unramified quadratic extension F/F₀ of odd residue characteristic, define the Kudla–Rapoport cycles on the signature-(1,n−1) Rapoport–Zink space N_n of PELModuliPartII §§1.1–1.2, the unitary Deligne–Lusztig varieties and the Bruhat–Tits strata of the reduced locus, and the derived classes and Euler intersection numbers of special cycles. Prove Cartierness, regularity of difference divisors, Tor independence, basis independence, proper support, cancellation of self-dual summands and the rank-one normalization.

### 0.1 Special Hom convention comparison

Prove that, for the special Hom space V = Hom⁰_(O_F)(Ē, X) with h(x,y) = λ_Ē⁻¹ ∘ y^∨ ∘ λ_X ∘ x (linear in x), the form H(x,y) = h(y,x) is hermitian and conjugate-linear in its first variable, and that for every O_F-lattice L ⊂ V the pairs (L,h) and (L,H) have the same norms h(x,x) = H(x,x), the same dual lattice, the same fundamental invariants, valuation and type, and the same representation counts and local densities. Conjugating the source action, the target action and the framing together converts the signature (1,n−1) to Zhang's (n−1,1) and preserves these invariants (LZ §§1.7–1.8, pp. 8–9, for the lattice and formal-scheme conventions; §§2.1–2.2, pp. 10–11, for the Rapoport–Zink space, the special Hom space and its pairing). The proof checks the Rosati involution on scalars in both variables before transporting signatures or duals.

**Checks.**

- For a ∈ O_F, H(ax,y) = ā·H(x,y) while h(ax,y) = a·h(x,y); the two conventions disagree on scalars but agree on h(x,x) = H(x,x).
- For a rank-one lattice O_F·x with h(x,x) = ϖ^a, both conventions give the dual ϖ^(−a)O_F·x and the single invariant a.
- Exchanging the source Ē for E without conjugating the framing does not give the stated space: the result has signature (2,n−1) for the rank-raised object in place of (1,n), as PELModuliPartII §1.4 records.

*Needs:* PELModuliPartII §§0.7 and 1.5; GeometryOfNumbersAndQuadraticArithmetic 2.7.1–2.7.3.

### 0.2 Unramified Kudla–Rapoport cycles

Construct the special cycles. For a finitely generated O_F-submodule L ⊂ V_n, let Z(L) be the subfunctor of N_n whose S-points are those (X, ι, λ, ρ) for which every framing quasi-homomorphism x ∈ L lifts to a homomorphism Ē_S → X; for x ≠ 0 put Z(x) = Z(O_F·x). Prove that Z(L) is a closed formal subscheme of N_n and depends only on the module L, not on a chosen tuple of generators (LZ §§2.1–2.3, pp. 10–11). The route applies the homomorphism-lifting criterion of Grothendieck–Messing along nilpotent divided-power thickenings, which cuts out each lifting locus by a closed condition, and intersects the conditions for a set of generators.

Its API consists of the following facts:

- A morphism S → N_n factors through Z(L) if and only if every x ∈ L lifts over S.
- Equal O_F-spans give equal closed formal subschemes, and Z(L + M) = Z(L) ∩ Z(M) as closed formal subschemes.
- For g in the unitary group of V_n acting on N_n through the framing, g·Z(L) = Z(gL).
- For a morphism of test schemes the pullback of Z(L) is the Hom-lifting locus of the pulled-back object, so the construction commutes with base change.

**Checks.**

- Replacing a generator x by a unit multiple a·x, a ∈ O_F^×, does not change Z(x).
- Z(0) = N_n, because the zero homomorphism always lifts; the Cartier statement of §0.5 therefore excludes x = 0.
- If val h(x,x) < 0 then Z(x) = ∅: a lifted homomorphism has integral norm.
- If h(u,u) = 1 then Z(u) is the image of the closed immersion δ: N_(n−1) → N_n of PELModuliPartII §1.4, so Z(u) ≅ N_(n−1), of relative dimension n−2.

*Needs:* §0.1; PELModuliPartII §§1.1–1.5; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20.

### 0.3 Unitary Deligne–Lusztig varieties

Define, for a nondegenerate hermitian space Ω of dimension 2d+1 over F_(q²) with its Frobenius-semilinear pairing, the variety Y_Ω classifying (d+1)-dimensional subspaces U ⊂ Ω ⊗ k̄ with U^⊥ ⊂ U, where ⊥ is taken for the Frobenius-twisted pairing. Prove that Y_Ω is smooth and projective of dimension d over F_(q²), with a stratification by closed subvarieties indexed by the rational isotropic subspaces of Ω, each stratum isomorphic to the variety of the same kind attached to a smaller hermitian quotient (LZ §2.5, p. 12; §5.3, pp. 25–26). The route constructs Y_Ω as a closed subvariety of the Grassmannian and computes its tangent spaces.

Its API consists of the following facts:

- A k̄-point is a (d+1)-plane U with U^⊥ ⊂ U, not U ⊂ U^⊥.
- The closed strata are the loci containing a given rational isotropic subspace W, isomorphic to Y_(W^⊥/W).
- Frobenius preserves the rational stratification.
- For an extension of the residue field the points are those of the base-changed hermitian space with the same incidence equation, and the tautological subbundle pulls back along morphisms of test schemes.

**Checks.**

- For d = 0 the variety is a point.
- For d = 1 it is the smooth Fermat curve x^(q+1) + y^(q+1) + z^(q+1) = 0, with q³+1 points over F_(q²); at q = 3 this is 28 points.
- Replacing the Frobenius-twisted orthogonal by the bilinear orthogonal changes the incidence equation and gives a different subvariety of the Grassmannian.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §2.9; SchemeAndStackFoundations §§5.1, 5.4.

### 0.4 Odd-type vertex strata

Construct the Bruhat–Tits strata. A vertex lattice is an O_F-lattice Λ ⊂ V_n with Λ ⊂ Λ^∨ ⊂ ϖ⁻¹Λ; in the nonsplit space V_n its type t(Λ) = dim_(k_F) Λ^∨/Λ is odd, t = 2d+1 ≤ n. Prove that the reduced locus N_(n,red) is the union of closed subschemes V(Λ) indexed by the vertex lattices, with V(Λ) ≅ Y_(Λ^∨/Λ) of dimension (t(Λ)−1)/2; that V(Λ) ⊂ V(Λ′) exactly when Λ′ ⊂ Λ; that V(Λ) ∩ V(Λ′) = V(Λ + Λ′) when Λ + Λ′ is a vertex lattice and is empty otherwise; and that Z(L)_red is the union of the V(Λ) with L ⊂ Λ (LZ §§2.5–2.7, pp. 12–13). The route uses the Dieudonné-lattice description of the k̄-points of N_n through PELModuliPartII §§1.1 and 1.5 and the covariant Dieudonné module, as in the description of the supersingular locus that LZ §2.7 recalls (p. 12).

Its API consists of the following facts:

- The quotient Λ^∨/Λ is a nondegenerate hermitian space of dimension t(Λ) over F_(q²).
- Intersections of strata are indexed by sums of vertex lattices, not by intersections of lattices.
- The reduced special cycle Z(L)_red is the union of the strata V(Λ) with L ⊂ Λ.
- Equality of the underlying O_F-lattices gives equality of the vertex lattices, their quotient hermitian spaces and their strata.

**Checks.**

- A type-one vertex lattice gives a zero-dimensional stratum, a point.
- A type-three vertex lattice gives a curve, the Fermat curve of §0.3.
- If L ⊄ Λ then V(Λ) is not contained in Z(L): containment of strata is tested by lattice containment.

*Needs:* §§0.2–0.3; PELModuliPartII §§1.1 and 1.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.10, R07.2.20; GeometryOfNumbersAndQuadraticArithmetic 2.7.2.

### 0.5 Cartier divisors, difference divisors and Tor independence

Prove the divisor theory of special cycles. For 0 ≠ x ∈ V_n, Z(x) is an effective Cartier divisor on N_n or is empty; flatness over Spf O_F̆ is not asserted, since a nonzero label can have vertical components. The difference divisor D(x) = Z(x) − Z(ϖ⁻¹x) is effective and regular, and Z(x) = Σ_(i≥0) D(ϖ^(−i)x) as a locally finite sum. For F-linearly independent x, y the sheaves Tor_i(O_(Z(x)), O_(Z(y))) vanish for i ≥ 1, so O_(Z(x)) ⊗^L O_(Z(y)) = O_(Z(x)) ⊗ O_(Z(y)) (LZ §2.4, p. 11; Lemma 2.8.1, pp. 13–14; Ter13b Theorem 1, p. 2; Ter13a Lemma 3.1, pp. 21–22). The route: Cartierness from the one-equation lifting obstruction of a homomorphism out of the height-two, dimension-one source; regularity of D(x) by Terstiege's induction on n, whose base n ≤ 3 is the explicit local computation on the space for GU(1,2) and whose step restricts to Z(u) ≅ N_(n−1) at points that are not super-general and uses the regularity of the special fibre of Z(x) at super-general points, written for F₀ = ℚ_p and carried out here over F₀ as LZ states it; Tor independence by showing that the local equations of Z(x) and Z(y) have no common factor in the regular local rings of N_n, by induction on n through restriction to Z(u) ≅ N_(n−1) at points that are not super-general and through the difference divisors at super-general points of the strata of §0.4, with base case n ≤ 3 from the absence of common components of two special divisors with independent labels on the space for GU(1,2).

**Checks.**

- For val h(x,x) = 0 or 1 the cycle Z(ϖ⁻¹x) is empty, so D(x) = Z(x).
- x = 0 is excluded: Z(0) = N_n is not a divisor.
- For x and y = ax with a ∈ F^× the labels are dependent and the Tor statement does not apply; for a = 1, Tor₁(O_(Z(x)), O_(Z(x))) = O_(Z(x))(−Z(x)), which is nonzero exactly when Z(x) ≠ ∅. In V₁ at val h(x,x) = 1, Z(x) = Spec O_F̆/ϖ and Tor₁ ≅ (ϖ)/(ϖ²) ≅ O_F̆/ϖ ≠ 0. Negative control: at val h(x,x) = −1, Z(x) = ∅ by §0.2, so O_(Z(x)) = 0 and both sides are 0; the nonvanishing is not asserted for an empty divisor.

*Needs:* §§0.2, 0.4; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; PELModuliPartII §§1.2 and 1.4; SchemeKTheoryOperationsPartII §§0.5, 0.7 and 3.2.

### 0.6 Derived Kudla–Rapoport class and Euler intersection

Define the derived class. For an O_F-lattice L ⊂ V_n of rank r with basis x₁, …, x_r, let ᴸZ(L) be the class of O_(Z(x₁)) ⊗^L ⋯ ⊗^L O_(Z(x_r)) in the supported group K₀^(Z(L))(N_n), and its image in the r-th graded piece of the codimension filtration. For r = n define Int(L) = χ(N_n, O_(Z(x₁)) ⊗^L ⋯ ⊗^L O_(Z(x_n))) = Σ_(i,j) (−1)^(i+j)·length_(O_F̆) H^i(N_n, Tor_j), the Euler characteristic of derived global sections of the Tor sheaves Tor_j = H_j(O_(Z(x₁)) ⊗^L ⋯ ⊗^L O_(Z(x_n))), which is finite because these sheaves vanish for j > n and are supported on Z(L), a proper scheme annihilated by a power of ϖ (§0.7), so each H^i(N_n, Tor_j) is a finitely generated module over some O_F̆/ϖ^k (LZ Definitions 2.4.1–2.4.2, p. 11; Corollary 2.8.2, p. 14). The route builds the derived tensor product from finite Koszul models on noetherian opens, glues, and applies the derived Euler pairing of SchemeKTheoryOperationsPartII §4.3.

Its API consists of the following facts:

- The class is the derived tensor product of the structure sheaves, including all higher Tor sheaves.
- Its image in the r-th graded piece is compatible with restriction to open formal subschemes.
- For r = n, Int(L) = Σ_(i,j) (−1)^(i+j)·length H^i(N_n, Tor_j); when Z(L) is zero-dimensional this is Σ_j (−1)^j·length Tor_j.
- Flat pullback of the supported tensor product is the tensor product of the pulled-back special-cycle complexes, and classes with disjoint supports multiply to zero.

**Checks.**

- If the cycles meet transversally in a reduced zero-dimensional scheme, Int(L) is its ordinary length, the number of points counted with residue degrees.
- Lengths of sheaves do not replace the cohomological lengths on positive-dimensional support: for a proper curve C ≅ ℙ¹ in the special fibre contained in a Cartier divisor D with O(D)|_C ≅ O(−1), O_C ⊗^L O_D has Tor₀ = O_C and Tor₁ = O_C(−D) ≅ O_C(1), whose stalks have infinite O_F̆-length, while the Euler characteristic is χ(O_C) − χ(O_C(1)) = 1 − 2 = −1 = deg O(D)|_C.
- For a Cartier divisor D the self-product O_D ⊗^L O_D has Tor₀ = O_D and Tor₁ = O_D(−D); its class is [O_D] − [O_D(−D)], which a naive intersection of supports omits.
- Replacing a basis by its image under an elementary matrix in GL_r(O_F) does not change the derived class (§0.7); replacing it by a basis of a different lattice of the same rank does.

*Needs:* §0.5; SchemeKTheoryOperationsPartII §§1.4, 1.7, 1.8, 2.2, 2.5 and 4.3; gap:nonaffine-formal-filtration-product for the graded image.

### 0.7 Basis independence and proper support

Prove that the derived class ᴸZ(L) depends only on L and not on its basis, and that for L of rank n the formal scheme Z(L) is a proper scheme over Spf O_F̆ annihilated by a power of ϖ, with reduced locus a finite union of strata V(Λ); and that Z(L) is noetherian when L has rank n, and when L has rank n−1 and its rational span L ⊗ F is nondegenerate. The special cycle Z(L) of §0.2 is defined for every finitely generated L; only this finiteness conclusion needs the nondegenerate span in rank n−1. Consequently Int(L) is a finite integer depending only on L (LZ Corollary 2.8.2, p. 14; Lemma 2.9.2, p. 14, under the standing nondegeneracy of rank-(n−1) spans of LZ §1.7, p. 8; Lemma 2.10.1, pp. 14–15). The route uses elementary generators of GL_r(O_F) and the pairwise Tor independence of §0.5 for basis independence, and for properness the absence of a characteristic-zero point on which a full-rank lattice of a nonsplit space lifts. Both finiteness statements come from the finiteness of the vertex lattices containing L. For nondegenerate W = L ⊗ F of rank n−1, every vertex lattice Λ ⊃ L has its W-projection in the W-dual of L, and integrality then bounds its component on the anisotropic line W^⊥, so Λ lies in a fixed lattice M, hence contains ϖΛ^∨ ⊃ ϖM^∨, and there are finitely many such Λ.

**Checks.**

- For n = 1 and L = O_F·x with val h(x,x) = 1, Z(L) = Spec O_F̆/ϖ, proper and killed by ϖ.
- Properness is a full-rank statement. For n = 2 and L = O_F·e with h(e,e) = 1, Z(L) ≅ N₁ = Spf O_F̆ (the unit-norm cycle is the lower-rank space), flat over Spf O_F̆, nonempty and not killed by any power of ϖ. Negative control: L = O_F·ϖ⁻¹e has norm ϖ⁻², so Z(L) = ∅ by §0.2; its horizontal part is empty and it is killed by every power of ϖ. A rank-(n−1) lattice therefore has a nonempty horizontal part only when it is integral.
- Two bases related by a matrix in GL_n(O_F) give the same Int(L); bases of two non-isometric lattices of the same rank need not.
- The nondegenerate span is needed in rank n−1 (negative control). Let n = 3 and V₃ = H ⊥ ⟨a⟩ with h(e,f) = 1, h(e,e) = h(f,f) = 0 and h(a,a) = ϖ. The determinant −ϖ has odd valuation, so V₃ is the nonsplit space. L = O_F·e ⊕ O_F·a is integral of rank 2 = n−1, but its Gram matrix diag(0, ϖ) has determinant 0. For every j ≥ 0 the lattice Λ_j = O_F·ϖ^(−j)e ⊕ O_F·ϖ^(j+1)f ⊕ O_F·a has Gram matrix ϖ times the unimodular matrix (hyperbolic plane ⊥ ⟨1⟩). Hence Λ_j^∨ = ϖ⁻¹Λ_j, the type is 3, and L ⊂ Λ_j. By §0.4 the curves V(Λ_j) are pairwise distinct and lie in Z(L)_red, so Z(L) has infinitely many irreducible components and is not noetherian. The rank-one lattice O_F·e of the previous Check has nondegenerate span and is covered by the statement.

*Needs:* §§0.4–0.6; SchemeKTheoryOperationsPartII §§2.1, 4.1 and 4.2.

### 0.8 Self-dual cancellation

Prove that if L = M ⊥ L₂ with M ⊂ V_n self-dual of rank r, 0 ≤ r < n, and L₂ an integral lattice of rank n−r in M^⊥ ≅ V_(n−r), then Z(M) ≅ N_(n−r), the special cycles of labels in M^⊥ restrict to the special cycles of N_(n−r), and Int_n(L) = Int_(n−r)(L₂) (LZ §2.11, Lemma 2.11.1, p. 15). The route splits off the self-dual polarized summand, identifies Z(M) with the image of the iterated rank-raising embedding, and applies the projection formula for this regular immersion.

**Checks.**

- For r = 0 the statement is the identity Int_n(L) = Int_n(L).
- For n = 2, L = ⟨u⟩ ⊥ ⟨x⟩ with h(u,u) = 1 and val h(x,x) = a odd and a ≥ 1 (integrality of L₂ = ⟨x⟩), Int₂(L) = Int₁(⟨x⟩) = (a+1)/2.
- If M is integral but not self-dual, Z(M) is not isomorphic to N_(n−r) and the formula is not asserted; integrality of L₂ is part of the hypothesis.

*Needs:* §§0.2, 0.7; PELModuliPartII §1.4; GeometryOfNumbersAndQuadraticArithmetic 2.7.2; SchemeKTheoryOperationsPartII §4.7.

### 0.9 Unramified rank-one normalization

Prove that for n = 1 and x ∈ V₁ with a = val h(x,x), which is odd because V₁ is nonsplit: if a ≥ 1, then Int(O_F·x) = (a+1)/2, the normalized unramified density polynomial of O_F·x is D(X) = Σ_(i=0)^a (−X)^i, and −D′(1) = (a+1)/2; if a < 0, then O_F·x is not integral, Z(x) = ∅, D = 0 and Int(O_F·x) = −D′(1) = 0 (LZ Example 2.4.3, p. 12; Example 3.5.2, p. 18). The route computes the lifting length of x along the canonical lift and differentiates the finite polynomial sum; the polynomial is GeometryOfNumbersAndQuadraticArithmetic 3.2.6 for the overlattices ϖ^(−j)O_F·x, 0 ≤ j ≤ (a−1)/2, each of type one, giving (1−X)(1 + X² + ⋯ + X^(a−1)).

**Checks.**

- a = 1: D(X) = 1 − X and Int = −D′(1) = 1.
- a = 3: D(X) = 1 − X + X² − X³, D(1) = 0 and −D′(1) = 2 = Int.
- a = −1: the lattice is not integral, Z(x) = ∅ and Int = 0. The value a = 0 does not occur in V₁; the polynomial 1 it would give has derivative zero, so the formula's domain is part of the statement.
- a = −3: Z(x) = ∅ and D = 0, so Int = −D′(1) = 0, whereas the expression (a+1)/2 would give −1; the formula (a+1)/2 is asserted only for a ≥ 1. At a = −1 the two happen to agree, which is why a = −1 alone does not test the restriction.

*Needs:* §§0.6–0.7; PELModuliPartII §1.3; GeometryOfNumbersAndQuadraticArithmetic 3.2.4–3.2.6; Mathlib `Polynomial.derivative`, `Polynomial.eval`.

### Examples

At odd valuations a = 1 and a = 3 the rank-one normalized polynomials are 1 − X and 1 − X + X² − X³; their negative derivatives at one are 1 and 2, the intersection numbers. A type-three vertex lattice gives the Fermat curve of degree q+1, whose q³+1 rational points are the type-one strata it contains. For a Cartier divisor D the derived self-intersection retains Tor₁ = O_D(−D). These examples fix the derivative sign, the parity condition of the nonsplit space and the role of higher Tor.

### Dependencies

PELModuliPartII §§0.7 and 1.1–1.5; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.10, R07.2.20; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9, 3.2; SchemeKTheoryOperationsPartII §§0.5, 0.7, 1.4, 1.7–1.8, 2.1–2.2, 2.5, 3.2, 4.1–4.3 and 4.7, with gap:nonaffine-formal-filtration-product for graded images; SchemeAndStackFoundations §§5.1, 5.4.

## Layer 1: Horizontal cycles and lifting criteria

For a nondegenerate lattice of rank n−1, split its derived special cycle into a horizontal part, the flat closure of its generic fibre, and a vertical class supported on the reduced locus. Prove the integral Tate-module lifting criteria, classify the primitive horizontal components as quasi-canonical lifting cycles indexed by overlattices of type at most one, compute their degrees, and compute the vertical multiplicities in rank three.

### 1.1 Horizontal and vertical classes

Define, for a nondegenerate O_F-lattice L♭ ⊂ V_n of rank n−1, the horizontal part Z(L♭)_H as the closed formal subscheme of Z(L♭) that is the flat closure of its generic fibre, and the vertical class ᴸZ(L♭)_V = ᴸZ(L♭) − [O_(Z(L♭)_H)] in the graded piece Gr^(n−1)K₀^(Z(L♭))(N_n). Prove that ᴸZ(L♭)_V is formally supported on N_(n,red), so that it lies in the image of the graded supported group of the reduced locus (LZ Definition 2.9.1 and Lemma 2.9.2, p. 14; §§5.1–5.2, pp. 23–24). The vertical class is a class in supported K-theory; in general it is not the structure sheaf of one vertical subscheme. The route applies Tor vanishing on the expected-dimensional horizontal part (Z Appendix B, Lemma B.2(ii), p. 77) to the decomposition of Z(L♭) into horizontal and vertical closed unions.

Its API consists of the following facts:

- The horizontal part is the flat closure of the generic fibre of Z(L♭).
- ᴸZ(L♭) = [O_(Z(L♭)_H)] + ᴸZ(L♭)_V in the graded supported group.
- The vertical class is supported formally on the reduced locus, not merely set-theoretically on a special fibre.
- Restriction to the generic fibre kills the vertical class and identifies the horizontal class with the derived intersection there.

**Checks.**

- For n = 2 and L♭ = ⟨y⟩ with h(y,y) a unit, Z(y) ≅ N₁ is flat, Z(L♭)_H = Z(L♭) and the vertical class is zero.
- A component of Z(L♭) contained in the special fibre is not in the flat closure of the generic fibre.
- For a proper curve C contained in a Cartier divisor D, the pairing of [O_C] with O_D in derived intersection is χ(O_C) − χ(O_C(−D)) = deg_C O(D)|_C; dropping Tor instead gives χ(O_C), which generally differs.

*Needs:* §§0.4, 0.6–0.7; SchemeKTheoryOperationsPartII §§0.6, 3.1 and 3.3; gap:nonaffine-formal-filtration-product.

### 1.2 Special Tate-module lifting criteria

Prove the integral lifting criteria. Let K/F̆ be finite, z ∈ N_n(O_K) with p-divisible group G, and L_z = Hom_(O_F)(T_p Ē, T_p G), a self-dual hermitian O_F-lattice of rank n. With the Tate map i_K: Hom⁰_(O_F)(Ē, G) → L_z ⊗ F and the reduction map i_k: Hom⁰_(O_F)(Ē, G) → V_n, one has Hom_(O_F)(Ē, G) = i_K⁻¹(L_z), and therefore z ∈ Z(M) if and only if M ⊂ i_k(i_K⁻¹(L_z)). Separately, for every self-dual lattice L of rank n and every nondegenerate hyperplane W ⊂ L ⊗ F, the saturated lattice W ∩ L has type at most one (LZ Lemmas 4.4.1 and 4.5.1, §§4.4–4.5, pp. 21–23). The route applies Tate's theorem on homomorphisms of p-divisible groups over O_K in the polarized O_F-linear setting; for the hyperplane statement, choose a primitive equation of W in the unimodular lattice and bound the radical of the reduced Gram form by one.

**Checks.**

- For n = 1 the lattice L_z is O_F with Gram matrix 1, and a quasi-homomorphism lifts exactly when its Tate image is integral.
- In the standard self-dual plane O_F² with Gram matrix I₂, the hyperplane F·(1, ϖ^k) meets O_F² in a line of unit norm 1 + ϖ^(2k), of type zero.
- A rank-(n−1) lattice of type two is never W ∩ L for a self-dual L; rational Tate comparison alone cannot exclude it, so the integral statement is needed.

*Needs:* §0.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.22; GeometryOfNumbersAndQuadraticArithmetic 2.7.1 and 2.7.3.

### 1.3 Primitive horizontal cycles

Construct the primitive horizontal cycles. For s ≥ 0 let Z_s ⊂ N₂ be the quasi-canonical lifting cycle of level s: the image of the closed immersion Spf O_(F̆,s) → N₂ given by the level-s quasi-canonical lift of the framing object, where O_(F̆,s) is the ring of integers of the ring class field over F̆ of the order O_s = O_F₀ + ϖ^s·O_F (Z₀ ≅ Spf O_F̆ is the canonical lift). For 0 ≠ y ∈ V₂ with a = val h(y,y) ≥ 0, Z(y) = Σ_(i=0)^(⌊a/2⌋) Z_(a−2i) as Cartier divisors on N₂. For an integral nondegenerate lattice M of rank n−1 and type at most one, choose an orthogonal splitting M = M′ ⊥ ⟨y⟩ with M′ self-dual of rank n−2, which exists because t(M) ≤ 1 and gives val(y) = val(M); §0.8 identifies Z(M′) with N₂ and the divisor Z(M) of Z(M′) with Z(y). Define the primitive cycle Z(M)° ⊂ Z(M) as the component corresponding to Z_(val(M)), the unique component of Z(M) of maximal degree over Spf O_F̆, and prove that it does not depend on the splitting (KR11 Lemma 6.5, Definition 6.6 and Proposition 8.1, pp. 33–36; LZ §§4.1–4.2, (4.2.0.1), pp. 19–20). Prove that Z(L♭)_H = Σ Z(M)° over the integral overlattices M ⊃ L♭ of type at most one in L♭ ⊗ F; that Z(M)° has degree 1 over Spf O_F̆ when t(M) = 0 and degree q^s(1 + q⁻¹) when t(M) = 1 and s = val(M) > 0, with q = #k_F₀; and hence that deg Z(L♭)_H = vol(L♭)⁻¹·D_L♭((−q)⁻¹) = D_L♭(−q) for the normalized unramified polynomial of rank n−1 (LZ §§4.1–4.2, Theorem 4.2.1, pp. 19–20; Corollary 4.6.1, p. 23). The route reduces by §0.8 to N₂, decomposes Z(y) there by the lifting criterion along each quasi-canonical lift (Kudla–Rapoport's argument, written for F₀ = ℚ_p and carried out over F₀ as LZ §4.1 states it), characterizes Z(M)° as the component of maximal degree to remove the dependence on M′, uses §1.2 to show that every horizontal component of Z(L♭) is some Z(M)°, and reads the degree from the marked orbit of LubinTateFormalModulesAndQuasiCanonicalLifts §7.1.

Its API consists of the following facts:

- The primitive cycle Z(M)° is a closed formal subscheme of Z(M), isomorphic to Spf O_(F̆,val(M)), and Z(M) = Σ_(i=0)^(⌊val(M)/2⌋) Z(M′ ⊥ ⟨ϖ^(−i)y⟩)° as Cartier divisors on Z(M′) ≅ N₂, the i-th term corresponding to Z_(val(M)−2i); Z(M)° does not depend on the self-dual summand M′.
- The horizontal cycle is the sum of the primitive cycles of the integral overlattices of type at most one.
- The degree is 1 in type zero and q^s(1 + q⁻¹) = q^s + q^(s−1) in type one with s = val(M) > 0.
- Transport of a quasi-canonical lift through a marked isomorphism preserves its conductor and its primitive locus; degrees are converted with the base-field uniformizer.

**Checks.**

- A type-zero overlattice contributes 1.
- At s = 1 a type-one overlattice contributes q + 1, the size of the marked level-one orbit for an unramified extension.
- For n = 2 and L♭ = ⟨y⟩ with val h(y,y) = 2, the overlattices are ⟨y⟩ (type one, s = 2) and ⟨ϖ⁻¹y⟩ (type zero), with total degree q² + q + 1; and D_L♭(X) = (1 − X) + X² gives D_L♭(−q) = 1 + q + q².
- An overlattice of type three contributes no primitive horizontal component.
- The open complement of the lifting loci of the proper overlattices is not the primitive cycle: N₂ has a single closed point (for F₀ = ℚ_p its ring is W⟦t⟧, KR11 proof of Lemma 6.5, p. 33), through which Z₂ and Z₀ both pass, so for val h(y,y) = 2 the complement Z(y) ∖ Z(ϖ⁻¹y) = Z(y) ∖ Z₀ is empty, of degree 0, while Z(⟨y⟩)° = Z₂ has degree q² + q, which is 12 at q = 3.

*Needs:* §§0.8, 1.1–1.2; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.2, 6.4–6.5 and 7.1; GrossZagierAndArithmeticHeights §7.2; GeometryOfNumbersAndQuadraticArithmetic 2.7.3 and 3.2.4.

### 1.4 Low-rank vertical multiplicities

Prove the rank-three vertical computation. For n = 3 and an integral nondegenerate L♭ of rank two, put L♭_Λ = (L♭ ⊗ F) ∩ Λ for each type-three vertex lattice Λ ⊃ L♭, and mult_L♭(Λ) = #{M : L♭ ⊂ M ⊂ L♭_Λ}. Then ᴸZ(L♭)_V = Σ_Λ mult_L♭(Λ)·[O_(V(Λ))] in Gr²K₀ with vertical support, the same coefficients give the vertical cycle, and Int(L) = ∂Den(L) holds for n = 2 without the general induction; the intersections of primitive horizontal cycles with vertical curves are those of LZ Corollary 5.4.6 (LZ Theorem 5.4.1, Lemmas 5.4.3–5.4.4, Corollary 5.4.6, pp. 27–33). The route enumerates the finite interval of integral lattices in each saturated plane, splits off a unit vector by §0.8 to compare horizontal degrees with curve multiplicities, and computes the rank-two identity by the quasi-canonical lifting lengths of GrossZagierAndArithmeticHeights §7.2.

**Checks.**

- If L♭_Λ/L♭ has length one, the interval consists of its two endpoints and mult_L♭(Λ) = 2.
- If L♭_Λ = L♭ the multiplicity is 1.
- The multiplicity statement is an equality of classes in the graded group; it does not produce a canonical vertical subscheme.

*Needs:* §§0.8, 1.1, 1.3; GrossZagierAndArithmeticHeights §7.2.

### Examples

A type-one vertex lattice gives a point stratum and a type-three vertex lattice a curve. A type-zero primitive horizontal lattice has degree 1, and a type-one lattice of valuation 1 has degree q + 1. For n = 3 and L♭_Λ/L♭ of length one the curve V(Λ) enters the vertical class with multiplicity 2, while saturation L♭_Λ = L♭ gives multiplicity 1.

### Dependencies

Layer 0; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.22; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.2, 6.4–6.5 and 7.1; GrossZagierAndArithmeticHeights §7.2; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 3.2; SchemeKTheoryOperationsPartII §§0.6, 3.1 and 3.3, with gap:nonaffine-formal-filtration-product.

## Layer 2: Tate classes and local modularity

Compute the Frobenius eigenvalues on the unitary Deligne–Lusztig strata, prove that their Tate classes are spanned by closed strata, reduce vertical intersections numerically to Deligne–Lusztig curves, compute the curve intersection function and its Fourier transform, and prove local modularity of every K-class supported on a stratum through the cycle-class quotient and the Chern character. No global product theorem for the codimension filtration on the nonaffine Rapoport–Zink space is used in this layer.

### 2.1 Unitary Coxeter cohomology

Prove that on the open Coxeter stratum Y°_d of Y_d, the q²-Frobenius acts on H^*_c(Y°_d ⊗ k̄, ℚ_ℓ) with exactly the 2d+1 eigenvalues (−q)^m, 0 ≤ m ≤ 2d, the eigenvalue (−q)^m occurring only in degree ⌊m/2⌋ + d, and that every positive power of Frobenius acts semisimply on H^(2j)(Y°_d)(j); consequently its invariants there vanish for j ≥ 1 (LZ §5.3, Lemma 5.3.1, p. 25; Lusztig76 7.3, case ²A_(2n), with 6.1 and 1.18). The route specializes Lusztig's computation of the cohomology of Coxeter varieties to the unitary group of a (2d+1)-dimensional hermitian space and transfers it to H^(2j)(Y°_d)(j) by Poincaré duality; generic weight bounds do not give the eigenvalues or the semisimplicity.

**Checks.**

- d = 0: Y°₀ is a point with the single eigenvalue 1 in degree 0.
- d = 1: m = 0 and m = 1 give the eigenvalues 1 and −q on H¹_c, and m = 2 gives q² on H²_c; H⁰_c = 0 because Y°₁ is the affine complement of the q³+1 rational points, so H²(Y°₁)(1), dual to H⁰_c, has no Tate class.
- The eigenvalue −q, with multiplicity 2g = q² − q on H¹ of the Fermat curve Y₁, gives #Y₁(F_(q²)) = 1 + q² + q(q² − q) = q³ + 1, the count of §0.3; the eigenvalue +q would give 1 + 2q² − q³ instead.
- For 0 < 2j ≤ d the eigenvalues on H^(2j)(Y°_d)(j) are q^(2j) and −q^(2j−1); neither is a root of unity, which is why no power of Frobenius has invariants there.

*Needs:* §0.3; MotivesAndAlgebraicCycles §2.7; EtaleCohomologyFoundations §§0.7–0.8, F.2.5 and F.4.1–F.4.6.

### 2.2 Tate classes generated by strata

Prove that for 0 ≤ i ≤ d and every s ≥ 1, the space of Tate classes H^(2i)(Y_d ⊗ k̄, ℚ_ℓ(i))^(F^s=1) is spanned by the cycle classes of the irreducible components of the closed strata of dimension d−i, including Y_d itself for i = 0, and that the generalized 1-eigenspace of F^s equals its invariants (LZ Lemma 5.3.1 and Theorem 5.3.2, pp. 25–26). The open complement of the closed strata has no Tate classes in positive degree; its H⁰ is not discarded. The route inducts on the closed strata with the excision sequence, the Gysin isomorphism for the closed strata and §2.1.

**Checks.**

- i = 0: H⁰(Y_d)(0) is spanned by the fundamental class of Y_d.
- d = 1, i = 1: H²(Y₁)(1) is one-dimensional, spanned by the class of a point, a zero-dimensional stratum.
- The statement is specific to Y_d; for a general smooth projective variety over a finite field it is the Tate conjecture and is not asserted.
- The excision sequence is the scheme localization sequence of EtaleCohomologyFoundations §§0.7–0.8 and F.2.5: for U = 𝔸¹ ⊂ ℙ¹ over a finite field with Q elements and closed complement a rational point, H⁰(ℙ¹) → H⁰(point) is an isomorphism and H¹(ℙ¹) = 0, so H⁰_c(𝔸¹) = H¹_c(𝔸¹) = 0 and H²_c(𝔸¹) ≅ H²(ℙ¹) = ℚ_ℓ(−1), on which geometric Frobenius acts by Q.

*Needs:* §2.1; MotivesAndAlgebraicCycles §§2.4, 2.7; EtaleCohomologyFoundations §§0.7–0.8, F.2.5 and F.4.1–F.4.6.

### 2.3 Numerical reduction to curves

Prove that for a nondegenerate L♭ of rank n−1 the vertical class ᴸZ(L♭)_V, as far as its Euler pairings with special divisors Z(x) are concerned, is a ℚ-linear combination of Deligne–Lusztig curves V(Λ) of type three: there are finitely many type-three vertex lattices Λ_i and rationals m_i with χ(N_n, ᴸZ(L♭)_V ⊗ᴸ O_(Z(x))) = Σ_i m_i·χ(N_n, O_(V(Λ_i)) ⊗ᴸ O_(Z(x))) for every x ∈ V_n ∖ (L♭ ⊗ F). These are equalities of Euler characteristics; no equality of K-classes and no canonical effective vertical one-cycle is asserted (LZ Corollary 5.3.3, p. 26, as used in the proofs of Corollaries 6.2.2 and 6.3.3, pp. 36–37). The route decomposes the finite vertex support modulo overlaps by the closed-union decomposition, which writes the vertical class as a ℚ-combination of classes of finitely many curves C in the reduced locus (LZ Corollary 5.2.2, p. 24); each C lies in a stratum V(Λ) ≅ Y_d, its pairing with the Cartier divisor Z(x) is the degree of O(Z(x)) on C and so depends only on the ℓ-adic cycle class of C, since the cycle-class map is compatible with intersection products; and §2.2 with i = d−1 writes that Tate class as a ℚ-combination of classes of the one-dimensional closed strata.

**Checks.**

- For n = 3 the vertical class is already a combination of curves with the multiplicities of §1.4.
- A vertical class supported on points pairs to zero with every Z(x) whose support avoids those points, and the reduction keeps that value.
- Replacing this numerical equality by an equality with the vertical subscheme itself loses the higher Tor contribution of §1.1 and is not asserted.

*Needs:* §§1.1, 1.4, 2.2; SchemeAndStackFoundations §§5.3–5.4, 5.7; MotivesAndAlgebraicCycles §§2.4, 2.7; SchemeKTheoryOperationsPartII §§3.1 and 4.6.

### 2.4 Unramified curve intersection function

Define, for a type-three vertex lattice Λ, the function f_Λ(x) = χ(N_n, O_(V(Λ)) ⊗^L O_(Z(x))) for x ∈ V_n ∖ {0}, extended to x = 0 by the divisor-class convention. Prove that f_Λ = −q²(1+q)·1_Λ + Σ_Λ′ 1_Λ′, the sum over the type-one vertex lattices Λ′ ⊃ Λ, so that f_Λ equals 1 − q² on Λ, 1 on the vectors of integral norm in Λ^∨ ∖ Λ, and 0 elsewhere; and that its Fourier transform for the trace-hermitian self-dual measure is f̂_Λ = −f_Λ (LZ Lemma 6.2.1, pp. 34–36; Lemma 6.3.1 and Remark 6.3.2, pp. 36–37). The route computes the degree of O(Z(x)) on the Fermat curve and the incidence of the q³+1 rational points with Z(x), then transforms lattice indicators.

Its API consists of the following facts:

- The three value regions are Λ, the integral-norm vectors of Λ^∨ ∖ Λ, and the complement.
- The Fourier transform uses the trace pairing and its self-dual measure, with vol(Λ) = q^(−t(Λ)).
- If V(Λ) ⊂ Z(x), the Euler pairing is still the degree of the Cartier line bundle O(Z(x)) on V(Λ).
- Two locally constant extensions of f_Λ that agree off a proper hyperplane agree everywhere, since the hyperplane has empty interior.

**Checks.**

- On Λ the value is −q²(1+q) + (q³+1) = 1 − q², which is −8 at q = 3.
- On an integral-norm x ∈ Λ^∨ ∖ Λ, the residue x̄ spans an isotropic line, x lies in exactly one Λ′, and f_Λ(x) = 1; in the transform, x lies in exactly one Λ′^∨ and f̂_Λ(x) = −(1+q)/q + 1/q = −1.
- For x ∈ Λ^∨ with non-integral norm, x̄ is anisotropic, x̄^⊥ contains q+1 isotropic lines, and f̂_Λ(x) = −(1+q)/q + (q+1)/q = 0 = −f_Λ(x).

*Needs:* §§0.3–0.4, 1.4; SchemeKTheoryOperationsPartII §4.6; AnalyticNumberTheoryPartII §5.3g.

### 2.5 Geometric vertical Fourier identity

Prove that for a nondegenerate L♭ of rank n−1 the vertical intersection function Int_(L♭,V)(x) = χ(ᴸZ(L♭)_V · Z(x)), initially for x ∉ L♭ ⊗ F, extends to a Schwartz–Bruhat function on V_n whose self-dual Fourier transform is its negative; the horizontal function remains singular along L♭ ⊗ F (LZ Corollary 6.2.2, p. 36; Corollary 6.3.3, p. 37). The route applies §2.3 and §2.4 and the linearity of the Fourier transform.

**Checks.**

- For n = 2 and a unit-norm L♭ the vertical class vanishes and the identity is 0 = −0.
- The eigenvalue is −1 for the nonsplit unramified space; the split almost self-dual space of Layer 4 carries Weil index +1 and is not covered by this statement.
- The total function Int_L♭ has a logarithmic singularity along L♭ ⊗ F; only the vertical part is Schwartz.

*Needs:* §§2.3–2.4; AnalyticNumberTheoryPartII §5.3g.

### 2.6 Cycle-class quotient and corrected Chern character

Define, for a smooth proper stratum V(Λ), the cycle-class quotient K̄₀(V(Λ)) as the rational K-group modulo the kernel of the Chern character followed by the cycle-class map to ℓ-adic cohomology. For a Cartier divisor D use [O_D] = [O] − [O(−D)] and ch(O_D) = 1 − exp(−c₁(O(D))). Top-degree products are evaluated with this sign; the quotient is not numerical K-theory by definition (LZ Definitions 6.4.1 and 6.4.3, p. 38; Lemmas 6.4.4–6.4.7, pp. 38–41, with the Cartier sign of ch(O_D) as stated here).

Its API consists of the following facts:

- A rational supported K-class maps to its image in the cycle-class quotient.
- For c = c₁(O(D)), ch(O_D) = c − c²/2 + c³/6 − ⋯.
- Equal classes in the quotient have equal pairings with every cohomological degree functional.
- A ℚ-linear functional on supported K-theory descends to the quotient exactly when it kills the kernel of the cycle-class map.

**Checks.**

- For D = 0 the class [O_D] and its Chern character vanish.
- The degree-one term is +c and the degree-two term is −c²/2.
- The class of O(−D) has Chern character exp(−c), not exp(c); using exp(c) changes the sign of every odd-degree term: on ℙ² with H the class of a line, exp(−H) = 1 − H + H²/2 and exp(H) = 1 + H + H²/2, so ch(O_D) for a line D is H − H²/2, while the wrong model gives −H − H²/2.

*Needs:* §2.2; SchemeAndStackFoundations §§5.3–5.4, 5.7; MotivesAndAlgebraicCycles §§2.4, 2.7; SchemeKTheoryOperationsPartII §4.6.

### 2.7 Higher local modularity

Prove that for every odd-type vertex lattice Λ and every ℚ-linear functional ℓ on K̄₀(V(Λ)), the function x ↦ ℓ(K_(V(Λ))(x)), defined for x ≠ 0 by the class of O_(Z(x)) restricted to V(Λ), extends uniquely to a Schwartz–Bruhat function on V_n whose Fourier transform is γ_V times itself, with γ_V = −1 for the nonsplit unramified special Hom space. In particular the Euler functional gives the same extension and eigenvalue for Int_(V(Λ)), in every dimension of stratum (LZ Corollary 6.4.8, Theorem 6.4.9 and Corollary 6.4.10, p. 42). The route reduces ℓ to pairings with boundary strata through §2.2 and the perfect graded pairing, computes each top Chern function by lattice indicators retaining its factorial and sign, and uses Fourier linearity; Hirzebruch–Riemann–Roch on the smooth projective stratum V(Λ) (SchemeAndStackFoundations §5.8) writes the Euler functional as α ↦ deg(ch(α)·td(T_V(Λ))), which factors through the same quotient.

**Checks.**

- For a type-one stratum, a point P, the Euler pairing χ(O_P ⊗^L O_(Z(x))) is 1 − 1 = 0 when P ∈ Z(x) (Tor₀ and Tor₁ are both the residue field) and 0 otherwise, so the function is identically zero and its extension is trivially an eigenfunction.
- For a type-three stratum and ℓ the Euler functional, the statement is §2.4.
- The sign of ch(O_D) is fixed by the Cartier sequence 0 → O(−D) → O → O_D → 0, not by the Fourier eigenvalue: replacing exp(−c) by exp(c) changes the top Chern function on a stratum of odd dimension by the factor −1, and the negative of an eigenfunction has the same eigenvalue (at q = 3 the curve function with values −8 on Λ and transform 8 there becomes 8 with transform −8, still eigenvalue −1). The test of the sign is geometric: the degree-one coefficient of ch(O_D) for a line D on ℙ² is +H, the class of D.

*Needs:* §§2.4, 2.6; SchemeAndStackFoundations §5.8; SchemeKTheoryOperationsPartII §4.5; AnalyticNumberTheoryPartII §5.3g; MetaplecticAutomorphicForms §§2.1, 3.3b.

### Examples

For a type-three vertex lattice there are q³+1 type-one overlattices, and at x ∈ Λ the curve function is −q²(1+q) + (q³+1) = 1 − q², equal to −8 at q = 3; the next integral shell has value 1. The transform evaluates to q² − 1 on Λ and −1 on the integral shell, giving eigenvalue −1. The Cartier resolution gives 1 − exp(−c) = c − c²/2 + ⋯, fixing both signs before any top-degree projection.

### Dependencies

Layers 0–1; MotivesAndAlgebraicCycles §§2.4, 2.7; EtaleCohomologyFoundations §§0.7–0.8, F.2.5 and F.4.1–F.4.6; SchemeAndStackFoundations §§5.3–5.4, 5.7–5.8; SchemeKTheoryOperationsPartII §§3.1, 4.5 and 4.6; AnalyticNumberTheoryPartII §5.3g; MetaplecticAutomorphicForms §§2.1, 3.3b. Lusztig's computation (Lusztig76) is the source of §2.1.

## Layer 3: Unramified analytic side and the Kudla–Rapoport identity

Normalize the unramified density derivative and its Whittaker interpretation, define the analytic horizontal and vertical functions by the overlattice expansion, prove the horizontal identity, the regularity and restricted Fourier vanishing of the analytic vertical function, and close the identity Int(L) = ∂Den(L) by induction on the valuation, using the hermitian uncertainty principle of MetaplecticAutomorphicForms §3.3a on the normal line.

### 3.1 Unramified density and Whittaker normalization

Prove the normalization of the analytic side. For an integral nondegenerate lattice L of rank n in an unramified hermitian space, D_L(X) is the polynomial of GeometryOfNumbersAndQuadraticArithmetic 3.2.4 with D_L((−q)^(−k)) = Den(⟨1⟩_(n+k), L)/Den(⟨1⟩_(n+k), ⟨1⟩_n) for k ≥ 0, q = #k_F₀. For full-rank L in the nonsplit V_n the valuation val(L) is odd, so D_L(1) = 0 by the functional equation 3.2.7, and ∂Den(L) := −D′_L(1). The Schwartz input is a separate reference lattice: let Λ = ⟨1⟩_n be the self-dual lattice with Gram matrix the identity, in the split hermitian space Λ ⊗ F of dimension n, and φ₀ = 1_(Λ^n). With Li–Zhang's standard Siegel–Weil section of φ₀, the unramified additive character and self-dual measures, the local Whittaker function W_T(g, s, φ₀) at the Gram matrix T of an O_F-basis of L satisfies W_T(1, k, φ₀) = Den(⟨1⟩_(n+2k), L) for integers k ≥ 0, hence W_T(1, 0, φ₀) = Den(L)·∏_(i=1)^n (1 − (−q)^(−i)) and W′_T(1, 0, φ₀) = ∂Den(L)·∏_(i=1)^n (1 − (−q)^(−i))·log(q²) (LZ §3.2, (3.2.0.1)–(3.2.0.2) and Definition 3.2.1, p. 16; §3.3, (3.3.0.1)–(3.3.0.2), pp. 16–17). The lattice L enters only through T. The logarithm is that of the residue cardinality q² of F, while the interpolation variable uses q.

**Checks.**

- n = 1, val h(x,x) = 1: D(X) = 1 − X, ∂Den = 1 and W′_T(1, 0, φ₀) = (1 + q⁻¹)·2 log q; at q = 3 this is (4/3)·log 9 = (8/3)·log 3.
- L is not the Schwartz lattice: in rank one L = ⟨ϖ⟩ has val(det) = 1 and Λ = ⟨1⟩ has val(det) = 0, of different parity, so L ⊗ F (nonsplit) and Λ ⊗ F (split) are not isometric. With 1_(L^n) in place of φ₀ the space of the input represents T itself, so the value at s = 0 is a nonzero multiple of the representation density of T by L (equal to q + 1 for L = ⟨ϖ⟩: the units a mod ϖ^N with N(a) ≡ 1 mod ϖ^(N−1) number (q + 1)·q^N), not Den(L) = 0, and its derivative is not the normalization above.
- Writing log q in place of log(q²) halves the derivative and breaks the comparison of §13.5.
- For a lattice of even valuation, in a split space, D_L(1) ≠ 0 in general (D(X) = 1 − X + X² at valuation 2 has D(1) = 1), so the derivative is not the leading term there.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic 3.2.2, 3.2.4 and 3.2.7; MetaplecticAutomorphicForms §§3.3b, 6.2; AnalyticNumberTheoryPartII §5.3g.

### 3.2 Unramified analytic horizontal and vertical functions

Define the analytic functions. For an integral nondegenerate L♭ ⊂ V_n of rank n−1 and x ∉ L♭ ⊗ F, put ∂Den_L♭(x) = ∂Den(L♭ + O_F·x) = Σ_M m(t(M))·1_M(x), the sum over integral full-rank lattices M ⊃ L♭, with m(0) = 0, m(1) = 1 and m(a) = ∏_(i=1)^(a−1) (1 − (−q)^i) for a ≥ 2, the Cho–Yamauchi derivative weight; the sum is finite at each such x. Let ∂Den_(L♭,H) retain exactly the M with t(M ∩ (L♭ ⊗ F)) ≤ 1 and ∂Den_(L♭,V) = ∂Den_L♭ − ∂Den_(L♭,H). Geometrically, Int_L♭(x) = Int(L♭ + O_F·x), Int_(L♭,H)(x) = χ(N_n, O_(Z(L♭)_H) ⊗^L O_(Z(x))) for the full horizontal sum of §1.3, and Int_(L♭,V) = Int_L♭ − Int_(L♭,H) (LZ §3.5 and Theorem 3.5.1, p. 17; Definitions 6.1.1–6.1.4, pp. 33–34; Definitions 7.3.1–7.3.3, p. 45, with the weight m(0) = 0 of GeometryOfNumbersAndQuadraticArithmetic 3.2.5).

Its API consists of the following facts:

- The initial domain of all four functions excludes the hyperplane L♭ ⊗ F.
- Int_(L♭,H) agrees with ∂Den_(L♭,H) by §3.3.
- The vertical functions are the totals minus the horizontal functions.
- Equal embedded lattices L♭ give equal total, horizontal and vertical functions on the common complement; a basis of L♭ is not part of the datum.

**Checks.**

- The weights are m(0) = 0, m(1) = 1, m(2) = 1 + q and m(3) = (1 + q)(1 − q²); in the nonsplit full-rank space every contributing type is odd and positive.
- No value on the excluded hyperplane is assigned by substitution into the overlattice sum, which diverges there.
- For n = 1 (L♭ = 0) and val h(x,x) = a odd, the total is (a+1)/2 when a ≥ 1, from the (a+1)/2 integral lattices ϖ^(−j)O_F·x, 0 ≤ j ≤ (a−1)/2, each of type one; when a < 0 no integral lattice contains x and the total is 0, not (a+1)/2 (at a = −3 the latter would be −1), as in §0.9.

*Needs:* §§1.3, 3.1; GeometryOfNumbersAndQuadraticArithmetic 3.2.5–3.2.6.

### 3.3 Unramified horizontal identity

Prove that Int_(L♭,H)(x) = ∂Den_(L♭,H)(x) for x ∉ L♭ ⊗ F. Horizontal terms on both sides are indexed by the integral overlattices of L♭ of type at most one, and each primitive horizontal cycle of §1.3 contributes exactly the differentiated density weight of the full-rank lattices whose hyperplane intersection it is (LZ Theorem 6.1.3, p. 34). The route matches each primitive component with its weight through §1.2 and the rank-two lengths of §1.4.

**Checks.**

- For n = 2, L♭ = ⟨y⟩ with h(y,y) a unit and x ⊥ y with val h(x,x) = a odd and a ≥ 1, both sides equal (a+1)/2; for a < 0 both sides are 0.
- Only hyperplane intersections of type at most one enter; an M with t(M ∩ (L♭ ⊗ F)) = 3 is vertical on the analytic side and has no primitive horizontal partner.
- Both sides are additive over the overlattice sum, so the identity holds term by term in M ∩ (L♭ ⊗ F).

*Needs:* §§1.2–1.4, 3.2.

### 3.4 Analytic regularity and restricted Fourier vanishing

Prove that ∂Den_(L♭,V) extends uniquely to a Schwartz–Bruhat function on V_n, while the total and horizontal functions can have logarithmic singularities along L♭ ⊗ F, and that for x ⊥ L♭ with val h(x,x) < 0 the Fourier transform of ∂Den_(L♭,V) vanishes at x. Difference formulas along the normal line follow from the overlattice expansion. The vanishing is asserted only for normal vectors of negative valuation, not for every vector of negative norm (LZ Proposition 7.3.4, pp. 45–48; Lemmas 7.3.5–7.3.6 and Corollary 7.3.7, pp. 48–51; Theorem 7.4.1, pp. 51–55). The route sums the lattice-indicator transforms and counts the normal-line differences.

**Checks.**

- 1̂_M = vol(M)·1_(M^∨) with vol(M) = q^(−val(M)) for the self-dual measure, so each term of the expansion transforms to a dual-lattice indicator.
- For n = 2 and L♭ of unit norm the vertical function vanishes identically, and so does its transform.
- The total function ∂Den_L♭ is not Schwartz: on the normal line it grows like a multiple of val h(x,x), the logarithmic singularity.

*Needs:* §3.2; AnalyticNumberTheoryPartII §5.3g.

### 3.5 Difference induction and the unramified Kudla–Rapoport identity

Prove that for every full-rank O_F-lattice L in the nonsplit unramified space V_n, Int(L) = ∂Den(L) (LZ Theorem 3.4.1, p. 17; Theorem 8.2.1 and proof, pp. 58–59). For n ≥ 2 the route inducts on val(L♭) for L = L♭ + O_F·x with L♭ integral of rank n−1 and nondegenerate span. Put Φ_L♭ = Int_(L♭,V) − ∂Den_(L♭,V), a Schwartz function on V_n by §§2.5 and 3.4, equal by §3.3 to Int(L♭ + O_F·x) − ∂Den(L♭ + O_F·x) off L♭ ⊗ F (horizontal and vertical parts are not transported separately). Let W = (L♭ ⊗ F)^⊥, the normal line, and M = L♭ ⊥ ⟨u⟩ with ⟨u⟩ the vectors of W of valuation at least the largest invariant of L♭ (LZ (7.1.0.3), p. 43); val(u) ≥ 1, since val(u) = 0 would force L♭ self-dual and val(M) = 0, while full-rank lattices of the nonsplit space have odd valuation. For x ∉ M ∪ (L♭ ⊗ F) with L♭ + O_F·x integral, the sum of the first n−1 invariants of L♭ + O_F·x is smaller than val(L♭) (LZ Lemma 8.2.2, pp. 58–59), so L♭ + O_F·x = L′♭ + O_F·x′ with val(L′♭) < val(L♭) and Φ_L♭(x) = Φ_L′♭(x′) = 0 by induction; for nonintegral L♭ + O_F·x both sides vanish. Since V_n ∖ M is open, L♭ ⊗ F is nowhere dense and Φ_L♭ is locally constant, Φ_L♭ is supported in M and, being L♭-invariant, Φ_L♭ = 1_L♭ ⊗ φ⊥ with φ⊥ a Schwartz function on W supported in ⟨u⟩, and Φ̂_L♭ = vol(L♭)·1_(L♭^∨) ⊗ φ̂⊥. By §2.5 the transform of Int_(L♭,V) is −Int_(L♭,V), which vanishes at vectors of negative valuation because Z(x) is empty there; by §3.4 the transform of ∂Den_(L♭,V) vanishes at normal vectors of negative valuation; so φ̂⊥ vanishes at every w ∈ W of negative valuation. The hermitian uncertainty principle is applied to φ⊥ on the rank-one space W, where supp φ⊥ ⊂ ⟨u⟩ ⊂ {val > 0} and supp φ̂⊥ ⊂ {val ≥ 0}; so φ⊥ = 0 and Φ_L♭ = 0. Equivalently, φ̂⊥ is invariant under the dual line ⟨u^∨⟩, u^∨ = ϖ^(−val(u))·u of valuation −val(u) < 0, and w + u^∨ has negative valuation for every w ∈ W of valuation ≥ 0. The uncertainty principle is not applied to Φ_L♭ on V_n. The base cases are §0.9, §0.8 and §1.4.

**Checks.**

- n = 1, val h(x,x) = 3: Int = 2 = −D′(1) for D(X) = 1 − X + X² − X³.
- n = 2, L = ⟨u⟩ ⊥ ⟨x⟩ with h(u,u) = 1: both sides reduce by §0.8 to the rank-one value.
- The uncertainty principle needs strict positivity on one side: a function with both supports in {val h(x,x) ≥ 0}, such as the indicator of a self-dual lattice, is a nonzero eigenfunction and is not excluded by it.
- The two support conditions are available only on the normal line. On V_n the transform of 1_L♭ ⊗ φ⊥ is vol(L♭)·1_(L♭^∨) ⊗ φ̂⊥. If L♭ has an orthogonal basis vector e₁ of norm ϖ^(a₁) with a₁ ≥ 1, then y = ϖ^(−a₁)e₁ ∈ L♭^∨ has norm ϖ^(−a₁), of valuation −a₁, and y + w has valuation −a₁ for every w ∈ W of valuation ≥ 0, so the transform is supported in {val ≥ 0} only if φ̂⊥ already vanishes there, which is the conclusion. If L♭ is self-dual and nonzero, M contains vectors of L♭ of valuation 0, where Φ_L♭ takes the value φ⊥(0), so the confinement to M does not give the strict condition {val > 0} on V_n. On W both conditions hold.
- Rank two, L♭ = ⟨e⟩ with h(e,e) = ϖ: a full-rank lattice of the nonsplit V₂ has odd valuation, so val(u) = 2 rather than 1 and M has invariants (1, 2); u^∨ = ϖ⁻²u has valuation −4 + 2 = −2, and for w = c·u of valuation 2v(c) + 2 ≥ 0, that is v(c) ≥ −1, the vector w + u^∨ = (c + ϖ⁻²)·u has valuation −2, so φ̂⊥(w) = φ̂⊥(w + u^∨) = 0. A support bound val(u) ≥ 0 in place of val(u) ≥ 1 would allow val(u^∨) = 0 and the translation argument would fail.

*Needs:* §§0.8–0.9, 1.4, 2.5, 3.3–3.4; MetaplecticAutomorphicForms §3.3a.

### Examples

For D(X) = 1 − X + X² − X³, D(1) = 0 and −D′(1) = 2; the Li–Zhang Whittaker derivative W′_T(1, 0, φ₀) with φ₀ = 1_⟨1⟩ is then 2·(1 + q⁻¹)·log(q²) in rank one, T = (ϖ³) coming from L. A support condition with val h(x,x) ≥ 0 on both a function and its transform is weaker than the strict condition of the uncertainty principle and cannot replace it.

### Dependencies

Layers 0–2; GeometryOfNumbersAndQuadraticArithmetic §3.2; MetaplecticAutomorphicForms §§3.3a, 3.3b, 6.2; AnalyticNumberTheoryPartII §5.3g.

## Layer 4: Almost self-dual comparison

Define the special divisors of the almost self-dual space N_n¹ and the auxiliary cycles pulled back from N_(n+1), prove the integral structure of the auxiliary isogeny space through Li–Rapoport–Zhang's theorem, compare the divisors through the exceptional components, and derive both local density identities, including the correction term −Den(L), the factor q+1, and the conversion to Li–Liu's normalization.

### 4.1 Original and auxiliary almost self-dual cycles

Construct the almost self-dual cycles. On N_n¹ (PELModuliPartII §2.1), for 0 ≠ x in the split space W_n, let Y(x) be the locus where x lifts, and Y(L) for a lattice. Embed W_n as x₀^⊥ in the nonsplit V_(n+1) with h(x₀,x₀) = ϖ, and put Z♭(x) = Z(x)|_(Z(x₀)) on N_(n+1); the divisor Z(x₀) is that of PELModuliPartII §2.4, through which the second projection of the auxiliary isogeny space factors, and it is the cycle Z(O_F·x₀) of §0.2. For a full-rank lattice L ⊂ W_n with basis x₁, …, x_n define Int_Y(L) = χ(N_n¹, O_(Y(x₁)) ⊗^L ⋯ ⊗^L O_(Y(x_n))) and Int_aux(L) = χ(Z(x₀), O_(Z♭(x₁)) ⊗^L ⋯ ⊗^L O_(Z♭(x_n)))/(q+1). These are different numbers (LZ §§10.1–10.3, pp. 63–66; the polynomial D_Λ is LZ Definition 9.1.4 and (9.1.4.2), p. 63). The route applies the Hom-lifting construction of §0.2 to N_n¹ and to N_(n+1).

Its API consists of the following facts:

- Int_Y is an unnormalized Euler characteristic on N_n¹.
- Int_aux is the Euler characteristic on Z(x₀) divided by q+1.
- The relevant density is D_Λ(X, L) = D(X, L ⊥ ⟨ϖ⟩), the unramified polynomial in rank n+1.
- Changing an O_F-basis preserves the derived Y-class, Int_Y and Int_aux.

**Checks.**

- In W₁ the norm valuations are even, as in a split space.
- In rank one, val h(x,x) = 0 gives Y(x) = ∅ and Int_Y = 0, while val h(x,x) = 2 gives Int_Y = 1.
- (q+1)·Int_aux is an integer, an Euler characteristic; Int_aux itself need not be.

*Needs:* §§0.2, 0.6–0.7; PELModuliPartII §§2.1–2.4; AbelianSchemesAndArithmeticModuli §A4.CR.7.2.

### 4.2 Almost self-dual comparison model

Prove the integral structure of the auxiliary isogeny space Ñ of PELModuliPartII §2.4, with projections π₁: Ñ → N_n¹ and π₂: Ñ → Z(x₀) ⊂ N_(n+1): Ñ is regular of dimension n; π₁ is finite flat of degree q+1, étale away from the closed balloon locus and totally ramified along it, where the closed balloon locus is the reduced closed subscheme of the special fibre of N_n¹ that is the disjoint union of the strata V(Λ) ≅ ℙ^(n−1) over the type-zero vertex lattices Λ (LRZ Definition 14.2.2, p. 57), and a balloon stratum is one of these V(Λ); π₂ is proper and an isomorphism away from the exceptional locus; the exceptional locus is a reduced Cartier divisor, a disjoint union of components P_Λ ≅ ℙ^(n−1) indexed by the type-zero vertex lattices, each the reduced inverse image of a balloon stratum, with normal bundle O(−1); and the n-fold derived self-intersection of one component is (−1)^(n−1) while mixed intersections of distinct components vanish (LRZ Theorem 14.6.2, pp. 60–61; Corollary 16.1.5, p. 69; §16.4, Proposition 16.4.1, pp. 70–71; LZ Conjecture 10.4.1, p. 67). The route compares the signatures, polarization kernels, quasi-isogenies and lattice pairs of the two moduli problems with the lattice-pair model of LRZ §14 and applies its finite-flatness theorem; no blow-up ideal and no unreduced inverse-image identity is asserted.

Its API consists of the following facts:

- The moduli comparison preserves both projections and the special Hom labels.
- π₁ is finite flat of degree q+1.
- The exceptional components are reduced, isomorphic to ℙ^(n−1), with normal bundle O(−1).
- On corresponding special-cycle supports the pullback of a cycle complex along a projection is the complex of the transported label; projection degrees are applied only under the stated support hypotheses.

**Checks.**

- For a single exceptional component E ≅ ℙ^(n−1) with normal bundle O(−1), χ(O_E^(⊗ᴸn)) = ∫ c₁(O(−1))^(n−1) = (−1)^(n−1); for n = 2 this is −1.
- For disjoint components the mixed n-fold intersection is 0.
- For n = 2 the scheme-theoretic inverse image π₁⁻¹ of a balloon line is a ℙ¹ of multiplicity q+1, so the reduced structure is necessary in the exceptional statement.

*Needs:* §4.1; PELModuliPartII §§2.4 and 2.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; SchemeKTheoryOperationsPartII §4.7.

### 4.3 Auxiliary almost self-dual identity

Prove that for every full-rank L ⊂ W_n, (q+1)·Int_aux(L) = ∂Den_Λ(L), with ∂Den_Λ = −D′_Λ(1) and D_Λ(X, L) = D(X, L ⊥ ⟨ϖ⟩). This is the pulled-back identity and has no −Den(L) term (LZ Theorem 10.3.1, p. 66, with (9.1.4.2), p. 63). The route identifies the Euler characteristic on Z(x₀) with Int(L ⊥ ⟨x₀⟩) on N_(n+1) and applies §3.5 in rank n+1.

**Checks.**

- Rank one, val h(x,x) = 2: L ⊥ ⟨ϖ⟩ has the two integral overlattices L ⊥ ⟨ϖ⟩ (type two) and ⟨ϖ⁻¹x⟩ ⊥ ⟨ϖ⟩ (type one, length one), so D_Λ(X) = (1 − X)(1 + qX) + X²(1 − X) and ∂Den_Λ = (1 + q) + 1 = q + 2.
- Rank one, val h(x,x) = 0: L ⊥ ⟨ϖ⟩ is a vertex lattice of type one with no proper integral overlattice, D_Λ(X) = 1 − X and ∂Den_Λ = 1.
- Int_aux at valuation 2 is (q+2)/(q+1), not an integer.
- Nonintegral L: in rank one with val h(x,x) = −2, no integral lattice contains L ⊥ ⟨ϖ⟩, so D_Λ = 0 and ∂Den_Λ = 0, while Z(x) is empty on N_2, so Z♭(x) = ∅ and Int_aux = 0; the identity reads 0 = 0, and the integrality hypothesis is not needed.

*Needs:* §§3.5, 4.1.

### 4.4 Pullback of Y-divisors

Prove that on Ñ, π₁*Y(x) = π₂*Z♭(x) − Exc(x) as Cartier divisors, where Exc(x) is the sum of the exceptional components P_Λ prescribed by the integrality of x at the corresponding type-zero vertex lattices, and that the cancellation diagram of §0.8 is compatible with these projections; the exceptional term is kept when n Cartier classes are multiplied (LZ Lemma 10.4.2 and Theorem 10.4.3, pp. 67–70). The route uses §4.2 for the geometry and the Grothendieck–Messing lifting ideals, comparing away from and then along each exceptional component.

**Checks.**

- If x is integral at no type-zero vertex lattice, Exc(x) = 0 and the two pullbacks agree.
- The sign of Exc(x) is negative: the Y-divisor is the smaller one on the comparison model.
- Omitting Exc(x) changes the n-fold product by the self-intersections (−1)^(n−1) of §4.2.

*Needs:* §§0.8, 4.2; SchemeKTheoryOperationsPartII §3.4; AbelianSchemesAndArithmeticModuli §A4.CR.7.2.

### 4.5 Almost self-dual Y identity

Prove that for every full-rank L ⊂ W_n, (q+1)·Int_Y(L) = ∂Den_Λ(L) − Den(L). In rank one with a = val h(x,x) even and nonnegative, Int_Y = a/2, Den(L) = 1 and ∂Den_Λ = 1 + (q+1)a/2 (LZ Theorem 10.5.1, p. 70; Example 10.5.3, p. 71; Remark 10.5.4, p. 72). The factor q+1 and the subtracted term are forced by the comparison map and the exceptional divisors. The route expands the product of the Cartier classes of §4.4, applies the finite flat projection formula for π₁ and the exceptional self-intersections, and identifies the remaining term with Den(L).

**Checks.**

- a = 0: (Int_Y, Den, ∂Den_Λ) = (0, 1, 1), and (q+1)·0 = 1 − 1.
- a = 2: (Int_Y, Den, ∂Den_Λ) = (1, 1, q+2), and q+1 = (q+2) − 1.
- Without the −Den(L) term the identity would give Int_Y = (q+2)/(q+1) at a = 2, which is the auxiliary number of §4.3, not the Euler characteristic.

*Needs:* §§4.3–4.4; SchemeKTheoryOperationsPartII §4.7.

### 4.6 Li–Liu normalization of the local identities

Prove the conversion to Li–Liu's local normalization. For n = 2r, a nonsingular T at an inert place v and q = #k_(F₀,v) (the residue cardinality of the place of the totally real field below the place of the CM field), put b_(n,v)(0) = ∏_(i=1)^n (1 − (−q)^(−i))⁻¹. In Li–Liu's Whittaker parameter the self-dual Euler intersection equals b_(n,v)(0)·W′_T(φ₀)/log q, and the almost self-dual intersection equals b_(n,v)(0)/log q times ((q^(2r) − 1)/(q+1)·W′_T(φ₁) − (log q)/(q+1)·W_T(φ₀)), for the lattice-indicator sections φ₀ = 1_(Λ₀^n) and φ₁ = 1_(Λ₁^n) of the reference lattices Λ₀ = ⟨1⟩_n (self-dual, §3.1) and Λ₁ = ⟨1⟩_(n−1) ⊥ ⟨ϖ⟩ (almost self-dual), while T is the Gram matrix of the lattice whose intersection number is computed (LL1 Notation 2.1 (F1), (F4), p. 10; §8 local identity, pp. 39–40; §9 local identity, pp. 44–45; LZ §3.3, p. 16, §9.2, p. 63, Remarks 3.4.2, p. 17, and 10.5.4, p. 72). The route compares Li–Liu's normalization of the local density with Li–Zhang's standard section before transporting derivatives; the correction term of §4.5 is kept.

**Checks.**

- The derivative in Li–Zhang's parameter carries log q_u = 2 log q_v for the place u of F above v; identifying the two logarithms loses a factor 2.
- At r = 1 the almost self-dual coefficient (q² − 1)/(q+1) equals q − 1.
- The −W_T(φ₀)/(q+1) term is the image of −Den(L)/(q+1) from §4.5 and is nonzero whenever Den(L) ≠ 0.

*Needs:* §§3.1, 3.5, 4.5; MetaplecticAutomorphicForms §3.3b.

### Examples

For the split rank-one Y case, a = 0 gives (Int_Y, Den, ∂Den_Λ) = (0, 1, 1) and a = 2 gives (1, 1, q+2), so the identity reads q+1 = (q+2) − 1. The auxiliary intersection at a = 2 is (q+2)/(q+1). In exceptional dimension n−1 = 1 the two-fold self-intersection is −1, fixing the sign of the correction.

### Dependencies

Layers 0 and 3; PELModuliPartII §§2.1–2.5; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20; SchemeKTheoryOperationsPartII §§3.4 and 4.7; MetaplecticAutomorphicForms §3.3b.

## Layer 5: Exotic smooth geometry

For a ramified quadratic extension of odd residue characteristic and even rank n = 2r, work on the exotic smooth Rapoport–Zink space of PELModuliPartII §§3.3–3.4 with its u⁻²-normalized special Hom form and trace duality. Define special cycles, the modular line and the zero-label complex, prove Cartierness and linear invariance, compute the Tate classes of the strata and the degree of the modular line on curves, and compute the rank-two intersection numbers, the cancellation law and the symmetry between the two connected components.

### 5.1 Exotic smooth special cycles

Construct the exotic special cycles. Let F/F₀ be ramified with u ∈ F, ū = −u, p odd and n = 2r ≥ 2. On the exotic space N^exo of PELModuliPartII §3.3 (polarization kernel X[ι(u)], signature (n−1,1), wedge and spin conditions), smooth of relative dimension n−1 with two connected components (PELModuliPartII §3.7), the special Hom space V carries h(x,y) = u⁻²·λ₀⁻¹ ∘ y^∨ ∘ λ_X ∘ x (PELModuliPartII §3.6). For x ≠ 0 let N(x) be the locus where x lifts, and N(L) for a lattice (LL2 §2.1, Definitions 2.5–2.8, pp. 9–11). Lattices of rank n−1 in the functions below are nondegenerate. For an O_F-lattice Λ ⊂ V whose span Λ ⊗ F is nondegenerate, define its trace dual Λ^∨ = {x ∈ Λ ⊗ F : h(x, Λ) ⊂ u⁻¹O_F}, the dual inside its own span for the pairing Tr_(F/F₀) h; for Λ of full rank this is {x ∈ V : h(x, Λ) ⊂ u⁻¹O_F}. Λ is integral when Λ ⊂ Λ^∨, a vertex lattice when moreover uΛ^∨ ⊂ Λ, and self-dual when Λ = Λ^∨; for integral Λ of rank m its fundamental invariants a₁ ≤ ⋯ ≤ a_m are the exponents with Λ^∨/Λ ≅ ⊕ O_F/u^(a_i), which exist by the structure theorem for finitely generated torsion modules over a principal ideal domain (Mathlib `Module.equiv_directSum_of_isTorsion`) and are unique because #{i : a_i > k} is the k_F-dimension of u^k(Λ^∨/Λ)/u^(k+1)(Λ^∨/Λ); put val(Λ) = Σ a_i and t(Λ) = #{i : a_i > 0} (LL2 Definition 2.10, p. 12). This trace dual is not the O_F-dual of GeometryOfNumbersAndQuadraticArithmetic §2.7.2, and integrality here allows h(Λ, Λ) = u⁻¹O_F; integrality, vertex lattices, invariants, val and t in Layers 5–6 always refer to it. The route applies the homomorphism-lifting criterion of AbelianSchemesAndArithmeticModuli §A4.CR.7.2 on N^exo.

Its API consists of the following facts:

- The scaled form is integral-valued on the special homomorphisms that lift.
- Integral and vertex lattices, fundamental invariants, val and t in the exotic setting are those of the trace dual Λ^∨ = {x ∈ Λ ⊗ F : h(x, Λ) ⊂ u⁻¹O_F}, taken in the span of Λ; an integral vector x, one with h(x, x) ∈ O_F₀, spans an integral line, since h(x, x) ∈ F₀ ∩ u⁻¹O_F = O_F₀.
- N(x) represents the extension of the special quasi-homomorphism x.
- Both connected components of N^exo belong to the model. For x ≠ 0, N(x) is nonempty exactly when h(x,x) ∈ O_F₀ (LL2 §2.1, footnote 9, p. 11); then N(x)_red is the union of the open strata of the vertex lattices containing x (LL2 Corollary 2.30, p. 23), the closed stratum of such a lattice meets both connected components (LL2 Proposition 2.28(2), p. 23, PELModuliPartII §3.7), and so N(x) meets both. For h(x,x) ∉ O_F₀, N(x) = ∅ and meets neither.
- The lifting subfunctor commutes with base change of test schemes and depends only on the O_F-span of its labels.

**Checks.**

- Odd n is outside the exotic smooth family; the trace-self-dual hyperbolic model exists only in even rank.
- Omitting the factor u⁻² shifts every u-adic norm valuation by 2 and changes which lattices are integral.
- For n = 2 and the minimal integral invariants (1,1), the total intersection number is 2, one on each component (§5.5 with b₁ = b₂ = 0).
- Nonintegral norm: for e with h(e,e) = 1 and x = u⁻¹e, h(x,x) = u⁻¹·ū⁻¹ = −u⁻², of F₀-valuation −1 since −u² = N(u) is a uniformizer of F₀; hence N(x) = ∅ and meets zero components, while N(e) is nonempty and meets both.
- The trace dual is not the O_F-dual: the plane Λ = O_F·e + O_F·f with h(e,e) = h(f,f) = 0 and h(e,f) = u⁻¹, so h(f,e) = ū⁻¹ = −u⁻¹, has h(ae + bf, e) = −bu⁻¹ and h(ae + bf, f) = au⁻¹, which lie in u⁻¹O_F exactly when a, b ∈ O_F; so Λ^∨ = Λ, Λ is integral and self-dual with invariants (0, 0), although h(Λ, Λ) = u⁻¹O_F ⊄ O_F makes it nonintegral for the O_F-dual {x : h(x, Λ) ⊂ O_F}, which here is uΛ. The unit-norm line ⟨e⟩, h(e,e) = 1, has Λ^∨ = u⁻¹⟨e⟩ and invariant 1, the invariant 2b + 1 of §5.5 at b = 0.
- The dual of a lattice of lower rank is taken in its span: for n = 2 and Λ = O_F·e with h(e,e) = 1 and f ⊥ e, the ambient set {x ∈ V : h(x, Λ) ⊂ u⁻¹O_F} contains the whole line F·f, so its quotient by Λ is not of finite length and has no fundamental invariants, whereas the dual in Λ ⊗ F = F·e is u⁻¹O_F·e, with Λ^∨/Λ ≅ O_F/u and invariant 1, as in the previous Check and in LL2 Lemma 2.12(3) (a block β·u^(2b) with b = 0 has invariant 2b + 1 = 1).

*Needs:* PELModuliPartII §§3.3–3.7; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; Mathlib `Module.equiv_directSum_of_isTorsion`.

### 5.2 Exotic modular line and zero-label complex

Define the modular line and the special-cycle complexes. Let L_X ⊂ Lie(X) be the rank-one locally direct summand of LL2 Lemma 2.37, the kernel of the map Lie(X) → εD(X)/F_X^⊥ induced by ε = u ⊗ 1 + 1 ⊗ u, on which O_F acts through the conjugate of the structural embedding, and put ω = L_X⁻¹. For x ≠ 0 let C(x) = [I_(N(x)) → O_N] in degrees −1, 0, and put C(0) = [ω → O_N] with zero differential (LL2 §2.4, (2.14), p. 24; Lemmas 2.36–2.37, Definition 2.38, pp. 25–26; Lemma 2.41, p. 26). The zero label is a complex with zero differential, not the structure sheaf of the whole space. The route identifies L_X through the wedge and spin conditions and the Grothendieck–Messing obstruction for the universal homomorphism.

Its API consists of the following facts:

- L_X is a rank-one locally direct summand of Lie(X) on which O_F acts through the conjugate embedding.
- For x ≠ 0, C(x) is a resolution of O_(N(x)).
- C(0) has terms ω and O_N and zero differential.
- Pullback of the two-term complexes pulls back their ideal and line terms and differentials; the K-class of C(0) is [O_N] − [ω].

**Checks.**

- The K-class of the zero-label complex is [O_N] − [ω].
- Setting C(0) = O_N gives the class [O_N] and, for every x with N(x) ≠ ∅, the wrong value of the tuple (x, 0) in the linear-invariance formula of §5.3; for N(x) = ∅ both readings give 0.
- On a connected component C ≅ ℙ¹ of a type-four stratum (§5.4) deg ω|_C = q − 1, so χ(C, [O] − [ω]) = 1 − q.

*Needs:* §5.1; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20.

### 5.3 Exotic Cartierness and linear invariance

Prove that each nonzero exotic special cycle N(x) is an effective Cartier divisor on N^exo or empty, and that for tuples (x₁, …, x_m), m ≤ n, generating the same O_F-module the homology sheaves of C(x₁) ⊗ ⋯ ⊗ C(x_m) agree, as in Howard's linear invariance theorem; hence the derived class and its Euler characteristic depend only on the module, and the zero complex C(0) is required in elementary row operations that produce a zero label (LL2 Proposition 2.33, Corollaries 2.34–2.35, pp. 24–25; Lemmas 2.39–2.40, p. 26). The route compares the obstruction lines of the universal homomorphisms and runs Howard's argument on the compatible ideal maps, as LL2 does (LL2, proof of Proposition 2.33, p. 26): Howard proves the isomorphism of homology sheaves for any number of labels on the Krämer model over a quadratic extension of ℚ_p (Howard19 Theorem B, p. 2, which is his Theorem 5.1, with its K-theoretic form Corollary C, p. 2; Corollary D, p. 3, is the Euler characteristic of a basis), and its proof is carried out here on the exotic space over F₀; non-verticality of N(x) is proved separately.

**Checks.**

- For x and ax with a ∈ O_F^× the complexes C(x) and C(ax) are isomorphic.
- The tuples (x, x) and (x, 0) generate the same module. The first gives [O_(N(x))] − [O_(N(x))(−N(x))]; with the zero label read as O_N the second would give [O_(N(x))]. The two differ by [O_(N(x))(−N(x))], which is nonzero exactly when N(x) ≠ ∅. At n = 2 with h(e,e) = 1 the cycle D = N(e) is a nonempty Cartier divisor (§5.1). At a generic point ζ of D the local ring O_(N,ζ) is a discrete valuation ring and the invertible O_D-module O_D(−D) has stalk of length equal to the multiplicity of D at ζ, at least 1. This length is additive on K₀^D, so [O_D(−D)] ≠ 0 there and linear invariance needs C(0) = [ω → O_N]. Empty case (negative control): for x = u⁻¹e, h(x,x) = −u⁻² has F₀-valuation −1, so N(x) = ∅ (§5.1). Then C(x) is acyclic, O_(N(x)) = 0, both tensor products have class 0 and their difference is 0; this case does not test the zero-label complex.
- Linear invariance is asserted for at most n labels, the range of LL2's statement (Howard19 Theorem B is stated for every number r ≥ 0 of labels, on the Krämer model); nothing is asserted beyond it, but more labels do not prevent an Euler characteristic. Repeating one label x of an n-tuple whose derived intersection K has proper zero-dimensional support and Euler characteristic ℓ tensors K with C(x) = [O(−N(x)) → O_N]; on that support the line bundle O(−N(x)) is trivial, so K ⊗ O(−N(x)) and K both have Euler characteristic ℓ, and the Euler characteristic of the n+1 labels exists and equals ℓ − ℓ = 0.

*Needs:* §5.2; SchemeKTheoryOperationsPartII §1.7; AbelianSchemesAndArithmeticModuli §A4.CR.7.2.

### 5.4 Exotic Tate classes and the modular line degree

Prove that for every d ≥ 0 the d-dimensional Tate homology classes on an exotic Bruhat–Tits stratum are spanned by the classes of the contained strata of type 2d+2, including the whole stratum in its top dimension; that on the open part of a stratum of type t the compactly supported cohomology carries the squared-Frobenius eigenvalues q^(2j) in degree j + t/2 − 1 for 0 ≤ j ≤ t/2 − 1, with semisimple eigenspaces; and that for each type-four component C ≅ ℙ¹, deg_C ω = q − 1 (LL2 Lemma 2.32, p. 23, with its proof, p. 24, which for t ≥ 6 uses the case ²D_n, n = t/2 ≥ 3, of Lusztig76 7.3 with 6.1; LL2 Lemma 2.42, p. 27). These statements reduce vertical classes numerically to curves. The strata themselves, their dimensions t(Λ)/2 − 1 on each component and their incidence by vertex sums are PELModuliPartII §3.7. The route uses Lusztig's computation for the Coxeter varieties of type ²D_(t/2), which is of type ²A₃ when t = 6, with the closed–open sequences, and computes the universal line on the incidence model of ℙ¹.

**Checks.**

- A type-two stratum is a point on each component, with Tate classes in degree zero only.
- A type-four stratum is a ℙ¹ on each component; its H² is spanned by the class of a type-two point, and deg ω = q − 1, which is 2 at q = 3.
- Replacing the trace dual by the hermitian dual h(x,Λ) ⊂ O_F changes the type of every vertex lattice and therefore the dimension assigned to its stratum.

*Needs:* §5.2; PELModuliPartII §3.7; MotivesAndAlgebraicCycles §§2.4, 2.7; EtaleCohomologyFoundations §§0.7–0.8, F.2.5 and F.4.1–F.4.6; SchemeAndStackFoundations §5.3.

### 5.5 Exotic rank-two intersection

Prove that for n = 2 and an integral lattice L with fundamental invariants (2b₁+1, 2b₂+1), 0 ≤ b₁ ≤ b₂, Int(L) = 2·Σ_(j=0)^b₁ (Σ_(i=0)^j q^i + (b₂ − j)·q^j). The outer factor 2 counts both components and the inner upper bound is j (LL2 Proposition 2.44, pp. 28–29). The route evaluates the quasi-canonical intersection lengths on both components by GrossZagierAndArithmeticHeights §7.2 in the ramified case and counts the integral overlattices of L by their projection data, as in LL2's proof; the comparison with the density side is §6.6.

**Checks.**

- (b₁, b₂) = (0,0): Int = 2·(1 + 0) = 2.
- (b₁, b₂) = (0,1): Int = 2·(1 + 1) = 4.
- (b₁, b₂) = (1,1): Int = 2·((1 + 1) + (1 + q + 0)) = 2(q + 3), which is 12 at q = 3; an inner bound b₁ in place of j would give 2·((1 + q + 1) + (1 + q + 0)) = 2(2q + 3) instead. At (1,2) the formula gives 2·((1 + 2) + (1 + q + q)) = 2(2q + 4).

*Needs:* §§5.3–5.4; GrossZagierAndArithmeticHeights §7.2; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.2 and 7.1.

### 5.6 Exotic cancellation and component symmetry

Prove that a trace-self-dual summand splits off: if L = M ⊥ L₂ with M trace-self-dual of even rank, the exotic intersection of L equals that of L₂ on the exotic space of the complementary nonsplit space of lower even rank, where pulled-back cycles can be empty, the whole space or Cartier according to the remaining label, so the zero complex of §5.2 is used. Prove further that the two components contribute equally to Int(L) for every full-rank L: choose a normal basis x₁, …, x_n of L, whose Gram matrix is, up to a permutation, an orthogonal sum of rank-one blocks and hyperbolic-type rank-two blocks (LL2 Definition 2.11 and Lemma 2.12(1), p. 12), ordered so that x_n spans a rank-one block, which exists because V is nonsplit; thus h(x_i, x_n) = 0 for i < n and h(x_n, x_n) ≠ 0. The map θ fixing x_i for i < n and sending x_n to −x_n is then an isometry of determinant −1; it exchanges the two components and preserves every N(x_i) (LL2 Remark 2.52, p. 30; Lemma 2.56, p. 34). The route splits the polarized Dieudonné modules and applies θ to the framing pair; θ does not negate every coordinate, and on a basis that is not normal the coordinate sign change need not be an isometry.

**Checks.**

- On an orthogonal basis e₁, e₂ the cross pairings h(e₁, ±e₂) are 0 on both sides and θ is an isometry of determinant −1; the map sending every x_i to −x_i has determinant (−1)^n = 1 and is not the reflection used.
- On a basis that is not normal the coordinate sign change fails: in a ramified plane with Gram matrix diag(1,1) for e₁, e₂, the basis x₁ = e₁, x₂ = e₁ + e₂ has h(x₁, x₂) = 1, while h(x₁, −x₂) = −1, so fixing x₁ and negating x₂ is not an isometry.
- In rank two with invariants (1,1) each component contributes 1 of the total 2 of §5.5.
- After splitting off M, a label in M becomes the zero label of the smaller space and contributes [O] − [ω], not [O].

*Needs:* §§5.2–5.4, 0.8; PELModuliPartII §3.7.

### Examples

The rank-two count gives 2, 4 and 2(q+3) at (b₁, b₂) = (0,0), (0,1), (1,1); at q = 3 these are 2, 4 and 12. A single connected component contributes exactly half only after the reflection argument. The zero-label class [O] − [ω] has Euler characteristic 1 − q on a type-four projective line, the value of the curve function of §6.5 on Λ.

### Dependencies

Layer 0; PELModuliPartII §§3.3–3.7; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20; Mathlib `Module.equiv_directSum_of_isTorsion`; GrossZagierAndArithmeticHeights §7.2; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.2 and 7.1; MotivesAndAlgebraicCycles §§2.4, 2.7; EtaleCohomologyFoundations §§0.7–0.8, F.2.5 and F.4.1–F.4.6; SchemeKTheoryOperationsPartII §1.7; SchemeAndStackFoundations §5.3. The ²D_n (n = t/2 ≥ 3) Coxeter computation is Lusztig76 7.3 with 6.1, as cited in LL2 Lemma 2.32; at t = 6 the type ²D₃ is ²A₃.

## Layer 6: Exotic analytic formula and induction

Normalize the exotic density polynomial and its derivative, define the analytic and geometric horizontal and vertical functions, prove the lattice-extension cancellation, the Fourier support of the analytic vertical function, the curve Fourier identity and the horizontal identity, and close the exotic Kudla–Rapoport identity by an induction that treats separately the special lattices with two overlattices of the same terminal invariants.

### 6.1 Exotic normalized density

Prove the exotic density normalization. For n = 2r, base residue cardinality q and the trace-self-dual ramified hyperbolic lattices H_k, the polynomial D_L satisfies D_L(q^(−s)) = Den(H_(r+s), L)/∏_(i=s+1)^(r+s) (1 − q^(−2i)) for s ≥ 0; equivalently D_L(X) = Σ_M X^(2·length(M/L))·∏_(i=0)^(t(M)/2−1) (1 − q^(2i)X²) over the integral overlattices M ⊃ L. For L of full rank in the nonsplit V every integral M has positive even type, D_L(1) = 0 and ∂Den(L) := −D′_L(1) = 2·Σ_M ∏_(i=1)^(t(M)/2−1) (1 − q^(2i)); and the Whittaker derivative satisfies W′_T(0)/∏_(i=1)^r (1 − q^(−2i)) = log q·∂Den(L) (LL2 §2.2, Definitions 2.14 and 2.16, Remark 2.18 and Lemma 2.19, pp. 13–15). The factor 2 comes from the derivative of 1 − X² at X = 1. The route applies the ramified density interpolation and overlattice expansion requested in gap:ramified-hermitian-densities.

**Checks.**

- A type-two overlattice contributes 2 (empty product) to ∂Den.
- A type-four overlattice contributes 2(1 − q²), which is negative.
- A type-zero overlattice would contribute through X^(2ℓ) alone; none occurs in the nonsplit space, since the hyperbolic H_r does not embed there, which is why D_L(1) = 0.
- Sign vanishing of densities needs equal rank: for the minimal nonsplit plane L with invariants (1,1), which has no proper integral overlattice and D_L(X) = 1 − X², Den(H₁, L) = D_L(1)·(1 − q⁻²) = 0, but Den(H₂, L) = D_L(q⁻¹)·(1 − q⁻⁴) = (1 − q⁻²)(1 − q⁻⁴), which is 640/729 at q = 3, although H₂ is split and L is not.

*Needs:* gap:ramified-hermitian-densities (GeometryOfNumbersAndQuadraticArithmetic §3.2); §5.1; MetaplecticAutomorphicForms §3.3b.

### 6.2 Exotic horizontal and vertical functions

Define the exotic split. For a nondegenerate L♭ of rank n−1 and x ∉ L♭ ⊗ F, the analytic total is ∂Den(L♭ + O_F·x); its horizontal part is 2·#{integral M ⊃ L♭ + O_F·x : t(M ∩ (L♭ ⊗ F)) = 1}, each eligible M contributing 2, and its vertical part is the total minus the horizontal part. Geometrically take the primitive horizontal sum over the type-one overlattices of L♭ and subtract it from the derived class in the (n−1)-st graded piece to define the vertical class and its intersection function (LL2 Definition 2.20, p. 15; Definitions 2.45–2.50, pp. 29–30). The route uses the ramified primitive horizontal classification and the supported formal filtration.

Its API consists of the following facts:

- The initial domain excludes the hyperplane L♭ ⊗ F.
- Only type-one hyperplane intersections M ∩ (L♭ ⊗ F) enter the analytic horizontal count.
- Both the analytic and the geometric vertical objects are defined by subtraction.
- The split depends on the embedded lattice, not its basis, and horizontal plus vertical recovers the total class or function on the admitted domain.

**Checks.**

- Each eligible horizontal overlattice has coefficient 2, matching a type-two full-rank lattice in §6.1.
- An overlattice whose hyperplane intersection has type three is excluded from the horizontal part.
- For the zero label the Euler class is computed with C(0) = [ω → O], giving [O] − [ω] rather than [O].

*Needs:* §§5.3, 6.1; SchemeKTheoryOperationsPartII §§0.6 and 4.3; gap:nonaffine-formal-filtration-product.

### 6.3 Ramified lattice-extension cancellation

Prove the extension count. Let L♭ be integral of rank n−1 in the exotic space V, H = L♭ ⊗ F, W = H^⊥ and W_int its norm-integral rank-one lattice. Full lattices M ⊃ L♭ correspond to triples (A, δ, ε) with A = M ∩ H ⊃ L♭, normal projection u^δ·W_int, and ε: u^δ·W_int → H/A the O_F-linear graph map of the extension. M is integral exactly when A is integral, im(ε) ⊂ A^∨/A and every coset ε(x) + x has integral norm; then t(M) = t(A) + 1 when im(ε) ⊂ (uA^∨ + A)/A and t(M) = t(A) − 1 otherwise. With μ(t) = ∏_(i=1)^(t/2−1) (1 − q^(2i)) for positive even t: for each fixed integral A the sum Σ_(M integral, M∩H=A) q^(−δ_M)·|μ(t(M))| converges; if t(A) > 1 and z ∉ V_int, its signed version restricted to z ∈ M^∨ vanishes; and if t(A) > 1, Σ_(M integral, M∩H=A, δ_M=0) μ(t(M)) = 0. These are cancellations of sums, not term-by-term vanishing (LL2 Lemma 2.24, pp. 16–20). The route classifies the extension graphs, applies the type criterion to their images, writes the absolute sum as an integral over a compact norm-integral region for convergence, splits the signed sum by the two types and uses the norm-shell counts; the δ = 0 statement follows by subtracting two shell identities.

**Checks.**

- For t(A) = 1 the type of M is 0 or 2; the cancellation statements require t(A) > 1 and are not asserted at t(A) = 1.
- In the δ = 0 sum the terms μ(t(A)+1) and μ(t(A)−1) have opposite signs whenever t(A) ≥ 3, so termwise vanishing is false while the weighted sum vanishes.
- The trace dual A^∨ enters the type criterion; the hermitian-sharp dual of the Krämer setting would change which extensions raise the type.

*Needs:* §§5.1, 6.1 (the trace dual and its fundamental invariants are those of §5.1); gap:ramified-hermitian-densities.

### 6.4 Exotic analytic Fourier support

Prove that the exotic analytic vertical function extends to a Schwartz–Bruhat function on V whose Fourier transform, for the trace self-dual measure, is supported in the integral-norm cone V_int (LL2 Proposition 2.22, p. 15; proof pp. 16–22). The extension and the support use the convergent extension sums of §6.3; they do not follow from compact support of the total function. The route applies §6.3 to the lattice-indicator transforms.

**Checks.**

- For the trace self-dual measure vol(M) = [M^∨ : M]^(−1/2) = q^(−val(M)/2), with val(M) = Σ a_i = length_(O_F)(M^∨/M); only for a vertex lattice, whose invariants are 0 or 1, is this q^(−t(M)/2), so the type-two and type-four vertex indicators carry q⁻¹ and q⁻², the latter agreeing with vol(Λ) = q⁻² in §6.5. The support of each single transform is the whole trace dual M^∨, and integrality of the support comes from the cancellations of §6.3.
- Type does not determine covolume: if M has invariants (1,1) then uM has invariants (3,3), both of type two, and vol(M) = q⁻¹ while vol(uM) = q⁻³, which are 1/3 and 1/27 at q = 3; the formula q^(−t/2) would give 1/3 for both.
- For n = 2 and L♭ of minimal valuation the vertical function vanishes and the statement is trivial.
- The total function ∂Den_L♭ is not compactly supported near L♭ ⊗ F; only the vertical part is Schwartz.

*Needs:* §§6.2–6.3; AnalyticNumberTheoryPartII §5.3g.

### 6.5 Exotic geometric local modularity

Prove that for either of the two connected components V_Λ^± ≅ ℙ¹ of the stratum of a type-four vertex lattice Λ (one in each connected component of the exotic space, §5.4; LL2 Proposition 2.28(2) and Remark 2.29, pp. 22–23), its special-divisor Euler function is −q(1+q)·1_Λ + Σ_Λ′ 1_Λ′ over the q²+1 proper integral vertex overlattices Λ′ ⊃ Λ, taking the value 1 − q on Λ, 1 on the integral-norm vectors of Λ^∨ ∖ Λ and 0 elsewhere; that vol(Λ) = q⁻² and the Fourier eigenvalue is −1; and that, through §5.4, which writes the vertical class as a combination of these components, the geometric vertical function has the same negative eigenvalue (LL2 Lemma 2.55, pp. 32–34, for one connected component; Proposition 2.51, p. 30, proof p. 34). The route computes the line degree on each component, transforms the indicators and combines the curve classes.

**Checks.**

- On Λ: −q(1+q) + (q² + 1) = 1 − q, which agrees with χ([O] − [ω]) on one component ℙ¹ from §5.2.
- The function belongs to one component: the whole stratum V_Λ = V_Λ^+ ⊔ V_Λ^− has twice this function, 2(1 − q) on Λ (−4 at q = 3) and 2 on the integral-norm vectors of Λ^∨ ∖ Λ, which the statement does not admit; the Fourier eigenvalue −1 is the same for both, by linearity.
- Fourier on Λ: −q(1+q)·q⁻² + (q²+1)·q⁻¹ = q − 1 = −(1 − q).
- For x ∈ Λ^∨ with x̄ isotropic, x̄^⊥/x̄ is an anisotropic plane, x lies in exactly one Λ′^∨ and the transform is −(1+q)/q + 1/q = −1; for x̄ anisotropic, x̄^⊥ contains q+1 isotropic lines and the transform is 0.

*Needs:* §§5.4, 5.6, 6.2; AnalyticNumberTheoryPartII §5.3g.

### 6.6 Exotic horizontal identity

Prove that the geometric and analytic horizontal functions agree: primitive horizontal cycles are indexed by type-one rank-(n−1) overlattices, both component contributions are included, and for primitive rank-two cycles the predecessor subtraction is by a lattice of colength q, with the conductor determined by the trace-dual invariants (LL2 Corollary 2.46, p. 29; Lemmas 2.53–2.54, pp. 31–32). The route reduces the primitive intersection to rank two by §5.6 and sums the conductor lengths of §5.5.

**Checks.**

- In rank two with invariants (1,1) both sides equal 2.
- Omitting the second component halves the geometric side and breaks the identity.
- A hyperplane intersection of type three contributes to neither horizontal side.

*Needs:* §§5.5–5.6, 6.2.

### 6.7 Exotic special two-overlattice induction

Prove the special case analysis. Assume r ≥ 2 and L♭ integral with an isolated largest invariant a = a_(n−1) > a_(n−2), hence a odd. The number of integral full lattices M ⊃ L♭ with invariants (a₁, …, a_(n−2), a−1, a−1) is 0 or 2. In the case of two, M± ∩ (L♭ ⊗ F) = L♭, a ≥ 3, and there are orthogonal decompositions L♭ = A ⊥ B and M± = A ⊥ B± with A of rank n−2 and invariants (a₁, …, a_(n−2)), B of rank one and invariant a, and B± of rank two and invariants (a−1, a−1). Define S_L♭ = M₊ ∪ M₋ in the special case and L♭ + W_int otherwise. For x ∉ (L♭ ⊗ F) ∪ S_L♭ one can write L♭ + O_F·x = L♭′ + O_F·x′ with val(L♭′) < val(L♭) (LL2 Lemma 2.57, pp. 34–35; Lemma 2.58, p. 36). The route uses the ramified normal forms to classify the alternatives through the minor valuations of the moment matrix; since a ≥ 3, the invariants (a−1, a−1) of B± are at least 2, so h(B±, B±) ⊂ u·O_F and every vector of B₊ ∪ B₋ has norm of u-adic valuation at least two, that is of F₀-valuation at least one; hence B₊ ∪ B₋ ⊂ u·(V→)_int, where V→ is the orthogonal complement of A ⊗ F in V and (V→)_int its set of vectors of integral norm; this is the strict support used in §6.8.

**Checks.**

- If a_(n−1) = a_(n−2) the hypothesis fails and the lemma does not apply.
- In the special case the two lattices have the same hyperplane intersection L♭, so they are invisible to the horizontal part.
- An isolated top invariant a = 1 never produces the two-lattice case: the two overlattices would have all invariants zero, hence be trace-self-dual, which the nonsplit space excludes. a = 3 does occur: for L♭ = ⟨e₁, e₂, e⟩ with h(e₁,e₁) = β₁, h(e₂,e₂) = β₂ and h(e,e) = βu², where β₁, β₂, β are units with −β₁β₂ a non-square unit, and x₀ ⊥ L♭ with h(x₀,x₀) = β, the vectors u⁻¹e ± x₀ are isotropic with h(e, u⁻¹e ± x₀) = −βu of u-adic valuation one, while h(e,e) = βu² has F₀-valuation one, so the two lattices L♭ + O_F·(u⁻¹e ± x₀) are integral with invariants (1,1,2,2), meet L♭ ⊗ F in L♭ and are distinct; a bound a > 3 would miss them.

*Needs:* §§5.6, 6.3.

### 6.8 Exotic smooth Kudla–Rapoport identity

Prove that for every full-rank lattice L in the nonsplit even-rank exotic special Hom space, Int(L) = ∂Den(L) (LL2 Theorem 2.7, p. 11; §2.7, pp. 34–37, proof of the theorem p. 37). The route inducts on val(L♭) with the rank-two base §5.5 and cancellation §5.6: the difference Φ = ∂Den_V − Int_V is Schwartz with Fourier support in V_int (§§6.4–6.5) and is confined by §6.7 to S_L♭; in the ordinary case its factorization through a lattice indicator kills it, and in the special case the residual function on the plane V→ of §6.7 has support in u·(V→)_int and Fourier support in (V→)_int, and the hermitian uncertainty principle kills it.

**Checks.**

- n = 2, invariants (1,1): both sides equal 2.
- n = 2, invariants (1,3): §5.5 gives Int = 4, and the density side of §6.1 gives 2·#(integral overlattices of type two) = 2·2 = 4.
- The two support arguments are distinct: the special case cannot be handled by factorization through an indicator, since S_L♭ is a union of two lattices.

*Needs:* §§5.5–5.6, 6.4–6.7; MetaplecticAutomorphicForms §3.3a.

### 6.9 Relative and absolute exotic cycle comparison

Prove that when F₀/ℚ_p is unramified, under the equivalence of relative and absolute exotic spaces of PELModuliPartII §4.6 the special Hom spaces identify isometrically with their scaled forms, the special cycles and their derived classes correspond, and the identity of §6.8 holds in the global-model convention without a valuation shift (LL2 Corollaries 2.65–2.66, p. 43). The route compares the Hom-lifting functors through the relative Dieudonné equivalence.

**Checks.**

- Over F₀ = ℚ_p the comparison is the identity on lattices.
- The relative and absolute special Hom spaces are isometric (LL2 Corollary 2.66), so a norm h(x,x) = a keeps its value and its F₀-valuation v_F₀(a). The global form of PELModuliPartII §9.6 is h′ = (u²/ϖ)·h with ϖ a uniformizer of F₀ at the place, so u²/ϖ is a unit and v_F₀((u²/ϖ)·a) = v_F₀(a): duals, invariants and integrality agree, and no valuation shift occurs. The nonunit scaling u⁻² of §5.1 is a different matter: it changes F₀-valuations of norms by one, u-adic valuations by two, and is not attributed to this unit.
- If F₀/ℚ_p is ramified the comparison is not asserted.

*Needs:* §§5.1, 6.8; PELModuliPartII §4.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20.

### Examples

A full-rank exotic overlattice of type two contributes 2 through the empty product and one of type four contributes 2(1 − q²). On a type-four component the indicator sum has q²+1 terms and gives −q(1+q) + (q²+1) = 1 − q on Λ. The special two-overlattice case requires a ≥ 3 and occurs at a = 3 (§6.7); an isolated top invariant 1 is always ordinary.

### Dependencies

Layer 5; gap:ramified-hermitian-densities; GeometryOfNumbersAndQuadraticArithmetic §3.2; MetaplecticAutomorphicForms §§3.3a, 3.3b; AnalyticNumberTheoryPartII §5.3g; SchemeKTheoryOperationsPartII §§0.6 and 4.3, with gap:nonaffine-formal-filtration-product; PELModuliPartII §§4.6 and 9.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20.

## Layer 7: Krämer model geometry and horizontal correction

On the Krämer model of PELModuliPartII §§5.1–5.3 and 5.7–5.8, for a ramified quadratic extension with π̄ = −π and π₀ = π², and for either sign χ(V) of the special Hom space, construct special cycles, the exceptional projective spaces attached to type-zero vertex lattices and the positive-type symplectic incidence strata. Prove their incidence and deformation properties, classify horizontal lattices and their primitive cycles, compute the special divisors and intersection numbers in rank two, correct the horizontal part by exceptional lines, and prove the parity-corrected cancellation law and the geometric Fourier bounds.

### 7.1 Krämer special cycles and exceptional divisors

Construct the Krämer special cycles. On the Krämer space N_n of PELModuliPartII §5.3, with its rank-(n−1) Lie filtration, rank-one quotient and polarization-compatible framing (n ≥ 2), for either of the two framing polarization classes of PELModuliPartII §5.5, which give the two signs χ(V) of the special Hom space, let Z(x) be the locus where x ∈ V lifts from the canonical signature-(0,1) source of §5.2, and Z(L) for a lattice. For x ≠ 0, Z(x) is a Cartier divisor or empty. The type-zero vertex lattices Λ index pairwise disjoint exceptional Cartier divisors Exc_Λ ≅ ℙ^(n−1) (K Definitions 2.1–2.2, p. 10; Definitions 2.3–2.4 and Lemma 2.5, p. 12). The route applies the homomorphism-lifting criterion to the Krämer moduli problem, keeping the filtration rank and the polarization compatibility explicit. Basis independence is Howard's linear invariance on the Krämer model, an isomorphism of the homology sheaves of the tensor products of the complexes C(x_i) for any number of labels generating the same module (Howard19 Theorem B and its K-theoretic form Corollary C, p. 2); Howard writes it for a quadratic extension of ℚ_p, and its proof is carried out here over F₀, as HSY23b notes it extends word for word through relative displays (HSY23b, footnote 1, p. 3).

Its API consists of the following facts:

- Z(L) is the locus where all special Hom labels in L lift simultaneously.
- The type-zero components Exc_Λ are Cartier divisors isomorphic to ℙ^(n−1).
- Howard's compatible ideal maps make the derived class of Z(L) independent of the basis.
- Base change of the Krämer test object with its Lie filtration pulls back each lifting locus, with the polarization-compatible framing retained.

**Checks.**

- The filtration has rank n−1; it has rank one only when n = 2.
- A framing quasi-isogeny that is not compatible with the polarizations up to the allowed scalar is excluded from the moduli problem.
- Z(0) is the whole Krämer space, of codimension zero, while a nonzero liftable label gives a Cartier divisor.

*Needs:* PELModuliPartII §§5.1–5.3, 5.5, 5.7 and 5.8; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; GeometryOfNumbersAndQuadraticArithmetic 2.7.1; Howard19 Theorem B and Corollary C.

### 7.2 Symplectic incidence resolution

Construct the symplectic incidence varieties. For an integer m ≥ 1 and a 2m-dimensional symplectic space V over F_q with Frobenius Φ, let S_V parametrize Lagrangian subspaces U with dim(U ∩ ΦU) ≥ m−1, and Y_V the pairs (U, U′) with dim U′ = m−1 and U′ ⊂ U ∩ ΦU. Prove that Y_V is smooth and projective of dimension m; for m ≥ 2 the projection Y_V → S_V resolves the singularities of S_V at its rational points, with exceptional fibres ℙ^(m−1); for m = 1, S_V = ℙ¹ and the projection is an isomorphism (K §3.1, Lemma 3.1, Proposition 3.2 and Remark 3.3, pp. 16–17). The route constructs the isotropic flag incidence scheme and computes its tangent spaces, treating m = 1 separately.

Its API consists of the following facts:

- The construction is for m ≥ 1, the range of K §3.1; type-zero vertex lattices, which would give m = 0, are treated separately in §§7.3–7.4.
- The dimension condition is on U ∩ ΦU.
- Forgetting U′ gives Y_V → S_V.
- For m = 1, U′ = 0 and Y_V = S_V = ℙ¹.
- A Frobenius-compatible isometry of symplectic spaces transports pairs U′ ⊂ U, commutes with the projection and induces an isomorphism of incidence varieties.

**Checks.**

- m = 0 is excluded, not reinterpreted: V = 0, S_V is the point {0}, and an incidence pair would need a subspace U′ of dimension −1, so Y_V is not defined; the target does not read m − 1 as the truncated natural number 0 (which would make Y_V → S_V the identity of a point), and type-zero strata take the separate route of §7.3.
- m = 1: every line in a symplectic plane is Lagrangian, U′ = 0, Y_V = S_V = ℙ¹ of dimension 1, smooth, and there is no exceptional curve.
- m = 2: over a rational Lagrangian U (ΦU = U) the fibre consists of all lines U′ ⊂ U, a ℙ¹.
- Replacing the inequality dim(U ∩ ΦU) ≥ m−1 by equality removes the rational points and the boundary.

*Needs:* SchemeAndStackFoundations §§5.1, 5.4.

### 7.3 Krämer stratum deformation

Prove the deformation properties of the strata. For a vertex lattice Λ of type 2m, define N_Λ as the closed subfunctor of Z(Λ) which is Z(Λ) itself when m = 0 and, when m ≥ 1, consists of the points at which, for every x ∈ Λ, the image under x of the Lie algebra of the canonical rank-one source lies in the rank-(n−1) filtration (K Definition 3.4, p. 17); this definition precedes any identification with an incidence variety. Its infinitesimal deformations are tested on artinian O_F̆-algebras with a residue map to the residue field and a nilpotent O_F₀-divided-power structure on its kernel (K Definition 3.7, p. 19). Its covariant divided-power deformation flags satisfy F^⊥ (rank one) ⊂ Fil (rank n) ⊂ D (rank 2n), with Fil maximal isotropic, (Π+π)F^⊥ = 0, (Π−π)Fil ⊂ F^⊥ and Fil ⊃ (Π+π)Λ, and, when m ≥ 1, F^⊥ ⊂ Λ^⊥, which is the Lie-image condition read on the flags (K Lemma 3.8, pp. 19–20). For positive type 2m there are no O/π²-valued deformations and the tangent dimension is at most m; hence N_Λ is reduced and smooth, which is what §7.4 uses. For type zero, prove the absence of O/π²-points by a separate argument and apply the infinitesimal thickening criterion, since the positive-type coordinate argument does not specialize to m = 0 (K Lemmas 3.8–3.15 and Theorem 3.16, pp. 19–25; Proposition 3.17, pp. 25–26). The route constructs the lattice-defined closed subfunctor directly from the moduli problem and applies Grothendieck–Messing.

**Checks.**

- For type two the tangent bound is 1, matching dim ℙ¹.
- At m = 0 the positive-type proof needs a coefficient a_(m+1) that is simultaneously zero and a unit; the type-zero argument must avoid this specialization.
- The rank conditions are rank one for F^⊥ and rank n for Fil; interchanging them violates maximal isotropy of Fil in the rank-2n module.
- Without the Lie-image condition the functor is Z(Λ), which for m ≥ 1 is not the stratum. On geometric points Z(Λ) imposes Λ̆ ⊂ M on the Dieudonné lattice M, and N_Λ imposes Λ̆ ⊂ M′ ⊂ M on the colength-one lattice M′ of the filtration (K Corollary 3.6, p. 18). For Λ of type two inside a type-zero vertex lattice Λ₀, the whole exceptional divisor Exc_(Λ₀) ≅ ℙ^(n−1), where M = Λ̆₀, lies in Z(Λ₀) ⊂ Z(Λ), while N_Λ meets it at most in the single point M′ = Λ̆, because Λ̆ already has colength one in Λ̆₀.
- The condition F^⊥ ⊂ Λ^⊥ is not imposed at m = 0: there Λ̆ is the whole Dieudonné lattice, its orthogonal for the perfect symplectic form is zero, and no rank-one F^⊥ could satisfy it.

*Needs:* §7.1; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20; GeometryOfNumbersAndQuadraticArithmetic 2.7.2.

### 7.4 Krämer vertex strata

Construct the Krämer strata. With the hermitian sharp dual Λ^♯ = {x : h(x,Λ) ⊂ O_F}, a vertex lattice satisfies πΛ^♯ ⊂ Λ ⊂ Λ^♯ and has even type t = dim_(k_F) Λ^♯/Λ. For positive type 2m, the stratum N_Λ of §7.3 is isomorphic to Y_(Λ^♯/Λ) for the induced symplectic form and has dimension m; type zero gives Exc_Λ. Positive strata intersect in N_(Λ+Λ′) only when Λ + Λ′ is a vertex lattice of positive type, and a type-zero sum gives an empty positive-stratum intersection. For integral L, Z(L) meets N_Λ if and only if L ⊂ Λ^♯; a nonintegral L has empty special cycle (K Definition 3.4 and point dictionary, pp. 17–18; Theorem 3.16, p. 25; Theorem 3.19, p. 26; Proposition 3.20, p. 27, with the positive-type and integrality qualifications stated here). The route identifies lattice-pair points, proves reducedness by §7.3, and compares the incidence functors with §7.2.

Its API consists of the following facts:

- The hermitian sharp dual Λ^♯ differs from the trace dual π⁻¹Λ^♯.
- A positive type 2m stratum is the m-dimensional incidence variety of §7.2.
- The support criterion L ⊂ Λ^♯ assumes L integral.
- Stratum intersections and containments are computed from vertex inclusions with the hermitian sharp dual, without substituting the trace dual.

**Checks.**

- Two positive-type strata whose sum is a type-zero vertex lattice have empty intersection.
- Type two gives a stratum isomorphic to ℙ¹, the m = 1 incidence variety.
- If L has a vector of negative norm valuation, Z(L) is empty even when a careless dual containment test L ⊂ Λ^♯ succeeds for a nonintegral L.

*Needs:* §§7.1–7.3; GeometryOfNumbersAndQuadraticArithmetic 2.7.2.

### 7.5 Krämer horizontal lattices and primitive cycles

Classify horizontal lattices. A rank-(n−1) integral lattice M♭ is horizontal when it is unimodular, or is a unimodular rank-(n−2) summand plus a line ⟨y⟩ whose complementary binary space is nonsplit; it lies in a unique type-zero vertex lattice. For a nonsplit binary complement, the primitive quasi-canonical cycle is Z_s⁺ ⊔ Z_s⁻ for s = val(y) > 0, each of degree q^s, and a single Z₀ ≅ Spf O_F̆ for s = 0. For a split binary complement horizontality requires val(y) = 0 and the primitive cycle is a single flat cycle Spf O_F̆. Summing the primitives over horizontal overlattices gives Z(L♭)_H (K Definition 4.1, Lemma 4.2 and Theorem 4.3, pp. 27–28). The route uses the ramified rank-two quasi-canonical classification with its sign and unit-norm hypotheses, through GrossZagierAndArithmeticHeights §7.2 and LubinTateFormalModulesAndQuasiCanonicalLifts §§6.2 and 6.5.

Its API consists of the following facts:

- The orthogonal binary complement condition is part of the definition of horizontality.
- For a nonsplit binary complement the primitive degree is 1 at s = 0 and 2q^s at s > 0; for a split complement only s = 0 occurs, with degree 1.
- The horizontal cycle is the sum over horizontal overlattices only.
- Replacing a basis of M♭ does not change its binary complement, primitive cycle or conductor-indexed degree.

**Checks.**

- A unit line in a nonsplit binary complement has one primitive component, of degree 1.
- At s = 1 in a nonsplit binary complement there are two components of degree q, total 2q, matching the ramified marked orbit of size q^s per component.
- In a split binary complement a nonunit line is not horizontal, and a unit line has one primitive component of degree 1.

*Needs:* §7.4; §1.3; GrossZagierAndArithmeticHeights §7.2; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.2, 6.5 and 7.1; GeometryOfNumbersAndQuadraticArithmetic 2.7.3.

### 7.5a Krämer rank-two intersection numbers

Prove the rank-two Krämer intersection numbers. Let n = 2 and V the Krämer special Hom space of either sign (§7.1); χ(V) = 1 when V is isotropic and χ(V) = −1 when it is anisotropic. For x ∈ V with h(x, x) ∉ O_F₀, Z(x) is empty. For x ≠ 0 with h(x, x) ∈ O_F₀, prove that Z(x) is the sum of its horizontal part, the sum of the primitive cycles of §7.5 over the horizontal lattices containing x, of the exceptional divisors Exc_Λ of the type-zero vertex lattices Λ containing x, each with multiplicity m_Λ(x) + 1, where m_Λ(x) is the largest m with π^(−m)x ∈ Λ, and, when χ(V) = 1, of the lines N_Λ ≅ ℙ¹ of the type-two vertex lattices Λ with x ∈ Λ^♯, each with multiplicity the largest m ≥ 0 with π^(−m)x ∈ Λ^♯ (HSY23b Theorem 1.2, p. 4, for χ(V) = 1, whose vertex lattices are the sharp duals of those of §7.4, K footnote 2, p. 12; Shi22 Theorem 1.1, p. 3, for χ(V) = −1, where there is no type-two vertex lattice). Prove that for a rank-two lattice L ⊂ V, Int(L) = 0 unless L is integral, and that for integral L:

- if L has a Gram matrix equivalent to diag(u₁(−π₀)^α, u₂(−π₀)^β) with u₁, u₂ ∈ O_F₀^× and 0 ≤ α ≤ β, then Int(L) = α + β − 2q(q^α − 1)/(q − 1) when χ(V) = 1, and Int(L) = 2·Σ_(s=0)^α q^s(α + β + 1 − 2s) − α − β − 2 when χ(V) = −1;
- if L has a Gram matrix equivalent to H_b = (0, π^b; (−π)^b, 0) with b odd, which happens only when χ(V) = 1, then Int(L) = b + 1 − (q + 1)(q^((b+1)/2) − 1)/(q − 1)

(HSY23b Theorem 1.1, p. 4; Shi22 Theorem 1.2, p. 4). Every integral lattice of rank two has one of these two Gram matrices: if some vector of L has a norm of the least π-adic valuation s occurring in h(L, L), it splits off orthogonally; otherwise s is attained only off the diagonal, s is odd (for s even, h(v, w) = π^s·ε with π^s ∈ F₀ and ε a unit, and c = ε̄⁻¹ gives Tr(c̄·h(v, w)) = 2π^s, of valuation s since p is odd, so the norm h(v,v) + N(c)·h(w,w) + Tr(c̄·h(v,w)) of v + cw has valuation s), and L is π^s-modular and equivalent to H_s (Jacobowitz's classification, recalled in HSY23b, p. 3). In particular Int(I₂) = 0 for the unimodular lattice I₂ of either sign. The route writes the local equations of Z(x) at the superspecial points with Grothendieck–Messing theory, identifies its horizontal components with quasi-canonical lifts, computes the pairwise Euler intersections of horizontal components, exceptional divisors and vertical lines from the lifting lengths and the self-intersections of exceptional divisors, and sums them over the decomposition of Z(x₁) for a basis x₁, x₂ of L.

Its API consists of the following facts:

- For x ≠ 0 with h(x, x) ∈ O_F₀, Z(x) is the sum of its horizontal part, the exceptional divisors Exc_Λ with multiplicity m_Λ(x) + 1, and, for χ(V) = 1, the type-two lines with the multiplicities stated above; it is empty when h(x, x) ∉ O_F₀.
- Int(L) depends only on the equivalence class of a Gram matrix of L and is given by the two formulas above, one for each sign on diagonal lattices and one for the hyperbolic planes H_b.
- Int(I₂) = 0 for either sign.

**Checks.**

- Int(I₂) = 0 for both signs: (α, β) = (0, 0) gives 0 + 0 − 0 = 0 when χ(V) = 1 and 2·1·1 − 0 − 0 − 2 = 0 when χ(V) = −1. This is the base value δ_odd(2) of §7.7, which the cancellation law cannot produce: its identity is unchanged when Int is replaced by Int + c in every rank.
- The hyperbolic plane H₁ (b = 1): Int(H₁) = 2 − (q + 1)(q − 1)/(q − 1) = 1 − q, which is −2 at q = 3. H₁ has no orthogonal basis, since every vector al₁ + bl₂ has norm π(ab̄ − āb) ∈ π₀O_F₀ (§8.6), so the diagonal formula does not apply to it.
- The two signs differ: at (α, β) = (0, 1) both formulas give 1 (0 + 1 − 0, and 2·2 − 3), while at (1, 1) the first gives 2 − 2q and the second 2(3 + q) − 4 = 2 + 2q, which are −4 and 8 at q = 3; one formula for both signs is wrong.
- A unit-norm x lies in a type-zero vertex lattice Λ (its orthogonal line contains a unit-norm vector, since −π₀ = N(π) is a norm), with m_Λ(x) = 0, so Exc_Λ occurs in Z(x) with multiplicity 1: the divisor of a unit vector is not its horizontal part alone, which is why §7.6 corrects the horizontal classes by exceptional lines.

*Needs:* §§7.1, 7.4–7.5; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; GrossZagierAndArithmeticHeights §7.2; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.2, 6.5 and 7.1; SchemeKTheoryOperationsPartII §§3.4, 4.3 and 4.6.

### 7.6 Modified Krämer horizontal and vertical classes

Define the modified classes. Work in K₀ modulo F^n for the rank-(n−1) derived cycle. For a horizontal M♭ put 𝒟(M♭) = [O_(Z̃(M♭)°)] + α·[O_ℓ] where ℓ is an exceptional line in the type-zero vertex containing M♭, with α = (1 − (−1)^(n−1))/2 for unimodular M♭ and α = 1 otherwise. Sum 𝒟 over the horizontal overlattices to obtain H*, and put V* = ᴸZ(L♭) − H* (K Lemma 4.4 and (4.4)–(4.6), p. 28; Definitions 4.5 and 4.7, Remark 4.6 and Lemmas 4.8–4.9, p. 29). The correction is the class of an exceptional line, not of the whole exceptional ℙ^(n−1). The route uses the pairing of exceptional lines with special divisors to modify the horizontal decomposition in the quotient.

Its API consists of the following facts:

- For unimodular M♭, α = 0 when n is odd and α = 1 when n is even.
- H* is a finite supported sum of modified primitive classes.
- V* is the derived class minus H* in the stated quotient.
- The quotient map from supported K-theory sends the derived class to H* + V*, and changing a representative by F^n leaves every pairing with a special divisor unchanged.

**Checks.**

- n = 3, unimodular M♭: α = (1 − 1)/2 = 0.
- n = 2, unimodular M♭: α = (1 + 1)/2 = 1.
- For nonunimodular horizontal M♭, α = 1 in either parity.

*Needs:* §§0.6, 7.5; SchemeKTheoryOperationsPartII §4.6; gap:nonaffine-formal-filtration-product.

### 7.7 Parity-corrected Krämer cancellation

Prove that if L = I_ℓ ⊥ L₂ has total rank n = ℓ + r with I_ℓ unimodular of rank ℓ and L₂ of rank r ≥ 2, so that the Krämer space of rank r of §7.1 is defined, and I_r is a unimodular lattice in the complementary space containing L₂, then Int_n(L) − Int_r(L₂) = n(I_r, L₂)·(δ_odd(n) − δ_odd(r)), where n(I_r, L₂) = #{M ⊃ L₂ : M ≅ I_r} and δ_odd is the indicator of odd integers; in particular, with Int(I₂) = 0 of §7.5a and n(I₂, I₂) = 1, Int(I_n) = δ_odd(n) for every n ≥ 2 (K Proposition 2.12, p. 15, which takes Int(I₂) = 0 from HSY23b and Shi22). The complementary rank r, not the rank ℓ of the split unimodular summand, enters the second parity term. The route tracks the exceptional intersections under the regular-immersion pullback to the Krämer space of rank r, rather than reusing the unramified cancellation law: for a unit-norm x, Z(x) is the strict transform Z̃(x), isomorphic to the Krämer space of rank n − 1 and sign χ(V)·χ(⟨x⟩), plus the exceptional divisors Exc_Λ of the type-zero lattices Λ ∋ x, each with multiplicity one, and the Euler pairing of such an Exc_Λ with the derived class of a rank-r lattice in Λ is (−1)^r (HSY23a Proposition 3.2, p. 14, with the multiplicities of §7.5a; Proposition 2.6 and Corollary 2.7, p. 10; Corollary 3.6, p. 16).

**Checks.**

- n = 3, ℓ = 1, r = 2 with n(I₂, L₂) = 1: the correction is 1·(1 − 0) = 1.
- With Int(I₂) = 0 from §7.5a, Int(I₃) = Int(I₂) + n(I₂, I₂)·(δ_odd(3) − δ_odd(2)) = 0 + 1 = 1. The law alone does not give Int(I₂): replacing Int by Int + c in every rank leaves both sides of it unchanged, and rank r = 1, where Int(I₁) could serve as a base, is outside the Krämer spaces of §7.1.
- Writing δ_odd(ℓ) for the second term would give the correction 1·(1 − 1) = 0 in the first check, which is wrong.

*Needs:* §§7.1, 7.5a, 7.6; SchemeKTheoryOperationsPartII §3.4.

### 7.8 Krämer geometric Fourier bounds

Prove that for every vertex lattice Λ and every K-class supported on the proper stratum N_Λ, the special-divisor Euler function on nonzero labels extends uniquely to a Λ-invariant Schwartz–Bruhat function whose Fourier transform is supported in {val h(x,x) ≥ −1}; the modified geometric vertical function V* has the same bound; and its partial integral along L♭ ⊗ F is a Schwartz function on the normal line W with Fourier support in W_(≥−1), hence invariant under W_(≥0) and constant there. The Λ-translation identity for K-classes is asserted only when both labels are nonzero (K Definition 4.12, Lemma 4.13 and Theorems 4.14–4.16, pp. 31–32). The route: Howard's linear invariance gives Λ-translation invariance for nonzero labels; proper support bounds the function inside Λ^♯; translation extends it to zero and places its Fourier support in the trace dual π⁻¹Λ^♯, whose norm valuation is at least −1; decompose V* over finitely many proper strata and restrict the transform to the normal line after partial integration. No Tate-class generation is used.

**Checks.**

- For x ∈ Λ^♯ of a vertex lattice, πx ∈ Λ gives π·h(x,x) ∈ O_F, so h(x,x) ∈ O_F₀; since N(π⁻¹) = −π₀⁻¹, every vector of π⁻¹Λ^♯ has norm valuation at least −1.
- A function invariant under W_(≥0) and Schwartz on W is constant on W_(≥0) ∖ {0}, as used in §8.7.
- The translation identity at the zero label is not part of the statement: Z(0) is the whole space.

*Needs:* §§7.1, 7.4, 7.6; SchemeKTheoryOperationsPartII §3.1; AnalyticNumberTheoryPartII §5.3g; Howard19 Theorem B and Corollary C.

### Examples

At valuation zero a nonsplit primitive horizontal cycle has one component of degree 1; at valuation one it has two components of degree q, total 2q. For a unimodular horizontal lattice the exceptional-line coefficient is 1 in n = 2 and 0 in n = 3. Removing a unimodular rank-one summand from total rank three, leaving rank two with representation count one, gives the cancellation correction 1 − 0 = 1. In rank two Int(I₂) = 0 for both signs, Int(H₁) = 1 − q, and the lattice with invariants (2, 2) has Int = 2 − 2q or 2 + 2q according as V is isotropic or not.

### Dependencies

Layers 0–1; PELModuliPartII §§5.1–5.3, 5.5 and 5.7–5.8; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20; GeometryOfNumbersAndQuadraticArithmetic §2.7; GrossZagierAndArithmeticHeights §7.2; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.2, 6.5 and 7.1; SchemeKTheoryOperationsPartII §§3.1, 3.4, 4.3 and 4.6, with gap:nonaffine-formal-filtration-product; SchemeAndStackFoundations §§5.1, 5.4; AnalyticNumberTheoryPartII §5.3g.

## Layer 8: Krämer density correction and the Krämer identity

Define the modified Krämer density derivative with its −2 normalization and dual-vertex correction coefficients, prove the primitive density formula, define the analytic horizontal and vertical functions and their partial integrals, prove positive-cone constancy of the analytic partial integral and the horizontal identity, and prove the Krämer Kudla–Rapoport identity: in rank two from §7.5a, in rank three by induction with the statement (H₃) of §8.6 for the lattices of odd largest invariant that the induction cannot reach, and in rank n ≥ 4 by the same induction under the hypothesis (H_m), 4 ≤ m ≤ n, of §8.6.

### 8.1 Modified Krämer density derivative

Define the modified derivative. Let H be the hyperbolic plane with Gram matrix (0, π⁻¹; −π⁻¹, 0) and D(M, L; X) the polynomial with D(M, L; q^(−2k)) = Den(H^k ⊥ M, L). Put Den′(L) = −2·d/dX D(I_n, L; X)|_(X=1)/Den(I_n, I_n), where I_n is the unimodular lattice of rank n with χ(I_n) = −χ(L), and Den_(2j)(L) = Den(Λ_(2j)^♯, L)/Den(Λ_(2j)^♯, Λ_(2j)^♯) for a vertex lattice Λ_(2j) of type 2j. Define ∂Den = Den′ + Σ_(j=1)^(t_max/2) c_(2j)·Den_(2j), where the c_(2j) ∈ ℚ are the unique solution of ∂Den(Λ_(2i)^♯) = 0 for 1 ≤ i ≤ t_max/2, and t_max = n if n is even and χ(V) = 1, n − 2 if n is even and χ(V) = −1, n − 1 if n is odd (K Definitions 1.1–1.2 and (1.1)–(1.6), pp. 3–4; §5.1, p. 33; Corollary 5.8, p. 35).

Its API consists of the following facts:

- The raw derivative carries the factor −2.
- After correction every dual-vertex value ∂Den(Λ_(2i)^♯) vanishes.
- The summation range is determined by the rank and the sign χ(V).
- The corrected function is uniquely determined by the raw derivative and the dual-vertex equations, because the normalized vertex-density matrix is invertible.

**Checks.**

- n even and χ(V) = −1: the top type is n − 2; for n = 2 there is no correction term.
- The corrected derivative vanishes on each Λ_(2i)^♯ by construction.
- Den′ alone is nonzero on the nonintegral lattices Λ_t^♯, whose special cycles are empty; this is the discrepancy the correction removes.

*Needs:* gap:ramified-hermitian-densities (GeometryOfNumbersAndQuadraticArithmetic §3.2); §7.4.

### 8.2 Primitive Krämer density formula

Prove that the primitive corrected density ∂Pden, characterized by ∂Den(L) = Σ_(L ⊂ L′) ∂Pden(L′) over the overlattices in L ⊗ F, is 0 on nonintegral lattices and δ_odd(n) on unimodular lattices, and that for L = I_(n−t) ⊥ L₂ with L₂ of full type t it equals ∏_(ℓ=1)^((t−1)/2) (1 − q^(2ℓ)) when t is odd and (1 − χ(L₂)q^(t/2))·∏_(ℓ=1)^(t/2−1) (1 − q^(2ℓ)) when t is even; consequently ∂Den(L) ∈ ℤ and ∂Den vanishes on nonintegral lattices (K Theorem 7.1 and Corollaries 7.2–7.3, p. 46). The sign χ(L₂) is that of the full-type part. The route uses the ramified density combinatorics and the triangular vertex system of §8.1.

**Checks.**

- A unimodular lattice has primitive density 1 in odd rank and 0 in even rank.
- A full-type-two part contributes 1 − χ(L₂)q, which is 1 − q or 1 + q according to the sign.
- A full-type-three part contributes 1 − q², independent of χ(L₂).

*Needs:* §8.1; gap:ramified-hermitian-densities.

### 8.3 Krämer analytic horizontal and vertical functions

Define the Krämer analytic split. For a nondegenerate L♭ of rank n−1, partition the primitive overlattice expansion of ∂Den(L♭ + O_F·x) according to whether L′ ∩ (L♭ ⊗ F) is horizontal (§7.5); the two parts are ∂Den_(L♭,H) and ∂Den_(L♭,V). Use the modified geometric classes H*, V* of §7.6 for Int_(L♭,H) and Int_(L♭,V). On the normal line W define the partial integral of a function by integrating along L♭ ⊗ F with the self-dual Haar measure of the Conventions for the restriction of the trace pairing to L♭ ⊗ F (K Definition 8.1, p. 64; Definition 9.2, p. 73); the constancy statement of §8.4 does not depend on this choice, and the Checks record how values scale with it.

Its API consists of the following facts:

- Each integral overlattice enters exactly one of the horizontal and vertical parts.
- The partial integral integrates along the hyperplane; it is not a Fourier transform.
- Horizontal plus vertical recovers the total function off the hyperplane.
- Equal embedded hyperplane lattices give equal partitions and equal partial integrals for that measure.

**Checks.**

- A lattice whose hyperplane intersection is horizontal contributes to the horizontal part, not the vertical.
- Multiplying the Haar measure on L♭ ⊗ F by c multiplies every partial integral by c.
- In the rank-three example of §8.4 the vertical partial integral at a normal vector of norm −π₀⁻¹ is 2q·vol(L♭), not zero.

*Needs:* §§7.5–7.6, 8.2; AnalyticNumberTheoryPartII §5.3g.

### 8.4 Krämer analytic partial-integral bound

Prove that the analytic vertical partial integral ∂Den^⊥_(L♭,V) is constant on W_(≥0) ∖ {0} (K Theorem 8.2, pp. 64–67, constancy part; its proof is completed by Definition 8.3 through Proposition 8.9 and the proof of the latter, pp. 67–73, with the orthogonal-sum sign factor χ(−1)^n₁ in (8.6) in place of (−1)^n₁). No vanishing on the negative cone is asserted, and it is false: take χ(V) = 1, n = 3, L♭ = ⟨e⟩ ⊥ ⟨ℓ⟩ with h(e,e) = 1, h(ℓ,ℓ) = π₀, and x ∈ W with h(x,x) = −π₀⁻¹. For β ∈ O_F with β ≡ ±1 mod π (2q classes modulo π₀O_F) and α = π₀⁻¹β, the lattice L♭ + O_F(x + αℓ) has Gram matrix 1 ⊥ (π₀, β̄; β, (N(β) − 1)/π₀), which is integral with determinant −1, hence unimodular; its hyperplane intersection is L♭, which is not horizontal because its binary complement ⟨π₀⟩ ⊥ ⟨−π₀⁻¹⟩ is split while val(ℓ) ≠ 0. The only integral overlattice of L♭ in L♭ ⊗ F besides L♭ is ⟨e⟩ ⊥ ⟨π⁻¹ℓ⟩, which is unimodular and therefore horizontal, so these 2q lattices are all the vertical lattices containing some x + y with y ∈ L♭ ⊗ F. Each of these 2q lattices has primitive weight δ_odd(3) = 1, so ∂Den^⊥_(L♭,V)(x) = 2q·vol(L♭) ≠ 0. The analytic Schwartz property of K Corollary 9.8 depends on the full identity §8.7 and is not used before it. The route applies §8.2 and the weighted extension count, combining the scaling equality with O_F-unit invariance.

**Checks.**

- The counterexample above: integrality forces β ≡ ±1 mod π because N(β) ≡ b₀² mod π₀ for β = b₀ + πb₁, and there are 2·q classes of β mod π₀O_F; the determinant π₀·(N(β) − 1)/π₀ − N(β) equals −1.
- A projection π⁻ᵏx with k ≥ 1 would need v_π(α) = −3 for integral norm but v_π(α) ≥ −2 for h(ℓ, ·) integral, so no lattice with larger normal projection contributes.
- At q = 5 and n₁ = 1 the orthogonal-sum sign factor is χ(−1) = 1, not −1; the constancy argument holds for either sign.

*Needs:* §§8.2–8.3.

### 8.5 Krämer horizontal identity

Prove that with the modified class H* the geometric and analytic horizontal functions agree for all x ∉ L♭ ⊗ F, and that when L♭ itself is horizontal Int_(L♭,H) equals the total geometric intersection (K Lemmas 9.1 and 9.3–9.4 and Theorem 9.5, pp. 73–74). The route reduces to the ramified rank-two quasi-canonical lengths, including the exceptional-line corrections, and sums the modified primitive classes. For a horizontal L♭ the horizontal function is the total one, and the identity Int(L♭ + O_F·x) = ∂Den(L♭ + O_F·x) is in rank two the comparison of §7.5a with §8.2 (K Lemma 9.3, which takes it from HSY23b Theorem 1.1 and Shi22); in rank n > 2 a horizontal L♭ has a unimodular summand of rank n − 2, and K Lemma 9.1, the comparison of §7.7 with the density cancellation of §8.2, reduces it to rank two.

**Checks.**

- For n = 2 and a unimodular L♭ = ⟨y⟩ the horizontal function includes the exceptional-line correction α = 1.
- For n = 3 and unimodular L♭ the correction α = 0 and the horizontal function is the plain primitive intersection.
- The identity is asserted off the hyperplane only.

*Needs:* §§7.5, 7.5a, 7.6–7.7, 8.2–8.3; GrossZagierAndArithmeticHeights §7.2.

### 8.6 Isolated hyperbolic reduction step

State the identity for the lattices that the reduction of §8.7 cannot reach, and prove it in rank three. For an integral full-rank lattice L of rank n write a_n(L) for its largest fundamental invariant, a π-adic exponent for the hermitian sharp dual. In a normal basis (K, proof of Lemma 9.6, pp. 74–75) the rank-one blocks u·π^b have b even, since their norms lie in F₀, and the hyperbolic blocks H_b with Gram matrix (0, π^b; (−π)^b, 0) have b odd; so a_n(L) is odd exactly when every block carrying it is hyperbolic. If L = L♭′ + O_F·x′ with L♭′ nondegenerate of rank n−1, then val(L) − val(L♭′) is the π-adic valuation of the norm of the component of x′ normal to L♭′, an element of F₀, hence even, and val(L♭′) ≥ val(L) − a_n(L), the least valuation of an (n−1)-minor of a Gram matrix of L (K, proof of Lemma 9.6, p. 75, through LL2 Lemma 2.23). Hence val(L♭′) ≥ val(L) − a_n(L) + 1 when a_n(L) is odd, with equality for L♭′ = L₀ ⊥ ⟨l₁ + πl₂⟩ and x′ = l₂ when L = L₀ ⊥ H_(a_n) on a basis l₁, l₂ of H_(a_n): the norm of l₁ + πl₂ is −2π^(a_n+1), and the projection coefficient of l₂ on it is 1/(2π) ∉ O_F, so x′ ∉ L♭′ ⊕ W. For a nondegenerate L♭ of rank n−1 and x ∉ L♭ ⊕ W, K's minor count gives only val(L) − a_n(L) < val(L♭) for L = L♭ + O_F·x. A presentation L = L♭′ + O_F·x′ with val(L♭′) < val(L♭) therefore exists when a_n(L) is even (split off a rank-one block of invariant a_n(L)) or when a_n(L) is odd and val(L) − a_n(L) + 1 < val(L♭), and in no other case, whereas K Lemma 9.6 (p. 74) asserts it in every case.

Statement (H_n), for n ≥ 3: for every integral lattice L of rank n in the Krämer special Hom space, of either sign, whose fundamental invariants are all positive and whose largest invariant a_n(L) is odd, Int(L) = ∂Den(L). Prove (H₃). For n ≥ 4, (H_n) is not a target of this roadmap: no published argument proves it, and it is the hypothesis under which §8.7 and §13.10 are stated in rank n ≥ 4. It is strictly weaker than the conclusion of §8.7 in rank n, which it asserts only for lattices of odd largest invariant without unimodular summand. A lattice with odd a_n(L) and a zero invariant is I_ℓ ⊥ L₂ with L₂ of rank r ≥ 2 and all invariants positive, since its top block is hyperbolic, and reduces to L₂ by §7.7 and the density cancellation of §8.2 (K Lemma 9.1, p. 73); in rank two every lattice is covered by §7.5a with §8.2 (§8.7). (H₃) is HSY23a Theorem 1.2 (p. 4), which proves Int(L) = ∂Den(L) for every lattice of rank three, of either sign, for the ∂Den of HSY23a (1.10), p. 4, which is that of §8.1, since both correct the same derivative by normalized densities of the duals of vertex lattices whose coefficients are fixed uniquely by the same vanishing (K (1.4)–(1.6), p. 4; HSY23a Theorem 6.1, p. 26). In rank n ≥ 4 the lattices without a rank-one orthogonal summand, such as H₁ ⊥ H₁, are reached by no presentation in the induction of §8.7 (Checks). A route parallel to §§6.7–6.8, which confines the difference function to finitely many lattices and applies the uncertainty principle, needs the Fourier support of the analytic vertical function; K obtains that support (Corollary 9.8, p. 76) only from the identity of §8.7, and before it only the constancy of the partial integral, §8.4, is available.

The route of (H₃) uses special difference cycles. For a lattice L₁ ⊂ V of rank n₁ ≤ n define its special difference cycle D(L₁) = ᴸZ(L₁) + Σ_(i=1)^(n₁) (−1)^i·q^(i(i−1)/2)·Σ_(L′) ᴸZ(L′) in the K-group of N_n with support on Z(L₁), the inner sum over the lattices L₁ ⊂ L′ ⊂ π⁻¹L₁ with dim_(k_F) L′/L₁ = i, ᴸZ the derived class of §7.1 (HSY23a Definition 2.15 and (1.11), pp. 4 and 13). For a decomposition L = L₁ ⊕ L₂ of a full-rank lattice into sublattices of ranks n₁ and n − n₁, not necessarily orthogonal, put Int(L)^(n₁) = χ(N_n, D(L₁) ⊗^L ᴸZ(L₂)) and ∂Den(L)^(n₁) = ∂Den(L) − Σ_(i=1)^(n₁) (−1)^(i−1)·q^(i(i−1)/2)·Σ_(L₁′) ∂Den(L₁′ ⊕ L₂), the inner sum over the lattices L₁ ⊂ L₁′ ⊂ π⁻¹L₁ with dim_(k_F) L₁′/L₁ = i; both depend on the decomposition (HSY23a (1.13)–(1.14), pp. 4–5; Definition 2.18, p. 14; Definition 5.3, p. 23). The route: a nonintegral L gives 0 = 0 (§§7.4 and 8.2); a lattice with a unit-norm basis vector has Gram matrix diag(u₁, u₂(−π₀)^b, u₃(−π₀)^c), and its identity is deduced from rank two by HSY23a Proposition 11.1 (p. 45); otherwise h(L, L) ⊂ πO_F, and since the rank is odd L has a basis whose Gram matrix is diag(H_a, u₃(−π₀)^c) or diag(u₁(−π₀)^a, u₂(−π₀)^b, u₃(−π₀)^c); take L♭ spanned by its first two vectors and x the third, so that every L♭′ with L♭ ⊂ L♭′ ⊂ L♭ ⊗ F gives a lattice L♭′ ⊥ O_F·x of one of the three forms of the third fact below, or a nonintegral one, and the reduction fact gives Int(L) = ∂Den(L) (HSY23a, proof of Theorem 1.2, p. 49).

Its API consists of the following facts:

- The derived class is the sum of the difference cycles of the integral overlattices: ᴸZ(L₁) = Σ D(L′) over the integral L′ with L₁ ⊂ L′ ⊂ L₁ ⊗ F, a finite sum (HSY23a (1.12), p. 4; Lemma 2.16, p. 13); correspondingly ∂Den(L) = Σ ∂Den(L₁′ ⊕ L₂)^(n₁) over L₁ ⊂ L₁′ ⊂ L₁ ⊗ F (HSY23a Corollary 5.5, p. 23).
- Reduction: if Int(L₁′ ⊕ L₂)^(n₁) = ∂Den(L₁′ ⊕ L₂)^(n₁) for every lattice L₁′ with L₁ ⊂ L₁′ ⊂ L₁ ⊗ F, then Int(L) = ∂Den(L) (HSY23a Theorem 5.6(1), p. 23).
- Decomposition in rank three: for n = 3 and L♭ of rank two with h(L♭, L♭) ⊂ πO_F, D(L♭) = Σ_Λ (2·[O_(N_Λ)] + Σ_(Λ₀) H_(Λ₀)) in the graded piece Gr²K₀ of the codimension filtration, over the type-two vertex lattices Λ of §7.4 with L♭ ⊂ Λ and the type-zero vertex lattices Λ₀ ⊃ Λ, where N_Λ ≅ ℙ¹ is the stratum of §7.4 and H_(Λ₀) the hyperplane class of Exc_(Λ₀) ≅ ℙ² (HSY23a Theorem 1.4, p. 5, whose vertex lattices are the sharp duals of those of §7.4, K footnote 2, p. 12, so that its conditions L♭ ⊂ Λ₂^♯ and Λ₀ ⊂ Λ₂ read L♭ ⊂ Λ and Λ ⊂ Λ₀ here).
- Primitive identities in rank three: Int(L)^(2) = ∂Den(L)^(2) for L = L♭ ⊥ O_F·x of rank three whose Gram matrix on a basis of L♭ followed by x is diag(u₁, u₂(−π₀)^b, u₃(−π₀)^c) with 0 ≤ b ≤ c (for every decomposition L = L♭ ⊕ O_F·x), diag(H_a, u₃(−π₀)^c) with a odd and c ≥ 0, where the common value is 1 − q^a if a ≤ 2c and 1 − q^(2c+1) if a > 2c, or diag(u₁(−π₀)^a, u₂(−π₀)^b, u₃(−π₀)^c) with 0 < a ≤ b ≤ c, the u_i units of O_F₀ (HSY23a Propositions 11.1–11.3, pp. 45–48).

**Checks.**

- Rank two: in H₁ the element ab̄ − āb is of trace zero, hence in πO_F₀, so every line ⟨al₁ + bl₂⟩ has norm π(ab̄ − āb) ∈ π₀O_F₀ and fundamental invariant at least 2, while val(H₁) = 2: no presentation of H₁ has valuation below 2, and the projection coefficient of l₂ on l₁ + πl₂ is h(l₂, l₁ + πl₂)/h(l₁ + πl₂, l₁ + πl₂) = −π/(−2π₀) = 1/(2π), not integral. H₁ is therefore a rank-two lattice that the induction does not reach; §7.5a gives it directly.
- Rank three: L = ⟨e⟩ ⊥ H₃ with h(e, e) = π₀ has invariants (2, 3, 3) and val(L) = 8. For L♭ = ⟨e⟩ ⊥ ⟨l₁ + πl₂⟩, of valuation 2 + 4 = 6, and x = l₂, the projection coefficient is 1/(2π) ∉ O_F, so x ∉ L♭ ⊕ W, and every presentation of L has valuation at least 8 − 3 + 1 = 6: K Lemma 9.6 fails at (L♭, x). The same L is H₃ ⊥ ⟨e⟩, a presentation of valuation 6 with x′ = e ∈ W, and (H₃) covers it: on the basis l₁, l₂, e its Gram matrix is diag(H₃, u₃(−π₀)) with u₃ = −1, the second form of the primitive identities with a = 3 > 2c = 2, whose common value for L♭ = H₃ and x = e is 1 − q³. The route of (H₃) uses this decomposition, with x ∈ W, and never K's pair (L♭, x).
- Rank four: L = H₁ ⊥ H₁ has h(L, L) ⊂ πO_F, so every sublattice has all invariants at least 1; a nondegenerate sublattice of rank three has odd rank, hence a rank-one block of even invariant at least 2, and valuation at least 1 + 1 + 2 = 4 = val(L) − 1 + 1, attained by H₁ ⊥ ⟨l₃ + πl₄⟩ with x′ = l₄. L is π-modular, so it has no rank-one orthogonal summand and every presentation has x′ ∉ L♭′ ⊕ W: no step of the induction of §8.7 reaches it, and its identity is an instance of (H₄), a hypothesis here, not a target.
- If a_n(L) is even, a rank-one block ⟨y⟩ of invariant a_n(L) splits off, L = L₀ ⊥ ⟨y⟩, and val(L₀) = val(L) − a_n(L) < val(L♭): the decrease exists and the step is not needed.
- Difference cycle of a line: for n₁ = 1 the quotient π⁻¹⟨x⟩/⟨x⟩ is a single line, so the sum has one term, with coefficient (−1)·q⁰, and D(⟨x⟩) = ᴸZ(x) − ᴸZ(π⁻¹x), the difference divisor (HSY23a Remark 2.17, p. 13). The weight q^(i(i−1)/2) first differs from 1 at i = 2: for L₁ of rank two the lattice π⁻¹L₁ enters with coefficient +q, and a definition without that weight would change Int(L)^(2) by (q − 1)·Int(π⁻¹L♭ ⊥ O_F·x): for L♭ = diag(u₁(−π₀), u₂(−π₀)) and a unit-norm x the lattice π⁻¹L♭ ⊥ O_F·x is unimodular of rank three, with Int = δ_odd(3) = 1 by §7.7, and the change is q − 1 ≠ 0.
- The primitive identity at L = H₁ ⊥ ⟨u₃⟩ (a = 1, c = 0), from §§7.5a, 7.7 and 8.2: the lattices L′ with H₁ ⊂ L′ ⊂ π⁻¹H₁ are the q + 1 unimodular planes H₁ + O_F·π⁻¹v, v on a line of H₁/πH₁ ≅ 𝔽_q², and the nonintegral π⁻¹H₁. On the geometric side Int(L) = Int(H₁) + (q + 1)·(δ_odd(3) − δ_odd(2)) = (1 − q) + (q + 1) = 2 and each I₂ ⊥ ⟨u₃⟩ ≅ I₃ has Int = 1, so Int(L)^(2) = 2 − (q + 1)·1 + q·0 = 1 − q. On the density side the integral overlattices of L are L, with ∂Pden = 1 − χ(H₁)q = 1 − q, and the q + 1 lattices I₃, with ∂Pden = 1, so ∂Den(L) = 2 and ∂Den(L)^(2) = 2 − (q + 1)·∂Den(I₃) + q·0 = 1 − q. Both equal 1 − q^(2c+1) = 1 − q, the value that HSY23a Proposition 11.2 gives for a > 2c.

*Needs:* §§7.1, 7.4–7.5, 7.5a, 7.6–7.7, 8.1–8.2, 8.4; gap:ramified-hermitian-densities (GeometryOfNumbersAndQuadraticArithmetic §3.2), for the densities in ∂Den(L)^(n₁); GeometryOfNumbersAndQuadraticArithmetic 2.7.3 and §2.9; SchemeKTheoryOperationsPartII §§2.2 and 4.3; gap:nonaffine-formal-filtration-product, for the graded piece Gr²K₀.

### 8.7 Krämer Kudla–Rapoport identity

Prove that Int(L) = ∂Den(L) for every full-rank lattice L of rank n ≤ 3 in the Krämer special Hom space, of either sign, and, for n ≥ 4, for every such L of rank n under the hypothesis that (H_m) of §8.6 holds for 4 ≤ m ≤ n (K Theorem 1.3, p. 4; Theorem 9.7 and proof, pp. 75–76; Corollary 9.8, p. 76; in rank two HSY23b Theorem 1.3, p. 5, and Shi22 Theorem 1.3, p. 4; in rank three HSY23a Theorem 1.2, p. 4). In rank two the route compares the values of §7.5a with ∂Den computed from the primitive densities of §8.2. In rank n ≥ 3 it inducts on val(L♭) and on rank: nonintegral L♭ give 0 = 0 by §§7.4 and 8.2; for x ∉ L♭ ⊕ W the lattice L♭ + O_F·x either has a presentation L♭′ + O_F·x′ with val(L♭′) < val(L♭), covered by the induction, or has odd largest invariant, and is then covered by (H₃) of §8.6 in rank three and by the hypothesis (H_n) in rank n ≥ 4, after removing a unimodular summand by §7.7 and K Lemma 9.1, which leaves a lattice of smaller rank covered by the induction on rank; so the support of Φ_L♭ = Int_L♭ − ∂Den_L♭ lies in L♭ ⊕ W; §8.5 identifies Φ_L♭ with its vertical part; its partial integral vanishes on W_(≤0) by the induction on rank with §7.7 and K Lemma 9.1 and by the nonintegral case, and is constant on W_(≥0) ∖ {0} by §§7.8 and 8.4, hence vanishes. The induction on rank is why rank n needs (H_m) for every m from 4 to n. In rank three (H₃) is HSY23a Theorem 1.2; in rank n ≥ 4 the theorem is conditional on (H_m), 4 ≤ m ≤ n, for which no published proof exists.

**Checks.**

- Int(I_n) = δ_odd(n) by §§7.5a and 7.7, and ∂Den(I_n) = ∂Pden(I_n) = δ_odd(n) by §8.2, since I_n has no proper integral overlattice.
- For a nonintegral L both sides are 0.
- Rank two, χ(V) = 1, L = diag(u₁(−π₀), u₂(−π₀)) with invariants (2, 2): its integral overlattices are L (∂Pden = 1 − q, full type two), the two lattices L + O_F·π⁻¹v with v on the two isotropic lines of the residual form u₁X² + u₂Y² over 𝔽_q (hyperbolic planes of invariants (1, 1), 1 − q each), the q − 1 lattices L + O_F·π⁻¹v with v on its anisotropic lines (type one, 1 each), and the unimodular π⁻¹L and 2q lattices L + O_F·π⁻²v (0 each). So ∂Den(L) = 3(1 − q) + (q − 1) = 2 − 2q, the value of §7.5a at (α, β) = (1, 1). For χ(V) = −1 the residual form is anisotropic, L contributes 1 + q and its q + 1 type-one overlattices 1 each, so ∂Den(L) = 2 + 2q, again §7.5a's value.
- The split plane H₁: ∂Den(H₁) = ∂Pden(H₁) + (q + 1)·δ_odd(2) = 1 − q over its q + 1 unimodular overlattices, equal to Int(H₁) = 1 − q of §7.5a; H₁ is reached by the rank-two comparison and not by the induction (§8.6). H₁ ⊥ H₁ in rank four is reached only through the hypothesis (H₄) of §8.6, so its identity is asserted only under it.

*Needs:* §§7.4, 7.5a, 7.7–7.8, 8.2, 8.4–8.6.

### Examples

For a unimodular lattice the corrected primitive density is 1 in odd rank and 0 in even rank. A full-type-two part contributes 1 − χ(L₂)q, so the two signs give 1 − q and 1 + q. In the split plane H₁ the line generated by l₁ + πl₂ has fundamental invariant 2 while adjoining l₂ gives invariants (1,1); in rank four H₁ ⊥ H₁ has no rank-one orthogonal summand and is reached by no presentation of the induction. In the rank-three example L♭ = ⟨e⟩ ⊥ ⟨ℓ⟩ with norms 1 and π₀, a normal vector of norm −π₀⁻¹ has vertical partial integral 2q·vol(L♭).

### Dependencies

Layer 7; gap:ramified-hermitian-densities; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9, 3.2; GrossZagierAndArithmeticHeights §7.2; SchemeKTheoryOperationsPartII §§2.2 and 4.3, with gap:nonaffine-formal-filtration-product; AnalyticNumberTheoryPartII §5.3g.

## Layer 9: Local AFL geometry and rank reduction

Define the intersection numbers of the arithmetic fundamental lemma on unramified Rapoport–Zink spaces, in the group and semi-Lie versions, prove their finiteness and orbit invariance, normalize the analytic side, compare the two versions through the relative Cayley map, prove local constancy and compact support, and supply the AFL in rank at most three. This layer uses Layers 0–2 and not the density layers.

### 9.1 Group AFL intersection

Define the group intersection number. For n ≥ 2, on N_(n−1) × N_n let Δ be the graph of δ: N_(n−1) → N_n (PELModuliPartII §1.6). For g ∈ U(V_n)(F₀) regular semisimple for the conjugation action of U(V_(n−1)), define Int(g) = χ(N_(n−1) × N_n, O_Δ ⊗^L O_((1×g)Δ)), a finite integer because the intersection is a proper scheme over Spf O_F̆ annihilated by a power of ϖ; g is strongly regular semisimple when it is moreover semisimple for the conjugation action of U(V_n) (Z §3.1, (3.7)–(3.8); Definitions 3.5–3.6). The route uses the unit-norm embedding, the graph intersection and the properness criterion for regular semisimple g.

Its API consists of the following facts:

- The translated graph is (1×g)Δ.
- The intersection retains the derived tensor product and is measured by O_F̆-lengths.
- Strong regularity is regular semisimplicity for U(V_(n−1)) plus semisimplicity for U(V_n).
- For h ∈ U(V_(n−1)), conjugation g ↦ hgh⁻¹ identifies the intersection complexes and preserves Int.

**Checks.**

- A transverse graph intersection gives its length.
- A nontransverse intersection retains its Tor terms in the Euler characteristic.
- Odd n ≥ 3, where V_n has Witt index (n−1)/2: a unipotent g ∈ U(V_n) with a single Jordan block for which the distinguished unit vector u is cyclic (u, gu, …, g^(n−1)u a basis of V_n, which is regular semisimplicity for U(V_(n−1))-conjugation by Z, proof of Lemma 4.3(i)) is not semisimple, so it is outside the strongly regular locus. At n = 3, over the unramified quadratic extension of ℚ₃, the matrix g = ((1,1,−1/2),(0,1,−1),(0,0,1)) of the control Check of §12.10 on the nonsplit space with Gram matrix 3J satisfies gᵗ(3J)g = 3J, the vector u = (1/6)e₁ + e₃ has h(u,u) = 3·(1/6 + 1/6) = 1, and det(u, gu, g²u) = −1.
- Even n ≥ 4: the nonsplit V_n has Witt index n/2 − 1, and U(V_n) has no unipotent element with a single Jordan block. For unitary g the orthogonal of im (g − 1)^k is ker (g − 1)^k, because g* = g⁻¹; with one Jordan block im (g − 1)^(n/2) = ker (g − 1)^(n/2), so this kernel would be totally isotropic of dimension n/2. Instead take g = g₁ ⊕ d on V_n = V′ ⊥ F·l with l anisotropic, g₁ ∈ U(V′) unipotent with one Jordan block on the odd-dimensional V′ and d ∈ F^1 with d ≠ 1: its minimal polynomial (T − 1)^(n−1)(T − d) has degree n, so g has cyclic vectors, among them vectors of norm one (v + l with v ∉ (ker (g₁ − 1))^⊥ and h(v,v) = 1 − h(l,l)), and it is not semisimple. At n = 4, V₄ = (3J) ⊥ ⟨1⟩ has determinant −27 of odd valuation, so it is nonsplit; for g = g₁ ⊕ (−1), with g₁ the matrix above, the vector u = e₃ + l has h(u,u) = 1 and det(u, gu, g²u, g³u) = 8, while for d = 1 the same determinant is 0.
- n = 2: the nonsplit V₂ is anisotropic, so U(V₂) has no unipotent element other than 1 (for a unipotent g ≠ 1 the line ker (g − 1) would be isotropic), every element is semisimple, and regular semisimple and strongly regular elements coincide.

*Needs:* §0.7; PELModuliPartII §§1.4 and 1.6; SchemeKTheoryOperationsPartII §4.3.

### 9.2 Derived fixed locus and semi-Lie intersection

Define the semi-Lie intersection number. For g ∈ U(V_m), let N_m^g be the naive fixed locus and ᴸN_m^g = O_(Γ_g) ⊗^L O_(Δ_(N_m)) its derived class, transported to N_m. For (g,u) ∈ U(V_m) × V_m regular semisimple, define Int(g,u) = χ(N_m, ᴸN_m^g ⊗^L O_(Z(u))), equivalently χ(N_m × N_m, O_(Γ_g) ⊗^L O_(Δ(Z(u)))); it is invariant under simultaneous conjugation, and proper support is part of the regularity theorem (Z §3.1, (3.11)–(3.13) and Remark 3.1). The route applies the projection formula for the diagonal closed immersion and distinguishes the naive fixed scheme from its derived class.

Its API consists of the following facts:

- The naive fixed scheme is only the support of the derived class.
- The formula on N_m × N_m equals the formula on N_m.
- Int(hgh⁻¹, hu) = Int(g,u) for h ∈ U(V_m).
- The Euler functional is additive in supported K-classes on a common proper support; this does not make the special cycle linear in its label.

**Checks.**

- A fixed component contained in Z(u) is evaluated by the derived intersection, not by its length alone.
- A pair (g,u) that is not regular semisimple is not assigned a finite number by this definition.
- Replacing u by a unit multiple does not change Z(u) and so does not change Int(g,u).

*Needs:* §§0.6, 9.1; SchemeKTheoryOperationsPartII §4.7.

### 9.3 AFL orbital-integral normalization

Define the analytic side of the AFL. For the group version let S_n = {γ ∈ GL_n(F) : γγ̄ = 1} with GL_(n−1)(F₀)-conjugation through h ↦ diag(h, 1); for the semi-Lie version use S_m × (F₀^m ⊕ (F₀^m)*) with m = n−1 and GL_m(F₀) acting by conjugation of the block matrix ((γ, u₁), (u₂, 0)) through diag(h, 1). The twisted orbital integral is Orb(γ, f′, s) = ∫ f′(h⁻¹γh)·|det h|^s·η(det h) dh over GL_m(F₀) with vol(GL_m(O_F₀)) = 1, η the quadratic character of F/F₀. The transfer factors are ω(γ) = η̃(det(γ)^(−⌊n/2⌋)·det(γ^i e)_(i=0)^(n−1)) in the group version, e = (0, …, 0, 1)ᵗ, and ω(γ, u′) = η̃(det(γ)^(−⌊(n−1)/2⌋)·det(γ^i u₁)_(i=0)^(n−2)) in the semi-Lie version, where η̃(x) = (−1)^(v_F(x)) is the natural extension of η to F^× for the unramified F (Z §2.3, (2.16)–(2.17), p. 10, which fixes this extension when F/F₀ is unramified); a different extension of η is not allowed. Put Orb(γ, f′) = ω(γ)·Orb(γ, f′, 0) and ∂Orb(γ, f′) = ω(γ)·d/ds|_(s=0) Orb(γ, f′, s) (Z (2.12)–(2.14), p. 10). Prove first that the integral is a finite sum: for γ regular semisimple, that is, with closed GL_m(F₀)-orbit and trivial stabilizer (Z §1.2, pp. 4–5), and every f′ ∈ C_c^∞(S_n(F₀)), the function h ↦ f′(h⁻¹γh) is locally constant with compact support on GL_m(F₀), so Orb(γ, f′, s) is a finite sum of terms c·(±1)·q^(ks) with k ∈ ℤ, a Laurent polynomial in q^s, entire in s; the same holds in the semi-Lie version for regular semisimple pairs and f′ ∈ C_c^∞(S_m(F₀) × F₀^m × (F₀^m)*). The route: the orbit is closed in S_n(F₀), hence locally compact, and the continuous bijection from the σ-compact group GL_m(F₀) onto it is a homeomorphism by the Baire category theorem, so the preimage of supp f′ is compact; the integrand is then right-invariant under an open compact subgroup of {h ∈ GL_m(O_F₀) : η(det h) = 1}, on whose cosets |det h|^s·η(det h) is constant, and a compact set meets finitely many of these cosets. Prove then the conjugation law: for a ∈ GL_m(F₀),

    ω(a⁻¹γa)·Orb(a⁻¹γa, f′, s) = |det a|^(−s)·ω(γ)·Orb(γ, f′, s),
    ∂Orb(a⁻¹γa, f′) = ∂Orb(γ, f′) − log|det a|·Orb(γ, f′),

and the same for the semi-Lie action. Consequently, in every rank, ∂Orb(·, f′) is constant on the orbit of γ when Orb(γ, f′) = 0. When the acting rank m = n−1 is at least 1, the converse holds: a = diag(ϖ, 1, …, 1) ∈ GL_m(F₀) has log|det a| = −log q ≠ 0, so constancy forces Orb(γ, f′) = 0. When m = 0 (n = 1 in either version) the acting group GL₀(F₀) is trivial, every orbit is a point, and invariance holds whatever the value of Orb(γ, f′). Prove that for the unit test function 1_(S_n(O_F₀)) and γ matching an element of U(V_n), V_n the nonsplit space, Orb(γ, 1_(S_n(O_F₀))) = 0, and likewise for the semi-Lie unit function at pairs matching U(V_(n−1)) × V_(n−1), by the Jacquet–Rallis fundamental lemma in Zhang's formulation, under which the unit function transfers to a pair whose component on the nonsplit unitary group is zero (Z Conjecture 2.3, p. 11; supplied by gap:jr-zhang-formulation-fl); hence ∂Orb of the unit function is an orbit invariant on the matching locus of the AFL. The AFL statement for a matching pair is ∂Orb = −Int·log q with q = #k_F₀ (Z Conjecture 3.2 and Conjecture 3.8, p. 14). Matching here is Jacquet–Rallis matching in Zhang's formulation, supplied by gap:jr-zhang-formulation-fl from the formulations of EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5; ordinary endoscopic matching is not used. The route: substitute h ↦ ah in the integral, which multiplies it by |det a|^(−s)·η(det a); since diag(a, 1) fixes e and u₁ ↦ a⁻¹u₁, the determinant in the transfer factor is multiplied by det(a)⁻¹ ∈ F₀^×, on which η̃ is η, so ω is multiplied by η(det a) and the two signs cancel; differentiate at s = 0.

Its API consists of the following facts:

- The orbital integral uses |det h|^s·η(det h) and the Haar measure with vol(GL_m(O_F₀)) = 1.
- For regular semisimple γ (closed orbit, trivial stabilizer) and every f′ ∈ C_c^∞(S_n(F₀)), Orb(γ, f′, s) is a finite sum, a Laurent polynomial in q^s, hence entire, and ∂Orb(γ, f′) is defined; likewise for regular semisimple pairs in the semi-Lie version.
- η̃(x) = (−1)^(v_F(x)); it restricts to η on F₀^× and is trivial on O_F^×, in particular on F^1.
- The conjugation law ∂Orb(a⁻¹γa, f′) = ∂Orb(γ, f′) − log|det a|·Orb(γ, f′) holds for every test function and regular semisimple γ, and similarly in the semi-Lie version.
- ∂Orb(·, f′) is an orbit invariant at γ whenever Orb(γ, f′) = 0, which holds for the unit test functions at every γ matching the nonsplit unitary group. Conversely, for acting rank m = n−1 ≥ 1, orbit invariance at γ implies Orb(γ, f′) = 0; for m = 0 every function is an orbit invariant.
- The AFL statement compares ∂Orb of the unit test function with −Int·log q.
- Under the scalar action γ ↦ ξγ for ξ ∈ F^1 both sides of the group statement are unchanged: the argument of η̃ in ω is multiplied by the unit ξ^(n(n−1)/2 − n⌊n/2⌋), on which η̃ is 1; the unit test function takes the same value at h⁻¹ξγh and h⁻¹γh; and ξ acts trivially on N_n.

**Checks.**

- Rescaling the Haar measure on GL_m(F₀) by c multiplies Orb and ∂Orb by c, which the normalization vol(GL_m(O_F₀)) = 1 excludes.
- Finiteness needs regularity: over F₀ = ℚ₃ with n = 2, γ = ((0,1),(1,0)) has integrand supported on the single shell v(t) = 0 and Orb(γ, 1, s) = 1, and γ = ((−2,1),(−3,2)) on the two shells v(t) = 0, −1, with Orb(γ, 1, s) = 1 − 3^s; both are Laurent polynomials. The identity γ = 1 ∈ S₂ has closed orbit but stabilizer all of GL₁(F₀), so it is not regular: the unit function gives Σ_(k∈ℤ) (−1)^k·3^(−ks), whose terms do not tend to zero in both directions for any s, so the integral converges for no s.
- Conjugation where the zero-order integral does not vanish: over F₀ = ℚ₃ with n = 2, γ = ((0,1),(1,0)) and a = diag(3,1), the unit test function sees only v(t) = 0 for h = diag(t,1) at γ, giving the normalized family 1 (ω(γ) = η̃(1) = 1), and only v(t) = −1 at a⁻¹γa = ((0,1/3),(3,0)), giving the raw integral −3^s and ω = η̃(1/3) = −1, so the normalized family 3^s. The derivatives are 0 and log 3, as the law predicts: 0 − log|3|·1 = log 3. This γ has Orb(γ, 1) = 1 ≠ 0, so it matches the split unitary group and the AFL does not concern it.
- Omitting ω(γ) makes ∂Orb change sign under conjugations with η(det a) = −1 at elements with Orb(γ, f′) = 0, where ω makes it an orbit invariant. For acting rank m ≥ 1, where Orb(γ, f′) ≠ 0 no transfer factor makes ∂Orb an orbit invariant.
- Acting rank zero (boundary case): for n = 1, γ = 1 ∈ S₁ and the unit test function, GL₀(F₀) is trivial and ω(γ) = η̃(1) = 1. Then Orb(γ, 1, s) = 1 for all s, so Orb = 1 and ∂Orb = 0. The orbit is the single point γ, so ∂Orb is an orbit invariant although Orb(γ, 1) ≠ 0; the converse is asserted only for m ≥ 1.
- The extension η̃ is forced: over F₀ = ℚ₃ with n = 2 and γ = ((−2,1),(−3,2)), γ² = 1, the integral shells are v(t) = 0 and −1, the raw unit orbital integral is 1 − 3^s, ω(γ) = η̃(1) = 1 and ∂Orb = −log 3 = −Int·log 3, with Int = (v(1 − 2²) + 1)/2 = 1 by §9.8. If η̃ were replaced by (−1)^(v_F)·χ with χ the order-four character of 𝔽₉^× trivial on 𝔽₃^×, also an extension of η, a norm-one Teichmüller unit ξ has χ(ξ) = −1, so ω(ξγ) = −ω(γ) and ∂Orb(ξγ) = +log 3, while the raw integral and Int are unchanged; the AFL identity would fail at ξγ.
- The logarithm is log q for the residue cardinality q of F₀, not log(q²).

*Needs:* §9.2; EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5; gap:jr-zhang-formulation-fl (EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4); AnalyticNumberTheoryPartII §5.3g.

### 9.4 Relative Cayley graph comparison

Prove the Cayley comparison. Let U(V_n)° be the open subvariety of g′ = (h, u; w*, d) ∈ U(V_n) defined by det(1 − g′) ≠ 0 and 1 − d ≠ 0. For g′ in it put g = h + (1−d)⁻¹·u w* and the relative vector u/((1−d)·√ε), where ε ∈ O_F₀^× is the fixed unit with F = F₀[√ε]; then det(1 − g′) = (1 − d)·det(1 − g), so det(1 − g) ≠ 0. Together with the scalar entry e ∈ 𝔲(1) of the inverse Cayley transform c⁻¹(g′) ∈ 𝔲(V_n), this map is a U(V_(n−1))-equivariant isomorphism of U(V_n)° onto the open subvariety of U(V_(n−1)) × V_(n−1) × 𝔲(1) on which det(1 − g) and det(1 + x′) do not vanish, x′ ∈ 𝔲(V_n) being the block matrix built from c⁻¹(g), the vector and e; in particular the relative Cayley map is birational, and g′ ∈ U(V_n)°(F₀) is regular semisimple for U(V_(n−1)) exactly when its image pair is. For g′ ∈ U(V_n)°(F₀) with 1 − d ∈ O_F^×, the naive pullback of the graph Γ_(g′) along (δ, δ): N_(n−1) × N_(n−1) → N_n × N_n is Γ_g ∩ π₂*Z(u), π₂ the second projection, where Z(u) is also the cycle of the relative vector because (1 − d)·√ε is then a unit. If moreover u ≠ 0, this pullback has the expected codimension, its higher Tor sheaves vanish, so the derived pullback equals the naive one, and Δ ∩^L (1 × g′)Δ = ᴸN_(n−1)^g ⊗^L O_(Z(u)) in K-theory with support on N_(n−1)^g ∩ Z(u); in particular Int(g′) = Int(g,u) for regular semisimple g′. For n ≥ 2 regular semisimplicity of g′ forces u ≠ 0, since the vectors h^i u, 0 ≤ i ≤ n − 2, then form a basis of V_(n−1) (Z §§4.1–4.2; Lemmas 4.1, 4.2, 4.3(i) and 4.4; Proposition 4.6). The geometric comparison does not need det(1 − g′) to be a unit; that condition belongs to the orbital-integral comparison of §9.5. The scalar Cayley map c(x) = −(1−x)(1+x)⁻¹ and its inverse (1+g)(1−g)⁻¹ keep their invertibility domains. The route uses block identities, regular-sequence pullback on Cohen–Macaulay formal schemes and the projection formula; no extension across the points where a denominator vanishes is made.

**Checks.**

- At a block with d = 1 the map is undefined, and the comparison requires 1 − d to be a unit on the integral locus.
- u ≠ 0 is needed: for n = 2 and g′ = diag(h, d) with h, d ∈ F^1 not congruent to 1 modulo ϖ, both 1 − d and det(1 − g′) = (1 − h)(1 − d) are units, while u = w = 0 and g = h. Here N₁ = Spf O_F̆ and h ∈ O_F^× lifts to the canonical lift, so the pullback of Γ_(g′) is all of N₁ × N₁ = Spf O_F̆, of codimension 0 where the codimension 1 of Γ_(g′) in N₂ × N₂ is expected, and Z(0) is the whole space. Such g′ is not regular semisimple, since u₀ and g′u₀ = d·u₀ do not span V₂, and it has no intersection number.
- For x = 0, c(0) = −1, and the inverse (1+g)(1−g)⁻¹ at g = −1 is 0.
- The relative vector carries the factor (√ε)⁻¹. Since the conjugate of √ε is −√ε, omitting it multiplies the norm h(u,u), and every invariant h(g^i u, u), by N(√ε) = −ε, a unit: valuations and integrality are unchanged, so integrality cannot detect the omission. The values themselves change unless ε = −1 (possible when q ≡ 3 mod 4, where (√ε)⁻¹ has norm one and the two pairs lie in one U(V_(n−1))-orbit); for ε ≠ −1 the two pairs have different invariants and hence different matching orbits.

*Needs:* §§0.5, 9.2; SchemeKTheoryOperationsPartII §§3.2 and 4.7.

### 9.5 AFL rank and norm-unit reduction

Prove the reductions between the two versions (Z §§4.3–4.4; Lemma 4.11, Proposition 4.12 and Remark 4.13). In the passage from the semi-Lie version to the group version, for g′ = (h, u; w*, d) ∈ U(V_n)(F₀) as in §9.4 matching γ ∈ S_n(F₀), one may assume that d ∈ O_F and that the characteristic polynomial of g′ lies in O_F[T], as Z does (Z, proof of Proposition 4.12(i), p. 23), because otherwise both sides of the group statement vanish. Matching is conjugacy under GL_(n−1)(F) (Z §2.2, pp. 8–9), so γ has the same characteristic polynomial and the same (n, n) entry d, and neither changes under GL_(n−1)(F₀)-conjugation; if either is not integral, no conjugate h⁻¹γh lies in GL_n(O_F), the unit orbital integral is zero for every s and ∂Orb = 0. On the other side a point of Δ ∩ (1 × g′)Δ is a point δ(x), with p-divisible group X × Ē, fixed by g′, so g′ is an automorphism of X × Ē; then g′ lies in an order of End⁰(X × Ē) ≅ M_n(F), so its characteristic polynomial is integral, and its Ē-component d lies in End_(O_F)(Ē) = O_F; otherwise the intersection is empty and Int(g′) = 0. (a) If q ≥ n+1, the group AFL for S_n is equivalent to the semi-Lie AFL on V_(n−1), on the strongly regular loci. (b) For q ≥ n the group AFL for S_n implies the semi-Lie AFL on V_(n−1). At q = n the converse is asserted only for n ≤ 3: V₁ and V₂ are anisotropic, so U(V_(n−1))(F₀) is compact and each of its elements has integral characteristic polynomial. A ξ ∈ F^1 with det(1 − ξg′) a unit exists because, the eigenvalues of g′ being integral, at most n of the q + 1 residues of F^1 are excluded; the condition depends only on the residue of ξ, so ξ can be moved in its residue class to make ξd ≠ 1, and then ξg′ lies in U(V_n)° of §9.4. The element g of §9.4 attached to ξg′ lies in U(V_(n−1))(F₀), so det(1 − g) ∈ O_F, and the unit det(1 − ξg′) = (1 − ξd)·det(1 − g) gives v(1 − ξd) ≤ 0; since d ∈ O_F, also v(1 − ξd) ≥ 0, so 1 − ξd ∈ O_F^×. For n ≥ 4 the space V_(n−1) is isotropic, det(1 − g) need not be integral, and the n eigenvalue conditions and the condition on d can exclude all q + 1 = n + 1 residues of F^1; Z's deduction of 1 − d ∈ O_F^× from the integrality of det(1 − g) (Z, proof of Proposition 4.12(i), p. 23) does not cover this case, and the converse at q = n ≥ 4 is not a target here. (c) The semi-Lie AFL in rank m for pairs (g,u) with h(u,u) a unit follows from the group AFL in rank m by the unit-vector reduction, with no hypothesis on the residue cardinality. The route transports matching and transfer factors through §9.4 and compares the unit test functions and unit-norm intersections.

**Checks.**

- At q ≥ n+1 there are q+1 ≥ n+2 residues of F^1, more than the n+1 excluded values, so ξ exists.
- At q = n the count gives n+1 residues against n+1 excluded values, so the elementary argument can fail.
- n = q = 3 is not affected: V₂ is anisotropic, at most 3 of the 4 residues of F^1 make det(1 − ξg′) a nonunit, and for the remaining ξ the factor 1 − ξd is a unit because det(1 − g) and d are integral.
- The integrality of d is needed (negative control). In the nonsplit V₃ = ⟨e, f⟩ ⊥ ⟨a⟩ with h(e,e) = h(f,f) = 0, h(e,f) = 1 and h(a,a) of odd valuation, take u₀ = e + f/2, of norm 1, and g′ = diag(ϖ⁻¹, ϖ, 1) on (e, f, a), which is unitary because ϖ ∈ F₀. Then d = h(g′u₀, u₀) = (ϖ⁻¹ + ϖ)/2 has valuation −1; for ξ ∈ F^1 with v(1 − ξ) = 1 the factors of det(1 − ξg′) = (1 − ξϖ⁻¹)(1 − ξϖ)(1 − ξ) have valuations −1, 0, 1, so it is a unit, while v(1 − ξd) = −1 and v(det(1 − g)) = 1. Integrality of det(1 − g) alone does not make 1 − ξd a unit; here d and the characteristic polynomial of g′ are not integral, so both sides of the group statement vanish and the case is excluded before ξ is chosen. (This g′ is not regular semisimple, since u₀, g′u₀ and g′²u₀ lie in ⟨e, f⟩; it tests only the implication.)
- The norm-unit reduction uses Z(u) ≅ N_(m−1) for unit-norm u and involves no scalar ξ, which is why it holds at every q.

*Needs:* §§0.8, 9.1, 9.3–9.4; PELModuliPartII §§1.3 and 1.6; LubinTateFormalModulesAndQuasiCanonicalLifts §6.1 (the O_F-linear endomorphisms of the rank-one source form O_F); EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5; gap:jr-zhang-formulation-fl.

### 9.6 Local constancy and compact support

Prove that for fixed g the function u ↦ Int(g,u) is locally constant on the regular semisimple locus in every dimension, by proper vertex support and the higher local modularity of §2.7; that the support of Int modulo conjugation lies in a finite union of compact lattice regions; and that (g,u) ↦ Int(g,u) is jointly locally constant on the strongly regular locus in semi-Lie dimension m when q ≥ m, through the rank-(m+1) graph construction (Z Proposition 5.2; Theorem 5.5). In the rank-raising construction the scalar avoidance is applied to the original g of rank m before lifting, so q+1 > m suffices. The differential of the invariant map is surjective at (g,u) because δ ↦ (h(δ, (−x)^j u))_j is an F-linear isomorphism by cyclicity of u; one then projects to the eigenspaces of conjugation, with no assumption that F[x] is étale. The route reduces fixed-g classes to proper strata and uses §2.7 instead of a global product theorem for the codimension filtration.

**Checks.**

- In semi-Lie dimension m = 1, Int(g,u) depends only on val h(u,u) and is constant on each valuation shell.
- At q ≥ m there are q+1 > m residues of F^1 and the scalar avoidance for g of rank m succeeds; for q < m the count gives no scalar and joint constancy is not asserted by this route.
- The cyclic-vector map δ ↦ (h(δ, (−x)^j u))_j is an isomorphism whenever u is cyclic for x, for instance for a regular nilpotent x with cyclic u, where F[x] = F[T]/(T^m) is not étale; the argument therefore does not need semisimplicity of x.

*Needs:* §§0.4, 2.7, 9.2, 9.4.

### 9.7 Maximal-order AFL input

Prove that for an unramified quadratic extension of odd residue characteristic and semi-Lie dimension m = n−1, the semi-Lie AFL holds for strongly regular (g,u) with O_F[g] a maximal order in F[g], under p > n = m+1 (Z Proposition 3.9, p. 14). The route is Zhang's, through Mih16 Corollary 9.9 (pp. 39–40), which is a reduction statement with its own hypotheses: g regular semisimple and artinian, that is, with artinian naive intersection (Mih16 Definition 1.7, p. 4), and a conjugation-equivariant embedding O_A ⊂ O_F[g] of the maximal order of an étale algebra A, here A = F[g] with O_A = O_F[g] by maximality. Under these hypotheses both sides vanish when the decomposition V = ∏ V_i by the idempotents of A has more than one odd factor (its part (1)); otherwise the identity follows from the relative AFL for the unique odd factor over A_(0,i₀) together with the fundamental lemma for the other factors (its parts (2)–(3)). Since u is cyclic for g, every V_i is one-dimensional over A_i, so the remaining inputs are rank-one statements, the relative identity being the case of semi-Lie dimension one over the local field A_(0,i₀); the artinian hypothesis is checked in the maximal-order case through Mihatsch's description of the fixed locus Z(O_A) (Mih16 Theorem 1.12, p. 5). The bound p > m+1 is kept, and the global comparison of §14.3 enlarges its exceptional set rather than weakening it.

**Checks.**

- In semi-Lie dimension m the bound is p > m+1, not p ≥ m.
- If O_F[g] is not maximal the statement does not apply.
- For m = 1 the statement is the rank-one case, where both sides are computed by the lifting length of §0.9 and the unit orbital integral.

*Needs:* §§0.9, 9.2–9.3; EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5; gap:jr-zhang-formulation-fl.

### 9.8 Low-rank AFL input

Prove that for a finite extension F₀ of ℚ_p, p odd, with q = #k_F₀, and the unramified quadratic extension F of F₀, the group AFL holds in rank n ≤ 3: for regular semisimple γ ∈ S_n(F₀) matching g ∈ U(V_n)(F₀), ∂Orb(γ, 1_(S_n(O_F₀))) = −Int(g)·log q with the transfer factor of §9.3 included (Z Conjecture 3.2(a), whose strongly regular case is Conjecture 3.8(a)); and that, with §9.5(b), which applies because q ≥ p ≥ 3 ≥ n, the semi-Lie AFL on V_(n−1) follows for n ≤ 3. The case F₀ = ℚ_p, where q = p, is the base of the induction of §14.5. For n = 1 the statement is empty: the graph of §9.1 needs n ≥ 2, the nonsplit V₁ has no vector of norm one (§0.9), and every γ ∈ S₁(F₀) = F^1 has Orb(γ, 1_(S₁(O_F₀))) = 1 ≠ 0, since the acting group GL₀(F₀) is trivial and ω(γ) = η̃(1) = 1 (§9.3), so no γ matches the nonsplit side. The cases n = 2 and n = 3 are Zhang's explicit computations of both sides, made over an arbitrary finite extension of ℚ_p with p odd (Zha12 §2.2, p. 206, for the setting; Theorem 2.10, p. 211, and Theorem 5.5, p. 250, for his Conjecture 2.9, p. 210); in rank at most three every regular semisimple g has an artinian intersection, which is why the computation is possible there (Zha12 §2.2, p. 210; Mih16 §6, p. 29). The route translates Zhang's identity, written with his sign ω′(γ) and his orbital-integral normalization, into the normalization of Z Conjecture 3.2(a) with the transfer factor ω(γ) of §9.3 and the factor −log q; for n = 2 both sides reduce to lifting along the canonical lift, and for n = 3 to the decomposition of special cycles on N₂ into quasi-canonical cycles and their lifting lengths, which are §§1.3–1.4 here and GrossZagierAndArithmeticHeights §7.2. Kudla–Rapoport prove that decomposition over ℚ_p only; §1.3 carries it out over F₀, as Zhang's n = 3 computation requires (Zha12 Remark 11, p. 245). Finiteness of Int(g) over every F₀ is §9.1; in rank at most three it is also the artinian property just cited.

**Checks.**

- n = 2: both sides equal (v(1 − dd̄) + 1)/2 up to the factor −log q, by Gross's canonical lifting (Zha12 Theorem 2.10); at v(1 − dd̄) = 1 and 3 the intersection numbers are 1 and 2 and ∂Orb/log q = −1 and −2, the same values as the semi-Lie dimension-one formula (a+1)/2 of §0.9 at a = 1 and 3.
- A base field other than ℚ_p: for F₀ the unramified quadratic extension of ℚ₃, q = 9, n = 2 and γ = ((−4,1),(−15,4)), γ² = 1 and v(1 − 4²) = v(−15) = 1, so Int(g) = 1; for h = diag(t,1) the integral shells are v(t) = 0 and −1, the raw unit orbital integral is 1 − 9^s, ω(γ) = η̃(1) = 1 and ∂Orb = −log 9 = −Int·log q. Writing log p = log 3 in place of log q would be off by the residue degree 2.
- Rank three is the limit: Zhang's computation uses that the diagonal and its g-translate meet in an artinian scheme for every regular g, which holds only for n ≤ 3 (Zha12 §2.2, p. 210); for n = 4 a regular semisimple g can have a non-artinian intersection, and this target says nothing there.
- The passage to the semi-Lie version uses only §9.5(b), valid for q ≥ n: q ≥ p ≥ 3 ≥ n for every F₀. Equality q = n = 3 holds exactly when p = 3, the residue degree of F₀ over ℚ₃ is one and n = 3, whatever the ramification index. Examples are F₀ = ℚ₃, and the totally ramified F₀ = ℚ₃(√3) (Eisenstein polynomial T² − 3, ramification index 2, residue degree 1, so q = 3 although [F₀ : ℚ₃] = 2). In every such case the chain reads 3 ≥ 3 ≥ 3 ≥ 3, the implication from S₃ to V₂ holds, and the converse at q = n is not used.

*Needs:* §§1.3–1.4, 9.1, 9.3, 9.5; GrossZagierAndArithmeticHeights §7.2; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.1–6.2; gap:jr-zhang-formulation-fl.

### Examples

The Cayley map is undefined at a block with d = 1, so the graph comparison requires a unit denominator on the integral locus, and it requires a nonzero relative vector, which regular semisimplicity provides for n ≥ 2. For a unit-norm u the special cycle is the lower-rank Rapoport–Zink space and the norm-unit reduction needs no residue bound. In semi-Lie dimension m the maximal-order input needs p > m+1. At q = n the n eigenvalue residues and the residue of d can exhaust the q+1 norm-one residues. Conjugating γ = ((0,1),(1,0)) over ℚ₃ by diag(3,1) changes ∂Orb of the unit function from 0 to log 3 because Orb(γ, 1) = 1 ≠ 0 there; at elements matching the nonsplit group the zero-order integral vanishes and ∂Orb is an orbit invariant. Over the unramified quadratic extension of ℚ₃ the rank-two AFL at v(1 − dd̄) = 1 reads −log 9 = −1·log q.

### Dependencies

Layers 0–2; PELModuliPartII §§1.4 and 1.6; SchemeKTheoryOperationsPartII §§3.2, 4.3 and 4.7; GrossZagierAndArithmeticHeights §7.2; LubinTateFormalModulesAndQuasiCanonicalLifts §§6.1–6.2; EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5; gap:jr-zhang-formulation-fl; AnalyticNumberTheoryPartII §5.3g.

## Layer 10: Global special cycles and local degrees

Construct the global special cycles on the RSZ models of PELModuliPartII §§7.2 and 7.10, their K-theory classes on smooth proper hyperspecial models, their formal uniformization by local special cycles, and the local arithmetic degrees with their residue logarithms and reflex normalization.

### 10.1 Global unitary special cycles

Construct the global special cycles. For a CM extension F/F₀, signature (n−1,1) at φ₀, the PEL datum, polarization lattice and neat level K of PELModuliPartII §§6.1, 6.7, 7.2 and 7.10, a hermitian matrix T ∈ Herm_r(F) and a K-invariant open compact subset U ⊂ V(𝔸_(F₀,f))^r, let Z(T,1_U) on the canonical model over E classify (A₀, A, x₁, …, x_r) with x_i ∈ Hom_(O_F)(A₀, A) ⊗ ℚ O_F-linear quasi-homomorphisms whose Gram matrix (λ₀⁻¹ ∘ x_j^∨ ∘ λ ∘ x_i), with (i,j) entry h(x_i, x_j), is T and whose rational Tate class (x_i)_* lies in η(U) for the level structure η; objects are taken up to the O_F-linear quasi-isogenies of the generic moduli problem, which act on the labels (LL1 Definition 5.3 and Lemma 5.4, pp. 26–27). Actual homomorphisms are not required: under principal polarizations their norms lie in O_F₀, while U may contain labels with denominators. On an integral model the cycle is defined by a moduli problem only for admissible data. Over O_(E,(ν)) for ν above p, on the semi-global model of PELModuliPartII §7.2, call 1_U v-admissible at a place v of F₀ above p that is nonsplit in F if its v-component is U_v = Λ_v^r; when this holds at every such v, Z(T,1_U) classifies tuples x ∈ (Hom_(O_F)(A₀, A) ⊗ ℤ_(p))^r, denominators prime to p allowed and none at p, with Gram matrix T ∈ Herm_r(O_(F,(p))), prime-to-p Tate label in U^p and the prescribed étale label at the split places above p, objects being taken up to prime-to-p quasi-isogenies (LZ §§13.2–13.3, p. 81; the p-basic condition of LL1 Definition 6.5, p. 30). A Schwartz function is inert-admissible if it is v-admissible at every place v inert in F. Over O_E[1/d], on the localized model of PELModuliPartII §§7.1 and 7.6, for φ = 1_(Λ^d) ⊗ φ_d with Λ^d = ∏_(v∤d) Λ_v° the self-dual lattices away from d and φ_d K-invariant at d, the divisor Z(ξ, φ) = Σ_μ φ_d(μ)·Z(ξ, μ) is built from the moduli problems Z(ξ, μ) of labels u ∈ Hom_(O_F)(A₀, A) ⊗ ℤ[1/d] with h(u,u) = ξ and level class μ at d, denominators allowed exactly at d; Z(ξ, μ) is finite unramified over the model, étale-locally Cartier and flat over O_E[1/d] (Z Definition 7.2, Proposition 7.3 and (7.2), pp. 31–32). On the global model of PELModuliPartII §7.10, Z(T,φ) is the T-summand of the fibre product of the Zariski closures of the generic cycles Z(t_i, φ_i), t_i the diagonal entries of T, and for inert-admissible φ its base change to O_(E,(ν)) above an inert prime is the semi-global moduli cycle (LZ §§14.3 and 14.5, pp. 85–86). For a K-invariant Schwartz function φ on V(𝔸_(F₀,f))^r with values in a coefficient field C ⊂ ℂ (C = ℚ for rational φ), whose finitely many nonzero values c have K-invariant open compact level sets φ⁻¹(c), define Z(T,φ) = Σ_c c·Z(T,1_(φ⁻¹(c))) as a cycle with C-coefficients; it is the linear extension of the characteristic-function cycles, not the moduli problem of the support of φ (LL1 §8, pp. 37–38). For nonsingular positive definite T the forgetful map of the generic cycle and of the admissible semi-global cycle to its model is finite unramified (LL1 Lemma 5.4(1); LZ §13.3); for r = 1 the positive-norm cycle is étale-locally Cartier and flat under the RSZ hypotheses. A quasi-isogeny (ϕ₀, ϕ) of moduli pairs with common polarization similitude (prime to p on the semi-global model) transports x to ϕ ∘ x ∘ (ϕ₀^r)⁻¹ and its Tate label by the same conjugation (LZ §§11.1–11.4, pp. 73–76; §13.3, p. 81; Z §§7.1–7.3; LL1 Lemma 5.2, Definition 5.3 and Lemma 5.4, pp. 26–27). The route constructs the quasi-homomorphism stack with Tate-level labels on the generic fibre, the Hom ⊗ ℤ_(p) stack for admissible data on the semi-global model, and applies §0.2 locally; on the semi-global model, unramifiedness over the points of characteristic p comes from the Grothendieck–Messing lifting criterion for homomorphisms of abelian schemes (AbelianSchemesAndArithmeticModuli §A4.7), under which a label lifts along a nilpotent divided-power thickening in at most one way, and the lifting locus is closed.

Its API consists of the following facts:

- A point of Z(T,1_U) on the generic model includes the tuple of O_F-linear quasi-homomorphisms with its Gram and level conditions; on the semi-global model at p, for admissible U, the tuple lies in Hom ⊗ ℤ_(p).
- Z(T, ·) is C-linear: Z(T,1_(U′ ⊔ U″)) = Z(T,1_(U′)) + Z(T,1_(U″)) for disjoint K-invariant open compact U′, U″, as moduli spaces, and Z(T, cφ + φ′) = c·Z(T,φ) + Z(T,φ′) as cycles.
- Quasi-isogenies (ϕ₀, ϕ) of the moduli problem (prime to p on the semi-global model) transport the tuple by x ↦ ϕ ∘ x ∘ (ϕ₀^r)⁻¹, with the corresponding Tate-level transport.
- For nonsingular positive definite T the forgetful map is finite unramified, which is weaker than finite étale over the arithmetic base; on an integral model this is asserted for admissible data.
- Pulling back the abelian schemes, the tuple and the level label identifies the special-cycle functor over a new base, with the Gram matrix preserved.

**Checks.**

- A Gram matrix with a negative definite part has no generic cycle in the positive-definite signature.
- Changing the tuple by x′_i = Σ_j x_j·a_(ji), a ∈ GL_r(O_F), replaces T by a^t·T·ā, because h is linear in its first variable: for T = I₂ and a with a₁₁ = a₂₂ = 1, a₁₂ = b, a₂₁ = 0, where b̄ = −b ≠ 0, direct substitution gives the off-diagonal entries h(x′₁, x′₂) = b̄ = −b and h(x′₂, x′₁) = b, and h(x′₂, x′₂) = 1 − b², as a^t·T·ā does, while ā^t·T·a would put b at (1,2) and −b at (2,1).
- Weights are not supports: Z(T, 2·1_U) = 2·Z(T,1_U), while 2·1_U and 1_U have the same support.
- Labels are rational: over F₀ = ℚ, at a point where A ≅ A₀ × B with the product principal polarization and x the inclusion of the first factor, h(x,x) = 1 and the quasi-homomorphism x/3 has norm 1/9. For a small K-invariant compact open U ∋ x/3 whose 3-component avoids the integral Tate lattice, the generic cycle Z(1/9, 1_U) contains this point, whereas a functor of actual homomorphisms would be empty, since their norms lie in ℤ. On the semi-global model at p ≠ 3 the denominator 3 is allowed in Hom ⊗ ℤ_(p); at p = 3 with 3 nonsplit in F, admissibility forces U_3 = Λ_3 and excludes x/3.
- With ϕ₀ = id the transport is postcomposition x ↦ ϕ ∘ x.

*Needs:* §0.2; PELModuli §§M1.3, M3.8; PELModuliPartII §§6.1, 6.7, 7.1–7.2, 7.6 and 7.10; AbelianSchemesAndArithmeticModuli §A4.7.

### 10.2 Integral cycle K-classes

Construct the K-classes. On the smooth proper hyperspecial model of LL1 §8, for a factorizable characteristic Schwartz function φ = ⊗_(j=1)^r φ_j that is basic at p and a nonsingular T with diagonal entries t_j, define the T-supported summand of O_(Z(t₁,φ₁)) ⊗^L ⋯ ⊗^L O_(Z(t_r,φ_r)). It lies in F^r K₀^Z, extends the generic codimension-r cycle and is extended linearly in φ after the permitted shrinking of level (LL1 §8, (8.3) and footnote 17, pp. 37–38). The route uses the Gram-matrix component decomposition and the rational multiplicativity of the codimension filtration on regular schemes; it does not assert the same result for arbitrary ramified regular models or use a formal affine product theorem.

Its API consists of the following facts:

- The T-supported summand retains the off-diagonal Hom pairings.
- The construction extends linearly from characteristic functions.
- The class restricts on the generic fibre to the special-cycle class.
- For a permitted finite étale change of level, flat pullback preserves the T-supported summand and its filtration.

**Checks.**

- For r = 1 the class is the Cartier structure class [O_(Z(t,φ))].
- The tensor product has r factors, not one per ambient dimension.
- Two matrices T with the same diagonal and different off-diagonal entries give different summands.

*Needs:* §10.1; SchemeKTheoryOperations §§6.12, 7.7; PELModuli §M6.1.

### 10.3 Formal special-cycle uniformization

Prove that at an admissible nonsplit place v the formal completion of a global special cycle along its supersingular locus is the weighted orbit sum of the local Rapoport–Zink cycles Z(x) times the away-from-v level cosets, indexed by the nearby global hermitian space and the tuples with Gram matrix T, and that derived K-classes pull back to the local derived tensor products with finite multiplicities and automorphism and level weights retained; this includes the r-tuples of Li–Liu (LZ §13.1, (13.1.0.1), pp. 80–81, with the semi-global cycles of §13.3, p. 81, and the proof of Theorem 13.6.1, pp. 83–84; LL1 §8, (8.2)–(8.3), pp. 37–38). The route applies the basic-locus uniformization of PELModuliPartII §§9.3, 9.5–9.7 and 9.9, with the partition of the completion over the CM factor of PELModuliPartII §9.8, identifies Hom labels and stabilizer quotients, and pulls back Cartier complexes; at exotic places, on the exotic integral model of PELModuliPartII §7.3, it uses §6.9.

**Checks.**

- At a place v split in F the statement is not asserted, and for a nonsingular T of size n it is not needed: n special homomorphisms with nonsingular Gram matrix T give an O_F-linear quasi-isogeny A₀ⁿ → A, while in characteristic p_v the p-divisible groups of A₀ⁿ and of A at the place of F above v through which φ₀ passes have dimensions that differ by one (for F₀ = ℚ: n and 0 at the two places above p for A₀ⁿ, n−1 and 1 for A), so Z(T) has empty fibre at v. The basic locus at v is not empty: for n = 2, F = ℚ(i) and p ≡ 1 mod 4, A = E × E with E supersingular, i acting by ((0, −1), (1, 0)) and the product polarization (whose Rosati involution, the transpose, sends i to −i) has signature (1, 1), and with A₀ the ordinary reduction of y² = x³ − x it is a supersingular point; so the vacuity at split places comes from the cycle, not from the basic locus.
- The automorphism weights are those of the stabilizer quotient; dropping them overcounts orbits with nontrivial stabilizers.
- At an exotic place the labels are compared through the scaled form of §6.9, without a valuation shift.

*Needs:* §§0.6, 6.9, 10.2; PELModuliPartII §§7.3, 9.3 and 9.5–9.9.

### 10.4 Local arithmetic degrees

Define the local arithmetic degree. For a nonsingular T whose special cycle is supported in the special fibre at v₀, let Int_(T,v₀) be the sum over the places ν | v₀ of the reflex field E of the finite derived Euler characteristics times log q_ν, divided by [E : F₀]; at almost self-dual level state whether auxiliary cycles are used, and divide their pullback degrees by deg π₁ = q+1. The global finite degree Int_T is the sum of the local degrees; it is not automatically the naive arithmetic Chow degree of the Y-cycles (LZ §13.5, p. 83; §14.4, pp. 85–86).

Its API consists of the following facts:

- Each place ν contributes with its own log q_ν.
- The reflex normalization is division by [E : F₀].
- Auxiliary pullbacks carry the finite flat degree correction q+1.
- The local degree is additive in the supported derived K-class on a fixed proper special-fibre support.

**Checks.**

- One reduced rational residue point at ν contributes log q_ν to the numerator.
- A residue extension of degree f multiplies the logarithm by f: log(q^f) = f·log q.
- The AFL pairing's denominator [E : F] is a different convention and is not substituted here.

*Needs:* §§4.2, 10.3; SchemeKTheoryOperationsPartII §4.2.

### Examples

A rank-one integral class is the Cartier structure class. For a tuple of rank r the derived tensor product has r factors even when the ambient dimension is larger. A rational residue point over a degree-f extension has finite degree f·log q, and passing from the comparison cover to the almost self-dual auxiliary degree divides by q+1.

### Dependencies

Layers 0, 4 and 6; PELModuli §§M1.3, M3.8, M6.1; PELModuliPartII §§6.1, 6.7, 7.1–7.3, 7.6, 7.10, 9.3 and 9.5–9.9; AbelianSchemesAndArithmeticModuli §A4.7; SchemeKTheoryOperations §§6.12, 7.7; SchemeKTheoryOperationsPartII §4.2.

## Layer 11: Fat CM and derived Hecke cycles

Define the possibly nonmaximal CM order of a characteristic polynomial, the fat CM moduli and their derived Hecke realization. Prove finite unramified forgetfulness, properness, étaleness at good orders, the characteristic-polynomial decomposition and the formal orbit uniformization, and realize the derived class as a proper one-cycle through the dimension filtration, without asserting that the support has dimension one.

### 11.1 CM order and fat CM moduli

Construct the fat CM moduli. Let α ∈ O_F[1/d][T] be monic of degree n, irreducible over F, and conjugate self-reciprocal: α(0) ≠ 0 and α(T) = ᾱ(0)⁻¹·Tⁿ·ᾱ(T⁻¹), where ᾱ is the coefficientwise Galois conjugate, which forces α(0)·ᾱ(0) = 1 (Z §2.2, (2.11), p. 9; §7.4, p. 33). Its coefficients lie in O_F[1/d], not necessarily in O_F. Require F′ = F[T]/(α) to be a CM field. Put R_α = O_F[1/d][T]/(α), not necessarily maximal. The fat CM space CM(α) classifies the unitary PEL objects of §10.1 with an R_α-action through an endomorphism compatible with the Rosati involution and with the twisted level condition; it may have positive-dimensional vertical fibres (Z §7.4, Definitions 7.6 and 7.8). The route constructs the endomorphism and level moduli functor and imposes the order relations without normalizing the order.

Its API consists of the following facts:

- The order R_α and its nonmaximal localizations are kept.
- The endomorphism is Rosati-unitary with the prescribed twisted level.
- Étaleness over the base is asserted only away from the nonmaximal-order places and the excluded set.
- Base change transports the R_α-action and the level, preserves the characteristic-polynomial condition, and does not enlarge R_α to its normalization.

**Checks.**

- If R_(α,v) is a proper suborder of O_(F′,v), CM(α) asks only for an R_(α,v)-action; imposing all of O_(F′,v) defines a smaller moduli problem.
- Irreducibility of α alone does not make F′ a CM field; the CM condition is a separate hypothesis.
- A vertical fibre of CM(α) can have positive dimension.
- Conjugate versus ordinary reciprocity: take F = ℚ(i), n = 1 and the Rosati-unitary scalar i (i·ī = 1). Its F-characteristic polynomial is α = T − i, irreducible, with F[T]/(α) = F a CM field. Here ᾱ(0) = i and i⁻¹·T·ᾱ(T⁻¹) = −i(1 + iT) = T − i, so α is conjugate self-reciprocal. Its ordinary monic reciprocal T·α(T⁻¹)/α(0) is T + i ≠ α. The ℚ-characteristic polynomial T² + 1 is self-reciprocal in the ordinary sense (Z Remark 7.14, p. 36). Requiring ordinary self-reciprocity of the F-polynomial would wrongly exclude α.

*Needs:* §10.1; PELModuli §M1.3.

### 11.2 Fat CM finiteness and properness

Prove that the forgetful map from CM(α) to the unitary model is finite unramified, that CM(α) is proper over the arithmetic base, and that it is finite étale over the base outside the excluded set and the places where R_α is not maximal (Z Proposition 7.9). Finiteness over the ambient model does not give finiteness over the base at bad orders. The route uses rigidity of endomorphisms, the valuative criterion and the deformation calculation at maximal orders.

**Checks.**

- At a place where R_α is maximal and the model is good, CM(α) is finite étale there.
- At a nonmaximal place a vertical component can occur, so CM(α) need not be finite over the base.
- Properness uses the valuative criterion for CM abelian varieties, which have potentially good reduction.

*Needs:* §§10.1, 11.1; PELModuliPartII §6.6.

### 11.3 Hecke fixed loci and characteristic decomposition

Construct the derived CM class. For an admissible Hecke double coset KgK let Hk → M × M be the finite Hecke correspondence, with finite étale projections under the stated level hypotheses. The endomorphism at a fixed point has an F-characteristic polynomial char_F that is conjugate self-reciprocal in the sense of §11.1 and has coefficients in O_F[1/d] (Z Lemma 7.13, p. 36); its ℚ-characteristic polynomial is self-reciprocal in the ordinary sense (Z Remark 7.14, p. 36). char_F is independent of the auxiliary prime ℓ and locally constant, and its α-component is open and closed. Define the derived CM class as the α-component of O_(Hk) ⊗^L O_Δ (Z Lemmas 7.10–7.15, §7.5). The route uses the trace and Tate-module characteristic polynomial, decomposes the fixed locus, and takes the supported graph–diagonal tensor product.

Its API consists of the following facts:

- The characteristic polynomial is independent of the auxiliary prime ℓ.
- The fixed α-component is open and closed.
- The derived class is the derived Hecke–diagonal intersection on that component.
- The derived class restricts to each open and closed characteristic-polynomial component compatibly with permitted finite étale changes of level.

**Checks.**

- Changing ℓ cannot change α.
- A different conjugate self-reciprocal α′ labels a disjoint component.
- A nontransverse fixed locus retains its derived excess terms.

*Needs:* §§11.1–11.2; SchemeKTheoryOperationsPartII §1.7; PELModuli §§M1.13, M6.1; PELModuliPartII §8.5.

### 11.4 Virtual one-cycle from derived CM

Prove that the derived CM class lies in the filtration F₁K′₀ of its proper support and therefore maps through Gr₁G₀ ⊗ ℚ ≅ CH₁ ⊗ ℚ to a proper rational one-cycle; this is virtual dimension one, while the naive fat CM support can have larger vertical dimension. Pairing with arithmetic divisors uses proper pushforward and the graded projection (Z §7.6; §9.1). The route uses the dimension filtration on the finite Hecke correspondence over the regular arithmetic model and its compatibility with finite pushforward, then rational Riemann–Roch; no formal affine product theorem is used.

**Checks.**

- A transverse fixed point contributes its ordinary class, a horizontal one-cycle.
- A two-dimensional vertical support component still gives a one-cycle class in Gr₁.
- The map Gr₁G₀ ⊗ ℚ → CH₁ ⊗ ℚ sends [O_C] for an integral curve C to [C]; its target is the proper one-cycle group of ArakelovGeometryAndAbelianHeights §1.10 after the vertical rational-equivalence quotient.

*Needs:* §§11.2–11.3; SchemeKTheoryOperations §§6.12, 7.7; ArakelovGeometryAndAbelianHeights §1.10.

### 11.5 Formal Hecke and CM uniformization

Prove that after basic uniformization at a good inert v the formal Hecke correspondence decomposes over rational δ and away-from-v cosets with h⁻¹δh ∈ KgK; the naive CM cycle gives the local fixed schemes N^δ and the derived CM class gives the graph–diagonal classes ᴸN^δ of §9.2; the α-condition restricts the characteristic polynomial in every summand (Z §7.7, Proposition 7.16; §7.8, Proposition 7.17). The route identifies the Hecke action on the uniformization quotient and applies graph base change with proper supported projection.

**Checks.**

- At a good split place v the decomposition is not asserted and not needed, although the basic locus at v is not empty (§10.3): a point of the CM cycle on a special divisor of norm ξ ≠ 0 carries u ≠ 0 and δ with irreducible characteristic polynomial α, so u, δu, …, δ^(n−1)u are F-linearly independent with positive definite Gram matrix and give an O_F-linear quasi-isogeny A₀ⁿ → A, which the dimension count of §10.3 excludes; so the two supports do not meet in the fibre at v, as §12.10 states.
- Summands with characteristic polynomial different from α do not occur.
- The derived local class, not the naive fixed scheme, appears in each summand.

*Needs:* §§9.2, 10.3, 11.3; PELModuliPartII §9.7.

### Examples

If the α-order is nonmaximal at v, replacing it by the maximal order can remove a vertical fat component, so it is not a change of notation. A derived CM support can have vertical dimension greater than one while its projected virtual cycle lies in CH₁. A transverse Hecke fixed point has its ordinary class; a nontransverse one retains Tor.

### Dependencies

Layers 9–10; PELModuli §§M1.3, M1.13, M6.1; PELModuliPartII §§6.6, 8.5 and 9.7; SchemeKTheoryOperations §§6.12, 7.7; SchemeKTheoryOperationsPartII §1.7; ArakelovGeometryAndAbelianHeights §1.10.

## Layer 12: Modular divisors, Green functions and CM pairings

Construct the Chow-valued and arithmetic generating series of special divisors, with their automorphic-line constant terms, complex orbit descriptions and Green functions in a fixed normalization; over ℚ and for n ≥ 3 construct the automorphic Green functions as regularized theta lifts and the unitary Borcherds products with their integral divisors; over every totally real field prove the Chow-valued modularity of Kudla divisors on GSpin Shimura varieties, over ℚ through orthogonal Borcherds products and Borcherds' obstruction criterion, and pull it back to the unitary Shimura varieties; prove the modularity of the series in the stated scope; pair them with the proper derived CM one-cycle; and compute the finite inert and archimedean contributions as orbit sums.

### 12.1 Chow-valued unitary divisor series

Construct the divisor series. On the canonical model M of the unitary Shimura variety over the reflex field E, let ω be the automorphic line bundle: its fibre at a complex point is the tautological negative line z ⊂ V(ℂ), and it is constructed algebraically from the Hodge filtration of the universal pair (A₀, A), with the Petersson metric induced by the hermitian form. Put Z(0,φ) = −φ(0)·c₁(ω) and, for totally positive ξ ∈ F₀, let Z(ξ,φ) be the class of the special divisor of §10.1 with r = 1 and norm ξ. Define the generating series Z(h,φ) = Z(0, ω(h_f)φ)·W₀⁽ⁿ⁾(h_∞) + Σ_(ξ>0) Z(ξ, ω(h_f)φ)·W_ξ⁽ⁿ⁾(h_∞) for h ∈ SL₂(𝔸_F₀), with the weight-n archimedean Whittaker functions and the Weil representation ω of the Hom space; its coefficients use the level and Hom convention of §10.1 (Z §8.1, (8.1)–(8.3), Theorem 8.1). Modularity of this generic-fibre series is not a statement about integral Chow groups.

Its API consists of the following facts:

- The coefficients at ξ > 0 are the classes of special divisors.
- The constant coefficient is −φ(0)·c₁(ω).
- The adelic series and the q-expansion differ by the weight-n Whittaker factor W_ξ⁽ⁿ⁾.
- Every coefficient and the series depend ℚ-linearly on the Schwartz function at fixed level.

**Checks.**

- If φ(0) = 0 the constant term vanishes.
- For φ(0) ≠ 0 and c₁(ω) ≠ 0 in CH¹(M)_ℚ (for instance on a compact M of positive dimension, where ω is ample), omitting the constant term changes the series by −φ(0)c₁(ω)·W₀⁽ⁿ⁾, a nonzero series with only a constant coefficient, which is not a holomorphic modular form of positive weight n. When c₁(ω) = 0 in CH¹(M)_ℚ the term is zero: for n = 1, where CH¹(M) = 0, and for n = 2 over F₀ = ℚ with V isotropic, where M_ℂ is a union of open modular curves Γ∖ℍ on which a nonzero tensor power of ω has a nowhere-vanishing section built from Δ (Δ has no zeros on ℍ), and base change to ℂ is injective on CH¹ ⊗ ℚ.
- On the generic fibre only totally positive ξ give divisors; at ξ = 0 the coefficient is the Chern class of ω, not a divisor.

*Needs:* §10.1; PELModuli §§M1.3, M3.4; MetaplecticAutomorphicForms §4.5; SchemeAndStackFoundations §5.3.

### 12.2 Complex uniformization and the CM fixed line

Prove that at each complex embedding of E the special divisor is the weighted orbit sum, over the rational vectors of the nearby hermitian space of signature (n−1,1) and the finite level cosets, of the hyperplanes {z : z ⊥ u} in the domain D of negative lines; and that for an irreducible CM polynomial α, a CM element δ fixes a unique negative line z_δ, to which no nonzero vector u that is cyclic for δ is orthogonal (Z §8.2, Proposition 8.2; §10.1, Theorem 10.1). The route uses the complex uniformization of the canonical model and decomposes the CM field action into eigenspaces; irreducibility gives the cyclic-vector exclusion.

**Checks.**

- For n = 1 the domain is a point and there are no divisors.
- If α were reducible, δ could fix several negative lines and the uniqueness of z_δ fails.
- If u ⊥ z_δ then u lies in the proper δ-stable subspace z_δ^⊥, so its δ-span is proper and u is not cyclic.

*Needs:* §§10.1, 11.1; PELModuli §§M3.4, M3.8.

### 12.3 Kudla Green function and metric convention

Define, for a > 0, a negative line z not in D(u) and u ≠ 0, the function R(u,z) ≤ 0 as the norm of the projection of u to z, and the Kudla Green function G_K(u,a,z) = −Ei(4πa·R(u,z)); at u = 0 put G_K(0,a) = −log|a|. With dd^c = −(2πi)⁻¹∂∂̄ and the correspondingly rescaled Kudla–Millson form ω_KM, G_K(u,a) is a Green function for the divisor D(u). In the orthogonal convention of Mihatsch–Zhang the projection function is −2R(u,z) ≥ 0, since the real pairing is the trace of the hermitian pairing, and the Green function is −Ei(−2πa·(−2R(u,z))). The Petersson metric of ω and the archimedean Whittaker factor use the same scaling (MZ §3.6, (3.15) and footnote 3, pp. 13–14; §3.8, Theorem 3.13, p. 17; Z §8.3, (8.9)–(8.12), with MZ's correction). The route rescales Zhang's normalization as in MZ before any comparison with the Gaussian orbital integrals of §14.1.

Its API consists of the following facts:

- R(u,z) ≤ 0, with equality exactly when z ∈ D(u).
- G_K(u,a) has a logarithmic singularity along D(u) and extends as a Green current.
- At u = 0 the Green value is −log|a|.
- With the same rescaled Kudla–Millson form, dd^c[G_K(u,a)] + δ_(D(u)) = [ω_KM(u,a)] as currents for u ≠ 0.

**Checks.**

- Off the divisor R < 0, so Ei is evaluated at a negative real argument and G_K is finite and positive.
- At u = 0 and a = e the assigned value is −1, not the divergent Ei(0).
- Replacing 4π by 2π without changing the Gaussian of §14.1 breaks the archimedean comparison by the factor of the argument.

*Needs:* §12.2; ArakelovGeometryAndAbelianHeights §1.8; MetaplecticAutomorphicForms §3.3b.

### 12.4 Automorphic Green functions by regularized theta lifts

Construct the automorphic Green functions. Let F₀ = ℚ, F an imaginary quadratic field, n ≥ 3 and V an F-hermitian space of signature (n−1,1), regarded as the rational quadratic space (V, Q) with Q(x) = h(x,x), of signature (2n−2, 2). The domain D of negative lines is the domain of negative definite F-stable planes z ⊂ V(ℝ); x_z is the orthogonal projection of x to z, so that Q(x_z) = R(x,z) ≤ 0 in the notation of §12.3. Let K be the neat level of M. For an O_F-lattice L ⊂ V on which h is O_F-valued, with dual L′ for the trace form Tr_(F/ℚ) h, let S_L be the finite-dimensional space of Schwartz functions on V(𝔸_f) supported on L̂′ and invariant under L̂, with the Weil representation ω_L of SL₂(ℤ). When L̂ is K-stable, K acts on S_L by translation, this action commutes with ω_L, and S_L^K denotes the K-invariant functions. Every K-invariant Schwartz function lies in S_L^K for some K-stable L: intersect the finitely many K-translates of a lattice under which it is invariant, then shrink by an integer factor, since shrinking L enlarges L′. At the fixed level K the inputs are K-invariant: the theta function below satisfies θ(τ, z, gk)(ϕ) = θ(τ, z, g)(ω_L(k)ϕ) for k ∈ K, so its pairing with an S_L^K-valued form is right K-invariant and descends to M(ℂ) = G(ℚ)∖D × G(𝔸_f)/K, while a pairing with an input not fixed by K need not descend (BHKRY §7.2, p. 100). For an S_L^K-valued harmonic Maass form f of weight 2 − n for ω_L whose nonholomorphic part has cuspidal shadow (the space H⁺ of QSeriesPartitionsAndMockModularForms §§8.3 and 8.5), with holomorphic part f⁺ = Σ_m c⁺(m)q^m, c⁺(m) ∈ S_L, nonzero for only finitely many m < 0, define the regularized theta lift `Θ^reg(z, g, f) = ∫^reg_(SL₂(ℤ)∖ℍ) ⟨f(τ), θ(τ, z, g)⟩ du dv/v²`, where `θ(τ, z, g)(ϕ) = Σ_(x∈V) ϕ(g⁻¹x)·v·e^(2πi(Q(x_(z⊥))τ + Q(x_z)τ̄))` is the Siegel theta function of weight n − 2 and the integral is regularized as by Borcherds (BHKRY §7.2, pp. 99–101; Bor98 §6). Prove the following. (a) Θ^reg(f) is smooth on M(ℂ) off the divisor Z(f)(ℂ) = Σ_(m>0) Z(m, c⁺(−m))(ℂ), and near (z₀, g) the difference between Θ^reg(z, g, f) and Σ c⁺(−Q(x))(g⁻¹x)·Γ(0, 4π|Q(x_z)|), summed over the x ∈ V with Q(x) > 0 orthogonal to z₀, is smooth, where Γ(0, t) = ∫_t^∞ e^(−v) dv/v (BHKRY Theorem 7.2.1, p. 101, for harmonic f with principal parts supported on L̂; Bor98 Theorem 6.2, p. 24, for weakly holomorphic vector-valued f; in general the singular part comes from the principal part alone, the rest of f contributing a smooth function); hence Θ^reg(f) is a Green function of logarithmic type for Z(f)(ℂ) with the multiplicities given by the principal part. (b) For every m ∈ ℚ_(>0) and φ ∈ S_L^K there is a unique such S_L^K-valued form f_(m,φ) whose principal part is a single q^(−m)-term with coefficient the projection of φ to the functions allowed there by ω_L (supported on the cosets μ + L̂ with Q(μ) ≡ m mod ℤ, of the parity fixed by ω_L(−1)); since Q(x) = m forces Q(μ) ≡ m for x ∈ μ + L̂, and D(x) = D(−x), the projection has the same divisor Z(m, φ), and G_B(m, φ) := Θ^reg(f_(m,φ)) is ℚ-linear in φ and does not depend on the choice of L (BHKRY §7.3, p. 102). (c) For weakly holomorphic f, Θ^reg(f) = −log‖ψ(f)‖² for the Borcherds product ψ(f) of §12.5 (BHKRY Theorem 7.2.4, p. 102). (d) Level change: for a Schwartz function φ fixed only by an open compact subgroup K′ ⊂ K, (a)–(b) hold on M_(K′) with S_L^(K′), and G_B(m, φ) is a Green function for Z(m, φ)(ℂ) on M_(K′); for open compact K″ ⊂ K′ the pullback along the finite étale level map π_(K″,K′): M_(K″) → M_(K′) of PELModuli §M6.1 carries G_B(m, φ) on M_(K′) to G_B(m, φ) on M_(K″), and for K-invariant φ the function on M_(K′) is the pullback of the function on M_K. The route reduces to the connected components of M(ℂ), on which the lift is Borcherds' regularized lift for the lattice gL; existence in (b) uses the ξ-operator exact sequences of QSeriesPartitionsAndMockModularForms §8.6, uniqueness the vanishing of holomorphic modular forms of negative weight 2 − n (a form in H⁺ with zero principal part has ξ-image orthogonal to every cusp form, hence is weakly holomorphic, hence holomorphic of negative weight and zero), and independence of L the compatibility of the lift with the inclusions S_L ⊂ S_(L₁) for L₁ ⊂ L; (d) holds because Θ^reg(z, g, f) is a function on G(ℚ)∖D × G(𝔸_f) that does not depend on the level and is right invariant under the stabilizer of f, and existence and uniqueness in (b) are unchanged on the K′-invariant subspace, which ω_L preserves.

Its API consists of the following facts:

- Θ^reg(f) depends linearly on f, and its singularities along each D(x), Q(x) > 0, are c⁺(−Q(x))(g⁻¹x)·Γ(0, 4π|R(x,z)|) up to smooth functions.
- G_B(m, φ) is a Green function of logarithmic type for Z(m, φ)(ℂ) on the open Shimura variety of any level fixing φ, ℚ-linear in φ, and compatible with pullback along the finite étale level maps.
- For weakly holomorphic f, Θ^reg(f) = Σ_(m>0) G_B(m, c⁺(−m)), by uniqueness in (b).
- For weakly holomorphic f, Θ^reg(f) = −log‖ψ(f)‖² with the Petersson metric of §12.5.

**Checks.**

- Zero input: f = 0 gives Θ^reg = 0, the Green function of the zero divisor, and G_B(m, 0) = 0.
- Weights are multiplicities: since Γ(0, t) = −log t − γ + O(t) and R(x,z) = |h(w, x)|²/h(w, w) for a local holomorphic generator w of the tautological line, the singular term c·Γ(0, 4π|R(x,z)|) is −c·log|ℓ_x|² plus a smooth function, ℓ_x = h(w, x) a local equation of D(x); replacing the principal part φ·q^(−m) by 2φ·q^(−m) doubles every multiplicity, although both have the same support.
- Normalization: Γ(0, 4π|R(x,z)|) = −Ei(4πR(x,z)) = G_K(x, 1)(z) of §12.3, since Γ(0, t) = −Ei(−t); the automorphic and Kudla Green functions have the same singular part along every D(x), so G_K − G_B is smooth there.
- The input must be invariant at the fixed level: let V = ℚ(i)³ with h = diag(1, 1, −1), K hyperspecial at 5 and neat at another prime, and k₅ ∈ K₅ the element interchanging e₁ and e₂. Let φ have 5-component the indicator of (e₁ + 5O_F³) ∪ (−e₁ + 5O_F³) and standard integral components elsewhere; it is even and lies in S_L for L small, but φ(e₁) = 1 while φ(k₅⁻¹e₁) = φ(e₂) = 0. At the negative line z spanned by (0, 1, 2) (h-norm 1 − 4 = −3), the vectors of norm 1 in O_F³ orthogonal to z are ζe₁, ζ ∈ {±1, ±i}, since h(x, z) = 0 forces x₂ = 2x₃ and then |x₁|² + 3|x₃|² = 1. For the principal part q^(−1)φ the logarithmic multiplicity at (z, 1) is φ(e₁) + φ(−e₁) = 2 (±i are not ≡ ±1 modulo 5O_F), and at (z, k₅) it is Σ_ζ φ(ζe₂) = 0, although (z, 1) and (z, k₅) represent the same point of M_K: no Green function on M_K has these singularities. On M_(K′) with K′ fixing φ the two representatives are different points, as (d) allows; the K-average of φ is K-invariant and gives equal multiplicities at both.
- n ≥ 3 is needed for uniqueness: for n = 3 the weight 2 − n = −1 is negative and holomorphic forms of weight −1 vanish; for n = 2 the weight is 0, the ω_L-invariant constant vectors are holomorphic of weight 0, and f_(m,φ) and G_B(m, φ) would be determined only up to them.

*Needs:* §§10.1, 12.1, 12.3; QSeriesPartitionsAndMockModularForms §§8.3, 8.5, 8.6; MetaplecticAutomorphicForms §4.5; PELModuli §§M3.4, M6.1.

### 12.5 Unitary Borcherds products and the modularity criterion

Prove the Borcherds relations and the modularity criterion. In the setting of §12.4 (F₀ = ℚ, F imaginary quadratic, n ≥ 3), let L be K-stable and f ∈ M^!_(2−n)(ω_L) an S_L^K-valued weakly holomorphic form (§12.4; for inputs fixed only by K′ ⊂ K everything below holds on M_(K′), compatibly with pullback along the level maps) with principal part Σ_(m>0) c(−m)q^(−m) and constant term c(0), with c(m) ℤ-valued for m ≤ 0, and put k = c(0)(0). (a) After replacing f by a positive integer multiple, there is a rational section ψ(f) of ω^(⊗k) on the canonical model M over E whose divisor on the generic fibre is Σ_(m>0) Z(m, c(−m)), the special divisors of §10.1 with r = 1 and their moduli multiplicities, and whose norm for the Petersson metric ‖w‖² = −[w, w̄]/(4πe^γ) on the tautological line satisfies −log‖ψ(f)‖² = Θ^reg(f); here [·,·] is the ℂ-bilinear extension of Tr_(F/ℚ) h to V ⊗_ℚ ℂ, w̄ is the complex conjugate of w, γ is Euler's constant, and w is a nonzero vector of the tautological line in its orthogonal realization εV(ℂ) ⊂ V ⊗_ℚ ℂ (BHKRY Remark 2.1.2, p. 15), so that [w, w] = 0 and [w, w̄] < 0. For x ∈ V(ℝ) and w = pr_ε(x) = εx one has w̄ = ε̄x and [x, x] = 2[w, w̄] because εV(ℂ) and ε̄V(ℂ) are isotropic, hence [w, w̄] = h(x, x) and equivalently ‖pr_ε(x)‖² = −h(x, x)/(4πe^γ) for x on the negative line (BHKRY Theorem 5.3.1(1), pp. 76–77, with the weight k = c(0)(0) of p. 100 and Theorem 7.2.4 and the metric, p. 102; Bor98 Theorem 13.3, p. 48, for vector-valued f on the orthogonal Shimura variety of (V, Q), pulled back). (b) On integral models. At maximal self-dual level over O_F with odd discriminant D, the divisor of ψ(f) on the Krämer model is Σ_(m>0) c(−m)·Z^tot(m) plus a vertical divisor supported above the primes dividing D, namely k·(Exc/2 − div δ) with δ = √−D, the fibres above p | r weighted by the r-th constant terms, and multiples of the exceptional components (BHKRY Theorem 5.3.3, p. 78). On the localized model M over O_E[1/d] of PELModuliPartII §§7.1 and 7.6, d containing 2, the primes ramified in F and the primes at which the level is not hyperspecial, and for f valued in Schwartz functions standard away from d, the divisor of ψ(f) is Σ_(m>0) Z(m, c(−m)) with no vertical part: at a prime not dividing d every vertical divisor of the toroidal compactification meets the boundary, where the Fourier–Jacobi expansion of ψ(f) fixes its order (BHKRY §§5.3 and 6.5 at maximal level; Z Theorem 8.6 and its proof, p. 42). The vertical terms above d are not set to zero on a model over O_E; they lie in the subgroup of classes supported above d, and the arithmetic Chow group of M is the quotient by that subgroup (Z Remark 8.5, p. 42). Consequently, with Ẑ_B(m, φ) = (Z(m, φ), G_B(m, φ)) for m > 0 and Ẑ_B(0, φ) = −φ(0)·ĉ₁(ω̂), the relation Σ_(m≥0) Ẑ_B(m, c(−m)) = 0 holds in ĈH¹(M)_ℚ: div̂ ψ(f) = (div ψ(f), −log‖ψ(f)‖²) = k·ĉ₁(ω̂). (c) A formal series Σ_(m∈ℚ, m≥0) a(m)q^m with a(m) ∈ S_L^∨ ⊗ W, W a finite-dimensional ℚ-vector space, that is compatible with the stabilizer of the cusp, namely a(m) vanishes on the functions supported on the cosets μ + L̂ with Q(μ) ≢ m mod ℤ, and a(m)(ω_L(−1)φ) = (−1)^n·a(m)(φ) for the central element −1 of SL₂(ℤ), which acts by ω_L(−1)φ = (−1)^n·φ(−·) in signature (2n−2, 2), so that a(m)(φ(−·)) = a(m)(φ), is the q-expansion of a holomorphic modular form of weight n for the dual representation of ω_L if and only if Σ_(m≥0) ⟨c(−m), a(m)⟩ = 0 for every f ∈ M^!_(2−n)(ω_L); for an arbitrary ℚ-vector space W the series is called modular when its image under every linear functional is (Bor99 Theorem 3.1, p. 5, whose power series at a cusp are formal sections of the vector bundle of pp. 4–5 and so carry the compatibility with the stabilizer of the cusp; BHKRY Theorem 4.2.3, p. 68, in the scalar form on Γ₀(D) with integral exponents, where the compatibility is empty, and Theorem A, p. 3, for the meaning of modularity). The route constructs ψ(f) by pulling back Borcherds' product from the orthogonal Shimura variety and descending it to E, computes its integral divisor at the good primes from its Fourier–Jacobi expansions on the integral toroidal compactification for a complete smooth cone decomposition, which is proper (ShimuraCompactifications §§7.3 and 7.5), and proves (c) by Serre duality on the compactified modular curve of a torsion-free finite-index subgroup, averaged over the finite quotient.

Its API consists of the following facts:

- ψ(f) is a rational section of ω^(⊗k), k = c(0)(0), with generic divisor Σ_(m>0) Z(m, c(−m)).
- −log‖ψ(f)‖² = Θ^reg(f) = Σ_(m>0) G_B(m, c(−m)).
- On M over O_E[1/d], div̂ ψ(f) = Σ_(m>0) Ẑ_B(m, c(−m)) and Σ_(m≥0) Ẑ_B(m, c(−m)) = 0 in ĈH¹(M)_ℚ.
- The modularity criterion (c) for series compatible with the stabilizer of the cusp, with the constant coefficient m = 0 included in the pairing.

**Checks.**

- The compatibility with the cusp is needed: for F = ℚ(i), L = O_F³ with h = diag(1, 1, −1), so that L′ = ½L, and μ = ((1+i)/2, 0, 0) ∈ L′, Q(μ) = ½, the series ev_μ·q¹ with ev_μ(φ) = φ(μ) pairs to zero with every weakly holomorphic form, whose coefficient c(−1) is supported on the cosets with Q ≡ 1 mod ℤ and so vanishes at μ, yet it is not modular: ev_μ does not vanish on 1_(μ+L̂) although ½ ≢ 1 mod ℤ. Here 2μ ∈ L, so ev_μ satisfies the parity condition and only the first condition fails.
- The parity condition is needed too: for F = ℚ(i), L = O_F ⊕ O_F ⊕ 3O_F with h = diag(1, 1, −1), so that L′ = ½O_F ⊕ ½O_F ⊕ (1/6)O_F, and μ = (0, 0, 1) ∈ L′ with 2μ ∉ L, the functional a = ev_μ − ev_(−μ) is nonzero (a(1_(μ+L̂)) = 1) and satisfies a(φ(−·)) = −a(φ). The series a·q¹ satisfies the first condition, since Q(±μ) = −1 ≡ 1 mod ℤ, and pairs to zero with every weakly holomorphic form, whose coefficients are even because ω_L(−1) acts by (−1)^n·φ(−·) in weight 2 − n; it is not modular, since the coefficients of a holomorphic form of weight n for the dual of ω_L are even.
- Zero principal part: f is then a holomorphic modular form of negative weight 2 − n, hence zero, so its constant term and the metric coefficient k vanish; zero input gives ψ(f) constant, zero divisor and zero Green function.
- A nonzero principal part at a positive index m makes ψ(f) vanish along a component D(x), Q(x) = m, to the order Σ_y c(−Q(y))(g⁻¹y) over the y ∈ F^×·x with Q(y) > 0 (Borcherds' order, Bor98 Theorem 13.3(2)), and −log‖ψ(f)‖² has the singular part −(that sum)·log|ℓ_x|², which is the singularity of Σ_m G_B(m, c(−m)) from §12.4: the divisor and the Green function carry the same multiplicity. For a principal part q^(−1)·1_(L̂) with L self-dual and x primitive of norm 1, only y = ζx, ζ ∈ O_F^×, contribute, and the order is #O_F^×.
- The constant coefficient cannot be dropped: the Eisenstein series of weight n ≥ 3 is not a cusp form, so by (c) some principal part is orthogonal to every cusp form but not to it, and the corresponding f has k = c(0)(0) ≠ 0 by the residue relation of BHKRY Proposition 4.2.2 (p. 68); for it the relation Σ_(m>0) Ẑ_B(m, c(−m)) = k·ĉ₁(ω̂) has a nonzero metric term.
- Vertical discrepancy: over O_F the relation contains −2k·(0, log D) on the Pappas model (BHKRY (7.3.3), p. 104), from (div δ, 0) = (0, log D); log D = Σ_(p|D) log p dies only in the quotient by classes above d ⊇ {p | D}, together with the vertical divisors, and not before.
- The metric uses the hermitian pairing [w, w̄], not the bilinear [w, w]: on the negative definite plane ℝ² with Q(x, y) = −x² − y², whose bilinear form [·,·] has Gram matrix diag(−2, −2), the isotropic vector w = (1, i) spans the tautological line and has [w, w] = −2 + 2 = 0 and [w, w̄] = −2 − 2 = −4, so ‖w‖² = 4/(4πe^γ) = 1/(πe^γ) > 0, while −[w, w]/(4πe^γ) vanishes at every point of the domain. For a ∈ ℂ^×, ‖aw‖² = |a|²·‖w‖², as a hermitian metric requires.
- Metric normalization: with the unnormalized metric ‖w‖₀² = −[w, w̄] one has ‖ψ(f)‖² = (4πe^γ)^(−k)·‖ψ(f)‖₀², so the relation reads Θ^reg(f) = −log‖ψ(f)‖₀² + k·log(4πe^γ); metrizing ω by ‖·‖₀ in the constant term −φ(0)·ĉ₁(ω̂) while keeping G_B would add k·(0, log(4πe^γ)) to the left side of the relation Σ_(m≥0) Ẑ_B(m, c(−m)) = 0, which holds as stated only for the metric of (a). The orthogonal normalization with ‖·‖₀ carries exactly this constant.

*Needs:* §§10.1, 12.1, 12.4; PELModuliPartII §§7.1 and 7.6; ShimuraCompactifications §§7.3, 7.5 and 7.15, with a complete smooth cone decomposition; ArakelovGeometryAndAbelianHeights §§1.8–1.9; QSeriesPartitionsAndMockModularForms §8.6; PELModuli §M3.4.

### 12.6 Arithmetic divisor series and Green correction

Construct the arithmetic series. For F₀ = ℚ and n ≥ 3, with the automorphic Green functions G_B(ξ, φ) of §12.4, define, for K-invariant φ, Ẑ_B(ξ,φ) = (Z(ξ,φ), G_B(ξ,φ)) for ξ > 0 and Ẑ_B(0,φ) = −φ(0)·ĉ₁(ω, ‖·‖_Pet) with the Petersson metric of §12.5 (for φ fixed only by K′ ⊂ K, the same on M_(K′), and the classes at two levels correspond under pullback by §12.4(d)), with principal arithmetic divisors (div f, −log|f|²), in the arithmetic Chow group of the localized model M over O_E[1/d] of PELModuliPartII §§7.1 and 7.6, which is the arithmetic Chow group of a model over O_E modulo the classes supported above d (Z Remark 8.5); and define the correction series from G_K − G_B with the same weight-n Whittaker coefficients (Z §8.3, (8.14); §8.4, (8.15)–(8.17)). The route imports arithmetic divisors with Green functions, takes the Green functions from §12.4, and pins the zero coefficient and the metric comparison by the Borcherds relations of §12.5.

Its API consists of the following facts:

- Each special divisor carries the automorphic Green function G_B(ξ, φ) of §12.4.
- The constant coefficient is minus the metrized Chern class of ω.
- The Kudla version differs from it by the G_K − G_B series.
- Changing a representative by (div f, −log|f|²) preserves the class and every pairing with proper one-cycles.

**Checks.**

- A principal arithmetic divisor (div f, −log|f|²) is zero in the arithmetic Chow group.
- Using −log|f| instead gives a different relation, and the ℤ-relation (V_p, 0) = (0, 2 log p) of ArakelovGeometryAndAbelianHeights §1.8 fails.
- Changing the metric on ω by e^c changes the constant coefficient and the correction series together.

*Needs:* §§12.1, 12.3–12.5; ArakelovGeometryAndAbelianHeights §§1.8–1.9; PELModuliPartII §§7.1 and 7.6.

### 12.6a Orthogonal Kudla divisors and their Chow-valued modularity

Prove the codimension-one modularity of Kudla's generating series on GSpin Shimura varieties over a totally real field. Let F₀ be a totally real field of degree d with a distinguished real place ι, and (U, Q) a nondegenerate quadratic space over F₀ of dimension p + 2, p ≥ 1, of signature (p, 2) at ι and (p + 2, 0) at every other real place, with bilinear form [x, y] = Q(x + y) − Q(x) − Q(y). Let G′ = Res_(F₀/ℚ) GSpin(U) and D′ = {w ∈ U ⊗_(F₀,ι) ℂ : [w, w] = 0, [w, w̄] < 0}/ℂ^×, [·,·] extended ℂ-bilinearly and w̄ the complex conjugate; for a neat open compact K ⊂ G′(𝔸_f) let M′_K be the canonical model over ι(F₀) of G′(ℚ)∖D′ × G′(𝔸_f)/K (ShimuraVarieties §§6.2 and 8.1) and L the tautological line bundle, with fibre ℂw at the point w. For x ∈ U with Q(x) totally positive and g ∈ G′(𝔸_f), the Kudla divisor Z′(x, g)_K is the image of the points (z, hg) with z ⊥ x and h fixing x. For a K-invariant Schwartz function φ on U(𝔸_(F₀,f)) and totally positive ξ ∈ F₀ put Z′(ξ, φ) = Σ_x Σ_g φ(g⁻¹x)·Z′(x, g)_K over x ∈ G′(ℚ)∖U with Q(x) = ξ and g ∈ G′_x(𝔸_f)∖G′(𝔸_f)/K, put Z′(0, φ) = −φ(0)·c₁(L) (the class c₁(L^∨) of YZZ09, p. 1148), and form Z′_φ(τ) = Σ_ξ Z′(ξ, φ)·q^ξ with q^ξ = e(Σ_k ι_k(ξ)·τ_k) on ℍ^d. Prove:

(a) if F₀ ≠ ℚ, M′_K is smooth and projective, and the series of the cohomology classes of the coefficients in H²(M′_K(ℂ), ℂ) is the q-expansion of a holomorphic Hilbert modular form of parallel weight p/2 + 1 for the Weil representation on the K-invariant Schwartz functions (KM90 Theorem 2, p. 126, for (p, q) = (p, 2) and divisors, the rank-zero term being the Euler-form term; in adelic form, YZZ09 §4.1, p. 1159);

(b) if F₀ ≠ ℚ and p ≥ 3, every connected component of M′_K(ℂ) has first Betti number zero, hence H¹(M′_K(ℂ), O) = 0, Pic⁰ of M′_(K,ℂ) is trivial and the cycle class map CH¹(M′_K)_ℚ → H²(M′_K(ℂ), ℚ) is injective (YZZ09 §4.1, pp. 1158–1159; VZ84 Theorem 8.1, p. 88, which gives vanishing below the minimum of dim(𝔲 ∩ 𝔭) over proper θ-stable parabolics, that minimum for 𝔰𝔬(p, 2) being computed in the Checks);

(c) if U = U₁ ⊥ W with W totally positive definite of dimension e ≥ 1 and U₁ of signature (p − e, 2) at ι, p − e ≥ 1, and i: M′_(K₁) → M′_K is the embedding of the GSpin Shimura variety of U₁ at K₁ = K ∩ GSpin(U₁)(𝔸_f), then for K-invariant φ = φ₁ ⊗ φ₂ on U₁(𝔸_f) ⊕ W(𝔸_f), i^*Z′_φ = Z′_(φ₁)·θ_(φ₂) coefficientwise in CH¹(M′_(K₁))_ℂ, θ_(φ₂) the holomorphic theta series of W of parallel weight e/2, and i^*c₁(L) is c₁ of the tautological bundle of M′_(K₁) (YZZ09 Proposition 3.1, pp. 1157–1158);

(d) for every totally real F₀, ℚ included, and every p ≥ 1, the coefficients of Z′_φ span a finite-dimensional subspace of CH¹(M′_K)_ℂ and Z′_φ is the q-expansion of a holomorphic Hilbert modular form of parallel weight p/2 + 1 with values in it, for the Weil representation (YZZ09 Theorem 1.3, p. 1150). For p = 2 and (U, Q) the reduced-norm space of a quaternion algebra B over F₀ ramified at every real place except ι, GSpin(U) is the group of pairs (b₁, b₂) ∈ B^× × B^× with equal reduced norms acting by x ↦ b₁xb₂⁻¹, M′_K maps finitely onto a union of connected components of a product of two Shimura curves, the Kudla divisors are graphs of Hecke correspondences and the weight is 2 (YZZ09, remark after Theorem 1.3, p. 1150). In that case (d) is the modularity of the Picard-valued generating series of GrossZagierAndArithmeticHeights §6.20, which owns it on the product X_U × X_U of the Shimura curves of B with its own Hodge term and stabilizer weight; (d) is not used to re-prove it, and §6.20 is not used in the proof of (d);

(e) if F₀ = ℚ and p ≥ 3, then U is isotropic, since an indefinite rational quadratic form in at least five variables represents zero, and Borcherds products give relations among the Kudla divisors. Let Λ ⊂ U be an even lattice (Q(Λ) ⊂ ℤ) with dual Λ′ = {x ∈ U : [x, Λ] ⊂ ℤ}. Let ρ_Λ be the Weil representation of Mp₂(ℤ) on ℂ[Λ′/Λ] with ρ_Λ(T)e_μ = e(Q(μ))e_μ (QSeriesPartitionsAndMockModularForms §8.5). Let ρ_Λ⁻ be that of (Λ, −Q), which is Borcherds' ρ_M for the lattice M = (Λ, −Q) of signature (2, p) (Bor99 §2, p. 3). Let K be neat, stabilize Λ̂ and act trivially on Λ̂′/Λ̂. Let f = Σ_μ Σ_m c(m, μ)q^m e_μ be a weakly holomorphic modular form of weight 1 − p/2 and type ρ_Λ⁻ with c(m, μ) ∈ ℤ for m ≤ 0, and put c(m) = Σ_μ c(m, μ)·1_(μ+Λ̂), a K-invariant Schwartz function. On each connected component Γ_j∖D′⁺ of M′_K(ℂ) (ShimuraVarieties §0.5), Γ_j acts through the lattice Λ_j = U ∩ g_jΛ̂, which has the same discriminant form; transport f to Λ_j by g_j. Then there is a meromorphic function Ψ_j(f) on the cone over D′⁺ with the following properties. It is homogeneous of degree −c(0, 0)/2 and automorphic for Γ_j with a unitary character of finite order. Its zeros and poles lie on the divisors λ^⊥ = {[w] : [w, λ] = 0}, λ ∈ Λ_j with Q(λ) > 0. Its order along λ^⊥ is Σ_(t>0, tλ ∈ Λ_j′) c(−Q(tλ), tλ), a sum over one ray (Bor98 Theorem 13.3(1)–(2), p. 48, whose quadratic form is −Q; for the finite order of the character, Bor99 proof of Theorem 4.1, pp. 7–8: a lattice in SO(2, p), p ≥ 3, has finite abelianization). Consequently Σ_(m>0) Z′(m, c(−m)) = c(0, 0)·c₁(L) in CH¹(M′_K)_ℚ, that is, Σ_(m≥0) Z′(m, c(−m)) = 0 with the constant coefficient −φ(0)·c₁(L) defined above;

(f) if F₀ = ℚ, then with k = 1 + p/2 ∈ ½ℤ and Λ as in (e) the following hold. (i) A formal series Σ_(m≥0) Σ_μ a(m, μ)q^m e_μ has coefficients a(m, μ) in a finite-dimensional complex vector space 𝒲, with a(m, μ) = 0 unless m ∈ Q(μ) + ℤ, and a(m, μ) = a(m, −μ), the central parity of weight k and type ρ_Λ (QSeriesPartitionsAndMockModularForms §8.5, with exp(πi(k − σ/2)) = 1 for σ = p − 2). It is the q-expansion of a holomorphic modular form of weight k and type ρ_Λ if and only if Σ_(m≥0) Σ_μ c(−m, μ)·a(m, μ) = 0 for every weakly holomorphic form of weight 2 − k and type ρ_Λ⁻. Here ρ_Λ is the dual of ρ_Λ⁻ under ⟨e_μ, e_ν⟩ = δ_(μν) (Bor99 Theorem 3.1, p. 5, which allows half-integral weight and representations factoring through a finite quotient, applied on the subspace where the centre acts by the weight, Bor99 p. 10). (ii) The holomorphic modular forms of weight k and type ρ_Λ have a basis with rational Fourier coefficients (McGraw03, main theorem, pp. 105–122). Hence the principal parts of the forms with c(m, μ) ∈ ℤ for m ≤ 0 span, over ℂ, those of all weakly holomorphic forms of weight 2 − k and type ρ_Λ⁻ (Bor99 Lemma 4.3, p. 8, whose span of Galois conjugates is then the space itself), and in (i) it suffices to test these forms.

The route. (a) is Kudla–Millson's theorem, whose generating series of periods of a closed form η is the pairing of η with the cohomology classes; projectivity is compactness of M′_K, since U is definite at a second real place and G′ is anisotropic modulo its centre, with Baily–Borel. For (b), each connected component of M′_K(ℂ) is Γ∖D′⁺ for a torsion-free cocompact arithmetic subgroup Γ of the adjoint group SO(U), which is anisotropic over F₀ because U is definite at a second real place; by the Betti–de Rham–(𝔤, K) comparison and Matsushima's formula applied to SO(U), H¹ of the component is the sum over the automorphic representations π occurring in it of H¹(𝔤, K; π_∞), with 𝔤 = 𝔰𝔬(p, 2) the noncompact factor, the compact factors at the other real places contributing in degree zero only; the trivial π_∞ contributes (𝔭*)^K = 0, and a nontrivial unitary π_∞ with nonzero cohomology is an A_𝔮(λ) whose cohomology starts in degree dim(𝔲 ∩ 𝔭) ≥ 2 for 𝔰𝔬(p, 2), p ≥ 3; then H¹(O) = 0 by Hodge decomposition, the exponential sequence makes c₁ injective on the analytic Picard group, GAGA identifies it with the algebraic one, and CH¹ ⊗ ℚ of the canonical model injects into that of its base change to ℂ. For (d) with F₀ ≠ ℚ and p ≥ 3 combine (a) and (b). For F₀ = ℚ and p ≥ 3 combine (e) and (f) (Bor99 Lemma 4.4 and Theorem 4.5, p. 9). Every K-invariant φ is a combination of the 1_(μ+Λ̂) for a lattice Λ as in (e), after shrinking K, which the last sentence of this route allows. The linear map sending q^(−m)e_μ to Z′(m, 1_(μ+Λ̂)), and q⁰e_μ to Z′(0, 1_(μ+Λ̂)) = −δ_(μ,0)·c₁(L), kills the principal parts of the forms with integral principal part by (e). By (f)(ii) these span the principal parts of all weakly holomorphic forms of weight 1 − p/2 and type ρ_Λ⁻. The quotient of all principal parts by these is finite-dimensional, being dual to the holomorphic forms of weight 1 + p/2 (Bor99 Theorem 3.1), and the map factors through it. So the coefficients of Z′_φ span a finite-dimensional space 𝒲, and (f)(i) with values in 𝒲 gives modularity for ρ_Λ. For p ≤ 2 and every F₀, ℚ included, apply (c) to U ⊥ W in place of U and U in place of U₁, with W totally positive definite and p + e ≥ 3, where (d) holds by the previous two cases. Write the series adelically as functions Z′_φ(g′) on the metaplectic cover of SL₂(𝔸_(F₀)); both i^*Z′_(φ₁⊗φ₂)(g′) and θ_(φ₂)(g′) are left invariant under SL₂(F₀), so Z′_(φ₁)(γg′) = Z′_(φ₁)(g′) wherever θ_(φ₂)(g′) ≠ 0, and the coefficients of Z′_(φ₁) lie in the pullback of the finite-dimensional span upstairs. For each g′ = (g′_∞, g′_f) some φ₂ has θ_(φ₂)(g′) ≠ 0: for φ₂ = ω(g′_f)⁻¹·1_(N·Λ̂), Λ a lattice in W, θ_(φ₂)(g′) = Σ_(z ∈ NΛ) (ω(g′_∞)φ_∞)(z) tends to (ω(g′_∞)φ_∞)(0) ≠ 0 as N grows, φ_∞ the Gaussian of W; the level K is shrunk to fix φ₂, which the last sentence of this route allows (YZZ09 §4.1, p. 1159). For F₀ = ℚ, M′_K is compact exactly when U is anisotropic over ℚ (G′ is then anisotropic modulo its centre). By (e) this happens only for p ≤ 2, and in dimensions three and four both compact and noncompact varieties occur (Checks). The rational branch uses no compactness: anisotropic and isotropic U with p ≤ 2 both pass through (c), and the Borcherds argument is run only for p ≥ 3. There U is isotropic, and the finite order of the character needs no embedding into a larger lattice (Bor99, pp. 7–8, uses such an embedding for b⁻ = 1, 2). For (e), Ψ_j(f) is constructed by Bor98 Theorem 13.3 from the regularized theta lift of f. Since weight 1 − p/2 and type ρ_Λ⁻ force c(m, μ) = c(m, −μ) (QSeriesPartitionsAndMockModularForms §8.5, central parity), Ψ_j(f)² has divisor the restriction of Σ_(m>0) Z′(m, c(−m)), which counts x and −x separately, and is a meromorphic section of L^(⊗c(0,0)). If the character has order N, Ψ_j(f)^(2N) is Γ_j-invariant. It is algebraic, as follows. L^(⊗p) is the canonical bundle of D′, so high powers of L give the projective minimal compactification (ShimuraVarieties §§2.3 and 2.7). Since SO(U), p ≥ 3, has no ℚ-quotient PGL₂, its boundary has codimension at least two and holomorphic automorphic sections extend over it (ShimuraVarieties §2.8). Multiply Ψ_j(f)^(2N), raised to a power, by a section of a power of L that vanishes to high order along the closure of its polar divisor. The product extends holomorphically and is algebraic by projective GAGA (ComplexComparisonPartII §C1.9), so Ψ_j(f)^(2N) is a rational section of L^(⊗N·c(0,0)) with divisor N·Σ_(m>0) Z′(m, c(−m)) on the component. The relation over ℂ descends to M′_K because base change is injective on CH¹ ⊗ ℚ. At every F₀ the statement at level K follows from the statement at a smaller level K′, since π_(K′,K)^* is injective on CH¹ ⊗ ℚ (π_*π^* is multiplication by the degree) and carries Z′_φ to Z′_φ.

**Checks.**

- The instance of a quadratic base and unitary rank three: for [F₀ : ℚ] = 2 and U of dimension 6 with signature (4, 2) at ι and (6, 0) at the other place, p = 4, the weight is p/2 + 1 = 3, M′_K is compact because U is definite at the second place, and p ≥ 3 puts it under (a) and (b).
- The quaternionic case p = 2: (B, nrd) has signature (2, 2) at ι, where B splits and the reduced norm is the determinant, and (4, 0) at the other real places, where B is Hamilton's quaternions; so the weight is p/2 + 1 = 2, the weight of the series of GrossZagierAndArithmeticHeights §6.20, and this case reaches (d) through (c), not (b), as the next Check requires (a product of two Shimura curves of positive genus has positive first Betti number).
- The bound p ≥ 3 in (b) is sharp: write the compact Cartan coordinates of 𝔰𝔬(p, 2) as (x₀; x₁, …, x_m), m = ⌊p/2⌋, with noncompact roots ±e₀ ± e_i and, for odd p, ±e₀. For x ≠ 0 at least four noncompact roots are nonzero on x when p ≥ 3 (each i with x₀ ≠ 0 gives a pair ±(x₀ + x_i) or ±(x₀ − x_i), the ±e₀ pair adds two for odd p, and x₀ = 0 makes all four roots of an index with x_i ≠ 0 nonzero), so dim(𝔲 ∩ 𝔭) ≥ 2; for p = 2 the choice x₀ = x₁ ≠ 0 leaves only ±(e₀ + e₁) nonzero, so dim(𝔲 ∩ 𝔭) = 1 and VZ84 Theorem 8.1 gives no vanishing in degree one; a product of two Shimura curves of positive genus indeed has positive first Betti number. So p ≤ 2 goes through (c), not (b).
- The constant coefficient is −φ(0)·c₁(L), not +φ(0)·c₁(L): the two series differ by the constant 2φ(0)·c₁(L), which is nonzero in H² when φ(0) ≠ 0 because L is ample on the compact M′_K of positive dimension p, and a nonzero constant is not a holomorphic modular form of positive weight.
- Zero input: φ = 0 gives the zero series. In (c), the terms with x ∈ W have zero U₁-component and contribute φ₁(0)·c₁(L^∨)·φ₂(x), which is the constant coefficient of Z′_(φ₁) times the coefficient of θ_(φ₂); the excess intersection along M′_(K₁) ⊂ Z′(x) is what produces c₁(L^∨).
- Compact and noncompact rational varieties (p = 1). Q = x² − 3y² − 3z² has signature (1, 2) and is anisotropic over ℚ. If x² = 3(y² + z²) then 3 | x, so y² + z² ≡ 0 mod 3, which forces 3 | y and 3 | z because −1 is not a square mod 3; so there is no primitive zero. Its M′_K is a compact Shimura curve. Q = x² − y² − z² has the isotropic vector (1, 1, 0), and its M′_K is noncompact. In dimension four (p = 2) the same descent shows that x² + y² − 3z² − 3w² is anisotropic, while x² + y² − z² − w² has the zero (1, 0, 1, 0). All four reach (d) through (c); for p = 1 take W = ⟨1⟩ ⊥ ⟨1⟩, e = 2. For U = (x² − 3y² − 3z²), U ⊥ W = x² + u² + v² − 3y² − 3z² has signature (3, 2) and the isotropic vector (x, u, v, y, z) = (1, 1, 1, 1, 0), since 1 + 1 + 1 − 3 = 0, as (e) requires in five variables.
- Weights of the rational branch. The first case of (e)–(f) is p = 3, with input weight 1 − p/2 = −1/2 and output weight p/2 + 1 = 5/2. The case p = 1 (output 3/2, input 1/2) is reached through (c) with e = 2, and p = 2 (output 2, input 0) with e = 1; in both, (p/2 + 1) + e/2 = 5/2 is the weight upstairs. None of these uses §12.5, whose inputs have integral weight 2 − n for hermitian lattices with n ≥ 3.
- One ray against two. Bor98's order along λ^⊥ sums over tλ with t > 0, while Z′(m, φ) counts x and −x separately. For M = (Λ, −Q) the signature is σ = 2 − p, and at weight k = 1 − p/2 the central factor exp(πi(k − σ/2)) is 1, so c(m, μ) = c(m, −μ). Hence Ψ_j(f)², of weight c(0, 0), has divisor Σ_(m>0) Z′(m, c(−m)), and the relation has coefficient c(0, 0)·c₁(L). Pairing that divisor with the weight c(0, 0)/2 of Ψ_j(f) itself would give the wrong relation Σ_(m>0) Z′(m, c(−m)) = (c(0, 0)/2)·c₁(L).

*Needs:* ShimuraVarieties §§0.5, 2.3, 2.7, 2.8, 6.2 and 8.1; QSeriesPartitionsAndMockModularForms §8.5; ArithmeticLocallySymmetricSpaces ALS.5b.1 and ALS.5b.4; AutomorphicSpectralTheory §§5.10, 5.12 and 5.14; AutomorphicFormsOnReductiveGroups §5.4; ComplexKahlerGeometry §§4.5 and 6.3; ComplexComparisonPartII §C1.9; MetaplecticAutomorphicForms §§4.5 and 5.1; SchemeAndStackFoundations §§5.1 and 5.3.

### 12.6b Unitary special divisors as pullbacks of orthogonal ones

Prove the pullback comparison. In the global setting of §§10.1 and 12.1 over a totally real F₀ with n ≥ 2, regard V as the quadratic space (V, Q) over F₀ with Q(x) = h(x, x) = ½·Tr_(F/F₀) h(x, x) and [x, y] = Tr_(F/F₀) h(x, y). It has dimension 2n, signature (2n − 2, 2) at the place ι of F₀ below φ₀ and (2n, 0) at the other real places, so §12.6a applies with p = 2n − 2 and weight p/2 + 1 = n. The negative F-stable planes form a closed complex submanifold D ⊂ D′ on which the tautological bundle L restricts to ω, and SU(V) → SO(V, Q) lifts to SU(V) ⊂ Spin(V, Q) because SU(V) is simply connected; this is a morphism of connected Shimura data, and for open compact K′ ⊂ G′(𝔸_f) small with K ∩ SU(V)(𝔸_f) = K′ ∩ SU(V)(𝔸_f) it gives a closed embedding i_(K′) of the neutral component M° of M into the neutral component of M′_(K′), defined over a finite abelian extension of E (ShimuraVarieties §§6.3–6.4 and 8.5; Liu11a Remark 3.3, p. 874). Prove: (a) for x ∈ V(𝔸_(F₀,f)) with Q(x) ∈ F₀ totally positive, i_(K′)^* of the restriction of Z′(x)_(K′) to the neutral component is Σ_(x₁ ∈ K∖K′x) Z(x₁)° in CH¹(M°), where Z(x₁)° is the restriction to M° of the special divisor Z(h(x₁, x₁), 1_(Kx₁)) of §10.1, and i_(K′)^* c₁(L) = c₁(ω); hence, for φ invariant under K and K′, i_(K′)^* Z′_φ = Z_φ° on M°, Z_φ the series of §12.1 (Liu11a Proposition 3.2 and Corollary 3.4, pp. 873–874); (b) for K-invariant φ the series Z(h, φ) of §12.1 is a holomorphic Hilbert modular form of parallel weight n whose coefficients span a finite-dimensional subspace of CH¹(M)_ℚ (Liu11a Theorem 3.5(2), p. 874, and Lemma 3.6, pp. 876–877). The two series are taken for the same Weil representation: the unitary Weil representation of U(1, 1) restricted to SL₂(𝔸_(F₀)) is the Weil representation of the even-dimensional quadratic space (V, Q) (Liu11a, p. 874). The route: an F-stable plane orthogonal to x for [·,·] is orthogonal to F·x for h, since [z, ax] = Tr_(F/F₀)(ā·h(z, x)) for all a ∈ F, so D meets D′(x) in D(x) and the intersection is proper; for (b), CH¹(M_ℂ)_ℚ embeds into the product of the CH¹ of the geometric connected components, each of which is the neutral component of a Hecke translate (ShimuraVarieties §§0.5 and 8.7; Liu11a (3-7), p. 876), the invariance under the Siegel parabolic is termwise, and the invariance under w₁ = ((0, 1), (−1, 0)) is pulled back component by component from §12.6a(d).

**Checks.**

- The weight matches for every n: p/2 + 1 = (2n − 2)/2 + 1 = n. For [F₀ : ℚ] = 2 and n = 3 the orthogonal space has signature (4, 2) at ι and (6, 0) at the other place and weight 3, the instance of §12.6a(a)–(b); for n = 2 it has signature (2, 2) at ι, p = 2, and §12.6a(d) runs through the pullback (c).
- The quadratic form is Q(x) = h(x, x), not Tr_(F/F₀) h(x, x) = 2h(x, x): with the trace, a vector of hermitian norm ξ would sit at the index 2ξ of the orthogonal series, and the comparison i^*Z′_φ = Z_φ would match the unitary coefficient at ξ with the orthogonal one at 2ξ.
- The detour through M′ is needed for Chow groups: for 𝔰𝔲(m, 1), m = n − 1, the θ-stable parabolic given by the compact Cartan coordinate x = e₁ has exactly one positive noncompact root, e₁ − e_(m+1), so dim(𝔲 ∩ 𝔭) = 1 and VZ84 Theorem 8.1 gives no vanishing of the first Betti number of M; the cohomological modularity of the unitary divisors (KM90 Theorem 3, p. 127) therefore does not by itself give modularity in CH¹(M)_ℚ, whereas the pullback of a series with coefficients in a finite-dimensional space of classes does.

*Needs:* §§10.1, 12.1, 12.6a; ShimuraVarieties §§0.5, 6.3–6.4, 8.5 and 8.7; PELModuli §§M3.4, M6.1; SchemeAndStackFoundations §§5.1 and 5.3.

### 12.7 Divisor and Green modularity

Prove that for every totally real F₀, every n ≥ 2 and every K-invariant φ, the Chow-valued series of §12.1 is a holomorphic modular form of parallel weight n whose coefficients span a finite-dimensional subspace of CH¹(M)_ℚ (for n = 1, M has dimension zero and CH¹(M) = 0); that for F₀ = ℚ and n ≥ 3 the arithmetic G_B-series of §12.6 is holomorphic of weight n at a level supported in the excluded primes; and that for F₀ = ℚ and n ≥ 3 the G_K − G_B series is a weight-n modular function of moderate growth (Z Theorems 8.1, 8.4 and 8.6). No arithmetic modularity over other totally real F₀, or for n = 2, is asserted: the Borcherds products of §12.5 require n ≥ 3, and for n = 2 the unitary Shimura variety is a union of modular or compact Shimura curves, outside that theory (BHKRY §1.5, pp. 11–12). For the arithmetic statement the route applies the criterion §12.5(c) to Σ_(m≥0) Ẑ_B(m, ·)q^m, the relations it requires being the Borcherds relations §12.5(b). The series is compatible with the stabilizer of the cusp: Z(m, φ) depends only on the restriction of φ to the vectors of norm m, which lie in cosets μ + L̂ with Q(μ) ≡ m mod ℤ, and G_B(m, φ) only on the projection of §12.4(b) of φ to the even functions supported on those cosets; both are unchanged under φ ↦ φ(−·), since Z(x) = Z(−x) and that projection is even, and Ẑ_B(0, φ) depends only on φ(0). For the Chow statement over ℚ with n ≥ 3 the same argument runs on the generic fibre with §12.5(a). Over every totally real F₀ and for every n ≥ 2 the Chow statement is §12.6b(b): the unitary series is the pullback, component by component, of the series of Kudla divisors on the GSpin Shimura variety of (V, h(x, x)), of signature (2n − 2, 2) at ι, whose Chow-valued modularity is §12.6a(d) (YZZ09 Theorem 1.3, p. 1150; Liu11a Theorem 3.5, p. 874, with Lemma 3.6, pp. 876–877, for r = 1). The correction series uses Ehlen–Sankaran's comparison of G_K with the G_B of §12.4: the generating series of the differences of the two Green functions, with the constant term −log v, is a nonholomorphic modular form of weight p/2 + 1 = n (ES Theorem 3.6, p. 27), and the difference of the two arithmetic theta series transforms as a modular form of weight n with values in ĈH¹ (ES Theorem 4.13, p. 36); Z Theorem 8.4 is this statement.

**Checks.**

- The weight is n, the dimension of V: for n = 2 the special divisors are points on a Shimura curve and the series has weight 2.
- A degree-two base with n = 3: for [F₀ : ℚ] = 2 the orthogonal space (V, h(x, x)) has signature (4, 2) at ι and (6, 0) at the other real place, weight 3, and §12.6a(a)–(b) apply because F₀ ≠ ℚ and p = 4 ≥ 3; for n = 2 over the same F₀ the signature is (2, 2) and §12.6a(d) uses the pullback (c). Neither case uses §12.5, whose hypotheses F₀ = ℚ and n ≥ 3 fail.
- The arithmetic statement is restricted to F₀ = ℚ and n ≥ 3; at n = 2 the weight-zero ambiguity of §12.4 and the absence of the Borcherds relations of §12.5 leave it unsupported.
- The correction series is modular but not holomorphic.

*Needs:* §§12.1, 12.4–12.6, 12.6a–12.6b; MetaplecticAutomorphicForms §§4.5, 5.1.

### 12.8 Normalized CM intersection series

Define the CM pairing. Pair arithmetic divisors with the proper virtual CM one-cycle of §11.4 in ℝ_S = ℝ/span_ℚ{log p : p lies below an excluded place}. For F₀ = ℚ and n ≥ 3 put Int(h, Φ) = (Ẑ_B(h,φ), ᴸCM(α,φ₀))/(τ(Z^ℚ)·[E : F]) and Int_(K−B) the similarly normalized pairing of the G_K − G_B series; Int_K, the pairing with the Kudla Green functions of §12.3, is defined for every n and equals Int + Int_(K−B) when both are defined. The finite local terms Int_v(ξ, Φ), ξ ≠ 0, involve no Green function and are defined for every totally real F₀ and every n. For vertical curves the pairing is the degree of O(D) times the logarithm of the residue cardinality, and complex contributions carry one half of the sum over embeddings (Z §9.1, (9.1)–(9.8); §10, (10.9)–(10.10)). The route applies the pairing of ArakelovGeometryAndAbelianHeights §1.10, then the torus and reflex normalization.

Its API consists of the following facts:

- The value lies in ℝ modulo the ℚ-span of the excluded prime logarithms.
- The denominator is τ(Z^ℚ)·[E : F], not [E : F₀].
- The CM class used in the pairing is a proper one-cycle.
- The pairing is ℚ-bilinear and factors through arithmetic rational equivalence and the stated quotient of ℝ.

**Checks.**

- A vertical component over p contributes its line-bundle degree times log p.
- A principal arithmetic divisor pairs to zero in ℝ_S.
- Replacing [E : F] by [E : F₀] changes the value by the factor 2 = [F : F₀].

*Needs:* §§11.4, 12.6; ArakelovGeometryAndAbelianHeights §1.10.

### 12.9 CM intersection modularity

Prove that for F₀ = ℚ and n ≥ 3, Int(h, Φ) is a holomorphic modular form of weight n with values in ℝ_S, and Int_(K−B) is modular of moderate growth; the coefficient functions are well defined because the CM class is proper, and the constant coefficient remains part of the series when local comparisons are extracted at ξ ≠ 0 (Z §9.1, Remark 9.1 and (9.7); Corollary 10.4). The route pairs the coefficientwise modularity of §12.7 with the fixed proper one-cycle.

**Checks.**

- Pairing is linear, so modularity of each Chow and arithmetic coefficient transfers to the scalar series.
- The constant coefficient −φ(0)·ĉ₁(ω) pairs to a nonzero number in general and is retained.
- Over F₀ ≠ ℚ only the Chow-valued modularity of §12.7 is available, so this statement is restricted to F₀ = ℚ; for n = 2 no arithmetic modularity is available (§12.7), so it is restricted to n ≥ 3.

*Needs:* §§12.7–12.8.

### 12.10 Finite local CM–KR orbit formula

Prove that for ξ ≠ 0 the CM and special-divisor supports do not meet on the generic fibre; at a good split place their intersection is empty; and at a good inert place it is supported on the basic locus, with Int_v(ξ, Φ) = 2 log q_v·Σ_(δ,u) Int_v(δ,u)·Orb((δ,u), Φ^v) over the rational orbits of the nearby unitary data with characteristic polynomial α and norm ξ, for the chosen Haar measures. Excluded places are not asserted to contribute zero. The factor 2 is the residue degree of the unramified quadratic extension after the reflex normalization (Z §§9.2–9.4, Theorem 9.4 and (9.11)). The route uses the cyclic and irreducible CM condition to exclude generic intersection, and at inert places the formal uniformization §11.5 and the derived projection formula.

**Checks.**

- A good split place contributes 0, but the same conclusion is not asserted at an excluded place.
- At an inert place the residue field of the CM field has q_v² elements, giving log(q_v²) = 2 log q_v.
- If (δ,u) is not regular semisimple, Int_v(δ,u) is not defined by §9.2. Separately, for ξ ≠ 0 and irreducible α every contributing pair is strongly regular.
- Regular semisimple without strong regularity (control): over the unramified quadratic extension of ℚ₃ take the rank-three space with Gram matrix h = 3J, J the antidiagonal matrix of ones, so det h = −27 has odd valuation and the space is nonsplit; g = ((1,1,−1/2),(0,1,−1),(0,0,1)) satisfies gᵗhg = h and is regular unipotent, not semisimple; u = e₁ + e₃ has h(u,u) = 6 and det(u, gu, g²u) = −1 ≠ 0. So (g,u) is cyclic and regular semisimple, Int_v(g,u) is defined by §9.2, but (g,u) is not strongly regular, and its characteristic polynomial (T − 1)³ is reducible, so it does not occur in the orbit sum.

*Needs:* §§9.2, 11.5, 12.8.

### 12.11 Refined CM invariant and archimedean orbit formula

Prove that the CM field action makes the nearby space a rank-one hermitian space over F′/F′₀ whose trace form is the original pairing; put ξ′ = q(u) with Tr_(F′₀/F₀)(ξ′) = ξ; exactly one archimedean place v′ has ξ′ negative, and R(u, z_δ) = v′(ξ′). The archimedean intersection is the orbit sum of −Ei(−4πa·|ξ′|_v′) times the away-from-archimedean orbital factor, with coefficients divided by their weight-n Whittaker factor (Z §10.2, Corollary 10.3; MZ §§3.5–3.8, pp. 12–17, and §6.3, p. 29). The route refines the trace form to F′₀, evaluates the Green function at the unique fixed negative line and uses MZ's rescaling; the 2π and 4π formulas are not mixed.

**Checks.**

- For ξ′ negative at v′ the argument −4πa|ξ′| is negative and −Ei is finite.
- The sum of ξ′ over the places of F′₀ above the archimedean place of F₀ is ξ; the other places contribute positive terms and no Green singularity.
- With 2π in place of 4π the value differs, and the comparison of §14.2 with the Gaussian orbital integrals fails.

*Needs:* §§12.2–12.3, 12.8.

### Examples

At φ(0) = 0 the automorphic-line constant coefficient vanishes; otherwise its negative sign is required. The automorphic and Kudla Green functions have the same singular part, since Γ(0, 4π|R|) = −Ei(4πR) for R < 0; the Borcherds relation Σ_(m>0) Ẑ_B(m, c(−m)) = k·ĉ₁(ω̂) shows why the constant term is −φ(0)·ĉ₁(ω̂) and not +φ(0)·ĉ₁(ω̂). A principal divisor pairs to zero only with the Green relation −log|f|². A good inert place contributes with the factor 2 log q_v and a good split place contributes zero. At infinity the factors 4π and 2π belong to different normalizations. The Petersson metric is −[w, w̄]/(4πe^γ): on the plane with Q = −x² − y² the isotropic vector (1, i) has norm 1/(πe^γ), whereas the bilinear [w, w] vanishes there. Over a real quadratic F₀ and n = 3 the unitary divisor series has weight 3 and is the pullback of the GSpin series for signature (4, 2), whose Chow-valued modularity comes from Kudla–Millson and the vanishing of the first Betti number. Over ℚ the GSpin curve of x² − 3y² − 3z² is compact and that of x² − y² − z² is not; both get their modularity by pullback from signature (3, 2), where Borcherds products supply the relations. At a fixed level the Schwartz inputs are K-invariant; an input fixed only by K′ lives on M_(K′).

### Dependencies

Layers 9–11; PELModuli §§M1.3, M3.4, M3.8, M6.1; PELModuliPartII §§7.1 and 7.6; ArakelovGeometryAndAbelianHeights §§1.8–1.10; MetaplecticAutomorphicForms §§3.3b, 4.5, 5.1; QSeriesPartitionsAndMockModularForms §§8.3, 8.5, 8.6; ShimuraCompactifications §§7.3, 7.5 and 7.15, with a complete smooth cone decomposition; ShimuraVarieties §§0.5, 2.3, 2.7–2.8, 6.2–6.4, 8.1, 8.5 and 8.7; ArithmeticLocallySymmetricSpaces ALS.5b.1, ALS.5b.4; AutomorphicSpectralTheory §§5.10, 5.12 and 5.14; AutomorphicFormsOnReductiveGroups §5.4; ComplexKahlerGeometry §§4.5, 6.3; ComplexComparisonPartII §C1.9; SchemeAndStackFoundations §§5.1, 5.3.

## Layer 13: Arithmetic Siegel–Weil identities

Specialize the unitary Siegel Eisenstein series and the incoherent Diff set, fix the admissible global data, normalize the coherent Siegel–Weil constant, prove the semi-global and inert global identities, construct the Green star products and arithmetic degrees, and prove the unramified and modified ramified arithmetic Siegel–Weil formulas.

### 13.1 Unitary Siegel Eisenstein specialization

Construct the Siegel Eisenstein series. For a split skew-hermitian space W of dimension 2n over F/F₀ with Siegel parabolic P and a Hecke character χ of F whose restriction to 𝔸_F₀^× is η_(F/F₀)^n, send φ ∈ 𝒮(V^n) to its standard section f_φ(g,s) in the normalized induction I(s,χ) = Ind_P^(U(W))(χ|det|_F^s), equivalently the unnormalized induction with exponent s + n/2. Define E(g,s,φ) = Σ_(γ ∈ P(F₀)∖U(W)(F₀)) f_φ(γg, s) in the convergence range and by continuation; E_T is its unipotent Fourier coefficient with self-dual measures and E′ its derivative at s = 0 (LZ §§12.1–12.2, pp. 77–78). The route uses normalized induction and continuation and specializes the Weil section and the Fourier integral without dropping modulus characters.

Its API consists of the following facts:

- The standard section uses the fixed splitting character and the Schwartz input.
- T-coefficients are integrals against the fixed additive character.
- Nonsingular coefficients factor into local Whittaker integrals in the convergence range and by continuation.
- For p in the Siegel parabolic with Levi component a(p), f(pg, s) = χ(det a(p))·|det a(p)|_F^(s+n/2)·f(g,s).

**Checks.**

- A pure tensor section has nonsingular coefficients equal to the product of the local Whittaker integrals.
- Changing the additive character rescales the local Haar measures and Whittaker functions together.
- A singular T is not assigned the nonsingular product formula.

*Needs:* AutomorphicSpectralTheory §§1.1, 1.2, 2.4; MetaplecticAutomorphicForms §§3.3, 4.5, 6.2.

### 13.2 Incoherent Diff set and coefficient derivative

Define, for V positive definite at every archimedean place with prescribed finite local hermitian spaces whose invariants are incoherent, and a nonsingular T, the set Diff(T, V) = {v : V_v does not represent T}. Prove that E(g, 0, φ) = 0; that a derivative coefficient with nonzero contribution has a unique obstructing place in Diff(T,V), necessarily nonsplit, at which the Whittaker derivative is taken while the other factors are values; and that a test function nonsingular at two split places kills all singular T contributions (LZ §§12.3–12.4, (12.3.0.2) and (12.4.0.2)–(12.4.0.3), pp. 78–80). The route applies the local functional equations, the global sign product, and the support condition at the two split places.

Its API consists of the following facts:

- Diff records failure to represent T, not the set of ramified places.
- At the unique obstructing place the local factor is differentiated.
- Nonsingularity at two split places removes the singular global coefficients.
- Replacing each local hermitian space by an isometric one preserves Diff and the assignment of value and derivative factors.

**Checks.**

- If Diff(T,V) has at least two places, two local factors vanish and the first derivative of the coefficient is zero.
- A single archimedean obstructing place is allowed; the derivative is then archimedean.
- A nonsplit finite obstructing place need not be ramified in F/F₀.

*Needs:* §13.1; MetaplecticAutomorphicForms §6.7; GeometryOfNumbersAndQuadraticArithmetic §2.9.

### 13.3 Admissible global data

Define the admissibility conditions on the global data used by the arithmetic Siegel–Weil formulas, for the PEL datum and lattice Λ of PELModuliPartII §§6.1, 6.5, 6.7–6.8, 7.2, 7.4 and 7.10: dyadic places are unramified in F; at inert places where V_v is split, Λ_v is self-dual with its stabilizer, and at a ramified base prime the CM type descends from the maximal unramified subfield; at inert places where V_v is nonsplit, F₀,v/ℚ_p is unramified and Λ_v is almost self-dual with its stabilizer; at ramified quadratic places F₀,v/ℚ_p is unramified and Λ_v is unimodular (the Krämer model); at split places Λ_v is self-dual, with maximal level when the place is not in the level set and principal congruence level otherwise, with CM-type matching and an unramified extension between reflex and local reflex fields; together with the CM-torus, exact polarization-kernel, sign and Eisenstein conditions and the rank-(n−1) Krämer filtration (K §10.2, (G0)–(G5) and (H1)–(H4), pp. 77–79). The integral models, their regularity and semistability, and the level and Hecke structures are PELModuliPartII Layers 6–8.

Its API consists of the following facts:

- An admissible datum records the lattice type and level at every place.
- At split places of positive level it records the CM-type matching and the unramified local reflex extension.
- The associated model carries its universal abelian schemes and Krämer filtration.
- An admissibility witness exports its local lattice, stabilizer and CM or reflex compatibility at each place; equality of generic models is not such a witness.

**Checks.**

- At an inert nonsplit place a self-dual lattice is not substituted for the almost self-dual one.
- A ramified quadratic place above a ramified base prime fails the unramified-base condition.
- Unramified dyadic places are allowed here, which is weaker than the split-dyadic hypothesis of the full generating-series statement of §13.10.

*Needs:* §10.1; PELModuliPartII §§6.1, 6.5, 6.7, 6.8, 7.2, 7.4, 7.10 and 8.5.

### 13.4 Coherent Siegel–Weil normalization

Prove that for the nearby positive definite coherent hermitian space used in the nonsingular Fourier calculation, the theta integral equals the normalized Siegel Eisenstein value, and that with the local density factors and the global measure the constant is c_K = (−1)^n/vol(K), independent of T and φ, where vol(K) is the volume of K for a Haar measure on the finite adelic points of the RSZ group that does not depend on K, T or φ (LZ Theorem 13.6.1 and its proof, pp. 83–84, which takes the volume for a suitable Haar measure; Theorem 15.3.1, proof, p. 88). Since two Haar measures differ by a positive scalar, the content of the statement is that one such measure serves every level: for any fixed Haar measure dg the number c_K·vol(K, dg) has the sign (−1)^n and does not depend on K, T or φ, so that c_(K′) = [K : K′]·c_K for K′ ⊂ K. The measure for which this number is exactly (−1)^n absorbs the volume of the double coset space of the uniformization and the local measure constants of the Siegel–Weil comparison; no Check uses a particular normalization. The route applies the anisotropic Siegel–Weil formula MetaplecticAutomorphicForms §6.4 in its stated range and compares its measures with the self-dual local measures of §13.1.

**Checks.**

- The constant does not depend on T: two nonsingular T with the same Diff give the same c_K.
- For n = 2 the constant is +1/vol(K) and for n = 3 it is −1/vol(K); the sign is part of the constant and is not absorbed into a choice of measure.
- The constant is inversely proportional to the volume. Take neat K′ ⊂ K of index m, equal to K except at one place of F₀ split in F lying over a prime ℓ, and K-invariant φ. For T whose obstructing place is archimedean or has residue characteristic other than ℓ, the level map M_(K′) → M_K is finite étale of degree m where the degree of T is computed and pulls special cycles back to special cycles, so deĝ_T at level K′ is m times deĝ_T at level K, while E′_T(z, φ) does not involve the level; hence c_(K′) = m·c_K. The quotient gives (−1)^n/vol(K′) = m·(−1)^n/vol(K), as required; the product (−1)^n·vol(K′) = (−1)^n·vol(K)/m would divide by m instead.
- Continuation of the Eisenstein series alone does not give this identity; it is the Siegel–Weil theorem.

*Needs:* §13.1; MetaplecticAutomorphicForms §§5.1, 6.4; AutomorphicSpectralTheory §2.4.

### 13.5 Semi-global and inert global identities

Prove that at an admissible inert place v₀ with p > 2, for v₀-admissible φ (§10.1) and positive definite T ∈ Herm_n(O_(F,(p))), Int_(T,v₀)(φ)·q^T = c_K·E′_(T,v₀)(z, φ) with c_K = (−1)^n/vol(K) of §13.4; that at almost self-dual level the auxiliary degree convention of §10.4 is used; and that for inert-admissible φ and nonsingular T with Diff(T,V) a single inert nondyadic place, summing the local formula gives Int_T(φ)·q^T = c_K·E′_T(z, φ) (LZ Theorem 13.6.1, pp. 83–84; Theorem 14.5.1 and Corollary 14.5.2, p. 86). The route uniformizes the special cycle by §10.3, substitutes the local identities §§3.5 and 4.3, evaluates the remaining point count by §13.4, and compares the product factors; the differentiated v₀-factor is W′_T(1, 0, φ_v₀) for φ_v₀ = 1_(Λ_v₀^n), the indicator of the lattice of the datum (self-dual as Λ₀ in §3.1, or almost self-dual as Λ₁ in §4.6), while T is the Gram matrix of the special homomorphisms.

**Checks.**

- A T not represented at v₀ but represented everywhere else has Diff(T,V) = {v₀}, the only place whose factor is differentiated.
- The hypothesis on φ is needed: Int_(T,v₀)(φ) is defined through the semi-global moduli cycle of §10.1 only for v₀-admissible φ, whose v₀-component is 1_(Λ_v₀^n); a φ whose v₀-component is the indicator of another lattice has no semi-global cycle on the model of Λ_v₀, and the identity is not asserted for it.
- The Schwartz factor at v₀ lives on the coherent local space of Λ_v₀, which does not represent T; using the indicator of the lattice spanned by the special homomorphisms instead would make the v₀-factor nonvanishing at s = 0, as in the §3.1 Check.
- At almost self-dual level the auxiliary convention divides by q+1, and §4.3 has no −Den term.
- The derivative uses log(q_(v₀)²) through §3.1; with log q_v₀ both sides would differ by 2.

*Needs:* §§3.5, 4.3, 10.1, 10.3–10.4, 13.2, 13.4.

### 13.6 Green star products and arithmetic degrees

Construct the archimedean contribution. For a tuple x = (x₁, …, x_m) with nonsingular Gram matrix, 1 ≤ m ≤ n, take the iterated star product g(x) = [g(x₁)] * ⋯ * [g(x_m)] of the Kudla Green currents of the divisors, with [g(x)] * [g(y)] = [g(x)]·δ_(D(y)) + [ω(x)]·g(y), defined because the divisors D(x_i) of independent labels meet properly; g(x) is a current of bidegree (m−1, m−1) on the (n−1)-dimensional complex Shimura variety with dd^c g(x) + δ_(D(x)) = ω(x₁) ∧ ⋯ ∧ ω(x_m). Only for m = n is g(x) of top bidegree (n−1, n−1), and only then is a scalar defined: for T of size n, Int_(T,φ) at each CM-type embedding is one half of the integral over the complex Shimura variety of the φ-weighted sum of the currents g(x) over the tuples x with Gram matrix T (LZ §15.3, pp. 87–88, and (15.3.0.1), p. 88), and the arithmetic degree is deĝ_T = Int_T + Σ Int_(T,φ). For m < n no scalar integral is defined without a complementary class of bidegree (n−m, n−m). On a proper hyperspecial model these nonsingular terms agree with the Gillet–Soulé arithmetic intersection degree; no such identification is made for auxiliary almost self-dual cycles (LZ §§15.2–15.4, pp. 87–89). The route uses Green currents of logarithmic type and the conjugate-embedding normalization, converting the 4π normalization of §12.3 back to LZ's 2π normalization before the comparison; the identification with the Gillet–Soulé degree is gap:arithmetic-chow-star-products.

Its API consists of the following facts:

- The star product has the stated divisor and current terms.
- Each CM-type complex integral carries the factor one half.
- On a proper hyperspecial model the arithmetic product recovers the nonsingular deĝ_T.
- The current-equivalence relation makes the hyperspecial arithmetic degree independent of Green representatives; products of currents outside the properly intersecting range are not asserted.

**Checks.**

- A conjugate pair of embeddings contributes exactly one full integral after the two halves.
- At n = 3 the Green current of a single label (m = 1) has bidegree (0,0), not the top bidegree (2,2), and has no scalar integral; for m = 3 independent labels it has bidegree (2,2) and the integral is defined.
- The star product needs proper intersection: for independent labels x, y the divisors D(x), D(y) are distinct and meet in codimension two or not at all, and [g(x)]·δ_(D(y)) is the restriction to D(y) of a current whose logarithmic singularity lies along D(x), which does not contain D(y). For y = x the term g(x)·δ_(D(x)) is not defined by restriction, and the self-product is not asserted; an arithmetic self-intersection requires the representative theory of gap:arithmetic-chow-star-products.
- In the rank-one almost self-dual example at valuation 2 the auxiliary number (q+2)/(q+1) differs from the Y-intersection 1, so their arithmetic degrees are not identified without the correction of §13.9.

*Needs:* §§10.4, 12.3; gap:arithmetic-chow-star-products (ArakelovGeometryAndAbelianHeights §§1.8–1.10).

### 13.7 Archimedean arithmetic Siegel–Weil coefficient

Prove that for nonsingular T of size n, K-invariant φ and each CM-type embedding, Int_(T,φ)(y, φ_K)·q^T = c_K·E′_(T,φ)(z, φ_K) with the same c_K as the finite formula (LZ Theorem 15.3.1, p. 88). The Kudla Green normalization, the Whittaker scaling and the factor one half are fixed together. The route applies Liu's archimedean local identities: for nonsingular T of signature (p, q) the archimedean Whittaker function vanishes to order at least q at s = 0, with an explicit value for positive definite T (Liu11a Proposition 4.5, p. 889), and for T of signature (m−1, 1) its derivative at s = 0 equals an explicit constant times e^(−2π tr T) times the archimedean local height integral of the Kudla–Millson forms and the Green form (Liu11a Theorem 4.17, p. 905); it then unfolds the Green integral over the Shimura variety and compares the finite normalization, as in LZ's proof of Theorem 15.3.1. When V is anisotropic, an alternative input is GS19 Theorem 1.1.2 and its nondegenerate case (1.1.19), p. 5, stated for compact unitary Shimura varieties of signature (p, 1) and genus r ≤ p+1, used with r = p+1 = n; for a single label its Green form is Kudla's Green function (GS19 Example 2.6.3, p. 22), and its forms for properly intersecting cycles agree with the star products modulo im d + im d^c (GS19 Theorem 1.1.1, p. 4), so their top-degree integrals over the compact Shimura variety coincide.

**Checks.**

- If Diff(T,V) is a single archimedean place, this identity is the whole coefficient.
- Dropping the factor one half doubles the left side.
- Using the 4π Gaussian of §14.1 without converting to LZ's 2π normalization changes the argument of the Green function.

*Needs:* §§13.2, 13.4, 13.6.

### 13.8 Unramified arithmetic Siegel–Weil formula

Prove that under the admissibility conditions of §13.3, if F/F₀ is unramified at every finite place and split above 2, and φ is inert-admissible and nonsingular at two split places, then Σ_(det T ≠ 0) deĝ_T(y, φ)·q^T = c_K·E′(z, φ) (LZ Theorem 15.5.1 and Remarks 15.5.2–15.5.3, p. 89). An unramified CM extension forces F₀ ≠ ℚ and makes the model proper in this setting; the two nonsingular split places remove the singular Fourier terms. The route applies, for each nonsingular T, its unique obstructing place and the finite (§13.5) or archimedean (§13.7) coefficient identity.

**Checks.**

- F₀ = ℚ is excluded: an imaginary quadratic field is ramified at some prime.
- Every nonsingular T has Diff(T,V) of odd cardinality; terms with |Diff| ≥ 3 vanish on both sides.
- Without the two split nonsingular places the singular T would contribute terms not covered by §§13.5 and 13.7.

*Needs:* §§13.2–13.3, 13.5, 13.7.

### 13.9 Modified ramified Eisenstein derivative

Define the modified derivative. Let v be a ramified place or an almost self-dual inert place of the datum (§13.3), φ = φ^v ⊗ φ_v the K-invariant Schwartz function, ^vV the coherent hermitian space over 𝔸_F nearby V at v (isometric to V at every place w ≠ v), and Λ_(t,v) ⊂ (^vV)_v a vertex lattice of type t with hermitian sharp dual Λ_(t,v)^♯ (the dual Λ^∨ at an inert place, so that Λ_(0,v)^♯ = Λ_(0,v) is self-dual) and stabilizer K_(Λ_(t,v)^♯) ⊂ U(^vV)(F₀,v). Put ^vEis_t(z, φ) = (vol(K_(G,v))/vol(K_(Λ_(t,v)^♯)))·E(z, 0, φ^v ⊗ 1_((Λ_(t,v)^♯)^n)), K_(G,v) the level of the datum at v and the volumes those of the Haar measures on U(V)(F₀,v) and U(^vV)(F₀,v) of LL1 Definition 3.8, p. 18. At a ramified place the correction is Σ_(j=1)^(t_max/2) c_(2j)·^vEis_(2j)·log q_v, with t_max and c_(2j) those of §8.1 for (^vV)_v; at an almost self-dual inert place it is c₀·^vEis₀·log(q_v²) with c₀ = −1/(q_v+1), where Λ_(0,v) is a self-dual lattice of the split space (^vV)_v. Define ∂Eis = Eis′ + (−1)^n·Σ_v (correction at v). The local sections are those paired with §8.1 and §4.5; they are not arbitrary coherent test functions (K (1.7)–(1.10), pp. 5–6).

Its API consists of the following facts:

- The ramified correction uses the coefficients c_(2j) of §8.1, each with its volume ratio and the test function 1_((Λ_(2j,v)^♯)^n) at v.
- The almost self-dual coefficient is −1/(q+1), with log(q²), the volume ratio vol(K_(G,v))/vol(K_(Λ_(0,v))) and the test function 1_((Λ_(0,v))^n) of a self-dual lattice of the nearby split space at v.
- The sum of coherent corrections carries the factor (−1)^n.
- The modified series is linear in factorizable test data with the fixed volume ratios and coefficients.

**Checks.**

- A place with no local correction contributes 0 to the correction sum.
- The almost self-dual coefficient c₀ = −1/(q+1) is negative.
- Replacing log(q²) by log q in the almost self-dual correction halves it.
- The volume ratio is part of the almost self-dual term. For n = 2r, in the measures of LL1 Definition 3.8 the almost self-dual stabilizer has volume (q_v+1)/(q_v^(2r) − 1) (LL1 §9, p. 44) and the self-dual stabilizer volume 1: at the Gram matrix T of Λ₀ that definition gives W_T(0, 1_(Λ₀^n)) = γ·b_(n,v)(0)⁻¹·vol(K_(Λ₀)) with γ = 1 on the split space, while LZ (3.3.0.1), p. 17, gives W_T(0, 1_(Λ₀^n)) = Den(Λ₀)·∏_(i=1)^n (1 − (−q_v)^(−i)) = b_(n,v)(0)⁻¹. So the ratio is (q_v+1)/(q_v^(2r) − 1) and, with (−1)^n = 1, the coherent value enters with the coefficient c₀·ratio·log(q_v²) = −log(q_v²)/(q_v^(2r) − 1). Halved for the factor 2 between the derivative parameters of Li–Zhang and Li–Liu (§4.6), this is the coefficient −log q_v/(q_v^(2r) − 1) of W_T(1_(Λ₀^n)) relative to W′_T(1_(Λ₁^n)) obtained by dividing the bracket ((q_v^(2r) − 1)/(q_v+1))·W′_T(φ₁) − (log q_v)/(q_v+1)·W_T(φ₀) of LL1 (9.3), p. 44, and of §4.6 by (q_v^(2r) − 1)/(q_v+1). At q_v = 3 and n = 2 the ratio is 4/8 = 1/2 and c₀·ratio = −1/8; omitting the ratio gives −1/4 and doubles the correction.

*Needs:* §§4.5–4.6, 8.1, 13.1, 13.3; MetaplecticAutomorphicForms §6.7.

### 13.10 Modified arithmetic Siegel–Weil formula

Prove that on an admissible Krämer–RSZ model for a hermitian space V of dimension n, for nonsingular T with Diff(T,V) = {v}, v nonsplit and nondyadic, and admissible φ, deĝ_T·q^T = c_K·∂Eis_T, unconditionally when n ≤ 3 or v is inert and, when n ≥ 4 and v is ramified, under the hypothesis (H_m), 4 ≤ m ≤ n, of §8.6; and that if moreover every dyadic place splits and φ is nonsingular at two split places, deĝ(z, φ) = c_K·∂Eis(z, φ), under the same hypothesis when n ≥ 4 and some finite place ramifies in F (K Theorems 10.1–10.2, pp. 79–80). The route treats the unique Diff place v according to its type under §13.3, which admits no exotic place. At an inert place with self-dual lattice the coefficient is that of §13.5, through §3.5. At an inert place with almost self-dual lattice, and at a ramified place with its Krämer model, the route repeats the argument of §13.5 (uniformization by §10.3, the local degree of §10.4 and the point count of §13.4) with the local identity §4.5 on the Li–Rapoport–Zhang model of §4.2, respectively §8.7, and with the corrections of §13.9 on the analytic side; at a ramified place of a hermitian space of dimension n ≥ 4 the local identity §8.7 is proved under the hypothesis (H_m), 4 ≤ m ≤ n, of §8.6, which is why the coefficient identity there, and with it the total formula when some finite place ramifies in F, is stated under that hypothesis. At an archimedean place the coefficient is that of §13.7. The route then sums the coefficients over T.

**Checks.**

- If v is inert and the lattice is self-dual, the correction at v is zero and the coefficient is the unramified one of §13.5.
- If v is ramified, the c_(2j) corrections are those for which ∂Den vanishes on the dual vertex lattices, so lattices with empty special cycle contribute zero on both sides.
- The total formula requires split dyadic places, a stronger condition than §13.3.

*Needs:* §§3.5, 4.2, 4.5, 8.6–8.7, 10.3–10.4, 13.3–13.5, 13.7, 13.9.

### Examples

If Diff(T,V) = {v₀} with v₀ inert and nondyadic, exactly the v₀ Whittaker factor is differentiated; if the unique obstructing place is archimedean, the halved Green integral gives the coefficient. At an almost self-dual inert place c₀ = −1/(q+1), and replacing log(q²) by log q changes the correction by a factor 2. A Schwartz function nonsingular at two split places removes the singular Fourier coefficients from the total formula.

### Dependencies

Layers 3–4, 8, 10 and 12 (§12.3); PELModuliPartII §§6.1, 6.5, 6.7–6.8, 7.2, 7.4, 7.10 and 8.5; AutomorphicSpectralTheory §§1.1, 1.2, 2.4; MetaplecticAutomorphicForms §§3.3, 4.5, 5.1, 6.2, 6.4, 6.7; GeometryOfNumbersAndQuadraticArithmetic §2.9; gap:arithmetic-chow-star-products.

## Layer 14: Global comparison and the strongly regular AFL

Construct Zhang's relative trace series from the local Jacquet–Rallis inputs, define the corrected holomorphic derivative and compare it over ℚ with the modular CM series, separate local logarithms, isolate strongly regular orbits, and prove the strongly regular AFL over ℚ_p, in its semi-Lie version for p ≥ n and its group version for p ≥ n + 1, by induction on n from the low-rank base of §9.8. The regular semisimple AFL statement is formulated and its strongly regular case identified.

### 14.1 Relative trace series and Gaussian inputs

Construct, for a fixed irreducible CM polynomial α, the relative orbital series J(h, Φ′, s) on SL₂(𝔸_ℚ) × (test functions), its entire continuation, its nonzero-norm Fourier expansion over orbits and the derivative decomposition ∂J = ∂Orb_nil + Σ_v ∂J_v; prove that partial transfer at fixed α commutes with the SL₂ Weil action; at infinity use the corrected partial Gaussians, for which the derivative for ξ < 0 is one half of the weight-one Whittaker factor times Ei(−4πa|ξ|); and match the nonsingular local characteristic functions by the Jacquet–Rallis fundamental lemma of EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5, carried to Zhang's formulation by gap:jr-zhang-formulation-fl (Z §§11.3–12.7, (12.32)–(12.38), Theorem 12.14; Appendix A, Theorem A.1; MZ §§7.1–7.3 and footnote 5, pp. 33–36). Regular nilpotent orbits are included in the constant term. The route builds the series from the local inputs of gap:jr-zhang-formulation-fl, gap:jr-smooth-transfer-existence and gap:jr-transfer-weil-compatibility, the adelic Weil representation and the Poisson summation of AnalyticNumberTheoryPartII §5.3h.

Its API consists of the following facts:

- J(h, Φ′, s) is entire in s and automorphic in h of the weight fixed by the archimedean Gaussian.
- Its ξ-th Fourier coefficient for ξ ≠ 0 is the sum of the orbital integrals over the orbits with characteristic polynomial α and invariant ξ.
- Its derivative at s = 0 decomposes as ∂Orb_nil + Σ_v ∂J_v, with ∂J_v the local derivative at v times the away-from-v orbital integrals.
- For matching test data the series is unchanged under partial transfer at fixed α, compatibly with the SL₂ Weil action.

**Checks.**

- The archimedean derivative carries Ei(−4πa|ξ|); Zhang's printed normalization differs and is replaced by MZ's.
- The nilpotent orbital term is part of ∂J and is not discarded.
- Matching uses Jacquet–Rallis transfer factors; ordinary endoscopic transfer is not used.

*Needs:* §9.3; EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5; gap:jr-zhang-formulation-fl, gap:jr-smooth-transfer-existence and gap:jr-transfer-weil-compatibility (EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.13); MetaplecticAutomorphicForms §§2.5, 3.3, 4.5; AnalyticNumberTheoryPartII §§5.3g–5.3h.

### 14.2 Corrected holomorphic derivative

Define, for F₀ = ℚ and a Shimura variety of a hermitian space of dimension m ≥ 3 (where Int_B and Int_(K−B) are defined, §12.8), ∂J_hol = 2∂J + Int_(K−B) and E♭ = ∂J_hol + Int_B = 2∂J + Int_K, with the same α, matching rational finite test data and the corrected Gaussian normalization; the constant and nilpotent terms are kept (Z Proposition 14.5; §14.3 and proof of Theorem 14.6, with the coefficient of ∂J_hol in E♭ equal to one). The route cancels the archimedean exponential-integral terms and the logarithmic constants through the nilpotent identity.

Its API consists of the following facts:

- ∂J_hol has coefficient two on ∂J.
- E♭ has coefficient one on ∂J_hol.
- The archimedean parts satisfy Int_(K,∞) = −2∂J_∞ in the corrected Whittaker scaling.
- Substituting the definitions gives E♭ = 2∂J + Int_K coefficientwise, including the constant and nilpotent terms.

**Checks.**

- Expanding E♭ gives exactly 2∂J + Int_K.
- A second factor 2 in front of ∂J_hol would give 4∂J and contradict the local identity −2∂J_v = Int_v of §14.3.
- The nilpotent logarithm cancels the zero-vector Green value −log|a| of §12.3.

*Needs:* §§12.9, 12.11, 14.1.

### 14.3 Conditional global arithmetic comparison

Prove that for F₀ = ℚ, semi-Lie dimension m ≥ 3 (the hermitian space of the Shimura variety has dimension m, and the modularity of §12.9 needs m ≥ 3), a finite set S containing the model, level and small-residue primes, matching rational finite test data and the prescribed Gaussians, if the group AFL for S_m holds at all p ∉ S then E♭ = 0, and consequently each good place v and ξ ≠ 0 satisfy −2∂J_v(ξ) = Int_v(ξ) in ℚ·log p_v (Z Theorem 14.6). To use §9.7 in semi-Lie dimension m, enlarge B by the finitely many inert p ∉ S with p ≤ m+1 and by the nonmaximal-order places, and use the norm-unit reduction §9.5(c), which has no residue bound, at the added places. The route shows that the coefficients with (ξ, B) = 1 vanish by §9.7 or §9.5(c), applies the vanishing criterion AutomorphicFormsOnReductiveGroups §4.4 `fourierUnitVanishing` over ℚ with this B, and separates the finite sum by the ℚ-linear independence of the logarithms of distinct primes in ℝ_S.

**Checks.**

- B stays finite after adding the primes p ≤ m+1, so the vanishing criterion of AutomorphicFormsOnReductiveGroups §4.4 still applies.
- Logarithms of distinct primes are ℚ-linearly independent, so a vanishing finite sum Σ c_p log p with c_p ∈ ℚ forces each c_p = 0.
- At an added prime p ≤ m+1 the maximal-order input is not used.

*Needs:* §§9.5, 9.7, 12.10, 14.2; AutomorphicFormsOnReductiveGroups §4.4 `fourierUnitVanishing`.

### 14.4 Orbitwise semi-Lie AFL from the global comparison

Prove that at a good inert v, for a strongly regular global pair (δ, u) with characteristic polynomial α and q(u) ≠ 0, the comparison of §14.3 gives −∂Orb((γ,u′), 1_integral) = Int_v(δ,u)·log q_v for its matching pair, choosing the away-from-v test functions to isolate the prescribed orbit neighbourhood with a nonzero common orbital factor and cancelling that factor only after proving it nonzero (Z Corollary 14.8; Lemma 13.7 and Proposition 13.8). The route uses compactness modulo conjugation, local constancy §9.6, a nonnegative away-from-v orbital test function on the unitary side, and a partner on Zhang's side matching it at every finite place away from v, whose existence is gap:jr-smooth-transfer-existence.

**Checks.**

- A nonnegative test function that is positive at the orbit has positive orbital integral, so the cancelled factor is nonzero.
- The isolated neighbourhood contains finitely many rational orbits by §9.6.
- The identity is for strongly regular pairs; a regular semisimple pair that is not strongly regular is not reached.

*Needs:* §§9.6, 12.10, 14.3; gap:jr-smooth-transfer-existence.

### 14.5 Strongly regular AFL over ℚ_p

Prove that for F₀ = ℚ_p with p odd: Conjecture 3.8(b) holds for matching strongly regular pairs of S_(n−1) × V′_(n−1) and U(V_(n−1)) × V_(n−1) when p ≥ n; and Conjecture 3.8(a) holds for matching strongly regular elements of S_n and U(V_n) when p ≥ n + 1, and for every odd p when n ≤ 3; in each case ∂Orb = −Int·log p with the transfer factor included (Z Theorem 15.1 and proof; Conjecture 3.8). Z Theorem 15.1 also states part (a) at p = n; for n ≥ 5 that case rests on the converse of §9.5(b) at q = n, asserted there only for n ≤ 3, and it is not part of this theorem. The route inducts on n. For n ≤ 3 the statement is §9.8 with F₀ = ℚ_p: the group AFL from Zhang's low-rank computation and the semi-Lie AFL in dimension n − 1 ≤ 2 by §9.5(b), since q = p ≥ n. For n ≥ 4 the semi-Lie AFL in dimension m = n − 1 ≥ 3 is proved by globalizing the local CM order over an imaginary quadratic field, arranging det(1−g) a unit and q(u) ≠ 0, approximating by a rational pair and applying §§9.6 and 14.4 on the Shimura variety of an m-dimensional hermitian space, where §12.9 holds; S contains the primes p′ ≤ m, so the group AFL for S_m at the primes outside S required by §14.3, and at the prime m + 1 added to B there, is the induction hypothesis at primes p′ ≥ m + 1 = n, which the restricted statement provides; §9.7 supplies the maximal-order input of §14.3; and the group AFL for S_n follows from the semi-Lie one by §9.5(a) for p ≥ n + 1. The global step is not used in semi-Lie dimension two: it would need arithmetic modularity on unitary Shimura curves, which the Borcherds products of §12.5 do not give (BHKRY §1.5).

**Checks.**

- n = 1: the group statement is empty (§9.8) and the semi-Lie statement, in dimension n − 1 = 0, is vacuous. The semi-Lie statement in dimension one is the n = 2 instance, computed from §0.9: at norm valuations a = 1 and 3 the intersection numbers are 1 and 2 and the normalized derivatives ∂Orb/log p are −1 and −2.
- n = 3 is still a base case (§9.8): its semi-Lie dimension is two, and the global comparison in dimension two would need the arithmetic modularity of unitary Shimura curves, which §12.9 does not assert; n = 4 is the first global step, on a three-dimensional hermitian space.
- p = n can occur only when n is an odd prime. At (n, p) = (3, 3) both parts hold by §9.8; at (n, p) = (5, 5) part (b) on V₄ is asserted and part (a) for S₅ is not, since its deduction from part (b) needs the converse of §9.5(b) at q = n = 5, where the 6 residues of F^1 can all be excluded.
- The induction never uses part (a) at p = n: the step to S_n uses part (a) for S_(n−1) only at primes p′ ≥ n = (n − 1) + 1.
- A regular semisimple element that is not strongly regular is outside this theorem.

*Needs:* §§0.9, 9.5–9.8, 12.9, 14.4.

### 14.6 The regular semisimple AFL statement

Formulate, for an unramified quadratic extension of p-adic fields of odd residue characteristic, the AFL for arbitrary regular semisimple data in the group and semi-Lie versions (∂Orb(γ, 1_(S_n(O_F₀))) = −Int(g)·log q for matching regular semisimple γ and g, and its semi-Lie analogue), prove that the two versions are equivalent under q ≥ n+1 as in §9.5, and prove that its restriction to strongly regular data over F₀ = ℚ_p is §14.5 in the semi-Lie version for p ≥ n and in the group version for p ≥ n + 1, and that its group version in rank n ≤ 3 is §9.8, for regular semisimple data over every finite extension of ℚ_p with p odd (Z Conjecture 3.2; Remark 4.13; Theorem 15.1). In rank n ≥ 4 the statement for regular semisimple data that are not strongly regular, over p-adic fields other than ℚ_p, and the group version over ℚ_p at p = n, are not proved here.

**Checks.**

- A regular semisimple element that is not semisimple for U(V_n)-conjugation lies in the statement but not in §14.5.
- Over F₀ = ℚ_p the strongly regular case is §14.5: the semi-Lie version for p ≥ n and the group version for p ≥ n + 1; the group version at p = n ≥ 5 is excluded.
- For n = 1 the group statement is empty, hence true, for every q (§9.8).
- In rank n ≤ 3 the base field is not restricted: over the unramified quadratic extension of ℚ₃ (q = 9) the n = 2 example of §9.8 gives ∂Orb = −log 9 = −Int·log q with Int = 1, although F₀ ≠ ℚ_p; the exclusion of fields other than ℚ_p concerns only n ≥ 4.

*Needs:* §§9.1–9.3, 9.5, 9.8, 14.5.

### Examples

Expanding the corrected series gives E♭ = (2∂J + Int_(K−B)) + Int_B = 2∂J + Int_K; a second factor 2 would give 4∂J and contradict the finite AFL sign. Enlarging B by finitely many small inert primes keeps the vanishing criterion, and at those primes the norm-unit reduction applies. Distinct prime logarithms are ℚ-linearly independent, so the finite local terms separate.

### Dependencies

Layers 0, 9 and 12; EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5; gap:jr-zhang-formulation-fl, gap:jr-smooth-transfer-existence and gap:jr-transfer-weil-compatibility; AutomorphicFormsOnReductiveGroups §4.4; MetaplecticAutomorphicForms §§2.5, 3.3, 4.5; AnalyticNumberTheoryPartII §§5.3g–5.3h.

## Downstream consumers

The arithmetic inner product formula for unitary groups consumes the global r-tuple K-classes and uniformization of §§10.2–10.3 and the local identities of §§3.5, 4.5–4.6, 6.8–6.9 and 8.7, the last in rank n ≥ 4 under the hypothesis (H_m) of §8.6; MotivesAndAlgebraicCycles §7.19 states Li–Liu's theorems with the almost self-dual identity as an explicit local premise, which §4.5 with §4.6 discharges in Li–Liu's normalization. Those theorems keep their own automorphic hypotheses, height domains and doubling normalizations, which do not follow from a local Kudla–Rapoport identity. The strongly regular AFL of §14.5 is the local input of arithmetic Gan–Gross–Prasad comparisons for unitary groups. The higher arithmetic Chow products of §13.6 feed arithmetic Siegel–Weil formulas in higher codimension; the AFL branch needs only the divisor and proper one-cycle pairing of §12.8, modularity and the relative trace series.

## Source corrections

The following corrections are part of the statements above; each is stated with its location in the version listed under References.

- LZ §8.2 (proof of Theorem 8.2.1): the induction transports only the difference of the vertical functions after applying the identity in smaller valuation; transporting horizontal and vertical terms separately is not valid (§3.5).
- LZ Remark 6.4.2 and Lemmas 6.4.5–6.4.7: the Cartier class is [O_D] = [O] − [O(−D)] with ch(O_D) = 1 − exp(−c₁(O(D))), and the signs of the higher powers follow (§2.6).
- LZ proof of Theorem 10.4.3, rank one: the intersection Z(x₀) ∩ Z(x) is empty for valuation 0 and nonempty from valuation 2, giving Int_Y = a/2 for even a ≥ 0 (§4.5).
- LZ Conjecture 10.4.1: the comparison geometry used by Theorem 10.5.1 is LRZ Theorem 14.6.2 with Corollary 16.1.5, with the exceptional divisor equal to the reduced inverse image of the balloon locus (§4.2).
- LZ Definition 3.5.1 against LZ §7.3: the differentiated weight is m(0) = 0, m(1) = 1; the extension m(0) = 1 is not used, and type zero does not occur in the nonsplit full-rank setting (§3.2).
- LL2 Lemma 2.56: the reflection fixes x_i for i < n and sends x_n to −x_n, for a normal basis whose last vector spans an anisotropic rank-one block (§5.6). LL2 proof of Proposition 2.44: the conductor term is indexed by the outer variable j; the statement of the proposition is correct as printed (§5.5).
- LL1 Lemma 5.4 and §8: the number of tensor factors is the tuple rank r (§§10.1–10.2). LL1 Proposition 9.1, p. 40, and (9.2), p. 44: the coefficient of the term with the self-dual lattice Λ⋆_u is log q_u/(q_u^(2r) − 1), not the printed log q_u/(q_u^r − 1), as (9.3), which is deduced from (9.2) on the same page through vol(L_u) = (q_u+1)/(q_u^(2r) − 1), and LZ Remark 10.5.4, p. 72, after the change of parameter of §4.6, require (§13.9).
- K Definition 2.2: the framing quasi-isogeny is required to be compatible with the polarizations (§7.1). K §3.1: for m = 1 the incidence map is the identity of ℙ¹; the description of singular rational points applies for m ≥ 2 (§7.2). K Theorem 3.19 and Proposition 3.20: positive strata meet only along a positive-type vertex sum, and the support criterion assumes L integral (§7.4). K Proposition 3.17: type-zero reducedness needs its own argument (§7.3).
- K Theorem 8.2: only constancy on W_(≥0) ∖ {0} holds; vanishing on the negative cone fails by the rank-three example of §8.4; in (8.6) the orthogonal-sum sign is χ(−1)^n₁ (§8.4).
- K Lemma 9.6: the valuation decrease fails exactly when the largest invariant of L♭ + O_F·x is odd and K's minor count drops by one, as for the split plane H₁, for ⟨π₀⟩ ⊥ H₃ with L♭ = ⟨e⟩ ⊥ ⟨l₁ + πl₂⟩ and for H₁ ⊥ H₁; the proof of K Theorem 9.7 is incomplete at these pairs (L♭, x), and H₁ ⊥ H₁, which has no rank-one orthogonal summand, is reached by no presentation. Rank two is §7.5a, rank three is HSY23a Theorem 1.2 (statement (H₃) of §8.6), and in rank n ≥ 4 the missing step is the statement (H_n) of §8.6, under which §§8.7 and 13.10 are stated in that rank.
- Z §12 and Lemma 14.3: the Gaussian and Green scales are those of MZ, with −Ei(−4πa|ξ|) (§§12.3, 14.1). Z §14.3: the corrected series is E♭ = ∂J_hol + Int_B = 2∂J + Int_K (§14.2).
- Z Theorem 8.6 and the proof of Theorem 15.1: the arithmetic modularity is deduced from BHKRY, whose Borcherds products require n ≥ 3 (BHKRY §1.5), while the induction applies it on Shimura varieties of every dimension from two on. Here arithmetic modularity is asserted only for n ≥ 3 (§12.7), and the semi-Lie dimension-two step is the rank-three AFL of Zha12 (§§9.8, 14.5).
- Z Proposition 3.9 in the proof of Theorem 14.6: in semi-Lie dimension m the maximal-order input is used only for p > m+1, the remaining small inert primes being added to B (§14.3). Z Proposition 4.12(ii): the norm-unit implication holds without a bound on q (§9.5). Z Proposition 4.12(i): the semi-Lie-to-group direction also requires 1 − ξd to be a unit, which, after Z's reduction to integral d and an integral characteristic polynomial of g′ (justified in §9.5), the elementary count gives for q ≥ n+1 and the compactness of U(V_(n−1)) gives for n ≤ 3; Z deduces it from the integrality of det(1 − g), which fails in general when V_(n−1) is isotropic, so at q = n ≥ 4 the direction is not established (§9.5), and Z Theorem 15.1's group statement at p = n ≥ 5, which uses it, is not asserted here (§14.5). Z Theorem 5.5: the rank-raising argument gives joint local constancy for q ≥ m in semi-Lie dimension m (§9.6). Z Lemma 5.4: the surjectivity of the differential uses cyclicity of u, not étaleness of F[x] (§9.6).

## References

- **LZ.** Chao Li and Wei Zhang, [Kudla–Rapoport cycles and derivatives of local densities](https://arxiv.org/abs/1908.01701v3), arXiv:1908.01701v3; published in J. Amer. Math. Soc. 35 (2022). Locators use the arXiv v3 pagination.
- **Z.** Wei Zhang, [Weil representation and arithmetic fundamental lemma](https://arxiv.org/abs/1909.02697v3), arXiv:1909.02697v3; published in Ann. of Math. 193 (2021), DOI 10.4007/annals.2021.193.3.5. Locators are section, theorem and equation numbers, which agree between the two versions.
- **LL1.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), author copy; published in Ann. of Math. 194 (2021). Page locators are those of the author copy.
- **LL2.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups, II](https://www.math.columbia.edu/~chaoli/AIPF2.pdf), author copy; published in Forum Math. Pi 10 (2022), with different pagination. Page locators are those of the author copy.
- **K.** Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, [A proof of the Kudla–Rapoport conjecture for Krämer models](https://arxiv.org/abs/2208.07988v2), arXiv:2208.07988v2; published in Invent. Math. 234 (2023). Locators use the arXiv v2 pagination.
- **HSY23b.** Qiao He, Yousheng Shi and Tonghai Yang, [The Kudla–Rapoport conjecture at a ramified prime for U(1,1)](https://arxiv.org/abs/2011.01356v3), arXiv:2011.01356v3; published in Trans. Amer. Math. Soc. 376 (2023), 2257–2291. Locators use the arXiv v3 pagination: footnote 1, p. 3; Theorems 1.1 and 1.2, p. 4; Theorem 1.3, p. 5. It treats the isotropic rank-two Krämer space.
- **Shi22.** Yousheng Shi, [Special cycles on unitary Shimura curves at ramified primes](https://arxiv.org/abs/2004.07158v4), arXiv:2004.07158v4; published in Manuscripta Math. (2022), whose theorem numbering may differ. Locators use arXiv v4: Theorem 1.1, p. 3; Theorems 1.2 and 1.3, p. 4. It treats the anisotropic rank-two Krämer space.
- **HSY23a.** Qiao He, Yousheng Shi and Tonghai Yang, [Kudla–Rapoport conjecture for Krämer models](https://arxiv.org/abs/2208.07992v3), arXiv:2208.07992v3; published in Compositio Math. 159 (2023), 1673–1740. Locators use the arXiv v3 pagination: Conjecture 1.1, (1.10) and Theorem 1.2, p. 4; Theorems 1.3–1.4, p. 5; Proposition 2.6 and Corollary 2.7, p. 10; Proposition 3.2, p. 14; Corollaries 3.5–3.7, p. 16; Theorem 6.1, p. 26.
- **LRZ.** Chao Li, Michael Rapoport and Wei Zhang, [Quasi-canonical AFL and arithmetic transfer conjectures at parahoric levels](https://arxiv.org/abs/2404.02214v2), arXiv:2404.02214v2. Page locators are the printed pages of that version.
- **MZ.** Andreas Mihatsch and Wei Zhang, [On the arithmetic fundamental lemma conjecture over a general p-adic field](https://arxiv.org/abs/2104.02779v4), arXiv:2104.02779v4; published in J. Eur. Math. Soc., DOI 10.4171/JEMS/1375, whose numbering may differ. Locators use arXiv v4.
- **Howard19.** Benjamin Howard, [Linear invariance of intersections on unitary Rapoport–Zink spaces](https://arxiv.org/abs/1811.01482v2), arXiv:1811.01482v2; published in Forum Math. 31 (2019). Locators use the arXiv v2 pagination: Theorem B (his Theorem 5.1) and Corollary C, p. 2; Corollary D, p. 3. The paper works over a quadratic extension of ℚ_p, on the Krämer model when it is ramified.
- **Lusztig76.** George Lusztig, Coxeter orbits and eigenspaces of Frobenius, Invent. Math. 38 (1976); cited by locator (1.18, 6.1 and 7.3): the unitary cases through LZ §5.3, the case ²D_n (n ≥ 3, where ²D₃ = ²A₃) through LL2 Lemma 2.32.
- **Ter13a.** Ulrich Terstiege, [Intersections of special cycles on the Shimura variety for GU(1,2)](https://arxiv.org/abs/1006.2106v1), arXiv:1006.2106v1; published in J. Reine Angew. Math. 684 (2013). Locators use the arXiv v1 pagination; its Lemma 3.1 and Proposition 3.2 carry the numbers LZ cites.
- **Ter13b.** Ulrich Terstiege, [On the regularity of special difference divisors](https://arxiv.org/abs/1209.1286v1), arXiv:1209.1286v1; published in C. R. Math. Acad. Sci. Paris 351 (2013). Locators use the arXiv v1 pagination.
- **KR11.** Stephen Kudla and Michael Rapoport, [Special cycles on unitary Shimura varieties I. Unramified local theory](https://arxiv.org/abs/0804.0600v2), arXiv:0804.0600v2; published in Invent. Math. 184 (2011). Locators use the arXiv v2 pagination; the paper works over F₀ = ℚ_p.
- **Mih16.** Andreas Mihatsch, [Relative unitary RZ-spaces and the Arithmetic Fundamental Lemma](https://arxiv.org/abs/1611.06520v2), arXiv:1611.06520v2. Locators use the arXiv v2 pagination: Definition 1.7, p. 4; Theorem 1.12, p. 5; Corollary 9.9, pp. 39–40.
- **Liu11a.** Yifeng Liu, [Arithmetic theta lifting and L-derivatives for unitary groups, I](https://msp.org/ant/2011/5-7/ant-v5-n7-p01-p.pdf), Algebra & Number Theory 5 (2011), no. 7, 849–921, DOI 10.2140/ant.2011.5.849. Locators are the printed pages: Theorem 3.5, p. 874; Lemma 3.6, p. 876; Proposition 4.5, p. 889; Theorem 4.17, p. 905.
- **BHKRY.** Jan Hendrik Bruinier, Benjamin Howard, Stephen S. Kudla, Michael Rapoport and Tonghai Yang, [Modularity of generating series of divisors on unitary Shimura varieties](https://arxiv.org/abs/1702.07812v3), arXiv:1702.07812v3; published in Astérisque 421 (2020). Locators use the arXiv v3 pagination: Theorem A, p. 3; §1.5, pp. 11–12; Proposition 4.2.2 and Theorem 4.2.3, p. 68; Theorem 5.3.1, pp. 76–77; Theorem 5.3.3, p. 78; Theorems 7.2.1–7.2.4, pp. 101–102; (7.3.3), p. 104.
- **Bor98.** Richard E. Borcherds, [Automorphic forms with singularities on Grassmannians](https://arxiv.org/abs/alg-geom/9609022v2), arXiv:alg-geom/9609022v2; published in Invent. Math. 132 (1998), with different pagination. Locators use the arXiv pagination: §6, pp. 22–27, with Theorem 6.2, p. 24; Theorem 13.3, p. 48.
- **Bor99.** Richard E. Borcherds, [The Gross–Kohnen–Zagier theorem in higher dimensions](https://arxiv.org/abs/alg-geom/9710002v3), arXiv:alg-geom/9710002v3; published in Duke Math. J. 97 (1999). Locators use the arXiv pagination: §2, p. 3; Theorem 3.1, p. 5; Theorem 4.1 and its proof, pp. 7–8; Lemmas 4.3–4.4, pp. 8–9; Theorem 4.5, p. 9, and the remark on the central action, p. 10.
- **McGraw03.** William J. McGraw, The rationality of vector valued modular forms associated with the Weil representation, Math. Ann. 326 (2003), 105–122, DOI 10.1007/s00208-003-0413-1; cited for its main theorem, that the holomorphic vector-valued modular forms for the Weil representation of an even lattice have a basis with rational Fourier coefficients.
- **Zha12.** Wei Zhang, [On arithmetic fundamental lemmas](https://math.mit.edu/~wz2113/math/online/AFL.pdf), author copy of Invent. Math. 188 (2012), 197–252, DOI 10.1007/s00222-011-0348-1, carrying the journal pagination: §2.2, pp. 206–210; Conjecture 2.9, p. 210; Theorem 2.10, p. 211; Remark 11, p. 245; Theorem 5.5, p. 250.
- **YZZ09.** Xinyi Yuan, Shou-Wu Zhang and Wei Zhang, [The Gross–Kohnen–Zagier theorem over totally real fields](https://archive.ymsc.tsinghua.edu.cn/pacm_download/355/9138-GKZ.pdf), Compositio Math. 145 (2009), 1147–1162, DOI 10.1112/S0010437X08003734. Locators are the journal pages: Theorem 1.3, p. 1150; Proposition 3.1, pp. 1157–1158; §4.1, pp. 1158–1159.
- **ES.** Stephan Ehlen and Siddarth Sankaran, [On two arithmetic theta lifts](https://arxiv.org/abs/1607.06545v2), arXiv:1607.06545v2; published in Compositio Math. 154 (2018). Locators use the arXiv v2 pagination: Theorem 3.6, p. 27; Theorem 4.13, p. 36.
- **KM90.** Stephen S. Kudla and John J. Millson, [Intersection numbers of cycles on locally symmetric spaces and Fourier coefficients of holomorphic modular forms in several complex variables](http://www.numdam.org/item/PMIHES_1990__71__121_0/), Publ. Math. IHÉS 71 (1990), 121–172. Locators are the journal pages: Theorem 2, p. 126; Theorem 3, p. 127.
- **VZ84.** David A. Vogan and Gregg J. Zuckerman, [Unitary representations with nonzero cohomology](http://www.numdam.org/item/CM_1984__53_1_51_0/), Compositio Math. 53 (1984), 51–90. Locator: Theorem 8.1, p. 88.
- **GS19.** Luis E. Garcia and Siddarth Sankaran, [Green forms and the arithmetic Siegel–Weil formula](https://arxiv.org/abs/1808.09313v1), arXiv:1808.09313v1. Locators use the v1 numbering and pagination: Theorem 1.1.1, p. 4; Theorem 1.1.2 and equation (1.1.19), p. 5; Example 2.6.3, p. 22.
