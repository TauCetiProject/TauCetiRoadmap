# Roadmap: potential automorphy infrastructure, Part II: Dwork switching motives

**Summary.** This roadmap builds the Dwork pencil `X₁ᴺ + ⋯ + X_Nᴺ = N t X₁⋯X_N` over the punctured line `T₀ = ℙ¹ − ({∞} ∪ μ_N)`, the eigen-local-systems cut out of its middle cohomology by characters of the diagonal symmetry group, and the arithmetic and geometric theory of these local systems needed to move between Galois representations at two primes. From Levelt's rigidity theorem (HypergeometricMotives), linear algebra over finite fields (finite unitary groups, Zalesskii–Serezhkin) and Katz's hypergeometric sheaves it proves that the complex monodromy is maximally unipotent at infinity and that the residual monodromy is the full special linear, special unitary or symplectic group; from Deligne's computation of the Fermat hypersurface it computes Frobenius determinants as Gauss-sum products; from the comparison theorems of `p`-adic Hodge theory it proves that the fibres are de Rham with consecutive labelled Hodge–Tate weights, ordinary near the Fermat point and near infinity, and Steinberg near infinity away from the coefficient prime. The end theorems are the switching theorems: Qian's theorem for non-self-dual Dwork motives, the symplectic switch in the self-dual family used by Barnet-Lamb–Gee–Geraghty–Taylor, and the auxiliary systems `R_aux` and `S_UA` of Boxer–Calegari–Gee–Newton–Thorne for every `n ≥ 1` and `m ≥ 2`, built from Dwork families and, in rank two, from twisted modular curves.

PotentialAutomorphyInfrastructure supplies the automorphy-lifting and transport interface for potential automorphy over CM fields and leaves the Dwork families, and the construction of potential-automorphy witnesses from them, to their own roadmaps. This Part II is that Dwork-family roadmap: it supplies the geometric families and switching points that the potential-automorphy theorems consume, and from PotentialAutomorphyInfrastructure it uses only the density-one large-image theorem for rank-two compatible systems (§2.20).

## Scope and ownership

This roadmap owns:

- the linear algebra of hypergeometric pairs in the form Layers 4 and 5 consume it (pseudo-reflections as Mathlib's non-identity dilatransvections, the two-pair and absolute-irreducibility corollaries of Levelt's theorem in the triple order `h₀h₁h∞ = 1`, and the Dwork specialisation) and the finite classical-group inputs it needs: finite unitary and similitude groups, Hermitian forms over finite fields, the normal-subgroup and composition-factor consequences for `SL_n` and the perfectness, simplicity and normal subgroups of `SU_n` over finite fields of odd characteristic, the restricted Artin non-isomorphism statement, the Zalesskii–Serezhkin classification in odd characteristic and dimension at least three, and the Goursat-type product lemma (Layer 0);
- the Dwork pencil, its symmetry groups, exponent data and index sets, the auxiliary-modulus lemma and the quotient family over `ℙ¹ − {0, 1, ∞}` (Layer 1);
- the Dwork eigen-local-systems over the parameter line, whose stalks are the eigenrealizations of ModularityAndLanglandsExtensions §2.9, their rational forms at every finite coefficient place (those above the primes dividing `N`, which that section excludes, included), their ranks for every exponent datum, Poincaré duality, the integral, torsion and Betti self-dual real forms, the Fermat-fibre splitting, and the torsion-freeness of integral Betti cohomology of smooth complete intersections deduced from the étale statement (Layer 2);
- Katz's hypergeometric sheaves attached to lists of distinct nontrivial Kummer characters, their rank, purity, determinant and local monodromy, Katz's comparison theorem for Dwork eigensheaves, the comparison characters and the twisted systems `W` (Layer 3);
- complex monodromy of the Dwork systems (Layer 4), residual monodromy, the residual hypergeometric groups and the level-structure torsors for linear and unitary data and their products (Layer 5);
- Frobenius on Fermat eigenlines, Gauss-sum determinants, finite-field-valued character roots and determinant matching, and the `λ`-independence of the comparison characters and of the twisted Frobenius polynomials (Layer 6);
- de Rham, crystalline, ordinarity, inertia and Steinberg properties of Dwork fibres, the comparison character as an algebraic Hecke character, the weakly compatible Dwork systems, the Drinfeld–Kedlaya slope bound and generic crystalline ordinarity (Layer 7);
- regular ordinarity of the Dwork fibres near infinity, by verifying the hypotheses of the criterion of ModularityAndLanglandsExtensions §2.11 for the Dwork data (Layer 8);
- the switching theorems and the auxiliary systems built from them, together with two general inputs that no supplier states: elliptic curves over every prime field `𝔽_p` with every Frobenius trace `β` such that `β² ≤ 4p`, among them an ordinary and a supersingular one (§9.13), and algebraic Hecke characters of imaginary CM fields with a prescribed pure infinity type (§9.14) (Layer 9).

It leaves to the named roadmaps, and does not restate:

- transvections and dilatransvections of a module, their determinants, base change and Dieudonné's generation theorem: Mathlib `LinearMap.transvection`, `LinearEquiv.transvections`, `LinearEquiv.dilatransvections` (Mathlib/LinearAlgebra/Transvection/Basic.lean and Generation.lean); elementary matrix transvections and their factorisation in `SL_n`: Mathlib `Matrix.transvection`, `Matrix.TransvectionStruct`, `Matrix.SpecialLinearGroup.exists_list_transvec_mul_diagonal_mul_list_transvec`; generation of `SL_n(K)` by transvections over every field, perfectness of `SL_n(K)` and simplicity of `PSL_n(K)` for `n ≥ 3`, or `n ≥ 2` and `#K ≥ 4`: Tau Ceti `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`, `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card`, `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard`, `Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup_of_three_le_card`, `Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup_of_four_le_natCard`;
- unitary and special unitary matrix groups over a star ring: Mathlib `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`; symplectic matrices: Mathlib `Matrix.symplecticGroup`; Goursat's lemma: Mathlib `Subgroup.goursat`; Hilbert 90: Mathlib `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`; Gauss and Jacobi sums: Mathlib `gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `gaussSum_mulShift`, `jacobiSum`; multiple Jacobi sums, their expression through Gauss sums and the count of points on diagonal equations: CharacterSumsOverFiniteFields §2.4;
- Dickson's classification of the finite subgroups of `PGL₂` over an algebraically closed field of positive characteristic: ArithmeticGaloisRepresentations §4.4 (the input of the rank-two case of §0.11);
- Kummer sheaves `ℒ_χ` over a field, their Frobenius-trace convention, tameness at `0` and `∞`, tensor laws and the comparison `j_!ℒ_χ ≅ Rj_*ℒ_χ`: FourierDeligneTransform §§2.3 and 2.6 (this roadmap adds only their family over `ℤ[ζ_N, 1/N, 1/l]`, §3.1);
- companion matrices, their characteristic and minimal polynomials: ClassicalArithmeticCompletion §2.46 and §2.60; Levelt's rigidity theorem over an arbitrary field, with the companion normal form of a hypergeometric triple, the rank-one difference of two companion matrices and the irreducibility of the group generated by two companion matrices with coprime characteristic polynomials: HypergeometricMotives §§3.1, 3.2 and 3.4 (this roadmap states only the two-pair form and the translation into its own order of the triple);
- étale fundamental groups, proper and smooth proper base change, adic realization, compact supports, Künneth and smooth purity: EtaleCohomologyFoundations §§F.0.2, F.0.A2, F.2.1, F.2.4–F.2.7, F.3, F.4.2, F.4.5 and F.6;
- the Artin comparison, relative Betti local systems, Hodge theory of smooth proper complex varieties and relative Hodge bundles: ComplexComparisonPartII §§C5.2, C5.3, C6.5 and C6.6;
- the Grothendieck–Lefschetz trace formula: InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3; tame specialization of fundamental groups: InverseGaloisAndArithmeticFundamentalGroups §IG.1.3;
- Deligne's weights, purity and geometric semisimplicity: DeligneWeightsAndPurity §§0.1, 3.2, 7.15 and 8.19; `ℓ`-adic Poincaré duality: EtaleDualityAndPerverseSheaves §§0.5–0.6; the `ℓ`-adic cohomology of smooth complete intersections outside the middle degree with its Frobenius action, its integral torsion-freeness in every degree and the form for smooth projective families of them: EtaleDualityAndPerverseSheaves §4.3(a), (c), (d), (e);
- nearby and vanishing cycles, the monodromy theorem, maximal unipotence and the Picard–Lefschetz formula: LefschetzPencilsAndVanishingCycles §§0.5, 0.8a, 1.1, 1.6, 2.7 and 2.8; the henselian implicit function theorem: LefschetzPencilsAndVanishingCycles §2.4; the Weil–Deligne adapter: ArithmeticGaloisRepresentations §2.4;
- period functors, the sign dictionary, weak admissibility, the proper smooth and crystalline comparison theorems, labelled ordinary flags with the slope and crystalline-character criteria, the Fontaine–Laffaille comparison and rank-two ordinarity: PadicHodgeTheory §§3.2–3.4, 3.6, 6.1, 6.4 and 8.1–8.2; ordinary representations of weight `λ`, the relation "connects", the local models `ρ_{n,m,0}` and weight-zero connectedness: LocalGaloisDeformationRings §§1.7, 6.8, 6.19 and 6.25; the reductions of two-dimensional crystalline representations of `G_{ℚ_p}` with Hodge–Tate weights `{0, k − 1}`, `1 < k < p`: FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11;
- the Katz–Messing comparison, convergent `F`-isocrystals, restriction from overconvergent to convergent `F`-isocrystals and its full faithfulness, and Newton-polygon specialization: PadicDifferentialEquationsAndRigidCohomology §§RD.2.3, RD.3.34, RD.3.37, RD.3.43, RD.5.8 and RD.7.7;
- torsors, contracted products and twisting: SchemeAndStackFoundations §§1.15 and 1.16; Weil restriction: AbelianSchemesAndArithmeticModuli §§A6.30–A6.31 and AlgebraicModuliForArithmeticGeometry §3.4;
- roots of finite-order characters after totally real base change: ArithmeticGaloisDuality §R02.4.6;
- the thrice-punctured sphere and its peripheral loops: BelyiMaps §§5.2 and 5.6; Chebotarev density: Chebotarev Layer 10; the twisted modular curve `Y(ρ)`: ModularCurves §5C and ModularCurvesPartII §5.14; reduction types of elliptic curves over finite and local fields, the `j`-integrality criterion for potentially good reduction and the Néron–Ogg–Shafarevich criterion: EllipticCurves Layers 3–4; Hecke characters, their infinity types, algebraicity and purity: GlobalNumberFields Layers 9–10, already in Tau Ceti as `TauCeti.GlobalNumberFields.HeckeCharacter` and its API, with the moduli, ray class groups and congruence subgroups of its Layers 2 and 7; Chevalley's congruence theorem for units: GL2AutomorphicRepresentationsAndTransfer §R16.1.7; the Honda–Tate classification of abelian varieties over finite fields: EndoscopicTransferAndUnitaryTraceComparison §8.3; elliptic curves as one-dimensional abelian varieties: FaltingsFinitenessAndIsogenyTheorems §R28.6.1;
- the Dwork eigenrealization at a point and its character projector (§2.9), the `H₀`-equivariant semistable models near infinity with the identification of the monodromy operator on `D_st` (§2.10, including residue characteristic two for odd `N`), the regular-ordinarity criterion for a character with consecutive weights and maximally unipotent monodromy at infinity (§2.11), ordinary subquotients and semisimplifications (§2.12), the paired self-dual Dwork sheaf over `ℚ(ζ_N)⁺` with its pairing-preserving trivialization scheme, its geometric connectedness and its local loci (§2.14), and ordinary auxiliary primes with full residual elliptic image (§2.18): ModularityAndLanglandsExtensions §§2.9–2.12, 2.14 and 2.18; density-one crystalline large image for rank-two compatible systems: PotentialAutomorphyInfrastructure §2.20;
- weakly and very weakly compatible families, induction, linear-algebra operations on families, algebraic character families in both directions, purity of induced families, disjointness through towers, soluble extensions with prescribed completions, Moret-Bailly's theorem with three kinds of local conditions and above a preliminary field, surjective specialization and extension of finite local characters: PotentialModularityAndCompatibleSystems §§1.1, 1.3, 1.4, 1.7, 1.9, 1.11, 2.14, 2.15, 2.16, 2.17, 2.18 and 2.20.

Kept variants. The finite unitary group of §0.5 is defined through an explicit involution of a finite field rather than a star structure, because a finite field carries no global star instance; it agrees with Mathlib's `Matrix.unitaryGroup` once the involution is installed as the star. The hypergeometric sheaves of Layer 3 are Katz's general construction for any list of distinct nontrivial Kummer characters; the Dwork data are specializations. Against ModularityAndLanglandsExtensions: §2.3 assembles its fibrewise eigenrealizations (§2.9, for `λ ∤ N`) into lisse sheaves and local systems over the parameter line and adds the rational eigensheaves at the coefficient places above the primes dividing `N`, and §§2.7 and 7.4 give the rank and the consecutive labelled weights for every rank-`n` (resp. zero-shaped) datum rather than for Qian's character only; §2.5 gives the integral, torsion and Betti forms over `O⁺` of its paired self-dual sheaf (§2.14); and §9.4 is the Moret-Bailly step of its symplectic switch on its pairing-preserving trivialization schemes (§2.14) alone, with additional Steinberg places and the local properties of the fibres. Against HypergeometricMotives §5.0, which builds the hypergeometric lisse sheaf of a cyclotomic datum over `ℚ` from a toric hypersurface, Layer 3 is Katz's convolution construction over `ℤ[ζ_N, 1/N]` for a list of characters of `μ_N` that need not be stable under `Gal(ℚ(ζ_N)/ℚ)`. §0.9(2) is stated for the matrix group `SU_n(ℓ)` of §0.5; CFSGBasicProperties T1–T2 proves the simplicity of the twisted group `²A_{n−1}(q)` on its Steinberg-fixed-point carrier, which it does not identify with `PSU_n(ℓ)`. §9.6 is FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11 read for the dual representation in this roadmap's cohomological convention, together with the endpoint weight `m = p − 1` and the Lubin–Tate model `ρ̄_{2,m,0}`.

## Conventions

- `N` is odd and `N ≥ 3`; `2 ≤ n ≤ N − 1` (a datum of rank `n` takes `N − n ≥ 1` distinct values), and `gcd(N, n) = 1` whenever the exponent datum is used to pass between the parameter line `T₀` and the quotient line `T′₀`. The Dwork pencil is `X₁ᴺ + ⋯ + X_Nᴺ = N t X₁⋯X_N` over `T₀ = ℙ¹ − ({∞} ∪ μ_N)` over `ℤ[1/N]`; its fibres have odd dimension `N − 2`.
- `M = ℚ(e^{2πi/N})` and `M⁺` its maximal totally real subfield; `O = ℤ[1/(2N), ζ_N]` and `O⁺ = ℤ[1/(2N), ζ_N]⁺`. Integral, torsion and residual coefficients are taken at places `λ` prime to `2N` (primes of `O` or `O⁺`). Rational coefficients `M_λ` (resp. `M⁺_λ`) are taken at every finite place `λ` of `M` (resp. `M⁺`), those above `2` and above the primes dividing `N` included: the character projectors have denominator `#H₀ = N^{N−2}` (or `2#H₀`), a unit in the field `M_λ`; the rational eigensheaves `V^ℚ_λ` of §§2.3 and 2.5 and the twisted `W^ℚ_λ` of §3.6 are defined at all these places, and a weakly compatible system (§7.11) has a member at each of them. Witness: for `N = 401` and `λ | 401`, the denominator `401^{399}` is a unit of `M_λ = ℚ₄₀₁(ζ₄₀₁)` but not of its ring of integers. A finite free module is called free; a Betti lattice over the Dedekind rings `O` and `O⁺` is only finite projective.
- A geometric automorphism `h` acts on cohomology through `(h⁻¹)*`. With this convention the eigenline of the Fermat hypersurface with exponent vector `a` (all `aᵢ ≠ 0`, representatives `⟨aᵢ⟩ ∈ {1, …, N − 1}`) has Hodge degree `p = ∑⟨aᵢ⟩/N − 1`. Witness: for the Fermat cubic, `(1, 1, 1)` has `p = 0` and `(2, 2, 2)` has `p = 1`; using `h*` instead exchanges them.
- Frobenius on cohomology is geometric. Witness: on `ℚ_ℓ(1)` geometric Frobenius at `v` acts by `q_v⁻¹`; on `H¹` of an elliptic curve its characteristic polynomial is `X² − a_v X + q_v` and its determinant is `q_v`.
- Hodge–Tate weights are cohomological: a weight `h` means `gr^h D_dR ≠ 0`, so `ε_l` has weight `−1` and `H¹` of an elliptic curve has weights `{0, 1}`. PadicHodgeTheory and LocalGaloisDeformationRings use `HT(ε_l) = +1`: their labelled weights are the negatives of ours. Witness: `ℚ_l(1)` has weight `−1` here and `+1` in PadicHodgeTheory §3.2, and filtration jump `−1` in both.
- Period modules of a representation `V` of `G_K` with coefficients in `E` are `(B ⊗_{ℚ_l} V)^{G_K}`, with scalars `K ⊗_{ℚ_l} E` (de Rham) or `K₀ ⊗_{ℚ_l} E` (crystalline, semistable). The representation is not a `K`-vector space; labels are taken after enlarging `E` to contain every embedding of `K`.
- "Ordinary of weight `λ`" is LocalGaloisDeformationRings' `IsOrdinaryOfWeight`: the graded characters of the full flag have cohomological labelled weights `λ_{τ, n−i+1} + i − 1`. For the Dwork fibres `λ_{τ,i} = M(a_τ)` for all `i`, giving weights `M(a_τ), …, M(a_τ) + n − 1`.
- Artin reciprocity is geometric: a uniformizer goes to a geometric Frobenius. For `K/ℚ_l` finite with residue field `k` and absolute ramification index `e`, and an embedding `τ : k ↪ 𝔽̄_l`, the direct fundamental character `ω_τ` is `τ` composed with `I_K → O_K^× → k^×`, the first map induced by `Art_K⁻¹`; then `∏_τ ω_τ^e = ε̄_l` (Caraiani–Emerton–Gee–Savitt, §1.4, p. 5). For unramified `K` (`e = 1`) the direct characters multiply to `ε̄_l`; the cohomological characters are `θ_τ = ω_τ⁻¹`, and for the unramified quadratic extension of `ℚ_l` (the case of §§7.9 and 9.6) `θ_τ θ_{cτ} = ε̄_l⁻¹`. Over a ramified finite extension `K′` of such a field the characters used are the restrictions of `ω_τ`, `θ_τ` to `I_{K′}`, not the fundamental characters of `K′`. Negative control: for `K = ℚ₅(√5)` (`e = 2`, `k = 𝔽₅`) an inertia element `Art_K(u)` with `u ≡ 2` modulo the maximal ideal has `ω = 2` and `ε̄₅ = 2² = 4`; the product without the exponent `e` would give `2`. Witness: `H¹` of a supersingular elliptic curve over `ℚ_p` has inertia `θ₂ ⊕ θ₂^p = ω₂⁻¹ ⊕ ω₂^{−p}`, with determinant `ε̄_p⁻¹`; its Tate module has the inverse characters.
- On the torsion `A[r]` of an elliptic curve the determinant is `ε̄_r`; on `H¹(A, 𝔽_r)` and on the CM seed of §9.8 it is `ε̄_r⁻¹`.
- Hermitian forms are linear in the first variable and `c`-semilinear in the second: `B(x, y) = y†Ax` with `M† = (M^c)ᵀ` and `A_{ij} = B(e_j, e_i)`. Mathlib's `LinearMap.IsSymm` applies to the flipped form. Witness: on `𝔽₉ ⊃ 𝔽₃` the form `(x, y) ↦ x y³` is Hermitian.
- Peripheral loops: Mathlib's `FundamentalGroup` composes `p * q = q.trans p`, and BelyiMaps §5.2 defines `periphInf = (periph1 * periph0)⁻¹`, so `p₁ p₀ p∞ = 1`. Here `γ₀ γ₁ γ∞ = 1` with `γ₀ = p₀`, `γ₁ = p₀⁻¹ p₁ p₀`, `γ∞ = p∞`. Witness: substituting gives `p₀ p₀⁻¹ p₁ p₀ p∞ = p₁ p₀ p∞ = 1`.
- Natural-number subtraction never occurs in a statement whose hypotheses allow truncation: index sets are formed only under `N > n + 1` (self-dual) or `N > 100n + 100` (Qian).

## Exact supplier contracts

### From Mathlib

- Linear algebra: `Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `Matrix.charpoly`, `Matrix.rank`, `minpoly`, `Matrix.conjTranspose`. `LinearMap.transvection f v` is `x ↦ x + f(x)v`; `LinearEquiv.transvections K V` is the set of `LinearEquiv.transvection` with `f(v) = 0` and contains the identity; `LinearEquiv.dilatransvections K V` is the set of linear equivalences of the form `LinearMap.transvection f v` and also contains the identity. Over a division ring `LinearEquiv.mem_dilatransvections_iff_finrank` says that `e` is a dilatransvection exactly when `rank(e − 1) ≤ 1`, and `LinearEquiv.mem_transvections_iff_mem_dilatransvections_and_fixedReduce_eq_one` characterises transvections among them; `LinearMap.transvection.det` gives determinant `1 + f(v)` and `LinearEquiv.transvection.det_eq_one` determinant one; `LinearEquiv.mem_transvections_pow_mul_dilatransvections_of_not_isExceptional` is the non-exceptional case of Dieudonné's generation theorem: a non-exceptional `e` is a product of `finrank(V ⧸ e.fixedSubmodule) − 1` transvections times one dilatransvection; base change is `LinearEquiv.transvection.baseChange` (Mathlib/LinearAlgebra/Transvection/Basic.lean, Generation.lean). None of these predicates excludes the identity, so a pseudo-reflection here is a non-identity dilatransvection.
- `Matrix.transvection`, `Matrix.TransvectionStruct`, `Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec` and its `SL` form `Matrix.SpecialLinearGroup.exists_list_transvec_mul_diagonal_mul_list_transvec`, which writes an element of `SL_n(K)` as transvections, a diagonal factor of determinant one, and transvections (Mathlib/LinearAlgebra/Matrix/Transvection.lean, SpecialLinearGroup.lean).
- Finite groups: `Subgroup.goursat` (Mathlib/GroupTheory/Goursat.lean); `MulAction.IwasawaStructure.isSimpleGroup`, whose abelian normal subgroups and generation are hypotheses (Mathlib/GroupTheory/GroupAction/Iwasawa.lean); `Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity` (the centre of `SL_n(K)` is the group of `n`-th roots of unity, as scalars).
- Unitary and symplectic groups: `Matrix.unitaryGroup` and `Matrix.specialUnitaryGroup` over a commutative star ring, with `Matrix.mem_unitaryGroup_iff'` (`star A * A = 1`) and `Matrix.mem_specialUnitaryGroup_iff`; `Matrix.symplecticGroup l R`, the matrices on `l ⊕ l` with `A J Aᵀ = J`.
- Forms: `LinearMap.IsSymm` (semilinear first, linear second) and `LinearMap.SeparatingLeft` (Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean).
- Finite fields: `FiniteField.unitsMap_norm_surjective` (no characteristic restriction), `Algebra.trace_surjective` (finite separable extensions), `FiniteField.frobenius_pow`, `ZMod.pow_totient`, `IsPrimitiveRoot`, `Polynomial.cyclotomic`, `orderOf`; Hilbert 90 as `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`.
- Elementary number theory and complete rings: `Nat.exists_prime_and_dvd` (every natural number other than `1` has a prime divisor; Mathlib/Data/Nat/Prime/Defs.lean), used in §1.1; `NumberField.IsCMField.indexRealUnits_eq_one_or_two` (for a CM field `K`, the units of `K⁺` and the roots of unity generate a subgroup of index `1` or `2` of the units of `K`; Mathlib/NumberTheory/NumberField/CMField.lean), used in §9.14; the instance `IsAdicComplete.henselianRing` (a ring that is `I`-adically complete is henselian along `I`, Mathlib/RingTheory/Henselian.lean), which makes the ring of integers of a finite extension of `ℚ_l` with its maximal ideal a henselian pair in §9.5.
- Characters and sums: `MulChar`, `AddChar.IsPrimitive`, `gaussSum χ ψ = ∑ₐ χ(a)ψ(a)` with `χ(0) = 0`, `gaussSum_mul_gaussSum_eq_card` (`χ ≠ 1`, `ψ` primitive: `g(χ, ψ) g(χ⁻¹, ψ⁻¹) = #F`), `gaussSum_mulShift`, `jacobiSum`. For the trivial character the convention `χ(0) = 0` gives `gaussSum 1 ψ = −1` when `ψ` is nontrivial.
- Topology and geometry: `FundamentalGroup` (with `p * q = q.trans p`), `MonoidAlgebra`, `MvPolynomial`, `AlgebraicGeometry.Smooth`.

### From Tau Ceti

- `TauCeti.companionFinTwo` (TauCeti/LinearAlgebra/Matrix/RationalCanonicalFormFinTwo), the rank-two companion matrix `[[0, −d], [1, t]]`, matching the orientation of ClassicalArithmeticCompletion §2.46.
- Special linear groups over a field `K` on a finite index type `ι` (TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean and Perfect.lean, TauCeti/LinearAlgebra/Projectivization/PSL/Simple.lean): `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field` (`SL_ι(K)` is generated by its elementary transvections, in every rank, the empty and one-element index types included); `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card` (`SL_ι(K)` is perfect when `#ι ≥ 3`) and `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard` (perfect in every rank when `Nat.card K ≥ 4`); `Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup_of_three_le_card` (`PSL_ι(K)` is simple when `#ι ≥ 3`) and `Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup_of_four_le_natCard` (simple when `#ι ≥ 2` and `Nat.card K ≥ 4`). For a finite field of odd characteristic with `q` elements these cover every `(n, q)` with `n ≥ 2` except `(2, 3)`.
- `TauCeti.FiniteEtaleScheme X` (TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean), the full subcategory of `Over X` whose structure morphisms are finite and étale (the identity of `X` included): the carrier on which EtaleCohomologyFoundations §F.0.2 builds its Galois category. Tau Ceti also has the geometric fibre functor `TauCeti.FiniteEtaleScheme.fiber` at a geometric point (TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean), the instance `GaloisCategory (FiniteEtaleScheme S)` for connected `S` and `TauCeti.FiniteEtaleScheme.nonempty_fiber_iso` (any two geometric fibre functors of a connected scheme are isomorphic) (FiniteEtale/Galois/Category.lean); with Mathlib's `CategoryTheory.PreGaloisCategory.functorToContAction`, an equivalence for a fibre functor (Mathlib/CategoryTheory/Galois/Equivalence.lean), finite étale covers of a connected scheme are finite continuous sets under the automorphism group of a fibre functor. Neither library has lisse sheaves, and the identification of finite lisse `Λ`-modules with continuous finite `π₁`-modules is the input taken from EtaleCohomologyFoundations §F.0.2.
- Hecke characters (TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean, InfinityType.lean, Algebraic.lean and Purity.lean), the implementation of GlobalNumberFields Layers 9–10: `TauCeti.GlobalNumberFields.HeckeCharacter K`, the continuous homomorphisms from the idele class group of `K` to `ℂ^×`; `TauCeti.GlobalNumberFields.HeckeCharacter.infinityType`; `TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic`, Weil's type `A₀`, which constrains the archimedean parameters on the identity component only; and `TauCeti.GlobalNumberFields.HeckeCharacter.add_conjugate_eq_add_conjugate`, purity: for an algebraic character described by integer exponents `n_σ`, the sum `n_σ + n_{cσ}` does not depend on `σ`. The converse, existence for a prescribed pure infinity type, is not there; it is §9.14.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§2.46 supplies the companion matrix `C(p)` of a polynomial `p` of natural degree `d`, with ones on the subdiagonal and `−p.coeff i` in the last column, together with its laws for monic `p`: `det C(p) = (−1)^d p.coeff 0`, and over a field the minimal polynomial of `C(p)` is `p`; §2.60 supplies that the characteristic polynomial of `C(p)` is `p`. These are prose targets of that roadmap, cited by section. This is the orientation of Qian, Lemma 3.4, and of Barnet-Lamb–Geraghty–Harris–Taylor, Corollary 4.4.

### From TauCetiRoadmap.HypergeometricMotives

§3.1: the companion matrix `C(f)` of a monic `f` of degree `d` is cyclic, and over a field two matrices with the same characteristic polynomial and a cyclic vector are conjugate. §3.2: the Levelt triple `(g_∞, g_1, g_0)` with `g_∞ g_1 g_0 = 1`, `g_∞ = C(q_∞)`, `g_0 = C(q_0)⁻¹`, whose middle term differs from the identity in rank one when `d > 0`. §3.4, Levelt's theorem over an arbitrary field `K`, for monic `p, q` of degree `d` with no common root in an algebraic closure: (i) rigidity (`levelt_rigidity_field`): a triple `g_∞ g_1 g_0 = 1` in `GL_d(K)` with `charpoly g_∞ = p`, `charpoly g_0⁻¹ = q` and `rank(g_1 − 1) ≤ 1` is simultaneously conjugate to `(C(p), C(p)⁻¹C(q), C(q)⁻¹)`; (ii) irreducibility (`levelt_irreducible_field`): a subspace of `K^d` stable under `C(p)` and `C(q)` is `0` or everything, hence over `K̄` absolute irreducibility; (iv) the companion normal form: for `p ≠ q` with `p(0) ≠ 0`, `C(q)C(p)⁻¹` fixes `e₂, …, e_d` and differs from the identity by a matrix of rank one, and a triple in the order `g_0 g_1 g_∞ = 1` with the hypotheses of (i) is simultaneously conjugate to `(C(q)⁻¹, C(q)C(p)⁻¹, C(p))`. That roadmap's triple is indexed `(g_∞, g_1, g_0)`; this roadmap's triple `(h₀, h₁, h∞)` with `h₀h₁h∞ = 1` corresponds to it by `g_∞ = h∞`, `g_0 = h₀` and `g_1 = h₀h₁h₀⁻¹` (§0.3).

### From TauCetiRoadmap.EtaleCohomologyFoundations

§F.0.2: on Tau Ceti's carrier `TauCeti.FiniteEtaleScheme` (see the Tau Ceti contract), finite étale covers of a connected scheme are equivalent to finite continuous `π₁`-sets, finite lisse `Λ`-modules to continuous finite `π₁`-modules, with path transport (`VanishingCycles.finiteEtaleGaloisCategory`, `VanishingCycles.lisseMonodromyEquiv`); the lisse-monodromy equivalence and path transport are that section's, and this roadmap consumes them only through these two declarations. §F.0.A2: for quasi-compact geometrically connected `X/k`, `1 → π₁(X_k̄) → π₁(X) → Γ_k → 1` is exact. §F.2.1: proper base change for torsion coefficients, with no invertibility hypothesis. §F.3: for smooth proper `f` and finite lisse coefficients with invertible annihilator, `Rⁱf_*` is lisse with the fibre stalk formula. §§F.2.4–F.2.7: constructible `Rf_!`, compact-support cohomology and compact-support Künneth over separably closed fields. §§F.4.2 and F.4.5: integral and rational adic realization, lisse rational sheaves and finite-dimensional cohomology. §F.6: smooth purity `f^!Λ ≅ Λ(d)[2d]` and Poincaré duality.

### From TauCetiRoadmap.ComplexComparisonPartII

§C5.2 `relativeBettiLocalSystem`: for a proper submersion `f`, `R^q f_* A` is locally constant with stalk `H^q_sing(f⁻¹(s), A)`. §C5.3 `properPureHodge` (pure Hodge structure of weight `n` on `Hⁿ` of a smooth proper complex scheme, Hodge filtration by form degree) and `relativeHodgeBundles` (for smooth proper `f` over a locally Noetherian base of characteristic zero, the `R^q f_* Ω^p` are finite locally free, the Hodge–de Rham spectral sequence degenerates, the filtration commutes with base change, and isotypic summands for a finite group action are again locally free with the induced filtration). §C6.5 `relativeArtinComparison` (proper and lower-shriek exchange for `Dᵇ_ctf` coefficients) and §C6.6 `adicArtinComparison` (integral and rational passage).

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

§IG.0.T2 (finite-coefficient Grothendieck–Lefschetz, `VanishingCycles.etaleTraceFormulaFinite`) and §IG.0.T3 (the rational constructible trace formula for all powers of Frobenius, with coefficient extensions and finite group compatibilities). §IG.1.3: specialization for proper smooth families and tame specialization with a relative normal-crossings boundary.

### From TauCetiRoadmap.FourierDeligneTransform

§2.6 (Kummer sheaves): over a field `k` with `N` invertible and `#μ_N(k) = N`, the Kummer sheaf `ℒ_χ` of `χ : μ_N(k) → Λ^×`, the torsor–character sheaf of the `μ_N(k)`-torsor `[N] : 𝔾_m → 𝔾_m` pushed out along `χ⁻¹`; its multiplicativity and tensor laws `ℒ_χ ⊗ ℒ_{χ′} ≅ ℒ_{χχ′}`, its compatibility with `N | N′`, its tameness at `0` and `∞`, and, when `χ(ζ) − 1` is a unit of `Λ` for a generator `ζ` and the characteristic of `Λ` is invertible in `k`, `RΓ_c(𝔾_{m,k̄}, ℒ_χ) = 0` and `j_!ℒ_χ ≅ Rj_*ℒ_χ` for `j : 𝔾_m → 𝔸¹`. §2.3 (traces of character sheaves: at `x ∈ 𝔽_q^×` geometric Frobenius acts on the character sheaf of `χ′ : 𝔽_q^× → Λ^×` by `χ′(x)`), which with the case `N = q − 1` and the compatibility in `N` of §2.6 gives: for `k = 𝔽_q`, geometric Frobenius at `x ∈ k^×` acts on `ℒ_χ` by `χ(x^{(q−1)/N})`. These are assumed fibre by fibre, for torsion coefficients and their adic and rational realizations in that roadmap's conventions (after adjoining `μ_p` to the coefficients where those conventions ask for it, which changes none of the statements used here). §3.1 consumes them.

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

§2.4 (multiple Jacobi sums and diagonal equations): over a finite field with `q` elements, the multiple Jacobi sum `J(χ₁, …, χ_r)` over `x₁ + ⋯ + x_r = 1` and its companion `J₀` over `x₁ + ⋯ + x_r = 0`; `J(χ₁, …, χ_r) = G(χ₁)⋯G(χ_r)/G(∏χᵢ)` for unnormalised Gauss sums `G` when every `χᵢ` and `∏χᵢ` are nontrivial, and the recursions for `J₀` and for trivial products; and the number of solutions of `∑ aᵢxᵢ^{dᵢ} = b` with `aᵢ ≠ 0` and `dᵢ | q − 1` as `q^{r−1}` plus a sum, over tuples of nontrivial characters with `χᵢ^{dᵢ} = 1`, of `J`-terms (`b ≠ 0`) or `J₀`-terms (`b = 0`). §6.1 consumes them.

### From TauCetiRoadmap.DeligneWeightsAndPurity and TauCetiRoadmap.EtaleDualityAndPerverseSheaves

DeligneWeightsAndPurity §0.1 (Weil numbers), §3.2 (geometrically constant lisse sheaves come from the base finite field), §7.15 (purity: for `X₀` proper smooth and `ℱ₀` lisse pure of weight `w`, `Hⁱ` is pure of weight `w + i`), §8.19 (pure lisse sheaves are geometrically semisimple). EtaleDualityAndPerverseSheaves §0.5 (Poincaré duality with torsion coefficients, Galois-equivariant), §0.6 (`ℓ`-adic and rational Poincaré duality for smooth varieties; the integral derived form keeps its `Ext` term) and §4.3, `completeIntersectionCohomology`: for a smooth complete intersection `X ⊂ ℙ^M_k` of dimension `m ≥ 1` over a separably closed field `k` in which `ℓ` is invertible, (a) outside the middle degree `H^q(X, Λ)` vanishes for `q` odd and, for `q` even, `H^q(X, Λ(q/2))` is free of rank one, rationally spanned by the power `h^{q/2}` of the hyperplane class (`Λ = ℤ/ℓ^a`, `ℤ_ℓ` or `ℚ_ℓ`); (c) every `H^q(X, ℤ_ℓ)` is torsion-free; (d) when `X` is defined over `𝔽_q`, geometric Frobenius acts on `H^{2j}(X, ℚ_ℓ)`, `2j ≠ m`, by `q^j`; (e) for a smooth projective `f : X → S` with `ℓ` invertible on `S` and a relative embedding in `ℙ^M_S` whose geometric fibres are smooth complete intersections of dimension `m ≥ 1` and fixed multidegree, the `R^q f_*(ℤ/ℓ^a)` are locally constant constructible with stalks the fibre cohomology, compatibly for the `ℤ_ℓ`- and `ℚ_ℓ`-systems.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles and TauCetiRoadmap.ArithmeticGaloisRepresentations

LefschetzPencilsAndVanishingCycles §0.5 (`RΨ`, `RΦ` and the vanishing triangle), §0.8a (nearby-cycle and Betti comparison with the pinned Tate orientation), §1.1 (Grothendieck's monodromy theorem), §1.6 (maximal unipotence: minimal polynomial `(X − 1)^n`), §2.4 (Tougeron's henselian implicit function theorem: for a henselian pair `(A, 𝔞)` with `A` noetherian, a closed subscheme `X ⊂ 𝔸^N_A` cut out by `f₁, …, f_c`, `δ′` the ideal of `c × c` minors of the Jacobian and `x̄ ∈ A^N` with `f(x̄) ≡ 0` modulo `δ′(x̄)²𝔞`, there is `x ∈ X(A)` with `x ≡ x̄` modulo `δ′(x̄)𝔞`; used in §9.5), §2.7 (nearby cycles at an ordinary quadratic point, odd relative dimension) and §2.8 (specialization sequence and Picard–Lefschetz formula `σx = x + (−1)^{m+1} t_ℓ(σ)(x, δ)δ` for relative dimension `2m + 1`, one quadratic point). ArithmeticGaloisRepresentations §2.4 (the arithmetic Weil–Deligne adapter: the monodromy operator `N` with `ρ(σ) = exp(N t_ℓ(σ))` on an open subgroup of inertia, from Grothendieck's monodromy theorem). ArithmeticGaloisRepresentations §4.4 (Dickson's classification: a finite subgroup of `PGL₂(k̄)`, `k̄` algebraically closed of characteristic `p`, fixes a point of `ℙ¹`, is dihedral of order `2n` with `p ∤ n`, is `A₄`, `S₄` or `A₅`, or is conjugate to `PSL₂(𝔽_q)` or `PGL₂(𝔽_q)`; and a finite `G ⊂ GL₂(k̄)` whose projective image is conjugate to `PSL₂(F₀)` or `PGL₂(F₀)` with `#F₀ ≥ 4` has, up to conjugation, `[G, G] = SL₂(F₀)`); §0.11 consumes it.

What LefschetzPencilsAndVanishingCycles must provide (gap:tame-point-specialization): For a smooth curve over a henselian discrete valuation ring of residue characteristic p, a section ∞ with complement U, a lisse ℓ-adic sheaf on U tamely ramified along ∞ (ℓ ≠ p) with local monodromy T at ∞, and a point t of U over a finite extension F_v whose valuation relative to ∞ is −d < 0, the inertia of F_v acts on the fibre at t through the powers of T given by d times the tame character t_ℓ, so that the Weil–Deligne monodromy operator is d·log T.

### From TauCetiRoadmap.PadicHodgeTheory and TauCetiRoadmap.LocalGaloisDeformationRings

PadicHodgeTheory §3.2 (filtered spaces and the sign dictionary, `HT(χ_p) = +1`), §3.3 (Fontaine's functors, de Rham ⇒ Hodge–Tate, compatibility with tensor, dual and determinant; `ℚ_p`-valued Hodge–Tate characters are de Rham), §3.4 (filtered `(φ, N)`-modules and weak admissibility `t_H(D′) ≤ t_N(D′)`), §3.6 (labelled ordinary flags: the crystalline slope criterion under the prescribed Hodge type and the crystalline-character criterion on all units), §6.1 (the rational Fontaine–Laffaille comparison and its signs), §6.4 (rank two: ordinary exactly when the Frobenius polynomial of `D_cris(V∨)` has a unit root), §§8.1–8.2 (proper smooth de Rham comparison with `E₁`-degeneration, crystalline comparison for proper smooth formal models; functoriality). LocalGaloisDeformationRings §1.7 (`IsOrdinaryOfWeight` and its flag API), §6.8 (the relation "connects"), §6.19 (`ρ_{n,m,0} = ⊕ ε₂^{m(n−i)}(ε′₂)^{m(i−1)}`, with `Sym^{n−1}ρ_{2,m,0} = ρ_{n,m,0}` and `ρ_{n,m,0} ⊗ ρ_{m,1,0} = ρ_{nm,1,0}`), §6.25 (connectedness of crystalline weight-zero lifts).

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

§R07.5.11 (Fontaine–Laffaille residual types), in that roadmap's convention `HT(ε) = +1`: for a two-dimensional crystalline representation `V` of `G_{ℚ_p}` over a finite `E/ℚ_p` with an `O_E`-lattice `T` and unlabelled Hodge–Tate weights `(0, k − 1)`, `1 < k < p`, after extending residual scalars to `𝔽̄_p`: if `V` is reducible, `T̄` is an extension of an unramified character by an unramified twist of `ω^{k−1}`; if `V` is irreducible, `T̄` is an unramified twist of `Ind_{G_{ℚ_{p²}}}^{G_{ℚ_p}}θ_{k−1}` with `θ_{k−1}|_I = ω₂^{k−1}`, so `T̄|_I ≅ ω₂^{k−1} ⊕ ω₂^{p(k−1)}`. §9.6 consumes it for the dual of a representation with cohomological weights `{0, m}`, `m = k − 1 ≤ p − 2`.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

PadicDifferentialEquationsAndRigidCohomology §RD.7.7 (Katz–Messing: for smooth projective `X/𝔽_q` and `ℓ ≠ p`, the Frobenius characteristic polynomials on rigid, crystalline and `ℓ`-adic `Hⁱ` agree and lie in `1 + tℤ[t]`, also over every `𝔽_{q^r}`), §RD.3.34 (convergent `F`-isocrystals), §RD.3.37 (the restriction functor `j^*` from overconvergent to convergent `F`-isocrystals, an exact tensor functor compatible with Frobenius and pullback), §RD.5.8 (Kedlaya: for `X` smooth separated of finite type over a field of characteristic `p` and `a ≥ 1`, `j^* : F^a-Isoc†(X/K) → F^a-Isoc(X/K)` is fully faithful; an equivalence for proper `X`), §RD.3.43 and §RD.2.3 (the special Newton polygon lies on or above the generic one).

What PadicDifferentialEquationsAndRigidCohomology must provide (gap:curve-crystalline-companions): For a smooth curve X over a finite field of characteristic p, a prime ℓ ≠ p, a field isomorphism ℚ̄_ℓ ≅ ℚ̄_p and an irreducible lisse ℚ̄_ℓ-sheaf on X with finite-order determinant, a crystalline companion: an irreducible overconvergent F-isocrystal on X whose Frobenius characteristic polynomial at every closed point is the image of that of the sheaf (Abe), so that Drinfeld–Kedlaya's slope bounds on curves apply to companions of indecomposable lisse sheaves.

### From TauCetiRoadmap.SchemeAndStackFoundations, TauCetiRoadmap.AbelianSchemesAndArithmeticModuli and TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

SchemeAndStackFoundations §1.15 (torsors), §1.16 (contracted products and twisting, used for twisted forms by a finite-order automorphism). AbelianSchemesAndArithmeticModuli §A6.30 (`weilRestriction` exists for quasi-projective varieties over fields) and §A6.31 (`weilRestrictionSplits`: over a separable extension the Weil restriction becomes the product of the conjugates). AlgebraicModuliForArithmeticGeometry §3.4 (relative Hom and Weil restriction, base change).

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.4.6, "Roots after prescribed totally real base change": for a CM field `F`, a finite-order `η : G_F → ℚ̄_l^×`, `m ≥ 1` and a number field `L`, there is a totally real finite Galois `M/ℚ` linearly disjoint from `L` with `η|_{G_{FM}} = ψ^m` for some `ψ : G_{FM} → ℚ̄_l^×`; unramifiedness can be kept above a finite set of odd primes where `η` is unramified. The roots are valued in an algebraic closure; §6.5 here derives the finite-field-valued form.

### From TauCetiRoadmap.BelyiMaps, TauCetiRoadmap.Chebotarev, TauCetiRoadmap.ModularCurves, TauCetiRoadmap.ModularCurvesPartII, TauCetiRoadmap.EllipticCurves and TauCetiRoadmap.GlobalNumberFields

BelyiMaps §5.2 (the loops `γ0`, `γ1` at `1/2`, `periphInf = (periph1 * periph0)⁻¹`) and §5.6 (`FundamentalGroup U b ≃* FreeGroup (Fin 2)`, sending the generators to `periph0`, `periph1`). Chebotarev Layer 10 (`hasDirichletDensity_frobeniusPrimeSet`, density `#C/#G`). ModularCurves §5C (the twisted curve `Y(ρ)/ℚ` for `N ≥ 3`, its field points, geometric irreducibility reduced to connectedness) and ModularCurvesPartII §5.14 (compactified twisted curves `X(ρ)` and the connectedness comparison). EllipticCurves Layer 1 (the Frobenius isogeny `π_q` of a curve over `𝔽_q`, with `deg(1 − π_q) = #E(𝔽_q)`), Layer 3 (the Frobenius trace `q + 1 − #E(𝔽_q)`; the ordinary/supersingular dichotomy over any field of characteristic `p`, invariant under base change; over a finite field of characteristic `p` a curve is supersingular exactly when `p` divides its Frobenius trace) and Layer 4 (potentially good reduction, with the theorem that it is equivalent to integrality of `j`; good ordinary and good supersingular reduction; Néron–Ogg–Shafarevich, including: under potentially good reduction, good reduction holds exactly when the inertia action on `E[N]` is trivial, for `N ≥ 3` prime to the residue characteristic). GlobalNumberFields Layer 2 (moduli and the finiteness of ray class groups), Layer 7 (the idele congruence subgroup of a modulus, open, with quotient of the idele class group the ray class group) and Layers 9–10 (Hecke characters, the continuous and algebraic infinity types, algebraicity of type `A₀`, and the purity of algebraic infinity types: the pair sums `a_σ + a_{cσ}` of an algebraic Hecke character are constant).

What ModularCurvesPartII must provide (gap:twisted-modular-curve-over-number-fields): For a number field F, an integer r ≥ 3 and a continuous ρ : G_F → GL₂(ℤ/r) with determinant the mod-r cyclotomic character, the twisted curve Y(ρ)/F with its universal elliptic curve, its geometric connectedness, a smooth model with good reduction of the universal curve over O_F[1/r], and for every prime p ∤ r the equality of the geometric mod-p monodromy of the universal curve with SL₂(𝔽_p).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison, TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems and TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

EndoscopicTransferAndUnitaryTraceComparison §8.3 (Tate's theorem and Honda's existence theorem over a finite field `𝔽_q`: simple isogeny classes of abelian varieties correspond to conjugacy classes of `q`-Weil integers `π`; the endomorphism algebra is the central division algebra over `ℚ(π)` with invariant `1/2` at the real places, `0` at the complex places and at the finite places prime to `p`, and `[ℚ(π)_v : ℚ_p] v(π)/v(q)` modulo `ℤ` at `v | p`; and `2 dim A = e[ℚ(π) : ℚ]` for `e` its index). FaltingsFinitenessAndIsogenyTheorems §R28.6.1 (a Weierstrass elliptic curve over a field `K` is a one-dimensional abelian variety with the same points, compatibly with homomorphisms, degrees and Tate modules, and `K`-isomorphism classes of elliptic curves are `K`-isomorphism classes of principally polarized one-dimensional abelian varieties). GL2AutomorphicRepresentationsAndTransfer §R16.1.7 (Chevalley's theorem: for a number field, a finitely generated subgroup `E` of its multiplicative group and a subgroup `H ⊆ E` of finite index, there is a modulus `𝔪` such that every element of `E` congruent to `1` modulo `𝔪` lies in `H`). §§9.13 and 9.14 consume them.

### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems

§1.1 (weakly compatible families of arbitrary rank, with a member at every finite place of the coefficient field, and their comparison with Barnet-Lamb–Gee–Geraghty–Taylor §5.1), §1.3 (very weakly compatible families: full Hodge multisets and crystallinity required only outside a density-zero set of coefficient primes), §1.4 (induction of families), §1.7 (linear-algebra operations on families: restriction, semisimplified tensor products and symmetric powers, with good polynomials and Hodge multisets formed by the products and sums of roots and weights), §1.9 (algebraic character families: the family of `l`-adic realizations of a type-`A₀` Hecke character, de Rham at every finite place and crystalline outside its conductor, and conversely every finitely ramified de Rham `l`-adic character is such an avatar after enlarging the coefficient field), §1.11 (purity of induced character families), §2.14 (disjointness through towers: inside a common overfield with `C ⊆ B ⊆ A` and `C ⊆ D`, if `A` and `D` are linearly disjoint over `C`, then `A` and `BD` are linearly disjoint over `B` and `A ∩ BD = B`), §2.15 (extending finite local characters to finite-order idele class characters), §2.16 (soluble prescribed-completion extensions: over a number field, a finite soluble Galois extension, linearly disjoint from a given finite Galois field, with prescribed finite Galois completions at finitely many places, real places kept real if required), §2.17 (three kinds of local conditions in Moret-Bailly's theorem), §2.18 (approximation above a preliminary field, including smoothness and geometric connectedness of the Weil restriction), §2.20 (surjective specialization of finite quotients: for `F` imaginary CM Galois over `ℚ`, smooth geometrically irreducible `T/F`, compatible local completions and opens, and a surjection `π₁^ét(T) ↠ G`, a CM point whose specialization still surjects onto `G`; with `L_v = F_v` the places above the primes of `S₀` split completely in `F′/F`).

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

§2.9 (for a coefficient place `λ ∤ N`, the Dwork eigenrealization of `(N, χ, λ, t)` at a point `t` of `T₀`: the `χ`-summand of middle cohomology cut out by the projector `|H₀|⁻¹ ∑_h χ(h)⁻¹ h`, with its integral lattice where `|H₀|` is invertible; the projectors are idempotent and mutually orthogonal; compatibility with field base change; and symmetry-twisted Frobenius traces give a good-place Frobenius polynomial common to all coefficient places under matched coefficient embeddings, with no semisimplicity asserted). §2.10 (for `K/ℚ_p` finite containing `ζ_N`, `p ∤ N`, residue characteristic two included for odd `N`, and a Dwork parameter `s ∈ T₀(K)` with `v(s) < 0`: an `H₀`-equivariant proper semistable model over a finite totally ramified `K′/K`, and the `H₀`-equivariant Hyodo–Kato comparison identifying the monodromy operator on each labelled component of `D_st` with the Gauss–Manin residue and the topological monodromy at infinity of the coefficient-conjugate summand, scaled by the ramification index). §2.11 (if the labelled Hodge–Tate weights of the `χ`-summand are consecutive and a crystalline twist makes them `{0, …, n − 1}`, and the monodromy at infinity of every coefficient-conjugate summand has minimal polynomial `(X − 1)^n`, then at a parameter of negative valuation the fibre at the coefficient prime is de Rham, potentially semistable and regular ordinary, with an explicit full flag of characters). §2.12 (a regular ordinary flag restricts to stable subrepresentations and pushes to quotients with the ordered subsets of the weights, and the global semisimplification of a locally regular ordinary representation is regular ordinary with the same labelled multiset). §2.14 (the paired self-dual Dwork sheaf `V_n((N − 1 − n)/2)` over `ℚ(ζ_N)⁺` with its alternating form and multiplier, the scheme of pairing-preserving trivializations over the Dwork parameter space, its geometric connectedness and the nonemptiness of the prescribed real and finite local loci, as the route of its simultaneous symplectic potential automorphy theorem). §2.18 (for a non-CM elliptic curve `E/ℚ`, a number field `L` and `A ≥ 1`, every sufficiently large prime `ℓ` has `r̄_{E,ℓ}(G_L) = GL₂(𝔽_ℓ)`, the good ordinary primes have density one, and infinitely many `ℓ ≡ 1 (mod A)` satisfy both outside any finite set).

### From TauCetiRoadmap.PotentialAutomorphyInfrastructure

§2.20 (`density_one_crystalline_large_image`): for a strongly irreducible very weakly compatible system `R` of rank two over a number field `F`, the primes `l` below no bad place at which every `r_λ`, `λ | l`, is crystalline with the system's Hodge–Tate weights and `r̄_λ(G_{F̃})` contains a conjugate of `SL₂(𝔽_l)` (`F̃` the Galois closure of `F/ℚ`) have Dirichlet density one.

## How to read the build

Layer 0 is linear algebra and finite group theory with no geometry: hypergeometric pairs, the form of Levelt's theorem (HypergeometricMotives §3.4) used here, unitary groups and the classification inputs used to recognise residual monodromy. Layer 1 constructs the Dwork pencil, its symmetry groups, its exponent data with their index sets, and the quotient family over `ℙ¹ − {0, 1, ∞}`. Layer 2 cuts the eigen-local-systems out of the middle cohomology and computes their rank, duality and real forms. Layer 3 builds Katz's hypergeometric sheaves and compares them with the Dwork eigensheaves, producing the comparison characters and the twisted systems `W`. Layer 4 computes the complex monodromy: eigenvalues at zero, a transvection at one, a single unipotent block at infinity and the companion-matrix model. Layer 5 identifies the residual monodromy groups, first as subgroups generated by a hypergeometric pair over a finite field and then geometrically, and builds the geometrically irreducible level-structure torsors for linear and unitary data, citing ModularityAndLanglandsExtensions §2.14 for the symplectic ones. Layer 6 computes Frobenius determinants by Gauss sums and matches determinants with finite-field-valued roots. Layer 7 proves the local Galois properties of the fibres away from infinity and assembles the weakly compatible systems; Layer 8 does the same near infinity, verifying for the Dwork data the hypotheses of the ordinarity criterion of ModularityAndLanglandsExtensions, whose equivariant semistable models it uses. Layer 9 combines everything with Moret-Bailly's theorem into the switching theorems, and proves two general inputs of the auxiliary systems, on elliptic curves over prime fields and on Hecke characters of CM fields (§§9.13–9.14).

## Layer 0: Linear algebra and finite linear groups

The monodromy of a Dwork eigen-local-system around the three punctures of `ℙ¹ − {0, 1, ∞}` is a triple `(h₀, h₁, h∞)` with `h₀h₁h∞ = 1` in which `h₁` differs from the identity by a rank-one map. Levelt's theorem (HypergeometricMotives §3.4) says that such a triple is determined up to conjugacy by the characteristic polynomials of `h∞` and `h₀⁻¹` when these have no common root; the triple is then absolutely irreducible. This layer imports it, translates it into the order of the triple used here and specialises it to the Dwork data. Over a finite field the generated group is generated by transvections, and the Zalesskii–Serezhkin classification reduces its identification to special linear, symplectic and special unitary groups over subfields. The unitary groups, Hermitian forms, simplicity statements and the Goursat-type product lemma of this layer are the finite-group inputs of Layer 5.

### 0.1 Pseudo-reflections and transvections

Let `K` be a field and `V` a `K`-vector space of finite dimension `n ≥ 1`. A pseudo-reflection is an element of Mathlib's `LinearEquiv.dilatransvections K V` other than the identity, that is, an invertible `g` with `rank(g − 1) = 1`; a transvection is an element of `LinearEquiv.transvections K V` other than the identity, that is, `g = 1 + v ⊗ φ` with `v ≠ 0`, `φ ≠ 0` and `φ(v) = 0`. A subgroup is generated by transvections when it is generated by its non-identity transvections. (Qian, Lemma 3.3(3) and Lemma 3.4, arXiv v1 pp. 13–14; Beukers–Heckman, Definition 2.9, p. 330.)

The following facts complete Mathlib's API for this layer. That `SL_n(K)` is generated by its transvections is Tau Ceti's `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`.

- A pseudo-reflection `g = 1 + v ⊗ φ` satisfies `(g − 1)² = φ(v)(g − 1)`; it is a transvection exactly when `φ(v) = 0`, equivalently when it is unipotent.
- The characteristic polynomial of a pseudo-reflection is `(X − 1)^{n−1}(X − det g)`, with `det g = 1 + φ(v)`; a transvection has characteristic polynomial `(X − 1)^n`.
- A pseudo-reflection that is not a transvection is diagonalisable, acting by `det g ≠ 1` on the line `Kv` and trivially on the hyperplane `ker φ`.
- Conjugates and inverses of pseudo-reflections (transvections) are pseudo-reflections (transvections), and both notions are invariant under extension of scalars `K → K′`.

*Needs:* Mathlib `LinearEquiv.dilatransvections`, `LinearEquiv.mem_dilatransvections_iff_finrank`, `LinearEquiv.transvections`, `LinearEquiv.mem_transvections_iff_mem_dilatransvections_and_fixedReduce_eq_one`, `LinearMap.transvection.det`, `LinearEquiv.transvection.baseChange`, `Matrix.charpoly`; Tau Ceti `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`.

**Checks.**

- Over `ℚ`, `diag(1, 2)` is a pseudo-reflection with determinant `2` and is not a transvection; a definition requiring only `det g ≠ 1` would also admit `−1 ∈ GL₂(ℚ)`, whose displacement `−2` has rank two.
- The identity is in both of Mathlib's sets but is neither a pseudo-reflection nor a transvection here: `rank(1 − 1) = 0`.
- `Matrix.transvection 0 1 1` in `GL₂(ZMod 3)` is a transvection, with characteristic polynomial `(X − 1)²`.
- The `3 × 3` unipotent Jordan block is unipotent but not a transvection: `g − 1` has rank two.
- `diag(0, 1)` over `ℚ` has `rank(g − 1) = 1` but is not invertible, so it is not a pseudo-reflection.
- The diagonal factor left by Mathlib's factorisation is itself a product of transvections: over `ℚ`, with `w(a) = E₁₂(a)E₂₁(−a⁻¹)E₁₂(a)`, `w(2) = [[0, 2], [−1/2, 0]]`, `w(−1) = [[0, −1], [1, 0]]` and `w(2)w(−1) = diag(2, 1/2)`, six elementary transvections.

### 0.2 Rank-one difference of companion matrices

Let `K` be a field, `n ≥ 1`, and `p ≠ q` monic polynomials of degree `n` in `K[X]` with `p(0) ≠ 0`. For the companion matrices `C(p)`, `C(q)` of ClassicalArithmeticCompletion §2.46, HypergeometricMotives §3.4(iv) gives that `C(q)C(p)⁻¹` fixes `e₂, …, e_n` and that `C(q)C(p)⁻¹ − 1` has rank exactly one; what this roadmap adds is the reading used in §4.5 and §5.1, that the displacement therefore has nonzero entries only in its first column. (Qian, Lemma 3.4 and the displayed matrices, arXiv v1 p. 14; Barnet-Lamb–Geraghty–Harris–Taylor, Corollary 4.4, p. 32.)

*Needs:* HypergeometricMotives §3.4(iv); ClassicalArithmeticCompletion §2.46 (the companion matrix, its determinant and minimal polynomial) and §2.60 (characteristic polynomial); Mathlib `Matrix.rank`.

*Proof sketch.* A matrix that kills `e₂, …, e_n` is supported on its first column, and the displacement is nonzero because `p ≠ q`. The single-Jordan-block statement for `C((X − 1)^n)` is the minimal-polynomial theorem of ClassicalArithmeticCompletion §2.46 applied to `(X − 1)^n`.

**Checks.**

- `C((X − 1)²) = [[0, −1], [1, 2]]` is conjugate to `[[1, 1], [0, 1]]` and not to the identity.
- For `p = (X − 1)²` and `q = (X − 2)(X − 4)` over `ℚ`, `C(q)C(p)⁻¹ − 1` has rank one.
- For `p = q` the displacement is zero: distinctness is needed for rank exactly one.

### 0.3 Levelt's rigidity theorem

Let `K` be a field and `A₀, A∞, B₀, B∞ ∈ GL_n(K)`. Suppose `A∞` and `B∞` have a common characteristic polynomial `p`, `A₀⁻¹` and `B₀⁻¹` have a common characteristic polynomial `q`, `p` and `q` are coprime in `K[X]` (equivalently, have no common root in an algebraic closure), and `A₀⁻¹A∞⁻¹ − 1` and `B₀⁻¹B∞⁻¹ − 1` have rank at most one. Then there is `g ∈ GL_n(K)` with `gA₀g⁻¹ = B₀` and `gA∞g⁻¹ = B∞`. In particular every such pair is conjugate to `(C(q)⁻¹, C(p))`, whose third element is `C(q)C(p)⁻¹`, and a triple `(h₀, h₁, h∞)` with `h₀h₁h∞ = 1`, `h₁` a pseudo-reflection and prescribed coprime characteristic polynomials of `h∞` and `h₀⁻¹` is unique up to simultaneous conjugation. This is Levelt's theorem, HypergeometricMotives §3.4(i) and (iv), read in the order of the triple used here; it is not proved again, and Layers 4 and 5 apply it over `ℂ` and over finite fields. (Beukers–Heckman, Theorem 3.5 and proof, pp. 331–332, with Definition 3.1, equation (3.2), p. 330, for their order of the triple; Qian, Lemma 3.4, arXiv v1 p. 14; Barnet-Lamb–Geraghty–Harris–Taylor, Corollary 4.4, p. 32.)

*Needs:* HypergeometricMotives §3.4(i), (iv); §0.1; §0.2; ClassicalArithmeticCompletion §§2.46, 2.60.

*Proof sketch.* For the pair `(A₀, A∞)` put `h₁ = A₀⁻¹A∞⁻¹` and `(g_∞, g_1, g_0) = (A∞, A₀h₁A₀⁻¹, A₀) = (A∞, A∞⁻¹A₀⁻¹, A₀)`; then `g_∞g_1g_0 = 1`, `g_1 − 1` is conjugate to `h₁ − 1` and so has rank at most one, `charpoly g_∞ = p` and `charpoly g_0⁻¹ = q`. HypergeometricMotives §3.4(i) conjugates `(A₀, A∞)` to `(C(q)⁻¹, C(p))`, likewise `(B₀, B∞)`, and the composite conjugation is `g`. The triple is determined by the pair since `h₁ = h₀⁻¹h∞⁻¹`. The rank-zero case forces `p = q`, which coprimality allows only for `n = 0`.

**Checks.**

- For `n = 1`, with `A∞ = α` and `A₀ = β⁻¹`, `A₀⁻¹A∞⁻¹ = βα⁻¹`; coprimality is `α ≠ β`, and `g = 1` conjugates the pair to `(C(X − β)⁻¹, C(X − α))`.
- For `p = (X − 1)^n` and `q = ∏_{b∈B}(X − ζ_N^{−b})` with `0 ∉ B` the theorem identifies the Dwork monodromy (§4.5).
- Without coprimality the conclusion fails: for `n = 2` take `(A₀, A∞) = (1, 1)` and `(B₀, B∞) = (1, J)` with `J = [[1, 1], [0, 1]]`. All four characteristic polynomials are `(X − 1)²` and the displacements `0` and `J⁻¹ − 1` have rank at most one, but `A∞ = 1` is not conjugate to `J`.

### 0.4 Irreducibility of hypergeometric groups

Let `K` be a field and `h₀, h₁, h∞ ∈ GL_n(K)` with `h₀h₁h∞ = 1` and `h₁` a pseudo-reflection. If `h∞` and `h₀⁻¹` have no common eigenvalue in an algebraic closure of `K`, the subgroup `⟨h₀, h∞⟩` acts absolutely irreducibly on `Kⁿ`. This is the irreducibility half of Levelt's theorem, HypergeometricMotives §3.4(ii), transported along §0.3; it is not proved again. (Beukers–Heckman, Proposition 3.3 and proof, p. 331; Qian, the paragraph preceding Lemma 3.6, arXiv v1 p. 15; Barnet-Lamb–Geraghty–Harris–Taylor, proof of Lemma 4.6, pp. 32–33.)

*Needs:* HypergeometricMotives §3.4(i), (ii); §0.1; §0.3.

*Proof sketch.* Let `p`, `q` be the characteristic polynomials of `h∞` and `h₀⁻¹`; they stay coprime over `K̄`. By §0.3 the pair `(h₀, h∞)` is conjugate over `K̄` to `(C(q)⁻¹, C(p))`. A subspace of `K̄ⁿ` stable under `C(q)⁻¹` and `C(p)` is stable under `C(q)` and `C(p)` (a subspace of a finite-dimensional space stable under an invertible map is stable under its inverse), so HypergeometricMotives §3.4(ii) makes it `0` or everything.

**Checks.**

- For `n = 2`, `K = 𝔽₇`, `h∞ = C((X − 1)²)` and `h₀ = C((X − 2)(X − 4))⁻¹`, the group `⟨h₀, h∞⟩` has no invariant line.
- If `h₀ = h∞⁻¹` (so `h₁ = 1`) every eigenvector of `h∞` spans an invariant line: the pseudo-reflection hypothesis is needed.
- For `h∞ = 1` and `h₀ = diag(2, 1)` over `ℚ`, `h₁ = h₀⁻¹` is a pseudo-reflection but `h∞` and `h₀⁻¹` share the eigenvalue `1`, and the group is reducible.
- The hypothesis is on `h₀⁻¹`, not on `h₀`: over `ℚ` take `h₀ = diag(1/2, 1/3)`, `h∞ = diag(2, 4)` and `h₁ = h₀⁻¹h∞⁻¹ = diag(1, 3/4)`, a pseudo-reflection. The spectra `{1/2, 1/3}` of `h₀` and `{2, 4}` of `h∞` are disjoint, yet both coordinate lines are invariant; the spectrum `{2, 3}` of `h₀⁻¹` meets `{2, 4}` in `2`, so the theorem correctly does not apply.

### 0.5 Finite unitary groups

Let `k` be a finite field, `ℓ/k` its quadratic extension with nontrivial automorphism `c`, and for a matrix `M` over `ℓ` put `M† = (M^c)ᵀ`. For `n ≥ 1` define the general unitary group `GU_n(ℓ)` as the matrices `M ∈ GL_n(ℓ)` with `M†M = ν(M)·1` for some `ν(M) ∈ k^×`, its multiplier `ν : GU_n(ℓ) → k^×`, the unitary group `U_n(ℓ) = ker ν` and the special unitary group `SU_n(ℓ) = U_n(ℓ) ∩ SL_n(ℓ)`. For a finite field `k′` with an automorphism `σ` of order two, `SU(n, k′) = {g ∈ SL_n(k′) : σ(g)ᵀg = 1}` is `SU_n(k′)` for the extension `k′/k′^σ`. After installing `c` as the star of `ℓ`, `U_n(ℓ)` and `SU_n(ℓ)` are Mathlib's `Matrix.unitaryGroup` and `Matrix.specialUnitaryGroup`. (Boxer–Calegari–Gee–Newton–Thorne, §4.3, Definition 4.3.1, arXiv v3 p. 45; Qian, proof of Lemma 3.6, arXiv v1 p. 15.)

The definition has the following API.

- `M ↦ M†` is an anti-automorphism of `M_n(ℓ)`: `(AB)† = B†A†` and `M†† = M`.
- `GU_n(ℓ)` is a subgroup of `GL_n(ℓ)` and `ν` is a homomorphism; for `n ≥ 1` the multiplier is unique, read off any diagonal entry of `M†M`.
- For `M ∈ GU_n(ℓ)` with multiplier `a`, `c(det M)·det M = aⁿ`; hence `det` maps `U_n(ℓ)` onto the norm-one subgroup of `ℓ^×` and `[U_n(ℓ) : SU_n(ℓ)] = q + 1` with `q = #k`.
- A nonzero scalar `b·1` lies in `GU_n(ℓ)` with multiplier `N_{ℓ/k}(b)`.
- `#SU_n(𝔽_{q²}) = q^{n(n−1)/2} ∏_{i=2}^{n} (q^i − (−1)^i)`.
- Membership in `U_n(ℓ)` is Mathlib's `star M * M = 1` and in `SU_n(ℓ)` additionally `det M = 1`.
- For the linear-first form `B(x, y) = y†Ax` with `A = P†P`, `g ↦ PgP⁻¹` carries `{g : g†Ag = A, det g = 1}` onto `SU_n(ℓ)`.

*Needs:* Mathlib `Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `Matrix.conjTranspose`, `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `Matrix.mem_specialUnitaryGroup_iff`, `FiniteField.frobenius_pow`, `FiniteField.unitsMap_norm_surjective`.

The published definition writes the special unitary group for the multiplier kernel; the groups used afterwards in that paper (Proposition 4.4.2, Lemma 5.2.3) are `U_n(ℓ) ∩ SL_n(ℓ)`, as here.

**Checks.**

- `U₁(𝔽₉)` is the group of norm-one elements of `𝔽₉^×`, of order `4`, and `SU₁(𝔽₉)` is trivial.
- `SU₂(𝔽₉) ≅ SL₂(𝔽₃)`, of order `24 = 3·(9 − 1)`, matching the order formula.
- `diag(ζ, 1)` with `ζ ∈ 𝔽₉` of norm one and `ζ ≠ 1` lies in `U₂(𝔽₉)` with determinant `ζ`, so `U₂(𝔽₉) ≠ SU₂(𝔽₉)`: the multiplier kernel is not the special unitary group.
- Rank zero does not determine the multiplier: over `𝔽₉/𝔽₃` the empty matrix satisfies `M†M = a·1` both for `a = 1` and for `a = 2` (over `𝔽₄/𝔽₂` only `a = 1` is available, since `𝔽₂^× = {1}`), whereas in rank one `M = 1` gives `M†M = 1`, whose diagonal entry forces `a = 1`. This is why the definition requires `n ≥ 1`.

### 0.6 Hermitian and skew-Hermitian forms over a quadratic extension

Let `ℓ/k` be a quadratic extension of fields with nontrivial automorphism `c` and `V` a finite-dimensional `ℓ`-vector space. A Hermitian form is a `k`-bilinear `⟨·,·⟩ : V × V → ℓ` with `⟨ax, y⟩ = a⟨x, y⟩`, `⟨x, ay⟩ = c(a)⟨x, y⟩` and `⟨y, x⟩ = c⟨x, y⟩`; it is skew-Hermitian if instead `⟨y, x⟩ = −c⟨x, y⟩`. It is nondegenerate if `x ↦ ⟨x, ·⟩` is injective. Its isometry group and its similitude group (isometries up to a scalar in `k^×`) are defined as usual; for the standard form `∑ xᵢ c(yᵢ)` they are `U_n(ℓ)` and `GU_n(ℓ)`. (Boxer–Calegari–Gee–Newton–Thorne, Definitions 4.3.2 and 4.4.1, Remark 4.3.3, arXiv v3 pp. 45–47.)

The definition has the following API.

- In coordinates, with `A_{ij} = B(e_j, e_i)`, `B(x, y) = y†Ax`, and `B` is Hermitian exactly when `A† = A`.
- Hermitian symmetry of `B` is Mathlib's `LinearMap.IsSymm` of the flipped form, which is `c`-semilinear in the first and linear in the second variable.
- For `η ≠ 0` with `c(η) = −η`, `ηB` is skew-Hermitian exactly when `B` is Hermitian.
- For nondegenerate `B` on `V ≠ 0`, the similitudes form a group and each has a unique multiplier in `k^×`, multiplicative in the similitude.

*Needs:* Mathlib `LinearMap.IsSymm`, `LinearMap.SeparatingLeft`; §0.5.

**Checks.**

- On `𝔽₉ ⊃ 𝔽₃`, `(x, y) ↦ x y³` is Hermitian and nondegenerate.
- The zero form is both Hermitian and skew-Hermitian and is degenerate unless `V = 0`.
- The `ℓ`-bilinear form `(x, y) ↦ xy` on `𝔽₉` is not Hermitian: it is linear rather than `c`-semilinear in `y`.
- For `η = 0`, `ηB` is skew-Hermitian for every `B`, so the converse of the scaling statement needs `η ≠ 0`.

### 0.7 Uniqueness of Hermitian forms over finite fields

Let `ℓ/k` be a quadratic extension of finite fields and `V` an `ℓ`-vector space of dimension `n`. Every nondegenerate Hermitian form on `V` has an orthonormal basis; hence any two are isometric, the isometry group of any of them is conjugate in `GL(V)` to `U_n(ℓ)` and its similitude group to `GU_n(ℓ)`. (Boxer–Calegari–Gee–Newton–Thorne, Lemma 4.3.4 with proof, arXiv v3 p. 46, citing Lewis, §4.)

*Needs:* §§0.5–0.6; Mathlib `FiniteField.unitsMap_norm_surjective`, `Algebra.trace_surjective`.

*Proof sketch.* A nonzero Hermitian form has an anisotropic vector: if `⟨x, x⟩ = 0` for all `x`, then `⟨x + ay, x + ay⟩ = Tr_{ℓ/k}(c(a)⟨x, y⟩)` vanishes for all `a`, and surjectivity of the trace of the separable extension `ℓ/k` forces `⟨x, y⟩ = 0`, also in characteristic two. Rescale an anisotropic `x` with `⟨x, x⟩ = d ∈ k^×` by `a` with `N(a) = d⁻¹`, using surjectivity of the norm, split off the line and induct on its nondegenerate orthogonal complement.

**Checks.**

- On `𝔽₉ = 𝔽₃[i]`, `N(i) = 1` and `N(1 + i) = 2 = −1`; scaling the second basis vector by `1 + i` identifies `diag(1, 1)` with `diag(1, −1)`.
- Over `ℂ/ℝ` the forms `diag(1, 1)` and `diag(1, −1)` are not isometric: the norm is not surjective onto `ℝ^×`, which is the hypothesis used.
- In dimension one every nondegenerate form `d·x c(y)`, `d ∈ k^×`, is isometric to `x c(y)`.

### 0.8 Conjugate self-dual representations are unitary

Let `ℓ/k` be a quadratic extension of finite fields with generator `c`, `G` a group, `V` an absolutely irreducible `ℓ`-linear representation of `G` of dimension `n`, and `χ : G → k^×` a character. If there is an `ℓ`-linear `G`-isomorphism `V^∨ ≅ V^c ⊗ χ⁻¹`, then `V` carries a nondegenerate Hermitian form with `⟨gx, gy⟩ = χ(g)⟨x, y⟩`, unique up to `k^×`, and in a suitable basis `G` acts through `GU_n(ℓ)` with multiplier `χ`. (Boxer–Calegari–Gee–Newton–Thorne, Lemma 4.3.4 with proof, arXiv v3 p. 46.)

*Needs:* §§0.5–0.7; Mathlib `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`.

*Proof sketch.* The isomorphism is a nondegenerate equivariant pairing `ψ : V × V^c → χ`, unique up to `ℓ^×` by Schur's lemma. The pairing `(x, y^c) ↦ c(ψ(y, x^c))` is another, so it is `λψ`, and applying the construction twice gives `N_{ℓ/k}(λ) = 1`. Hilbert 90 writes `λ = c(η)/η`; rescaling by `η⁻¹` gives a Hermitian form, and §0.7 gives an orthonormal basis.

**Checks.**

- For `n = 1` and `G` acting on `ℓ` through `θ` with `θ·c(θ) = χ`, the conclusion is that `θ` takes values of norm `χ`.
- The trivial representation with `χ = 1` gives the standard form `x c(y)`.
- If `V` is not absolutely irreducible, uniqueness up to `k^×` fails: on `V = ℓ ⊕ ℓ` with trivial `G`, `diag(1, 1)` and `diag(1, 2)` are invariant forms not proportional to each other.

### 0.9 Normal subgroups of `SL_n` and `SU_n` over finite fields

Let `k` be a finite field of odd characteristic with `q` elements and `n ≥ 2`. (1) Unless `(n, q) = (2, 3)`, every proper normal subgroup of `SL_n(k)` is central, and `PSL_n(k)` is nonabelian; the perfectness of `SL_n(k)` and the simplicity of `PSL_n(k)` in this range are Tau Ceti's `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card`, `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard`, `Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup_of_three_le_card` and `Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup_of_four_le_natCard`, and the centre is Mathlib's `Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity`. (2) For the quadratic extension `ℓ/k` and `n ≥ 3`, `SU_n(ℓ)` is perfect, its centre consists of its scalars, every proper normal subgroup is central, and `PSU_n(ℓ)` is nonabelian simple. (3) Consequently, outside `(n, q) = (2, 3)` for `SL`, the composition factors of `SL_n(k)` (resp. `SU_n(ℓ)`) are `PSL_n(k)` (resp. `PSU_n(ℓ)`) and cyclic groups of order dividing `n`, every nontrivial quotient has `PSL_n(k)` (resp. `PSU_n(ℓ)`) as a composition factor, and there is no nontrivial abelian quotient. The solvable group `Sp₂(𝔽₃) = SL₂(𝔽₃)` is handled by its composition factors in §5.10. (Qian, Lemma 3.6 and Proposition 3.7, arXiv v1 pp. 15–16; Boxer–Calegari–Gee–Newton–Thorne, Lemma 5.2.3, arXiv v3 p. 51; Barnet-Lamb–Geraghty–Harris–Taylor, proofs of Corollaries 4.7–4.8, pp. 33–34.)

*Needs:* §0.1; §0.5; Tau Ceti `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card`, `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard`, `Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup_of_three_le_card`, `Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup_of_four_le_natCard`; Mathlib `MulAction.IwasawaStructure.isSimpleGroup`, `Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity`.

*Proof sketch.* (1) A normal subgroup `Δ` of `SL_n(k)` maps to a normal subgroup of the simple group `PSL_n(k)`: if the image is trivial, `Δ` is central; otherwise `Δ·Z = SL_n(k)` for the centre `Z`, so `SL_n(k) = [SL_n(k), SL_n(k)] = [Δ, Δ] ⊆ Δ` by perfectness. (2) For `SU_n` use the primitive action on isotropic lines and the long-root subgroup, which is the centre of the unipotent radical of the line stabiliser (the radical itself is not abelian in general); its conjugates generate `SU_n(ℓ)` and give perfectness for `n ≥ 3`. (3) Central quotients are cyclic of order dividing `n` by the description of the centre.

**Checks.**

- `PSL₃(𝔽₃)` is simple of order `5616`.
- `SL₂(𝔽₃)` is not perfect: its abelianisation has order three, which is why `(2, 3)` is excluded; Tau Ceti's rank-two theorems need `Nat.card k ≥ 4`, which `𝔽₃` fails and `𝔽₅` meets.
- The centre of `SL₃(𝔽₇)` is `{1, ω, ω²}` with `ω` a primitive cube root of unity in `𝔽₇`, of order `3 = gcd(3, 6)`.

### 0.10 Simple linear groups in different characteristics

Let `n ≥ 2`, `l₁ ≠ l₂` odd primes, and `k₁, k₂` finite fields of characteristics `l₁, l₂`. (1) If `max(l₁, l₂) > 10`, then `PSL_n(k₁)` is isomorphic neither to `PSL_n(k₂)` nor (for `n ≥ 3`) to `PSU_n(k₂′)` with `k₂′/k₂` quadratic, `PSU_n(k₁′) ≇ PSU_n(k₂′)` for `n ≥ 3`, and the same holds with the roles exchanged; consequently no composition factor of `SL_n(k₂)` or `SU_n(k₂′)` is isomorphic to `PSL_n(k₁)` or `PSU_n(k₁′)`. (2) For even `n`, `PSp_n(k₁) ≇ PSp_n(k₂)` with no condition on the size of `l₁, l₂`, and no composition factor of `Sp_n(k₂)` is isomorphic to `PSp_n(k₁)` when the latter is simple. (Artin, Theorem 2; Qian, Proposition 3.7 with proof, arXiv v1 p. 16, which takes the coincidences among the simple groups of type `A_n` from the classification; Barnet-Lamb–Geraghty–Harris–Taylor, proof of Corollary 4.8, p. 34; Boxer–Calegari–Gee–Newton–Thorne, Lemma 5.2.3, arXiv v3 p. 51.)

*Needs:* §0.9.

*Proof sketch.* (1) Compare the orders of these groups through their `l₁`-parts and the cyclotomic factors `qⁱ − 1`, following Artin's determination of the classical simple groups by their orders; the condition `max(l₁, l₂) > 10` removes the small cross-characteristic coincidences. The statement is restricted to the same-rank linear and unitary families: order alone does not separate every pair of finite groups of Lie type (types `B` and `C` share orders). (2) For odd `q`, `#PSp_{2m}(𝔽_q) = q^{m²} ∏_{i=1}^m (q^{2i} − 1)/2` is strictly increasing in `q`, so isomorphic groups have the same `q`. The consequences follow from §0.9(3) and its symplectic analogue (composition factors `PSp_n` and groups of order `2`, with `Sp₂(𝔽₃)` solvable).

**Checks.**

- `PSL₂(𝔽₁₁)` has order `660`, which is not `3^r(3^{2r} − 1)/2` for any `r`, so it is not `PSL₂(𝔽_{3^r})`.
- `PSL₂(𝔽₄) ≅ PSL₂(𝔽₅)` and `PSL₂(𝔽₇) ≅ PSL₃(𝔽₂)` are the kind of coincidence excluded by oddness and `max(l₁, l₂) > 10`.
- `PSL₂(𝔽₉) ≅ A₆` is in characteristic three; it is not isomorphic to `PSL₂(𝔽_q)` for any `q` of characteristic `l₂ ≥ 11`, since `#A₆ = 360` and `q(q² − 1)/2 ≥ 660`.
- `PSp₂(𝔽₅) ≅ A₅` (order `60`) and `PSp₂(𝔽₇)` (order `168`) differ, as the monotonicity in (2) predicts.

### 0.11 Irreducible groups generated by transvections

Let `l` be an odd prime and `k′` a finite field of characteristic `l`. (1) For `n > 2`, an absolutely irreducible subgroup `G ⊆ GL_n(k′)` generated by transvections is conjugate in `GL_n(k′)` to `SL_n(k)`, `Sp_n(k)` (`n` even) or `SU(n, k)` (`[k : 𝔽_l]` even) for some subfield `k ⊆ k′`. (2) For `n = 2`, an absolutely irreducible subgroup of `SL₂(k′)` generated by transvections is conjugate to `SL₂(k)` for a subfield `k ⊆ k′`, or `l = 3` and it is a binary icosahedral group `SL₂(𝔽₅)`. (Zalesskii–Serezhkin, main theorem, in the form applied by Qian, proof of Lemma 3.6, arXiv v1 p. 15, and Barnet-Lamb–Geraghty–Harris–Taylor, proof of Lemma 4.6, pp. 32–33; for (2), Dickson, *Linear groups*, Chapter XII, §§249–260, pp. 269–286, the subgroups of `PSL₂(𝔽_q)` being listed in the summary §260, pp. 285–286.)

*Needs:* §0.1; §0.5; ArithmeticGaloisRepresentations §4.4 (Dickson's classification, for (2)); Tau Ceti `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard`.

*Proof sketch.* (1) is the odd-characteristic, dimension-greater-than-two case of the Zalesskii–Serezhkin classification; no argument through an element of large order replaces the classification. (2) In Dickson's classification (ArithmeticGaloisRepresentations §4.4), a subgroup fixing a point of `ℙ¹` is reducible, a dihedral subgroup of order prime to `l` contains no element of order `l`, `A₄` and `S₄` contribute only `SL₂(𝔽₃)`, `PGL₂(𝔽_{q′})` contributes its index-two subgroup `PSL₂(𝔽_{q′})`, and `A₅` occurs in characteristic three (Dickson lists it for `q ≡ ±1 (mod 10)`, for instance `q = 9`), where its elements of order three are images of transvections. A subgroup `G ⊆ SL₂(k′)` generated by transvections maps onto a subgroup of `PSL₂(k′)` generated by elements of order `l`, and `G` has index at most two in the full preimage `±G`, which is `SL₂(k)` or `SL₂(𝔽₅)`; neither has a subgroup of index two (`SL₂(k)` is perfect for `#k ≥ 4` by Tau Ceti's `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard`, `SL₂(𝔽₃)` has abelianisation of order three, and `SL₂(𝔽₅)` is perfect), so `G` is the whole preimage.

**Checks.**

- For `n = 2` the conclusion of (1) fails: `SL₂(𝔽₅) ⊂ SL₂(𝔽₉)` is absolutely irreducible and generated by its elements of order three, which are transvections, but is none of `SL₂(k)` or `SU(2, k)`; it is the exception of (2).
- `SL_n(𝔽_l)` itself is generated by transvections (Tau Ceti `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`) and is the case `k = k′ = 𝔽_l`.
- A reducible group generated by transvections, such as the upper unitriangular group of `GL₃(𝔽₃)`, is outside the hypotheses.

### 0.12 Products of groups with distinct simple quotients

Let `H₁, H₂` be finite groups such that every nontrivial quotient of `H₁` has a composition factor isomorphic to a fixed nonabelian simple group `S₁` that is not a composition factor of `H₂`. If `Γ ≤ H₁ × H₂` surjects onto both factors, then `Γ = H₁ × H₂`. The same holds with the factors exchanged; `H₂` need not be perfect, so the statement applies to the solvable `Sp₂(𝔽₃)`. (Qian, proof of Proposition 3.7, arXiv v1 p. 16; Boxer–Calegari–Gee–Newton–Thorne, proof of Proposition 4.4.2, arXiv v3 p. 47; Barnet-Lamb–Geraghty–Harris–Taylor, proof of Corollary 4.8, p. 34.)

*Needs:* Mathlib `Subgroup.goursat`.

*Proof sketch.* By Goursat's lemma `Γ` is the preimage of the graph of an isomorphism `H₁/N₁ ≅ H₂/N₂`. If `N₁ ≠ H₁`, then `H₁/N₁` has `S₁` as a composition factor while `H₂/N₂` has only composition factors of `H₂`, a contradiction; so `N₁ = H₁`, then `N₂ = H₂`.

**Checks.**

- For `H₁ = SL₃(𝔽₁₃)` and `H₂ = SL₃(𝔽_{3^r})` every subgroup surjecting onto both factors is everything.
- For `H₁ = H₂ = SL₃(𝔽₁₃)` the diagonal surjects onto both factors and is proper: the hypothesis on `S₁` is necessary.
- For `H₁ = SL₂(𝔽₁₃)` and `H₂ = SL₂(𝔽₃)` the lemma applies although `H₂` is solvable, since `PSL₂(𝔽₁₃)` is not a composition factor of `H₂`.

### Examples

For `p = (X − 1)³` and `q = (X − ζ)(X − ζ²)(X − ζ^{398})` over `𝔽_l(ζ)`, `ζ` of order `N = 401` and `l ∤ 401`, the companion pair `(C(q)⁻¹, C(p))` satisfies Levelt's hypotheses (§0.3), is absolutely irreducible (§0.4), and its third element `C(q)C(p)⁻¹` is a transvection (§§0.1–0.2) because `1 + 2 + 398 ≡ 0 (mod 401)` makes `det C(q) = 1`.

### Dependencies

Mathlib transvections, dilatransvections, Goursat, Iwasawa, unitary and symplectic groups, Hilbert 90, norm and trace surjectivity; Tau Ceti generation, perfectness and projective simplicity of special linear groups; ClassicalArithmeticCompletion §§2.46, 2.60; HypergeometricMotives §§3.1, 3.2, 3.4; ArithmeticGaloisRepresentations §4.4. No geometric input.

## Layer 1: The Dwork pencil and its exponent data

The Dwork pencil is a one-parameter family of degree-`N` hypersurfaces in `ℙ^{N−1}` with a large diagonal symmetry group. A character of the fibrewise symmetry group `H₀` is recorded by an exponent vector `a ∈ (ℤ/Nℤ)^N`; the rank of the corresponding eigen-local-system is the number of residues `b` with `b + a_j ≠ 0` for all `j`. Two families of exponent vectors are used: Qian's asymmetric data, whose index set has trivial multiplicative stabiliser, and the self-dual data of Barnet-Lamb–Geraghty–Harris–Taylor, whose index set is stable under `b ↦ −b`. Both are zero-shaped: zero occurs `n + 1` times and every other residue at most once. The base change `t ↦ t^N` relates the pencil to a family over the thrice-punctured line, where the monodromy is a hypergeometric triple.

### 1.1 Auxiliary moduli with prescribed order of `l`

Let `l` be a prime, `s ≥ 1` and `S` a finite set of primes. There is a positive odd integer `N`, divisible by no prime of `S ∪ {l}`, such that the order `r` of `l` in `(ℤ/Nℤ)^×` is divisible by `s` and, when `r` is even, `N ∤ l^{r/2} + 1`. Putting every prime below a given bound into `S` makes `N` larger than that bound and prime to any given integer. In particular for every `m ≥ 1` there is such an `N` with `m | r`, so that every finite field of characteristic `l` and degree dividing `m` embeds in `𝔽_l(ζ_N)`. (Qian, Lemma 2.3 with proof, arXiv v1 pp. 8–9; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 6.1 and proof, p. 40.)

*Needs:* Mathlib `orderOf`, `ZMod.pow_totient`, `Polynomial.cyclotomic`, `Nat.exists_prime_and_dvd`.

*Proof sketch.* Write `s = 2^a ∏ pᵢ^{aᵢ}`. For large `t` choose odd prime factors `A` of `l^{2^{t−2}} + 1` and `B` of `l^{2^{t−1}} + 1` outside `S`; both numbers are `2 mod 4` for odd `l` and odd for `l = 2`. The orders of `l` modulo `A` and `B` are `2^{t−1}` and `2^t`, and `l^{2^{t−1}}` is `1` modulo `A` and `−1` modulo `B`, so `−1` is not a power of `l` modulo `M₀ = AB`. For each odd `pᵢ` and large `tᵢ ≥ aᵢ`, the cyclotomic value `Φ_{pᵢ}(l^{pᵢ^{tᵢ−1}})` exceeds `pᵢ`, any prime factor in the exclusion set of that stage is `pᵢ` itself and divides it exactly once (expand the geometric sum modulo `pᵢ²`), so there is a new prime `Mᵢ` with order of `l` exactly `pᵢ^{tᵢ}`. Then `N = M₀ ∏ Mᵢ` works by the Chinese remainder theorem. No primitive-divisor theorem is needed.

**Checks.**

- A prime `N` never satisfies both conditions with `r` even: `(ℤ/Nℤ)^×` is cyclic, so `l^{r/2} ≡ −1`.
- For `l = 3` and `s = 4`, the composite `N = 35` works: `r = lcm(4, 6) = 12` and `3⁶ ≡ 29 ≢ −1 (mod 35)`.
- For `l = 2`, `s = 1`, `N = 7` has `r = 3` odd, so the second condition is vacuous.

### 1.2 The Dwork pencil

Let `N ≥ 3` be odd. Over `T₀ = Spec ℤ[1/N][t, (1 − t^N)⁻¹]` (the projective line minus `∞` and `μ_N`) let `Y ⊂ ℙ^{N−1} × T₀` be the hypersurface `X₁ᴺ + ⋯ + X_Nᴺ = N t X₁⋯X_N` and `π : Y → T₀` the projection. Then `π` is smooth and projective of relative dimension `N − 2` with geometrically connected fibres; the fibre `Y₀` is the Fermat hypersurface of degree `N`; and over a point of `μ_N` the fibre has exactly `N^{N−2}` singular points, all ordinary double points, forming one free orbit of the group `H₀` of §1.3. Write `Y_s` for the fibre at `s`. (Qian, opening of §3, arXiv v1 p. 10; Barnet-Lamb–Geraghty–Harris–Taylor, §4, p. 26; Boxer–Calegari–Gee–Newton–Thorne, §4.1, arXiv v3 p. 40.)

The construction has the following API.

- `π` is smooth and projective of relative dimension `N − 2` over `T₀`; its formation commutes with every base change `T′ → T₀`, and for a field `K` over `ℤ[1/N]` and `t ∈ K` with `t^N ≠ 1` the fibre is the hypersurface `∑ Xᵢᴺ = N t ∏ Xᵢ` over `K`.
- The fibre at `t = 0` is the Fermat hypersurface `∑ Xᵢᴺ = 0`.
- Every geometric fibre of `π` is connected, and every smooth fibre is geometrically integral.
- Over `t = 1` the singular points are the `H₀`-translates of `(1 : ⋯ : 1)`, each an ordinary double point; there are `N^{N−2}` of them.

*Needs:* Mathlib `AlgebraicGeometry.Smooth`, `MvPolynomial`; EtaleCohomologyFoundations §F.3 for the lissity of its higher direct images (used in Layer 2).

*Proof sketch.* The partial derivatives `N Xᵢ^{N−1} − N t ∏_{j≠i} Xⱼ` vanish together only if `Xᵢᴺ = t ∏ Xⱼ` for all `i`; summing gives the equation, and if all `Xᵢ ≠ 0` multiplying gives `t^N = 1`, while if one coordinate vanishes all do. At `t = 1` the Hessian on the tangent space at `(1 : ⋯ : 1)` is `N(N·I − J)` restricted to the tangent hyperplane, which is nondegenerate when `N` is invertible. A hypersurface of positive dimension in projective space is connected.

**Checks.**

- For `N = 3`, `Y` is the Hesse pencil `X₁³ + X₂³ + X₃³ = 3tX₁X₂X₃`; its fibre at `t = 1` is singular exactly at `(1 : 1 : 1)`, `(1 : ζ₃ : ζ₃²)`, `(1 : ζ₃² : ζ₃)`, which is `3 = 3^{3−2}` points.
- For `N = 5` the fibre at `t = 1` has `5³ = 125` singular points.
- Over `t = ζ_N` the fibre is singular, so a base `ℙ¹ − {∞}` that forgets `μ_N` does not give a smooth family.

### 1.3 Symmetry groups and their characters

Let `H = μ_N^N/μ_N` (diagonal `μ_N`) and `H₀ = {(ξ₁, …, ξ_N) : ξ₁⋯ξ_N = 1}/μ_N ⊂ H`. Over `ℤ[1/N, ζ_N]`, `H` acts on `Y` by `(ξᵢ)·(Xᵢ, t) = (ξᵢXᵢ, (∏ ξᵢ)⁻¹ t)`; thus `H₀` acts on every fibre and `H` on `Y₀`. For `a ∈ (ℤ/Nℤ)^N` with `∑ aᵢ = 0`, `ξ ↦ ∏ ξᵢ^{aᵢ}` is a character `χ_a : H → μ_N`. The involution `ς : X_j ↦ X_{N+1−j}` normalises `H₀`. For a character `χ` of `H₀` and a coefficient ring `R` containing `1/N` and the values of `χ`, `e_χ = (1/#H₀) ∑_{ξ∈H₀} χ(ξ)⁻¹ ξ` is an idempotent of `R[H₀]` cutting out the `χ`-isotypic part. (Qian, §3, arXiv v1 pp. 10–11; Barnet-Lamb–Geraghty–Harris–Taylor, §4, p. 26; Boxer–Calegari–Gee–Newton–Thorne, §4.1, arXiv v3 p. 40.)

The construction has the following API.

- `H` is a finite abelian group of order `N^{N−1}` and `H₀` a subgroup of order `N^{N−2}`, the kernel of the product map.
- After fixing `ζ_N`, `Hom(H, μ_N)` is identified with `ker(∑ : (ℤ/Nℤ)^N → ℤ/Nℤ)`, and `χ_a` and `χ_b` agree on `H₀` exactly when `a − b` is a constant vector.
- The action of `H` on `Y` lies over the action `t ↦ (∏ ξᵢ)⁻¹ t` on `T₀`; `H₀` acts over `T₀`.
- `e_χ` is an element of `MonoidAlgebra R H₀`, defined once `#H₀ = N^{N−2}` is invertible in `R`, with `ξ e_χ = χ(ξ) e_χ`; it is the projector of ModularityAndLanglandsExtensions §2.9, which states its idempotence and the orthogonality of distinct `e_χ` on cohomology.
- `ς` normalises `H₀`, and conjugation by `ς` sends `χ_a` to the character of the reversed vector.

*Needs:* §1.2; Mathlib `IsPrimitiveRoot`, `MonoidAlgebra`; ModularityAndLanglandsExtensions §2.9 (the projector).

**Checks.**

- `#H₀ = N^{N−2}`; for `N = 3` it is `3`, generated by `(ζ, ζ⁻¹, 1)`, acting on the Hesse pencil fibrewise.
- The constant vector `(1, …, 1)` gives the trivial character of `H₀` but a nontrivial character of `H`.
- If `∑ aᵢ ≢ 0 (mod N)`, `ξ ↦ ∏ ξᵢ^{aᵢ}` is nontrivial on the diagonal `μ_N` and does not descend to `H`.
- `ς` does not lie in the image of `H` in `Aut(Y)`: for `N ≥ 3` it does not commute with `H₀`.

### 1.4 Exponent data and index sets

Fix an odd `N ≥ 3` and `2 ≤ n ≤ N − 1`. A Dwork exponent datum of rank `n` is a vector `a ∈ (ℤ/Nℤ)^N` with `∑ a_j = 0` whose entries take exactly `N − n` distinct values. Its index set is `B(a) = {b ∈ ℤ/Nℤ : b + a_j ≠ 0 for every j}`, and its character is `χ_a|_{H₀}`; data differing by a permutation and a constant vector are equivalent. A datum is zero-shaped if `0` occurs exactly `n + 1` times and every nonzero residue at most once; the structure `ZeroShapedDatum` records such a vector together with `ZeroShapedDatum.sum_eq_zero`, `ZeroShapedDatum.card_zero` (zero occurs `n + 1` times) and `ZeroShapedDatum.injOn_nonzero` (nonzero residues occur at most once), and `ZeroShapedDatum.indexSet` is its index set. Two zero-shaped families are used.

- Qian's asymmetric data for `n > 2`: for `n` odd, `a = (1, 2, 4, 5, …, (N − n + 2)/2, (N + n − 2)/2, …, N − 4, N − 3, 0, …, 0)`; for `n` even, `a = (1, 2, 3, 4, 5, 7, 8, …, (N − n + 3)/2, (N + n − 3)/2, (N + n − 1)/2, …, N − 4, 0, …, 0)`. Their index sets are `qianIndexSet N n`: `{1, 2, −3} ∪ {(N − n + 4)/2, …, (N + n − 4)/2}` for `n` odd and `{1, 2, 3, −6} ∪ {(N − n + 5)/2, …, (N + n − 5)/2}` for `n` even.
- The self-dual data for `n` even and `N > n + 1`: `a = (1, 2, …, (N − n − 1)/2, 0, …, 0, (N + n + 1)/2, …, N − 1)` with `n + 1` zeros, whose index set is `selfDualIndexSet N n = {(N + 1 − n)/2, …, (N − 1 + n)/2}`. For `n = 2` this is Qian's rank-two datum, with `B = {(N − 1)/2, (N + 1)/2}`.

(Qian, §3, exponent vectors and index sets, arXiv v1 pp. 10–11; Barnet-Lamb–Geraghty–Harris–Taylor, §4 and Lemma 4.1, pp. 26–27; Boxer–Calegari–Gee–Newton–Thorne, §4.1, arXiv v3 p. 40.)

The definitions have the following API.

- For every rank-`n` datum, `#B(a) = n`: `b ∉ B(a)` exactly when `−b` is one of the `N − n` values.
- If `0` occurs among the `a_j` then `0 ∉ B(a)`.
- For Qian's data and `N > 100n + 100`, `qianIndexSet N n` has `n` elements, is the index set of the displayed vector, and sums to `0`.
- `selfDualIndexSet N n` has `n` elements, is stable under `b ↦ −b`, and sums to `0`.
- A zero-shaped datum of rank `n` has `N − n` distinct values, so it is a rank-`n` datum; the converse fails (Check below).
- For a zero-shaped datum `∑_{b∈B(a)} b = 0`: `B(a)` is the complement of the negatives of the values `{0} ∪ A′` (`A′` the nonzero values, each occurring once), the residues of the odd modulus `N` sum to `N(N − 1)/2 ≡ 0`, and the nonzero values sum to `∑ a_j = 0`. Hence the characters of `μ_N` indexed by `B(a)` (§3.1) have trivial product. For a rank-`n` datum that is not zero-shaped `∑B(a)` is the sum of the distinct values, which need not vanish.

*Needs:* §1.3; Mathlib `ZMod`.

**Checks.**

- `n = 3`, `N = 401`: `B = {1, 2, 398}` and `1 + 2 + 398 = 401 ≡ 0`.
- `n = 4`, `N = 501`: `B = {1, 2, 3, 495}`, and `1 + 2 + 3 + 495 = 501 ≡ 0`.
- For Qian's datum with `n = 3`, `N = 401`, `−B = {400, 399, 3} ≠ B`, so the datum is not self-dual; a definition imposing `B = −B` would exclude it.
- For `N = 5`, `n = 2`, `a = (1, 1, 2, 2, 4)` has sum `10 ≡ 0` and three distinct values, so it is a rank-two datum, but `B = {0, 2}` contains `0`, sums to `2 ≠ 0`, and `a` is not zero-shaped.
- For the self-dual datum with `n = 2`, `N = 7`, `a = (1, 2, 0, 0, 0, 5, 6)` and `B = {3, 4} = −B`.
- For `N = 7` the rank-three datum `a = (0, 0, 0, 1, 3, 5, 5)` (sum `14 ≡ 0`, four distinct values) is not zero-shaped: zero occurs three times and `5` twice. Its index set `B = {1, 3, 5}` sums to `9 ≡ 2`, the sum `0 + 1 + 3 + 5` of its distinct values, whereas the zero-shaped `a = (0, 0, 0, 0, 1, 2, 4)` has `B = {1, 2, 4}` with sum `7 ≡ 0`; a statement that uses `∑B = 0` needs the zero-shaped hypothesis.

### 1.5 Stabilisers of the index sets

(1) Let `n > 2`, `N` odd with `N > 100n + 100`, and `B = qianIndexSet N n`. If `α ∈ (ℤ/Nℤ)^×` satisfies `αB = B` then `α = 1`. In particular `−B ≠ B`, and for every power `l^j` of a prime `l ∤ N`, `l^j B ≠ B` unless `l^j ≡ 1` and `l^j B ≠ −B` unless `l^j ≡ −1`. (2) Let `n` be even, `N` odd with `N > n + 1`, and `B = selfDualIndexSet N n`. If `αB = B` then `α = ±1`. (Qian, Lemma 3.1 with proof, arXiv v1 pp. 11–12; Barnet-Lamb–Geraghty–Harris–Taylor, proof of Lemma 4.6, pp. 32–33.)

*Needs:* §1.4.

*Proof sketch.* (1) Since `1 ∈ B`, `α ∈ B`. The small elements `1, 2` (and `3` for `n` even) and `−3` (resp. `−6`) are separated from the middle block by `N > 100n + 100`; `α = 2` would put `4` in `B`, `α = −3` would put `9` or `−9` in `B`, and similarly for `3` and `−6`. If `α = (N + x)/2` lies in the middle block then `2α = x ∈ B` forces `x ∈ {1, 3}` (`n` even) or `x ∈ {1, −3}` (`n` odd); then `(N − x)/2 ∈ B` and the product `−x²/4 ∈ B`, so `4B` contains `−1` or `−9`, which its explicit description excludes. (2) The complement of `B` is the interval `C = [−c, c]` with `c = (N − 1 − n)/2`, and `αB = B` is `αC = C`. For an interval of length `L = 2c + 1` with `3 ≤ L ≤ N − 2` and a shift `d` with integer representative `1 ≤ |d| ≤ (N − 1)/2`, `#(C ∩ (C + d)) = max(0, L − |d|) + max(0, L + |d| − N)` (integer subtraction; the two terms count the overlap of the shifted interval and of its wrap-around). An arithmetic progression of difference `α` and length `L < N` meets its translate by `α` in exactly `L − 1` points, so `αC = C` forces this value for `d ≡ α`. If `L + |d| ≤ N` the value is `max(0, L − |d|)`, which is `L − 1` only for `|d| = 1`; if `L + |d| > N` it is `2L − N` (for `|d| ≤ L`) or `L + |d| − N` (for `|d| > L`), equal to `L − 1` only for `L = N − 1` or `|d| = N − 1`, both excluded. Hence `|d| = 1`.

**Checks.**

- `n = 3`, `N = 401`: `2B = {2, 4, 395} ≠ B`.
- `n = 2`, `N = 7`: `B = {3, 4}` and `2B = {6, 1} ≠ B`, while `−B = B`.
- For `N = n + 1` the self-dual set is all of `(ℤ/Nℤ) − {0}` and every unit stabilises it: the hypothesis `N > n + 1` is needed.
- Both truncations are needed in the overlap count: for `N = 11`, `n = 8` (`c = 1`, `L = 3`) and `d = 5`, `C = {10, 0, 1}` and `C + 5 = {4, 5, 6}` are disjoint, the count is `0 + 0 = 0`, while the untruncated `L − |d|` would give `−2`; for `d = 1` the count is `2 = L − 1`.

### 1.6 The quotient family over the thrice-punctured line

Let `T′₀ = ℙ¹ − {0, 1, ∞}` with coordinate `t′`. For `n > 2` let `Y′ ⊂ ℙ^{N−1} × T′₀` be `X′₁ᴺ + ⋯ + X′_{N−1}ᴺ + t′⁻¹X′_Nᴺ = N X′₁⋯X′_N`, with `H₀` scaling coordinates. The map `t ↦ t′ = t^N` is a finite étale Galois cover `T₀ − {0} → T′₀` with group `μ_N` over `ℤ[1/N, ζ_N]`, and `X′ᵢ = Xᵢ` (`i < N`), `X′_N = tX_N` identify its pullback of `Y′` with `Y − Y₀`, `H₀`-equivariantly. For the self-dual data the family `Ỹ` with `t′⁻¹` on the middle coordinate `X̃_{(N+1)/2}` is stable under `ς̃ : X̃_j ↦ X̃_{N+1−j}` and plays the same role; over `ℚ(ζ_N)` it is the quotient of `Y − Y₀` by the copy of `μ_N` acting on the middle coordinate. (Qian, §3, family `Y′`, arXiv v1 pp. 12–13; Barnet-Lamb–Geraghty–Harris–Taylor, §4, the family `Ỹ` over `T̃₀`, p. 29.)

The construction has the following API.

- `Y′ → T′₀` (for `n > 2`) and `Ỹ → T′₀` (self-dual data) are smooth projective of relative dimension `N − 2`.
- The pullback along `t ↦ t^N` is `H₀`-equivariantly isomorphic to `Y − Y₀ → T₀ − {0}`.
- `t ↦ t^N : T₀ − {0} → T′₀` is finite étale Galois with group `μ_N` over `ℤ[1/N, ζ_N]`, the deck transformation `t ↦ ζt` lifting through the element of `H` acting on the distinguished coordinate.

*Needs:* §§1.2–1.3.

**Checks.**

- For `N = 3`, `t′ = t³` and `Y′` is `X₁³ + X₂³ + t′⁻¹X₃³ = 3X₁X₂X₃`; over `t′ = 8` the cover has fibre `{2, 2ζ₃, 2ζ₃²}`.
- Substituting `X′_N = tX_N` and `t′ = t^N` gives `t′⁻¹t^N X_Nᴺ = X_Nᴺ` and `N X′₁⋯X′_N = N t X₁⋯X_N`: the pullback equation is that of `Y`.
- `t ↦ t^N` does not make `T₀` a cover of `T′₀`: `t = 0` lies over `t′ = 0 ∉ T′₀`, so the Fermat fibre enters only through the local monodromy at `t′ = 0`.
- Over `t′ = 1` the fibre of `Y′` is singular, being the image of the singular fibres over `μ_N`.

### Examples

For `N = 401`, `n = 3` and Qian's datum, `B = {1, 2, 398}` (§1.4) and the stabiliser in `(ℤ/401ℤ)^×` is trivial (§1.5). Since `401` is prime, every even order `r` of `l` has `l^{r/2} ≡ −1`: for `l = 3`, a primitive root, `r = 400` and `3^{200} ≡ −1`, which is the unitary case of Layer 5; for `l = 5`, `r = 25` is odd, `−1` is not a power of `5`, and the special linear case applies. §1.1 produces composite moduli for which the second case holds with `r` even.

### Dependencies

Mathlib smooth morphisms, multivariate polynomials, roots of unity, group algebras, orders in `(ℤ/Nℤ)^×`, prime divisors (`Nat.exists_prime_and_dvd`) and cyclotomic polynomials; ModularityAndLanglandsExtensions §2.9 (the character projector); EtaleCohomologyFoundations §F.3 enters only through Layer 2.

## Layer 2: Eigen-local-systems of the Dwork pencil

The middle cohomology `R^{N−2}π_*` of the Dwork pencil is a lisse sheaf on which `H₀` acts; its `χ`-eigenparts are the Dwork motives. Their ranks are computed on the Fermat fibre, where the full group `H` acts with one-dimensional eigenspaces indexed by exponent vectors without zero entries. Poincaré duality pairs the `χ`- and `χ⁻¹`-parts, which for the self-dual data gives real forms with alternating pairings.

### 2.1 Cohomology of the Fermat hypersurface

Let `k` be a field of characteristic `0` or prime to `N` containing `μ_N`, and `X ⊂ ℙ^{N−1}_k` the Fermat hypersurface `∑ Xᵢᴺ = 0`, with the action of `H`. The cohomology is one of: Betti cohomology of `X(ℂ)` with coefficients in `ℚ(ζ_N)`, when `k ⊆ ℂ`; the geometric `ℓ`-adic cohomology `H^{N−2}_ét(X_k̄, E)` with coefficients in an algebraic extension `E` of `ℚ_ℓ` containing `μ_N`, for a prime `ℓ` invertible in `k` (every prime `ℓ` when `k` has characteristic zero); or algebraic de Rham cohomology, when `k` has characteristic zero. For `a ∈ (ℤ/Nℤ)^N` with `∑ aᵢ = 0`, the `a`-eigenspace of primitive middle cohomology `H^{N−2}_prim` is zero unless every `aᵢ ≠ 0`, in which case it is one-dimensional; the rest of `H^{N−2}` is the `a = 0` part, which vanishes for `N − 2` odd. Over `ℂ` the eigenline for `a` with representatives `⟨aᵢ⟩ ∈ {1, …, N − 1}` lies in `H^{p, N−2−p}` with `p + 1 = ∑ᵢ⟨aᵢ⟩/N`. Over integral coefficient rings in which `N` is invertible — `O` for Betti cohomology, and for the étale cohomology of `X_k̄` the rings `O_λ` and `O/𝔫` with the residue characteristic of `λ`, resp. every prime dividing the norm of `𝔫`, invertible in `k` — the eigensummands are finite projective of rank one; they are free after completion at a prime or reduction modulo a nonzero ideal. (Deligne, *Hodge cycles on abelian varieties*, Chapter I, §7, Propositions 7.4 and 7.6, and Proposition 7.10 with its proof, p. 50, which take `ℓ` different from the residue characteristic and pass to characteristic `p` by smooth proper base change; Boxer–Calegari–Gee–Newton–Thorne, proof of Lemma 4.4.4, arXiv v3 p. 48; Barnet-Lamb–Geraghty–Harris–Taylor, proofs of Lemma 4.1 and Lemma 5.2, pp. 28, 36.)

*Needs:* §1.3; ComplexComparisonPartII §C5.3 (`properPureHodge`) and §C6.6; EtaleCohomologyFoundations §§F.2.1, F.3, F.4.2, F.4.5; EtaleDualityAndPerverseSheaves §4.3(c); InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3.

*Proof sketch.* Under the convention `(h⁻¹)*` the trace formula for the elements of `H` on the Fermat hypersurface (a `μ_N^{N−1}`-cover of `ℙ^{N−2}` branched along a hyperplane arrangement) counts the dimension of each eigenspace. The Hodge type is read from Griffiths' residue description of `H^{N−2}_prim` by the forms `X^{b−1}Ω/F^k`. Changing the action to `h*` inverts every label. In characteristic `p > 0` the Fermat hypersurface is a geometric fibre of the smooth proper Fermat scheme over `ℤ[1/N, ζ_N]`, and for `ℓ ≠ p` smooth proper base change over the connected `Spec ℤ[1/(Nℓ), ζ_N]` (EtaleCohomologyFoundations §F.3) identifies its geometric `ℓ`-adic cohomology `H`-equivariantly with that of a characteristic-zero fibre; this is where `ℓ` invertible in `k` is used. The integral and torsion clauses use that `H^q(X_k̄, ℤ_ℓ)` is torsion-free in every degree `q`, `X` being a smooth hypersurface of dimension `N − 2 ≥ 1` (EtaleDualityAndPerverseSheaves §4.3(c); for Betti coefficients, `H^q(X(ℂ), ℤ)` is finitely generated and its `ℓ`-adic completion is `H^q_ét(X, ℤ_ℓ)` for every `ℓ` by the Artin comparison, ComplexComparisonPartII §C6.6, so it is torsion-free as well): then `H^{N−2}(X_k̄, O_λ)` is finite free, and `H^{N−2}(X_k̄, O_λ/λ^k) = H^{N−2}(X_k̄, O_λ)/λ^k` by the universal coefficient sequence because `H^{N−1}(X_k̄, O_λ)` has no torsion; the projector `e_a`, defined since `N` is invertible, cuts out a direct summand, and a direct summand of a finite free module over the local ring `O_λ` is free, of the rank of its rationalisation.

**Checks.**

- `N = 3`: the characters with all `aᵢ ≠ 0` and `∑ aᵢ ≡ 0 (mod 3)` are `(1, 1, 1)` and `(2, 2, 2)`, so `H¹` of the Fermat cubic has rank two; `∑⟨aᵢ⟩/3 = 1` and `2` put the eigenlines in `H^{0,1}` and `H^{1,0}`.
- `a = (1, 2, 0)` for `N = 3` has a zero entry and its eigenspace is zero.
- For `N = 5` the number of `a ∈ (ℤ/5ℤ)^5` with all entries nonzero and sum zero is `((N − 1)^N + (−1)^N(N − 1))/N = (1024 − 4)/5 = 204`, the rank of `H³_prim` of the Fermat quintic threefold.
- The coefficient prime must be invertible in `k`. Over `k = 𝔽₂₅`, which contains `μ₃`, the Fermat cubic is supersingular: `5 ≡ 2 (mod 3)` makes cubing bijective on `𝔽₅`, so `X(𝔽₅)` has `6` points (trace `0`), and `X(𝔽₂₅)` has `36` points (trace `−10`); equivalently the coefficient of `(xyz)⁴` in `(x³ + y³ + z³)⁴` is zero. Hence `X[5](k̄) = 0`, `H¹_ét(X_k̄, ℤ/5) = 0` and `H¹_ét(X_k̄, ℚ₅(ζ₃)) = 0`, whereas the two characters `(1, 1, 1)` and `(2, 2, 2)` would predict dimension `2`. With `ℓ = 7` over the same `k` the dimension is `2`, and over a field of characteristic zero `ℓ = 5` is allowed.

### 2.2 Integral Betti cohomology of smooth complete intersections is torsion-free

Let `X ⊂ ℙ^M_ℂ` be a smooth complete intersection of dimension `m ≥ 0`. Then `Hⁱ(X(ℂ), ℤ)` is torsion-free for every `i`. This is the Betti corollary of the étale theorem EtaleDualityAndPerverseSheaves §4.3(c), which is imported with its family form §4.3(e) and not proved again: for a smooth projective family of smooth complete intersections of dimension `m ≥ 1` and fixed multidegree over a base on which `ℓ` is invertible, in any characteristic, the stalks of `Rⁱπ_*ℤ_ℓ` are torsion-free and `Rⁱπ_*(ℤ/ℓ^k) = Rⁱπ_*ℤ_ℓ/ℓ^k`. The fibres of the Dwork pencil are smooth hypersurfaces of degree `N` and dimension `N − 2 ≥ 1` in `ℙ^{N−1}`. (Qian, Proposition 3.2, arXiv v1 p. 13, and Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 4.1(2), p. 28, use this freeness for the Dwork family.)

*Needs:* EtaleDualityAndPerverseSheaves §4.3(c), (e); ComplexComparisonPartII §C6.6 (`adicArtinComparison`).

*Proof sketch.* For `m = 0`, `X(ℂ)` is a finite set and `H⁰(X(ℂ), ℤ)` is free. For `m ≥ 1`, `X(ℂ)` is a compact manifold, so `Hⁱ(X(ℂ), ℤ)` is finitely generated; for every prime `ℓ` the Artin comparison (ComplexComparisonPartII §C6.6) identifies `Hⁱ(X(ℂ), ℤ) ⊗ ℤ_ℓ` with `Hⁱ_ét(X, ℤ_ℓ)`, which is torsion-free by EtaleDualityAndPerverseSheaves §4.3(c). A finitely generated abelian group without `ℓ`-primary torsion for every `ℓ` is free. For the family, the stalks of `Rⁱπ_*ℤ_ℓ` are the fibre cohomology (§4.3(e)), torsion-free by §4.3(c), and the sequence `0 → Rⁱπ_*ℤ_ℓ/ℓ^k → Rⁱπ_*(ℤ/ℓ^k) → R^{i+1}π_*ℤ_ℓ[ℓ^k] → 0` has vanishing right-hand term.

**Checks.**

- For a smooth plane cubic, `H¹(X, ℤ) ≅ ℤ²` and `H²(X, ℤ) ≅ ℤ` are torsion-free.
- For a smooth quadric surface, `H²(X, ℤ_ℓ) ≅ ℤ_ℓ²` for every `ℓ` and hence `H²(X(ℂ), ℤ) ≅ ℤ²`; an Enriques surface, which is not a complete intersection, has `H²` with `ℤ/2` torsion and is outside the hypothesis.
- For the Fermat quintic threefold, `H³` is torsion-free of rank `204` (§2.1), so `H³(X, ℤ/ℓ^k) ≅ (ℤ/ℓ^k)^{204}`: reduction modulo `ℓ^k` keeps the rank.
- Smooth proper base change alone does not exclude torsion: torsion-freeness is the extra input used in §2.7.

### 2.3 The Dwork eigen-local-systems

Let `a` be a Dwork exponent datum with character `χ` of `H₀` and `O = ℤ[1/(2N), ζ_N]`.

1. For a prime `λ` of `O` of residue characteristic `l`, `V_λ = e_χ R^{N−2}π_*O_λ` is a lisse sheaf of `O_λ`-modules on `T₀ × Spec O[1/l]`.
2. For a nonzero ideal `𝔫` of `O` of norm `M`, `V[𝔫] = e_χ R^{N−2}π_*(O/𝔫)` is a lisse sheaf of `O/𝔫`-modules on `T₀ × Spec O[1/M]`.
3. After fixing `τ : ℚ(ζ_N) ↪ ℂ` with `τ(ζ_N) = e^{2πi/N}`, `V_B = e_χ R^{N−2}π̃_*O` is a local system of `O`-modules on `T₀(ℂ)`.
4. `V′_B` on `T′₀(ℂ)`, defined in the same way from `Y′`, pulls back to `V_B|_{T₀(ℂ)−{0}}`.
5. For every finite place `λ` of `M`, of any residue characteristic `l` (`l = 2` and `l | N` included), `V^ℚ_λ = e_χ R^{N−2}π_*M_λ` is a lisse `M_λ`-sheaf on `T₀ × Spec ℤ[1/N, ζ_N][1/l]`; the projector is defined because `#H₀ = N^{N−2}` is invertible in the field `M_λ`. For `λ ∤ 2N`, `V^ℚ_λ = V_λ ⊗_{O_λ} M_λ`.

The stalk of `V_λ` at a point `t` is the Dwork eigenrealization of `(N, χ, λ, t)` of ModularityAndLanglandsExtensions §2.9, and so is that of `V^ℚ_λ` after extension to `M_λ` when `λ ∤ N`; at the places `λ | N`, which that section excludes, `V^ℚ_λ` is constructed here by the same projector with rational coefficients. This section assembles these realizations into lisse sheaves and local systems over the parameter line, which the monodromy computations of Layers 4 and 5 need. `V_B ⊗ O_λ` corresponds to `τ*V_λ` and `V_B ⊗ O/𝔫` to `τ*V[𝔫]` under the equivalence of locally constant analytic and étale sheaves on `(T₀)_ℂ`, and `V[𝔫] ≅ ∏_λ V_λ/λ^{a_λ}` for `𝔫 = ∏ λ^{a_λ}`. For `n = 2` and the self-dual data these sheaves are written `U_λ`, `U[𝔫]`, `U_B`, `U^ℚ_λ`. Stalks are `V_{λ,t}`, `V[𝔫]_t`, `V_{B,t}` and `V^ℚ_{t,λ}`. (Qian, §3, arXiv v1 pp. 12–13; Boxer–Calegari–Gee–Newton–Thorne, §4.1, arXiv v3 p. 40, where the higher direct image degree `N − 2` must be inserted in the displayed definition; Barnet-Lamb–Geraghty–Harris–Taylor, §4, pp. 26–29, the Betti sheaves and their comparison with the étale ones on p. 29.)

The construction has the following API.

- The stalk of `V_λ` at a geometric point `t̄` is `e_χ H^{N−2}_ét(Y_{t̄}, O_λ)`; for `t ∈ T₀(K)` it is a `G_K`-module.
- Formation commutes with base change along `S → T₀[1/l]`.
- `V[λ^k] ≅ V_λ/λ^k`, and `V[𝔫] ≅ ∏ V_λ/λ^{a_λ}`.
- `V_B ⊗_O O_λ ≅ τ*V_λ` and `V_B ⊗ O/𝔫 ≅ τ*V[𝔫]`, by the Artin comparison.
- For `σ ∈ Gal(ℚ(ζ_N)/ℚ)`, `σ` carries the `χ`-eigensheaf with coefficients `O_λ` to the `σχ`-eigensheaf with coefficients `O_{σλ}`.
- `V′_B` pulls back to `V_B` on `T₀(ℂ) − {0}`.
- For every finite place `λ` of `M` and `t ∈ T₀(K)`, `K` a field over `ℤ[1/N, ζ_N]` of characteristic different from `l`, the stalk `V^ℚ_{t,λ}` is the `G_K`-module `e_χ H^{N−2}_ét(Y_{t̄}, M_λ)`; formation commutes with base change, and for `λ ∤ 2N` it is `V_{λ,t} ⊗_{O_λ} M_λ`.

*Needs:* §§1.2–1.4, §2.2 (Betti lattices); EtaleDualityAndPerverseSheaves §4.3(c), (e); ModularityAndLanglandsExtensions §2.9; EtaleCohomologyFoundations §§F.0.2, F.2.1, F.3, F.4.2, F.4.5; ComplexComparisonPartII §§C5.2, C6.5, C6.6.

*Proof sketch.* `R^{N−2}π_*` of the smooth proper `π` is lisse with torsion-free stalks (EtaleDualityAndPerverseSheaves §4.3(c), (e); §2.2 for the Betti lattices); `H₀` acts by functoriality through `(h⁻¹)*` and `e_χ` is an idempotent endomorphism because `#H₀` and `2` are invertible in `O`, so its image is a lisse direct summand. The Artin comparison and Ehresmann's theorem identify the analytic and étale local systems, and `e_χ` commutes with them. The Chinese remainder theorem and exactness of `e_χ` give the product decomposition. For `V^ℚ_λ` the same argument runs with the rational adic realization `R^{N−2}π_*M_λ` (EtaleCohomologyFoundations §F.4.5), lisse on `T₀[1/l]` for every `l`, and the rational projector.

**Checks.**

- For the Hesse boundary `N = 3`, `H₀ ≅ μ₃` acts on each cubic by translations, hence trivially on `H¹`: the trivial character of `H₀` has rank two and each nontrivial character rank zero; the two `H`-eigenlines `(1, 1, 1)` and `(2, 2, 2)` both restrict to the trivial `H₀`-character.
- At `t = 0` the stalk `V_{λ,0}` is the direct sum of the `n` lines `V_{λ,i}`, `i ∈ B(a)`, on which `H` acts through `χᵢ` (§2.6).
- The stalk of `V_B ⊗ O/𝔫` at `t ∈ T₀(ℂ)` equals the stalk of `V[𝔫]` at the corresponding geometric point.
- For `N = 401` and `λ | 401` no prime of `O` lies under `λ`, so `V_λ` is not defined there, while `V^ℚ_λ` is: the projector's denominator `401^{399}` is a unit of the field `M_λ`. For `λ | 2`, also outside `O`, `V^ℚ_λ` is the coefficient extension of the eigenrealization of ModularityAndLanglandsExtensions §2.9 (`2 ∤ N`).
- `V_λ ≠ R^{N−2}π_*O_λ` for `N ≥ 5`: the full middle cohomology has rank `((N − 1)^N + (−1)^N(N − 1))/N`, which is `204` for `N = 5`, much larger than `n`.

### 2.4 Poincaré duality between conjugate eigensheaves

The cup product and the trace `H^{2N−4}(Y_t) ≅ O(2 − N)` restrict to perfect pairings `V_{χ,λ} × V_{χ⁻¹,λ} → O_λ(2 − N)` between the `χ`- and `χ⁻¹`-eigensheaves, and likewise with `O/𝔫` and Betti coefficients and with rational coefficients `M_λ` at every finite place `λ` of `M` (`V^ℚ_{χ,λ} × V^ℚ_{χ⁻¹,λ} → M_λ(2 − N)`). Since `N − 2` is odd the middle cup product is alternating: `⟨y, x⟩ = −⟨x, y⟩` after exchanging the factors. Hence (1) for the self-dual data the real forms of §2.5 carry perfect alternating pairings; (2) composing with complex conjugation `c` of the coefficients gives `c`-linear isomorphisms `V_{c(λ)} ≅ V_λ^∨(2 − N)` for Qian's data. (Barnet-Lamb–Geraghty–Harris–Taylor, §4 after Lemma 4.1, p. 28; Boxer–Calegari–Gee–Newton–Thorne, proof of Lemma 4.2.4, arXiv v3 pp. 41–42, where the printed twist `1 − N` must be `2 − N`, and after Definition 4.4.1, pp. 46–47.)

*Needs:* §§2.2, 2.3; EtaleCohomologyFoundations §F.6; EtaleDualityAndPerverseSheaves §§0.5–0.6, 4.3(c).

*Proof sketch.* Poincaré duality for the smooth proper fibres is a perfect pairing on `R^{N−2}π_*`, alternating in odd degree, and invariant under `H₀`. An invariant pairing pairs the `χ`-part with the `χ⁻¹`-part and kills `χ`-part × `χ′`-part for `χ′ ≠ χ⁻¹`; perfectness passes to the summands. Composing with the coefficient conjugation, which exchanges `χ` and `χ⁻¹ = c ∘ χ`, gives the `c`-linear self-duality. The integral perfectness uses torsion-freeness (EtaleDualityAndPerverseSheaves §4.3(c), and §2.2 for the Betti lattices), so no `Ext` correction appears.

**Checks.**

- For the Hesse pencil the pairing on `H¹` of an elliptic curve pairs the two `H`-eigenlines `(1, 1, 1)` and `(2, 2, 2)`; for `H₀`, which acts trivially on `H¹`, it is the alternating pairing on the trivial part.
- The twist is `2 − N`: the fibre dimension is `N − 2`, so the top cohomology `H^{2N−4}` is `O(2 − N)`, of weight `2(N − 2)`; the printed `1 − N` would put the values in weight `2N − 2`, which no pairing of two weight-`(N − 2)` sheaves can reach.
- For `χ` with `χ² ≠ 1` the `χ`-part pairs trivially with itself: the pairing is never a self-pairing of a non-self-dual eigenspace.

### 2.5 Real forms of the self-dual eigensheaves

For the self-dual datum (`n` even, `N > n + 1`) let `O⁺ = ℤ[1/(2N), ζ_N]⁺` and `e = (1/(2#H₀))(ς + 1) ∑_{ξ∈H₀}(χ(ξ) + χ(ξ)⁻¹)ξ` in `O⁺[H₀ ⋊ ⟨ς⟩]`. Define `V_λ = [e]_*R^{N−2}π_*O⁺_λ`, `V[𝔫] = [e]_*R^{N−2}π_*(O⁺/𝔫)` and `V_B = [e]_*R^{N−2}π̃_*O⁺` for primes `λ` and ideals `𝔫` of `O⁺`; for every finite place `λ` of `M⁺`, of any residue characteristic `l`, define the rational real form `V^ℚ_λ = [e]_*R^{N−2}π_*M⁺_λ`, a lisse `M⁺_λ`-sheaf on `T₀ × Spec ℤ[1/N, ζ_N][1/l]` (the denominator `2#H₀` is a unit of `M⁺_λ`), equal to `V_λ ⊗ M⁺_λ` for `λ ∤ 2N`. Over `ℚ(ζ_N)⁺`, `V_λ((N − 1 − n)/2)` with its alternating pairing is the paired self-dual Dwork sheaf of ModularityAndLanglandsExtensions §2.14; this section constructs its integral, torsion and Betti forms over `O⁺`, on which the residual monodromy and the level-structure torsors of Layer 5 are built. (Barnet-Lamb–Geraghty–Harris–Taylor, §4, the idempotent `e`, Lemma 4.1, the pairings and the Betti sheaf `V_B`, pp. 26–29; Qian, after Proposition 3.2, arXiv v1 p. 13.)

The construction has the following API.

- `e² = e` in `O⁺[H₀ ⋊ ⟨ς⟩]`, since `ς` normalises `H₀` and exchanges `χ` and `χ⁻¹`.
- `H₀`-equivariant projection gives `V_λ ⊗_{O⁺_λ} O_λ ≅ U_λ`, `V[𝔫] ⊗ O ≅ U[𝔫]` and `V_B ⊗ O ≅ U_B`, the `χ`-eigensheaves of §2.3.
- `V_λ` is locally free of rank `n` (§2.7), and `V[𝔫] ≅ ∏ V_λ/λ^{a_λ}`.
- `V_λ((N − 1 − n)/2)` carries a perfect alternating pairing with values in `O⁺_λ(1 − n)`, and likewise mod `𝔫`.
- For every finite place `λ` of `M⁺`, `V^ℚ_λ` is lisse of rank `n`, its extension of scalars to `M ⊗_{M⁺} M⁺_λ = ∏_{λ′ | λ} M_{λ′}` is the product of the `χ`-eigensheaves `U^ℚ_{λ′}` of §2.3, and `V^ℚ_λ((N − 1 − n)/2)` carries a perfect alternating pairing with values in `M⁺_λ(1 − n)`.

*Needs:* §§1.3–1.4, §§2.3–2.4; ModularityAndLanglandsExtensions §2.14 (the paired sheaf over `ℚ(ζ_N)⁺`).

**Checks.**

- For `n = 2` the real form `V_λ` has rank two over `O⁺_λ` with a perfect alternating pairing, so its geometric monodromy lies in `Sp₂ = SL₂`.
- Over `ℤ[1/N, ζ_N]⁺` the idempotent is not defined: its denominator is `2N^{N−2}`, so `V_B` lives over `ℤ[1/(2N), ζ_N]⁺`.
- The Hesse boundary `N = 3`, `n = 2` is excluded by `N > n + 1`.

### 2.6 Splitting of the Fermat fibre into eigenlines

Since `H` acts on `Y₀`, `V_{λ,0} = ⊕_{i∈ℤ/Nℤ} V_{λ,i}` and `V[𝔫]_0 = ⊕ V_i[𝔫]`, where `V_{λ,i}` is the part on which `H` acts by `χᵢ : ξ ↦ ∏_j ξ_j^{a_j+i}` (whose restriction to `H₀` is `χ`). `V_{λ,i}` is nonzero exactly when `i ∈ B(a)`, and then it is free of rank one over `O_λ` (resp. `O/𝔫`); the Betti summands are finite projective of rank one over `O`. The same splitting holds for the `χ`-part of `H^{N−2}_dR(Y₀/K)` for `K ⊇ ℚ(ζ_N)`. For the self-dual data it holds for the real forms of §2.5 only after extension of scalars from `O⁺` to `O` (from `O⁺_λ` to `O_λ`, from `O⁺/𝔫` to `O/𝔫O`): `V_{λ,0} ⊗_{O⁺_λ} O_λ = U_{λ,0} = ⊕ U_{i,λ}` with `(N + 1 − n)/2 ≤ i ≤ (N − 1 + n)/2`. Over `O⁺_λ` itself the element of `H` scaling the middle coordinate commutes with `ς` and acts on `V_{λ,0}` with characteristic polynomial `∏_{i∈B}(X − ζ_N^i) ∈ O⁺_λ[X]`, and `V_{λ,0}` is the direct sum, over the pairs `{i, −i} ⊂ B`, of rank-two summands whose extension to `O_λ` is `U_{i,λ} ⊕ U_{−i,λ}`; these blocks need not split further over `O⁺_λ`. For the quotient family rescaling coordinate `q`, the monodromy generator at `t′ = 0` acts on the `i`-th line by `ζ_N^{a_q+i}`, which is `ζ_N^i` when `a_q = 0`, as for Qian's last coordinate (`n > 2`) and the middle coordinate of the self-dual family. (Qian, §3, arXiv v1 pp. 12–13, and proof of Lemma 3.3(1), p. 13; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 4.1(1), p. 27.)

*Needs:* §§1.4, 2.1, 2.3.

*Proof sketch.* The characters of `H` restricting to `χ` on `H₀` are the `χᵢ`. The exponent vector of `χᵢ` is `(a_j + i)_j`, whose entries are all nonzero exactly when `i ∈ B(a)`; apply §2.1. The deck transformation scales the chosen coordinate `q`, acting on `χᵢ` by `ζ_N^{a_q+i}` up to the orientation of the peripheral loop.

**Checks.**

- For Qian's datum with `n = 3` the nonzero summands are `V_{λ,1}`, `V_{λ,2}`, `V_{λ,N−3}`.
- For a quotient coordinate `q` with `a_q ≠ 0` the eigenvalues are `ζ_N^{a_q+b}`, not `ζ_N^b`, and their product need not be one.
- For `i ∉ B(a)` some entry of `a + i` vanishes, so `V_{λ,i} = 0`; `i = 0` is such a residue for every zero-shaped datum.
- The real forms need the scalar extension: for the self-dual datum with `N = 5`, `n = 2` and `l = 3`, the order of `3` modulo `5` is `4`, so the residue field of `O` at `λ` is `𝔽₈₁` and that of `O⁺` is `𝔽₉`; `𝔽₉^×` has order `8`, prime to `5`, so the eigenvalues `ζ₅², ζ₅³` of the middle-coordinate element are not in `𝔽₉`, and the rank-two reduction of the real form has no eigenline over `𝔽₉`; over `𝔽₈₁` it splits into the lines `i = 2, 3`.

### 2.7 The Dwork eigensheaves have rank `n`

For every rank-`n` Dwork exponent datum, `V_λ` and `V[𝔫]` are lisse with free stalks of rank `n` over `O_λ` and `O/𝔫`; the Betti systems `V_B` and `V′_B` have finite projective stalks of constant rank `n` over `O`, free after scalar extension to `ℚ(ζ_N)`, completion at `λ` or reduction modulo `𝔫`. The same holds with `O⁺` for the self-dual real forms. For every finite place `λ` of `M` (of `M⁺` for the real forms), the rational sheaf `V^ℚ_λ` is lisse of rank `n`. No global `O`-basis is asserted. (Qian, Proposition 3.2, arXiv v1 p. 13; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 4.1(2), p. 28.)

*Needs:* §1.6, §§2.1, 2.2, 2.3, 2.5, 2.6; EtaleDualityAndPerverseSheaves §4.3(c), (e).

*Proof sketch.* The sheaves are locally constant with torsion-free stalks (EtaleDualityAndPerverseSheaves §4.3(c), (e); §2.2 for the Betti systems), and a direct summand of a locally constant sheaf of finite free modules is locally free. The rank is constant on the connected base and equals the rank at `t = 0`, which is `#B = n` by §2.6. For `V′_B` on `T′₀(ℂ)`, which does not contain `t = 0`, pull back along `t ↦ t^N`. A finite projective module over a local ring is free, and `O/𝔫` is a finite product of local rings. The rank of the lisse `V^ℚ_λ` is constant on the connected base and is read at `t = 0`, over a geometric point of `Spec ℤ[1/N, ζ_N][1/l]`, where `l` is invertible, so §2.1 with `ℓ = l` and coefficients in `M_λ ⊇ μ_N` and §2.6 give the `n` lines indexed by `B`.

**Checks.**

- For Qian's datum with `n = 3` the stalk `V_{λ,t}` is free of rank `3` over `O_λ` for every `t ∈ T₀`.
- For the Hesse pencil and the trivial `H₀`-character the datum is `a = (0, 0, 0)`, zero-shaped of rank `2` with `B = {1, 2}`, and the rank is `2`; this is the boundary case excluded from the self-dual family by `N > n + 1`.
- Over a Dedekind ring `O` with nontrivial class group, a rank-one projective summand need not be free; the statement asserts projectivity only.

### Examples

For `N = 5`, `n = 2` and the self-dual datum `a = (1, 0, 0, 0, 4)`, `B = {2, 3}`, the Fermat fibre contributes the lines with exponent vectors `a + 2 = (3, 2, 2, 2, 1)` and `a + 3 = (4, 3, 3, 3, 2)`, all entries nonzero; their Hodge degrees `∑⟨aᵢ⟩/5 − 1` are `10/5 − 1 = 1` and `15/5 − 1 = 2`, consecutive as §7.3 predicts for the self-dual range `(N − 1 − n)/2 = 1 ≤ j ≤ (N + n − 3)/2 = 2`.

### Dependencies

Layer 1; EtaleCohomologyFoundations §§F.0.2, F.2.1, F.3, F.4, F.6; ComplexComparisonPartII §§C5.2, C5.3, C6.5, C6.6; EtaleDualityAndPerverseSheaves §§0.5–0.6, 4.3(c), (e); InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3; ModularityAndLanglandsExtensions §§2.9, 2.14.

## Layer 3: Katz's hypergeometric description

Katz's hypergeometric sheaf attached to `n` distinct nontrivial Kummer characters is the multiplicative convolution of `n` rank-one sheaves on `𝔾_m`. It is lisse of rank `n` on `𝔾_m − {1}`, pure, geometrically irreducible, with unipotent monodromy at `0`, the given characters at `∞` and a pseudo-reflection at `1`. Katz's comparison theorem identifies a zero-shaped Dwork eigensheaf, pulled back along `t ↦ t^{−N}`, with this hypergeometric sheaf up to a character of the base. The comparison characters form a `λ`-independent family; twisting them away gives the systems `W` with determinant a pure Tate twist.

### 3.1 Katz's hypergeometric sheaves

Let `R₀ = ℤ[ζ_N, N⁻¹]`, `T₁ = Spec R₀[x, x⁻¹, (1 − x)⁻¹]` with open immersion `j : T₁ → 𝔾_{m,R₀}`, and `f : T₁ → 𝔾_m`, `x ↦ 1 − x`. Let `n ≥ 1` and `ρ₁, …, ρ_n : μ_N → M^×` distinct nontrivial characters; their product need not be trivial. For a place `λ` of `M` of residue characteristic `l`, let `Lᵢ` be the rank-one lisse `M_λ`-sheaf on `𝔾_{m,R₀}[1/l]` cut out of the direct image of `M_λ` under the finite étale `μ_N`-torsor `x ↦ x^N` by `ρᵢ`; over every field `k` over `R₀[1/l]` it is the Kummer sheaf `ℒ_{ρᵢ}` of FourierDeligneTransform §2.6, in that roadmap's convention (for `k = 𝔽_q`, geometric Frobenius at `x ∈ k^×` acts by `ρᵢ(x^{(q−1)/N})`, with `μ_N` identified with `k^×[N]`). Put `Fᵢ = j_!f*Lᵢ` and `E_λ = j*(F₁ ∗_! F₂ ∗_! ⋯ ∗_! F_n)[n − 1]`, where `A ∗_! B = Rm_!(A ⊠ B)` for the multiplication `m : 𝔾_m × 𝔾_m → 𝔾_m`. For a zero-shaped Dwork datum the characters are those indexed by `B(a)`, with this Kummer convention; their product is trivial because `∑_{b∈B(a)} b = 0` (§1.4). (Boxer–Calegari–Gee–Newton–Thorne, §4.1 before Theorem 4.2.1, arXiv v3 p. 41; Katz, *Another look at the Dwork family*, §5 and Theorem 5.3, pp. 95–97; Katz, *Exponential sums and differential equations*, Chapter 8; Drinfeld–Kedlaya, Appendix A, §A.1.6.)

The construction has the following API.

- Over every field `k` over `R₀[1/l]`, `Lᵢ` restricts to `ℒ_{ρᵢ}`, so FourierDeligneTransform §2.6 gives its tameness at `0` and `∞`, the tensor law (`Lᵢ ⊗ Lⱼ` is the sheaf attached to `ρᵢρⱼ`), and `j_!ℒ_{ρᵢ} ≅ Rj_*ℒ_{ρᵢ}` for `j : 𝔾_m → 𝔸¹` whenever `ρᵢ(ζ_N) − 1` is a unit of `O_{M_λ}`, which holds unless `l | N` and `ρᵢ` has order a power of `l`. In that remaining case the isomorphism still holds with `M_λ`-coefficients: the stalk of `Rj_*` at `0` is computed by the two-term complex `ρᵢ(ζ′) − 1 : M_λ → M_λ` for the image `ζ′` of a generator of tame inertia, which is acyclic since `ρᵢ(ζ′) ≠ 1`. This roadmap adds only the family over `R₀[1/l]` and its compatibility with base change to each `k`.
- `∗_!` is associative and commutative up to canonical isomorphism, through the associativity and symmetry of compact-support Künneth.
- The trace of geometric Frobenius at `x ∈ T₁(k)`, `k` a finite field with `q` elements over `R₀[1/l]`, is `(−1)^{n−1} ∑_{x₁⋯x_n = x} ∏ᵢ ρᵢ((1 − xᵢ)^{(q−1)/N})`, with `μ_N` identified with `k^×[N]` and `ρᵢ(0) = 0`.
- Formation of `E_λ` commutes with base change along `R₀[1/l] → k` for finite fields `k`.
- For `σ ∈ Gal(M/ℚ)`, `σ` carries `E_λ` for `(ρᵢ)` to `E_{σλ}` for `(σρᵢ)`.

*Needs:* §1.4; FourierDeligneTransform §§2.3, 2.6 (Kummer sheaves over a field, their trace convention, tameness, tensor laws and `j_! ≅ Rj_*`); EtaleCohomologyFoundations §§F.2.4–F.2.7 (constructible `Rf_!`, compact supports, Künneth) and §F.4.5 (rational realization); InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 (trace formula for the trace description).

**Checks.**

- For `n = 1`, `E_λ = j*F₁` is the Kummer sheaf `L_{ρ₁}(1 − x)` on `T₁`, of rank one, with trace `ρ₁((1 − x)^{(q−1)/N})` at `x ∈ T₁(𝔽_q)`.
- For `n = 2` the trace at `x` is `−∑_{x₁x₂ = x} ρ₁((1 − x₁)^{(q−1)/N}) ρ₂((1 − x₂)^{(q−1)/N})`, a Jacobi-type sum.
- For nontrivial `ρ` the extensions `j_!f*L_ρ` and `j_*f*L_ρ` agree at `x = 1`, the invariants being zero; for the trivial character they differ there, `j_!` having stalk zero and `j_*` stalk of rank one. This detects the omission of nontriviality.
- The Kummer convention is pinned by one value. For `q = 7`, `N = 3`, `μ₃(𝔽₇) = {1, 2, 4}` and `ρ(2) = ω`: at `x = 3`, `3^{(7−1)/3} = 9 ≡ 2`, so geometric Frobenius acts on `ℒ_ρ` at `x = 3` by `ω`; pushing the torsor out along `ρ` instead of `ρ⁻¹` would give `ω²`, and every trace in the formula above would be replaced by its image under complex conjugation of `M`.

### 3.2 Rank, purity, irreducibility and determinant of the hypergeometric sheaf

In the setting of §3.1: (1) `E_λ` is a lisse `M_λ`-sheaf of rank `n` on `T₁[1/l]`, `E_λ ⊗ M̄_λ` is geometrically irreducible, and `E_λ` is pure of weight `n − 1`; (2) if moreover `∏ ρᵢ = 1`, then `det E_λ ≅ M_λ(n(1 − n)/2)`. (Boxer–Calegari–Gee–Newton–Thorne, Theorem 4.2.1(1)–(2) and proof, arXiv v3 p. 41, citing Katz, *Exponential sums and differential equations*, Chapter 8 and Theorem 8.12.2(1a); Katz, *Another look at the Dwork family*, §5, p. 95.)

*Needs:* §3.1; DeligneWeightsAndPurity §§7.15, 8.19; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3; EtaleCohomologyFoundations §F.4.5.

*Proof sketch.* Lisseness of rank `n`, geometric irreducibility and purity are Katz's theorems on hypergeometric sheaves of type `(n, n)` whose two lists of characters (here `n` copies of the trivial character and `ρ₁, …, ρ_n`) are disjoint, proved by induction on `n` through the convolution with Fourier-type cohomological estimates. The determinant is Katz's formula, a Tate twist when the product of the characters is trivial. The trace formula of §3.1 follows from the trace formula for `Rm_!`.

**Checks.**

- For `n = 1` and nontrivial `ρ₁`, `E_λ` is the Kummer sheaf of rank one, pure of weight `0`; this is outside the product-one hypothesis of (2), and its determinant `L_{ρ₁}(1 − x)` is not a Tate twist.
- For `n = 2` and `(ρ, ρ⁻¹)` with `ρ ≠ ρ⁻¹`, `det E_λ = M_λ(−1)`: the geometric determinant is trivial and geometric Frobenius at `x ∈ T₁(𝔽_q)` has determinant `q`.
- Purity of weight `n − 1` is consistent with the determinant: `n` Frobenius eigenvalues of absolute value `q^{(n−1)/2}` multiply to absolute value `q^{n(n−1)/2}`, the absolute value of `M_λ(n(1 − n)/2)` at Frobenius.

### 3.3 Local monodromy of the hypergeometric sheaf

In the setting of §3.1 the geometric local monodromy of `E_λ ⊗ M̄_λ` is: at `x = 0`, unipotent with a single Jordan block of size `n`; at `x = ∞`, tame and isomorphic to `⊕_{i=1}^n L_{ρᵢ}`; at `x = 1`, a pseudo-reflection. (Barnet-Lamb–Geraghty–Harris–Taylor, proof of Lemma 4.3(3), p. 31, citing Katz, *Another look at the Dwork family*, Theorem 5.3, together with Katz, *Exponential sums and differential equations*, Theorem 8.4.11; Katz, *Another look at the Dwork family*, Lemma 8.8, p. 114.)

*Needs:* §3.2; LefschetzPencilsAndVanishingCycles §1.6.

*Proof sketch.* Katz's description of the local monodromy of a hypergeometric sheaf of type `(n, n)`: at `0` and at `∞` it is the sum, over the distinct characters of the corresponding list, of the Kummer sheaf tensored with a unipotent block whose size is the multiplicity; at `1` it is a pseudo-reflection. Here each `Fᵢ` is lisse at `0` with trivial local monodromy, so the list at `0` is `n` copies of the trivial character, and the list at `∞` is `ρ₁, …, ρ_n`.

**Checks.**

- For `n = 1`, `L_{ρ₁}(1 − x)` is unramified at `0`, has monodromy `ρ₁` at `∞`, and at `1` acts by a nontrivial character, a pseudo-reflection of a line.
- For `n = 2` the monodromy at `0` is conjugate to `[[1, 1], [0, 1]]`, not to the identity.
- At `∞` the eigenvalues are the distinct `ρᵢ(ζ)`, so the local monodromy there is semisimple, unlike at `0`.

### 3.4 Katz's comparison of Dwork eigensheaves with hypergeometric sheaves

Let `a` be a zero-shaped Dwork datum with characters `ρᵢ` indexed by `B(a)` as in §3.1, `U = T₀ − {0}` with inclusion `j′ : U → T₀`, and `g : U → T₁`, `t ↦ t^{−N}`. For every finite place `λ` of `M`, of any residue characteristic `l` (`l = 2` and `l | N` included), there are a unique continuous character `Ψ_λ : π₁(Spec R₀[1/l]) → O_{M_λ}^×` and an isomorphism of `M_λ`-sheaves on `U[1/l]`: `(j′)*V^ℚ_λ ≅ g*E_λ ⊗ M_λ(Ψ_λ)`, with `V^ℚ_λ` the rational eigensheaf of §2.3. Consequently the rational `χ`-eigensheaf `V′` of the quotient family over `T′₀` (§1.6), whose pullback along `t ↦ t^N` is `(j′)*V^ℚ_λ`, is isomorphic to the pullback of `E_λ` along `t′ ↦ 1/t′`, twisted by `Ψ_λ` and by a Kummer character `L_θ` of order dividing `N`. `U` is the punctured Dwork parameter line, not the quotient line `T′₀`. (Boxer–Calegari–Gee–Newton–Thorne, Theorem 4.2.1(3) and proof, arXiv v3 p. 41; Katz, *Another look at the Dwork family*, Theorem 5.3 and Remark 5.4, pp. 96–97.)

*Needs:* §1.6, §§2.3, 2.7, §3.2; Mathlib `FundamentalGroup`; EtaleCohomologyFoundations §F.0.2.

*Proof sketch.* Katz's theorem: on the complement of `μ_d` in the affine line the primitive eigenpiece of a Dwork-type family is the `d`-th power pullback of a hypergeometric sheaf tensored with a character of `π₁` of the base, provided the eigenpiece is nonzero; Boxer–Calegari–Gee–Newton–Thorne specialise it to the present family using `[−1]*H(trivial^n; ρ) ≅ H(ρ⁻¹; trivial^n)`. The zero-shaped hypothesis (zero `n + 1` times, every nonzero residue at most once) is what makes the list at `0` consist of `n` trivial characters and the list at `∞` of `n` distinct ones. Uniqueness of `Ψ_λ` is geometric irreducibility (§3.2) with Schur's lemma; two lisse sheaves on `T′₀` with isomorphic geometrically irreducible pullbacks along the `μ_N`-cover `t ↦ t^N` differ by a character of `μ_N`.

**Checks.**

- Both sides have rank `n`: the rank of `V^ℚ_λ` (§2.7) and of `E_λ` (§3.2).
- For a rank-two datum that is not zero-shaped, such as `a = (1, 2, 2, 0, 0)` for `N = 5`, zero occurs only twice and the monodromy at infinity is not a single block (§8.1), so the comparison with a sheaf having `n` trivial characters at `0` fails.
- The base of `Ψ_λ` is `Spec R₀[1/l]`: `Ψ_λ` is geometrically trivial, so `V^ℚ_λ` and `g*E_λ` have the same geometric monodromy on `U`.

### 3.5 The comparison characters

For a zero-shaped datum (whose characters satisfy `∏ ρᵢ = 1`, since `∑B(a) = 0` by §1.4) the characters `Ψ_λ` of §3.4 satisfy: (1) `Ψ_λ · c(Ψ_λ) = ε_l^{n+1−N}`, where `c` is complex conjugation on the coefficients, transported to `λ` and `c(λ)`; (2) on `U[1/l]`, `det((j′)*V^ℚ_λ) ≅ M_λ(n(1 − n)/2) ⊗ M_λ(Ψ_λ^n)`; both hold at every finite place `λ` of `M`. Their values at Frobenius elements are in `M` and independent of `λ` (§6.8), and they are the `λ`-adic characters of one algebraic Hecke character (§7.5). (Boxer–Calegari–Gee–Newton–Thorne, Lemma 4.2.4 and proof, arXiv v3 pp. 41–42, where the duality twist must be `2 − N` and the weight relation correspondingly `ε^{n+1−N}` rather than the printed `|·|^{N−n}`.)

*Needs:* §§1.4, 2.4, 3.2, 3.4.

*Proof sketch.* (1) The `c`-linear isomorphisms `V^ℚ_{c(λ)} ≅ (V^ℚ_λ)^∨(2 − N)` (§2.4) and `E_{c(λ)} ≅ E_λ^∨(1 − n)` (Poincaré duality for the convolution, Katz) together with Schur's lemma for the geometrically irreducible `E_λ` give `c(Ψ_λ)ε^{1−n} = Ψ_λ⁻¹ε^{2−N}`. (2) Take determinants in §3.4 and use §3.2(2); `det g*E_λ` is the constant twist `M_λ(n(1 − n)/2)`.

**Checks.**

- Weight check: `V_λ` has weight `N − 2` and `E_λ` weight `n − 1`, so `Ψ_λ` has weight `(N − 2) − (n − 1) = N − n − 1`, and `Ψ_λ c(Ψ_λ)` has weight `2(N − n − 1)`, the weight of `ε^{n+1−N}`.
- With the misprinted twist `1 − N` the same computation gives `Ψ c(Ψ) = ε^{n−N}`, of weight `2(N − n)`, contradicting the weight `2(N − n − 1)` of `Ψ_λ c(Ψ_λ)`.
- For the self-dual datum with `n = 2`, `N = 5` the weight of `Ψ_λ` is `5 − 2 − 1 = 2`, and (2) says `det V_λ` has weight `2·3 = 6 = n(N − 2)` on `U`.

### 3.6 The twisted Dwork local systems `W_λ`

For Qian's datum (`n > 2`) and every finite place `λ` of `M`, of residue characteristic `l`, put `W^ℚ_λ = V^ℚ_λ ⊗_{M_λ} M_λ(Ψ_λ⁻¹)`, a lisse `M_λ`-sheaf of rank `n` on `T₀[1/l]`. For `λ ∤ 2N` put `W_λ = V_λ ⊗_{O_{M_λ}} O_{M_λ}(Ψ_λ⁻¹)`, a lisse sheaf of free `O_{M_λ}`-modules of rank `n` on `T₀[1/l]` with `W_λ ⊗ M_λ = W^ℚ_λ`. Write `W_{t,λ}` and `W^ℚ_{t,λ}` for the stalks at `t`, `W̄_λ = W_λ ⊗ k(λ)` and `W̄_{t,λ}` likewise. (Boxer–Calegari–Gee–Newton–Thorne, after Lemma 4.2.4, arXiv v3 p. 42.)

The construction has the following API.

- For every finite place `λ` of `M`, `W^ℚ_λ` is pure of weight `n − 1`, with `det W^ℚ_λ ≅ M_λ(n(1 − n)/2)`.
- `W^ℚ_λ ⊗ M̄_λ` is geometrically irreducible on `T₀`.
- `W_λ` and `V_λ` have the same geometric monodromy: their restrictions to `π₁(T_{0,ℚ̄})` agree, also after reduction.
- `W̄_λ = W_λ ⊗ k(λ)` is a lisse `k(λ)`-sheaf of rank `n`.

*Needs:* §§2.3, 2.7, 3.3, 3.4, 3.5; DeligneWeightsAndPurity §8.19.

*Proof sketch.* Twisting by the character `Ψ_λ⁻¹` of `π₁(Spec R₀[1/l])` changes neither lissity nor geometric monodromy. On `U`, `W^ℚ_λ ≅ g*E_λ`, so purity and the determinant come from §3.2. For geometric irreducibility after the finite cyclic pullback `g`, use semisimplicity of the pure sheaf (DeligneWeightsAndPurity §8.19) and Clifford theory: the isotypic pieces of the restriction to a normal subgroup of finite index are permuted transitively, while a power of the single unipotent block at `x = 0` (§3.3) is again a single block in characteristic zero, which forces one isotypic piece of multiplicity one. Since `U` is dense open in the smooth connected `T₀`, `π₁(U) → π₁(T₀)` is surjective.

**Checks.**

- `det W_λ ≅ M_λ(n(1 − n)/2)`, so the Hodge–Tate weights of every fibre sum to `n(n − 1)/2` (§7.6); for `n = 3` the sum is `3`.
- `W_λ` has rank `n`, the rank of `V_λ`.
- `W_λ ≇ V_λ` in general: their fibres have Hodge–Tate weights `{0, …, n − 1}` and `{M_τ, …, M_τ + n − 1}`, with `M_τ ≠ 0` for some `τ` when `N > n + 1` (§7.4).
- Irreducibility does not follow merely from pulling back an irreducible sheaf along a finite cyclic cover: a rank-two lisse sheaf in characteristic zero whose monodromy is the two-dimensional irreducible representation of `S₃`, pulled back along the connected double cover corresponding to `A₃ ⊂ S₃`, restricts to `A₃ ≅ ℤ/3` as the sum of the two characters with eigenvalues `ζ₃` and `ζ₃⁻¹`; the dimensions of the irreducible constituents change from `[2]` to `[1, 1]`.

### Examples

For `n = 2` and characters `(ρ, ρ⁻¹)` of order `5`, `E_λ` is a rank-two sheaf on `ℙ¹ − {0, 1, ∞}` with unipotent monodromy `[[1, 1], [0, 1]]` at `0`, eigenvalues `ρ(ζ), ρ(ζ)⁻¹` at `∞`, a pseudo-reflection at `1` (§3.3), and determinant `M_λ(−1)` (§3.2). Its monodromy group is the hypergeometric group of Layer 0 with `p = (X − 1)²` and `q = (X − ρ(ζ))(X − ρ(ζ)⁻¹)`.

### Dependencies

Layers 1–2; FourierDeligneTransform §§2.3, 2.6; EtaleCohomologyFoundations §§F.0.2, F.2.4–F.2.7, F.4.5; DeligneWeightsAndPurity §§7.15, 8.19; LefschetzPencilsAndVanishingCycles §1.6; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3.

## Layer 4: Complex monodromy

On the thrice-punctured line the Dwork Betti local system of Qian's datum (`n > 2`) or of the self-dual datum has monodromy `ρ_{t′}(γ₀)` with the distinct eigenvalues `ζ_N^b`, `b ∈ B`, a transvection `ρ_{t′}(γ₁)`, and a single unipotent Jordan block `ρ_{t′}(γ∞)`. Levelt's theorem then identifies the representation with the companion-matrix representation, and its reductions remain absolutely irreducible.

### 4.1 The Dwork monodromy representations and peripheral loops

Fix `τ : ℚ(ζ_N) ↪ ℂ` with `τ(ζ_N) = e^{2πi/N}`, a base point `t ∈ T₀(ℂ) − {0}` and `t′ = t^N ∈ T′₀(ℂ)`. Let `ρ_t : π₁(T₀(ℂ), t) → GL(V_{B,t})` and `ρ_{t′} : π₁(T′₀(ℂ), t′) → GL(V′_{B,t′})` be the monodromy representations, with `V′_{B,t′} = V_{B,t}`. Choose loops `γ₀, γ₁, γ∞` around `0, 1, ∞` with `γ₀γ₁γ∞ = 1`, any two of which generate `π₁(T′₀(ℂ), t′)` freely, oriented so that the image of `γ₀` in the deck group of `T₀(ℂ) − {0} → T′₀(ℂ)` is `e^{2πi/N} = τ(ζ_N)`. On the index-`N` normal subgroup `π₁(T₀(ℂ) − {0}, t)`, `ρ_{t′}` restricts to `ρ_t` composed with the surjection `π₁(T₀(ℂ) − {0}, t) ↠ π₁(T₀(ℂ), t)`. For a prime `λ` of `O` (of `O⁺` for the real forms) write `ρ̄_t`, `ρ̄_{t′}` for the reductions on `V_{B,t}/λ`. For the self-dual data the same is done with the family `Ỹ` over `T̃₀ = T′₀`. (Qian, §3, base points, loops and representations, arXiv v1 p. 13; Barnet-Lamb–Geraghty–Harris–Taylor, §4, p. 30.)

The construction has the following API.

- `ρ_t` and `ρ_{t′}` are group homomorphisms into `GL(V_{B,t})`, determined by the local systems `V_B`, `V′_B` of §2.3.
- `ρ_{t′}` restricted to `π₁(T₀(ℂ) − {0}, t)` is `ρ_t` composed with the inclusion-induced surjection.
- Changing the base point conjugates the representations by parallel transport.
- In terms of BelyiMaps' peripheral elements, `γ₀ = periph0`, `γ₁ = periph0⁻¹ · periph1 · periph0` and `γ∞ = periphInf`.
- Reduction modulo `λ` is compatible with restriction to the index-`N` subgroup.

*Needs:* §1.6, §§2.3, 2.7; BelyiMaps §§5.2, 5.6; Mathlib `FundamentalGroup`; ComplexComparisonPartII §C5.2.

**Checks.**

- `γ₀γ₁γ∞ = 1`, and `γ₀, γ₁` generate `π₁(T′₀(ℂ), t′)` freely; all three do not.
- `π₁(T₀(ℂ) − {0}, t)` is the kernel of `γ₀ ↦ 1`, `γ₁ ↦ 0` in `ℤ/N`, of index `N`.
- Substituting `γ₀ = p₀` and `γ₁ = p₀⁻¹p₁p₀` into `γ₀γ₁γ∞` gives `p₁p₀p∞ = 1`, the BelyiMaps relation; the unchanged triple `p₀, p₁, p∞` satisfies `p₁p₀p∞ = 1`, not `p₀p₁p∞ = 1`.
- With the opposite orientation of `γ₀` the eigenvalues of `ρ_{t′}(γ₀)` become `ζ_N^{−b}`; since `−B ≠ B` for Qian's data the orientation is not cosmetic.
- `ρ_{t′}(γ₀)^N` lies in the image of `ρ_t`, being the monodromy of `V_B` around `t = 0`, where `V_B` is lisse; hence it is trivial.

### 4.2 Monodromy at zero

For Qian's data (`a_N = 0`) `ρ_{t′}(γ₀)` has characteristic polynomial `∏_{b∈B}(X − ζ_N^b)`, with distinct roots; in particular `det ρ_{t′}(γ₀) = ζ_N^{∑B} = 1`. For the self-dual data, with the middle-coordinate quotient, `ρ(γ₀)` has characteristic polynomial `∏_{j=(N−n+1)/2}^{(N+n−1)/2}(X − ζ_N^j)`. (Qian, Lemma 3.3(1), arXiv v1 p. 13; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 4.3(1) and proof, pp. 30–31.)

*Needs:* §1.4, §2.6, §4.1.

*Proof sketch.* `γ₀` acts on `V′_{B,t′}` as the deck transformation acts on the fibre of `V_B` at `0`, transported inside `T₀(ℂ)`; on the eigenline `V_{B,i}` (`i ∈ B`) this is `ζ_N^i` because the quotient coordinate has exponent zero (§2.6).

**Checks.**

- `n = 3`, `N = 401`: the eigenvalues are `ζ, ζ², ζ^{398}`, with product `ζ^{401} = 1`.
- For a quotient coordinate `q` with `a_q ≠ 0` the eigenvalues are `ζ_N^{a_q+b}` and the determinant is `ζ_N^{n a_q}`, not one.
- `0 ∉ B`, so `1` is not an eigenvalue of `ρ_{t′}(γ₀)`.

### 4.3 Monodromy at one: Picard–Lefschetz

The fibre `Y₁` has `N^{N−2}` ordinary double points forming one free `H₀`-orbit; let `Δ` be the vanishing cycles, one for each singular point, permuted by `H₀` up to sign. The monodromy `T` around `t = 1` on `H^{N−2}(Y_t(ℂ), ℤ)` is `x ↦ x + ε ∑_{δ∈Δ}⟨x, δ⟩δ` with `ε = ±1` depending on `N`. Since `N − 2` is odd the cup product is alternating and vanishing cycles at distinct points are orthogonal, so `(T − 1)² = 0`; on the `χ`-part `T − 1` has image in the line spanned by `∑_{ξ∈H₀} χ(ξ)⁻¹ ξδ₀`. Hence `ρ_{t′}(γ₁)` is unipotent with `(ρ_{t′}(γ₁) − 1)² = 0` and `rank(ρ_{t′}(γ₁) − 1) ≤ 1`; exact rank one is §4.5. For the self-dual data the characteristic polynomial is `(X − 1)^n` and `dim ker(ρ(γ₁) − 1) ≥ n − 1`. (Qian, Lemma 3.3(3), arXiv v1 pp. 13–14; Barnet-Lamb–Geraghty–Harris–Taylor, proof of Lemma 4.3(2), p. 31.)

*Needs:* §§1.2, 4.1, 2.4, §0.1; LefschetzPencilsAndVanishingCycles §§2.7, 2.8, 0.8a; ComplexComparisonPartII §C6.5.

*Proof sketch.* Locate the singular points of `Y₁` (§1.2). Near `t = 1` the map `t ↦ t^N` is étale, so `ρ_{t′}(γ₁)` is conjugate to `T`. The vanishing cycle complex of the family over a disc around `1` is supported at the finitely many quadratic points, and LefschetzPencilsAndVanishingCycles §2.7 computes it at each; the specialization sequence of §2.8, summed over the points, gives the formula, and §0.8a compares it with the Betti monodromy. `H₀` commutes with the monodromy and permutes `Δ` up to sign, so on the `χ`-part the variation factors through `x ↦ ⟨x, δ₀⟩`. Odd fibre dimension makes `⟨δ, δ′⟩ = 0` for all vanishing cycles, which gives `(T − 1)² = 0` on all of `H^{N−2}` without using a self-dual eigenspace.

**Checks.**

- For the Hesse pencil (`N = 3`) the monodromy around `t = 1` on `H¹` of the elliptic fibre is a transvection, with three vanishing cycles permuted by `μ₃`.
- For a non-self-dual `χ` the `χ`-part pairs with the `χ⁻¹`-part, not with itself, so the symplectic argument for a single eigenspace does not apply; the full odd-degree formula does.
- If `g = 1 + v ⊗ f` has determinant one then `f(v) = 0` and `(g − 1)² = 0`, matching the unipotence obtained here.

### 4.4 Monodromy at infinity is unipotent

For Qian's data and for the self-dual data `ρ_{t′}(γ∞)` is unipotent with characteristic polynomial `(X − 1)^n`, and so is the local monodromy of `ρ_t` around `t = ∞`, which is conjugate to `ρ_{t′}(γ∞)^{±N}`. (Qian, Lemma 3.3(2), arXiv v1 pp. 13–14, whose printed argument through a semistable model gives unipotence only of the `N`-th power; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 4.3(3) and proof, p. 31; Boxer–Calegari–Gee–Newton–Thorne, Theorem 4.2.1(3), arXiv v3 p. 41.)

*Needs:* §§3.3, 3.4, 4.1, 4.2, 4.3; ComplexComparisonPartII §C6.6; LefschetzPencilsAndVanishingCycles §1.1.

*Proof sketch.* By §3.4, `V′ ≅ (pullback of E_λ along t′ ↦ 1/t′) ⊗ Ψ_λ ⊗ L_θ` with `Ψ_λ` geometrically trivial and `L_θ` of order dividing `N`. The point `t′ = ∞` corresponds to `x = 0`, where `E_λ` has a single unipotent block (§3.3). After the Betti–étale comparison, `ρ_{t′}(γ∞) = c·u` with `u` unipotent and `c` a scalar with `c^N = 1`. By §4.2 and the unipotence part of §4.3, which does not use this target, `det ρ_{t′}(γ∞) = 1`, so `c^n = 1`; `gcd(n, N) = 1` gives `c = 1`.

**Checks.**

- For the self-dual datum with `n = 2`, `ρ(γ∞)` has characteristic polynomial `(X − 1)²` and determinant `1`.
- A nontrivial scalar `N`-th root of unity has unipotent `N`-th power but is not unipotent: unipotence of the `N`-th power alone does not give the statement.
- The hypothesis `gcd(n, N) = 1` is used: for `n = N = 3` a scalar cube root of unity has determinant one.

### 4.5 The companion-matrix model of the Dwork monodromy

For Qian's datum (`n > 2`), `ρ_{t′}(γ₁) − 1` has rank exactly one, so `ρ_{t′}(γ₁)` is a transvection. Let `A` and `B` be the companion matrices of `(X − 1)^n` and `∏_{b∈B}(X − ζ_N^{−b})` in `GL_n(ℤ[ζ_N])` and `ρ : π₁(T′₀(ℂ), t′) → GL_n(ℤ[ζ_N])` the representation `γ₀ ↦ B⁻¹`, `γ∞ ↦ A`, `γ₁ ↦ BA⁻¹`. Then `ρ_{t′} ⊗ ℂ`, with coefficients extended along `τ`, is equivalent to `ρ ⊗ ℂ`, and `ρ(γ₁) − 1` has nonzero entries only in its first column. The same holds for the self-dual data with `B` the companion matrix of `∏_{j=(N−n+1)/2}^{(N+n−1)/2}(X − ζ_N^j)`, and then `ρ` is irreducible. (Qian, Lemma 3.4 and proof, arXiv v1 p. 14; Barnet-Lamb–Geraghty–Harris–Taylor, Corollary 4.4, p. 32.)

*Needs:* §§0.2, 0.3, 4.2, 4.3, 4.4; ClassicalArithmeticCompletion §2.46.

*Proof sketch.* If `ρ_{t′}(γ₁) = 1` then `ρ_{t′}(γ₀) = ρ_{t′}(γ∞)⁻¹` would have eigenvalue `1`, contrary to §4.2 and §4.4; with §4.3 the rank is one. `ρ_{t′}(γ∞)` has characteristic polynomial `(X − 1)^n` and `ρ_{t′}(γ₀)⁻¹` has `∏(X − ζ_N^{−b})`, coprime since `0 ∉ B`; Levelt's theorem (§0.3) conjugates `(ρ_{t′}(γ₀), ρ_{t′}(γ∞))` to `(B⁻¹, A)`, and §0.2 gives the first-column shape.

**Checks.**

- `n = 3`: `A = C((X − 1)³)` has columns `e₂, e₃, (1, −3, 3)ᵀ`.
- `n = 2`: `A = [[0, −1], [1, 2]]`, `det A = 1`, trace `2`.
- `BA⁻¹ − 1 ≠ 0` because `(X − 1)^n ≠ ∏(X − ζ_N^{−b})`.

### 4.6 Maximally unipotent monodromy at infinity

For Qian's datum (`n > 2`), `ρ_{t′}(γ∞)` has minimal polynomial `(X − 1)^n`: it is a single unipotent Jordan block. Hence the local monodromy of `ρ_t` around `t = ∞`, conjugate to `ρ_{t′}(γ∞)^{±N}`, is a single unipotent block over `ℂ` and over `ℚ̄_l`. The same holds for the self-dual family and, by coefficient conjugation, for every Galois conjugate `σχ` of the character. (Qian, Corollary 3.5, arXiv v1 p. 14; Barnet-Lamb–Geraghty–Harris–Taylor, Corollary 4.5 and Proposition 4.2(2), pp. 28–32.)

*Needs:* §§0.2, 2.3, 3.3, 4.5; LefschetzPencilsAndVanishingCycles §1.6.

*Proof sketch.* By §4.5, `ρ_{t′}(γ∞)` is conjugate to `A = C((X − 1)^n)`, whose minimal polynomial is `(X − 1)^n` (ClassicalArithmeticCompletion §2.46); this also follows from §3.3. If `u = 1 + ν` with `ν` nilpotent of order `n`, then `u^m − 1 = mν(1 + ⋯)` has the same order when `m` is invertible. Coefficient automorphisms carry the `χ`-eigensheaf to the `σχ`-eigensheaf compatibly with monodromy (§2.3).

**Checks.**

- `n = 2`: `ρ(γ∞) = [[0, −1], [1, 2]]` is conjugate to `[[1, 1], [0, 1]]`.
- In characteristic `p` the `p`-th power of `[[1, 1], [0, 1]]` is the identity, so the statement about the `N`-th power is a characteristic-zero statement.
- In the boundary case `N = n + 1 = 5`, excluded here, the `H₀`-invariant part of the Dwork quintic family has a single unipotent block of size four at `t = ∞`, the classical large complex structure point.

### 4.7 Absolute irreducibility of the residual monodromy

Let the datum be Qian's (`n > 2`) or the self-dual datum, and `λ` a prime of `O` (of `O⁺` for the self-dual data) of odd residue characteristic `l ∤ N`. The reduction `ρ̄_{t′} : π₁(T′₀(ℂ), t′) → GL(V′_{B,t′}/λ)` is absolutely irreducible and isomorphic to the reduction `ρ̄` of the companion representation; `ρ̄_{t′}(γ₁)` is a transvection, `ρ̄_{t′}(γ∞)` is unipotent and `ρ̄_{t′}(γ₀)` has the `n` distinct eigenvalues `ζ_N^b mod λ`, `b ∈ B`. (Qian, the paragraph preceding Lemma 3.6, arXiv v1 p. 15; Barnet-Lamb–Geraghty–Harris–Taylor, proof of Lemma 4.6, pp. 32–33.)

*Needs:* §§0.3, 0.4, 4.2–4.5.

*Proof sketch.* Reduce the characteristic polynomials of §4.2 and §4.4 modulo `λ`; since `λ ∤ N`, `ζ_N^b ≢ 1 (mod λ)` for `b ∈ B`, so they stay coprime. `ρ̄_{t′}(γ₁) − 1` has rank at most one, and exactly one since otherwise `ρ̄(γ₀) = ρ̄(γ∞)⁻¹` would have eigenvalue `1`. §0.4 gives absolute irreducibility, and Levelt's theorem (§0.3) over the residue field conjugates the reduced triple to the reduced companion triple; no comparison of integral lattices is needed.

**Checks.**

- For `n = 3`, `l = 3`, `N = 401` the reduction modulo a prime above `3` has no invariant line or plane.
- The hypothesis `l ∤ N` is necessary. At a prime of `ℤ[ζ_N]` above `l | N` (such primes are inverted in `O`), reduction kills exactly the `l`-primary part of the order of `ζ_N`: for `N = 9`, `l = 3`, `Φ₉ ≡ (X − 1)⁶ (mod 3)`, every `N`-th root of unity reduces to `1`, and both characteristic polynomials reduce to `(X − 1)^n`; for `N = 15`, `l = 3`, `Φ₁₅ ≡ Φ₅² (mod 3)` and `ζ₁₅` reduces to an element of order `5`, not `1`.
- Over `𝔽₃` the reduction of `C((X − 1)³)` is still a single block, of order `3`, since `A³ − 1 = (A − 1)³ = 0` in characteristic three; only its unipotence is used.

### Examples

For the self-dual datum with `n = 2` and `N = 5`, `B = {2, 3}`, the companion model is `γ∞ ↦ [[0, −1], [1, 2]]`, `γ₀ ↦ C((X − ζ⁻²)(X − ζ⁻³))⁻¹` whose characteristic polynomial is `X² − (ζ² + ζ³)X + 1`, and `γ₁ ↦ C(q)C(p)⁻¹`, a transvection; both companion matrices have determinant one and coefficients in `ℤ[ζ₅ + ζ₅⁻¹]`, so the representation takes values in `SL₂(ℤ[ζ₅ + ζ₅⁻¹])`, consistent with the real form of §2.5.

### Dependencies

Layers 0–3; BelyiMaps §§5.2, 5.6; LefschetzPencilsAndVanishingCycles §§0.8a, 1.1, 1.6, 2.7, 2.8; ComplexComparisonPartII §§C5.2, C6.5, C6.6; ClassicalArithmeticCompletion §2.46.

## Layer 5: Residual monodromy and level-structure torsors

By §4.7 the residual monodromy of a Dwork system on the thrice-punctured line is generated by a hypergeometric pair over the residue field. The first four targets identify the groups generated by such pairs, as statements about finite matrix groups; the next ones transport them to the geometric monodromy on `T₀`, construct the skew-Hermitian structure in the unitary case, show that the determinant descends to the base field, and build the moduli of level structures whose geometric irreducibility feeds Moret-Bailly's theorem in Layer 9.

### 5.1 Qian's residual hypergeometric group is `SL_n`

Let `k` be a finite field of odd characteristic `l` generated by a primitive `N`-th root of unity `ζ`, with `N` odd, `n > 2` and `N > 100n + 100`, and suppose `−1` is not a power of `l` modulo `N`. Let `h₀, h∞ ∈ GL_n(k)` with `h∞` of characteristic polynomial `(X − 1)^n`, `h₀` of characteristic polynomial `∏_{b∈B}(X − ζ^b)` for `B = qianIndexSet N n`, and `rank(h₀⁻¹h∞⁻¹ − 1) ≤ 1`. Then `⟨h₀, h∞⟩ = SL_n(k)`. Prove it as `qian_hypergeometric_group_eq_SL`. (Qian, Lemma 3.6 and proof, arXiv v1 pp. 15–16, published Lemma 3.7.)

*Needs:* §§0.1, 0.4, 0.9, 0.11, §§1.4–1.5.

*Proof sketch.* Put `h₁ = h₀⁻¹h∞⁻¹`. Its determinant is `ζ^{−∑B} = 1`, and it is not the identity since `h₀⁻¹` has no eigenvalue `1` (`0 ∉ B`); so it is a transvection (§0.1). `h∞` and `h₀⁻¹` have no common eigenvalue, so `G = ⟨h₀, h∞⟩` is absolutely irreducible (§0.4). The normal closure `Δ` of `h₁` in `G` has `G/Δ` cyclic, generated by the image of `h∞`, an element of `l`-power order, which equals the image of `h₀⁻¹`, of order dividing `N`; so `G = Δ` is generated by transvections. By §0.11, `G` is conjugate to `SL_n(k′)`, `Sp_n(k′)` or `SU(n, k′)` for a subfield `k′ ⊆ k`. A proper subfield would make the eigenvalue set of `h₀` stable under `x ↦ x^{#k′}`, i.e. `l^j B = B` with `l^j ≢ 1`, excluded by §1.5; `Sp_n` would force `B = −B`; `SU(n, k)` would force `l^{r/2}B = −B` for `r = [k : 𝔽_l]`, hence `l^{r/2} ≡ −1` by §1.5. Since `SL_n(k)` is normal in `GL_n(k)`, `G = SL_n(k)`.

**Checks.**

- If `l ≡ 1 (mod N)` then `k = 𝔽_l` and the group is `SL_n(𝔽_l)`; this is the case of the auxiliary prime `l′` in §9.1.
- For `N = 401`, `n = 3`, `l = 5` (order `25`, odd) the hypotheses hold and the group is `SL₃(𝔽_{5^{25}})`; for `l = 3` (order `400`, `3^{200} ≡ −1`) they fail and §5.3 applies instead.
- The determinant hypothesis is used through `∑B ≡ 0`: for an index set with `∑B ≢ 0` the element `h₁` would be a pseudo-reflection that is not a transvection, and `G` would not lie in `SL_n(k)`.

### 5.2 The symplectic residual hypergeometric group

Let `K` be a finite field of odd characteristic `l` containing a primitive `N`-th root of unity `ζ`, `N` odd, and `k ⊆ K` the subfield generated by `ζ + ζ⁻¹`. Let `n = 2m` with `m > 1` and `N > n + 1`. If `h₀, h∞ ∈ GL_n(k)`, `h∞` has characteristic polynomial `(X − 1)^n`, `h₀` has characteristic polynomial `∏_{b∈B}(X − ζ^b)` over `K` for `B = selfDualIndexSet N n`, and `rank(h₀⁻¹h∞⁻¹ − 1) ≤ 1`, then `⟨h₀, h∞⟩` is conjugate in `GL_n(k)` to `Sp_n(k)`. Prove it as `selfDual_hypergeometric_group_conj_Sp`. The rank-two case is part of §5.6. (Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 4.6 and proof, pp. 32–33.)

*Needs:* §§0.1, 0.3, 0.4, 0.11, §§1.4–1.5.

*Proof sketch.* As in §5.1, `h₁` is a transvection (`∑B ≡ 0` because `B = −B`), `G` is absolutely irreducible and generated by transvections. The characteristic polynomials of `h∞` and `h₀` are invariant under `x ↦ x⁻¹`, so by Levelt's theorem (§0.3) `G` is conjugate to its contragredient and preserves a nondegenerate bilinear form, unique up to scalars by absolute irreducibility; a transvection preserves no nondegenerate symmetric form in odd characteristic, so the form is alternating. §0.11 and containment in `Sp_n` exclude `SL_n(k′)` and `SU(n, k′)` for `n > 2`: a diagonal element `diag(α, β, (αβ)⁻¹, 1, …)` of `SU` with `σ(α)α = σ(β)β = 1` is conjugate into `Sp_n` only if one of `α, β, αβ` is `1`. The characteristic polynomial of `h₀` lies in `k′[X]` only if `l^jB = B` for `#k′ = l^j`, so `l^j ≡ ±1` (§1.5(2)), which puts `ζ + ζ⁻¹` in `k′`; hence `k′ = k`.

**Checks.**

- For `m = 2`, `N = 7`: `B = {2, 3, 4, 5} = −B` and `∑B = 14 ≡ 0`, so `h₁` is a transvection; the conclusion is a conjugate of `Sp₄(𝔽_l(ζ₇ + ζ₇⁻¹))`.
- For `N = n + 1` the index set is `(ℤ/Nℤ) − {0}`, the characteristic polynomial of `h₀` lies in `𝔽_l[X]`, and the group lies in `Sp_n(𝔽_l)` rather than `Sp_n(k)`: the hypothesis `N > n + 1` is needed.
- The group lies in `Sp_n(k)` with `k = 𝔽_l(ζ + ζ⁻¹)`, which can be strictly smaller than `𝔽_l(ζ)`: for `l = 2`, excluded here, and for `l = 3`, `N = 7`, `𝔽₃(ζ₇) = 𝔽_{3⁶}` while `𝔽₃(ζ₇ + ζ₇⁻¹) = 𝔽_{3³}`.

### 5.3 The unitary residual hypergeometric group

In the setting of §5.1 suppose instead that `σ` is a field automorphism of `k` with `σ(ζ) = ζ⁻¹`, equivalently that `−1` is a power of `l` modulo `N`. Then `⟨h₀, h∞⟩` is conjugate in `GL_n(k)` to the special unitary group `{g : σ(g)ᵀg = 1, det g = 1}` of `k` over the fixed field of `σ`. Prove it as `qian_hypergeometric_group_conj_SU`. (Boxer–Calegari–Gee–Newton–Thorne, Proposition 4.4.2 and proof, arXiv v3 p. 47; Qian, proof of Lemma 3.6, arXiv v1 p. 15.)

*Needs:* §§0.3–0.7, 0.9, 0.11, §§1.4–1.5.

*Proof sketch.* The map `g ↦ (σ(g)ᵀ)⁻¹` is an automorphism of `GL_n(k)` carrying `(h₀, h∞)` to a pair with the same characteristic polynomials (the eigenvalue sets `{ζ^b}` and `{1}` are stable under `x ↦ σ(x)⁻¹`) and the same rank condition; Levelt's theorem (§0.3) gives `P` with `P h P⁻¹ = (σ(h)ᵀ)⁻¹`, and Schur's lemma with Hilbert 90 turns `P` into a nondegenerate Hermitian form preserved by `G` (§0.8), equivalent to the standard one (§0.7). With determinant one, `G` lies in a conjugate of `SU_n(k)`. As in §5.1 it is generated by transvections and absolutely irreducible; §0.11 and the stabiliser lemma exclude every proper subfield, `SL_n(k)` (too large) and `Sp_n` (`B ≠ −B`).

**Checks.**

- If `l ≡ −1 (mod N)` then `k = 𝔽_{l²}` and `σ` is `x ↦ x^l`; for `n = 3` the group is `SU₃(𝔽_{l²})`.
- `σ` is unique when it exists: a finite field has at most one automorphism of order two, and `σ(ζ) = ζ⁻¹` forces it.
- If no automorphism inverts `ζ`, the hypothesis is empty and §5.1 applies.

### 5.4 The two-prime residual hypergeometric group

Let `k₁, k₂` be finite fields of distinct odd characteristics `l₁ ≠ l₂` with `max(l₁, l₂) > 10`, each generated by a primitive `N`-th root of unity, with `−1` not a power of `lᵢ` modulo `N`, and let `(h₀ᵢ, h∞ᵢ)` be pairs over `kᵢ` as in §5.1 for the same `N` and `n`. Then `(h₀₁, h₀₂)` and `(h∞₁, h∞₂)` generate `SL_n(k₁) × SL_n(k₂)`. Prove it as `qian_two_prime_hypergeometric_group`. (Qian, Proposition 3.7 and proof, arXiv v1 p. 16, published Proposition 3.8.)

*Needs:* §§0.9, 0.10, 0.12, §5.1.

*Proof sketch.* The generated group projects onto each factor by §5.1. Relabel so that `l₁ > 10`: every nontrivial quotient of `SL_n(k₁)` has `PSL_n(k₁)` as a composition factor (§0.9), and no composition factor of `SL_n(k₂)` is isomorphic to it (§0.10); §0.12 gives the full product.

**Checks.**

- For `N = 401` and `n = 3`, `l₁ = 5` (order `25`) satisfies the hypothesis, while `l₂ = 7` and `l₂ = 11` (order `200`, with `7^{100} ≡ 11^{100} ≡ −1 (mod 401)`) do not, and the unitary variants of §5.10 apply to them; the prime `l₂ = 3209 ≡ 1 (mod 401)` satisfies it with `k₂ = 𝔽_{3209}`.
- For `l₁ = l₂` the diagonal embedding of a single pair generates a proper subgroup isomorphic to `SL_n(k₁)`: distinctness of the characteristics is necessary.
- The bound `max(l₁, l₂) > 10` excludes small coincidences such as `PSL₂(𝔽₄) ≅ PSL₂(𝔽₅)`; here both characteristics are odd and one is at least `11`.

### 5.5 Full special linear residual monodromy

Let `n > 2`, `gcd(N, n) = 1`, Qian's datum, `l` an odd prime prime to `N`, `λ` a prime of `O` above `l`, so that `k(λ) = 𝔽_{l^r}` with `r` the order of `l` modulo `N`, and assume `N ∤ l^{r/2} + 1` when `r` is even. Then `ρ̄_{t′}(π₁(T′₀(ℂ), t′)) = SL(V′_{B,t′}/λ) ≅ SL_n(k(λ))` and `ρ̄_t(π₁(T₀(ℂ), t)) = SL(V_{B,t}/λ)` for every `t ∈ T₀(ℂ)`. Equivalently the geometric monodromy of `V[λ]`, and of `W̄_λ`, is `SL_n(k(λ))`. The statement on `T′₀` is for `n > 2` only; rank two uses the self-dual family (§5.6). (Qian, Lemma 3.6 with proof, arXiv v1 pp. 15–16, published Lemma 3.7.)

*Needs:* §§4.1, 4.5, 4.7, §5.1, §0.9; Tau Ceti `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card`; §3.6 for `W̄_λ`.

*Proof sketch.* By §4.7, `ρ̄_{t′}` is the reduction of the companion representation, whose image is generated by the reductions of `ρ(γ₀) = B⁻¹` and `ρ(γ∞) = A`; these satisfy the hypotheses of §5.1 over `k(λ) = 𝔽_l(ζ_N mod λ)`, so the image is `SL_n(k(λ))`. `π₁(T₀(ℂ) − {0})` is normal of index `N` in `π₁(T′₀(ℂ))` with cyclic quotient, so `ρ̄_t` has image normal in `SL_n(k(λ))` with cyclic quotient of order dividing `N`. Since `n ≥ 3`, `SL_n(k(λ))` is perfect (Tau Ceti `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card`), so it has no nontrivial abelian quotient and the image on `T₀` is all of `SL_n(k(λ))`; the hypothesis `gcd(N, n) = 1` enters only through §4.4, by way of §§4.5 and 4.7. Twisting by `Ψ_λ⁻¹` does not change geometric monodromy.

**Checks.**

- If `l ≡ 1 (mod N)` then `k(λ) = 𝔽_l` and the residual monodromy of `V[λ]` is `SL_n(𝔽_l)`.
- A central composition factor is not a cyclic quotient. For `n = 3`, `N = 603 = 3²·67` and the prime `l = 7237 = 12·603 + 1` (so `k(λ) = 𝔽₇₂₃₇`), `gcd(N, n) = 3` and the centre of `SL₃(𝔽₇₂₃₇)` has order `gcd(3, 7236) = 3`, yet `SL₃(𝔽₇₂₃₇)` is perfect, so the passage from `T′₀` to `T₀`, whose quotient is cyclic of order dividing `603`, cannot stop at a normal subgroup of index `3`: such a subgroup would give a nontrivial abelian quotient of a perfect group.
- For `n = 2` Qian's last-coordinate quotient does not have full monodromy; the middle-coordinate quotient of the self-dual family does (§5.6).

### 5.6 Full symplectic residual monodromy of the self-dual family

For the self-dual data (`n` even, `N > n + 1`, `gcd(N, n) = 1` as in the Conventions) and a nonzero prime `λ` of `O⁺ = ℤ[ζ_N, 1/(2N)]⁺`, the reduction of the monodromy of `Ṽ_B` modulo `λ` has image `Sp(Ṽ_{B,t̃}/λ)`, and for every `t ∈ T₀(ℂ)` the map `π₁(T₀(ℂ), t) → Sp(V_{B,t}/λ)` is surjective. For `n = 2` this gives `SL₂(k(λ)) = Sp₂(k(λ))` on `T₀(ℂ)`. (Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 4.6 and Corollary 4.7 with proofs, pp. 32–34; Qian, after Proposition 3.2, arXiv v1 p. 13, for its use in rank two.)

*Needs:* §§2.5, 4.1, 4.7, §5.2, §§0.9, 0.11; Tau Ceti `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard`.

*Proof sketch.* §4.7 and §5.2 (with `k(λ)` the residue field of `O⁺`, generated by the image of `ζ_N + ζ_N⁻¹`) give the image on the quotient line for `n > 2`. For `n = 2` the same argument runs with §0.11(2): the image is `SL₂(k′)` for a subfield, and `k′ = k(λ)` by the trace field, or `l = 3` and a binary icosahedral group, which is impossible because `ρ̄(γ₀)⁻¹ = ρ̄(γ₁)ρ̄(γ∞)` is a product of two elements of order three (a transvection and a unipotent element in characteristic three), and in `SL₂(𝔽₅)` such a product has order `1`, `3`, `4`, `6` or `10`, never the odd order `N ≥ 5` of `ρ̄(γ₀)`. The quotient by the index-`N` subgroup is cyclic of order dividing the odd `N`, while the cyclic composition factors of `Sp_n(k(λ))` have order `2` (the centre) unless `Sp_n(k(λ)) = Sp₂(𝔽₃)`; that case does not occur, since `k(λ) = 𝔽₃` would need `3 ≡ ±1 (mod N)` (§5.10). For `n = 2` this is the perfectness of `SL₂(k(λ))` for `#k(λ) ≥ 5` (Tau Ceti `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard`).

**Checks.**

- For `n = 2` the residual monodromy of the real form modulo `λ` is `SL₂(k(λ))`.
- For `n = 2`, `N = 5`, `l = 3`, `k(λ) = 𝔽₃(ζ₅ + ζ₅⁻¹) = 𝔽₉`: the binary icosahedral subgroup `SL₂(𝔽₅) ⊂ SL₂(𝔽₉)` is generated by transvections, but in it a product of two elements of order three has order `1`, `3`, `4`, `6` or `10`, never `5`, so it cannot be the image and the image is `SL₂(𝔽₉)`.
- For `N = 5`, `l = 3`, the residual companion pair is `A = C((X − 1)²) = [[0, −1], [1, 2]]` and `B = C(X² − tX + 1)` with `t = ζ₅ + ζ₅⁻¹` a root of `X² + X + 2` in `𝔽₉`; `A` has order `3`, `B⁻¹` order `5`, `BA⁻¹` order `3`, and `⟨B⁻¹, A⟩` has order `720 = #SL₂(𝔽₉)`, not `120 = #SL₂(𝔽₅)`.
- `k(λ)` is the residue field of `O⁺`, whose degree over `𝔽_l` need not be the order of `l` modulo `N`: for `l = 3`, `N = 7` it is `3` while the order of `3` modulo `7` is `6`.
- For Qian's last-coordinate rank-two quotient the statement fails; the middle coordinate has exponent zero for the self-dual datum and is the one used.

### 5.7 The skew-Hermitian Poincaré pairing on the residual Dwork system

Let `n > 2`, Qian's datum, and `λ` a place of `M` above `l ∤ 2N` with `−1 ∈ ⟨l⟩ ⊂ (ℤ/Nℤ)^×`, so that the Frobenius of `k(λ)` over `𝔽_l` has a power inducing complex conjugation `c` on `μ_N`. Poincaré duality on the relative cohomology with `O_{M⁺_λ}`-coefficients, extended sesquilinearly to `O_{M_λ}`, and the `Ψ`-twist give a perfect `𝔽_l`-bilinear pairing `⟨·,·⟩ : W̄_λ × W̄_λ → k(λ)(1 − n)` with `⟨ax, y⟩ = a⟨x, y⟩`, `⟨x, ay⟩ = c(a)⟨x, y⟩` and `⟨y, x⟩ = −c⟨x, y⟩`, skew-Hermitian for `k(λ)/k(λ)^c`. (Boxer–Calegari–Gee–Newton–Thorne, after Definition 4.4.1, arXiv v3 pp. 46–47.)

The construction has the following API.

- The pairing is perfect on every stalk and induces `⟨·,·⟩_{W̄_{t,λ}}` on each fibre.
- `π₁(T₀[1/l])` acts by similitudes with multiplier `ε̄^{1−n}`; every fibre `W̄_{t,λ}` is conjugate self-dual with this multiplier.
- The geometric monodromy preserves the form, hence lies in a unitary group `U_n(k(λ))`; with the geometrically trivial determinant of §3.6 it lies in `SU_n(k(λ))` after the identifications of §§0.6–0.7.
- `⟨x, x⟩ ∈ ker(1 + c)` for every `x`.
- The form induced on `∧ⁿ W̄_λ` is a Hermitian form up to a trace-zero scalar on a line, compatible with `det W̄_λ ≅ ε̄^{−n(n−1)/2}`.

*Needs:* §§0.5–0.7, §§2.4, 3.5, 3.6; EtaleDualityAndPerverseSheaves §0.5.

*Proof sketch.* §2.4 pairs the `χ`-part with the `χ⁻¹`-part; `c` sends `χ` to `χ⁻¹`, and when `c` lies in the image of `Gal(k(λ)/𝔽_l)` composition with the coefficient automorphism gives a sesquilinear self-pairing of `V̄_λ`. The middle cup product is alternating (`N − 2` odd), giving `⟨y, x⟩ = −c⟨x, y⟩`. The twist by `Ψ_λ⁻¹` and `Ψ c(Ψ) = ε^{n+1−N}` (§3.5) move the values from `k(λ)(2 − N)` to `k(λ)(1 − n)`. Multiplying by a nonzero trace-zero `η` gives a Hermitian form, conjugate to the standard one (§0.7).

**Checks.**

- If `l ≡ −1 (mod N)` then `k(λ) = 𝔽_{l²}` and `c` is `x ↦ x^l`; the pairing is skew-Hermitian for `𝔽_{l²}/𝔽_l`.
- If `l ≡ 1 (mod N)`, `c` is not a power of Frobenius and no such self-pairing exists: `W̄_λ` pairs with the `χ⁻¹`-system, a different local system, and the monodromy is `SL_n` (§5.5).
- The pairing is not `k(λ)`-bilinear: `⟨x, ay⟩ = c(a)⟨x, y⟩ ≠ a⟨x, y⟩` for `a ∉ k(λ)^c`.

### 5.8 Full special unitary residual monodromy

Let `n > 2`, `gcd(N, n) = 1`, Qian's datum, `l ∤ 2N` with `−1 ∈ ⟨l⟩ (mod N)` and `λ | l` a place of `M`. The image of the geometric monodromy group `π₁(T_{0,ℚ̄})` on `W̄_λ` is `SU_n(k(λ))` for the skew-Hermitian structure of §5.7. (Boxer–Calegari–Gee–Newton–Thorne, Proposition 4.4.2 and proof, arXiv v3 p. 47.)

*Needs:* §§4.7, 5.3, 5.7, §0.9.

*Proof sketch.* On `T′₀` the image is generated by a hypergeometric pair over `k(λ)`, conjugate to `SU_n(k(λ))` by §5.3, and the invariant form of §5.7 identifies the conjugate. The image on `T₀` is normal with cyclic quotient of order dividing `N`; `SU_n(k(λ))` is perfect for `n ≥ 3` (§0.9(2)), so the quotient is trivial; `gcd(N, n) = 1` enters only through §4.4.

**Checks.**

- For `l ≡ −1 (mod N)` and `n = 3` the geometric monodromy of `W̄_λ` is `SU₃(𝔽_{l²})`.
- The image is not all of `SL_n(k(λ))`: it preserves the form of §5.7, and `[SL₃(𝔽_{l²}) : SU₃(𝔽_{l²})] > 1`.
- The multiplier kernel `U_n(k(λ))` is strictly larger than the image: the image has determinant one.

### 5.9 The determinant descends to the base field

For every Dwork exponent datum of rank `n` and every nonzero ideal `𝔫` of `O` (also of `O⁺`, with the real forms of §2.5, for the self-dual data) the rank-one lisse sheaf `∧ⁿ V[𝔫]` on `(T₀)_F`, `F ⊇ ℚ(ζ_N)`, has trivial geometric monodromy, hence is the pullback of a character of `G_F`, determined by its stalk at `t = 0`. The same holds for `∧ⁿ V_λ` and, for Qian's datum, for `∧ⁿ W̄_λ`, which is `ε̄^{−n(n−1)/2}`. This is descent of the determinant, not triviality of the arithmetic character. (Qian, after Lemma 3.6, arXiv v1 p. 16; Boxer–Calegari–Gee–Newton–Thorne, Theorem 4.2.1(1), arXiv v3 p. 41, and the definition of `W` on p. 42.)

*Needs:* §§1.2, 1.3, 2.3, 2.5, 2.7, 3.6, 4.3; EtaleCohomologyFoundations §F.0.A2.

*Proof sketch.* `π₁(T₀(ℂ), t)`, the fundamental group of `ℂ` minus the `N` points of `μ_N`, is generated by loops around these points, and the image of the loop around `ζ ∈ μ_N` is conjugate to the local monodromy at `ζ`. An element of `H` acting on the base by `t ↦ ζ⁻¹t` (§1.3) lifts to `Y` and commutes with `H₀` (`H` is abelian), so it carries the `χ`-part of `R^{N−2}π_*` to itself and the local monodromy at `ζ` to a conjugate of the local monodromy at `t = 1`. By Picard–Lefschetz (§4.3, whose formula holds on all of `H^{N−2}` and so for every character) the latter is unipotent. So every generator acts with determinant one on every eigenpart and on the real forms, with integral and with torsion coefficients, unipotence surviving reduction. Through the comparison of §2.3 the geometric étale fundamental group `π₁(T_{0,ℚ̄})` is the profinite completion of `π₁(T₀(ℂ), t)`, acting continuously on the finite or `λ`-adic stalks, so the determinant is trivial on it. For `W̄_λ` the twist by `Ψ_λ⁻¹` is geometrically trivial (§3.6). A lisse sheaf on a geometrically connected `F`-variety with trivial geometric monodromy comes from a representation of `G_F` by the exact sequence of EtaleCohomologyFoundations §F.0.A2; its value is read at the `F`-point `t = 0`.

**Checks.**

- For `n = 3` and `𝔫 = λ`, `∧³V[λ]` is the character by which `G_F` acts on the top exterior power of the Fermat fibre's eigenpart.
- For a quotient coordinate with `a_q ≠ 0` the monodromy at zero has determinant `ζ_N^{n a_q}`, so the determinant need not descend from the quotient line `T′₀`; it still descends on `T₀`, where `t = 0` is a point of the base.
- The statement covers data outside Layer 4. The zero-shaped `a = (0, 0, 0, 0, 1, 2, 4)`, `N = 7`, `n = 3`, is neither Qian's datum (which needs `N > 100n + 100`) nor self-dual (`n` is odd), so §§4.2 and 4.4 say nothing about it; still `π₁(T₀(ℂ), t)` is generated by seven loops, each acting through a conjugate of the monodromy at `t = 1` with `(T − 1)² = 0`, so the determinant is geometrically trivial. A route through the three peripheral loops of `T′₀` would instead need the eigenvalues at `t′ = 0` and unipotence at `t′ = ∞`, which are proved only for those two data.
- Descent does not make the arithmetic character trivial: `∧ⁿ W̄_λ ≅ ε̄_l^{−n(n−1)/2}` is nontrivial on `G_F` exactly when the order of `ε̄_l(G_F) = Gal(F(ζ_l)/F)` does not divide `n(n − 1)/2`. For `n = 3`, `l = 7`: over `F = ℚ(ζ₄₀₁)`, linearly disjoint from `ℚ(ζ₇)`, `ε̄₇` has order `6` and `ε̄₇^{−3}` order `2`, nontrivial; over `F = ℚ(ζ₄₀₁, ζ₇)` both are trivial, although `l > n(n − 1)/2 + 1`.

### 5.10 Residual monodromy at two primes is the full product

Let `l₁ ≠ l₂` be odd primes prime to `N`, `λᵢ | lᵢ`, and suppose each factor's geometric monodromy is the full group `Hᵢ`, one of `SL_n(k(λᵢ))` (`n > 2`, `−1 ∉ ⟨lᵢ⟩`), `SU_n(k(λᵢ))` (`n > 2`, `−1 ∈ ⟨lᵢ⟩`) or `Sp_n(k(λᵢ))` (self-dual data). Assume `max(l₁, l₂) > 10` unless both factors are symplectic. Then for every `t ∈ T₀(ℂ)` the geometric monodromy `π₁(T₀(ℂ), t) → H₁ × H₂` is surjective. (Qian, Proposition 3.7 with proof, arXiv v1 p. 16; Barnet-Lamb–Geraghty–Harris–Taylor, Corollary 4.8 and proof, p. 34; Boxer–Calegari–Gee–Newton–Thorne, proof of Proposition 4.4.2, arXiv v3 p. 47.)

*Needs:* §§0.9, 0.10, 0.12, §§5.4–5.6, 5.8.

*Proof sketch.* Each projection is surjective (§§5.5, 5.6, 5.8). Relabel so that `H₁` is not `Sp₂(𝔽₃)` and, in the mixed or linear cases, `l₁ > 10`: `H₁` is perfect and each nontrivial quotient has its simple projective quotient as a composition factor (§0.9); that factor is not a composition factor of `H₂` (§0.10, whose symplectic part needs only distinct odd characteristics). If `H₂ = Sp₂(𝔽₃)` it is solvable, with composition factors of orders `2` and `3`, and shares no nontrivial quotient with `H₁`; it is never called perfect. Goursat (§0.12) gives the full product.

**Checks.**

- For Qian's switch (`l′ ≡ 1 (mod N)`, `l′ > 2ln + 5 > 10`) the hypotheses hold with `H₂ = SL_n(𝔽_{l′})`.
- `Sp₂(𝔽₃)` would require `k(λ) = 𝔽₃`, that is `3 ≡ ±1 (mod N)`, which no odd `N ≥ 3` satisfies; the argument nevertheless never treats it as perfect.
- Two symplectic factors need only distinct odd characteristics: for `n = 2` the orders `q(q² − 1)/2` of `PSL₂(𝔽_q)` are strictly increasing in `q`, so `PSp₂` over fields of different characteristics are never isomorphic.
- For `l₁ = l₂` and the same prime `λ` the image is the diagonal, a proper subgroup.

### 5.11 Moduli of level structures on Dwork systems

Let `F ⊇ ℚ(ζ_N)` be a number field, `l₁ ≠ l₂` primes not dividing `2N`, `λᵢ` places of `M` above `lᵢ`, and `Λ = W̄_{λ₁} × W̄_{λ₂}` (or `V[𝔫]` for `𝔫 = λ₁λ₂`, or the self-dual `V[𝔫]((N − 1 − n)/2)` over `O⁺`). Level-structure data are: (1) étale sheaves `Uᵢ` on `Spec F` of free `k(λᵢ)`-modules of rank `n`, i.e. continuous representations of `G_F`; (2) isomorphisms `ηᵢ : ∧ⁿΛᵢ ≅ ∧ⁿUᵢ` over `(T₀)_F`, `Λᵢ` the factor of `Λ` at `λᵢ`, which exist by §5.9 exactly when the determinant characters agree; (3) in the unitary case `−1 ∈ ⟨lᵢ⟩`, a perfect `𝔽_{lᵢ}`-bilinear skew-Hermitian pairing `Uᵢ × Uᵢ → k(λᵢ)(1 − n)`, with `ηᵢ` compatible with the induced pairings on `∧ⁿ`; in the self-dual case, a perfect alternating pairing on `Uᵢ` with multiplier `ε̄^{1−n}` matching that of `V[𝔫]((N − 1 − n)/2)`, and then `ηᵢ` is not an independent datum: it is the isomorphism induced by the two pairings, which sends `e₁ ∧ f₁ ∧ ⋯ ∧ e_m ∧ f_m` for a symplectic basis of the corresponding factor of `Λ` (étale locally, `n = 2m`) to the same expression for a symplectic basis of `Uᵢ`, independently of the bases because symplectic matrices have determinant one. The functor `T({Uᵢ})` on `(T₀)_F`-schemes sends `S` to pairs of isomorphisms `φᵢ : Λ_{i,S} ≅ U_{i,S}` with `∧ⁿφᵢ = ηᵢ`, preserving the pairings in the unitary case. It is represented by a finite étale `(T₀)_F`-scheme, a torsor under `SL(Λ₁) × SL(Λ₂)` (resp. `SU`). For the self-dual data, `T({Uᵢ})` denotes the scheme of pairing-preserving isomorphisms `φᵢ` (the determinant condition then follows from pairing preservation), which is the scheme of pairing-preserving trivializations of ModularityAndLanglandsExtensions §2.14; this roadmap cites it and does not construct it, and the representability statement, the API and the proof sketch below concern the linear and unitary data. For one prime `l ≡ 1 (mod N)` write `T(r̄_λ)`; for two primes `≡ ±1 (mod N)` write `T(r̄_{λ₁}, r̄_{λ₂})`. This covers Qian's `T_W` (`n > 2`, split case) and the torsors of Boxer–Calegari–Gee–Newton–Thorne; for the self-dual data it is the self-dual `T_W` of Barnet-Lamb–Geraghty–Harris–Taylor with the symplectic compatibility required by Barnet-Lamb–Gee–Geraghty–Taylor. (Qian, before Proposition 3.7, arXiv v1 p. 16; Barnet-Lamb–Geraghty–Harris–Taylor, §4, the cover `T_W`, p. 28; Barnet-Lamb–Gee–Geraghty–Taylor, proof of Theorem 3.1.2, arXiv v4 pp. 43–44; Boxer–Calegari–Gee–Newton–Thorne, Definition 4.4.1 and Remark 4.4.3, arXiv v3 pp. 46–48, with places of `M` and `𝔽_{lᵢ}`-bilinearity.)

The construction has the following API.

- `T({Uᵢ}) → (T₀)_F` is finite étale, and a torsor under `∏ SL(Λᵢ)` (`SU` in the unitary case).
- For a field `K ⊇ F` and `t ∈ T₀(K)`, a `K`-point of `T({Uᵢ})` over `t` is a `G_K`-equivariant isomorphism `Λ_{i,t} ≅ Uᵢ|_{G_K}` with the prescribed determinant and pairing compatibility.
- Formation commutes with extension of `F` and with base change on `T₀`.
- For one prime `λ`, `l ≡ 1 (mod N)` and `r̄_λ` with determinant `ε̄^{−n(n−1)/2}`, `T(r̄_λ)` is defined with `Λ = W̄_λ`.

*Needs:* §§2.5, 2.7, 3.6, 5.7, 5.9; EtaleCohomologyFoundations §F.0.2; SchemeAndStackFoundations §1.15; ModularityAndLanglandsExtensions §2.14 (the self-dual data).

*Proof sketch.* Étale locally both sides are constant and `η` is a unit; the solutions form a coset of `SL_n` (resp. `SU_n`) inside `GL_n`, nonempty because two perfect pairings of the same type with the same values are étale locally isomorphic and the determinants of the isometries are exactly the determinant isomorphisms compatible with the induced pairings (unitary case), so the functor is a locally constant étale sheaf of finite sets. The set of coefficient-linear isomorphisms of the fibres is a finite continuous `π₁`-set, hence a finite étale cover (EtaleCohomologyFoundations §F.0.2); the determinant and pairing conditions cut out a `π₁`-stable subset whose geometric fibres are the classical-group torsors when nonempty. Coherent Isom schemes are not used.

**Checks.**

- For one prime with `k(λ) = 𝔽_l`, the degree of `T(r̄_λ)` over `T₀` is `#SL_n(𝔽_l)`; for `n = 3`, `l = 7` it is `7³(7² − 1)(7³ − 1) = 5630688`.
- If `U = W̄_{λ,t₀}` for an `F`-point `t₀` and `η` is the identity, then `t₀` lifts to an `F`-point of `T(U)`.
- If `det U ≇ det W̄_λ` as `G_F`-characters there is no `η`, and the data are not defined.
- In the unitary case, dropping the pairing condition gives a torsor under `SL_n(k(λ))` on which the geometric monodromy `SU_n(k(λ))` has `[SL_n : SU_n] > 1` orbits, so it is not geometrically connected; the same happens for the symplectic data without the symplectic compatibility.
- In the self-dual case an independently chosen `η` can empty the fibres: for `n = 2`, `N = 5` and a prime `λ` of `O⁺` above `11` (so `k(λ) = 𝔽₁₁`), with `U` the fibre at an `F`-point and its pairing, the pairing-preserving isomorphisms form a torsor under `Sp₂(𝔽₁₁) = SL₂(𝔽₁₁)`, with `11·(11² − 1) = 1320` geometric points in each fibre, and every one of them induces the pairing-induced `η`; for `2η` there is no pairing-preserving `φ` with `∧²φ = 2η`, and the fibre is empty.

### 5.12 The level-structure torsors are geometrically irreducible

Under the hypotheses of §5.10, or for one prime `l ≡ 1 (mod N)` with `k(λ) = 𝔽_l`, and with level data as in §5.11 (pairings compatible with `ηᵢ` in the unitary case; pairing-preserving isomorphisms, with `ηᵢ` induced by the pairings, in the self-dual case), `T({Uᵢ})` is a smooth, geometrically irreducible `F`-variety. For the linear, unitary and mixed products the geometric connectedness is derived here from the residual monodromy of §5.10. For the self-dual data it is the geometric connectedness of the pairing-preserving trivialization scheme, ModularityAndLanglandsExtensions §2.14, which is cited and not restated; the citation covers every base field and every self-dual level datum, because geometric connectedness depends only on the base change to `ℚ̄`, over which any two self-dual level data become isomorphic. For those data this target adds only smoothness and irreducibility. (Qian, Proposition 3.7, arXiv v1 p. 16; Boxer–Calegari–Gee–Newton–Thorne, Proposition 4.4.2 and Remark 4.4.3, arXiv v3 pp. 47–48.)

*Needs:* §§5.5, 5.10, 5.11; EtaleCohomologyFoundations §F.0.2; ModularityAndLanglandsExtensions §2.14 (the self-dual data).

*Proof sketch.* `T({Uᵢ})` is finite étale over the smooth geometrically connected `(T₀)_F`, hence smooth; it is geometrically connected exactly when `π₁(T_{0,ℚ̄})` acts transitively on a geometric fibre, which is a torsor under `∏Hᵢ`, onto which the geometric monodromy surjects (§5.10, or §5.5 for one prime; for the self-dual data the connectedness is ModularityAndLanglandsExtensions §2.14). A smooth connected variety over a field of characteristic zero is irreducible.

**Checks.**

- For one prime `l ≡ 1 (mod N)`, `T(r̄_λ)` is geometrically irreducible because the monodromy of `W̄_λ` is `SL_n(𝔽_l)`.
- Without the compatibility of `ηᵢ` with the pairings the fibre can be empty: the determinants of isometries of a Hermitian space form a coset of the norm-one group, and an `η` outside it gives no isometry.
- For two primes of the same characteristic the monodromy is not the product, and the torsor has several geometric components.

### Examples

For `N = 401`, `n = 3`, `l = 5` (order `25` modulo `401`, so `−1 ∉ ⟨5⟩`) and the prime `l′ = 3209 = 8 · 401 + 1`, the smallest prime congruent to `1` modulo `401`, §5.4 gives residual monodromy `SL₃(𝔽_{5^{25}}) × SL₃(𝔽_{3209})` and §5.12 a geometrically irreducible torsor `T_W` for every compatible choice of `U₁, U₂, η`. Since `3209 ≡ 2 (mod 3)`, cubing is bijective on `𝔽_{3209}^×`, which §6.5 uses at this prime.

### Dependencies

Layers 0–4; Tau Ceti `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card` and `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard`; EtaleCohomologyFoundations §§F.0.2, F.0.A2; EtaleDualityAndPerverseSheaves §0.5; SchemeAndStackFoundations §1.15; ModularityAndLanglandsExtensions §2.14.

## Layer 6: Frobenius, Gauss sums and determinants

Frobenius acts on each eigenline of the Fermat fibre by a product of Gauss sums. For a zero-shaped datum the product over the index set collapses, by `g(a)g(−a) = q`, to an `n`-th power times a power of `q`: the determinant of a Dwork motive is an `n`-th power up to a quadratic extension of the coefficient field. This is what allows determinants to be matched by finite-field-valued `n`-th roots after a totally real base change. The last target computes Frobenius polynomials of Dwork fibres at good places, proving their `λ`-independence through twisted forms and the trace formula.

### 6.1 Frobenius on the Fermat eigenlines is a product of Gauss sums

Let `F ⊇ ℚ(ζ_N)`, `v` a finite place of `F` of residue characteristic `p ∤ Nl` with residue field of `q` elements, `ψ : 𝔽_q → ℚ̄_l^×` a nontrivial additive character and `t : μ_N(𝔽_q) ≅ μ_N(ℚ̄_l)` the identification through the place. For `a ∈ ℤ/Nℤ` put `g(v, a) = −∑_{x∈𝔽_q^×} t(x^{(1−q)/N})^a ψ(x)`, so that `g(v, 0) = 1`. For `i ∈ B(a)` geometric Frobenius at `v` acts on the eigenline `V_{λ,i}` of the Fermat fibre by `q⁻¹ ∏_{j=1}^N g(v, a_j + i)`, which is independent of `ψ`; for `i ∉ B(a)` the eigenspace is zero. (Qian, proof of Lemma 3.8, arXiv v1 p. 17, published Lemma 3.9; Deligne, *Hodge cycles on abelian varieties*, Chapter I, §7, Proposition 7.10.)

*Needs:* §§2.1, 2.6; Mathlib `gaussSum`, `gaussSum_mulShift`, `jacobiSum`; CharacterSumsOverFiniteFields §2.4 (multiple Jacobi sums as quotients of Gauss sums, and the count of points on diagonal equations); InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3; EtaleDualityAndPerverseSheaves §4.3(a), (d); SchemeAndStackFoundations §1.16.

*Proof sketch.* The Fermat fibre has good reduction at `v`, and the eigenspace decomposition commutes with Frobenius (§2.6). Each eigenline has rank one, so its Frobenius eigenvalue is its trace, and it suffices to know the traces of `h · Frob_v` for `h ∈ H`, all defined over `k(v)` because `F ⊇ ℚ(ζ_N)`. By the trace formula (InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3) the alternating trace of `h · Frob_v` is the number of `k(v)`-points of the twisted form of the Fermat hypersurface by `h` (SchemeAndStackFoundations §1.16), which is again diagonal, `∑ cᵢXᵢᴺ = 0` with `cᵢ ∈ k(v)^×` determined by `h`; outside the middle degree `h` acts trivially and Frobenius by powers of `q` (EtaleDualityAndPerverseSheaves §4.3(a), (d)). The count of points of a diagonal equation by multiple Jacobi sums, and their expression through Gauss sums (CharacterSumsOverFiniteFields §2.4), together with the orthogonality of the characters of the finite abelian group `H`, give the eigenvalue on each line; only counts over `k(v)` itself enter, and no Hasse–Davenport relation is needed. Independence of `ψ` holds because `∑_j(a_j + i) ≡ 0 (mod N)`: replacing `ψ` by `ψ_c(x) = ψ(cx)` multiplies the product by `t(c^{(1−q)/N})^{−∑(a_j+i)} = 1`.

**Checks.**

- `N = 3`, the line `(1, 1, 1)` of the Fermat cubic: Frobenius acts by `q⁻¹g(v, 1)³`, a cubic Jacobi sum up to sign, of complex absolute value `√q`. Over `𝔽₇` (`ℚ(ζ₃)` has a place `v | 7` with `k(v) = 𝔽₇`): `g(v, 1)³ = −q J(χ, χ)` for the cubic character `χ` of the identification, and `J(χ, χ)` is `2 + 3ω` or its conjugate `−1 − 3ω` (norm `7`), so the two eigenvalues are `−J` and `−J̄`, with trace `−(J + J̄) = −1`, and the Fermat cubic has `7 + 1 − (−1) = 9` points over `𝔽₇`, its nine flexes, as a direct count confirms; without the sign in `g`, the eigenvalues `+J`, `+J̄` would give `7` points.
- `g(v, 0) = 1`: the normalising sign makes the trivial character contribute nothing, matching `gaussSum 1 ψ = −1` in Mathlib's convention.
- For `i ∉ B(a)` some `a_j + i` vanishes, and the corresponding eigenspace of the Fermat fibre is zero, consistent with §2.6.

### 6.2 The Gauss-sum formula for the determinant

Let `F` be a finite field with `q = Nat.card F` elements, `R` an integral domain, `χ : F → R` a multiplicative character of exact odd order `N`, `ψ : F → R` a primitive additive character, and `g(a) = −∑_{x∈F} χ^a(x)ψ(x) = −gaussSum(χ^a, ψ)` for `a ∈ ℤ/Nℤ` (Qian's normalisation, `qianGauss`, written as a finite sum over the finite field). For every zero-shaped datum `a` of rank `n` with index set `B`, `∏_{b∈B} ∏_{j=1}^N g(a_j + b) = (∏_{b∈B} g(b))^n · q^{n(N − n)/2}`. Prove it as `zeroShaped_gauss_product`. Consequently, for `v ∤ Nl` with `q = #k(v)`, `det(Frob_v | V_{λ,0}) = q^{−n} ∏_{b∈B}∏_j g(v, a_j + b) = q^{n(N−n−2)/2} (∏_{b∈B} g(v, b))^n`, and by §5.9 this is the value of the character `det V[λ]` of `G_F` at `Frob_v`. (Qian, Lemma 3.8 and formula (3.1), arXiv v1 pp. 17–18, published Lemma 3.9.)

*Needs:* §§1.4, 5.9, 6.1; Mathlib `gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `AddChar.IsPrimitive`, `MulChar`.

*Proof sketch.* For a zero-shaped datum the values are `{0} ∪ A′` with `A′` the `N − n − 1` nonzero values, `B` is the complement of `−({0} ∪ A′)`, and `0 ∉ B`. For `b ∈ B` the residues `a_j + b` are `b` (`n + 1` times) and `b − s` for `s ∉ B ∪ {0}`, so `∏_j g(a_j + b) = g(b)^n · ∏_{u≠0} g(u) / ∏_{b′∈B, b′≠b} g(b − b′)`. For `u ≠ 0`, `χ^u ≠ 1` and `χ(−1) = 1` (odd order), so `g(u)g(−u) = gaussSum(χ^u, ψ)·gaussSum(χ^{−u}, ψ) = q` by `gaussSum_mul_gaussSum_eq_card`; hence `∏_{u≠0} g(u) = q^{(N−1)/2}` and `∏_{b≠b′} g(b − b′) = q^{n(n−1)/2}`. Multiply over `b ∈ B`.

**Checks.**

- Weight check: `|g(v, b)| = √q`, so `|det| = q^{n(N−n−2)/2} q^{n²/2} = q^{n(N−2)/2}`, consistent with purity of weight `N − 2` in rank `n`.
- `n = 0` (the vector `(0, 1, …, N − 1)` permuted): `B = ∅` and both sides are `1`.
- The vector `a = 0`, of rank `n = N − 1`: the left side is `∏_{b≠0} g(b)^N` and the right side `(∏_{b≠0} g(b))^{N−1} q^{(N−1)/2}`; they agree because `∏_{b≠0} g(b) = q^{(N−1)/2}`.
- The identity needs `χ(−1) = 1`: for a character of even order `2` and `N = 2` the product `g(1)g(−1) = g(1)² = χ(−1)q` can be `−q`; odd `N` excludes this.

### 6.3 The Gauss-sum product descends to the cyclotomic coefficients

For `v ∤ Nl` of residue characteristic `p`: if `∑_{b∈B} b ≡ 0 (mod N)`, which holds for every zero-shaped datum (§1.4), then `∏_{b∈B} g(v, b) ∈ ℚ_l(ζ_N)`; for the self-dual data with `n = 2`, `g(v, b₁)g(v, b₂) = q` with `B = {b₁, −b₁}`, which lies in `ℚ`. (Qian, Lemma 3.8, formulas (3.2)–(3.3), arXiv v1 p. 18; the printed rank-two argument chooses an automorphism inverting `ζ_N` and fixing `ζ_p`, which need not exist.)

*Needs:* §§1.4, 6.1, 6.2; Mathlib `gaussSum_mulShift`.

*Proof sketch.* An automorphism `σ` of `ℚ̄_l` fixing `ℚ_l(ζ_N)` acts on `p`-th roots of unity by some `a ∈ 𝔽_p^×`; substituting `x ↦ a⁻¹x` gives `σ(g(v, b)) = t(a^{(q−1)/N})^b g(v, b)` (Mathlib `gaussSum_mulShift`), and the product over `B` picks up `t(a^{(q−1)/N})^{∑b} = 1`. In rank two the product is `g(b)g(−b) = q` by §6.2.

**Checks.**

- `n = 2`, `l = 3`, `N = 301 = 7·43`, `F = ℚ(ζ₃₀₁)` and `v | 5`: the order of `5` modulo `301` is `42`, so `k(v) = 𝔽_{5^{42}}` and `g(v, b)g(v, −b) = q = 5^{42}`, rational. No automorphism of `ℚ̄₃` fixing `ℚ₃(ζ₃₀₁)⁺` inverts `ζ₃₀₁` while fixing `ζ₅`: it acts on the unramified field `ℚ₃(ζ₃₀₁, ζ₅)` as a power `3^j` of Frobenius, inverting `ζ₃₀₁` needs `3^j ≡ −1 (mod 301)`, i.e. `j ≡ 21 (mod 42)`, odd, and fixing `ζ₅` needs `4 | j`.
- For a single `b ≠ 0`, `g(v, b)` is not in `ℚ_l(ζ_N)` in general: `σ` multiplies it by `t(a^{(q−1)/N})^b`, a nontrivial root of unity for suitable `a`.
- For Qian's datum with `n = 3`, `N = 401`, `∑B = 401 ≡ 0`, so the product descends.

### 6.4 The determinant of the residual Dwork motive is an `n`-th power up to `𝔽_{l²}`

Let `a` be a zero-shaped datum of rank `n`, `F ⊇ ℚ(ζ_N)` and `λ` a prime above `l` of `O` (for the self-dual datum of rank two, also a prime of `O⁺` with the real form of §2.5), with residue field `k(λ)`. The character `det V[λ]` of `G_F` (§5.9) takes values in `(𝔽_{l²}^× k(λ)^×)^n ⊂ 𝔽̄_l^×`, and in `(k(λ)^×)^n` when `𝔽_{l²} ⊆ k(λ)`. (Qian, Lemma 3.8 with proof, arXiv v1 pp. 16–18.)

*Needs:* §§1.4, 2.5, 5.9, 6.2, 6.3; Chebotarev Layer 10.

*Proof sketch.* By Chebotarev it suffices to evaluate at `Frob_v` for `v ∤ 2Nl`, where §6.2, which needs the zero-shaped hypothesis, gives `q^{n(N−n−2)/2}(∏ g(v, b))^n`. Since `∑B = 0` (§1.4), the product `∏ g(v, b)` is `λ`-integral in `ℚ_l(ζ_N)` (resp. `ℚ_l(ζ_N)⁺`) by §6.3, so its reduction lies in `k(λ)`; `q^{n(N−n−2)/2}` is `(q^{(N−n−2)/2})^n` when `N − n` is even, and `(√q)^{n(N−n−2)}` with `√q ∈ 𝔽_{l²}` otherwise.

**Checks.**

- If `l ≡ 1 (mod N)` and `n` is odd, `N − n` is even and the character takes values in `(𝔽_l^×)^n`.
- For `n` even and `N` odd, `N − n` is odd and the square root of `q` is needed; it lies in `𝔽_{l²}`.
- At `n = 2` with the real form, `∏ g = q` and the value at `Frob_v` is `q^{N−4}·q² = q^{N−2}`; since `N − 2` is odd it is a square only after adjoining `√q ∈ 𝔽_{l²}`, which is why `𝔽_{l²}` appears.
- The zero-shaped hypothesis is needed. For `N = 7`, the rank-three datum `a = (0, 0, 0, 1, 3, 5, 5)` (not zero-shaped, `B = {1, 3, 5}`, §1.4), `l = 43 ≡ 1 (mod 7)` (so `k(λ) = 𝔽₄₃`), `F = ℚ(ζ₇)` and `v | 29`, §6.1 gives `det(Frob_v | V_{λ,0}) = q⁻³ g(1)⁶ g(2) g(3)⁵ g(4)² g(5)³ g(6)⁴` with `g = g(v, ·)`. Its reductions at the six primes `λ | 43` are `22, 4, 31, 6, 7, 29`, and `29¹⁴ ≡ 6 ≢ 1 (mod 43)`, so `29` is not a cube in `𝔽₄₃`, nor in `𝔽_{43²}` (`29^{1848/3} = 29²⁸ ≡ 36 ≢ 1`). For the zero-shaped `a = (0, 0, 0, 0, 1, 2, 4)`, `B = {1, 2, 4}`, the determinant is `q³(g(1)g(2)g(4))³` (§6.2), and at `v` above each of `29, 71, 113, 127, 197` all six reductions are cubes in `𝔽₄₃`.

### 6.5 Finite-field-valued roots after totally real base change

Let `F` be a CM field, `k` a finite field of characteristic `l`, `n = l^a m` with `l ∤ m`, and suppose `μ_m(𝔽̄_l) ⊂ k`. Let `χ̄ : G_F → k^×` be continuous with values in `(k^×)^n`, and `L` a number field. There are a totally real finite Galois `M/ℚ`, linearly disjoint from `L`, and a continuous `ψ̄ : G_{FM} → k^×` with `ψ̄^n = χ̄|_{G_{FM}}`. If `T` is a finite set of odd primes at whose places `χ̄` is unramified, `M` can be chosen with every prime of `T` split and `ψ̄` unramified above `T`. Applying the statement twice, the second time with `L` enlarged by the first `M`, gives roots for two characters over one field `FM₁M₂` with `M₁M₂` disjoint from `L`. (Qian, Lemma 2.1, arXiv v1 pp. 5–8, applied in §4, pp. 21–23, where the simultaneous avoidance and the fixed coefficient field are implicit.)

*Needs:* ArithmeticGaloisDuality §R02.4.6 (roots after prescribed totally real base change).

*Proof sketch.* Since `#k^×` is prime to `l`, the `l^a`-power map is bijective on `k^×`, so it suffices to find an `m`-th root and raise it to the inverse of `l^a` modulo `#k − 1`. Let `η = [χ̄] : G_F → W(k)^× ⊂ ℚ̄_l^×` be the Teichmüller lift, of finite order. ArithmeticGaloisDuality §R02.4.6 gives `M` and `ψ : G_{FM} → ℚ̄_l^×` with `ψ^m = η|_{G_{FM}}`; `ψ` has finite order, so it reduces to `ψ̄ : G_{FM} → 𝔽̄_l^×` with `ψ̄^m = χ̄`. For every `g`, `χ̄(g) = y^m` with `y ∈ k`, and the `m`-th roots of `y^m` are `y·μ_m(𝔽̄_l) ⊂ k`; so `ψ̄` takes values in `k`. Disjointness of `M₁M₂` from `L` comes from enlarging the avoidance field in the second step.

**Checks.**

- `n = l = 3`, `k = 𝔽₃`: `m = 1`, cubing is bijective on `𝔽₃^×`, and `ψ̄ = χ̄^u` with `3u ≡ 1 (mod 2)` already works; the condition `n | #k^×` would wrongly fail.
- `k = 𝔽₅`, `m = 2` (`μ₂ ⊂ 𝔽₅`) and `χ̄` with values in `(𝔽₅^×)² = {±1}`: the square roots of `−1` are `±2 ∈ 𝔽₅`, so a root valued in `ℚ̄₅` reduces into `𝔽₅`.
- `k = 𝔽₇`, `m = 3`, `χ̄` with value `3 ∉ (𝔽₇^×)³ = {±1}`: the values are not cubes, the hypothesis fails, and a cube root exists only in `𝔽_{7³}`.
- Without `μ_m ⊂ k` a root can leave `k`: for `k = 𝔽₅` and `m = 3`, `1 = 1³` but its other cube roots lie in `𝔽₂₅ − 𝔽₅`, so the reduction of a `ℚ̄₅`-valued cube root of the trivial character can take values outside `𝔽₅`; for `k = 𝔽₇`, which contains `μ₃`, all cube roots `1, 2, 4` of `1` lie in `k`.

### 6.6 Matching determinants at the coefficient prime `l`

Let `n = l^a m` with `l ∤ m`, `F` a CM field, `M = F(ζ_N)`, a zero-shaped datum of rank `n` as in §6.4, `r̄ : G_F → GL_n(𝔽_{l^s})` continuous, and `λ | l` a prime as in §6.4 (of `O`, or of `O⁺` with the real form for the self-dual datum of rank two) whose residue field `k(λ)` contains `𝔽_{l²}` and all `m`-th roots of all elements of `𝔽_{l^s}`. Then (i) `det r̄` takes values in `(k(λ)^×)^n`; (ii) `det V[λ]`, a character of `G_M`, takes values in `(k(λ)^×)^n`; (iii) `det V[λ] ⊗ (det r̄|_{G_M})⁻¹` takes values in `(k(λ)^×)^n`; (iv) `μ_m(𝔽̄_l) ⊂ k(λ)`. Hence §6.5 applies to (iii) with coefficient field `k(λ)`. (Qian, §4, arXiv v1 pp. 21–22, and Lemma 2.1, pp. 5–8; the published text requires `n | #k(λ)^×` here, which fails when `l | n`; the correct condition is on `m`.)

*Needs:* §§6.4, 6.5.

*Proof sketch.* (ii) is where the datum enters: for a datum that is not zero-shaped `det V[λ]` need not take values in `n`-th powers, as the rank-three example with `N = 7` and `l = 43` in §6.4 shows. For `x ∈ 𝔽_{l^s}^×` pick `y ∈ k(λ)` with `y^m = x`; since the `l^a`-power map is bijective on `k(λ)^×`, `y = z^{l^a}` and `x = z^n`. (ii) is §6.4 with `𝔽_{l²} ⊆ k(λ)`; (iii) follows; (iv) is the hypothesis at `x = 1`.

**Checks.**

- `n = l = 3`, `s = 1`: `m = 1`, every character into `(k(λ)^×)³ = k(λ)^×` has a cube root, and the published condition `3 | #k(λ)^×` fails for every `k(λ)` of characteristic three.
- If `k(λ)` lacks the `m`-th roots of some `x ∈ 𝔽_{l^s}`, (i) can fail: `l = 7`, `m = 3`, `𝔽_{l^s} = 𝔽₇`, `k(λ) = 𝔽_{49}`: `3 ∈ 𝔽₇` has cube roots in `𝔽_{7³}` only, and `𝔽_{49} ∌` them.
- The quadratic field `𝔽_{l²}` is needed for (ii) when `N − n` is odd (§6.4).

### 6.7 Matching determinants at an auxiliary prime `l′ ≡ 1 (mod N)`

For a zero-shaped datum of rank `n` with `N > 2n + 1`, let `l′` be an odd prime with `l′ ≡ 1 (mod N)` and `λ′ | l′` a prime as in §6.4 (of `O`, or of `O⁺` with the real form for the self-dual datum of rank two), so that `k(λ′) = 𝔽_{l′}` and `ℚ(ζ_N)_{λ′} = ℚ_{l′}`. For `v ∤ 2Nl′` with `q = #k(v)`: (i) `det(Frob_v | V_{λ′,0}) · q^{−n(n−1)/2} = (q^{(N−2n−1)/2} ∏_{b∈B} g(v, b))^n` with `q^{(N−2n−1)/2} ∏ g(v, b) ∈ ℤ_{l′}^×`; equivalently `det V_{λ′} ⊗ ε_{l′}^{n(n−1)/2}` takes that value at `Frob_v`. (ii) For every continuous `r̄′ : G_F → GL_n(𝔽_{l′})` with `det r̄′ = ε̄_{l′}^{−n(n−1)/2}`, the character `(det r̄′|_{G_M})⁻¹ ⊗ det V[λ′]` takes values in `(𝔽_{l′}^×)^n`. (iii) If moreover `l′ ≡ 1 (mod n)`, `μ_n ⊂ 𝔽_{l′}` and §6.5 applies with `m = n`; if instead `gcd(n, l′ − 1) = 1`, the `n`-th power map on `𝔽_{l′}^×` is bijective and roots exist without base change. (Qian, §4, arXiv v1 p. 22, and formula (3.1), pp. 17–18; the published argument uses only the weaker conclusion of Lemma 3.9 with values in `(𝔽_{l′²}^×)^n`, the sign `ε̄^{+n(n−1)/2}` for the symmetric power of `H¹`, and no congruence modulo `n`.)

*Needs:* §§1.4, 5.9, 6.2, 6.3, 6.5; Chebotarev Layer 10.

*Proof sketch.* (i) rearranges §6.2, which needs the zero-shaped hypothesis: `q^{n(N−n−2)/2} q^{−n(n−1)/2} = (q^{(N−2n−1)/2})^n`, an integral power since `N` is odd; the base is an `l′`-adic unit because `|g(v, b)|_{l′} = 1` for `v ∤ l′`. (ii) `ε_{l′}^{−n(n−1)/2}(Frob_v) = q^{n(n−1)/2}` for geometric Frobenius, so `(det r̄′)⁻¹` cancels the power of `q`; reduce and apply Chebotarev. (iii) The congruence is one sufficient way to meet §6.5; in general `d = gcd(n, l′ − 1)` is the relevant exponent.

**Checks.**

- For `r̄′ = Sym^{n−1} r̄_{E₀,l′}` with `r̄_{E₀,l′} = H¹_ét(E₀, 𝔽_{l′})` of determinant `ε̄^{−1}`, `det r̄′ = ε̄^{−n(n−1)/2}`, as required.
- With the Tate module instead of `H¹` the determinant is `ε̄^{+n(n−1)/2}`, and the cancellation in (ii) fails by `q^{n(n−1)}`.
- For `n = 3` and `l′ ≡ 2 (mod 3)`, cubing is bijective on `𝔽_{l′}^×` although `μ₃ ⊄ 𝔽_{l′}`: the congruence `l′ ≡ 1 (mod n)` is sufficient, not necessary.
- For `N = 401`, `n = 3`, `l′ = 3209`: `N > 2n + 1`, `(N − 2n − 1)/2 = 197`, and `3209 ≡ 2 (mod 3)`.

### 6.8 Frobenius polynomials of Dwork fibres are rational and independent of `λ`

Let `F/ℚ(ζ_N)` be a number field, `v` a finite place of `F` of residue characteristic `l′ ∤ N`, and `t ∈ T₀(O_{F_v})`. For every Dwork exponent datum and every finite place `λ` of `M` of residue characteristic different from `l′`, those above `2` and above the primes dividing `N` included, the polynomial `det(X − Frob_v | V^ℚ_{t,λ})` is independent of `λ`: for `λ ∤ N` it is the common good-place Frobenius polynomial of the eigenrealization in ModularityAndLanglandsExtensions §2.9, the places `λ | N` are covered by the same trace computation with the rational projector, and its coefficients lie in `O_M`, its roots being Frobenius eigenvalues on the cohomology of a smooth projective variety over a finite field. For every such `λ`: (1) `V^ℚ_{t,λ}` is unramified at `v`, and so is `W^ℚ_{t,λ}` for Qian's datum; (2) for a zero-shaped datum, where `Ψ_λ` is defined (§3.4), `Ψ_λ(Frob_v) ∈ M` and is independent of `λ`; (3) for Qian's datum, where `W` is defined (§3.6), `Q_v(X) = det(X − Frob_v | W^ℚ_{t,λ})` has coefficients in `M`, integral at every `λ` of residue characteristic different from `l′`, and independent of `λ`. Integrality of `Q_v` at `λ | l′` is §7.7. (Boxer–Calegari–Gee–Newton–Thorne, Proposition 4.2.5(1) and proof, arXiv v3 pp. 42–43, whose integrality argument through the twist needs the slope argument of §7.7; Katz, *Another look at the Dwork family*, Question 5.5, p. 97; Katz–Messing, Theorem 2.)

*Needs:* §§2.3, 3.1, 3.2, 3.4, 3.6; ModularityAndLanglandsExtensions §2.9; DeligneWeightsAndPurity §§7.15, 8.19; EtaleCohomologyFoundations §F.3; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3; SchemeAndStackFoundations §1.16; EtaleDualityAndPerverseSheaves §4.3(a), (d).

*Proof sketch.* (0) Since `F ⊇ ℚ(ζ_N)` and `l′ ∤ N`, every `h ∈ H₀` is defined over `k(v)`, and `h · Frob_v^r` acts on `H^*(Y_{t̄}, ℚ_l)`, `l ≠ l′`, as the geometric Frobenius of the twisted form of the special fibre by `h` (SchemeAndStackFoundations §1.16); its alternating trace is the number of `k(v)_r`-points of that form (InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3), independent of `l`. Outside the middle degree `H^{2j}` is spanned by the `j`-th power of the hyperplane class, fixed by `h`, with Frobenius eigenvalue `q_v^j` (EtaleDualityAndPerverseSheaves §4.3(a), (d)); so `tr(h · Frob_v^r | H^{N−2})` is an integer independent of `l`, and `tr(Frob_v^r | V^ℚ_{t,λ}) = #H₀⁻¹ ∑_h χ(h)⁻¹ tr(h · Frob_v^r | H^{N−2})` lies in `M` and is independent of `λ ∤ l′`, which in characteristic zero determines the characteristic polynomial. (1) `Y_t` is smooth and proper over `O_{F_v}`, so its cohomology is unramified. (2) For large `r` the sum `∑_{t∈U(k_r)} |tr(Frob_t | g*E_λ)|²` has leading term `q^{rn}`, because `g*E_λ` is pure of weight `n − 1` and geometrically irreducible (§§3.2, 3.6); so some point `t ∈ U(k_r)` has nonzero hypergeometric trace at `g(t)`; then `Ψ_λ(Frob_v)^r` is the ratio of the traces of `V^ℚ_λ` at `t` and of `E_λ` at `g(t)`, both in `M` and `λ`-independent (by (0) and §3.1). Two coprime values of `r` determine `Ψ_λ(Frob_v)`. (3) follows from the `λ`-independence of the untwisted polynomial and (2); integrality away from `l′` holds because `W^ℚ_{t,λ}` contains a `G_F`-stable `O_{M_λ}`-lattice, `G_F` being compact.

**Checks.**

- `deg Q_v = n`, and the roots of `Q_v` have complex absolute value `q_v^{(n−1)/2}` (purity of weight `n − 1`).
- For the trivial character of `H₀` and the Hesse pencil (`N = 3`) the untwisted polynomial at `t` is `X² − a X + q_v` with `q_v + 1 − a` the number of points of the reduced cubic `Y_t`: the same for every `λ`, with integer coefficients.
- `Ψ_λ(Frob_v)` itself can be a nonunit at `l′`: its absolute values are `q_v^{(N−n−1)/2}`, so `Q_v` need not be `l′`-integral a priori; this is why integrality at `λ | l′` waits for §7.7.

### Examples

For `N = 5`, `n = 2`, the self-dual datum `a = (1, 0, 0, 0, 4)`, `B = {2, 3}`, and `q ≡ 1 (mod 5)`: `det(Frob_v | V_{λ,0}) = q^{2(5−2−2)/2}(g(2)g(3))² = q·q² = q³ = q^{n(N−2)/2}`, as purity requires; and `g(2)g(3) = q` is rational, as §6.3 predicts.

### Dependencies

Layers 1–5; Mathlib Gauss sums; CharacterSumsOverFiniteFields §2.4; ArithmeticGaloisDuality §R02.4.6; Chebotarev Layer 10; ModularityAndLanglandsExtensions §2.9; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3; DeligneWeightsAndPurity §§7.15, 8.19; EtaleCohomologyFoundations §F.3; SchemeAndStackFoundations §1.16; EtaleDualityAndPerverseSheaves §4.3(a), (d).

## Layer 7: `p`-adic Hodge theory and local monodromy of the fibres

The de Rham cohomology of the Dwork pencil carries the same `H₀`-decomposition as its étale cohomology, twisted by the coefficient embedding. At the Fermat point the Hodge grade of each eigenline is read from its exponent vector, and for zero-shaped data the grades of the `n` lines are consecutive. Through the comparison theorems this gives consecutive labelled Hodge–Tate weights for every fibre, recognises the comparison character as an algebraic Hecke character, and makes `W` a weakly compatible system with weights `{0, …, n − 1}`. Locally the fibres are crystalline at good reduction, ordinary near the Fermat point when `l ≡ 1 (mod N)`, of prescribed inertia when `l ≡ −1 (mod N)`, Steinberg near infinity away from the coefficient prime, and generically crystalline ordinary.

### 7.1 Twisted de Rham eigenspaces of the Dwork family

Let `H_dR = H^{N−2}_dR(Y/(T₀ × ℚ(ζ_N)))`, locally free with Hodge filtration `F^j` by local direct summands. For `σ ∈ Gal(ℚ(ζ_N)/ℚ)` put `H_{dR,σ} = H_dR ⊗_{σ⁻¹, ℚ(ζ_N)} ℚ(ζ_N)` (the right factor as coefficients) and `V_{dR,σ} = e_χ H_{dR,σ}`, the `χ`-eigenpart for `H₀` acting through the coefficients, with filtration `F^jV_{dR,σ}` and graded pieces `gr^j`. At `t = 0`, `V_{dR,σ,0} = ⊕_i V_{dR,σ,i}` under the characters `χᵢ` of `H`. For `K/ℚ_l` finite containing the image of `ℚ(ζ_N)`, a finite place `λ | l` of `M` (of any residue characteristic `l`) and `V = V^ℚ_{t,λ} ⊗_{M_λ} E`, `D_dR,K(V) = (B_dR ⊗_{ℚ_l} V)^{G_K}` is a filtered module over `K ⊗_{ℚ_l} E`; after enlarging `E` to `E′` containing every embedding of `K`, its `σ`-labelled component `D_dR,K(V) ⊗_{K⊗E, σ⊗ι} E′` is identified, by the equivariant de Rham comparison, with the corresponding coefficient-conjugate `χ`-part of `H^{N−2}_dR(Y_t/K) ⊗_{K,σ} E′`. In fixed global coordinates this is the `σ⁻¹χ` convention of the first part. (Qian, before Lemma 3.9, arXiv v1 pp. 18–20; Barnet-Lamb–Geraghty–Harris–Taylor, §5, the spaces `U_{DR,σ}`, p. 35.)

The construction has the following API.

- `V_{dR,σ}` and each `gr^j V_{dR,σ}` are locally free on `T₀ × ℚ(ζ_N)`; `V_{dR,σ}` has rank `n`.
- At `t = 0`, `V_{dR,σ,0} = ⊕_i V_{dR,σ,i}` with one-dimensional summands for `i ∈ B` and zero otherwise.
- The `σ`-labelled component of `D_dR,K(V^ℚ_{t,λ} ⊗ E)` is, as a filtered `E′`-space, the transported `χ`-part of `H_dR(Y_t/K) ⊗_{K,σ} E′`.
- Formation is compatible with base change `T′ → T₀` and with extension of `K`.

*Needs:* §§2.3, 2.6; ComplexComparisonPartII §C5.3 (`relativeHodgeBundles`); PadicHodgeTheory §§3.2, 3.3, 8.1, 8.2.

*Proof sketch.* Relative Hodge bundles of a smooth proper family in characteristic zero are locally free, the Hodge spectral sequence degenerates, and character idempotents cut out locally free summands with the induced filtration (ComplexComparisonPartII §C5.3). The filtered de Rham comparison for proper smooth varieties over `l`-adic fields (PadicHodgeTheory §8.1) is natural, hence `H₀`-equivariant (§8.2); taking `χ`-parts introduces the twist by `σ`.

**Checks.**

- For `σ = id` and `t = 0`, `V_{dR,id,0} = ⊕_{i∈B} V_{dR,i}` with one-dimensional summands.
- For Qian's datum with `n = 3`, `V_{dR,σ,0}` has the three nonzero lines `V_{dR,σ,1}`, `V_{dR,σ,2}`, `V_{dR,σ,N−3}`.
- For `σ ≠ id`, `V_{dR,σ}` is the `σ⁻¹χ`-part, not the `χ`-part, of `H_dR`; the untwisted `χ`-part has different Hodge numbers in general, and comparing `D_dR,σ` with it gives wrong Hodge–Tate weights.
- No `K`-linear structure on `V` is used: `V` is an `E`-vector space with a `G_K`-action, and `K` enters only through `D_dR,K`.

### 7.2 Hodge grades of the Fermat eigenlines

Write `σ⁻¹(ζ_N) = ζ_N^a` and `⟨x⟩` for the representative of `x mod N` in `{1, …, N}`. For a zero-shaped datum, `V_{dR,σ,i} ≠ 0` exactly when `i ∈ B`; it is then one-dimensional, with its only nonzero graded piece in degree `M(a) + #{b ∈ B : ⟨ab⟩ < ⟨ai⟩}`, where `M(a) = (∑_j ⟨a·a_j + 1⟩)/N − 1`; equivalently the degree is `(∑_j ⟨a(a_j + i)⟩)/N − 1`. For the self-dual data the degree is `(N − n − 3)/2 + #{b ∈ B : ⟨ab⟩ ≤ ⟨ai⟩}`. (Qian, Lemma 3.9(1) with proof, arXiv v1 pp. 19–20, published Lemma 3.10; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 5.2(1) and proof, p. 36.)

*Needs:* §§1.4, 2.1, 7.1.

*Proof sketch.* After base change along `τ₀σ⁻¹` to `ℂ`, `gr^j V_{dR,σ,i}` is the eigenspace of `H^{j, N−2−j}(Y₀(ℂ))` for the character `(a(a_j + i))_j` of `H`; by §2.1 it is nonzero exactly when all `a(a_j + i) ≢ 0`, i.e. `i ∈ B`, in degree `j` with `j + 1 = ∑⟨a(a_j + i)⟩/N`. Put `G(d) = ∑_j ⟨a·a_j + d⟩/N − 1`. From `d` to `d + 1` (`1 ≤ d < N`) each of the `N` representatives increases by one except those equal to `N`, which wrap to `1`; with `w` wrapping entries the sum changes by `N − wN`, so `G` changes by `1 − w`. An entry equals `N` exactly when `a·a_j + d ≡ 0`. If `d ≡ ab` with `b ∈ B`, no entry does (`w = 0`) and `G` increases by one; otherwise `−d/a` is a nonzero residue occurring among the `a_j`, exactly once for a zero-shaped datum (the zero entries give `d ≢ 0`), so `w = 1` and `G` is unchanged. Induct from `d = 1`.

**Checks.**

- For `σ = id` (`a = 1`) and Qian's datum with `n = 3`, the lines `i = 1, 2, N − 3` have grades `M(1), M(1) + 1, M(1) + 2`.
- For the self-dual datum with `N = 5`, `n = 2`, `a = 1`: the grades of `i = 2, 3` are `(5 − 2 − 3)/2 + 1 = 1` and `0 + 2 = 2`, matching the direct computation `10/5 − 1` and `15/5 − 1` of Layer 2.
- The wrap count runs opposite to the grade: for the same datum `(1, 0, 0, 0, 4)` and `a = 1`, the representatives at `d = 1, 2, 3` are `(2, 1, 1, 1, 5)`, `(3, 2, 2, 2, 1)`, `(4, 3, 3, 3, 2)`, with sums `10, 10, 15` and grades `1, 1, 2`; the step `1 → 2` (`1 ∉ B`) has one wrapping entry and keeps the grade, the step `2 → 3` (`2 ∈ B`) has none and raises it.
- For `N = 7`, `n = 3` the rank-three datum `a = (0, 0, 0, 1, 3, 5, 5)` is not zero-shaped (zero occurs three times, `5` twice); its index set is `{1, 3, 5}` and for `σ = id` the vectors `a + 1`, `a + 3`, `a + 5` have `∑⟨·⟩ = 21, 21, 28`, so the grades are `2, 2, 3`: not consecutive.

### 7.3 Consecutive Hodge numbers of the Dwork motives

For each `σ` and a zero-shaped datum, `gr^j V_{dR,σ}` is locally free of rank one on `T₀ × ℚ(ζ_N)` for `M(a) ≤ j ≤ M(a) + n − 1` and zero otherwise; `V_{dR,σ}` is locally free of rank `n`. For the self-dual data the range is `(N − 1 − n)/2 ≤ j ≤ (N + n − 3)/2`. (Qian, Lemma 3.9(2) with proof, arXiv v1 pp. 19–20; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 5.2(2), p. 36.)

*Needs:* §§7.1, 7.2; ComplexComparisonPartII §C5.3.

*Proof sketch.* `gr^j V_{dR,σ}` is locally free (§7.1), so its rank is computed at `t = 0`, where the grades of the `n` eigenlines run through `M(a), …, M(a) + n − 1` as `i` runs through `B` ordered by `⟨ai⟩` (§7.2).

**Checks.**

- Every `gr^j` has rank at most one: the Hodge numbers are regular.
- For the self-dual datum with `N = 5`, `n = 2` the range is `1 ≤ j ≤ 2`, two grades of rank one.
- The ranks sum to `n`: `∑_j rank gr^j = n` for every `σ`.

### 7.4 Dwork fibres are de Rham with consecutive labelled weights

Let `v | l` be a place of `F ⊇ ℚ(ζ_N)` and `t ∈ T₀(F_v)`. (1) For a zero-shaped datum and every finite place `λ | l` of `M` (`l = 2` and `l | N` included), `V^ℚ_{t,λ}` is a de Rham representation of `G_{F_v}`, and for an embedding `σ : F_v ↪ ℚ̄_l` with `σ⁻¹(ζ_N) = ζ_N^a` on `ℚ(ζ_N)` its `σ`-labelled Hodge–Tate weights (cohomological convention) are `M(a), M(a) + 1, …, M(a) + n − 1`, each with multiplicity one. (2) For the self-dual data and every finite place `λ | l` of `M⁺`, the rational real form `V^ℚ_{t,λ}((N − 1 − n)/2)` of §2.5 is de Rham with Hodge–Tate numbers `{0, …, n − 1}` at every embedding. The representation is of the local group `G_{F_v}`, not of `G_F`. (Qian, Lemma 3.10(1), arXiv v1 pp. 20–21, published Lemma 3.11; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 5.3(1), p. 37.)

*Needs:* §§7.1, 7.3; PadicHodgeTheory §§3.2, 3.3, 8.1.

*Proof sketch.* `V^ℚ_{t,λ}` is a direct summand of the étale cohomology of the smooth proper `Y_t/F_v`, which is de Rham by PadicHodgeTheory §8.1 for every `l`; the labelled graded pieces are those of §7.3 by §7.1. In PadicHodgeTheory's sign the weights are `−M(a), …, −M(a) − n + 1`. For (2), the Tate twist by `(N − 1 − n)/2` shifts the self-dual range of §7.3 to `0, …, n − 1`.

**Checks.**

- For the self-dual datum with `N = 5`, `n = 2`, the weights of `V_{λ,t}` are `{1, 2}` and those of `V_{λ,t}(1)` are `{0, 1}`.
- The weights depend on `σ` through `a`: for Qian's datum `M(a)` varies with `a ∈ (ℤ/Nℤ)^×`, which is why `W` (§7.6) is needed to obtain weights independent of the embedding.
- In PadicHodgeTheory's convention the same fibre has weights `{−1, −2}` for the self-dual example; reading them with the wrong sign would give weights decreasing in `j`.

### 7.5 The comparison character is an algebraic Hecke character

For a zero-shaped datum there is an algebraic Hecke character `Ψ : ℚ(ζ_N)^×\𝔸^×_{ℚ(ζ_N)} → ℂ^×` of type `A₀`, unramified away from `N`, with values of its finite part in `M`, such that for every finite place `λ` of `M` (those above `2` and above the primes dividing `N` included) the character `Ψ_λ` of §3.4 is the `λ`-adic character attached to `Ψ`; moreover, for every number field `F ⊇ ℚ(ζ_N)`, `Ψ_λ|_{G_{F_v}}` is crystalline at every place `v | l` of `F` with `l ∤ N` (`l = 2` included), de Rham at every `v | l`, with `σ`-labelled weight `M(a_σ)`, and `Ψ·c(Ψ)` corresponds to `ε^{n+1−N}`, so `Ψ` is pure of weight `N − n − 1`. (Boxer–Calegari–Gee–Newton–Thorne, Lemma 4.2.4 and proof, arXiv v3 pp. 41–42, which obtains `Ψ` from Henniart's theorem on compatible characters; here the hypotheses of the recognition theorem are verified directly.)

*Needs:* §§3.4, 3.5, 6.8, 7.4; PadicHodgeTheory §§3.3, 3.6; PotentialModularityAndCompatibleSystems §1.9; GlobalNumberFields Layers 9–10.

*Proof sketch.* `Ψ_λ` is a character of `π₁(Spec R₀[1/l])`, hence of `G_{ℚ(ζ_N)}` unramified outside `Nl`. At `v | l`, restrict §3.5(2) to a point `t ∈ U(F_v)`: `Ψ_λ^n|_{G_{F_v}} = det V^ℚ_{t,λ} ⊗ ε^{n(n−1)/2}` is de Rham with `σ`-labelled weight `n M(a_σ) + n(n−1)/2 − n(n−1)/2 = n M(a_σ)` (§7.4). By PadicHodgeTheory §3.6, `Ψ_λ^n` agrees with `∏_τ τ^{−nM(a_τ)}` (in the appropriate reciprocity convention) on an open subgroup of the local units; so `Ψ_λ ∏_τ τ^{M(a_τ)}` has finite order there, `Ψ_λ` is potentially crystalline, hence de Rham, with weight `M(a_σ)`. PotentialModularityAndCompatibleSystems §1.9 makes the finitely ramified de Rham character `Ψ_λ` the avatar of a type-`A₀` Hecke character `Ψ^{(λ)}`; by §6.8(2) the values `Ψ_λ(Frob_v)` lie in `M` and do not depend on `λ`, so all `Ψ^{(λ)}` coincide with one `Ψ`, unramified away from `N` because each `Ψ_λ` is unramified outside `Nl`. This holds at every finite place `λ`, since §§3.4, 6.8 and 7.4 do. Crystallinity at `v | l ∤ N` follows from unramifiedness of `Ψ` there (PotentialModularityAndCompatibleSystems §1.9); the weight relation is §3.5(1). Nothing here uses §§7.6–7.13.

**Checks.**

- Weight check: `V_λ` has weight `N − 2` and `E_λ` weight `n − 1`, so `Ψ` has weight `N − n − 1`; for Qian's datum with `n = 3`, `N = 401` it is `397`.
- The determinant relation `nM(a_σ) = (∑ weights of V) − n(n−1)/2` fixes `M(a_σ)` as an integer, which is what makes `Ψ_λ` Hodge–Tate rather than of fractional Sen weight.
- Compatible rational Frobenius values alone do not imply de Rhamness at `l`: the character `⟨χ_l⟩^s` with `s ∈ ℤ_l − ℤ` has `ℚ_l`-valued Frobenius values but no Hodge–Tate periods; the determinant argument is what supplies de Rhamness.

### 7.6 The twisted fibres have Hodge–Tate weights `{0, …, n − 1}`

For Qian's datum, every finite place `λ | l` of `M` (`l = 2` and `l | N` included), `v | l` and `t ∈ T₀(F_v)`, `W^ℚ_{t,λ}` is de Rham with `HT_σ(W^ℚ_{t,λ}) = {0, 1, …, n − 1}` for every embedding `σ`. In PadicHodgeTheory's convention its weights are `{0, −1, …, 1 − n}`. (Boxer–Calegari–Gee–Newton–Thorne, Proposition 4.2.5(2) with proof, arXiv v3 pp. 42–43.)

*Needs:* §§3.6, 7.4, 7.5; PadicHodgeTheory §3.3.

*Proof sketch.* `W^ℚ_{t,λ} = V^ℚ_{t,λ} ⊗ Ψ_λ⁻¹` is de Rham by §§7.4–7.5, with weights shifted by `−M(a_σ)`; equivalently, `det W^ℚ_λ ≅ M_λ(n(1 − n)/2)` (§3.6) gives `nM′_σ + n(n − 1)/2 = n(n − 1)/2` for the shift `M′_σ`, so `M′_σ = 0`.

**Checks.**

- For `n = 3` and every embedding, the weights of `W_{t,λ}` are `{0, 1, 2}`, summing to `3 = n(n − 1)/2`.
- `W_{t,λ}` and `V_{t,λ}` differ whenever `M(a_σ) ≠ 0` for some `σ`.
- In LocalGaloisDeformationRings' `IsOrdinaryOfWeight` normalisation the corresponding weight is `λ_{τ,i} = 0` for all `i`.

### 7.7 Crystallinity and Frobenius at good-reduction fibres

Let `v | l`, `l ∤ N` (`l = 2` included), `λ | l` a finite place of `M`, and `t ∈ O_{F_v}` with `t^N − 1 ∈ O_{F_v}^×`. Then `V^ℚ_{t,λ}` and `W^ℚ_{t,λ}` are crystalline representations of `G_{F_v}`; the characteristic polynomial of `φ^f`, `f = [k(v) : 𝔽_l]`, on `D_cris(W^ℚ_{t,λ})` (on any coefficient component) is the polynomial `Q_v(X)` of §6.8 of the special fibre; and `W^ℚ_{t,λ}` is ordinary of weight `0` exactly when the roots of `Q_v` in `ℚ̄_l` have `l`-adic valuations `0, f, 2f, …, (n − 1)f`. For the self-dual data the rational real form `V^ℚ_{t,λ}((N − 1 − n)/2)`, `λ | l` a place of `M⁺`, is crystalline under the same condition. Moreover `Q_v` is integral at `λ | l`, so the polynomial of §6.8 lies in `O_M[X]`. No crystallinity is claimed at the punctures or for `t` merely integral. (Qian, Lemma 3.10(2), arXiv v1 pp. 20–21; Boxer–Calegari–Gee–Newton–Thorne, Proposition 4.2.5(2) with proof, arXiv v3 pp. 42–43; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 5.3(2), p. 37.)

*Needs:* §§6.8, 7.5, 7.6; PadicHodgeTheory §§3.4, 3.6, 8.1; PadicDifferentialEquationsAndRigidCohomology §RD.7.7; SchemeAndStackFoundations §1.16; LocalGaloisDeformationRings §1.7.

*Proof sketch.* `Y_t` has good reduction over `O_{F_v}`; PadicHodgeTheory §8.1, which has no restriction on `l`, makes its cohomology crystalline with `D_cris` the crystalline cohomology of the special fibre, compatibly with `H₀`; `Ψ_λ` is crystalline at `v` (§7.5). For `h ∈ H₀`, defined over `k(v)` and commuting with Frobenius, `h·φ^f` on crystalline cohomology is the crystalline Frobenius of the twisted form of the special fibre by the cocycle defined by `h`, a smooth projective hypersurface over `k(v)` (SchemeAndStackFoundations §1.16), so Katz–Messing (§RD.7.7) for the twisted forms and the character projector identify the `χ`-part with the `ℓ`-adic polynomial; twisting by `Ψ` gives `Q_v`. The slope criterion of PadicHodgeTheory §3.6 with the consecutive jumps of §7.6 gives the ordinarity criterion. Every filtration jump of `W` is `≥ 0`, so weak admissibility (PadicHodgeTheory §3.4) applied to the lowest-slope `φ`-stable subobject makes all slopes `≥ 0`, i.e. `Q_v` is `λ`-integral; with §6.8 this gives `O_M`-integrality.

**Checks.**

- If the special-fibre point has `Q_x` with normalised `l`-adic slopes `0, 1, …, n − 1`, `W^ℚ_{t,λ}` is crystalline ordinary.
- For `N = 401`, `n = 3`, `t = 0` and `λ | 2`, a place outside the integral coefficients, `t^N − 1 = −1` is a unit at every `v | 2`, so `W^ℚ_{0,λ}` is crystalline at the places above `2`: the `2`-adic member of the system of §7.11 is crystalline at good reduction.
- For `t` with `t^N ≡ 1` modulo the maximal ideal the special fibre is singular and the statement does not apply.
- Integrality cannot be read from the untwisted polynomial: `Ψ_λ(Frob_v)` has absolute values `q_v^{(N−n−1)/2}` and can be a nonunit at `l`; the weak admissibility argument is what gives integrality of `Q_v` at `λ | l`.

### 7.8 Ordinarity near the Fermat point when `l ≡ 1 (mod N)`

Let `a` be a zero-shaped datum, `F ⊇ ℚ(ζ_N)` a number field, `l ≡ 1 (mod N)` a prime, `λ | l` a prime of `O` (so `ℚ(ζ_N)_λ = ℚ_l`), `v | l` a place of `F` and `t ∈ 𝔪_{F_v}`. Then `V_{λ,t}` is ordinary of weight `μ` with `μ_{σ,i} = M(a_σ)` for all `i` (LocalGaloisDeformationRings' `IsOrdinaryOfWeight`, cohomological weights `M(a_σ), …, M(a_σ) + n − 1`), where `σ⁻¹(ζ_N) = ζ_N^{a_σ}`. For the self-dual data `V_{λ,t}((N − 1 − n)/2)` is ordinary of weight `0`, and its reduction at `t = 0` is `𝔽_l ⊕ 𝔽_l(−1) ⊕ ⋯ ⊕ 𝔽_l(1 − n)` as a module for inertia. (Qian, Lemma 3.10(3), arXiv v1 pp. 20–21, and Lemma 2.4, pp. 9–10; Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 5.3(3)–(4) and proof, pp. 37–38.)

*Needs:* §§2.6, 7.2, 7.4, 7.7; PadicHodgeTheory §§3.6, 8.1; LocalGaloisDeformationRings §1.7.

*Proof sketch.* For `t ∈ 𝔪_{F_v}`, `Y_t` and `Y₀` have the same special fibre, so `D_cris(V_{λ,t}) ≅ D_cris(V_{λ,0})` as `φ`-modules, and their labelled weights agree (§7.4). By the slope criterion (PadicHodgeTheory §3.6) `V_{λ,t}` is ordinary exactly when `V_{λ,0}` is. `V_{λ,0} ⊗ ℚ̄_l = ⊕_{i∈B} V_{λ,i}`, each a crystalline character of `G_{ℚ_l}` with weight `M(a_σ) + #{b : ⟨a_σb⟩ < ⟨a_σi⟩}` (§7.2), so as an inertia module it is `⊕_{i=0}^{n−1} ℚ̄_l(−M(a_σ) − i)`: an ordinary flag.

**Checks.**

- For the self-dual data and `l ≡ 1 (mod N)` the inertia action on the Fermat fibre modulo `λ` is `𝔽_l ⊕ 𝔽_l(−1) ⊕ ⋯ ⊕ 𝔽_l(1 − n)` after the Tate twist.
- For `l ≢ 1 (mod N)` the Fermat eigenlines are not individually defined over `ℚ_l`, and §7.9 describes the inertia instead.
- For `t` a unit (not in `𝔪`), the special fibre differs from the Fermat fibre and ordinarity is not asserted.
- The zero-shaped hypothesis is needed. For `N = 7`, the rank-three datum `a = (0, 0, 0, 1, 3, 5, 5)` (not zero-shaped, §7.2), `l = 29 ≡ 1 (mod 7)` and `σ = id`, `M(1) = (1 + 1 + 1 + 2 + 4 + 6 + 6)/7 − 1 = 2`, so the formula would give the weights `{2, 3, 4}`, of sum `9`; the Fermat eigenlines have grades `2, 2, 3` (§7.2), of sum `7`, and these are the labelled weights of `V_{λ,t}`, with a repeated weight that the regular weights `M(a_σ), …, M(a_σ) + n − 1` exclude. For the zero-shaped self-dual datum `a = (1, 0, 0, 0, 4)`, `N = 5`, the formula gives `M(1) = (2 + 1 + 1 + 1 + 5)/5 − 1 = 1` and the weights `{1, 2}`, the grades `10/5 − 1` and `15/5 − 1` computed in §7.2.

### 7.9 Inertia on the Fermat fibre when `l ≡ −1 (mod N)`

Let `n > 2`, `l > n` a prime with `l ≡ −1 (mod N)`, `v | l` a place of `ℚ(ζ_N)` (so `ℚ(ζ_N)_v` is the unramified quadratic extension of `ℚ_l`, `e = 1`), `λ | l` of `M`, and `τ, cτ : k(v) → k(λ) = 𝔽_{l²}`. With geometric Artin reciprocity put `ω_τ = τ ∘ Art⁻¹` on inertia and `θ_τ = ω_τ⁻¹`. Then `θ_τ θ_{cτ} = ε̄_l⁻¹` and `W̄_{0,λ}|_I ≅ ⊕_{i=1}^n θ_τ^{i−1} θ_{cτ}^{n−i}`. For the self-dual rank-two family the analogous statement is Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 5.3(5), with the same sign translation. (Boxer–Calegari–Gee–Newton–Thorne, Lemma 4.4.4 with proof, arXiv v3 p. 48, whose printed formula uses the direct characters `ω`; its §1.6, p. 12, fixes Artin reciprocity; Caraiani–Emerton–Gee–Savitt, §1.4, Lemma 1.4.1, pp. 5–6.)

*Needs:* §§2.6, 3.6, 5.7, 7.6; PadicHodgeTheory §6.1 (Fontaine–Laffaille); LocalGaloisDeformationRings §6.19.

*Proof sketch.* `H` extends the `H₀`-action on the Fermat fibre and decomposes `W̄_{0,λ}` into `n` lines, the `Ψ⁻¹`-twists of the `H`-eigenspaces in `H^{N−2}`, each crystalline of rank one. The skew-Hermitian pairing (§5.7) is orthogonal for this decomposition, so `W̄_{0,λ,j}^c ≅ W̄_{0,λ,j}^∨ ε̄^{1−n}`. Order the lines by their `τ`-labelled filtration jumps `i − 1`; the paired conjugate jump is `n − i`. Rank-one Fontaine–Laffaille in the range `0, …, n − 1 < l` gives `θ_τ^{i−1}θ_{cτ}^{n−i}`; the determinant `(θ_τθ_{cτ})^{n(n−1)/2} = ε̄_l^{−n(n−1)/2}` agrees with §3.6.

**Checks.**

- For `n = 3` the summands are `θ_{cτ}²`, `θ_τθ_{cτ}`, `θ_τ²`, with determinant `ε̄_l⁻³`; the printed positive powers of `ω` would give `ε̄_l³`, and for `l > 7` these differ.
- The cohomological `H¹` of a supersingular elliptic curve has inertia `ω₂⁻¹ ⊕ ω₂^{−l}`; this is the rank-two self-dual boundary, not a case of `W`.
- `l > n` keeps the jumps `0, …, n − 1` inside the Fontaine–Laffaille range.

### 7.10 Maximal unipotent local monodromy at places with `v(t) < 0`

Let `v` be a finite place of `F ⊇ ℚ(ζ_N)` whose residue characteristic is prime to `N`, and `λ′` a prime of odd residue characteristic `l′ ∤ N`, `l′ ≠ char k(v)`. (1) If `t ∈ O_{F_v}` and `t^N − 1` is a unit, `V_{λ′,t}` is unramified at `v`. (2) For Qian's datum or the self-dual datum, if `v(t) < 0`, `V_{λ′,t}|_{G_{F_v}}` is tamely ramified, inertia acts unipotently through `exp(t_{l′}(σ)N)`, and the monodromy operator `N` of its Weil–Deligne representation has minimal polynomial `X^n`; for the self-dual data a Frobenius lift has characteristic polynomial `(X − α)(X − αq)⋯(X − αq^{n−1})` with `α = ±1` after the twist `(N − 1 − n)/2`, i.e. the Weil–Deligne representation is an unramified twist of Steinberg. The hypothesis `v(t) < 0` is necessary. (Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 5.1, pp. 34–35.)

*Needs:* §4.6; LefschetzPencilsAndVanishingCycles §§0.5, 1.1, 1.6; ArithmeticGaloisRepresentations §2.4; EtaleCohomologyFoundations §F.0.2.

*Proof sketch.* (1) is smooth proper base change. (2) Near `t = ∞` the family over the punctured disc has geometric local monodromy a single unipotent Jordan block over `ℚ̄_{l′}` for every conjugate character (§4.6). The Galois action of `G_{F_v}` on the fibre at `t` factors through the local fundamental group of the punctured disc, inertia mapping to the `d`-th power of the local monodromy generator, `d = −v(t) > 0`, still a single block in characteristic zero. The Frobenius eigenvalues follow from the weight filtration of a single Jordan block and purity.

Step (2) uses the requirement `gap:tame-point-specialization` stated in the contract with LefschetzPencilsAndVanishingCycles.

**Checks.**

- For the self-dual data with `n = 2` and `v(t) < 0`, `V_{λ′,t}` is an unramified twist of Steinberg at `v`, as for an elliptic curve with multiplicative reduction.
- For `t = 0` with residue characteristic prime to `N` the fibre has good reduction, so the representation is unramified with `N = 0`: maximal monodromy needs `v(t) < 0`.
- For `v(t) = −d`, `N` is `d` times the logarithm of the local monodromy; its nilpotency order is `n` for every `d ≥ 1`.
- The datum hypothesis in (2) is needed: for `N = 5` and the rank-two datum `a = (1, 2, 2, 0, 0)`, which is not zero-shaped, the local monodromy at `t = ∞` consists of two Jordan blocks of size one (§8.1), so for `v(t) < 0` the monodromy operator is `0`, with minimal polynomial `X`, not `X²`.

### 7.11 The Dwork fibres form weakly compatible systems

Let `F/ℚ(ζ_N)` be a number field, `t ∈ T₀(F)` and `S` the set of finite places `v` with `v | N` or `t ∉ T₀(O_{F_v})`. Then, for Qian's datum, `(M, S, {Q_v(X)}_{v∉S}, {(W^ℚ_{t,λ})^{ss}}_λ, {{0, 1, …, n − 1}}_τ)`, with `λ` running over all finite places of `M` (those above `2` and above the primes dividing `N` included), is a weakly compatible system of `l`-adic representations of `G_F` over `M` of rank `n`, pure of weight `n − 1`. Likewise, for the same datum, the semisimplifications `{(V^ℚ_{t,λ})^{ss}}_λ` of the untwisted fibres, over all finite places of `M`, form a weakly compatible system with purity weight `N − 2` and Hodge–Tate multisets `{M(a_τ), …, M(a_τ) + n − 1}`; for the self-dual data the semisimplifications of the rational real forms `V^ℚ_{t,λ}` of §2.5, over all finite places `λ` of `M⁺`, form a system over `M⁺`, each `V^ℚ_{t,λ}` carrying the alternating pairing of §2.5 before semisimplification. The integral and residual forms `W_{t,λ}`, `W̄_{t,λ}` used in Layers 5 and 9 exist only for `λ ∤ 2N`; no member of the systems is omitted at the other places. Compatibility is asserted only for the semisimplifications: semisimplicity of the fibres themselves is a separate question, not settled here, and the characteristic polynomials, purity and Hodge multisets do not decide it. (Boxer–Calegari–Gee–Newton–Thorne, Proposition 4.2.5(3), arXiv v3 p. 42; Barnet-Lamb–Gee–Geraghty–Taylor, §5.1, arXiv v4.)

*Needs:* §§2.3, 2.5, 3.6, 6.8, 7.4–7.7; PotentialModularityAndCompatibleSystems §1.1; DeligneWeightsAndPurity §7.15.

*Proof sketch.* For every finite place `λ` of `M`, away from `S` and the residue characteristic of `λ`, `W^ℚ_{t,λ}` is unramified with Frobenius polynomial `Q_v`, independent of `λ` (§6.8). At `v | l` with `v ∉ S` (so `l ∤ N`; `l = 2` included), `W^ℚ_{t,λ}` is crystalline with weights `{0, …, n − 1}` and the same Frobenius polynomial, now integral (§7.7); at every `v | l` it is de Rham (§7.6), also when `l | N`, where all places above `l` lie in `S`. Purity of weight `n − 1` is Deligne's theorem for the smooth fibres twisted by `Ψ` of weight `N − n − 1`.

**Checks.**

- `deg Q_v = n` and `Q_v(0) = ±q_v^{n(n−1)/2}`, as the determinant `ε^{−n(n−1)/2}` requires.
- For `v ∈ S` above a prime with `v(t) < 0`, `W^ℚ_{t,λ}` is ramified (§7.10) and `v` must lie in `S`.
- For `N = 401`, `n = 3` and `t = 0 ∈ T₀(F)`, `S` is the set of places above `401`. The system has rank-three members at the places `λ | 2` and `λ | 401` of `M`: the `2`-adic member is crystalline at the places above `2` (§7.7), and the `401`-adic member is de Rham at the places above `401` (§7.6), although those places lie in `S`. A family indexed only by `λ ∤ 2N` lacks both and is not a weakly compatible system; enlarging `S` does not remove the requirement.
- The system of `V^{ss}_{t,λ}` has embedding-dependent weights, so it is not regular with a single weight set unless `M(a_τ)` is independent of `τ`.
- Characteristic polynomials and purity do not see semisimplicity: the Frobenius matrices `[[1, 1], [0, 1]]` and `[[1, 0], [0, 1]]` both have characteristic polynomial `(X − 1)²`, and only the second is semisimple; this is why the members of the system are the semisimplifications.

### 7.12 Generic slopes of indecomposable lisse sheaves

Let `X` be a smooth irreducible variety over a finite field of characteristic `p` and `E` a lisse `ℚ̄_{l′}`-sheaf of rank `n` on `X` (`l′ ≠ p`) whose Frobenius characteristic polynomials have algebraic coefficients. Fix a valuation `v : ℚ̄^× → ℚ` with `v(p) = 1`, and for `x ∈ |X|` let `deg x = [κ(x) : 𝔽_p]` be the degree of its residue field over the prime field (not over the finite ground field of `X`); the slopes `a^x_1 ≥ ⋯ ≥ a^x_n` at `x` are the values `v(α)/deg x` for the eigenvalues `α` of geometric Frobenius at `x`. (i) There are rational numbers `a^η_1 ≥ ⋯ ≥ a^η_n` such that the set of `x` with `a^x_i = a^η_i` for all `i` is nonempty and its intersection with the closed points of every curve is open (possibly empty); (ii) `∑_{i≤r} a^x_i ≤ ∑_{i≤r} a^η_i` for all `x` and `r`; (iii) if `E` is indecomposable then `a^η_i − a^η_{i+1} ≤ 1` for `1 ≤ i < n`. (Drinfeld–Kedlaya, §1.3.2 for the normalisation and Theorem 1.3.3, pp. 4–5, proof in §5, pp. 11–12, arXiv v11; Boxer–Calegari–Gee–Newton–Thorne, proof of Proposition 4.2.6, arXiv v3 pp. 43–45.)

*Needs:* PadicDifferentialEquationsAndRigidCohomology §§RD.2.3, RD.3.34, RD.3.37, RD.3.43, RD.5.8, RD.7.7.

*Proof sketch.* On a smooth curve, Drinfeld–Kedlaya pass to crystalline companions of the irreducible constituents (Abe) restrict them to convergent `F`-isocrystals (§RD.3.37), where indecomposability is preserved because the restriction is fully faithful (§RD.5.8), and apply their slope theorem for convergent `F`-isocrystals (Theorem 1.1.5), handling indecomposable extensions in §5.2; in higher dimension they restrict to suitable curves (§5.3). (ii) is Grothendieck's specialization theorem for Newton polygons (§RD.3.43). No global crystalline companion on `X` is assumed, and the curve must be chosen to meet the needed open.

This target uses the requirement `gap:curve-crystalline-companions` stated in the contract with PadicDifferentialEquationsAndRigidCohomology, in the curve case.

**Checks.**

- For `E` pure of weight `n − 1` with slopes `0, 1, …, n − 1` at one point, (ii) and (iii) force the generic slopes to be `0, 1, …, n − 1`.
- For `E = ℚ̄_{l′} ⊕ ℚ̄_{l′}(−2)`, decomposable, the slopes `0, 2` differ by two: (iii) needs indecomposability.
- Both normalisations are needed in (iii). The Kummer extension of `ℚ̄_{l′}(−1)` by `ℚ̄_{l′}` on `𝔾_m` attached to the coordinate is indecomposable (its geometric monodromy is a nontrivial unipotent), and Frobenius at a point `x` has eigenvalues `1` and `p^{deg x}`, so its slopes are `0, 1`; with `v(p) = 2` they would be `0, 2`. For `X` over `𝔽_{p²}` and an `𝔽_{p²}`-point the eigenvalues are `1, p²`, giving `0, 1` after division by `deg x = 2`, but `0, 2` after division by the degree `1` over the ground field.
- (i) does not say that every curve meets the generic locus: the intersection may be empty.

### 7.13 Generic crystalline ordinarity of the Dwork family

Let `v` be a place of `ℚ(ζ_N)` of residue characteristic `l ∤ N`, `λ` a place of `M` of the same characteristic, and Qian's datum (`n > 2`). There is a nonempty Zariski open `U(v; λ) ⊂ T_{0,k(v)}` such that for every finite extension `F_w/ℚ(ζ_N)_v` and every `t ∈ T₀(O_{F_w})` whose reduction lies in `U(v; λ)(k(w))`, `W^ℚ_{t,λ}` is a crystalline ordinary representation of `G_{F_w}`. The open `U(v; λ)` is the intersection of the generic-slope open `V` of §7.12 with the locus where the hypergeometric trace is a unit, as in the proof. (Boxer–Calegari–Gee–Newton–Thorne, Proposition 4.2.6 with proof, arXiv v3 pp. 43–45; Drinfeld–Kedlaya, Appendix A, §A.3, Proposition A.3.1 and Corollary A.3.2.)

*Needs:* §§3.2, 3.4, 3.6, 7.6, 7.7, 7.12.

*Proof sketch.* By §7.7 it suffices that the normalised `l`-adic slopes `s₁ ≥ ⋯ ≥ s_n` of `Q_x` (valuation with `v(l) = 1`, divided by `[k(x) : 𝔽_l]`, as in §7.12), computed with an auxiliary `μ` of residue characteristic `≠ l`, be `n − 1, …, 1, 0` for `x ∈ U`. `W^ℚ_μ` is geometrically irreducible (§3.6), hence indecomposable, on the irreducible curve `T_{0,k(v)}`, so §7.12 gives a dense open `V ⊂ T_{0,k(v)}` on which the slopes are constant and satisfy `sᵢ − s_{i+1} ≤ 1`. For `x ∈ V` with `s_n(x) = 0` this gives `sᵢ(x) ≤ n − i`, and `∑ sᵢ = n(n − 1)/2` (determinant, §3.6) forces `sᵢ(x) = n − i` for every `i`; so it suffices to find a dense open of `V` on which `s_n = 0`. By §3.4 and the trace formula of §3.1, `s_n(x) = 0` when `tr(Frob_x | E_{μ,x}) ≢ 0 (mod λ)`; writing `ρᵢ` through `z ↦ z^{cᵢ}`, the trace is congruent to `N_{k/k(v)}(u(x))` for `u(T) = ∑_r (−1)^{nr} ∏ᵢ C(cᵢ, r) T^r` by Lucas's theorem (the last term of a base-`q_v` expansion in the printed proof should be `r_{d−1}q_v^{d−1}`); let `g : T_{0,k(v)} − {0} → T_{1,k(v)}`, `t ↦ t^{−N}`, which is finite étale and surjective, and take `U = V ∩ g⁻¹(T_{1,k(v)}[1/u])`, an open subset of `T_{0,k(v)} − {0}`. Since `u(0) = 1`, `u ≠ 0` and `T_{1,k(v)}[1/u]` is a nonempty open, so `g⁻¹(T_{1,k(v)}[1/u])` is a nonempty open of `T_{0,k(v)}`, and `U` is nonempty as the intersection of two nonempty opens of the irreducible curve `T_{0,k(v)}`.

**Checks.**

- The open set is independent of the extension `k/k(v)`: `V` and `u` are defined over `k(v)`.
- The intersection with `V` is needed. For `n = 3`, a point with slopes `(3/2, 3/2, 0)` has `s₃ = 0`, total `3 = n(n − 1)/2` and partial sums `(3/2, 3, 3)` bounded by the generic `(2, 3, 3)`, yet it is not ordinary; it is excluded because its gap `3/2 > 1` shows that it lies outside `V`. This is a witness to the inference, not a claim that this polygon occurs in the Dwork family.
- At the Fermat point `x = 0` of `T₀` (where `g(0)` is `∞` in `T₁`) the criterion does not apply directly; §7.8 treats `l ≡ 1 (mod N)` there.
- For `n = 1` the trace is `ρ₁((1 − x)^{(q−1)/N})`, a unit, and the fibre is a crystalline character, trivially ordinary.

### Examples

For the self-dual datum with `N = 5`, `n = 2` and `l ≡ 1 (mod 5)`: `V_{λ,t}(1)` has weights `{0, 1}` (§7.4), is crystalline at good reduction (§7.7), ordinary of weight `0` near `t = 0` (§7.8), and an unramified twist of Steinberg at places `v ∤ 5l` with `v(t) < 0` (§7.10); together with §7.11 the semisimplifications `{V^ℚ_{t,λ}(1)^{ss}}_λ`, over all finite places `λ` of `M⁺ = ℚ(√5)` (those above `2` and `5` included), form a rank-two weakly compatible system of weight one, like the Tate modules of an elliptic curve.

### Dependencies

Layers 2–6; ComplexComparisonPartII §C5.3; PadicHodgeTheory §§3.2–3.4, 3.6, 6.1, 8.1–8.2; LocalGaloisDeformationRings §§1.7, 6.19; PadicDifferentialEquationsAndRigidCohomology §§RD.2.3, RD.3.34, RD.3.37, RD.3.43, RD.5.8, RD.7.7; LefschetzPencilsAndVanishingCycles §§0.5, 1.1, 1.6; ArithmeticGaloisRepresentations §2.4; PotentialModularityAndCompatibleSystems §§1.1, 1.9; GlobalNumberFields Layers 9–10; SchemeAndStackFoundations §1.16; DeligneWeightsAndPurity §7.15; EtaleCohomologyFoundations §F.0.2.

## Layer 8: Ordinarity near infinity

Near `t = ∞` the Dwork fibres degenerate, and their local Galois representations at the coefficient prime are semistable only after a ramified extension. ModularityAndLanglandsExtensions §2.10 supplies the `H₀`-equivariant semistable models of these fibres and the identification of the monodromy operator on `D_st` with the logarithm of the local monodromy at infinity, and its §2.11 proves that a fibre with consecutive labelled weights and maximally unipotent monodromy at infinity on every coefficient-conjugate summand is regular ordinary. This layer verifies those hypotheses for the Dwork data from the complex monodromy of Layer 4 and the Hodge–Tate weights of Layer 7.

### 8.1 Regular ordinarity of Dwork fibres near infinity

Let `λ` be a prime of `O` (of `O⁺` when `n = 2`) of residue characteristic `l ∤ 2N`, `F_v/ℚ_l` finite containing `ζ_N`, Qian's datum (or the self-dual datum), and `t ∈ F_v` with `v(t) < 0`. Then: (1) there is a finite totally ramified `F′_v/F_v` with `V_{λ,t}|_{G_{F′_v}}` semistable, and for every label `σ` the monodromy operator `N` on the `σ`-component of `D_st` is maximally nilpotent (`N^{n−1} ≠ 0`); (2) `V_{λ,t}` is ordinary of weight `μ` with `μ_{σ,i} = M(a_σ)` for all `i` (LocalGaloisDeformationRings' `IsOrdinaryOfWeight`; for the self-dual datum `M(a_σ) = (N − 1 − n)/2`, so `V_{λ,t}((N − 1 − n)/2)` is ordinary of weight `0`). Its `G_{F_v}`-stable subquotients, and for `t ∈ F` the graded pieces of a `G_F`-stable filtration and the semisimplification, are then ordinary with the corresponding subsets of the weights, by ModularityAndLanglandsExtensions §2.12. (Qian, Lemma 3.10(4), arXiv v1 p. 21; Qian, *Ordinarity of local Galois representation arising from Dwork motives*, Theorem 1.1, p. 2, proved in §4, pp. 19–23, arXiv v1, whose Lemma 4.2 omits the consecutive-weight hypothesis of Barnet-Lamb–Geraghty–Harris–Taylor, Lemma 2.2(2).)

*Needs:* §§4.6, 7.4, 7.5; ModularityAndLanglandsExtensions §§2.10, 2.11, 2.12; LocalGaloisDeformationRings §1.7.

*Proof sketch.* (1) ModularityAndLanglandsExtensions §2.10 gives the extension `F′_v`, semistability over it, and identifies `N` on each labelled component with the logarithm of the local monodromy at `t = ∞` of the coefficient-conjugate `χ`-summand, scaled by the ramification index; by §4.6 that monodromy is a single unipotent block for every conjugate `σχ`, and a nonzero multiple of a nilpotent operator in characteristic zero has the same nilpotency order. (2) ModularityAndLanglandsExtensions §2.11 applies: its consecutive-weight hypothesis is §7.4, with the crystalline twist by `Ψ_λ⁻¹` (crystalline at `v` by §7.5) or the Tate twist `(N − 1 − n)/2` bringing the weights to `{0, …, n − 1}`, and its monodromy hypothesis is §4.6.

**Checks.**

- For the self-dual datum with `n = 2` and `v(t) < 0`, `V_{λ,t}((N − 3)/2)` is, after a finite extension, an extension of `ε⁻¹·(unramified)` by an unramified character, like a Tate curve.
- Consecutive weights are needed in (2): a weakly admissible rank-two module over `ℚ_p` with `φe₁ = pe₁`, `φe₂ = p²e₂`, `Ne₂ = e₁`, `Ne₁ = 0` and jumps `0, 3` (`Fil¹ = Fil² = Fil³ = ⟨e₁ + e₂⟩`) has maximal `N` but its monodromy flag is not ordinary.
- The monodromy hypothesis is not implied by a zero exponent: for `N = 5` the rank-two datum `a = (1, 2, 2, 0, 0)` contains zeros, yet in A'Campo's parameters `α = (0, 3)`, `β = (1, 2)` its monodromy at infinity after the fifth-power cover has two singleton Jordan blocks, so the criterion does not apply to it. (Qian, *Ordinarity of local Galois representation arising from Dwork motives*, Remark 1.2, p. 2; A'Campo, Definitions 2.1.1–2.1.2 and Proposition 2.5.7, arXiv v1 pp. 7–8, 19–20.)
- At places with `v(t) > 0` and `l ≡ 1 (mod N)` the fibre is crystalline ordinary by §7.8 instead; this target concerns `v(t) < 0` only.

### Examples

For `N = 3` (the Hesse pencil) and `p ≠ 3`, the central fibre of the reciprocal family `s(X₁³ + X₂³ + X₃³) = 3X₁X₂X₃` at `s = 0` is the triangle `X₁X₂X₃ = 0`, already a reduced normal-crossings divisor, and for `v(t) < 0` the elliptic fibre has multiplicative reduction: its `H¹` is ordinary semistable with `N ≠ 0`, the rank-two prototype of §8.1, although `N = n + 1` lies outside the self-dual family.

### Dependencies

Layers 4 and 7; ModularityAndLanglandsExtensions §§2.10–2.12; LocalGaloisDeformationRings §1.7.

## Layer 9: Switching theorems

A switching theorem finds a Dwork fibre, over a CM or totally real extension disjoint from a prescribed avoidance field, whose residual representations at two primes are prescribed and whose local behaviour at those primes is controlled. The construction matches determinants (Layer 6), builds the level-structure torsor (Layer 5), Weil-restricts it to `ℚ`, and applies Moret-Bailly's theorem with local conditions at the two primes. Qian's theorem does this for the asymmetric data; the self-dual switch serves the symplectic potential-automorphy theorem of Barnet-Lamb–Gee–Geraghty–Taylor; Boxer–Calegari–Gee–Newton–Thorne use it twice, together with a CM-induced seed, to build their auxiliary systems.

### 9.1 Switching data: determinant twists, the module `W` and the torsor `T_W`

Hypotheses: `l` odd, `n = l^a m` with `l ∤ m`, `s ≥ 1`; `N` odd, prime to `ln`, `N > 100n + 100`, and with `r` the order of `l` modulo `N`, `N ∤ l^{r/2} + 1` if `r` is even; `V` denotes the eigensheaves of Qian's datum of rank `n` (§1.4) when `n > 2` and the real forms of the self-dual datum (§2.5) when `n = 2`, both zero-shaped, so that §§6.4, 6.6 and 6.7 apply; `F` a CM field, `M = F(ζ_N)`; `r̄ : G_F → GL_n(𝔽_{l^s})` continuous; `λ | l` a prime of `O` (of `O⁺` when `n = 2`) with `k(λ) ⊇ 𝔽_{l²}` and containing all `m`-th roots of elements of `𝔽_{l^s}`; `l′ > 2ln + 5` prime, unramified in `F^avoid`, with `l′ ≡ 1 (mod N)` and `l′ ≡ 1 (mod n)`; `λ′ | l′`, `k(λ′) = 𝔽_{l′}`; `r̄′ : G_F → GL_n(𝔽_{l′})` with `det r̄′ = ε̄_{l′}^{−n(n−1)/2}`; finite Galois `F^avoid ⊇ F`, `F^avoid_2`, and totally real Galois `F^suff/ℚ`, all unramified above `N`, with `F^avoid_2 ∩ F^avoid = ℚ` and `F^suff ∩ F^avoid F^avoid_2 = ℚ`; `F₀ = F^avoid F^avoid_2 F^suff(ζ_N)`.

Construction: apply §6.5 to `det V[λ] ⊗ (det r̄|_{G_M})⁻¹` (exponent `m`, coefficient field `k(λ)`, §6.6) with avoidance field `F₀`, giving `L₁`; then over `L₁M` to `(det r̄′)⁻¹ ⊗ det V[λ′]` (exponent `n`, coefficient field `𝔽_{l′}`, §6.7) with avoidance field `F₀L₁`, giving `L₂`. Put `L = L₁L₂` and `E = LM`. This gives (a) a totally real Galois `L/ℚ` linearly disjoint from `F₀`, and the CM field `E`, Galois over `F`; (b) characters `χ̄₁ : G_E → k(λ)^×`, `χ̄₂ : G_E → 𝔽_{l′}^×` with `χ̄₁^n = det V[λ] ⊗ (det r̄)⁻¹` and `χ̄₂^n = det V[λ′] ⊗ (det r̄′)⁻¹`; (c) `W = (χ̄₁ ⊗ r̄) × (χ̄₂ ⊗ r̄′)` over `O/λλ′ ≅ k(λ) × 𝔽_{l′}` with `det W ≅ det V[λλ′]`, hence `φ : ∧ⁿW ≅ ∧ⁿV[λλ′]` and the torsor `T_W = T({W})` over `(T₀)_E` (§5.11); (d) `T_W` smooth and geometrically irreducible (§5.12, with `l ≠ l′`, `max(l, l′) > 10`, `k(λ′) = 𝔽_{l′}`); (e) `E ∩ F^avoid F^avoid_2 F^suff = F`. (Qian, §4, root characters and construction of `W`, arXiv v1 pp. 21–23; the published argument requires `n | #k(λ)^×` where `m | #k(λ)^×` is correct, applies the root lemma once for two characteristics, and writes the determinant of the symmetric power of `H¹` with a positive cyclotomic exponent.)

The construction has the following API.

- `L` is totally real, Galois over `ℚ` and linearly disjoint from `F₀`; `E = L·F(ζ_N)` is CM and Galois over `F`.
- `χ̄₁^n = det V[λ] ⊗ (det r̄)⁻¹` and `χ̄₂^n = det V[λ′] ⊗ (det r̄′)⁻¹` as characters of `G_E`, with values in `k(λ)^×` and `𝔽_{l′}^×`.
- `det W ≅ det V[λλ′]` as characters of `G_E`, giving `φ`.
- `T_W → (T₀)_E` is finite étale, smooth and geometrically irreducible.
- `E ∩ F^avoid F^avoid_2 F^suff = F`.

*Needs:* §§5.9, 5.11, 5.12, 6.5–6.7; ArithmeticGaloisDuality §R02.4.6; PotentialModularityAndCompatibleSystems §2.14.

*Proof sketch.* The two root extractions are §6.5 applied to §§6.6–6.7; the second avoidance field `F₀L₁` keeps `L₁L₂` disjoint from `F₀`. Then `det(χ̄₁ ⊗ r̄) = det V[λ]` and `det(χ̄₂ ⊗ r̄′) = det V[λ′]`, which gives `φ` by §5.9. For (e), apply disjointness through towers (PotentialModularityAndCompatibleSystems §2.14) twice inside `ℚ̄`, with `C = ℚ`. First take `B = M`, `A = F₀`, `D = L`: `ℚ ⊆ M ⊆ F₀`, and `F₀`, `L` are linearly disjoint over `ℚ`, so `F₀ ∩ LM = F₀ ∩ E = M`. Second, `G = F^avoid F^avoid_2 F^suff` contains `F` and is unramified above `N`, so `G ∩ ℚ(ζ_N)` is unramified everywhere over `ℚ`, hence `ℚ`, and `G`, `ℚ(ζ_N)` are linearly disjoint over `ℚ` because `ℚ(ζ_N)/ℚ` is Galois; take `B = F`, `A = G`, `D = ℚ(ζ_N)`: `G ∩ F(ζ_N) = G ∩ M = F`. Since `G ⊆ F₀`, `E ∩ G = M ∩ G = F`.

**Checks.**

- If the two determinant ratios are already trivial on `G_{F(ζ_N)}`, take `L = ℚ`, `E = F(ζ_N)` and `χ̄₁ = χ̄₂ = 1`; `det V[λ]` is read as a character of `G_M`, not of `G_F`.
- Since `l′ ≡ 1 (mod N)`, `k(λ′) = 𝔽_{l′}` and `O/λλ′ ≅ k(λ) × 𝔽_{l′}`.
- For `n = 3` and `l′ ≡ 2 (mod 3)` the cube map on `𝔽_{l′}^×` is bijective, so every `𝔽_{l′}^×`-valued character has a cube root already: the congruence `l′ ≡ 1 (mod n)` is a sufficient condition for §6.5, not a necessary one.
- The tower hypotheses of PotentialModularityAndCompatibleSystems §2.14 are needed: for `C = D = ℚ`, `A = ℚ(√2)` and `B = ℚ(√3)`, `A` and `D` are linearly disjoint over `C`, but `A ∩ BD = ℚ ≠ B`, because `B ⊄ A`; for `B = A = ℚ(√2)` and `D = ℚ(√3)`, `[BD : ℚ] = 4` and `A ∩ BD = B` has degree `2`. In both applications above `B ⊆ A` (`M ⊆ F₀` and `F ⊆ G`).
- Two separate applications of §6.5 with the same avoidance field `F₀` could give `L₁, L₂` each disjoint from `F₀` whose compositum is not: for `F₀ = ℚ(√6)`, `L₁ = ℚ(√2)` and `L₂ = ℚ(√3)` are each disjoint from `F₀` but `L₁L₂ ⊃ F₀`.

### 9.2 Weil restriction of the torsor and the local conditions

With the switching data of §9.1 let `T = Res_{EF^suff/ℚ}(T_W ×_E EF^suff)`, with the morphism `p : T → Res_{EF^suff/ℚ} T₀` induced by `T_W → (T₀)_E`. Put `Ω_∞ = T(ℝ)`, `Ω_{l,0} = {(t_τ) : v_l(t_τ) < 0 for all τ : EF^suff → ℚ̄_l}`, `Ω_{l′,0} = {(t_τ) : v_{l′}(t_τ) > 0 for all τ}`, `Ω_l = p⁻¹(Ω_{l,0})` and `Ω_{l′} = p⁻¹(Ω_{l′,0})`. (Qian, §4, local opens and Proposition 4.2, arXiv v1 pp. 23–24.)

The construction has the following API.

- `T` is a smooth geometrically irreducible `ℚ`-variety.
- `Ω_∞`, `Ω_l`, `Ω_{l′}` are nonempty open subsets of `T(ℝ)`, `T(ℚ̄_l)`, `T(ℚ̄_{l′})`, invariant under `Gal(ℚ̄_l/ℚ_l)` (resp. `Gal(ℚ̄_{l′}/ℚ_{l′})`).
- `Ω_∞ = T(ℝ) = ∏ T_W(ℂ)` over the complex places of the CM field `EF^suff`, nonempty because `T_W` is a nonempty smooth variety.

*Needs:* §9.1; AbelianSchemesAndArithmeticModuli §§A6.30–A6.31; AlgebraicModuliForArithmeticGeometry §3.4; PotentialModularityAndCompatibleSystems §2.18.

*Proof sketch.* Weil restriction of a smooth quasi-projective variety along a finite separable extension exists, is smooth, and over `ℚ̄` is the product of the conjugates (AbelianSchemesAndArithmeticModuli §A6.31), hence geometrically irreducible (PotentialModularityAndCompatibleSystems §2.18). Points with `v(t) < 0` or `v(t) > 0` avoid `μ_N` and `∞`, so `Ω_{l,0}, Ω_{l′,0}` are nonempty open and Galois-stable; `p` is finite étale and surjective on `ℚ̄_l`-points, so the preimages are nonempty open.

**Checks.**

- `t = 1/l` lies in `Ω_{l,0}` for every embedding: `v_l(1/l) = −1 < 0`.
- `t = l′` lies in `Ω_{l′,0}`: `v_{l′}(l′) = 1 > 0`, and `l′` avoids `μ_N`.
- If `EF^suff` has degree `2d` over `ℚ`, `T(ℝ)` is the product of `d` copies of `T_W(ℂ)`, one for each complex place.
- `t = l` is near the Fermat point, `v_l(t) > 0`, so it is excluded from `Ω_{l,0}`; a unit such as `1 + l` is near neither `0` nor `∞`.

### 9.3 Qian's switching theorem

Keep the switching data of §9.1. There are a finite totally real Galois `L′/ℚ`, linearly disjoint from `F₀L` over `ℚ`, and, with `F′ = L′EF^suff`, a point `t ∈ T₀(F′)` with a `G_{F′}`-equivariant isomorphism `W ≅ V[λλ′]_t` inducing `φ_t` on `∧ⁿ`, such that: (i) `F′ ⊇ EF^suff` is CM, finite Galois over `F`, with `(F′)⁺ = L′E⁺F^suff`; (ii) `χ̄₁⁻¹V[λ]_t ≅ r̄|_{G_{F′}}` and `χ̄₂⁻¹V[λ′]_t ≅ r̄′|_{G_{F′}}`; (iii) `v(t) < 0` for every place `v | l` of `F′` and `v(t) > 0` for every `v | l′`; (iv) `F′ ∩ F^avoid_2 = ℚ` and `F′ ∩ F^avoid F^avoid_2 = F`, so `F′` is linearly disjoint over `F` from every subextension of `F^avoid F^avoid_2`; (v) `K = L′LF^suff(ζ_N)` is finite Galois over `ℚ` with `FK = F′` and `K ∩ F^avoid = ℚ`. Consequently `V_{λ,t}` has the prescribed residual representation at `l`, `V_{λ′,t}` at `l′`, `V_{λ′,t}` is ordinary at the places above `l′` (§7.8), and `V_{λ′,t}` has maximal unipotent monodromy at the places above `l` (§7.10). No automorphy statement is made. (Qian, §4, Proposition 4.2 and the intersection computations, arXiv v1 pp. 23–24, and the final proof of Theorem 1.4, p. 26, where the disjointness should be asserted for `K`, not for `F′`, since `F′` and the normal closure both contain `F`.)

*Needs:* §§7.8, 7.10, 9.1, 9.2; PotentialModularityAndCompatibleSystems §§2.14, 2.17.

*Proof sketch.* Apply Moret-Bailly with three kinds of local conditions (PotentialModularityAndCompatibleSystems §2.17) over `ℚ` to `T` with `S₁ = {∞}`, `S₂ = ∅`, `S₃ = {l, l′}`, the opens of §9.2 and avoidance field `F₀L`; the real place splits, so `L′` is totally real. A point of `T` over `L′` is a point of `T_W` over `L′EF^suff = F′`, i.e. `t ∈ T₀(F′)` with an isomorphism `W ≅ V[λλ′]_t` respecting `φ`, giving (ii) after untwisting and (iii) from the local conditions. For (iv) and (v) apply PotentialModularityAndCompatibleSystems §2.14 inside `ℚ̄` with `C = ℚ`, writing `(B, A, D)` for the remaining fields and `G = F^avoid F^avoid_2 F^suff`; in each step `B ⊆ A`, and `D` is Galois over `ℚ` with `A ∩ D = ℚ`, which gives linear disjointness. With `(EF^suff, F₀L, L′)`: `F′ ∩ F₀L = EF^suff`; with `(MF^suff, F₀, L)`: `EF^suff ∩ F₀ = MF^suff`; with `(FF^suff, G, ℚ(ζ_N))`, `G` being unramified above `N`: `MF^suff ∩ G = FF^suff`; with `(F, F^avoid F^avoid_2, F^suff)`: `FF^suff ∩ F^avoid F^avoid_2 = F`. Chaining these, `F′ ∩ F^avoid F^avoid_2 = F`, and `F′ ∩ F^avoid_2 ⊆ F^avoid ∩ F^avoid_2 = ℚ`. For (v) the chain `(LF^suff(ζ_N), F₀L, L′)`, `(F^suff(ζ_N), F₀, L)`, `(F^suff, G, ℚ(ζ_N))` gives `K ∩ F^avoid ⊆ F^suff ∩ F^avoid = ℚ`, and `FK = L′LF(ζ_N)F^suff = F′`. The local consequences are §7.8 (`l′ ≡ 1 (mod N)` and `t ∈ 𝔪`) and §7.10 (`l′ ≠ l`, `v(t) < 0`).

**Checks.**

- For `n = 2` the theorem is the self-dual switch with the real coefficient field, and its residual representations are symplectic (§9.4).
- `F′` contains `F`, so `F′` cannot be linearly disjoint over `ℚ` from a normal closure containing the CM field `F`; the disjointness over `ℚ` is asserted for `K`.
- With `l = l′` the two residual conditions would be at one prime and §5.12 would not give irreducibility; the hypothesis `l′ > 2ln + 5` keeps the primes distinct.

### 9.4 Switching in the self-dual Dwork family

Let `F/F₀` be a finite Galois extension of totally real fields, `I` a finite set, and for `i ∈ I`: `nᵢ` even, `lᵢ` odd primes, `r̄ᵢ : G_F → GSp_{nᵢ}(𝔽̄_{lᵢ})` with open kernel and multiplier `ε̄_{lᵢ}^{1−nᵢ}`; let `l′` be an odd prime distinct from every `lᵢ` and `r̄′ᵢ : G_F → GSp_{nᵢ}(𝔽_{l′})` with multiplier `ε̄_{l′}^{1−nᵢ}`, and `F^avoid/F` finite Galois. Choose `N` odd, prime to `2∏lᵢ·l′` and to every `nᵢ` (the standing `gcd(N, n) = 1` of the Conventions, which §4.4 uses), `N > nᵢ + 1`, divisible by no prime ramified in `F^avoid`, such that each `r̄ᵢ` takes values in `GSp_{nᵢ}(ℤ[ζ_N]⁺/λᵢ)` for a prime `λᵢ | lᵢ` of `ℤ[ζ_N]⁺` (§1.1), and `λ′ | l′`. Then the product over `Spec K`, `K = F(ζ_N)⁺`, of the symplectic level-structure torsors `T_{r̄ᵢ × r̄′ᵢ}` (the pairing-preserving trivialization schemes of ModularityAndLanglandsExtensions §2.14 for the self-dual level data of §5.11) over their own parameter lines `(T₀)_K` is geometrically irreducible, each factor being geometrically connected by that section, hence smooth and geometrically irreducible (§5.12); and for an auxiliary finite Galois avoidance field `L/K` and a finite set `Σ` of finite places whose residue characteristics divide neither `N` nor `l′`, Moret-Bailly gives a totally real `F′/F₀`, Galois, linearly disjoint from `F^avoid` over `F`, and `tᵢ ∈ T₀(F′)` with `V_{nᵢ}[λᵢ]((N − 1 − nᵢ)/2)_{tᵢ} ≅ r̄ᵢ|_{G_{F′}}` and `V_{nᵢ}[λ′]((N − 1 − nᵢ)/2)_{tᵢ} ≅ r̄′ᵢ|_{G_{F′}}` as symplectic representations, `v(tᵢ) < 0` at every place above `lᵢ` (and above `Σ`) and `v(tᵢ) > 0` at every place above `l′`. At such points `V_{λ′,tᵢ}((N − 1 − nᵢ)/2)` is ordinary of weight `0` at the places above `l′` when `l′ ≡ 1 (mod N)`, has Hodge–Tate numbers `{0, …, nᵢ − 1}`, and at places above `lᵢ` (and `Σ`) its Weil–Deligne representation is an unramified twist of Steinberg. ModularityAndLanglandsExtensions §2.14 constructs these schemes and proves their geometric connectedness as the route of its simultaneous symplectic potential automorphy theorem; the statement here is the Moret-Bailly step on them alone, with the additional places `Σ` at which `v(tᵢ) < 0` and the local properties of the fibres, and makes no automorphy assertion. (Barnet-Lamb–Gee–Geraghty–Taylor, proof of Theorem 3.1.2, arXiv v4 pp. 42–44, and Proposition 3.1.1; Barnet-Lamb–Geraghty–Harris–Taylor, §§4–6, Proposition 4.2, Lemmas 5.1, 5.3, 6.1 and Proposition 6.2, pp. 26–40; Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne, Lemma 7.1.8, pp. 1091–1092, and Corollary 7.2.4, p. 1100.)

*Needs:* §§1.1, 2.5, 5.11, 5.12, 7.4, 7.8, 7.10; ModularityAndLanglandsExtensions §2.14; PotentialModularityAndCompatibleSystems §2.18.

*Proof sketch.* For each `i` the symplectic level torsor at the two distinct primes is geometrically connected (ModularityAndLanglandsExtensions §2.14), hence smooth and geometrically irreducible (§5.12); the product over `Spec K`, with one parameter `tᵢ` per factor, is geometrically irreducible. Moret-Bailly above a preliminary field (PotentialModularityAndCompatibleSystems §2.18) with the opens `v(t) < 0` above `lᵢ` and `Σ`, and `v(t) > 0` above `l′`, gives the points. The local properties are §§7.8, 7.4 and 7.10.

**Checks.**

- `nᵢ = 2`: the residual representations are `GL₂ = GSp₂`-valued with determinant `ε̄^{−1}`, and the switch produces a fibre that is Steinberg above `lᵢ`, the shape used in Barnet-Lamb–Gee–Geraghty–Taylor, Theorem 3.1.2.
- Without the symplectic compatibility of the level structures the torsor has several geometric components (§5.11).
- The base of the product torsor is `(T₀)^I`, one parameter per factor; no fibre product over a single shared `t` is asserted.

### 9.5 Local constancy of the Dwork Galois representations at finite level

Let `v | l` be a place of a number field `F ⊇ ℚ(ζ_N)`, `λ | l` a place of `M`, `t ∈ T₀(O_{F_v})` and `c ≥ 1`. There is an open ball `U_t ∋ t` in `T₀(O_{F_v})` such that `W_{t,λ}/l^c ≅ W_{t′,λ}/l^c` as representations of `G_{F_v}` for all `t′ ∈ U_t`, and likewise for finitely many `λ` at once. Only this finite-level statement is asserted. The same holds, with the same proof, for a lisse sheaf `𝓛` of finite `ℤ/ℓ^c`-modules (any prime `ℓ`) on a smooth `F_v`-variety `Y` and a point `y ∈ Y(F_v)`: some `v`-adic neighbourhood `U_y` of `y` in `Y(F_v)` has `𝓛_{y′} ≅ 𝓛_y` as `G_{F_v}`-modules for every `y′ ∈ U_y`; §§9.11–9.12 use this for the torsion of the universal elliptic curve over a twisted modular curve. (Boxer–Calegari–Gee–Newton–Thorne, proof of Theorem 6.2.4, arXiv v3 p. 66, citing Kisin, Theorem 5.1, for a stronger statement.)

*Needs:* §§2.3, 3.6; EtaleCohomologyFoundations §F.0.2; LefschetzPencilsAndVanishingCycles §2.4 (henselian implicit function theorem); Mathlib `IsAdicComplete.henselianRing`.

*Proof sketch.* The reduction of `W_λ` modulo `l^c` is a lisse sheaf with finite fibres, and the sheaf of isomorphisms from its constant fibre at `t` is a finite étale cover of `T₀` (EtaleCohomologyFoundations §F.0.2) with an `F_v`-rational point above `t`. The henselian implicit function theorem over the complete ring `O_{F_v}` (LefschetzPencilsAndVanishingCycles §2.4) lifts that point over every `t′` sufficiently close to `t`, and the lift is a `G_{F_v}`-equivariant isomorphism of the finite fibres. Intersect the finitely many balls.

**Checks.**

- If `t ≡ t′` modulo a high power of the uniformiser, `W̄_{t,λ} ≅ W̄_{t′,λ}`.
- The ball depends on `c`: for `c → ∞` it shrinks, and no isomorphism of the full `l`-adic representations is asserted.
- At a puncture (`t^N ≡ 1` modulo the maximal ideal) `t ∉ T₀(O_{F_v})` and the statement does not apply.
- For the general form, take `Y = 𝔾_m` over `ℚ₅`, `π : 𝔾_m → 𝔾_m`, `z ↦ z²`, and the rank-two lisse sheaf `π_*𝔽₂` (`ℓ = 2`, `c = 1`), whose fibre at `y′` is the free `𝔽₂`-module on the two square roots of `y′`. At `y = 1` both roots `±1` lie in `ℚ₅`, so `G_{ℚ₅}` acts trivially and the invariants have dimension `2`; every `y′ ∈ 1 + 5ℤ₅` is a square by Hensel's lemma, so its fibre is the same trivial module; at `y′ = 2`, not a square in `ℚ₅` (the squares of `𝔽₅^×` are `1, 4`), the nontrivial element of `Gal(ℚ₅(√2)/ℚ₅)` acts by `[[0, 1], [1, 0]]` and the invariants have dimension `1`. The neighbourhood is a ball around `y`, not all of `Y(ℚ₅)`. The sheaf of square roots itself is a `ℤ/2`-torsor, not a sheaf of `𝔽₂`-modules, and is not an instance: a two-element `𝔽₂`-module has trivial automorphism group, while the torsor has nontrivial monodromy.

### 9.6 Reductions of two-dimensional crystalline representations of small weight

Let `p` be odd and `r : G_{ℚ_p} → GL₂(E)` crystalline, `E/ℚ_p` finite, with cohomological Hodge–Tate weights `{0, m}`, `1 ≤ m ≤ p − 1`. Fix a stable lattice and read its reduction semisimply. Either `r` is ordinary, or up to an unramified character its reduction is `Ind_{G_{ℚ_{p²}}}^{G_{ℚ_p}}(ω₂^{−m})`; on `G_{ℚ_{p²}}` it is then an unramified twist of `ρ̄_{2,m,0} = ε̄₂^m ⊕ (ε̄′₂)^m` with the Lubin–Tate characters of LocalGaloisDeformationRings §6.19, and on inertia it is `θ₂^m ⊕ θ₂^{pm}` with `θ₂ = ω₂⁻¹`; the induced reduction is irreducible. For `m ≤ p − 2` this is FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11 read for `r^∨` in the cohomological convention; this target adds the endpoint `m = p − 1` and the comparison with `ρ̄_{2,m,0}`. (Berger, *Représentations modulaires de GL₂(ℚ_p) et représentations galoisiennes de dimension 2*, §1.3, p. 271, and Théorème 3.2.1(1), pp. 277–278; Boxer–Calegari–Gee–Newton–Thorne, proof of Theorem 6.2.4, arXiv v3 pp. 65–66.)

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11 (for `m ≤ p − 2`); PadicHodgeTheory §§3.3, 6.4; LocalGaloisDeformationRings §6.19.

*Proof sketch.* Up to an unramified twist, the dual `r^∨` is Berger's `V_{k,a_p}` with `k = m + 1`, since §1.3 defines `D_cris(V_{k,a_p}^∨) = D_{k,a_p}` with jumps `0, k − 1`. The unit-root case `v_p(a_p) = 0` is ordinary (PadicHodgeTheory §6.4, with its weight signs translated). If `a_p` is in the maximal ideal, Théorème 3.2.1(1), valid for `2 ≤ k ≤ p + 1`, gives the semisimplified reduction `ind(ω₂^{k−1})`; dualising gives the exponent `−m`. Since `1 ≤ m ≤ p − 1`, `m` is not divisible by `p + 1`, so the induction is irreducible. For `m ≤ p − 2` the reduction is also FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11 applied to `r^∨`, whose weights in that roadmap's convention `HT(ε) = +1` are `{0, m}`: its reducible case is the ordinary one, and in its irreducible case `r̄^∨|_I ≅ ω₂^m ⊕ ω₂^{pm}`, whose dual is `θ₂^m ⊕ θ₂^{pm}`; Berger's theorem is needed only at the endpoint `m = p − 1`.

**Checks.**

- For `H¹` of an elliptic curve with supersingular good reduction, `m = 1` and the inertia is `ω₂⁻¹ ⊕ ω₂^{−p}`, with determinant `ε̄_p⁻¹`; the Tate module has the dual, positive exponents.
- For `m = p + 1` the theorem does not apply: `ω₂^{p+1} = ω` and the induction of a character extending to `G_{ℚ_p}` is reducible.
- In the ordinary case the reduction is reducible, an extension of unramified twists of `1` and `ω^{−m}`.

### 9.7 Local Dwork points with prescribed reductions

Let `𝒦` be a finite set of integers `k > 2` and `N > 100k + 100` for every `k ∈ 𝒦`, so that the twisted Dwork system `_kW` of rank `k` (Qian's datum of rank `k`, §3.6) is defined. Let `F₃` be a CM field containing `ℚ(ζ_N)` and Galois over `ℚ`; `p, r, p₀, q` distinct primes prime to `N` with `p ≡ −1`, `r ≡ 1`, `q ≡ 1 (mod N)` and `p > k` for every `k ∈ 𝒦`; `𝔭, 𝔯, 𝔮` places of `M` above `p, r, q`; `Σ^ord ⊔ Σ^ss` a partition of the `p`-adic places of `F₃` (for an extension `F′/F₃` the places above them are again written `Σ^ord`, `Σ^ss`); `ρ̄₁, …, ρ̄_s` continuous representations of `G_{F₃}` with finite image; and `B″/F₃` a finite extension. Then there is a totally real finite Galois `K⁺/ℚ` such that `F₄ = K⁺F₃` is linearly disjoint from `B″` over `F₃`, every `ρ̄ᵢ` is trivial on `G_{F_{4,v}}` for every place `v | prp₀q` of `F₄`, and for each `k ∈ 𝒦` and each such `v` there is a nonempty open `_kΩ_v ⊂ T₀(O_{F_{4,v}})` of points `t` with: (i) `v ∈ Σ^ord`: `_kW̄_{t,𝔭}` trivial, `_kW_{t,𝔭}` crystalline ordinary, `_kW̄_{t,𝔯}`, `_kW̄_{t,𝔮}` trivial; (ii) `v ∈ Σ^ss`: `_kW_{t,𝔭}` crystalline and connected to `ρ_{k,1,0}`, residuals trivial; (iii) `v | r`: `_kW_{t,𝔯}` crystalline ordinary, residuals trivial; (iv) `v | p₀`: all residuals trivial; (v) `v | q`: `_kW_{t,𝔮}` crystalline ordinary, residuals trivial. Moreover, (vi) given finitely many elliptic curves `D` over `ℤ_ℓ`, `ℓ ∈ {p, r, p₀, q}`, with good reduction, `K⁺` can be chosen so that in addition `μ_{prq} ⊂ F_{4,v}` and the `p`-, `r`- and `q`-torsion of `D` is a trivial `G_{F_{4,v}}`-module for every `v | ℓ`, and, for `D` over `ℤ_p` with supersingular reduction, `H¹_ét(D_{F̄_{4,v}}, ℚ_p)|_{G_{F_{4,v}}}` connects to `ρ_{2,1,0}|_{G_{F_{4,v}}}`; write `D_v = D ⊗ O_{F_{4,v}}`. In §§9.10–9.12 the data are those of §§9.8–9.9: `𝒦` the set of those of `m`, `nm` that exceed `2`, `(ρ̄ᵢ) = (r̄_𝔭, r̄_𝔯, r̄_{CM,𝔯}, ρ̄_{A,q})`, `B″ = B′F₃`, and, when `m = 2`, one curve `D` for each kind of place: over `ℤ_p` with ordinary reduction for `v ∈ Σ^ord` and with supersingular reduction for `v ∈ Σ^ss`, over `ℤ_r` with ordinary reduction for `v | r`, and the curve `A` of §9.9 (good at `p₀`, good ordinary at `q`) for `v | p₀q`; such curves over `ℤ_p` and `ℤ_r` exist for every `p` and `r`, as lifts of Weierstrass equations of ordinary and supersingular elliptic curves over `𝔽_p` and `𝔽_r` (§9.13). The preliminary local extensions are chosen first to contain an ordinary point (or the Fermat point with its component comparison) and to kill the finitely many residual representations; then `K⁺` realises them and avoids `B″`. (Boxer–Calegari–Gee–Newton–Thorne, proof of Theorem 6.2.4, local data (i)–(v), arXiv v3 pp. 65–66.)

*Needs:* §§3.6, 7.7, 7.9, 7.13, 9.5, 9.6, 9.13; LocalGaloisDeformationRings §§6.8, 6.19, 6.25; PotentialModularityAndCompatibleSystems §2.16; EllipticCurves Layers 3–4.

*Proof sketch.* (i), (iii), (v): §7.13 gives an ordinary crystalline point; local constancy (§9.5) and the connectedness of weight-zero crystalline ordinary lifts (LocalGaloisDeformationRings §6.25) give an open ball of such points with trivial residual representations after enlarging the local fields. (ii): at `t = 0`, `W̄_{0,𝔭}` restricted to the inertia of the unramified quadratic extension `ℚ(ζ_N)_{v′}` of `ℚ_p` (`v′` below `v`) is `⊕ θ_τ^{i−1}θ_{cτ}^{k−i}` (§7.9, `p > k`), and on `I_{F_{4,v}}` it is the sum of the restrictions of these characters (Conventions), so its crystalline lifts connect to `ρ_{k,1,0}` (LocalGaloisDeformationRings §§6.8, 6.19); local constancy gives a neighbourhood. (iv): any point with trivial residual representations near `t = 0` after enlarging. (vi): finite extensions trivialise the finitely many torsion modules and adjoin `μ_{prq}`; for supersingular `D` over `ℤ_p`, `H¹(D)` is crystalline with weights `{0, 1}` and not ordinary, so §9.6 (with `m = 1`) makes its reduction on `G_{ℚ_{p²}}` an unramified twist of `ρ̄_{2,1,0}`, and after trivialising it `H¹(D)` and `ρ_{2,1,0}` connect (LocalGaloisDeformationRings §§6.8, 6.19), as in (ii); elliptic curves with ordinary and supersingular good reduction serve as local points of level-structure moduli in the same way in Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne, proof of Theorem 7.1.11, pp. 1104–1105. The curves of the application exist: §9.13 gives Weierstrass equations over `𝔽_p` of an ordinary and of a supersingular elliptic curve, and over `𝔽_r` of an ordinary one; lifting the coefficients to `ℤ_p` (resp. `ℤ_r`) gives a Weierstrass equation whose discriminant reduces to a nonzero element of the residue field, hence is a unit, so the lift is an elliptic curve over `ℤ_p` (resp. `ℤ_r`) with good reduction equal to the given curve, ordinary or supersingular as that curve is (EllipticCurves Layer 4). Finally PotentialModularityAndCompatibleSystems §2.16, over `ℚ` with the real place kept real, gives a soluble totally real Galois `K⁺/ℚ` whose completions at `p, r, p₀, q` are prescribed finite Galois extensions of `ℚ_p, ℚ_r, ℚ_{p₀}, ℚ_q` containing the preliminary local extensions, linearly disjoint from the Galois closure of `B″` over `ℚ`; then `F₄ = K⁺F₃` is linearly disjoint from `B″` over `F₃`.

**Checks.**

- For `k = 2` the twisted system `W` is not defined (`n > 2` is required); the rank-two systems are built from the curves of (vi) in §9.11 and §9.12(2).
- Local triviality of the four input residual systems alone does not give the ordinary or component conditions; the preliminary extensions are chosen to contain the required points.
- For `v ∈ Σ^ss` with `k = 3` the model is `ρ_{3,1,0} = ε₂² ⊕ ε₂ε′₂ ⊕ (ε′₂)²`, whose weights `{0, −1, −2}` (LocalGaloisDeformationRings' sign) match `{0, 1, 2}` here.
- The reduction type in (vi) is a real constraint on `D`: `y² = x³ − x` has `8` points over `𝔽₅` (trace `−2 ≢ 0 (mod 5)`, ordinary) and `8 = 7 + 1` points over `𝔽₇` (trace `0`, supersingular), so over `ℤ_p` it can serve at `Σ^ord` when `p ≡ 1 (mod 4)` and at `Σ^ss` when `p ≡ 3 (mod 4)`, never both.
- No fixed pair of equations supplies both reduction types for every `p`, which is why the existence theorem §9.13 is used. At `p = 11` the curves `y² = x³ − x` and `y² = x³ + 1` (`j = 1728` and `j = 0`) both have `12` points (trace `0`, supersingular), and an ordinary curve needs another equation, such as `y² = x³ + x + 1` with `14` points (trace `−2`). At `p = 13` both fixed curves are ordinary (`8` points, trace `6`; `12` points, trace `2`), and `y² = x³ + x + 4`, with `14` points (trace `0`) and discriminant `≡ 5 (mod 13)`, is supersingular; its coefficientwise lift to `ℤ₁₃` has unit discriminant and serves at `Σ^ss`.

### 9.8 The CM-induced auxiliary system `R_CM`

*Standing data for §§9.8–9.12.* Fix integers `n ≥ 1` and `m ≥ 2`, an imaginary CM field `F`, and a rank-two very weakly compatible system `R = (M_R, S_R, {Q_v(X)}, {r_λ}, {H_τ})` of representations of `G_F` (PotentialModularityAndCompatibleSystems §1.3) which is strongly irreducible, with `H_τ = {0, m}` for every `τ` and `det r_λ = ε_l^{−m}` for every `λ`. Fix a place `v₀ ∉ S_R` of `F` with residue characteristic `p₀`, an imaginary quadratic field `F_{iq}`, and let `F₁` be the Galois closure of `F F_{iq}` over `ℚ`. Every later field `F_j` (`j ≥ 2`) is a CM extension of `F_{j−1}`, Galois over `ℚ`; for the cyclic field `E` below put `L_j = EF_j`. The coefficient field `M_R` is enlarged finitely often (to contain the values of `Ψ₀`, and in §9.9 to contain `ζ_N`); `R` and `R_CM` are compared with the Dwork systems, whose coefficient field is `M = ℚ(ζ_N)`, through places of the enlarged `M_R`. (Boxer–Calegari–Gee–Newton–Thorne, Theorem 6.2.4, hypotheses (1)–(3) and the opening of its proof, arXiv v3 p. 64.)

Let `E/ℚ` be totally real cyclic of degree `m` and linearly disjoint from `F₁`, with `p₀` unramified, `L₁ = EF₁`, and `q₁` an odd prime splitting completely in `L₁`, not below `v₀`, with `v₁ | q₁` a place of `F₁` split as `w₁⋯w_m` in `L₁`. Fix `τ₀ : F_{iq} ↪ ℂ` and the embeddings `τ₁, …, τ_m : E F_{iq} ↪ ℂ` extending it. For an embedding `σ : L₁ ↪ ℂ` put `a_σ = m − i` if `σ|_{EF_{iq}} = τᵢ` and `a_σ = i − 1` if `σ|_{EF_{iq}} = cτᵢ`; since `cσ` restricts to `cτᵢ` when `σ` restricts to `τᵢ`, `a_σ + a_{cσ} = m − 1` for every `σ`. Choose an algebraic Hecke character `Ψ₀ : 𝔸_{L₁}^× → M_R^×` with `Ψ₀(α) = ∏_σ σ(α)^{a_σ} = ∏_{i=1}^m τᵢ(N_{L₁/EF_{iq}}α)^{m−i} · cτᵢ(N_{L₁/EF_{iq}}α)^{i−1}` for `α ∈ L₁^×` (the infinity type of Boxer–Calegari–Gee–Newton–Thorne, Proposition 6.2.3(6a); equivalently, the complex Hecke character `x ↦ Ψ₀(x)∏_σ σ(x_∞)^{−a_σ}` is `∏_σ σ(x)^{−a_σ}` on the identity component of `(L₁ ⊗ ℝ)^×`, and the `λ`-adic avatar has labelled Hodge–Tate weight `a_σ` at `σ`), unramified at the places above `v₀` and at the places above `q₁` other than `w₁, …, w_m`, with restrictions `Ψ₀|_{O^×_{L_{1,w_i}}}` wildly ramified, pairwise distinct and of product one; then a CM `F₂/F₁` and a finite-order twist `Ψ₂` of `Ψ₀ ∘ N_{L₂/L₁}` with `det Ind Ψ_{2,λ} = ε^{−m(m−1)/2}`. Then `R_CM = {Ind_{G_{L₂}}^{G_{F₂}} Ψ_{2,λ}}_λ` is a weakly compatible system of rank `m` with Hodge–Tate weights `{0, …, m − 1}` and, for the primes `N` and `r` and the place `𝔯 | r` chosen in §9.9, residual representation `r̄_{CM,𝔯}` absolutely irreducible on `G_{F₂(ζ_N, ζ_r)}`. `F₂` stays linearly disjoint from the cyclic `E`, the determinant-correcting twist is unramified at `v₁`, the residual prime `r` differs from `q₁`, and `N` is unramified in `L₂(ζ_r)`. (Boxer–Calegari–Gee–Newton–Thorne, proof of Theorem 6.2.4, construction of `Ψ` and `R_CM`, arXiv v3 pp. 64–65.)

The construction has the following API.

- `R_CM` has rank `m = [L₂ : F₂]`.
- `det R_{CM,λ} = ε^{−m(m−1)/2}`, matching `det W_λ` in rank `m`.
- `HT_τ(R_{CM,λ}) = {0, …, m − 1}` at every embedding.
- `r̄_{CM,𝔯}|_{G_{F₂(ζ_N, ζ_r)}}` is absolutely irreducible.

*Needs:* §9.14; ArithmeticGaloisDuality §R02.4.6; GlobalNumberFields Layers 9–10; PadicHodgeTheory §3.3; PotentialModularityAndCompatibleSystems §§1.4, 1.9, 1.11, 2.14, 2.15.

*Proof sketch.* `L₁ = EF₁` is an imaginary CM field (a totally real field times a CM field) and the pair sums `a_σ + a_{cσ} = m − 1` are constant, so §9.14 gives an algebraic Hecke character `Ψ′` of `L₁` of infinity type `(a_σ)`, with some finite conductor. Its restrictions to `O^×_{L_{1,w}}` for `w | v₀` and `w | q₁`, in particular to `O^×_{L_{1,wᵢ}} = O^×_{F_{1,v₁}} = ℤ_{q₁}^×` (`v₁` is split, so `F_{1,v₁} = ℚ_{q₁}`), are of finite order. Prescribe the targets: trivial at `w | v₀` and at the places `w | q₁` other than the `wᵢ`; at `wᵢ`, `ξ^{cᵢ}`, where `ξ` is a character of `ℤ_{q₁}^×`, trivial on the roots of unity, of exact `q₁`-power order `Q > (m − 1)(m + 2)/2`, and `cᵢ = i` for `i < m`, `c_m = −m(m − 1)/2` (these residues are nonzero and pairwise distinct modulo `Q`, so the `ξ^{cᵢ}` are wildly ramified and pairwise distinct, and `∑cᵢ = 0` gives product one). The quotients of target and `Ψ′` are finite-order characters of the unit groups; extended to `L_{1,w}^×` by a value of finite order on a uniformiser and then to a finite-order idele class character `η` (PotentialModularityAndCompatibleSystems §2.15), they give `Ψ₀ = Ψ′η`. Determinant: at every `τ : F₁ ↪ ℚ̄_l` the induction `Ind_{G_{L₁}}^{G_{F₁}}Ψ_{0,λ}` has labelled Hodge–Tate weights `{a_σ : σ | τ} = {0, …, m − 1}` (PotentialModularityAndCompatibleSystems §§1.4, 1.9), so its determinant has weight `m(m − 1)/2` at every `τ` (PadicHodgeTheory §3.3) and `η₀ = ε^{m(m−1)/2} det Ind Ψ_{0,λ}` is a de Rham character of weight zero everywhere. By §1.9 (converse) it is the avatar of an algebraic Hecke character of the CM field `F₁` with trivial infinity type; that character is trivial on the connected group `(F₁ ⊗ ℝ)^×`, hence factors through a profinite quotient and has finite order; its Frobenius values do not depend on `λ`. It is unramified at `v₀` (`Ψ₀` is unramified above `v₀` and `L₁/F₁` is unramified there, `p₀` being unramified in `E`) and at every place `v′ | q₁` of `F₁`: `v′` splits completely in `L₁`, so inertia at `v′` acts on the induction through the restrictions of `Ψ₀` to the unit groups above `v′`, whose product is one at `v₁` and which are trivial at the other `v′`. ArithmeticGaloisDuality §R02.4.6, with exponent `m` and avoidance field `EF₁`, with `T = {q₁}` (`q₁` is odd), gives a totally real Galois `M′/ℚ` linearly disjoint from `EF₁` and a finite-order `ψ` of `G_{F₁M′}` with `η₀|_{G_{F₁M′}} = ψ^m`, unramified at every place above `q₁`, in particular above `v₁`. Put `F₂ = F₁M′`, which is CM and Galois over `ℚ`; disjointness through towers (PotentialModularityAndCompatibleSystems §2.14, with `C = ℚ`, `B = F₁`, `A = EF₁`, `D = M′`) gives `EF₁ ∩ F₂ = F₁`, so `F₂` is linearly disjoint from `E`, `[L₂ : F₂] = m`, and `Ind_{G_{L₂}}^{G_{F₂}}(Ψ_{0,λ}|_{G_{L₂}}) = (Ind_{G_{L₁}}^{G_{F₁}}Ψ_{0,λ})|_{G_{F₂}}`. With `Ψ₂ = (Ψ₀ ∘ N_{L₂/L₁})·(ψ⁻¹ ∘ N_{L₂/F₂})`, `Ind(Ψ_{2,λ}) = (Ind Ψ_{0,λ})|_{G_{F₂}} ⊗ ψ⁻¹`, so `det Ind Ψ_{2,λ} = ε^{−m(m−1)/2}η₀ψ^{−m} = ε^{−m(m−1)/2}`. Induction of a character family is a family (PotentialModularityAndCompatibleSystems §1.4), pure by §1.11, with algebraic characters by §1.9; distinct wild restrictions at the `wᵢ`, preserved by reduction at `r ≠ q₁`, make the residual induction irreducible after restriction. (Boxer–Calegari–Gee–Newton–Thorne, proof of Theorem 6.2.4, arXiv v3 pp. 64–65, which obtains `Ψ₀` from a lemma of Harris–Shepherd-Barron–Taylor restated as Barnet-Lamb–Gee–Geraghty–Taylor, Lemma A.2.4, arXiv v4 p. 88.)

**Checks.**

- The induction formula `Ind_{G_L}^{G_F}Ψ` has rank one when `L = F`; this checks the induction functor only, outside the hypothesis `m ≥ 2`.
- If the restrictions `Ψ₀|_{O^×_{wᵢ}}` were equal, `Ind Ψ₀` could become reducible after restriction to `G_{F(ζ_N, ζ_r)}`.
- `det Ind Ψ_{2,λ} = ε^{−m(m−1)/2}` gives weight sum `m(m − 1)/2`, consistent with `{0, …, m − 1}`.
- For `m = 3` the conjugate pairs `(a_σ, a_{cσ})` are `(2, 0)`, `(1, 1)` and `(0, 2)`, each of sum `2 = m − 1`, so §9.14 applies; an exponent family with pair sums `2` and `1`, such as `(2, 0)` above `τ₁` and `(1, 0)` above `τ₂`, is the infinity type of no algebraic Hecke character, because the pair sums of an algebraic Hecke character of a CM field are constant (GlobalNumberFields Layer 10, purity of infinity types).
- The local targets at `v₁` for `m = 3`, `q₁ = 7` and `Q = 7 > 5`: `(c₁, c₂, c₃) = (1, 2, −3) ≡ (1, 2, 4) (mod 7)`, nonzero, pairwise distinct, of sum `0`; the choice `(1, 2, 3)` has sum `6 ≢ 0` and would leave `det Ind Ψ₀` ramified at `v₁`.
- Here `L₁/F₁` is cyclic of degree `m` over a CM field; a determinant formula for inductions from a quadratic CM extension of a totally real field has rank two and does not apply for `m ≥ 3`, which is why the determinant is computed from the Hodge–Tate weights above.

### 9.9 Choice of primes and fields for the `p`–`r` switch

With the standing data of §9.8 and the system `R_CM` constructed there, there are primes `N, p, r, q`, places and fields with: `N > 100nm + 100` prime, different from `p₀`, unramified in `L₂` and `M_R`; `p ≡ −1`, `r ≡ 1 (mod N)`; `p, r > 2nm + 1`, in the density-one set of PotentialAutomorphyInfrastructure §2.20 for `R|_{G_{F₂}}` (crystalline with the Hodge–Tate weights of `R`, residual image containing `SL₂`) and prime to `v₀v₁`; `p` split in `L₂` and `M_R`, `r` split in `L₂(ζ_p)` and `M_R`; `Ψ₂` unramified above `p` and `r`; places `𝔭 | p` and `𝔯 | r` of `M_R` at which the residual representations `r̄_𝔭`, `r̄_𝔯` of `R` have image between `SL₂` and `GL₂` of `𝔽_p`, resp. `𝔽_r`; `r̄_{CM,𝔯}|_{G_{F₂(ζ_N,ζ_r)}}` absolutely irreducible; the `p`-adic places of `F₂` split into `Σ^ord ∪ Σ^ss` by §9.6; the field `B` cut out over `F₂(ζ_N, ζ_p, ζ_r)` by `r̄_𝔭 × r̄_𝔯 × r̄_{CM,𝔯}`; a solvable CM extension `F₃/F₂(ζ_N)`, Galois over `ℚ` and linearly disjoint from `B` over `F₂(ζ_N)`; and, after adjoining `e^{2πi/N}` to `M_R` and extending `𝔭`, `𝔯` to places of the enlarged field, a semistable elliptic curve `A/ℚ` with good reduction at `p, r, p₀` and a prime `q ∉ {p, r, p₀}`, `q > 2nm + 1`, split in `M_R` (so `q ≡ 1 (mod N)`), with a place `𝔮 | q`, `ρ̄_{A,q}(G_{F₃}) = GL₂(𝔽_q)` for `ρ̄_{A,q} = H¹_ét(A_ℚ̄, 𝔽_q)` (determinant `ε̄_q⁻¹`) and `A` good ordinary at `q`. Put `B′` for the compositum of `B` with the field cut out over `F₃` by `ρ̄_{A,q}`. (Boxer–Calegari–Gee–Newton–Thorne, proof of Theorem 6.2.4, choice of `N, p, r, q, F₃`, arXiv v3 p. 65.)

*Needs:* §§9.6, 9.8; Chebotarev Layer 10; PotentialAutomorphyInfrastructure §2.20; ModularityAndLanglandsExtensions §2.18.

*Proof sketch.* Primes `p ≡ −1`, `r ≡ 1 (mod N)` with the splitting conditions have positive density (Chebotarev); the primes at which `R|_{G_{F₂}}` is crystalline with residual image containing `SL₂(𝔽_l)` have density one (PotentialAutomorphyInfrastructure §2.20; density-one residual irreducibility alone does not give the containment), and the remaining exclusions are finite. §9.6 sorts the places above `p`. A semistable elliptic curve `A/ℚ` has no complex multiplication (a CM curve over `ℚ` has potentially good reduction everywhere, so a semistable one would have good reduction everywhere, which no elliptic curve over `ℚ` has); by ModularityAndLanglandsExtensions §2.18 with `L = F₃`, `ρ̄_{A,q}(G_{F₃}) = GL₂(𝔽_q)` for every large `q` and `A` is good ordinary at a density-one set of primes, so intersecting with the positive-density set of primes split in `M` (Chebotarev) and removing `p, r, p₀` and the primes `q ≤ 2nm + 1` leaves a choice of `q`.

**Checks.**

- `p = 2N − 1` and `r = 2N + 1` satisfy the congruences when they are prime.
- `q` must differ from `p₀` as well as from `p` and `r`.
- Irreducibility of the residual image does not give the `SL₂` containment: the normaliser of the split torus in `GL₂(𝔽₇)` is irreducible of order `72`, while `#SL₂(𝔽₇) = 336`; this is why the large-image set of PotentialAutomorphyInfrastructure §2.20 is used rather than density-one irreducibility.
- `N` prime gives `−1 ∈ ⟨p⟩` for every `p` of even order modulo `N`; here `p ≡ −1` makes the unitary case of §5.8 apply at `p` and the split case at `r`.

### 9.10 The auxiliary Dwork system `R_aux` for `m > 2`

Let `m > 2`, keep the standing data and `R_CM` of §9.8 and the choices of §9.9, and let `F₄` and the opens `_kΩ_v` (`k ∈ {m, nm}`) be given by §9.7 for these data. Moret-Bailly with surjective specialization (PotentialModularityAndCompatibleSystems §2.20) applied to `T(r̄_{CM,𝔯}|_{G_{F₄}})` (`r ≡ 1 (mod N)`, §5.11), with `f : π₁^ét(T) ↠ G` onto the image `G ⊆ GU_m(𝔽_{p²})` of the residual system `W̄_𝔭` (which contains `SU_m(𝔽_{p²})`, §5.8), avoidance field `B′F₄`, `S₀ = {p, r, p₀, q}`, `L_v = F_{4,v}` and the opens `_mΩ_v`, gives a CM field `F₅/F₄`, Galois over `ℚ` and linearly disjoint from `B′F₄` over `F₄`, in which every place above `prp₀q` splits completely, and `t` with `R_aux = {(W^ℚ_{t,λ})^{ss}}_λ` (the weakly compatible system of §7.11 for the rank-`m` datum, with members at all finite places `λ` of `M`; at `𝔭` and `𝔯` the residual representations below are absolutely irreducible, so `W_{t,𝔭}` and `W_{t,𝔯}` are irreducible and equal their semisimplifications): `r̄_{aux,𝔭}(G_{F₅}) = G` with multiplier `ε̄^{1−m}`, `r̄_{aux,𝔭}(G_{F₅(ζ_p)}) = SU_m(𝔽_{p²})`, `r̄_{aux,𝔯} ≅ r̄_{CM,𝔯}`, and the local properties (i)–(v) of §9.7 for `k = m`. (Boxer–Calegari–Gee–Newton–Thorne, proof of Theorem 6.2.4, construction of `R_aux`, arXiv v3 pp. 66–67, where the image `GU_m(𝔽_{p²})` must be replaced by `G`.)

*Needs:* §§0.9, 3.6, 5.7, 5.8, 5.11, 5.12, 7.11, 9.7, 9.8, 9.9; PotentialModularityAndCompatibleSystems §2.20.

*Proof sketch.* The torsor is smooth and geometrically irreducible (§5.12), the opens nonempty (§9.7), and `f` is surjective by definition of `G` as the full arithmetic image; its geometric subgroup contains `SU_m`. Surjective specialization gives residual image exactly `G`, and taking `L_v = F_{4,v}` makes the places above `prp₀q` split. On `G_{F₅(ζ_p)}` both the multiplier `ε̄^{1−m}` and the determinant `ε̄^{−m(m−1)/2}` are trivial, so the image lies in `SU_m`; `SU_m` is perfect (§0.9) and contained in `G`, so commutators of lifts put it in the restricted image.

**Checks.**

- `det r_aux = ε^{−m(m−1)/2}` is compatible with the image `G` but not with all of `GU_m(𝔽_{p²})`, whose determinants include norm-one elements outside `𝔽_p^×`.
- The multiplier alone does not cut out `SU_m`: `x ↦ x^{1−m}` on `𝔽_p^×` need not be injective (for `m = 3` its kernel is `{±1}`), so its kernel is larger than `{1}`.
- For `m = 2` no Dwork datum of rank two is defined (§9.7 needs `k > 2`); `R_aux` is then the `H¹` of an elliptic curve (§9.11), with image `SL₂(𝔽_p) ≅ SU₂(𝔽_{p²})` on `G_{F₅(ζ_p)}`.

### 9.11 The auxiliary system `R_aux` in rank two via twisted modular curves

Let `m = 2`, keep the standing data and `R_CM` of §9.8 and the choices of §9.9, and let `F₄`, the opens `_{2n}Ω_v` (for `n ≥ 2`) and the curves `D_v` of (vi) be given by §9.7 for these data. There are a CM field `F₅/F₄`, Galois over `ℚ` and linearly disjoint from `B′F₄` over `F₄`, in which every place above `prp₀q` splits completely, and an elliptic curve `A_aux/F₅` such that `R_aux = {H¹(A_aux)_λ}_λ` (rank two, Hodge–Tate weights `{0, 1}`, determinant `ε^{−1}`), with `r̄_{aux,𝔭} = H¹_ét(A_{aux,F̄₅}, 𝔽_p)` and `r̄_{aux,𝔯} = H¹_ét(A_{aux,F̄₅}, 𝔽_r)`, satisfies: (a) `r̄_{aux,𝔯} ≅ r̄_{CM,𝔯}|_{G_{F₅}}`, compatibly with the cup-product pairing and the alternating form of multiplier `ε̄_r⁻¹` on the seed; (b) `r̄_{aux,𝔭}(G_{F₅}) = GL₂(𝔽_p)` and `r̄_{aux,𝔭}(G_{F₅(ζ_p)}) = SL₂(𝔽_p)`, which is `SU₂(𝔽_{p²})` under the identification of `SU₂` with `SL₂`, and the fields cut out over `F₅(ζ_p)` by the projective images of `r̄_𝔭` and `r̄_{aux,𝔭}` are linearly disjoint; (c) `A_aux` has good reduction at every place `v | prp₀q`, and `r̄_{aux,𝔭}`, `r̄_{aux,𝔯}` are trivial on `G_{F_{5,v}}` there; (d) the reduction is ordinary at `v ∈ Σ^ord` and at `v | r`, so that `r_{aux,𝔭}|_{G_{F_{5,v}}}`, resp. `r_{aux,𝔯}|_{G_{F_{5,v}}}`, is crystalline ordinary, and supersingular at `v ∈ Σ^ss`, where `r_{aux,𝔭}|_{G_{F_{5,v}}}` connects to `ρ_{2,1,0}|_{G_{F_{5,v}}}`. The source treats this case as a variant left to the reader; (b) is the rank-two image condition of its Proposition 6.2.3(13). (Boxer–Calegari–Gee–Newton–Thorne, proof of Theorem 6.2.4, arXiv v3 pp. 66–67, and Proposition 6.2.3(13), p. 62.)

*Needs:* §§9.5, 9.6, 9.7, 9.8, 9.9; ModularCurves §5C; ModularCurvesPartII §5.14; EllipticCurves Layers 3–4; PotentialModularityAndCompatibleSystems §2.20; LocalGaloisDeformationRings §§6.8, 6.19.

This target uses the requirement `gap:twisted-modular-curve-over-number-fields` stated in the contract with ModularCurvesPartII, for the twisted curve over `F₄`, its universal curve and its mod-`p` monodromy. Through the curves `D_v` of §9.7(vi) it also uses §9.13.

*Proof sketch.* Let `T = Y(r̄_{CM,𝔯}^∨)` over `F₄`, the twisted modular curve of level `r` for the dual of the seed, whose determinant is `ε̄_r`: its points are elliptic curves `A` with `A[r] ≅ r̄_{CM,𝔯}^∨` respecting the Weil pairing, equivalently `H¹_ét(A, 𝔽_r) ≅ r̄_{CM,𝔯}`. It is smooth and geometrically connected, hence geometrically irreducible, and the geometric mod-`p` monodromy of its universal curve `𝒜` is `SL₂(𝔽_p)`. Let `f : π₁^ét(T) → GL₂(𝔽_p) × GL₂(𝔽_p)` be the product of `r̄_𝔭` (through `T → Spec F₄`) with the mod-`p` representation of `H¹(𝒜)`, and `J` its image. `J` contains `{1} × SL₂(𝔽_p)`, its second factor has determinant `ε̄_p⁻¹`, and `ε̄_p(G_{F₄}) = 𝔽_p^×` (`F₄` is linearly disjoint over `F₃` from `B′ ∋ ζ_p`, `F₃` over `F₂(ζ_N)` from `B`, and `F₂(ζ_N)` is unramified at `p`); so the second projection of `J` is `GL₂(𝔽_p)` and the subgroup of `J` on which `ε̄_p` is trivial is `r̄_𝔭(G_{F₄(ζ_p)}) × SL₂(𝔽_p)`. At `v | prp₀q`, `r̄_{CM,𝔯}` and `D_v[r]` are trivial on `G_{F_{4,v}}` and `μ_r ⊂ F_{4,v}` (§9.7), so `D_v` with a pairing-compatible level structure is a point `x_v ∈ T(F_{4,v})`. Let `Ω_v` be a neighbourhood of `x_v` on which the mod-`p^c` representation of `𝒜` stays isomorphic to that of `D_v` (§9.5, general form, `c` as in §9.7(ii)) and `j` stays congruent to `j(D_v)` modulo the maximal ideal. A curve in `Ω_v` has integral `j`, hence potentially good reduction, and trivial `ℓ`-torsion for some `ℓ ∈ {p, r}` prime to the residue characteristic, hence good reduction (EllipticCurves Layer 4, Néron–Ogg–Shafarevich under potentially good reduction); its reduction has the `j`-invariant of that of `D_v`, hence the same ordinary or supersingular type (EllipticCurves Layer 3); at `v ∈ Σ^ss` its `H¹` connects to `ρ_{2,1,0}` by the argument of §9.7(ii). Surjective specialization (PotentialModularityAndCompatibleSystems §2.20) with `L_v = F_{4,v}`, `S₀ = {p, r, p₀, q}`, these `Ω_v`, the avoidance field `B′F₄` and `f` gives `F₅` and a point with image `J`, whence (b); (a), (c) and (d) hold by the choice of `T` and of the `Ω_v`.

**Checks.**

- `SU₂(𝔽_{p²}) ≅ SL₂(𝔽_p)`, so the image requirement on `G_{F₅(ζ_p)}` is `SL₂(𝔽_p)`; on `G_{F₅}` it is `GL₂(𝔽_p)`, because the determinant `ε̄_p⁻¹` is onto `𝔽_p^×` there.
- The level-`r` input uses the dual of the CM seed on `A[r]`: its determinant is `ε̄_r`, while `H¹` and the seed have determinant `ε̄_r⁻¹`; confusing them fails the Weil-pairing test.
- Surjectivity of each projection does not give the disjointness in (b): the diagonal of `SL₂(𝔽₅) × SL₂(𝔽₅)` projects onto both factors but has `120` elements rather than `14400`, and its two projective fields coincide; surjectivity onto `J`, whose cyclotomic kernel is a product, excludes it.
- Integral `j` alone does not give good reduction: `y² = x³ − x` over `ℚ₂` has `j = 1728` and bad reduction; on `Ω_v` good reduction comes from the trivial `ℓ`-torsion for an odd `ℓ` prime to the residue characteristic.
- The existence of a supersingular point alone does not give the component comparison; the connection to `ρ_{2,1,0}` is the separate input.

### 9.12 The second auxiliary system `S_UA`

Let `n ≥ 1` and `m ≥ 2`, keep the standing data and `R_CM` of §9.8, the choices of §9.9 and the local data of §9.7, and let `F₅`, `R_aux` and `r̄_{aux,𝔭}` be those of §9.10 when `m > 2` and of §9.11 when `m = 2`. Put `S_aux = (Sym^{n−1}R|_{G_{F₅}}) ⊗ R_aux`, formed memberwise, over a common enlarged coefficient field, by the restriction, symmetric-power and semisimplified tensor operations of PotentialModularityAndCompatibleSystems §1.7, and let `s̄_{aux,𝔭} = (Sym^{n−1}r̄_𝔭|_{G_{F₅}}) ⊗ r̄_{aux,𝔭}` be its residual member at `𝔭`, over `𝔽_{p²} = k(𝔭)` (for `m = 2` after extending the scalars of `H¹_ét(A_aux, 𝔽_p)`). It has rank `nm`; its determinant is `ε̄_p^{−nm(nm−1)/2}`, because `det Sym^{n−1}r̄_𝔭 = ε̄_p^{−mn(n−1)/2}` and `det r̄_{aux,𝔭} = ε̄_p^{−m(m−1)/2}`; and the members of `S_aux` at the places where `R` has weights `{0, m}` have labelled weights `{am + b : 0 ≤ a < n, 0 ≤ b < m} = {0, …, nm − 1}`, each once. The alternating form `r̄_𝔭 × r̄_𝔭 → det r̄_𝔭 = ε̄_p^{−m}` induces on `Sym^{n−1}r̄_𝔭` a nondegenerate `(−1)^{n−1}`-symmetric `𝔽_p`-bilinear form with multiplier `ε̄_p^{−m(n−1)}` (`p > n − 1`); `r̄_{aux,𝔭}` carries a nondegenerate skew-Hermitian form with multiplier `ε̄_p^{1−m}` (§5.7 when `m > 2`; for `m = 2` the alternating cup-product pairing of `H¹_ét(A_aux, 𝔽_p)`, with values in `ε̄_p⁻¹`, extended sesquilinearly to `𝔽_{p²}`). Extending the first form sesquilinearly and tensoring gives a nondegenerate sesquilinear form on `s̄_{aux,𝔭}` with multiplier `ε̄_p^{1−nm}`, skew-Hermitian for `n` odd and Hermitian for `n` even. Then:

(1) If `nm > 2`: after multiplying by a nonzero trace-zero scalar when `n` is even (§0.6), this is the skew-Hermitian level datum of §5.11(3) in rank `nm`, isometric to that of the rank-`nm` system `W̄_𝔭` (§0.7), and a determinant identification compatible with the two pairings exists because the norm `𝔽_{p²}^× → 𝔽_p^×` is surjective. Moret-Bailly (PotentialModularityAndCompatibleSystems §2.20, without a finite quotient) applied to `T(s̄_{aux,𝔭}, Sym^{nm−1}ρ̄_{A,q}|_{G_{F₅}})` for the rank-`nm` Dwork system, with these level data, `S₀ = {p, r, p₀, q}`, `L_v = F_{5,v} = F_{4,v}` (the places above `prp₀q` split in `F₅/F₄`), the opens `_{nm}Ω_v` and the avoidance field `B′F₅` enlarged by the field cut out by `r̄_{aux,𝔭}`, gives `F₆` and `S_UA = {(W^ℚ_{t′,λ})^{ss}}_λ`, the system of §7.11 for the rank-`nm` datum, with `s̄_{UA,𝔭} ≅ s̄_{aux,𝔭}|_{G_{F₆}}`, `s̄_{UA,𝔮} ≅ Sym^{nm−1}ρ̄_{A,q}|_{G_{F₆}}` and the local properties (i)–(v) of §9.7 for `k = nm`.

(2) If `(n, m) = (1, 2)`: then `S_aux = R_aux`. Let `ρ = (H¹_ét(A_aux, 𝔽_p) × ρ̄_{A,q}|_{G_{F₅}})^∨ : G_{F₅} → GL₂(𝔽_p) × GL₂(𝔽_q) = GL₂(ℤ/pq)`, whose determinant is the mod-`pq` cyclotomic character. Moret-Bailly applied to the twisted modular curve `Y(ρ)` over `F₅` of level `pq`, with `S₀ = {p, r, p₀, q}`, `L_v = F_{5,v} = F_{4,v}`, neighbourhoods of the points given by the curves `D_v` of §9.7(vi) and the avoidance field `B′F₅` enlarged by the field cut out by `r̄_{aux,𝔭}`, gives `F₆` and an elliptic curve `A_UA/F₆` with `S_UA = {H¹(A_UA)_λ}_λ`: `H¹_ét(A_UA, 𝔽_p) ≅ H¹_ét(A_aux, 𝔽_p)|_{G_{F₆}}` and `H¹_ét(A_UA, 𝔽_q) ≅ ρ̄_{A,q}|_{G_{F₆}}`; good reduction at every place above `prp₀q`, with trivial mod-`p` and mod-`q` representations there; ordinary reduction at `Σ^ord` and above `q`; and supersingular reduction at `Σ^ss`, where `s_{UA,𝔭}` connects to `ρ_{2,1,0}`.

In both cases `F₆/F₅` is CM, Galois over `ℚ` and linearly disjoint from the enlarged avoidance field, and `S_UA` is weakly compatible of rank `nm` with Hodge–Tate weights `{0, …, nm − 1}` and determinant `ε^{−nm(nm−1)/2}`. (Boxer–Calegari–Gee–Newton–Thorne, proof of Theorem 6.2.4, construction of `S_aux` and `S_UA`, arXiv v3 p. 67, where the final avoidance field must include the field cut out by the new auxiliary system; the Dwork families of that paper have rank greater than two (§4.1, arXiv v3 p. 40), so its second switch needs `nm > 2`, and (2) is the rank-two variant.)

*Needs:* §§0.6, 0.7, 5.7, 5.11, 5.12, 7.11, 9.5, 9.6, 9.7, 9.9, 9.10, 9.11; ModularCurves §5C; ModularCurvesPartII §5.14; EllipticCurves Layers 3–4; PotentialModularityAndCompatibleSystems §§1.7, 2.20; LocalGaloisDeformationRings §§6.8, 6.19; Mathlib `FiniteField.unitsMap_norm_surjective`.

This target uses the requirement `gap:twisted-modular-curve-over-number-fields` stated in the contract with ModularCurvesPartII, for the twisted curve of level `pq` over `F₅` in (2). Through the curves `D_v` of §9.7(vi) it also uses §9.13.

*Proof sketch.* (1): the torsor is smooth and geometrically irreducible (§5.12, with `p ≠ q`, `max(p, q) > 10` and `k(𝔮) = 𝔽_q`, since `q` splits in `M`), and the opens are nonempty because every local residual representation involved is trivial at the places above `prp₀q` (§9.7, and §9.10 or §9.11(c)); the Hermitian structures match by §0.7 after the trace-zero rescaling of §0.6 when `n` is even. For `m = 2` the sesquilinear extension `H` of the cup-product pairing `B` is skew-Hermitian: for `x, y` in the `𝔽_p`-form, `H(y, x)^c = B(y, x) = −B(x, y) = −H(x, y)`. (2): as in §9.11 at level `pq`: `Y(ρ)` is smooth and geometrically irreducible (the requirement on ModularCurvesPartII, with `r = pq ≥ 3`); `D_v` with a level structure is a point over `F_{5,v} = F_{4,v}`, because `ρ` (by §9.7 and §9.11(c)) and the `p`- and `q`-torsion of `D_v` are trivial there and `μ_{pq} ⊂ F_{4,v}`; and on small neighbourhoods good reduction (trivial `ℓ`-torsion for an `ℓ ∈ {p, q}` prime to the residue characteristic, EllipticCurves Layer 4), its type (EllipticCurves Layer 3), the trivial residual representations (§9.5) and, at `Σ^ss`, the connection to `ρ_{2,1,0}` (§9.7(ii)) persist. In both cases, enlarging the avoidance field by the field cut out by `r̄_{aux,𝔭}` keeps its image on `G_{F₆}` equal to that on `G_{F₅}`.

**Checks.**

- For `(n, m) = (2, 3)` the weights of `S_aux` are `{0, 3} + {0, 1, 2} = {0, 1, 2, 3, 4, 5}`, of rank `6` and sum `15`, matching the determinant `ε̄^{−15} = ε̄^{−6·5/2}` of the rank-six system `W̄_𝔭`; an arbitrary rank-six residual representation, such as the trivial one, has determinant `1` and admits no determinant identification, so it is not a level datum for the second switch.
- For `(n, m) = (3, 2)`: `Sym²R` has weights `{0, 2, 4}` and determinant `ε^{−6}`, `R_aux` has weights `{0, 1}` and determinant `ε^{−1}`; the tensor product has rank `6`, weights `{0, 1, 2, 3, 4, 5}` and determinant `(ε^{−6})²(ε^{−1})³ = ε^{−15}`, and since `n = 3` is odd its form is already skew-Hermitian. This instance of (1) takes its `R_aux` from §9.11.
- For `(n, m) = (1, 2)`: rank `2`, weights `{0, 1}`, determinant `ε^{−1}`; no Dwork datum of rank two is defined (§9.7 needs `k > 2`), so (2) uses the twisted modular curve, whose `q`-level datum is `H¹(A, 𝔽_q)`, of determinant `ε̄_q⁻¹`, dual to `A[q]`.
- The sign of the induced form depends on `n`: for `n = 2` the form on `Sym¹r̄_𝔭 = r̄_𝔭` is alternating, its tensor product with a skew-Hermitian form is Hermitian, and the trace-zero rescaling is needed to reach the skew-Hermitian datum of §5.11(3); for `n = 1`, `s̄_{aux,𝔭} = r̄_{aux,𝔭}` already carries it.
- Without enlarging the avoidance field by the field cut out by `r̄_{aux,𝔭}`, later base changes could shrink the residual image.

### 9.13 Elliptic curves over prime fields with prescribed Frobenius trace

For every prime `p` and every integer `β` with `β² ≤ 4p` there is an elliptic curve `E` over `𝔽_p` with Frobenius trace `p + 1 − #E(𝔽_p) = β`. In particular a curve of trace `1` is ordinary and a curve of trace `0` is supersingular, by the criterion of EllipticCurves Layer 3 that a curve over a finite field of characteristic `p` is supersingular exactly when `p` divides its trace; so every prime field carries an ordinary and a supersingular elliptic curve. (Waterhouse, *Abelian varieties over finite fields*, Theorem 4.1, p. 536, at `q = p`, after Deuring: the admissible traces are the integers prime to `p` with `β² ≤ 4p`, the integer `0`, and `±p` when `p = 2, 3`, which together are all integers with `β² ≤ 4p`.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §8.3; FaltingsFinitenessAndIsogenyTheorems §R28.6.1; EllipticCurves Layers 1 and 3.

*Proof sketch.* Let `π` be a root of `X² − βX + p`. Since `4p` is not a square, `β² < 4p`, so `ℚ(π)` is imaginary quadratic and `|π|² = p` under both complex embeddings: `π` is a `p`-Weil integer, and Honda–Tate (EndoscopicTransferAndUnitaryTraceComparison §8.3) gives a simple abelian variety `A` over `𝔽_p` with Frobenius `π` and `2 dim A = 2e`. There are no real places. If `p ∤ β`, the polynomial is `X(X − β)` modulo `p` with distinct roots and `p ∤ β² − 4p`, so `p` splits in `ℚ(π)` and `v(π)/v(p)` is `0` or `1` at the two places above `p`. If `p | β`, then `β = 0`, or `β = ±p` with `p ≤ 3`; `p` ramifies in `ℚ(π)` (in `ℚ(√−p)`, `ℚ(i)` or `ℚ(√−3)`), and `v(π)/v(p) = 1/2` at the single place above `p`, of local degree `2`. In both cases every invariant is `0`, so `e = 1` and `A` is one-dimensional, hence a Weierstrass elliptic curve `E` (FaltingsFinitenessAndIsogenyTheorems §R28.6.1). The Frobenius of `E` has characteristic polynomial `X² − βX + p` on the Tate module, so `#E(𝔽_p) = deg(1 − π_p) = 1 − β + p` (EllipticCurves Layer 1) and the trace is `β`.

**Checks.**

- Over `𝔽₂` the nonsingular Weierstrass curves realise exactly the traces `−2, −1, 0, 1, 2`, the integers with `β² ≤ 8`: `y² + y = x³` has `3` points (trace `0`), `y² + xy = x³ + x² + 1` has `2` points (trace `1`) and `y² + y = x³ + x` has `5` points (trace `−2`). Over `𝔽₃`, `𝔽₅` and `𝔽₇` the realised traces are likewise exactly the integers with `β² ≤ 4p`.
- Supersingular is not the same as trace `0`: `y² + y = x³ + x` over `𝔽₂` has trace `−2`, divisible by `2`, so it is supersingular (Waterhouse's case `β = ±p`). The trace-`0` curve of the statement is supersingular because `p | 0`; for `p ≥ 5`, `|β| ≤ 2√p < p` makes trace `0` the only supersingular trace.
- The bound cannot be dropped: no curve over `𝔽₂` has trace `3`, which would give `#E(𝔽₂) = 0` although the origin is a point, and `3² = 9 > 8`.
- Over `𝔽₅`, the root `π` of `X² − X + 5` generates `ℚ(√−19)`, in which `5` splits (`−19 ≡ 1 = 1²` modulo `5`), so the class is one-dimensional; `y² = x³ + 3x + 2` has `5` points, trace `1`, and is ordinary, while `y² = x³ + 1` has `6` points, trace `0`, and is supersingular.

### 9.14 Algebraic Hecke characters of imaginary CM fields with prescribed infinity type

Let `L` be an imaginary CM field with complex conjugation `c`, and `(a_σ)` integers indexed by the embeddings `σ : L ↪ ℂ` such that `a_σ + a_{cσ} = w` does not depend on `σ`. Then there is a continuous homomorphism `Ψ : 𝔸_L^× → ℚ̄^×` with open kernel (`ℚ̄ ⊂ ℂ`) such that `Ψ(α) = ∏_σ σ(α)^{a_σ}` for every `α ∈ L^×`. Equivalently, `χ(x) = Ψ(x) ∏_σ σ(x_∞)^{−a_σ}` is a Hecke character of `L` in the sense of GlobalNumberFields Layer 9 (Tau Ceti `TauCeti.GlobalNumberFields.HeckeCharacter L`), algebraic of type `A₀` (`TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic`), whose restriction to `(L ⊗ ℝ)^×` is `x ↦ ∏_σ σ(x)^{−a_σ}`; this is the form used in §9.8. No condition is imposed on the finite conductor. The hypothesis on the pair sums is necessary, by the purity of algebraic infinity types (Tau Ceti `TauCeti.GlobalNumberFields.HeckeCharacter.add_conjugate_eq_add_conjugate`). (Barnet-Lamb–Gee–Geraghty–Taylor, Lemma A.2.4, arXiv v4 p. 88, which restates a special case of a lemma of Harris–Shepherd-Barron–Taylor.)

*Needs:* GlobalNumberFields Layers 2, 7, 9 and 10; GL2AutomorphicRepresentationsAndTransfer §R16.1.7; Mathlib `NumberField.IsCMField.indexRealUnits_eq_one_or_two`.

*Proof sketch.* Put `φ₀(α) = ∏_σ σ(α)^{a_σ}` for `α ∈ L^×`. For a unit `u` of the maximal totally real subfield `L⁺`, `σ(u) = cσ(u)` for every `σ`, so `φ₀(u) = N_{L⁺/ℚ}(u)^w = ±1`; `φ₀` takes roots of unity to roots of unity; and the real units and the roots of unity generate a subgroup of index `1` or `2` of `O_L^×` (Mathlib `NumberField.IsCMField.indexRealUnits_eq_one_or_two`). So `φ₀` has finite order on `O_L^×`, and Chevalley's theorem (GL2AutomorphicRepresentationsAndTransfer §R16.1.7, with `E = O_L^×` and `H` the kernel of `φ₀` on it) gives a modulus `𝔪` such that every unit congruent to `1` modulo `𝔪` lies in `H`. Let `U` be the idele congruence subgroup of `𝔪` (GlobalNumberFields Layer 7). As `L` has no real places, `U` contains `(L ⊗ ℝ)^×`, and `L^× ∩ U` is the group of units congruent to `1` modulo `𝔪`, on which `φ₀` is trivial. Hence `Ψ(αu) = φ₀(α)` is well defined on the open subgroup `L^×U`, which has finite index in `𝔸_L^×` because its quotient is the ray class group of `𝔪`, a finite group (GlobalNumberFields Layers 2 and 7). Since `ℚ̄^×` is divisible, `Ψ` extends to `𝔸_L^×`, still trivial on `U`; and `χ` is trivial on `L^×` by construction.

**Checks.**

- `L = ℚ(i)` with exponent `1` at the identity and `0` at its conjugate (`w = 1`): `φ₀(u) = u` has order `4` on `ℤ[i]^× = {±1, ±i}`, and among these units only `1` is congruent to `1` modulo `(1 + i)³` (`−1 − 1 = −2` has `(1 + i)`-adic valuation `2`, and `±i − 1` valuation `1`), so `𝔪 = (1 + i)³` serves. At the prime `𝔭 = (3 + 2i)` of norm `13`, where `3 + 2i ≡ 1` modulo `(1 + i)³`, `Ψ` takes the value `3 + 2i` on a uniformiser, whatever the extension, and `3 − 2i` at the conjugate prime; their product `13 = (N𝔭)^w` is the purity relation.
- The finite conductor cannot be required to be trivial: for the same type an everywhere unramified `Ψ` would be trivial on `(L ⊗ ℝ)^× ∏_v O_v^×`, which contains the diagonal `i`, while `Ψ(i) = φ₀(i) = i`.
- The pair-sum hypothesis is what makes `φ₀` of finite order on the units: on `L = ℚ(√2, i)` with exponents `2, 0` on the conjugate pair restricting to the identity of `ℚ(√2)` and `1, 0` on the other pair (pair sums `2` and `1`), the unit `u = 1 + √2` has `φ₀(u) = (1 + √2)²(1 − √2) = −(1 + √2)`, of infinite order. An open kernel meets `O_L^×` in a subgroup of finite index, containing some `u^k` with `φ₀(u^k) ≠ 1`, so no such `Ψ` exists, as purity predicts.

### Examples

For `N = 401`, `n = 3`, `l = 5` and `F = ℚ(i)`: §9.1 needs `k(λ) ⊇ 𝔽_{25}` and the cube roots of `𝔽_{5^s}` inside `k(λ) = 𝔽_{5^{25}}`, which fails since `[k(λ) : 𝔽₅] = 25` is odd; §1.1 is used to choose a larger `N` whose order of `5` is divisible by `2` and by `3s`. The auxiliary prime must then be chosen anew: the prime `3209 = 8·401 + 1` of the Layer 5 example (which is moreover `≡ 2 (mod 3)`, outside the congruence `l′ ≡ 1 (mod n)` of §9.1) does not survive, since `3208 = 8·401` has no odd divisor other than `1` and `401`, so `3209 ≢ 1` modulo any odd `N > 401`. For the new `N` choose a prime `l′_N ≡ 1 (mod N)` and `≡ 1 (mod 3)`, with `l′_N > 2·5·3 + 5 = 35` and unramified in `F^avoid` (§9.1); then `L`, `E` and `T_W` exist, and §9.3 produces a CM field `F′` and a Dwork fibre with residual representations `r̄` at `5` (after untwisting) and `r̄′` at `l′_N`.

### Dependencies

Layers 1, 5, 6, 7 and 8; ArithmeticGaloisDuality §R02.4.6; AbelianSchemesAndArithmeticModuli §§A6.30–A6.31; AlgebraicModuliForArithmeticGeometry §3.4; EtaleCohomologyFoundations §F.0.2; LefschetzPencilsAndVanishingCycles §2.4; LocalGaloisDeformationRings §§6.8, 6.19, 6.25; PadicHodgeTheory §§3.3, 6.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11; ModularCurves §5C; ModularCurvesPartII §5.14; EllipticCurves Layers 1, 3 and 4; Chebotarev Layer 10; GlobalNumberFields Layers 2, 7, 9 and 10; PotentialModularityAndCompatibleSystems §§1.3, 1.4, 1.7, 1.9, 1.11, 2.14, 2.15, 2.16, 2.17, 2.18, 2.20; Mathlib `FiniteField.unitsMap_norm_surjective`, `IsAdicComplete.henselianRing`, `NumberField.IsCMField.indexRealUnits_eq_one_or_two`; PotentialAutomorphyInfrastructure §2.20; ModularityAndLanglandsExtensions §§2.14, 2.18; EndoscopicTransferAndUnitaryTraceComparison §8.3; FaltingsFinitenessAndIsogenyTheorems §R28.6.1; GL2AutomorphicRepresentationsAndTransfer §R16.1.7.

## Downstream consumers

- PotentialAutomorphyInfrastructurePartII: its potential ordinary automorphy of symplectic residual representations over totally real fields (the Dwork-family step of Barnet-Lamb–Gee–Geraghty–Taylor, Theorem 3.1.2) consumes §1.1 and §9.4 for the choice of `N` and the point with `v(t) < 0` above `lᵢ` and `Σ` and `v(t) > 0` above `l′`, §6.8 for the coefficient-independent Frobenius polynomials, and §§7.4, 7.8, 7.10 for the Hodge–Tate, ordinary and Steinberg properties; its ownership list also names the pencil and symmetry data (§§1.1–1.4), the eigen-local-systems, real forms and pairings (§§2.3–2.7), the monodromy (§§4.6, 5.6, 5.10), the symplectic torsors (§§5.11–5.12, which take them and their geometric connectedness from ModularityAndLanglandsExtensions §2.14) and crystallinity at good reduction (§7.7).

## Worked examples

**The Hesse pencil (`N = 3`).** `X₁³ + X₂³ + X₃³ = 3tX₁X₂X₃` is smooth for `t³ ≠ 1` (§1.2); `H₀ ≅ μ₃` acts by translations, trivially on `H¹`, so the only nonzero eigensheaf is the trivial one, of rank two (§2.3), with `B = {1, 2}` for the zero-shaped vector `(0, 0, 0)` (§2.7). The Fermat fibre splits into the lines `(1, 1, 1)` and `(2, 2, 2)` of Hodge degrees `0` and `1` (§2.1), the monodromy around `t = 1` is a transvection with three vanishing cycles (§4.3), and near `t = ∞` the fibres degenerate to the triangle `X₁X₂X₃ = 0` with multiplicative reduction (Layer 8, Examples). This boundary case is excluded from the self-dual family by `N > n + 1`.

**Qian's datum `N = 401`, `n = 3`.** `a = (1, 2, 4, 5, …, 397, 398, 0, 0, 0, 0)`, omitting exactly `3, 399, 400`, has index set `B = {1, 2, 398}` with trivial stabiliser (§§1.4–1.5). The monodromy at zero has eigenvalues `ζ, ζ², ζ^{398}` (§4.2), at infinity a single unipotent block (§4.6), and the companion model is `γ∞ ↦ C((X − 1)³)` with columns `e₂, e₃, (1, −3, 3)ᵀ` (§4.5). For `l = 5` (order `25`) the residual monodromy is `SL₃(𝔽_{5^{25}})` (§§5.1, 5.5); for `l = 3` (order `400`) it is `SU₃(𝔽_{3^{400}})` over `𝔽_{3^{200}}` (§§5.3, 5.8). The Hodge–Tate weights of `W_{t,λ}` are `{0, 1, 2}` (§7.6), `Ψ` has weight `397` (§7.5), and `det(Frob_v | V_{λ,0}) = q^{3·396/2}(g(v,1)g(v,2)g(v,398))³` (§6.2).

**The self-dual datum `N = 5`, `n = 2`.** `a = (1, 0, 0, 0, 4)`, `B = {2, 3} = −B` (§1.4). The real form `V_λ(1)` has rank two with an alternating pairing (§2.5), Hodge–Tate weights `{0, 1}` (§7.4), monodromy `[[0, −1], [1, 2]]` at infinity (§4.6) and full residual monodromy `SL₂(k(λ))` (§5.6); near `t = 0` and for `l ≡ 1 (mod 5)` it is ordinary of weight `0` (§7.8), and at places with `v(t) < 0` away from `l` it is Steinberg (§7.10), like an elliptic curve.

## References

- [Qian] Lie Qian, *Potential automorphy for `GL_n`*, Invent. Math. 231 (2023), 1239–1275, [doi:10.1007/s00222-022-01161-6](https://doi.org/10.1007/s00222-022-01161-6); cited in the numbering of [arXiv:2104.09761v1](https://arxiv.org/abs/2104.09761v1), whose Lemmas 3.6, 3.8–3.10 and Proposition 3.7 are the published Lemmas 3.7, 3.9–3.11 and Proposition 3.8.
- [Qian, Dwork ordinarity] Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, [arXiv:2103.00106v1](https://arxiv.org/abs/2103.00106v1).
- [BLGHT] Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Publ. Res. Inst. Math. Sci. 47 (2011), 29–98; [author copy](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), author pagination.
- [BLGGT] Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, *Potential automorphy and change of weight*, Ann. of Math. 179 (2014), 501–609; [arXiv:1010.2561v4](https://arxiv.org/abs/1010.2561v4).
- [BCGNT] George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Forum Math. Pi 13 (2025), e10, [doi:10.1017/fmp.2024.29](https://doi.org/10.1017/fmp.2024.29); [arXiv:2309.15880v3](https://arxiv.org/abs/2309.15880v3), author pagination.
- [Katz, Dwork family] Nicholas M. Katz, *Another look at the Dwork family*, in *Algebra, Arithmetic, and Geometry* II, Progr. Math. 270, Birkhäuser 2009, 89–126; [author copy](https://web.math.princeton.edu/~nmk/dworkfamilyfinal.pdf).
- [Katz, ESDE] Nicholas M. Katz, *Exponential sums and differential equations*, Annals of Mathematics Studies 124, Princeton University Press 1990, [doi:10.1515/9781400882434](https://doi.org/10.1515/9781400882434); Chapter 8, Theorem 8.4.11 (local monodromy, as cited by Barnet-Lamb–Geraghty–Harris–Taylor) and Theorem 8.12.2(1a) (the determinant, as cited by Boxer–Calegari–Gee–Newton–Thorne).
- [DK] Vladimir Drinfeld, Kiran S. Kedlaya, *Slopes of indecomposable F-isocrystals*, Pure Appl. Math. Q. 13 (2017); [arXiv:1604.00660v11](https://arxiv.org/abs/1604.00660v11).
- [Deligne] Pierre Deligne (notes by J. S. Milne), *Hodge cycles on abelian varieties*, Chapter I of *Hodge cycles, motives, and Shimura varieties*, LNM 900 (1982); [updated chapter](https://www.jmilne.org/math/Documents/Deligne82.pdf), §7.
- [BH] Frits Beukers, Gert Heckman, *Monodromy for the hypergeometric function `ₙF_{n−1}`*, Invent. Math. 95 (1989), 325–354; [GDZ](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0095/LOG_0022.pdf).
- [ZS] A. E. Zalesskii, V. N. Serezhkin, *Linear groups generated by transvections*, Math. USSR-Izv. 10 (1976), 25–46, [doi:10.1070/IM1976v010n01ABEH001676](https://doi.org/10.1070/IM1976v010n01ABEH001676).
- [Dickson] Leonard Eugene Dickson, *Linear groups, with an exposition of the Galois field theory*, B. G. Teubner, Leipzig, 1901; [University of Toronto scan](https://archive.org/details/lineargroupswith00dickuoft), Chapter XII, §§249–260, pp. 269–286 (the subgroups of `PSL₂(𝔽_q)`, summarised in §260, pp. 285–286).
- [Artin] Emil Artin, *The orders of the classical simple groups*, Comm. Pure Appl. Math. 8 (1955), 455–472, [doi:10.1002/cpa.3160080403](https://doi.org/10.1002/cpa.3160080403); Theorem 2.
- [Lewis] D. W. Lewis, *The isometry classification of Hermitian forms over division algebras*, Linear Algebra Appl. 43 (1982), 245–272, [doi:10.1016/0024-3795(82)90258-2](https://doi.org/10.1016/0024-3795(82)90258-2); §4.
- [Katz–Messing] Nicholas M. Katz, William Messing, *Some consequences of the Riemann hypothesis for varieties over finite fields*, Invent. Math. 23 (1974), 73–77, [doi:10.1007/BF01405203](https://doi.org/10.1007/BF01405203); Theorem 2.
- [Kisin] Mark Kisin, *Local constancy in p-adic families of Galois representations*, Math. Z. 230 (1999), 569–593, [doi:10.1007/PL00004706](https://doi.org/10.1007/PL00004706); Theorem 5.1.
- [Waterhouse] William C. Waterhouse, *Abelian varieties over finite fields*, Ann. Sci. École Norm. Sup. (4) 2 (1969), 521–560; [Numdam](https://www.numdam.org/item/ASENS_1969_4_2_4_521_0.pdf), Theorem 4.1, p. 536 (the Frobenius traces of elliptic curves over `𝔽_q`, after Deuring).
- [Berger] Laurent Berger, *Représentations modulaires de `GL₂(ℚ_p)` et représentations galoisiennes de dimension 2*, Astérisque 330 (2010), 263–279; [Numdam](https://numdam.org/item/AST_2010__330__263_0.pdf).
- [ACC+] Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack A. Thorne, *Potential automorphy over CM fields*, Ann. of Math. 197 (2023), 897–1113; [author copy](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
- [CEGS] Ana Caraiani, Matthew Emerton, Toby Gee, David Savitt, *Components of moduli stacks of two-dimensional Galois representations*; [author copy](https://www.ma.imperial.ac.uk/~tsg/Index_files/cegsC.pdf), §1.4.
- [A'Campo] Lambert A'Campo, *Dwork motives, monodromy and potential automorphy*, [arXiv:2407.16481v1](https://arxiv.org/abs/2407.16481v1).
