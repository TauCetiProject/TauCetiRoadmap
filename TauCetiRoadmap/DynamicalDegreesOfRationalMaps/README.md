# Roadmap: dynamical degrees of rational maps

**Summary.** This roadmap builds the degree theory of dominant rational maps between projective varieties over an arbitrary field. Starting from Mathlib's rational maps and scheme-theoretic images and Tau Ceti's function-field maps of dominant morphisms, it constructs the graph `Γ_f ⊆ X ×_K Y` of a dominant rational map with its two projections, the pullback of function fields and the topological degree `e(f) = [K(X) : f^*K(Y)]`, which counts inseparable degree. Intersection numbers are the Euler-characteristic numbers of proper schemes over a field. Over an arbitrary field, with nefness and Kleiman's nonnegativity theorem imported, the roadmap proves the positivity package the degrees need: Siu's inequality, the Hodge inequality on possibly singular surfaces, the Khovanskii–Teissier inequalities, and Siu's inequality for products, for nef line bundles and for all nef real classes, the latter by approximation with ample line bundles. With these it defines the degrees `deg_k(f; L, M) = (π_1^*L^{d−k} · π_2^*M^k)_{Γ_f}`. It proves they do not depend on the birational model of the graph, that they are positive, that `deg_0` and `deg_d` are `(L^d)` and `e(f)·(M^d)`, and that they are invariant under normalization and under extension of the ground field. Its main estimate is sub-multiplicativity along chains `X_1 ⤏ X_2 ⤏ X_3` of dominant maps between varieties of the same dimension, with constant `(d−k+1)^k/(L_2^d)`. From this follow the comparison of polarizations and birational conjugacy. The end theorems are existence of the dynamical degrees `λ_k(f) = lim deg_{k,ω}(f^n)^{1/n}`, equal to `inf_n (C·deg_{k,ω}(f^n))^{1/n}`. They lie in `[1, ∞)` and do not depend on the real polarization ω, a nef real class with `(ω^d) > 0`. They satisfy `λ_k(f^n) = λ_k(f)^n`, `λ_0 = 1`, `λ_d = e(f)` and log-concavity, and are invariant under birational conjugacy and extension of the field. The algebraic entropy is `h_alg(f) = log max_k λ_k(f)`. The examples on projective space are degrees of maps given by forms, morphisms, Silverman's first dynamical degree, the standard Cremona involution (where `deg(σ²) = 1 < d²`), the Fibonacci map with `λ_1` the golden ratio, Frobenius, and polynomial self-maps of affine space.

## Scope and ownership

This roadmap owns the following.

- The pullback of function fields along a dominant rational map, the topological degree and its multiplicativity (§1.1). Mathlib has the bijection between rational maps and morphisms from the spectrum of the function field. Tau Ceti has the function-field map of a dominant morphism (`AlgebraicGeometry.Scheme.Hom.functionFieldMap`, `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom`) and, for integral sources whose local rings are valuation rings, the morphism attached to a map of function fields (TauCeti/AlgebraicGeometry/Birational/AlgHom.lean). Neither library has the pullback along a dominant rational map or its degree; §1.1 builds them on the morphism case. For a finite flat dominant morphism `g` of integral schemes, Tau Ceti identifies the same number `dim_{g^*K(Y)} K(X)` with Mathlib's rank `Scheme.Hom.finrank` (`AlgebraicGeometry.Scheme.Hom.finrank_eq_finrank_fieldRange_functionFieldMap`), and §1.1 records the agreement. Tau Ceti also reads a rational map from an integral scheme to a separated one whose domain is the whole source as a morphism (`AlgebraicGeometry.Scheme.RationalMap.toHom`), which §§1.2 and 6.1 use. Tau Ceti's `TauCeti.Isogeny.fieldPullback` (TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/FunctionField.lean:167) covers only isogenies of Weierstrass elliptic curves, on their algebraic function fields.
- The graph of a rational map between projective varieties, its projections as a modification and an alteration, the correspondence attached to a composite, and the normalization and field-extension behaviour of graphs (§§1.2–1.4). Neither Mathlib nor Tau Ceti has the graph of a rational map.
- The component formula for Euler-characteristic intersection numbers, their comparison with Chow-theoretic degrees, their real multilinear extension, and the reduction of homogeneous inequalities to integral varieties over algebraically closed fields (Layer 2).
- Over an arbitrary field: the reading of the imported nefness and Kleiman nonnegativity in Euler-characteristic intersection numbers, on arbitrary closed subschemes and for all nef real classes, with the approximation of nef real classes on a projective scheme by positive rational multiples of ample line bundles (§§3.1–3.2); Siu's inequality in intersection form, the Hodge inequality on possibly singular projective surfaces, the Khovanskii–Teissier inequalities and Siu's inequality for products (§§3.3–3.6). AlgebraicModuliForArithmeticGeometryPartII §1.7 (iii) and (v) state in `N¹(X/K)`, for projective `X`, that the cone `Amp(X/K)` of positive real combinations of ample classes is the interior of the nef cone and the nef cone its closure, and that a nef real class plus a class of `Amp(X/K)` lies in `Amp(X/K)`. The approximation of §3.1 is the form in `Pic(X) ⊗ ℝ` that the homogeneity arguments use: every rational perturbation of the coefficients within a stated tolerance, plus `δH` for an ample `H` and a rational `δ > 0`, is a positive rational multiple of one ample line bundle. Its route uses §1.7 (ii) and the two facts of §1.7 listed in the supplier contracts, not (iii) or (v). AlgebraicModuliForArithmeticGeometryPartII §1.5 preserves nefness under extension of the field and detects it after extension to an algebraic closure; §3.1 proves, for proper `X` and every extension `K'/K`, that nefness of `L_{K'}` gives nefness of `L`, curve by curve. AlgebraicModuliForArithmeticGeometry §9.10 proves the log-concavity of `p ↦ (H^p · L^{n−p})` for an ample `L` and a nef `H` on a smooth projective geometrically integral variety over a field of characteristic zero, as a step towards its bound on mixed intersections. §3.5 is the statement for integral projective varieties over every field and for all nef real classes, with the mixed factors `C_j`. It does not use §9.10.
- Degrees of dominant rational maps, their basic values and invariances, sub-multiplicativity, comparison of polarizations and birational conjugacy (Layer 4); dynamical degrees and algebraic entropy (Layer 5); the projective-space and affine-space theory of Layer 6.

The following are imported, not planned again.

- Euler-characteristic intersection numbers on proper schemes over a field, with Snapper polynomiality, symmetry, additivity, the projection formula with the function-field degree, the Cartier-divisor restriction formula, positivity for ample line bundles and compatibility with extension of the field: CyclotomicClassGroupsAndStickelberger §4.3. Mathlib has no intersection numbers, and Tau Ceti has only the case of one line bundle on a curve, `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber`. `Suggested.lean` writes the number out as `numericalIntersection`, and nefness of real classes as `IsNef`, only so that its statements elaborate against the pinned libraries; the objects and their theory stay with the roadmaps named here.
- The real numerical space `N¹(X/K) = Num(X/K) ⊗ ℝ` of a proper `K`-scheme with its class map from `Pic(X)`: AlgebraicModuliForArithmeticGeometryPartII §1.1, over the base `Spec K`. Nefness of line bundles and of classes of `N¹(X/K)` (nonnegative degree on every integral curve), the nef cone `Nef(X/K)`, stability under sums, positive scaling and pullback, and preservation under extension of the ground field: its §1.5. Kleiman's nonnegativity theorem for nef line bundles on integral closed subschemes, ampleness of a nef line bundle plus an ample one, and ampleness of `mL + E` for ample `L`, any line bundle `E` and all large `m`, over every field: its §1.7. The Picard number and the nef cone of the square of a complex elliptic curve without complex multiplication, used in a Check of §3.1: the Checks of its §§1.2 and 1.4. The length-weighted component law for curve degrees: AlgebraicModuliForArithmeticGeometryPartII §0.1. Bigness of a line bundle on an integral proper `K`-scheme, and its equivalence with `(L^d) > 0` for nef `L`: AlgebraicModuliForArithmeticGeometryPartII §1.6. On a projective variety this nefness is the geometric nefness of ArakelovGeometryAndAbelianHeightsPartII §0.1. Volume and Siu's inequality `vol(L − M) ≥ (L^d) − d(L^{d−1}·M)` for nef `L, M`: ArakelovGeometryAndAbelianHeightsPartII §0.3.
- Bertini irreducibility for the generic linear section: LefschetzPencilsAndVanishingCycles §5.1.
- Chow groups, proper pushforward, first Chern classes, the projection formula, witness opens of modifications, alterations, de Jong's alteration theorem, regularity and smoothness over perfect fields, projective space with its base change and the relative Proj, normal schemes and finiteness of normalization, descent along field extensions, coherent cohomology on proper schemes, Chow's lemma, the Euler-characteristic pairing of two line bundles on a surface with its comparison with Chow degrees on smooth projective surfaces, and, on smooth projective surfaces and for that pairing, the Hodge index theorem for a line bundle of positive self-intersection and Riemann–Roch: SchemeAndStackFoundations §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1–5.3, 5.9 and 5.10. Modifications themselves are Tau Ceti's `TauCeti.AlgebraicGeometry.IsModification`.
- The twisting sheaves `O(n)` on `Proj` of a graded ring, their invertibility when the standard opens of degree-one elements cover, and `[O(n)] = n[O(1)]` are Tau Ceti's `AlgebraicGeometry.Proj.twistingSheaf` and its two lemmas in the supplier contracts; on `ℙ^d_K` they give the hyperplane class `H`.
- Ampleness is Tau Ceti's `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`; Mathlib has no positivity notion for line bundles. Very ampleness, and very ampleness of the high powers of an ample line bundle: AlgebraicModuliForArithmeticGeometry §1.4. Projective morphisms, tensor powers, pullback and global generation of line bundles: StableReduction Layer 2.
- Flat base change of scheme-theoretic images: for a quasi-compact morphism of locally Noetherian schemes, the scheme-theoretic image of its base change along a flat morphism of locally Noetherian schemes is the inverse image of its scheme-theoretic image. This is the scheme case of the schematic image of AlgebraicModuliForArithmeticGeometry §5.4, which for schemes is Mathlib's `Scheme.Hom.image`; §1.4 uses it for extension of the ground field.
- Rational self-maps of `ℙ¹` as classes of pairs of binary forms with multiplicative degree, and their identification with endomorphisms of the scheme `ℙ¹`: ArithmeticDynamics §§0.18 and 0.26, used in Checks of §§6.1 and 6.2.

The following lie outside this roadmap.

- Numerical cycle spaces `N^k(X)_ℝ` in codimension `k ≥ 2`, their finite-dimensionality, the pullback operators `f^* = π_{1*}π_2^*` on all `N^k(X)_ℝ` and the spectral description `λ_k(f) = lim ‖(f^n)^*‖^{1/n}` (dang2020 Theorem 2; truong2020 Theorem 1.1(5)). The same Part treats relative dynamical degrees and the product formula (dang2020 Theorem 4; truong2020 Theorem 1.1(4)). This is DynamicalDegreesOfRationalMaps, Part II. Codimension one is imported: real classes here are elements of `Pic(X) ⊗ ℝ`, nef when their image in `N¹(X/K)` is nef (§2.3), and nothing here uses the spaces of higher codimension.
- The topological-entropy bound of Dinh and Sibony over `ℂ` (dinhsibony2005 Théorème 1), which uses positive currents.
- Dang and Favre's b-classes, Picard–Manin spaces and spectral gap, with their Theorems 1–2 (dangfavre2021 lines 148–180). They consume the degrees and dynamical degrees built here.
- Arithmetic degrees and canonical heights of rational self-maps of `ℙ^N` (silverman2014 §§4–5).
- The dynamics of correspondences, and resolution of singularities. A dominant correspondence from `X` to `Y` is a multivalued map. It is given by a cycle on `X ×_K Y` whose components have dimension `dim X` and project dominantly onto both factors (truong2020 lines 77–89). Its dynamical degrees are those of truong2020 Theorem 1.1, lines 143–145. A dominant rational map is the case of a single component, of multiplicity one, that maps birationally onto `X`, and only this case is composed and iterated here. §1.3 calls the subvariety `W_{f,g}` the correspondence of a composite. It is a variety with proper surjective morphisms onto three graphs of rational maps: birational onto `Γ_f` and `Γ_{g∘f}`, and generically finite of degree `e(f)` onto `Γ_g`. No statement uses resolution of singularities: §3.4 uses alterations, and §2.4 uses normalization.

## Conventions

- `K` is a field. A *variety over K* is an integral scheme separated and of finite type over `Spec K`. A *projective variety* is a variety projective over `K` in the sense of StableReduction Layer 2, equivalently proper over `K` with an ample line bundle, equivalently a closed subscheme over `K` of a projective space `ℙ^n_K` (a power of an ample line bundle is very ample, AlgebraicModuliForArithmeticGeometry §1.4). In `Suggested.lean` a projective variety is a scheme `X` with `[X.Over (Spec (.of K))] [IsIntegral X] [X.IsProjectiveOver K]`, the last being Tau Ceti's `AlgebraicGeometry.Scheme.IsProjectiveOver`: a closed immersion over `K` into `Proj(Sym_K M)` for a finite `K`-module `M`, which is `ℙ^n_K` for `M = K^{n+1}`. Such a scheme is proper over `K` (Tau Ceti's instance `AlgebraicGeometry.Scheme.IsProjectiveOver.isProper`). `d = dim X`, written `topologicalKrullDim X = d` in `Suggested.lean`. Layer 6 assumes `d ≥ 1` (§6.1, Checks). Layers 1–5 allow `d = 0`: a projective variety of dimension `0` is the spectrum of a finite field extension of `K`, and there every statement of Layers 4 and 5 is an equality of positive integers (§5.1, Checks).
- *Geometric integrality.* A `K`-scheme `X` is *geometrically integral* if its structure morphism `X → Spec K` satisfies Mathlib's `AlgebraicGeometry.GeometricallyIntegral`: `X ×_K Spec L` is integral for every field `L` over `K`. *Witness:* `ℙ¹_K` is geometrically integral. `ℙ¹_ℂ` regarded as an `ℝ`-variety is integral but not geometrically integral, since `ℙ¹_ℂ ×_ℝ Spec ℂ = ℙ¹_ℂ ⊔ ℙ¹_ℂ` (§1.4, Checks). The conic `x² + t y² = 0` over `𝔽_2(t)` is integral and stays irreducible over every extension, but over `𝔽_2(√t)` it becomes the double line `(x + √t·y)² = 0`, which is not reduced (§2.4, Checks); so it is not geometrically integral either.
- *Ampleness* is Tau Ceti's `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`: the scheme is quasi-compact and every point lies in an affine nonvanishing locus of a global section of a positive power. On a scheme of finite type over `K` the high powers of an ample line bundle are very ample, and very ample line bundles are ample (AlgebraicModuliForArithmeticGeometry §1.4); this is a theorem about the native predicate, not a second definition. *Witness:* on `ℙ¹_K`, `O(1)` is ample through the sections `x_0, x_1`, whose nonvanishing loci are the two affine lines; `O` is not, because a section of a power of `O` is a constant, with nonvanishing locus `∅` or `ℙ¹`, and `ℙ¹` is not affine.
- Line bundles are Tau Ceti's `TauCeti.AlgebraicGeometry.InvertibleSheaf`, written additively: `L + M` is the tensor product, `mL` the `m`-th tensor power, `−L` the dual. `Pic(X)` is `TauCeti.AlgebraicGeometry.LineBundleClass X`. Pullback along `p` is written `p^*L`. In Lean `LineBundleClass X` is a commutative group written multiplicatively, so the class of `L + M` is the product of the classes of `L` and `M`, and the sum `Σ_{i ∈ S} L_i` below is the product `∏ i ∈ s, a i` in `numericalIntersection`. *Witness:* on `ℙ^d_K`, Tau Ceti's `AlgebraicGeometry.Proj.lineBundleClass_twistingSheaf_eq_zpow` writes the class of `O(n) = nH` as the `n`-th power of the class of `O(1)`.
- *Intersection numbers.* For a proper `K`-scheme `X`, a closed subscheme `Z ⊆ X` of dimension `≤ r` and line bundles `L_1, …, L_r` on `X`, `(L_1 ⋯ L_r · Z)` is the numerical intersection of CyclotomicClassGroupsAndStickelberger §4.3: the coefficient of `n_1⋯n_r` in `χ_K(Z, n_1L_1 + ⋯ + n_rL_r)`. Write `(L_1 ⋯ L_r)_X` when `Z = X`, and `(L^r)` for equal entries. The number depends on `K`. *Witness:* on `ℙ¹_K`, `(O(a))_{ℙ¹} = a` for every integer `a`, because `χ(O(an)) = an + 1`. For a closed point `P` with `[κ(P) : K] = 2`, the empty intersection `( · P)` is `χ_K(O_P) = 2`; computed over `κ(P)` it is `1`. In `Suggested.lean` the number `(L_1 ⋯ L_r)_X` is `numericalIntersection K X a` for a family `a : Fin r → LineBundleClass X` of classes, written as the mixed difference `Σ_{S ⊆ {1, …, r}} (−1)^{r − |S|} χ_K(X, Σ_{i ∈ S} L_i)` with `χ_K = Σ_{i ≤ r} (−1)^i dim_K H^i`, Tau Ceti's `AlgebraicGeometry.Scheme.Modules.eulerCharBelow` truncated at `r + 1`. For `X` proper of dimension `≤ r` it is the coefficient: cohomology vanishes above degree `r` (SchemeAndStackFoundations §2.6), and `n ↦ χ_K(X, Σ n_i L_i)` is a polynomial of total degree `≤ r` (stacks-varieties Lemma 45.1, line 4679), whose mixed difference `Δ_1 ⋯ Δ_r` at `0` is its coefficient of `n_1 ⋯ n_r`, the intersection number of Definition 45.3 (line 4754): `Δ_i` kills every monomial without `n_i`, and the only monomial of total degree `≤ r` containing every `n_i` is `n_1 ⋯ n_r`. For instance `P = n_1² + n_1n_2` gives `P(1,1) − P(1,0) − P(0,1) + P(0,0) = 2 − 1 − 0 + 0 = 1`. *Witness:* on `ℙ¹`, `r = 1` and `O(−2)`, the formula gives `χ(O(−2)) − χ(O) = (0 − 1) − (1 − 0) = −2 = deg O(−2)`; a truncation at `1` instead of `2` would drop `H¹` and give `0 − 1 = −1`.
- *Composition.* Mathlib's `Scheme.RationalMap.comp f g`, for `f : X ⤏ Y` dominant and `g : Y ⤏ Z`, applies `f` first. In prose it is `g ∘ f`. *Witness:* on `ℙ¹` with `f(z) = z²` and `g(z) = z + 1`, `f.comp g` is `z ↦ z² + 1`. Its value at `z = 1` is `2`, while `f ∘ g` takes the value `4` there. Iterates of a dominant self-map `f` are `f^0 = id` and `f^{n+1} = f^n ∘ f`; the composition is defined because `f` is dominant. By Mathlib's `Scheme.RationalMap.comp_assoc` this agrees with `f ∘ f^n`. In `Suggested.lean` the iterates are `iterate f n`, with `iterate f (n + 1) = f.comp (iterate f n)`, and they are dominant by the instance `isDominant_iterate`. Iterates of a morphism that need not be dominant, such as a constant morphism, are taken in the composition of morphisms (§6.1).
- *Birational maps.* A rational map `f : X ⤏ Y` is *birational* if it is `φ.toRationalMap` for a partial isomorphism `φ` (Mathlib's `Scheme.PartialIso`, an isomorphism between dense opens of `X` and `Y`) that is over `K` in the sense of `Scheme.PartialIso.IsOver`. A birational map is dominant. Its *inverse* `f^{−1}` is `φ.symm.toRationalMap`; it does not depend on `φ`, because its pullback is `(f^*)^{−1}` and §1.1 determines a dominant rational map by its pullback. A morphism is birational if its rational map is. The rational map of a partial isomorphism is dominant, because its target is a dense open (Mathlib's `AlgebraicGeometry.Opens.isDominant_ι`); in `Suggested.lean` this is the instance `isDominant_partialIso`, and the conjugate `φ ∘ f ∘ φ^{−1}` of a dominant self-map `f` of `X` by a partial isomorphism `φ` from `X` to `Y` is `φ.symm.toRationalMap.comp (f.comp φ.toRationalMap)`. Mathlib's `Scheme.Birational X Y` is the existence of some partial isomorphism between the schemes: a property of the pair, not of a map. *Witness:* `z ↦ z²` on `ℙ¹` is not birational (its pullback `K(z²) ⊆ K(z)` is not surjective), although `Scheme.Birational ℙ¹ ℙ¹` holds through the identity.
- *Degrees.* For `f : X ⤏ Y` dominant between projective varieties of the same dimension `d`, `0 ≤ k ≤ d`, and line bundles `L` on `X` and `M` on `Y`, `deg_k(f; L, M) = (π_1^*L^{d−k} · π_2^*M^k)_{Γ_f}`. The index `k` counts the copies pulled back from the *target*. For a self-map and `ω` on `X`, `deg_{k,ω}(f) = deg_k(f; ω, ω)`. In `Suggested.lean`, `deg_k(f; L, M)` is `mixedDegree K f L M (d − k) k`. *Witness:* for `f(z) = z²` on `ℙ¹` and `H = O(1)`, `deg_{0,H}(f) = 1` and `deg_{1,H}(f) = 2 = e(f)`, that is `mixedDegree K f H H 1 0 = 1` and `mixedDegree K f H H 0 1 = 2`. The opposite convention would give `deg_1 = 1`.
- *Topological degree.* `e(f) = dim_{f^*K(Y)} K(X)`, Mathlib's `Module.finrank`. It counts inseparable degree and takes the junk value `0` when `K(X)` is infinite-dimensional over `f^*K(Y)`. *Witness:* the Frobenius `[x_i] ↦ [x_i^p]` of `ℙ^d` over a field of characteristic `p` has `e = p^d`; the separable degree would be `1`.
- *Polarizations.* A *big and nef* line bundle is a nef `L` with `(L^d) > 0`. By AlgebraicModuliForArithmeticGeometryPartII §1.6, with §2.2 here to read its top first-Chern intersection as the numerical intersection, this is the same as `L` nef and big in the sense of section growth, `h⁰(X, mL) ≥ c·m^d` for some `c > 0` and all sufficiently large and divisible `m`. Nefness is that of AlgebraicModuliForArithmeticGeometryPartII §1.5 over the base `Spec K`: nonnegative degree on every integral curve; §3.1 reads it in numerical intersections. A *real class* is an element `ω = Σ t_i L_i` of `Pic(X) ⊗ ℝ`, a finite combination of line bundles with real coefficients of any sign. `Suggested.lean` states its theorems for finite formal combinations, elements of `LineBundleClass X →₀ ℝ`, the free real vector space on `Pic(X)`: `Pic(X) ⊗ ℝ` is its quotient by the relations `[L + M] = [L] + [M]`, every real class is the image of a formal combination, and every number used here depends only on the image (§2.3). It is *nef* if `(ω · C) = Σ t_i (L_i · C) ≥ 0` for every integral closed curve `C ⊆ X`, equivalently if its image in `N¹(X/K)` lies in the nef cone `Nef(X/K)` (§2.3). Every class of `Nef(X/K)` is the image of a nef real class, because `Pic(X) ⊗ ℝ → N¹(X/K)` is onto. A *real polarization* is a nef real class `ω` with `(ω^d) > 0`, in `Suggested.lean` the two hypotheses `IsNef K ω` and `0 < realIntersection K X (fun _ : Fin d ↦ ω)`. Every ample line bundle and every big and nef line bundle is a real polarization. *Witness:* on `E × E`, for a complex elliptic curve `E` without complex multiplication, the class `A` of the §3.1 Checks is nef with `(A²) = 0` and is no positive combination of nef line bundles; it is admitted as a nef input of §§3.2–3.6 and as `L_1` or `L_3` in §4.4. The ample class `A + (F_1 + F_2)` there is such a combination, while `A` lies on the boundary of the nef cone.
- *Dynamical degrees and entropy.* `λ_k(f) = lim_{n→∞} deg_{k,ω}(f^n)^{1/n}` and `h_alg(f) = log max_{0≤k≤d} λ_k(f)`, natural logarithm. In `Suggested.lean` they are `dynamicalDegree K d k f ω` and `algebraicEntropy K d f ω`, with the dimension `d` an explicit argument.
- *Fibonacci numbers* are Mathlib's `Nat.fib`, with `fib 0 = 0`, `fib 1 = fib 2 = 1` and `fib 3 = 2`. *Witness:* the Fibonacci map of §6.3 has `deg_{1,H}(f^n) = fib(n + 2)`. This is `1` for `n = 0` (the identity) and `2` for `n = 1`. The golden ratio is Mathlib's `Real.goldenRatio = (1 + √5)/2`.
- *Projective space* `ℙ^d_K` is Mathlib's `AlgebraicGeometry.Proj` of `K[x_0, …, x_d]` graded by `MvPolynomial.homogeneousSubmodule`. `H` is the class of `O(1)`, Tau Ceti's `AlgebraicGeometry.Proj.twistingSheaf` for `n = 1`. It is invertible because the standard opens `D_+(x_0), …, D_+(x_d)` of the variables, elements of degree one, cover `ℙ^d_K`, and the class of `O(n)` is `nH`. *Witness:* on `ℙ¹_K`, `(H)_{ℙ¹} = 1` and `(O(n))_{ℙ¹} = n`, as in the intersection-number witness above; `O(0)` is the structure sheaf, of class `0`.

## Exact supplier contracts

### From Mathlib

- `AlgebraicGeometry.Scheme.PartialMap` and `AlgebraicGeometry.Scheme.RationalMap` (Mathlib/AlgebraicGeometry/Birational/RationalMap.lean:48, 377). A partial map is a morphism on a dense open. A rational map is its class under agreement on a dense open. `Scheme.RationalMap.domain` (line 575) is the union of the domains of the representatives. It is dense by `Scheme.RationalMap.dense_domain` (line 586). `Scheme.RationalMap.toPartialMap` (line 608) represents a rational map on its domain when the source is reduced and the target separated. `Scheme.RationalMap.IsOver` (line 396) says some representative is an `S`-map. `Scheme.RationalMap.compHom` (line 440) composes a rational map with a morphism applied after it; it needs no dominance. `Scheme.Hom.toRationalMap` (line 387) is the rational map of a morphism.
- `Scheme.RationalMap.fromFunctionField` (line 501) is the morphism `Spec K(X) → Y` of a rational map from an irreducible scheme. `Scheme.RationalMap.equivFunctionFieldOver` (line 562) identifies `S`-morphisms `Spec K(X) → Y` with `S`-rational maps, for `X` integral and `Y` locally of finite type over `S`. These say nothing about dominance or field homomorphisms; §1.1 adds both.
- `Scheme.RationalMap.representative` (Mathlib/AlgebraicGeometry/Birational/RationalMap.lean:411), a representative partial map chosen by choice, and `Scheme.RationalMap.id` (line 391), the identity rational map. `Suggested.lean` builds the graph and the topological degree on `representative`; §1.2 proves that the graph does not depend on the representative.
- `AlgebraicGeometry.Scheme.RationalMap.IsDominant` (Mathlib/AlgebraicGeometry/Birational/Dominant.lean:74): some, equivalently every, representative is dominant. `Scheme.PartialMap.isDominant_toRationalMap_iff` (line 79) reads it on a representative, and `AlgebraicGeometry.Opens.isDominant_ι` (Mathlib/AlgebraicGeometry/Morphisms/UnderlyingMap.lean:264) says that the inclusion of a dense open is dominant.
- `Scheme.RationalMap.comp` (Mathlib/AlgebraicGeometry/Birational/Composition.lean:155). It requires the first map dominant, the source preirreducible and the middle scheme nonempty. Also used: `Scheme.RationalMap.comp_assoc` (line 182), which assumes the middle schemes irreducible and nonempty, `Scheme.RationalMap.comp_id` (line 170), `Scheme.RationalMap.id_comp` (line 217), the dominance instance for composites (line 173) and `Scheme.RationalMap.isOver_comp` (line 193).
- `AlgebraicGeometry.Scheme.PartialIso` (Mathlib/AlgebraicGeometry/Birational/Birational.lean:39) is an isomorphism between dense open subschemes, with `Scheme.PartialIso.IsOver` (line 55), its inverse `Scheme.PartialIso.symm` (line 88) and its rational map `Scheme.PartialIso.toRationalMap` (line 166). `AlgebraicGeometry.Scheme.Birational X Y` (line 182) is the existence of a partial isomorphism between the two schemes; it is a relation between schemes, not a property of a rational map, which is why the Conventions define birational maps through partial isomorphisms.
- `AlgebraicGeometry.Scheme.Hom.image`, `Scheme.Hom.imageι` and `Scheme.Hom.toImage` (Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean:658, 661, 706). The scheme-theoretic image is the closed subscheme cut out by `Scheme.Hom.ker` (Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean:691). `Scheme.Hom.toImage` is dominant for quasi-compact morphisms (Subscheme.lean:716). Mathlib does not state that the image of a reduced scheme is reduced; Tau Ceti does (below).
- `AlgebraicGeometry.IsSchemeTheoreticallyDominant` (Mathlib/AlgebraicGeometry/Morphisms/SchemeTheoreticallyDominant.lean:37), a morphism with zero kernel ideal sheaf, and `IsSchemeTheoreticallyDominant.of_isPullback` (line 112): the base change of a quasi-compact scheme-theoretically dominant morphism along a flat morphism is scheme-theoretically dominant. `Scheme.Hom.ker_comp` (Mathlib/AlgebraicGeometry/IdealSheaf/Functorial.lean:163) writes the kernel of a composite `p ≫ i` as the pushforward along `i` of the kernel of `p`, and `Scheme.IdealSheafData.map_bot` (line 139) says the pushforward of the zero ideal sheaf along `i` is the kernel of `i`. `Scheme.IdealSheafData.ker_fst_of_isClosedImmersion` (line 79) identifies the kernel of the base change of a closed immersion with the pulled-back ideal sheaf `Scheme.IdealSheafData.comap` (line 39). Mathlib does not state flat base change of `Scheme.Hom.image` itself; §1.4 obtains it from these.
- `AlgebraicGeometry.Scheme.functionField` (Mathlib/AlgebraicGeometry/FunctionField.lean:37) is the stalk at the generic point; it is a field for integral schemes.
- `AlgebraicGeometry.IsFinite.iff_isProper_and_isAffineHom` (Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:97), with `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.IsAffineHom`, `AlgebraicGeometry.IsDominant` and `AlgebraicGeometry.IsIntegral`.
- `AlgebraicGeometry.GeometricallyIntegral` (Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40): a morphism whose base change along every morphism from the spectrum of a field is integral. For the structure morphism of a `K`-scheme it is the geometric integrality of the Conventions.
- `AlgebraicGeometry.Flat` (Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42), flat morphisms, and `AlgebraicGeometry.Scheme.Hom.finrank` (Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean:89), the rank of a morphism `g : X → Y` at a point `y` of `Y`: on an affine chart `Spec R ∋ y` it is `Module.finrank` over the local ring `R_y` of the localized module of sections of `g` over the chart. `Module.finrank` is the supremum of the sizes of linearly independent families, with junk value `0` when it is infinite; for a module that is not free it need not be the dimension of the fibre (§1.1, Checks).
- `AlgebraicGeometry.Proj` (Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean:855), `MvPolynomial.homogeneousSubmodule` and `MvPolynomial.gradedAlgebra` (Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:87, 613). Mathlib has `𝔸(n; S)` but no named projective space; `ℙ^d_K` is this `Proj`. `MvPolynomial.uniqueFactorizationMonoid` (Mathlib/RingTheory/Polynomial/UniqueFactorization.lean:128), the unique-factorization instance for polynomials over a unique factorization domain, gives greatest common divisors of forms.
- `Submultiplicative`, `Submultiplicative.lim` and `Submultiplicative.tendsto_lim` (Mathlib/Analysis/Subadditive.lean:35, 44, 89) are Fekete's lemma in multiplicative form: for `u : ℕ → ℝ` with `u_{m+n} ≤ u_m·u_n` for all `m, n ≥ 0` and `u_n ≥ 0` for all `n`, the roots `u_n^{1/n}` tend to `Submultiplicative.lim`, the infimum of `u_n^{1/n}` over `n ≥ 1`. Nonnegativity is the only bound assumed.
- `Module.finrank` and `Module.finrank_mul_finrank` (Mathlib/LinearAlgebra/Dimension/Free.lean:76), the tower law.
- `Nat.fib` (Mathlib/Data/Nat/Fib/Basic.lean:56) and `Real.goldenRatio` (Mathlib/NumberTheory/Real/GoldenRatio.lean:36).
- `AlgebraicGeometry.Proj.fromOfGlobalSections` (Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean:442): a morphism from a scheme `T` to `Proj A` attached to a graded ring map from `A` to the global functions `Γ(T, ⊤)` under which the irrelevant ideal generates the unit ideal. §6.1 uses it on the affine charts `D_+(F_i)`.
- For the statements of `Suggested.lean`: `topologicalKrullDim` (Mathlib/Topology/KrullDimension.lean:37), finitely supported functions `Finsupp` with `Finsupp.mapDomain` (Mathlib/Data/Finsupp/Basic.lean:265), `Fintype.piFinset` (Mathlib/Data/Fintype/Pi.lean:31), `Filter.limUnder` (Mathlib/Topology/Defs/Filter.lean:270), which takes a junk value when the limit does not exist, and, for extension of the field, cartesian squares `CategoryTheory.IsPullback` (Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean:61).

### From Tau Ceti

- `TauCeti.AlgebraicGeometry.InvertibleSheaf` (TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:119), with `TauCeti.AlgebraicGeometry.InvertibleSheaf.pullback` (LineBundle/Pullback.lean:100), `TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct` (LineBundle/TensorProduct.lean:65) and `TauCeti.AlgebraicGeometry.InvertibleSheaf.dual` (LineBundle/Dual.lean:44). `TauCeti.AlgebraicGeometry.LineBundleClass` (LineBundle/Class.lean:50) is the Picard group, a commutative group (line 142); `TauCeti.AlgebraicGeometry.LineBundleClass.lift` (line 63) descends an isomorphism-invariant function of line bundles to classes, and `TauCeti.AlgebraicGeometry.LineBundleClass.pullback` (LineBundle/Functoriality.lean:136) pulls classes back along a morphism.
- `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple` (LineBundle/Ample.lean:71): `X` is quasi-compact and every point lies in an affine nonvanishing locus of a global section of a line bundle in a positive power of the class; `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple.of_pow` (line 96) descends ampleness from a positive power. It is the ampleness of every statement here.
- `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Cohomology/Basic.lean:61) and the truncated Euler characteristic `AlgebraicGeometry.Scheme.Modules.eulerCharBelow` (Cohomology/EulerCharacteristic.lean:105). It sums `(−1)^i dim_K H^i` for `i < n`, with junk value `0` for infinite-dimensional terms. It equals `χ` once `n > dim` on a proper scheme, by the vanishing above the dimension of SchemeAndStackFoundations §2.6. `AlgebraicGeometry.Scheme.Modules.eulerCharBelow_congr` (line 150) is its invariance under isomorphism, which lets `Suggested.lean` evaluate it on classes.
- `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback` (TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.lean:277): for a field extension `K'/K`, a `K`-scheme `X` that is quasi-compact with affine diagonal, a cartesian square exhibiting a `K'`-scheme `X'` as `X ×_K Spec K'` with projection `g : X' → X`, and a quasi-coherent `M` on `X`, `dim_{K'} H^n(X', g^*M) = dim_K H^n(X, M)` for every `n`, with no finiteness assumed. It is the cohomological content of the field-extension compatibility of CyclotomicClassGroupsAndStickelberger §4.3, and §4.3 here reads its first equality off it term by term.
- `TauCeti.AlgebraicGeometry.LineBundleClass.eulerDegree` (LineBundle/Degree.lean:130), the degree `χ(L) − χ(O)` on curves, and the curve intersection number `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber` (IntersectionNumber/Basic.lean:111), the Euler degree over `K` of the pullback of a class to a `K`-scheme `C → X`, with its field-tower scaling `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber_eq_finrank_mul` (IntersectionNumber/FieldTower.lean:66). These are the case `r = 1` of the numerical intersections below.
- `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier` (TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Basic.lean:78), effective Cartier divisors as ideal sheaves locally generated by a regular element.
- `AlgebraicGeometry.Scheme.Hom.isReduced_image` (TauCeti/AlgebraicGeometry/SchemeTheoreticImage/Basic.lean:78): the scheme-theoretic image of a quasi-compact morphism from a reduced scheme is reduced. It is deduced from `AlgebraicGeometry.Scheme.Hom.isSchemeTheoreticallyDominant_toImage` (line 65): for a quasi-compact morphism, the factorization `Scheme.Hom.toImage` through the scheme-theoretic image is scheme-theoretically dominant.
- `AlgebraicGeometry.Scheme.Hom.functionFieldMap` (TauCeti/AlgebraicGeometry/Morphisms/Dominant.lean:151), the pullback `K(Y) → K(X)` of a dominant morphism of irreducible schemes, with `AlgebraicGeometry.Scheme.Hom.functionFieldMap_id` (line 206), `AlgebraicGeometry.Scheme.Hom.functionFieldMap_comp` (line 212) and `AlgebraicGeometry.Scheme.Hom.ext_of_functionFieldMap_eq` (line 221), which determines a dominant morphism from a reduced irreducible scheme to a separated one by its pullback. `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom` (TauCeti/AlgebraicGeometry/Scheme/BaseAlgebra.lean:409) is the same map as a `K`-algebra homomorphism, for a dominant `K`-morphism of integral `K`-schemes, with `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom_id` (line 421) and `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom_comp` (line 427).
- `AlgebraicGeometry.Scheme.IsProjectiveOver` (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/ProjectiveOver.lean:57): a scheme over `Spec R` with a closed immersion over `R` into `Proj(Sym_R M)` for a finite `R`-module `M`, with the instance `AlgebraicGeometry.Scheme.IsProjectiveOver.isProper` (line 77). It is the projectivity of `Suggested.lean`.
- `AlgebraicGeometry.Proj.twistingSheaf` (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/TwistingSheaf/Basic.lean:254), the sheaf `O(n)`, `n ∈ ℤ`, on `Proj` of a graded ring, whose sections are the locally homogeneous fractions of degree `n`. It is invertible for every `n` when the standard opens of a family of degree-one elements cover `Proj` (`AlgebraicGeometry.Proj.isInvertible_twistingSheaf_of_iSup_eq_top`, TwistingSheaf/LocalTriviality.lean:212), which holds for `K[x_0, …, x_d]` with the variables. Under the same covering hypothesis the class of `O(n)` is the `n`-th power of the class of `O(1)` in the multiplicatively written `LineBundleClass` (`AlgebraicGeometry.Proj.lineBundleClass_twistingSheaf_eq_zpow`, TwistingSheaf/TensorProduct.lean:257). `H = O(1)` on `ℙ^d_K` is this sheaf.
- `TauCeti.ProjectiveSpectrum.fromOfGlobalSections_eq_of_unit_rescaling` (TauCeti/AlgebraicGeometry/ProjectiveSpectrum/GlobalCoordinates.lean:138): let `φ, ψ : A → Γ(T, ⊤)` be ring maps from a graded ring to the global functions of a scheme `T`, with `ψ(a) = c^n·φ(a)` for every `a` of degree `n` and one global unit `c`, and with the irrelevant ideal generating the unit ideal under `φ`; then Mathlib's `Proj.fromOfGlobalSections` gives the same morphism `T → Proj A` for `φ` and for `ψ`. `AlgebraicGeometry.Proj.fromOfGlobalSections_naturality` (ProjectiveSpectrum/Naturality.lean:74): for a morphism `g : T' → T`, the composite of `g` with the morphism of `φ` is the morphism of the coordinates `g^* ∘ φ` on `T'`. §6.1 uses both for the agreement of its chart morphisms on overlaps.
- `TauCeti.AlgebraicGeometry.topologicalKrullDim_eq_toNat_trdeg_functionField` (TauCeti/AlgebraicGeometry/Scheme/FunctionField.lean:101): an integral scheme locally of finite type over `K` has dimension `trdeg_K K(X)`.
- `AlgebraicGeometry.Scheme.Hom.finrank_eq_finrank_fieldRange_functionFieldMap` (TauCeti/AlgebraicGeometry/Morphisms/Finite/FlatDegree.lean:87): for a finite flat dominant morphism `g : X → Y` of integral schemes, Mathlib's rank `Scheme.Hom.finrank g y` at every point `y` of `Y` is `dim_{g^*K(Y)} K(X)`, the dimension of `K(X)` over the image of `Scheme.Hom.functionFieldMap g`.
- `AlgebraicGeometry.Scheme.RationalMap.toHom` (TauCeti/AlgebraicGeometry/Birational/RationalMap.lean:93): a rational map from a reduced scheme to a separated scheme whose domain is the whole source, as a morphism (its representative on the domain). `AlgebraicGeometry.Scheme.RationalMap.toRationalMap_toHom` (line 120): when the source is integral, the rational map of this morphism is the given rational map.
- `TauCeti.AlgebraicGeometry.isDomain_functionField_tensorProduct_of_geometricallyIntegral` (TauCeti/AlgebraicGeometry/Geometrically/FunctionField.lean:82), an instance: for an integral `K`-scheme `X` that is geometrically integral and every field extension `L/K`, `K(X) ⊗_K L` is a domain. Its companion `TauCeti.AlgebraicGeometry.nonempty_functionField_algEquiv_of_isPullback` (line 111) identifies the function field of `X_L` with the compositum `K(X)·L` only for algebraic `L/K`; §1.4 identifies the fraction field of `K(X) ⊗_K L` with `K(X_L)` for every extension, through an affine chart.
- `TauCeti.AlgebraicGeometry.IsModification` (TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53): a proper morphism `f : X → Y` for which some dense open `U ⊆ Y` has dense inverse image in `X` and `f` restricted over `U` is an isomorphism; no integrality is assumed. §1.2 shows that the first projection `π_1` of the graph is one, with the domain of `f` as the open.

### From TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger

- §4.3, numerical intersection. For `X` proper over `K`, `Z ⊆ X` closed of dimension `≤ d` and line bundles `L_1, …, L_d`, `(L_1 ⋯ L_d · Z)` is the coefficient of `n_1⋯n_d` in `χ(Z, (L_1|_Z)^{n_1} ⊗ ⋯ ⊗ (L_d|_Z)^{n_d})`. This roadmap consumes the following from it:
  - polynomiality of `χ(F ⊗ L_1^{n_1} ⊗ ⋯)` of total degree `≤ dim Supp F` for every coherent `F`;
  - symmetry and additivity in each `L_i`;
  - the projection formula: for `p : Y → X` a morphism of proper `K`-schemes and `Z ⊆ Y` integral of dimension `d`, `(p^*L_1 ⋯ p^*L_d · Z) = deg(Z → p(Z)) (L_1 ⋯ L_d · p(Z))`, and `0` if `dim p(Z) < d`;
  - the Cartier-divisor restriction formula `(L_1 ⋯ L_d · Z) = (L_2 ⋯ L_d · D)` when `L_1|_Z ≅ O_Z(D)` for an effective Cartier divisor `D ⊆ Z`;
  - positivity for ample `L_i`;
  - field-extension compatibility: for `K'/K`, `(L_{1,K'} ⋯ L_{d,K'} · Z_{K'})` over `K'` equals `(L_1 ⋯ L_d · Z)` over `K`.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII

- §0.1: the degree `χ(C, L) − χ(C, O_C)` of a line bundle on a proper `K`-scheme `C` of dimension `≤ 1`, with the length-weighted component law `deg(L) = Σ_i length(O_{C,η_i})·deg(L|_{(C_i)_red})` over the one-dimensional components, and its invariance under extension of the field.
- §1.1, over the base `S = Spec K`: for a proper `K`-scheme `X`, `Num(X/K) = Pic(X)/Pic^τ(X/K)` and `N¹(X/K) = Num(X/K) ⊗ ℝ`, with the class map `Pic(X) → Num(X/K)`; the degree pairing of line bundles with integral curves descends to `Num(X/K)`, hence extends linearly to `N¹(X/K)`.
- §1.5, over the base `S = Spec K`. A line bundle `L` on a proper `K`-scheme `X` is nef if its degree on every integral closed curve `C ⊆ X` is `≥ 0`; a class of `N¹(X/K)` is nef if it pairs nonnegatively with every curve, and these classes form the closed convex cone `Nef(X/K)`; `L` is nef if and only if its class lies in `Nef(X/K)`. Nef classes are closed under sums and positive scaling. If `g : X' → X` is a `K`-morphism of proper `K`-schemes and `L` is nef, `g^*L` is nef. Nefness is preserved by base change along every morphism of Noetherian schemes, in particular along `Spec K' → Spec K` for every field extension `K'/K`, and is detected after extension to an algebraic closure. No integrality, perfection of `K` or restriction on the characteristic is assumed.
- §1.6, over the base `Spec K`: bigness of a line bundle on an integral proper `K`-scheme by growth of sections; for nef `L` on an integral proper `X` of dimension `d`, `L` is big if and only if its top first-Chern intersection `(L^d·X)` is positive. It is consumed only to identify the big and nef line bundles of the Conventions with the nef line bundles of positive top power.
- §1.7 (ii), for `X` proper over an arbitrary field `K`, with ampleness Tau Ceti's: if `L_1, …, L_s` are nef, then `deg(c_1(L_1) ∩ ⋯ ∩ c_1(L_s) ∩ [V]) ≥ 0` for every integral closed subscheme `V ⊆ X` of dimension `s`, the degree being that of SchemeAndStackFoundations §§5.2–5.3; if `L` is nef and `H` ample, `L ⊗ H` is ample. From the same section: an ample line bundle has positive degree on every integral curve, so it is nef; and for `L` ample and every line bundle `E`, `L^{⊗m} ⊗ E` is ample for all sufficiently large `m`.
- The Checks of §1.2 and §1.4, used only in a Check of §3.1: for a complex elliptic curve `E` with `End(E) = ℤ`, `ρ(E × E) = 2 + rank End(E) = 3`, and the nef cone of `E × E` is the cone of positive semidefinite symmetric `2 × 2` matrices.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

- §1.4: relative very ampleness, which over `Spec K` is very ampleness and implies ampleness; for `X` of finite type over `K` and `A` ample, every sufficiently high power of `A` is very ample, with a closed embedding into a projective space when `X` is proper.
- §5.4, the schematic image of a quasi-compact morphism of locally Noetherian DM stacks, consumed only for schemes. For a quasi-compact morphism `h : Z → S` of locally Noetherian schemes it is Mathlib's `Scheme.Hom.image`, with `Scheme.Hom.imageι` and `Scheme.Hom.toImage`. For a flat morphism `S' → S` of locally Noetherian schemes, the schematic image of the base change `Z ×_S S' → S'` is the inverse image `h.image ×_S S'`. Nothing is assumed for base change that is not flat, where the statement fails (§1.4, Checks).

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeightsPartII

- §0.1, the geometric case: a line bundle on a projective variety over a field is nef if its degree on every integral curve is nonnegative. This is the nefness of AlgebraicModuliForArithmeticGeometryPartII §1.5 on projective varieties; it is consumed to read §0.3.
- §0.3, the geometric case. For a projective `K`-variety `X` of dimension `d` and a line bundle `L`, `vol(L) = lim d!·h⁰(mL)/m^d`, and `L` is big if `vol(L) > 0`. It supplies (2′): for `d ≥ 1` and nef `L, M`, `vol(L − M) ≥ (L^d) − d(L^{d−1}·M)`. Its intersection numbers are degrees of products of first Chern classes in the sense of SchemeAndStackFoundations §§5.2–5.3. §2.2 here identifies them with numerical intersections.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

- §5.1, Bertini's irreducibility theorem (Jouanolou). Let `X` be geometrically irreducible of finite type over a field and `g : X → ℙ^r` a morphism with `dim g(X) > s`. Then `g^{−1}(L)` is geometrically irreducible for the generic linear subspace `L` of codimension `s`, defined over the function field of the Grassmannian. It is used with `s = 1` and `g` a closed immersion given by a very ample line bundle.

### From TauCetiRoadmap.SchemeAndStackFoundations

- §0.3: Mathlib's `Proj` and its base change, and the relative Proj with its twisting sheaves `O(n)`, with `ℙ^n_S` as the relative Proj of the polynomial algebra. On `ℙ^d_K`, `Proj` of a graded ring, the twisting sheaves are Tau Ceti's `AlgebraicGeometry.Proj.twistingSheaf` (above). §0.7: dimension theory of schemes of finite type over a field. §0.11: descent along field extensions. §0.20: Nagata rings; the normalization of a variety is finite. §0.30: normal schemes.
- §2.6: finite-dimensionality of coherent cohomology on proper schemes over a field, as supplied there by JacobianChallenge; and its target `proper_fibreDimension_vanishing`, the vanishing of `R^q f_* F` for `q` above the fibre dimension of a proper `f` to a locally Noetherian base and quasi-coherent `F`, used for `X → Spec K`: on a proper `K`-scheme of dimension `≤ r`, `H^q(X, F) = 0` for `q > r`. It makes the Euler characteristic truncated at `r + 1` the full one (Conventions) and additive on short exact sequences of modules supported in dimension `≤ r` (§2.1).
- §3.3: degrees of line bundles on proper curves.
- §4.11: a chosen witness open of a modification, the modifications being Tau Ceti's `TauCeti.AlgebraicGeometry.IsModification` (above). §4.12: Chow's lemma (a proper scheme over a Noetherian base has a projective modification). §4.16: alterations with their generic degree. §4.19: de Jong's alteration theorem over a field. It gives an alteration from an integral `X_1` with an open immersion into a regular scheme projective over the base field.
- §4.13: a scheme of finite type over a perfect field is regular exactly where it is smooth.
- §§5.1–5.3: Chow groups, proper pushforward with residue-degree weights, the degree of zero-cycles on proper schemes, and the first Chern class operation `c_1(L) ∩ −` with additivity `c_1(L ⊗ M) = c_1(L) + c_1(M)`, commutativity and the projection formula `p_*(c_1(p^*L) ∩ α) = c_1(L) ∩ p_*α` for proper `p`.
- §5.9: for line bundles `L`, `M` on a scheme `S` over a field, the pairing `χ(O_S) − χ(−L) − χ(−M) + χ(−L − M)`, declared there as `Chow.intersectionNumber`. For `S` proper of dimension at most two it is the coefficient of `n_1n_2` in `χ(S, n_1L + n_2M)`, that is, the numerical intersection `(L · M)_S` of the Conventions; for `S` smooth projective it equals `deg(c_1(L) ∩ c_1(M) ∩ [S])`.
- §5.10, on smooth projective integral surfaces over an algebraically closed field, with the pairing of §5.9: the Hodge index theorem for line bundles `H`, `D` with `(H²) > 0` and `(D · H) = 0`, which gives `(D²) ≤ 0` with no positivity of `H` assumed; the Hodge inequality `(D·H)² ≥ D²·H²` for ample `H`; and Riemann–Roch `χ(O(D)) = ½ D·(D − K) + χ(O_S)`.

### From TauCetiRoadmap.StableReduction

- Layer 2: projective morphisms, tensor powers, pullback and global generation of line bundles.

### From TauCetiRoadmap.ArithmeticDynamics

- §0.18: the monoid of rational self-maps of `ℙ¹_K` as classes of pairs of binary forms of a common degree without common zero, with `deg(f ∘ g) = deg f · deg g`. §0.26: its injective monoid map onto the `K`-endomorphisms of the scheme `ℙ¹_K`.

## How to read the build

Layer 1 is closest to Mathlib. It attaches to a dominant rational map its pullback of function fields, its topological degree and its graph, and records how graphs behave under composition, normalization and extension of the field. Layer 2 fixes the intersection numbers. It proves the component formula and the comparison with Chow degrees, extends the numbers to real coefficients, and reduces homogeneous inequalities to an integral variety over an algebraically closed field. Layer 3 reads the imported nefness and Kleiman's theorem in numerical intersections, approximates nef real classes by ample line bundles, then proves over an arbitrary field, in the order the proofs need, Siu's inequality, the Hodge inequality on surfaces, Khovanskii–Teissier, and Siu for products. Layer 4 defines the degrees on the graph and proves their values, invariances, sub-multiplicativity and the comparison theorems. Layer 5 defines the dynamical degrees and the algebraic entropy and proves their properties. Layer 6 computes on projective and affine space. A *Needs:* line lists what a statement and its suggested route use, so a different proof may omit route-only inputs.

The headline statements are the following:

- integrality and dimension of the graph, and the properties of its two projections (§1.2);
- Khovanskii–Teissier and Siu for products over an arbitrary field (§§3.5–3.6);
- positivity and the boundary values of the degrees (§4.2);
- sub-multiplicativity (§4.4) and the comparison theorems (§4.5);
- existence and properties of `λ_k` and of `h_alg`, including the invariance of `λ_k` under extension of the field for a geometrically integral variety (§§5.1–5.4);
- the degree formulas on projective space and the Cremona and Fibonacci computations (§§6.2–6.4).

`Suggested.lean` states them against the pinned libraries, with the definitions `graph`, `graphFst`, `graphSnd`, `topologicalDegree`, `numericalIntersection`, `realIntersection`, `IsNef`, `mixedDegree`, `iterate`, `dynamicalDegree` and `algebraicEntropy` and the instances `isDominant_iterate` and `isDominant_partialIso`. The base-changed rational map `f_{K'}` of §1.4 is not defined there; its statements use the characterization of §1.4, `π ∘ f_{K'} = f ∘ π` for the projection `π` of the base change, which determines it among the `K'`-rational maps. The computations on projective space (§§6.2–6.4) are not statable there: they need the rational map `[F_0 : ⋯ : F_d]` attached to forms, which §6.1 constructs.

## Layer 1: Function fields and the graph of a dominant rational map

Throughout, `X`, `Y`, `Z` are varieties over `K` and rational maps are `K`-rational maps in the sense of Mathlib's `Scheme.RationalMap.IsOver` over `Spec K`.

### 1.1 Pullback of function fields and topological degree

Define the *pullback* `f^* : K(Y) → K(X)` of a dominant rational map `f : X ⤏ Y`. Choose a representative `f_V : V → Y` over `K` on a dense open `V`; it is a dominant `K`-morphism of integral `K`-schemes, and Tau Ceti's `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom` gives a `K`-algebra map `K(Y) → K(V)`. Compose it with the identification `K(V) = K(X)` of the function field of a dense open of the integral `X`. The result does not depend on the representative: two representatives agree on a dense open `V'`, and by `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom_comp` the pullback along the restriction to `V'` is the pullback along either one, followed by `K(V) = K(V')`. Equivalently, `f^*` is the map of stalks at the generic points induced by Mathlib's `Scheme.RationalMap.fromFunctionField f : Spec K(X) → Y`, which hits the generic point of `Y` because `f` is dominant. Define the *topological degree* `e(f) = dim_{f^*K(Y)} K(X)` with Mathlib's `Module.finrank` (stacks-morphisms Definition 52.8, line 6046, for the degree of a dominant generically finite morphism; dinhsibony2005 lines 69–70 for the topological degree as the number of preimages of a generic point over `ℂ`). In `Suggested.lean` it is `topologicalDegree f`, computed on the representative `g : V → Y` of Mathlib's `Scheme.RationalMap.representative` as the dimension of `K(V) = K(X)` over the image of Tau Ceti's `AlgebraicGeometry.Scheme.Hom.functionFieldMap g`; by the independence just proved this is `e(f)`.

- For a dominant `K`-morphism `g : X → Y`, the pullback of its rational map is Tau Ceti's `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom` of `g`. When `g` is an alteration this is the function-field map of SchemeAndStackFoundations §4.16, and `e(g)` is the generic degree there.
- *Agreement with the rank.* For a finite flat dominant `K`-morphism `g : X → Y` of varieties, `e(g)` is Mathlib's rank `Scheme.Hom.finrank g y` at every point `y` of `Y`. By the previous item `g^*` is the map underlying `Scheme.Hom.functionFieldMap g`, and Tau Ceti's `AlgebraicGeometry.Scheme.Hom.finrank_eq_finrank_fieldRange_functionFieldMap` computes the rank as the dimension of `K(X)` over its image.
- *Functoriality.* For `f : X ⤏ Y` and `g : Y ⤏ Z` dominant, `(g ∘ f)^* = f^* ∘ g^*`, and the identity rational map has pullback the identity. On representatives this is Tau Ceti's `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom_comp` and `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom_id`.
- *Determination.* `f ↦ f^*` is a bijection between dominant `K`-rational maps `X ⤏ Y` and `K`-algebra homomorphisms `K(Y) → K(X)`. The proof composes `Scheme.RationalMap.equivFunctionFieldOver` with the correspondence between `K`-morphisms `Spec K(X) → Y` hitting the generic point and `K`-embeddings of function fields, using that `Y` is of finite type.
- *Finiteness.* `e(f)` is a positive integer if and only if `dim X = dim Y`. If `dim X > dim Y`, then `K(X)` has positive transcendence degree over `f^*K(Y)` and `e(f) = 0` is a junk value. The proof uses Tau Ceti's `TauCeti.AlgebraicGeometry.topologicalKrullDim_eq_toNat_trdeg_functionField`, and finite generation of `K(X)` over `K`.
- *Multiplicativity.* If `dim X = dim Y = dim Z`, then `e(g ∘ f) = e(f)·e(g)`, by Mathlib's `Module.finrank_mul_finrank` applied to `f^*g^*K(Z) ⊆ f^*K(Y) ⊆ K(X)`. The pullback `f^*` is injective, being a homomorphism of fields, and carries `g^*K(Z) ⊆ K(Y)` onto `f^*g^*K(Z) ⊆ f^*K(Y)`.
- *Birationality.* If `dim X = dim Y`, then `e(f) = 1` if and only if `f^*` is an isomorphism, if and only if `f` is birational in the sense of the Conventions. For the last step: when `f^*` is an isomorphism, determination gives a dominant `g : Y ⤏ X` with `g^* = (f^*)^{−1}`; then `(g ∘ f)^* = id` and `(f ∘ g)^* = id`, so `g ∘ f = id_X` and `f ∘ g = id_Y` by determination. Representatives `f_U` and `g_V` therefore compose to the identity on dense opens `U' ⊆ U` and `V' ⊆ V`, and they restrict to inverse isomorphisms between `U_0 = U' ∩ f_U^{−1}(V')` and `V_0 = V' ∩ g_V^{−1}(U')`, a partial isomorphism over `K` whose rational map is `f`. In that case `X` and `Y` are birational in Mathlib's sense `Scheme.Birational X Y`, and `f^{−1}` has pullback `(f^*)^{−1}`.

*Needs:* Mathlib `Scheme.RationalMap.fromFunctionField`, `Scheme.RationalMap.equivFunctionFieldOver`, `Scheme.RationalMap.IsDominant`, `Scheme.RationalMap.representative`, `Scheme.functionField`, `Module.finrank`, `Module.finrank_mul_finrank`, `Scheme.PartialIso`, `Scheme.PartialIso.IsOver`, `Scheme.PartialIso.symm`, `Scheme.PartialIso.toRationalMap`, and for the agreement with the rank `Scheme.Hom.finrank`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.IsFinite`; Tau Ceti `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom`, `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom_comp`, `AlgebraicGeometry.Scheme.Hom.functionFieldAlgHom_id`, `TauCeti.AlgebraicGeometry.topologicalKrullDim_eq_toNat_trdeg_functionField`, `AlgebraicGeometry.Scheme.Hom.finrank_eq_finrank_fieldRange_functionFieldMap`; SchemeAndStackFoundations §4.16.

**Checks.**

- For `f(z) = z²` on `ℙ¹`, `f^*(z) = z²` and `e(f) = [K(z) : K(z²)] = 2` in every characteristic. In characteristic `2` the extension is purely inseparable. A convention counting separable degree would give `1` there.
- For the Frobenius `[x_i] ↦ [x_i^p]` of `ℙ^d` over a field of characteristic `p`, `f^*` is `x_i ↦ x_i^p` on affine coordinates and `e(f) = p^d`.
- The standard Cremona involution of `ℙ²` has `e = 1` and is birational, although its forms have degree `2`. Multiplicativity gives `e(σ ∘ σ) = 1`.
- Non-example: `f(z) = z²` on `ℙ¹` has `e(f) = 2`, `f^*` is not surjective, and `f` is the rational map of no partial isomorphism, so the three conditions of the birationality item fail together. Yet `Scheme.Birational ℙ¹ ℙ¹` holds, through the identity. A definition of "birational `f`" through Mathlib's relation on the pair would make the item false.
- The linear projection `ℙ² ⤏ ℙ¹` from `[0 : 0 : 1]` is dominant with `K(x, y)` of transcendence degree one over `K(x)`, so `e = 0` is the junk value. The finiteness item excludes it.
- Non-example: a constant map `ℙ¹ → ℙ¹` is not dominant and has no pullback of function fields; Mathlib's composition with it as the first map is not defined.
- Agreement with the rank: `z ↦ z²` on `ℙ¹` is finite and flat, since on each standard chart `K[z]` is free over `K[z²]` with basis `{1, z}`; its rank is `2 = e` at every point, in every characteristic. The Frobenius of `ℙ^d` is finite and flat, `K[x_1, …, x_d]` being free of rank `p^d` over `K[x_1^p, …, x_d^p]`, so its rank is `p^d = e`.
- Negative control for flatness: the normalization `ν : ℙ¹ → V(y²z − x³)`, `t ↦ [t² : t³ : 1]`, of the cuspidal cubic is finite and dominant with `e(ν) = 1`, but not flat. On the chart of the cusp it is `K[t², t³] ⊆ K[t]`, and the fibre over the cusp is `K[t]/(t², t³)K[t] = K[t]/(t²)`, of dimension `2`, against `1` over every other point. Mathlib's rank at the cusp is still `1`: the localized module of sections is torsion-free over the local ring of the cusp, and any two of its elements are linearly dependent because their ratio lies in `K(t)`, the fraction field of `K[t², t³]`. So for `ν` the rank agrees with `e`, while the fibre dimension does not; reading the agreement item with the fibre dimension in place of Mathlib's rank needs the flatness hypothesis.

### 1.2 The graph

Let `X`, `Y` be projective varieties and `f : X ⤏ Y` a rational map. Let `U` be its domain (Mathlib's `Scheme.RationalMap.domain`) and `f_U : U → Y` the representative of `Scheme.RationalMap.toPartialMap`. Define the *graph* `Γ_f ⊆ X ×_K Y` as the scheme-theoretic image (Mathlib's `Scheme.Hom.image`) of the `K`-morphism `γ_f = (ι_U, f_U) : U → X ×_K Y`. Its *projections* `π_1 : Γ_f → X` and `π_2 : Γ_f → Y` are the compositions of `Scheme.Hom.imageι` with the projections of the product (dinhsibony2005 lines 45–51; dang2020 lines 21–25; guedj2010 lines 1099–1110). In `Suggested.lean` the graph is `graph f` with projections `graphFst f` and `graphSnd f`, defined for every rational map as the scheme-theoretic image of `(ι_V, g) : V → X × Y` in the absolute product, for the representative `(V, g)` of `Scheme.RationalMap.representative`. For a `K`-rational map between projective varieties this is `Γ_f`: by independence of the representative (below) the image of `(ι_V, g)` is that of `γ_f`; the morphism factors through `X ×_K Y`, a closed subscheme of `X × Y` because `Spec K → Spec ℤ` is separated; and the scheme-theoretic image of a reduced scheme is the reduced closed subscheme on the closure of its image (stacks-morphisms Lemma 6.7, line 488), the same closed subset in either ambient.

Prove the following.

- `Γ_f` is integral, closed in `X ×_K Y`, projective over `K`, and of dimension `dim X`. The morphism `γ_f` is quasi-compact because `X` is Noetherian, so its image is reduced (Tau Ceti's `AlgebraicGeometry.Scheme.Hom.isReduced_image`, for a quasi-compact morphism from the reduced `U`) and is the closure of the image of the integral scheme `U` (stacks-morphisms Lemma 6.7, line 488).
- *Independence of the representative.* For every partial map `(V, g)` representing `f`, the scheme-theoretic image of `(ι_V, g)` is `Γ_f`.
- `π_1` is proper and birational, and `π_1^{−1}(U) → U` is an isomorphism with inverse `γ_f` (stacks-morphisms Lemma 6.8, line 493, for the scheme-theoretic image of a section of a separated morphism over a retrocompact open, here `X ×_K Y → X` over `U`). Hence `π_1` is a modification, Tau Ceti's `TauCeti.AlgebraicGeometry.IsModification`: the dense open `U` has dense inverse image `π_1^{−1}(U) ⊇ γ_f(U)` in the integral `Γ_f`, and `π_1` is an isomorphism over it. `U` is a witness open in the sense of SchemeAndStackFoundations §4.11. The graph of `f_U` is closed in `U ×_K Y` because `Y` is separated.
- `π_2 ∘ γ_f = f_U`. If `f` is dominant, `π_2` is dominant and, being proper, surjective. If moreover `dim X = dim Y`, `π_2` is an alteration (SchemeAndStackFoundations §4.16) with generic degree `e(f)`, computed through the isomorphism `π_1^* : K(X) → K(Γ_f)`.
- *Morphisms.* If `f` is the rational map of a morphism `g : X → Y`, then `U = X`, `π_1` is an isomorphism and `π_2 ∘ π_1^{−1} = g`. Conversely, if `U = X`, then `f` is the rational map of the morphism `Scheme.RationalMap.toHom f` (Tau Ceti's `AlgebraicGeometry.Scheme.RationalMap.toHom` and `AlgebraicGeometry.Scheme.RationalMap.toRationalMap_toHom`, for the integral `X` and the separated `Y`). So the rational maps of morphisms are exactly those with domain `X`. For `g = id_X` the graph is the diagonal.
- *Inverses.* If `f` is birational, the exchange of factors `X ×_K Y ≅ Y ×_K X` maps `Γ_f` onto `Γ_{f^{−1}}`.

The first, third and fourth items, in the form that `Γ_f` is integral of dimension `dim X`, that `π_1` is proper and an isomorphism over the domain of definition `Scheme.RationalMap.domain`, and that `π_2` is surjective when `f` is dominant, are the acceptance statement `graph_isIntegral_and_projections`.

*Needs:* Mathlib `Scheme.RationalMap.domain`, `Scheme.RationalMap.toPartialMap`, `Scheme.RationalMap.representative`, `Scheme.Hom.image`, `Scheme.Hom.imageι`, `Scheme.Hom.toImage`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.IsDominant`, `Scheme.PartialIso.symm`; Tau Ceti `AlgebraicGeometry.Scheme.Hom.isReduced_image`, `TauCeti.AlgebraicGeometry.IsModification`, `AlgebraicGeometry.Scheme.RationalMap.toHom`, `AlgebraicGeometry.Scheme.RationalMap.toRationalMap_toHom`; §1.1; SchemeAndStackFoundations §§0.7, 4.11, 4.16; StableReduction Layer 2.

**Checks.**

- For `f = id_X`, `Γ_f` is the diagonal and both projections are isomorphisms.
- For `f(z) = z²` on `ℙ¹`, `Γ_f ≅ ℙ¹` through `π_1`, and `π_2` has generic degree `2 = e(f)`.
- For the Cremona involution `σ[x : y : z] = [yz : xz : xy]` of `ℙ²`, the domain is the complement of the three coordinate points. The fibre of `π_1` over each of them is a line. Both projections are birational, and `Γ_σ` is the blow-up of `ℙ²` at the three points.
- For the projection `ℙ² ⤏ ℙ¹` from `[0 : 0 : 1]`, `Γ` is the blow-up at that point and `π_2` is surjective with fibres `ℙ¹`. It is not an alteration, so the equal-dimension hypothesis is needed.
- Non-example: for the constant map `ℙ¹ → ℙ¹` with value `[0 : 1]`, `Γ = ℙ¹ × {[0 : 1]}` and `π_2` is not surjective. Dominance is needed for surjectivity.
- Negative control for reducedness, outside the varieties of this section: on the non-reduced `X = Spec k[x,y]/(xy, y²)`, whose underlying space is the line `Spec k[x]`, take `Y = Spec k` and `f` the rational map of the structure morphism. The representative on `X` has image the graph of a morphism, isomorphic to `X`; the representative on the dense open `D(x)`, where `y = 0`, has image `Spec k[x]`, since the kernel of `k[x,y]/(xy, y²) → k[x, x^{−1}]` is `(y)`. For `k = ℚ(t)`, the morphism `X → Spec k` given by `a ↦ a + (da/dt)·y` agrees with the structure morphism on `D(x)`, so it represents the same `k`-rational map, but its graph does not lie in `X ×_k Y`. The independence of the representative and the containment in `X ×_K Y` need `X` reduced; `graph` in `Suggested.lean` is defined for every rational map and is `Γ_f` only under that hypothesis.

### 1.3 Graphs of composites

Let `X`, `Y`, `Z` be projective varieties of the same dimension `d` and let `f : X ⤏ Y` and `g : Y ⤏ Z` be dominant. The product `Y ×_K Z` need not be integral, so it is not a variety and §1.2 does not apply to a map into it; the construction below uses only the integral source. Let `U` be the intersection of the domains of `f` and `g ∘ f`, a dense open of `X`, and let `f_U`, `(g∘f)_U` be the representatives of `Scheme.RationalMap.toPartialMap` restricted to `U`. Define the *correspondence of the composite* `W_{f,g} ⊆ X ×_K Y ×_K Z` as the scheme-theoretic image of the `K`-morphism `(ι_U, f_U, (g∘f)_U) : U → X ×_K Y ×_K Z`, with projections `q_X`, `q_Y`, `q_Z`. Prove:

- `W_{f,g}` is an integral projective variety of dimension `d`. The morphism is quasi-compact because `U` is Noetherian, so its image is reduced (Tau Ceti's `AlgebraicGeometry.Scheme.Hom.isReduced_image`) and is the closure of the image of the irreducible `U`, hence integral; it is closed in the projective `K`-scheme `X ×_K Y ×_K Z`. Replacing `U` by a smaller dense open does not change the image. No integrality of `Y ×_K Z` is used;
- `(q_X, q_Y) : W_{f,g} → Γ_f` and `(q_X, q_Z) : W_{f,g} → Γ_{g∘f}` are proper and birational;
- `(q_Y, q_Z) : W_{f,g} → Γ_g` is proper and surjective, and generically finite of generic degree `e(f)`. Its function-field extension is `K(Γ_g) ≅ K(Y) → K(X) ≅ K(W_{f,g})`, which is `f^*`.

The construction applies to iterates. For `f : X ⤏ X` and `m, n ≥ 1`, `W_{f^m, f^n}` relates `Γ_{f^m}`, `Γ_{f^n}` and `Γ_{f^{m+n}}` (dang2020 lines 1285–1334, the graph of `π_3^{−1} ∘ f_1 ∘ π_1` and diagram (5.1)).

*Needs:* Mathlib `Scheme.RationalMap.comp`, `Scheme.RationalMap.comp_assoc`, `Scheme.RationalMap.domain`, `Scheme.RationalMap.toPartialMap`, `Scheme.Hom.image`; Tau Ceti `AlgebraicGeometry.Scheme.Hom.isReduced_image`; §§1.1–1.2; SchemeAndStackFoundations §4.16; StableReduction Layer 2.

**Checks.**

- `K = ℝ`, `X = Y = Z = ℙ¹_ℂ` regarded as `ℝ`-varieties and `f = g = id`. Since `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`, the product `Y ×_ℝ Z` has two components and is not a variety, so §1.2 cannot be applied to a map into it. The direct image `W_{id,id}` is the triple diagonal, a copy of `ℙ¹_ℂ`, integral of dimension `1`, and all three indicated projections onto the graphs have degree `1`.
- For `f = g = σ` the Cremona involution of `ℙ²`, `σ ∘ σ = id`. Then `W_{σ,σ} → Γ_{id}` (the diagonal) is birational and `(q_Y, q_Z)` has degree `e(σ) = 1`.
- For `f = g = (z ↦ z²)` on `ℙ¹`, `W_{f,g} ≅ ℙ¹` through `q_X`, and `(q_Y, q_Z)` maps onto `Γ_g ≅ ℙ¹` with degree `2 = e(f)`, not `e(g ∘ f) = 4`.
- Which map gives the degree, with `f ≠ g`: for `f = (z ↦ z²)` and `g = id` on `ℙ¹`, `W_{f,g}` is the closure of `{(x, x², x²)}` and `(q_Y, q_Z)` maps it onto the diagonal `Γ_{id} ≅ ℙ¹` by `x ↦ x²`, of degree `2 = e(f)`, not `e(g) = 1`. For `f = id` and `g = (z ↦ z²)`, `W_{f,g}` is the closure of `{(x, x, x²)}` and `(q_Y, q_Z)` is an isomorphism onto `Γ_g`, of degree `1 = e(f)`, not `e(g) = 2`.
- If `f` is replaced by a non-dominant map, `g ∘ f` is not defined by Mathlib's composition and the construction does not apply.

### 1.4 Normalization and extension of the field

*Normalization.* Let `ν : X̃ → X` be the normalization of a projective variety. It is finite and birational (SchemeAndStackFoundations §§0.20, 0.30), so `X̃` is a projective variety. For `f : X ⤏ X` dominant put `f̃ = ν^{−1} ∘ f ∘ ν : X̃ ⤏ X̃`, with `ν^{−1}` the inverse (Conventions) of the birational morphism `ν`, which is an isomorphism over the dense open normal locus of `X`. Prove that `ν × ν` maps `Γ_{f̃}` onto `Γ_f`, properly and birationally, and that `(f^n)~ = f̃^n`.

*Extension of the field.* Let `K'/K` be a field extension. Prove that `(Γ_f)_{K'} ⊆ (X ×_K Y)_{K'}` is the scheme-theoretic image of `γ_f ×_K K'`. This is flat base change of scheme-theoretic images (AlgebraicModuliForArithmeticGeometry §5.4, its scheme case; stacks-morphisms Lemma 26.16, line 2198). It applies because `γ_f` is quasi-compact with Noetherian source `U`, `Spec K' → Spec K` is flat, and `X ×_K Y` and its base change are of finite type over a field, hence Noetherian. From Mathlib and Tau Ceti alone, the same statement follows from the factorization of `γ_f` as `Scheme.Hom.toImage` followed by the closed immersion `Scheme.Hom.imageι`. The first factor is scheme-theoretically dominant (Tau Ceti's `AlgebraicGeometry.Scheme.Hom.isSchemeTheoreticallyDominant_toImage`) and stays so after the flat base change (Mathlib's `IsSchemeTheoreticallyDominant.of_isPullback`). By `Scheme.Hom.ker_comp` and `Scheme.IdealSheafData.map_bot`, the kernel of `γ_f ×_K K'` is then the kernel of the base-changed closed immersion. By `Scheme.IdealSheafData.ker_fst_of_isClosedImmersion` that kernel is the pullback of the ideal sheaf of `Γ_f`. If `X` and `Y` are geometrically integral, `X_{K'}` and `Y_{K'}` are projective varieties over `K'`; let `π_X : X_{K'} → X` and `π_Y : Y_{K'} → Y` be the projections. Let `f_{K'}` be the rational map of `(f_U)_{K'} : U_{K'} → Y_{K'}`. Its domain `U_{K'} = π_X^{−1}(U)` is dense: `π_X` is the base change of `Spec K' → Spec K`, which is universally open (stacks-morphisms Lemma 24.4, tag 0383, line 2009), and the inverse image of a dense set under an open map is dense. It is dominant when `f` is; `e(f_{K'}) = e(f)`; `(g ∘ f)_{K'} = g_{K'} ∘ f_{K'}`; and `Γ_{f_{K'}} = (Γ_f)_{K'}`. These identities are proved in this section. truong2020 §6.3, lines 1529–1533, only sets the convention they justify: over a field that is not algebraically closed, the degrees are defined through the lift to an algebraic closure, which may be reducible. Prove also the *characterization* of `f_{K'}`. The projection `π_X` is surjective, as a base change of a surjective morphism, hence dominant, and `f_{K'}` is the unique `K'`-rational map `f' : X_{K'} ⤏ Y_{K'}` with `π_Y ∘ f' = f ∘ π_X`, in Mathlib's terms `f'.compHom π_Y = π_X.toRationalMap.comp f`. Existence: `(f_U)_{K'}` is over `K'`, and on `U_{K'}` its composite with `π_Y` is `f_U ∘ π_X`. Uniqueness: take representatives over `K'` of two such maps. Their composites with `π_Y` agree on a dense open `W`, and their composites with the structure morphism `Y_{K'} → Spec K'` are both the structure morphism of `W`. So they agree on `W`, by the universal property of `Y_{K'} = Y ×_K Spec K'`. `Suggested.lean` uses this characterization, with the base change given by a cartesian square (Mathlib's `CategoryTheory.IsPullback`), in place of a definition of `f_{K'}`.

For `e(f_{K'}) = e(f)` the proof splits by dimension; `dim X ≥ dim Y` because `f` is dominant.

- If `dim X = dim Y`, then `e(f) ≥ 1` and `K(X)` has a basis of `e(f)` elements over `f^*K(Y)` (§1.1, finiteness). So `K(X) ⊗_K K'` is free of rank `e(f)` over `f^*K(Y) ⊗_K K'`. Both rings are domains: `K(X) ⊗_K K'` by Tau Ceti's instance `TauCeti.AlgebraicGeometry.isDomain_functionField_tensorProduct_of_geometricallyIntegral`, and `f^*K(Y) ⊗_K K'` as its subring, since `⊗_K K'` preserves injectivity; through `f^*` the latter is `K(Y) ⊗_K K'`. For a nonempty affine open `V ⊆ X`, `K(X) ⊗_K K'` is a localization of `O(V) ⊗_K K'`, the coordinate ring of the affine open `V_{K'}` of the integral `X_{K'}`, so its fraction field is `K(X_{K'})`; likewise the fraction field of `K(Y) ⊗_K K'` is `K(Y_{K'})`. This chart argument holds for every extension `K'/K`, whereas Tau Ceti's `TauCeti.AlgebraicGeometry.nonempty_functionField_algEquiv_of_isPullback` describes the function field of the base change only for algebraic `K'/K`. Inverting the nonzero elements of `f^*K(Y) ⊗_K K'` turns `K(X) ⊗_K K'` into a domain finite over the field `K(Y_{K'})`, hence a field between `K(X) ⊗_K K'` and its fraction field, that is `K(X_{K'})`. So `[K(X_{K'}) : K(Y_{K'})] = e(f)`.
- If `dim X > dim Y`, the finite-basis argument does not apply: `K(X)` is infinite-dimensional over `f^*K(Y)`, and `e(f) = 0` is the junk value of §1.1, not a rank. Dimension does not change under extension of the field (SchemeAndStackFoundations §0.7), so `dim X_{K'} = dim X > dim Y = dim Y_{K'}`, and §1.1 gives `e(f_{K'}) = 0 = e(f)`.

*Needs:* Mathlib `Scheme.PartialIso`, `Scheme.PartialIso.symm`, `Scheme.Hom.image`, `AlgebraicGeometry.GeometricallyIntegral`, and for the characterization `Scheme.RationalMap.compHom`, `Scheme.Hom.toRationalMap`, `Scheme.RationalMap.comp`, `Scheme.RationalMap.IsOver`, `CategoryTheory.IsPullback`; Tau Ceti `TauCeti.AlgebraicGeometry.isDomain_functionField_tensorProduct_of_geometricallyIntegral`; for the base change of the image, AlgebraicModuliForArithmeticGeometry §5.4, or directly Mathlib `IsSchemeTheoreticallyDominant.of_isPullback`, `Scheme.Hom.ker_comp`, `Scheme.IdealSheafData.map_bot`, `Scheme.IdealSheafData.ker_fst_of_isClosedImmersion` with Tau Ceti `AlgebraicGeometry.Scheme.Hom.isSchemeTheoreticallyDominant_toImage`; §§1.1–1.2; SchemeAndStackFoundations §§0.7, 0.11, 0.20, 0.30.

**Checks.**

- `X = ℙ¹_ℂ` regarded as an `ℝ`-scheme is integral but not geometrically integral: `X_ℂ = ℙ¹_ℂ ⊔ ℙ¹_ℂ`. The base change of the graph of `id_X` is the union of the two diagonals, a reducible scheme that is not the graph of a rational map of an integral scheme. The geometric-integrality hypothesis is needed for `Γ_{f_{K'}}`.
- Negative control for flatness: `h : 𝔾_m = Spec K[t, t^{−1}] → 𝔸¹_K` has scheme-theoretic image `𝔸¹_K`, because `K[t] → K[t, t^{−1}]` is injective. Base change along the origin `Spec K → 𝔸¹_K`, which is not flat, makes the source `Spec(K[t, t^{−1}]/(t)) = ∅`, whose image is empty, while the inverse image of `𝔸¹_K` is the point `Spec K`. Extensions of the ground field are flat, so this failure does not occur in §1.4.
- For the Cremona involution over `ℚ`, the base change to `ℂ` is the Cremona involution over `ℂ` and `e = 1` on both sides.
- Negative control for the characterization: `X = ℙ¹_ℝ`, `K' = ℂ`, `f = id`. The conjugation `c = id × Spec(conj)` of `ℙ¹_ℂ = ℙ¹_ℝ ×_ℝ Spec ℂ`, `[x_0 : x_1] ↦ [x̄_0 : x̄_1]` on points, satisfies `π ∘ c = π = id ∘ π`. Its composite with the structure morphism `ℙ¹_ℂ → Spec ℂ` is that morphism followed by `Spec(conj)`, which differs from it on every nonempty open, since it sends `i` to `−i`; so `c` is not over `ℂ`. The identity is the only `ℂ`-rational map `f'` with `π ∘ f' = π`; without the condition that `f'` be over `K'`, the characterization would not determine `f_{K'}`.
- For the cuspidal cubic `X = V(y²z − x³) ⊆ ℙ²` with normalization `ℙ¹ → X`, `t ↦ [t² : t³ : 1]`, the lift of `id_X` is `id_{ℙ¹}`.
- Negative control for the rank argument: take `K' = K` and the linear projection `ℙ² ⤏ ℙ¹` from `[0 : 0 : 1]`, with `K(X) = K(u, v)` over `f^*K(Y) = K(u)`. The family `1, v, v², …` is linearly independent, so `K(X)` is not free of rank `e(f) = 0`; the dimension difference is `1` before and after extension, and both degrees are the junk value `0`. For `z ↦ z²` on `ℙ¹`, the basis `{1, z}` of `K(z)` over `K(z²)` stays a basis after extension in every characteristic, and `e = 2` on both sides.

### Examples

The identity and its diagonal, `z ↦ z²` on `ℙ¹` with `e = 2`, the Cremona involution of `ℙ²` with its graph the blow-up at three points, the linear projection `ℙ² ⤏ ℙ¹` (dominant, not generically finite), Frobenius with `e = p^d`, and `ℙ¹_ℂ` over `ℝ` for base change.

### Dependencies

Mathlib's rational maps with their representatives, composition, composition with morphisms, partial isomorphisms, cartesian squares, scheme-theoretic images, the flat base change of scheme-theoretic dominance, function fields, geometric integrality, flatness and the rank of a morphism; Tau Ceti's function-field maps of dominant morphisms, modifications, the rank of a finite flat morphism, rational maps defined everywhere as morphisms, reducedness and scheme-theoretic dominance of scheme-theoretic images, the dimension theorem, and the tensor product of the function field of a geometrically integral scheme with a field extension; flat base change of scheme-theoretic images, AlgebraicModuliForArithmeticGeometry §5.4 (§1.4); SchemeAndStackFoundations §§0.7, 0.11, 0.20, 0.30, 4.11, 4.16; StableReduction Layer 2. No other layer of this roadmap.

## Layer 2: Intersection numbers over a field

### 2.1 The component formula

Let `X` be proper over `K`, `Z ⊆ X` a closed subscheme of dimension `r`, and `L_1, …, L_r` line bundles on `X`. Let `Z_1, …, Z_s` be the irreducible components of `Z` of dimension `r`, with reduced structure, and `m_i` the length of `O_{Z,ξ_i}` at their generic points. Prove `(L_1 ⋯ L_r · Z) = Σ_i m_i (L_1 ⋯ L_r · Z_i)` (stacks-varieties Lemmas 45.2 and 45.6, lines 4716 and 4784; kleiman2005 Lemma B.12, line 3624). The proof filters a coherent module by subquotients `(V → X)_*I` with `V` integral and `I` a nonzero ideal sheaf, and uses additivity of `χ` and of lengths. For `r = 1` the formula is the length-weighted component law for curve degrees of AlgebraicModuliForArithmeticGeometryPartII §0.1, since `(L · Z)` is the degree `χ(Z, L) − χ(Z, O_Z)` of `L|_Z`; the statement here is its form in every dimension.

*Needs:* CyclotomicClassGroupsAndStickelberger §4.3 (polynomiality, definition); SchemeAndStackFoundations §2.6 (finite-dimensional cohomology; vanishing above the dimension, for additivity of `χ`). For `r = 1`: AlgebraicModuliForArithmeticGeometryPartII §0.1.

**Checks.**

- The double point `Z = Spec K[ε]/(ε²) ⊆ ℙ¹` has `( · Z) = χ(O_Z) = 2 = 2·( · Z_red)`. A formula ignoring multiplicities gives `1`.
- For `Z = L ∪ P ⊆ ℙ²`, a line and a point off it, and `r = 1`, `(O(1) · Z) = 1`. The zero-dimensional component does not count, though the total degree of `Z` is `2`.
- For a conic `Z = V(xy) ⊆ ℙ²`, `(O(1) · Z) = 2 = 1 + 1` over the two lines.

### 2.2 Comparison with Chow degrees

Let `X` be proper over `K` and `Z ⊆ X` closed of dimension `r`. Prove `(L_1 ⋯ L_r · Z) = deg(c_1(L_1) ∩ ⋯ ∩ c_1(L_r) ∩ [Z]_r)`, with `[Z]_r` the fundamental cycle and the degree of zero-cycles of SchemeAndStackFoundations §5.2 (stacks-chow Lemma 41.4, tag 0BFI, line 3995). The proof inducts on `r`. It reduces to `Z` integral by §2.1, then to `Z` projective by Chow's lemma (SchemeAndStackFoundations §4.12) and the projection formula on both sides. It writes `L_1` as a difference of effective Cartier divisors, and finishes with the Cartier restriction formula and SchemeAndStackFoundations §5.3's `c_1(O(D)) ∩ [Z] = [D]`. For `r = 0` the statement reads `χ_K(O_Z) = deg [Z]_0`. For `r = 1` its left side is SchemeAndStackFoundations §3.3's degree of `L_1|_Z`. For `r = 2` and `Z = X` a smooth projective surface it is the comparison of SchemeAndStackFoundations §5.9. The statement here is for every proper `X`, every closed `Z` and every `r`.

This identifies the numbers of ArakelovGeometryAndAbelianHeightsPartII §0.3 with numerical intersections. Those of SchemeAndStackFoundations §5.10 are numerical intersections by its §5.9, without this section.

*Needs:* §2.1; CyclotomicClassGroupsAndStickelberger §4.3; SchemeAndStackFoundations §§3.3, 4.12, 5.1–5.3; StableReduction Layer 2.

**Checks.**

- On `ℙ²`, `(O(1)²) = 1 = deg(h² ∩ [ℙ²])`.
- On `ℙ¹ × ℙ¹`, `(O(1,0) · O(0,1)) = 1` and `(O(1,0)²) = 0`, matching `χ(O(n_1, n_2)) = (n_1 + 1)(n_2 + 1)` on the numerical side.
- A negative self-intersection: let `π : S → ℙ²` be the blow-up of a point over an algebraically closed field, `L = π^*O(1)` and `E ≅ ℙ¹` the exceptional curve, with `O_E(E) ≅ O_{ℙ¹}(−1)`. The sequences `0 → O_S((b − 1)E) → O_S(bE) → O_E(bE) → 0` give `χ(O_S(bE)) = 1 + (b − b²)/2`, as Riemann–Roch (SchemeAndStackFoundations §5.10) with `K_S = −3L + E` does. The coefficient of `n_1n_2` in `χ(O_S((n_1 + n_2)E))` is `(E²) = −1`. On the Chow side `c_1(O(E)) ∩ [S] = [E]`, and the degree of `c_1(O(E)) ∩ [E]` is that of `O_E(E)`, also `−1`. A count of intersection points with lengths would give a nonnegative self-intersection.

### 2.3 Real coefficients

For a proper `K`-scheme `X` of dimension `≤ r`, extend `(L_1, …, L_r) ↦ (L_1 ⋯ L_r)_X` to a symmetric `ℝ`-multilinear form on `Pic(X) ⊗ ℝ`, using additivity (CyclotomicClassGroupsAndStickelberger §4.3; stacks-varieties Lemma 45.5, tag 0BER, line 4778; dangfavre2021 §1.3, lines 436–443, for real classes as polarizations). Extend pullback along a morphism `p` linearly.

- The form is well defined on classes, symmetric and multilinear, and agrees with the integral numbers on `Pic(X)`.
- *Projection formula.* For `p : Y → X` a morphism of proper `K`-schemes with `Y` integral of dimension `r`, `(p^*ω_1 ⋯ p^*ω_r)_Y = deg(Y → p(Y))·(ω_1 ⋯ ω_r · p(Y))` for real classes `ω_i`, and `0` if `dim p(Y) < r`.
- *Field extension.* Base change along `K'/K` preserves the form.

A real class `ω = Σ t_i L_i` (finitely many line bundles `L_i`, real `t_i` of any sign) is *nef* if `(ω · C) = Σ t_i (L_i · C) ≥ 0` for every integral closed curve `C ⊆ X`. The value `(ω · C)` is the form above with `r = 1` on `C`, so it does not depend on how `ω` is written. Prove that `ω` is nef if and only if its image under `Pic(X) ⊗ ℝ → N¹(X/K)` lies in the nef cone `Nef(X/K)`: the degree pairing descends to `Num(X/K)` and is linear on `N¹(X/K)` (AlgebraicModuliForArithmeticGeometryPartII §1.1), and a class of `N¹(X/K)` is nef exactly when it pairs nonnegatively with every integral curve (its §1.5). The map `Pic(X) ⊗ ℝ → N¹(X/K)` is onto, so every class of `Nef(X/K)` comes from a nef real class. If moreover `(ω^d) > 0`, with `d = dim X`, `ω` is a *real polarization*.

In `Suggested.lean` real classes are formal combinations `LineBundleClass X →₀ ℝ` (Conventions). The form on `r` of them is `realIntersection K X ω` for `ω : Fin r → LineBundleClass X →₀ ℝ`, the multilinear expansion `Σ_{a_1, …, a_r} (Π_j ω_j(a_j))·numericalIntersection K X a` over the supports. Nefness is `IsNef K ω`: for every closed immersion over `K` of an integral curve `C`, proper over `K`, the sum of the coefficients times Tau Ceti's degrees `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber` is nonnegative. That these depend only on the image in `Pic(X) ⊗ ℝ` is the first item above, with additivity of the curve degree.

*Needs:* CyclotomicClassGroupsAndStickelberger §4.3; AlgebraicModuliForArithmeticGeometryPartII §§1.1, 1.5; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`.

**Checks.**

- On `ℙ¹ × ℙ¹`, `ω = √2·O(1,0) + O(0,1)` has `(ω²) = 2√2`.
- Scaling: `((tω)^r) = t^r (ω^r)` for real `t`. At `t = −1` and `r = 1`, `(−O(1))_{ℙ¹} = −1`, so `−O(1)` is not nef.
- On `ℙ¹ × ℙ¹`, `ω = O(1,0) + O(0,1)` is a real polarization with `(ω²) = 2`, though neither summand is big.
- Formal combinations with the same image: on `ℙ¹ × ℙ¹`, `[O(1,1)]` and `[O(1,0)] + [O(0,1)]` have the same image in `Pic ⊗ ℝ`. The multilinear expansion gives `(ω²) = (O(1,1)²) = 2` for the first and `0 + 1 + 1 + 0 = 2` for the second; the formal sum `[O(1,0)] + [O(0,1)] − [O(1,1)]`, which maps to `0`, gets `2 − 4 + 2 = 0`. A form evaluated term by term on the diagonal only, `Σ_a ω(a)^2 (a²)`, would give `0 + 0 = 0` for the second.
- Nefness belongs to the class, not to a representation: on `ℙ¹ × ℙ¹`, `2·O(1,1) − O(1,0)` has a negative coefficient, but it is the class of `O(1,2)`, with degrees `2` and `1` on the two rulings, so it is nef and even ample. A definition through the signs of the coefficients of a chosen representation would call it not nef. The map to `N¹(ℙ¹ × ℙ¹/K) ≅ ℝ²` sends it to `(1, 2)`, in the nef quadrant.

### 2.4 Reduction to an integral variety over an algebraically closed field

Let `V` be an integral projective `K`-scheme of dimension `r`. Let `ν : Ṽ → V` be its normalization and `K' = H⁰(Ṽ, O_Ṽ)`. Let `Ω` be an algebraic closure of `K'` and `W = (Ṽ ×_{K'} Ω)_red`. Prove the following.

- (a) `K'` is a finite field extension of `K`, algebraically closed in `K(Ṽ)`. Hence `Ṽ` is geometrically irreducible over `K'` (stacks-varieties Lemma 8.6, tag 054Q, line 691), and `W` is an integral projective variety over `Ω` with `[Ṽ_Ω] = m[W]` for an integer `m ≥ 1`.
- (b) There is a positive integer `c_V = [K' : K]·m` such that `(L_1 ⋯ L_r)_{V/K} = c_V·(L_1|_W ⋯ L_r|_W)_{W/Ω}` for all line bundles `L_1, …, L_r` on `V`. Here `L|_W` is the pullback along `W → Ṽ_Ω → Ṽ → V`, and the equality extends to real classes.
- (c) The pullback to `W` of an ample line bundle on `V` is ample. The morphism `W → V` is affine, being the composite of a closed immersion, the base change of `Spec Ω → Spec K'` and the finite `ν`; it is not finite when `Ω/K'` is infinite. Being affine it is quasi-affine, and stacks-morphisms Lemma 38.7 (2), line 3862, applied once to it, gives the claim.

For (b): the projection formula along `ν`, of degree one, gives the numbers on `Ṽ`. An Euler characteristic over `K` is `[K' : K]` times the one over `K'`. Extending the field to `Ω` changes nothing, and §2.1 gives `m`. Every inequality between products of two intersection numbers, homogeneous of degree one in each factor, therefore holds on `V` once it holds on `W`. The behaviour of nef line bundles under this reduction is §3.1.

*Needs:* §§2.1, 2.3; CyclotomicClassGroupsAndStickelberger §4.3 (projection formula, field extension); SchemeAndStackFoundations §§0.20, 0.30; StableReduction Layer 2.

**Checks.**

- `V = ℙ¹_ℂ` as an `ℝ`-scheme: `K' = ℂ`, `W = ℙ¹_ℂ`, `m = 1`, `c_V = 2`, and `(O(1))_{V/ℝ} = 2 = 2·1`.
- `V = Proj ℝ[x, y, z]/(x² + y² + z²)`, the conic without real points: `K' = ℝ` and `W` is a smooth conic over `ℂ`. Then `c_V = 1` and `(O(1))_{V} = 2 = (O(1))_{W}`.
- Over `K = 𝔽_2(t)`, `V = Proj K[x, y, z]/(x² + t y²)` is integral but not normal: at the `K`-point `[0 : 0 : 1]` the cotangent space has dimension `2`, because `x² + t y²` lies in the square of the maximal ideal, so the one-dimensional local ring there is not regular. Its normalization is `ℙ¹_{K'}` with `K' = K(√t)`: the chart `y ≠ 0` is `Spec K[x, z]/(x² + t) = 𝔸¹_{K'}`, and the `K'`-point at infinity is pinched to `[0 : 0 : 1]`. So `H⁰(V, O_V) = K` (a plane conic) while `K' = H⁰(Ṽ, O_Ṽ) = K(√t)`; `Ṽ` is geometrically integral over `K'`, `m = 1` and `c_V = 2`. Since `χ_K(O_V(n)) = 2n + 1` and `ν^*O(1) = O_{ℙ¹_{K'}}(1)`, `(O(1))_{V/K} = 2 = 2·(O(1)|_Ṽ)_{Ṽ/K'}`: the value passes through the normalization, as (a) requires. Base change to `K'` instead gives the double line `(x + √t·y)²` with fundamental cycle `2·[line]` and the same value `2·1`.
- Non-example: let `V` be `ℙ¹_ℂ` over `ℝ` with the conjugate points `i, −i` pinched to one real point. Then `V` is integral with `H⁰(V, O_V) = ℝ`, but `ℂ ⊆ K(V) = ℂ(t)`. So `V` is not geometrically irreducible over `H⁰(V, O_V)` (stacks-varieties Lemma 8.6), and the normalization (`ℙ¹_ℂ`, with `K' = ℂ`) is needed in (a).

### Examples

`ℙ¹ × ℙ¹` with `(O(a,b)·O(c,d)) = ad + bc`; double points and conics for the component formula; `ℙ¹_ℂ` over `ℝ` and the real pointless conic for the reduction lemma.

### Dependencies

CyclotomicClassGroupsAndStickelberger §4.3; AlgebraicModuliForArithmeticGeometryPartII §0.1 (the case `r = 1` of §2.1) and §§1.1, 1.5 (nef real classes, §2.3); SchemeAndStackFoundations §§0.20, 0.30, 2.6, 3.3, 4.12, 5.1–5.3 and §5.10 (a Check of §2.2); StableReduction Layer 2; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`. Layer 2 does not use Layer 1.

## Layer 3: Positivity over an arbitrary field

### 3.1 Nef line bundles

Nefness is imported. A line bundle `L` on a proper `K`-scheme `X` is nef if its degree on every integral closed curve `C ⊆ X` is nonnegative (AlgebraicModuliForArithmeticGeometryPartII §1.5, over the base `Spec K`). The same section gives stability under sums and positive multiples, nefness of `p^*L` for every `K`-morphism `p : Y → X` of proper `K`-schemes (in particular of `L|_Z` for every closed subscheme `Z`), and preservation of nefness under extension of the ground field; its §1.7 shows that ample line bundles are nef. Nef real classes are those of §2.3: nonnegative degree on every integral curve, equivalently nef image in `N¹(X/K)` (cutkosky2015 §2.2, lines 274–287, for nef and ample real classes on a complete variety over an arbitrary field). They form a convex cone in `Pic(X) ⊗ ℝ` containing the nef line bundles, which can be strictly larger than the cone of positive combinations of nef line bundles (Checks); every statement here about nef real classes is about the full cone. Prove the following.

- *Numerical form.* `L` is nef if and only if `(L · C) ≥ 0` for every integral closed curve `C ⊆ X`, with the numerical intersection of CyclotomicClassGroupsAndStickelberger §4.3. On a scheme `C` of dimension one, `χ(C, nL)` is a polynomial of degree at most one in `n`, so its coefficient of `n` is the degree `χ(C, L) − χ(C, O_C)` of AlgebraicModuliForArithmeticGeometryPartII §0.1. On a projective variety the same condition is the nefness of ArakelovGeometryAndAbelianHeightsPartII §0.1, through SchemeAndStackFoundations §3.3 and §2.2 here.
- *Big and nef pullback.* If `p : Y → X` is a generically finite surjective morphism of projective varieties of the same dimension `d` and `L` is big and nef, then `p^*L` is big and nef, with `((p^*L)^d) = deg(p)·(L^d)` by the projection formula (CyclotomicClassGroupsAndStickelberger §4.3).
- *Pullback of nef real classes.* For a `K`-morphism `p : Y → X` of proper `K`-schemes and a nef real class `ω` on `X`, `p^*ω` is nef. For an integral curve `C' ⊆ Y`, the projection formula of §2.3 with `r = 1` gives `(p^*ω · C') = deg(C' → p(C'))·(ω · p(C'))` when `p(C')` is a curve and `0` when it is a point. Consequently, for `p` as in the previous item and a real polarization `ω`, `p^*ω` is a real polarization with `((p^*ω)^d) = deg(p)·(ω^d)`.
- *Ample approximation.* Let `X` be a proper `K`-scheme with an ample line bundle `H`, and `ω_1, …, ω_s` nef real classes written in one finite family of line bundles, `ω_j = Σ_{i=1}^{n} t_{ji} L_i`. Fix an integer `m ≥ 1` such that `mH + L_i` and `mH − L_i` are ample for every `i` (AlgebraicModuliForArithmeticGeometryPartII §1.7). For every rational `δ > 0` and all rationals `t'_{ji}` with `|t'_{ji} − t_{ji}| ≤ δ/(2mn)`, there are an integer `N ≥ 1` and ample line bundles `A_1, …, A_s` with `Σ_i t'_{ji} L_i + δH = N^{−1}·A_j` in `Pic(X) ⊗ ℝ`. Consequently, let `P ≤ Q` be an inequality between polynomials in the intersection numbers of `s` classes on closed subschemes of `X`, with `P` and `Q` homogeneous of the same degree in each of the `s` classes. If it holds whenever the classes are ample line bundles, it holds for all nef real classes `ω_1, …, ω_s`.

  *Route.* Ample line bundles have positive degree on integral curves (AlgebraicModuliForArithmeticGeometryPartII §1.7), so `|(L_i · C)| < m·(H · C)` for every integral curve `C`. Hence `β_j = Σ_i t'_{ji} L_i + (δ/2)H` has `(β_j · C) ≥ (ω_j · C) − (δ/2)(H · C) + (δ/2)(H · C) ≥ 0`. Let `N ≥ 1` make every `N t'_{ji}` and `Nδ/2` integers, so `Nδ/2 ≥ 1`. Then `Nβ_j + (Nδ/2 − 1)H` is a nef line bundle, and `A_j = Nβ_j + (Nδ/2 − 1)H + H` is ample by AlgebraicModuliForArithmeticGeometryPartII §1.7 (ii). For the consequence, `P(N^{−1}A) ≤ Q(N^{−1}A)` follows from `P(A) ≤ Q(A)` by homogeneity. Every intersection number is a polynomial in the coefficients (§2.3), so letting `δ → 0` and `t'_{ji} → t_{ji}` gives `P(ω) ≤ Q(ω)`.
- *Field extension.* Let `K'/K` be a field extension. For every proper `K`-scheme `X`, `L` is nef on `X` if and only if `L_{K'}` is nef on `X_{K'}`. The forward direction is the base change of AlgebraicModuliForArithmeticGeometryPartII §1.5 along `Spec K' → Spec K`, both bases being Noetherian. Converse: for an integral curve `C ⊆ X`, `(L · C) = (L_{K'} · C_{K'})` by field-extension compatibility (CyclotomicClassGroupsAndStickelberger §4.3), `C_{K'}` has pure dimension one, and §2.1 writes `(L_{K'} · C_{K'})` as `Σ m_i (L_{K'} · C_i)` over its components, each term nonnegative.
- *Reduction.* For `V`, `Ṽ`, `K'` and `W` as in §2.4, the pullback to `W` of a nef line bundle on `V` is nef. It is nef on `Ṽ` by pullback. Nefness on `Ṽ` does not depend on whether `Ṽ` is regarded over `K` or over `K'`, since the degree of a line bundle on a curve over `K` is `[K' : K]` times its degree over `K'` (Tau Ceti's `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber_eq_finrank_mul`). It is then nef on `Ṽ_Ω` by the field-extension item over `K'`, and on `W` by pullback along the closed immersion.

*Needs:* AlgebraicModuliForArithmeticGeometryPartII §§0.1, 1.5, 1.7; ArakelovGeometryAndAbelianHeightsPartII §0.1; CyclotomicClassGroupsAndStickelberger §4.3; §§2.1–2.4; SchemeAndStackFoundations §3.3; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber_eq_finrank_mul`.

**Checks.**

- `X = ℙ¹_ℂ` as an `ℝ`-scheme with `L = O(1)`: `X_ℂ = ℙ¹_ℂ ⊔ ℙ¹_ℂ` and `L_ℂ` has degree `1` on each component, so it is nef; the converse computes `(L · X) = 2 = 1 + 1` over the two components. In `𝔸²_{K(t)}` the line `y = tx` is an integral curve whose image in `𝔸²_K` is dense, so an integral curve of `X_{K'}` need not lie over a curve of `X`: the forward direction is the imported base-change theorem, not a curve-by-curve comparison.
- On `ℙ¹`, `O(a)` is nef if and only if `a ≥ 0`. On `ℙ¹ × ℙ¹`, `O(a,b)` is nef if and only if `a, b ≥ 0`, since `O(a,b)` has degree `b` on `{p} × ℙ¹` and `a` on `ℙ¹ × {q}`.
- `O(1,0)` on `ℙ¹ × ℙ¹` is nef and not ample: its degree on `{p} × ℙ¹` is `0`. It is the pullback of `O(1)` along the first projection.
- On the blow-up `π : X → ℙ²` of a point, `π^*O(1)` is big and nef with `((π^*O(1))²) = 1 · 1 = 1`. It has degree `0` on the exceptional curve, so it is not ample.
- Non-example: `O(1,−1)` on `ℙ¹ × ℙ¹` has degree `−1` on `{p} × ℙ¹` and is not nef.
- Full nef cone. Let `E` be a complex elliptic curve without complex multiplication, `X = E × E`, `F_1 = {0} × E`, `F_2 = E × {0}` and `Δ` the diagonal: their squares are `0` and their pairwise intersections `1`, so they are independent and span `N¹(X/ℂ)`, of dimension `ρ(E × E) = 3` (AlgebraicModuliForArithmeticGeometryPartII §1.2, Checks). Under `xF_1 + yF_2 + zΔ ↦ [[x + z, −z], [−z, y + z]]` the intersection of two classes becomes `tr(B·adj B')`, the polarization of `2·det`, and `F_1 + F_2` goes to the identity. An integral curve on an abelian surface is algebraically equivalent to a translate meeting it properly, so it has nonnegative square; it has positive degree on the ample `F_1 + F_2`, so its matrix is positive semidefinite. Hence a class of this span is nef exactly when its matrix is positive semidefinite: its degree on a curve `C` is `tr(B·adj C) ≥ 0`, and conversely a nef class has nonnegative square (§3.2) and nonnegative trace. This is the identification of AlgebraicModuliForArithmeticGeometryPartII §1.4 (Checks). The class `A = (1 + √2)F_1 + (2 + √2)F_2 − √2Δ` has matrix `[[1, √2], [√2, 2]]`, with eigenvalues `0` and `3`. So `A` is nef, with `(A²) = 0`, `(A · (F_1 + F_2)) = 3` and degrees `2`, `1` and `3 + 2√2` on `F_1`, `F_2` and `Δ`. It is no positive combination of nef line bundles. Numerical classes of line bundles have rational matrices, and if `A = Σ a_j B_j` with `a_j > 0` and `B_j` rational positive semidefinite, then `v = (−√2, 1)` has `vᵀAv = 0`, so `vᵀB_jv = 0`, `B_jv = 0` and `B_j = 0`. The ample class `A + F_1 + F_2` is such a combination: it is `(2 − √2)(2F_1 + 2F_2 − Δ) + (√2 − 1)(3F_1 + 6F_2 − 2Δ) + F_1 + (5 − 3√2)F_2`, with nef line bundles of matrices `[[1, 1], [1, 1]]`, `[[1, 2], [2, 4]]`, `[[1, 0], [0, 0]]` and `[[0, 0], [0, 1]]`. Negative control: `F_1 − F_2` has matrix `diag(1, −1)`, square `−2` and degree `−1` on `F_1`, so it is not nef.
- Approximation needs the ample term. On `E × E` as above, with `H = F_1 + F_2`, one may take `m = 3`: `3H ± F_1`, `3H ± F_2` and `3H ± Δ` have positive definite matrices (`[[2, 1], [1, 2]]` for `3H − Δ`), while `2H − Δ` has the singular matrix `[[1, 1], [1, 1]]` and is not ample. Write `A` in the family `F_1, F_2, Δ`, so `n = 3`, and take `δ = 1/5`, a tolerance `δ/(2mn) = 1/90`. The rationals `(2.41, 3.41, −1.42)` lie within `1/90` of `(1 + √2, 2 + √2, −√2)`. Their class alone has matrix `[[0.99, 1.42], [1.42, 1.99]]`, of determinant `−0.0463`, and is not nef: rounding the coefficients of a boundary class can leave the nef cone. With `δH` added the matrix is `[[1.19, 1.42], [1.42, 2.19]]`, of determinant `0.5897`, and `N = 100` gives the ample line bundle `261F_1 + 361F_2 − 142Δ`, of matrix `[[119, 142], [142, 219]]` and determinant `5897`.
- Homogeneity is needed in the consequence: on `ℙ²` the inequality `(A²) ≥ 1` holds for every ample line bundle `A = O(a)`, `a ≥ 1`, but fails for the nef real class `H/2`, of square `1/4`.

### 3.2 Kleiman's theorem

Let `X` be proper over `K`, `Z ⊆ X` a closed subscheme of dimension `r`, and `D_1, …, D_r` nef line bundles on `X`, or nef real classes. Prove `(D_1 ⋯ D_r · Z) ≥ 0` for the numerical intersection. Kleiman's theorem itself, for nef line bundles on an integral closed subscheme and with degrees of first Chern classes, and the ampleness of `D + H` for `D` nef and `H` ample, both over every field, are AlgebraicModuliForArithmeticGeometryPartII §1.7 (ii) (lazarsfeld2004 Theorem 1.4.9 and Corollary 1.4.10; cutkosky2015 §2.2, lines 274–287, for the nef and ample cones over an arbitrary field). This subsection adds nonintegral `Z`, the Euler-characteristic numbers and all nef real classes.

*Route.* By §2.1, extended multilinearly to real classes (§2.3), `(D_1 ⋯ D_r · Z) = Σ_i m_i (D_1 ⋯ D_r · Z_i)` over the `r`-dimensional components `Z_i` of `Z`, with `m_i ≥ 1`. For nef line bundles, on each integral `Z_i`, §2.2 identifies `(D_1 ⋯ D_r · Z_i)` with `deg(c_1(D_1) ∩ ⋯ ∩ c_1(D_r) ∩ [Z_i])`, which is nonnegative by AlgebraicModuliForArithmeticGeometryPartII §1.7 (ii) applied to `Z_i ⊆ X`. For nef real classes, Chow's lemma (SchemeAndStackFoundations §4.12) gives an integral projective `Z'` with a proper birational `π : Z' → Z_i`, and the projection formula of §2.3, of degree one, gives `(D_1 ⋯ D_r · Z_i) = (π^*D_1 ⋯ π^*D_r)_{Z'}`, where the `π^*D_j` are nef (§3.1). On the projective `Z'` the ample approximation of §3.1 applies to the inequality `0 ≤ (D_1 ⋯ D_r)_{Z'}`, homogeneous of degree one in each class, which holds for ample line bundles by positivity (CyclotomicClassGroupsAndStickelberger §4.3).

*Needs:* §§2.1, 2.2, 2.3, 3.1; AlgebraicModuliForArithmeticGeometryPartII §§1.5, 1.7; CyclotomicClassGroupsAndStickelberger §4.3 (ample positivity); SchemeAndStackFoundations §4.12.

**Checks.**

- On `ℙ¹ × ℙ¹`: `(O(1,0)²) = 0 ≥ 0` and `(O(1,0) · O(0,1)) = 1`.
- Non-example: `(O(1,−1)²) = 2·1·(−1) = −2 < 0`, and `O(1,−1)` is not nef (§3.1).
- Nonintegral support: the double line `Z = V(x²) ⊆ ℙ²` has `χ(O_Z(n)) = χ(O(n)) − χ(O(n − 2)) = 2n + 1`, so `(O(1) · Z) = 2 = 2·(O(1) · line) ≥ 0`. A version on the reduced support alone would give `1`.
- The imported nef-plus-ample: `O(1,0) + O(1,1) = O(2,1)` is ample on `ℙ¹ × ℙ¹`, with `(O(2,1)²) = 4` and degrees `1` and `2` on the rulings. Without the ample summand, `O(1,0)` is nef and not ample.
- On the blow-up of `ℙ²` at a point with exceptional curve `E`, `π^*O(1)` is nef and `(π^*O(1) · E) = 0 ≥ 0`. Adding the ample `π^*O(2) − E` gives the ample `π^*O(3) − E`.
- A nef real class outside the positive combinations of nef line bundles: on `E × E` with the class `A` of §3.1 (Checks), `(A²) = 0 ≥ 0` and `(A · (F_1 + F_2)) = 3 ≥ 0`. A statement restricted to positive combinations of nef line bundles would not cover `A`. The class `F_1 − F_2`, of square `−2`, is not nef.

### 3.3 Siu's inequality in intersection form

Let `V` be an integral projective variety of dimension `r ≥ 1`, `A` and `B` nef line bundles with `(A^r) > 0`, and `C_1, …, C_{r−1}` nef line bundles. Prove

```text
(A^r)·(B · C_1 ⋯ C_{r−1}) ≤ r·(A^{r−1} · B)·(A · C_1 ⋯ C_{r−1}).
```

The inequality holds as well when `A`, `B` and the `C_j` are nef real classes with `(A^r) > 0` (dang2020 Proposition 3.4.1 and Remark 3.4.3, lines 840–869; lazarsfeld2004 Theorem 2.2.15; dangfavre2021 Theorem 1.2, line 434, for `k = 1` with constant `d`).

*Route.* For nef line bundles: for integers `p, q > 0` with `p(A^r) > r q (A^{r−1}·B)`, ArakelovGeometryAndAbelianHeightsPartII §0.3 (2′), read through §2.2 here, gives `vol(pA − qB) ≥ p^{r−1}(p(A^r) − rq(A^{r−1}·B)) > 0`. So some `m(pA − qB)` has a nonzero section. On the integral `V` it is a regular section, and its zero scheme is an effective Cartier divisor `D` (Tau Ceti's `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier`) with `O(D) ≅ m(pA − qB)`. The Cartier restriction formula and §3.2 on `D` give `m(p(A · C) − q(B · C)) = (C_1 ⋯ C_{r−1} · D) ≥ 0`. Let `p/q` decrease to `r(A^{r−1}·B)/(A^r)`. For nef real classes: both sides are homogeneous of degree `r` in `A` and of degree one in `B` and in each `C_j`, and the inequality holds for ample line bundles by the case just proved, so the ample approximation of §3.1 extends it to all nef real classes on `V`.

*Needs:* §§2.2, 2.3, 3.1, 3.2; ArakelovGeometryAndAbelianHeightsPartII §0.3; CyclotomicClassGroupsAndStickelberger §4.3 (Cartier restriction); Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier`.

**Checks.**

- On `ℙ¹ × ℙ¹`, write `(a,b)·(c,d) = ad + bc`. With `A = O(1,1)`, `B = O(1,0)` and `C = O(0,1)`: `(A²)(B·C) = 2·1 = 2` and `2(A·B)(A·C) = 2·1·1 = 2`, so equality holds. With `C = O(1,0)` instead: `0 ≤ 2`.
- `r = 1`: both sides are `(A)·(B)`.
- Non-example: `B = O(1,−1)` is not nef. With `A = O(1,1)` and `C = O(0,1)`, the left side is `2·1 = 2` but the right side is `2·0·1 = 0`. Nefness of `B` is needed.
- Nef real classes on `E × E`: write `A_0` for the boundary class `A` of the §3.1 Checks and `I = F_1 + F_2`. Take `A = A_0 + I`, of matrix `[[2, √2], [√2, 3]]` and square `8`, `B = A_0`, which is no positive combination of nef line bundles, and `C = I`. The left side is `8·(A_0·I) = 8·3 = 24` and the right side `2·((A_0 + I)·A_0)·((A_0 + I)·I) = 2·3·5 = 30`.

### 3.4 The Hodge inequality on surfaces

Let `S` be an integral projective surface over `K`, `H` a line bundle with `(H²) > 0`, and `D` any line bundle. Prove `(D · H)² ≥ (D²)·(H²)`. No positivity of `H` is assumed (kleiman2005 Theorem B.27, line 3803, the Hodge index theorem on a geometrically irreducible complete surface over a field for every `H` with `(H²) > 0`, proved there by another route; cutkosky2015 lines 994–1003).

*Route.* By §2.4 reduce to `S` integral over an algebraically closed `Ω`: both sides scale by `c_S²`, and `((H|_W)²) = (H²)/c_S > 0`. de Jong's theorem (SchemeAndStackFoundations §4.19) gives an alteration `φ : S' → S` from a regular projective surface. Since `φ` is proper, `S'` is the component of the regular compactification containing it. `S'` is smooth over `Ω` (SchemeAndStackFoundations §4.13, `Ω` perfect). Let `δ` be the generic degree and `H' = φ^*H`, so `(H'²) = δ(H²) > 0` by the projection formula (§2.3). The Hodge index theorem of SchemeAndStackFoundations §5.10, whose pairing is the numerical intersection (SchemeAndStackFoundations §5.9), applies to `H'` on the smooth projective integral `S'` directly, since it assumes only `(H'²) > 0`. Apply it to the line bundle `D'' = (H'²)·φ^*D − (φ^*D · H')·H'`, which has `(D'' · H') = 0`: `(D''²) = (H'²)·((H'²)·((φ^*D)²) − (φ^*D · H')²) ≤ 0`, so `(φ^*D · H')² ≥ ((φ^*D)²)·(H'²)`. Divide by `δ²`, using the projection formula (§2.3). What this section adds to the smooth case is the reduction from an integral, possibly singular surface over an arbitrary field.

*Needs:* §§2.3, 2.4; SchemeAndStackFoundations §§4.13, 4.19, 5.9, 5.10.

**Checks.**

- On `ℙ¹ × ℙ¹` with `H = O(1,1)`: `D = O(1,−1)` gives `0 ≥ (−2)·2 = −4`; `D = H` gives equality `4 = 4`.
- On the quadric cone `Q ⊆ ℙ³`, a singular normal surface, `H = D = O(1)` gives `(D·H)² = 4 = 2·2`.
- On the blow-up of `ℙ²` at a point with `L = π^*O(1)` and exceptional curve `E`, `H = 2L + E` has `(H²) = 4 − 1 = 3 > 0` and `(H · E) = −1`, so `H` is not nef. `D = E` gives `(D·H)² = 1 ≥ (−1)·3 = −3`, and `D = L` gives `4 ≥ 1·3`. A statement restricted to nef `H` would not cover this instance, and the perturbation of `H` to an ample class, which needs `H` nef, is not a route to it.
- Non-example: on the blow-up of `ℙ²` at two points with exceptional curves `E_1`, `E_2`, take `H = E_1` with `(H²) = −1` and `D = E_2`. Then `(D·H)² = 0 < 1 = (D²)(H²)`. The hypothesis `(H²) > 0` is needed.

### 3.5 The Khovanskii–Teissier inequalities

Let `V` be an integral projective variety of dimension `d ≥ 2` and `A, B, C_1, …, C_{d−2}` nef line bundles or nef real classes. Prove the inequality of Hodge type

```text
(A · B · C_1 ⋯ C_{d−2})² ≥ (A² · C_1 ⋯ C_{d−2})·(B² · C_1 ⋯ C_{d−2}).
```

As a consequence, for nef `A, B` and `s_k = (A^k · B^{d−k})`, prove `s_k² ≥ s_{k−1}·s_{k+1}` for `1 ≤ k ≤ d − 1` (lazarsfeld2004 Theorem 1.6.1 and Corollary 1.6.3; cutkosky2015 Theorem 6.1 and Corollary 6.3, lines 983–1033, over an arbitrary field; guedj2010 Théorème 2.4 (a), line 1180, and dangfavre2021 lines 465–467 for the use on dynamical degrees). The consequence is the main inequality with `C_1 ⋯ C_{d−2} = A^{k−1}B^{d−k−1}`. The main inequality, for nef real classes on an integral projective variety of dimension `m + 2` written as `(A² · C)·(B² · C) ≤ (A · B · C)²`, is the acceptance statement `khovanskii_teissier`.

*Route.* Both sides are homogeneous of degree two in each class, so by the ample approximation of §3.1 it suffices to treat ample line bundles `A, B, C_1, …, C_{d−2}`. By §2.4 reduce to the integral `W` over an algebraically closed `Ω`; both sides scale by `c_V²`, and the pullbacks remain ample (§2.4 (c)). By homogeneity again, replace every class by a very ample multiple (AlgebraicModuliForArithmeticGeometry §1.4). Over the purely transcendental extension `Ω(u)`, `W_{Ω(u)}` is integral and geometrically irreducible. Cut it successively by the generic members of the linear systems of `C_1, …, C_{d−2}`. By Bertini irreducibility (LefschetzPencilsAndVanishingCycles §5.1, with `s = 1`, applied while the dimension is at least `3`) each cut has geometrically irreducible support. The last one is a surface `S` with `[cut] = μ[S_red]`. The Cartier restriction formula and field-extension compatibility (CyclotomicClassGroupsAndStickelberger §4.3), with §2.1 here, turn the three numbers into `μ` times numbers on `S_red`. Apply §3.4 on `S_red` with `H = A|_S`, which is ample with `(A² · S_red) > 0`. For `d = 2` there is no cut, and the statement for ample line bundles is §3.4 with `H = A`.

*Needs:* §§2.1, 2.3, 2.4, 3.1, 3.4; AlgebraicModuliForArithmeticGeometryPartII §1.7; AlgebraicModuliForArithmeticGeometry §1.4; LefschetzPencilsAndVanishingCycles §5.1; CyclotomicClassGroupsAndStickelberger §4.3; Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier`.

**Checks.**

- On `ℙ¹ × ℙ¹`: `A = O(1,0)`, `B = O(0,1)` gives `1 ≥ 0·0`; `A = O(2,1)`, `B = O(1,1)` gives `9 ≥ 4·2 = 8`.
- On `ℙ^d` with `A = aH` and `B = bH`, `s_k = a^k b^{d−k}` and log-concavity is an equality.
- Irrational boundary (§3.1, Checks): on `E × E` with the nef class `A` and `I = F_1 + F_2`, `(A · I)² = 9 ≥ (A²)(I²) = 0·2 = 0`. For the ample `A + εI`, `ε > 0`, the two sides are `(3 + 2ε)²` and `(6ε + 2ε²)·2 = 12ε + 4ε²`, which differ by `9` for every `ε` and tend to `9` and `0`, the values at `A`.
- Non-example (cutkosky2015 Remark 6.2, lines 1014–1020): on `ℙ² ⊔ ℙ²`, `α_1 = (O(2), O(1))` and `α_2 = (O(1), O(2))` are ample. They have `(α_1 · α_2)² = 16 < 25 = (α_1²)(α_2²)`, so integrality of `V` is needed.

### 3.6 Siu's inequality for products

Let `V` be an integral projective variety of dimension `r ≥ 0` and `0 ≤ i ≤ r`. Let `A_1, …, A_i`, `B`, `C_1, …, C_{r−i}` be nef line bundles or nef real classes. Prove

```text
(B^r)·(A_1 ⋯ A_i · C_1 ⋯ C_{r−i}) ≤ (r − i + 1)^i·(A_1 ⋯ A_i · B^{r−i})·(B^i · C_1 ⋯ C_{r−i}).
```

No positivity of `B` is assumed: when `(B^r) = 0` the left side vanishes and the right side is a product of nonnegative numbers by §3.2. For `i = 0` both sides are `(B^r)·(C_1 ⋯ C_r)`. In `Suggested.lean` the dimension is written `i + j` with `j = r − i`, and the statement is `siu_inequality_products`. As a consequence, if `A` and `B` are nef with `(A^r) > 0` and `(B^r) > 0`, then `(A^k · B^{r−k}) > 0` for every `0 ≤ k ≤ r`. To see this, take `A_j = A` and `C_j = A`: the left side is `(B^r)(A^r) > 0` (dang2020 Theorem 3, line 141, and Theorem 3.4.4 with its proof, lines 871–883; dangfavre2021 Theorem 1.2, lines 427–433).

*Route.* Both sides are homogeneous of degree `r` in `B` and of degree one in each `A_j` and each `C_j`. So by the ample approximation of §3.1 it suffices to treat ample line bundles, for which `(B^r) > 0` holds automatically. By §2.4 reduce to the integral `W` over an algebraically closed `Ω`; both sides scale by `c_V²`, and the pullbacks remain ample (§2.4 (c)). By homogeneity again, replace `B` and the `A_j` by very ample multiples (AlgebraicModuliForArithmeticGeometry §1.4). For `j = 1, …, i`, let `Z_j` be the reduced support of the generic complete intersection representing `B^{j−1} · A_{j+1} ⋯ A_i ∩ [W]`, over a purely transcendental extension of `Ω`. It has dimension `r − i + 1`, irreducible support by LefschetzPencilsAndVanishingCycles §5.1, and some multiplicity. Apply §3.3 on `Z_j` with `A := B`, `B := A_j` and the `C`'s:

```text
x_j ≤ (r − i + 1)·(y_j / y_{j+1})·x_{j+1},
```

where `x_j = (B^{j−1} A_j ⋯ A_i · C)`, `y_j = (B^{r−i+j−1} A_j ⋯ A_i)` and `y_{i+1} = (B^r)`. The denominators are positive by positivity for ample line bundles. The ratios telescope to `y_1/(B^r)`. Reducible supports are excluded because the inequality fails on them (Checks).

*Needs:* §§2.1, 2.3, 2.4, 3.1, 3.3; AlgebraicModuliForArithmeticGeometryPartII §1.7; AlgebraicModuliForArithmeticGeometry §1.4; LefschetzPencilsAndVanishingCycles §5.1; CyclotomicClassGroupsAndStickelberger §4.3.

**Checks.**

- On `(ℙ¹)³` with fibre classes `h_1, h_2, h_3` and `B = h_1 + h_2 + h_3`, so `(B³) = 6`, take `A_1 = h_1`, `A_2 = h_2`, `C = h_3`. The left side is `6·1 = 6` and the right side is `(3 − 2 + 1)²·(h_1 h_2 B)·(B² h_3) = 4·1·2 = 8`. With the constant `binom(3,2) = 3` the two sides are equal. A constant `1` would give `2 < 6`.
- `i = r`: both sides equal `(B^r)(A_1 ⋯ A_r)`. `i = 1` is §3.3. `i = 0`: both sides equal `(B^r)(C_1 ⋯ C_r)`, and a constant `(r + 1)^0 = 1` is forced.
- Degenerate `B`: on `ℙ¹ × ℙ¹` take the nef, not big `B = O(1,0)`, so `(B²) = 0`, with `i = 1`, `A_1 = C = O(0,1)`. The left side is `0·(A_1 · C) = 0·0 = 0` and the right side `2·(A_1 · B)·(B · C) = 2·1·1 = 2`. The inequality holds without `(B^r) > 0`; only its form divided by `(B^r)` needs it.
- Non-example: on `V = ℙ² ⊔ ℙ²`, take `B = (O(1), O(2))` with `(B²) = 5`, and `A_1 = C = (O(1), O)`. The left side is `5·1 = 5` and the right side `2·1·1 = 2`. The inequality fails on reducible schemes, so the slices `Z_j` must be irreducible.

### Examples

`ℙ¹ × ℙ¹` with `(a,b)·(c,d) = ad + bc`: nefness, Kleiman, the Siu equality case, the Hodge inequality and Khovanskii–Teissier. `(ℙ¹)³` for Siu with products. The blow-ups of `ℙ²` at one and two points for big-and-nef-not-ample classes and for the Hodge hypothesis. Disjoint unions of planes for the integrality hypotheses. `E × E` without complex multiplication for a nef real class that is no positive combination of nef line bundles, and for the ample term in the approximation.

### Dependencies

Layer 2; AlgebraicModuliForArithmeticGeometryPartII §§0.1, 1.5, 1.7 and §§1.2, 1.4 (a Check of §3.1); AlgebraicModuliForArithmeticGeometry §1.4; ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3; CyclotomicClassGroupsAndStickelberger §4.3; LefschetzPencilsAndVanishingCycles §5.1; SchemeAndStackFoundations §§3.3, 4.12, 4.13, 4.19, 5.9, 5.10; Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier`, `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber_eq_finrank_mul`. Layer 3 does not use Layer 1.

## Layer 4: Degrees of dominant rational maps

Throughout, `X`, `Y` (and `X_1, X_2, X_3`) are projective varieties of the same dimension `d ≥ 0` and the rational maps are dominant `K`-rational maps.

### 4.1 Mixed degrees and their models

For `f : X ⤏ Y`, line bundles or real classes `L_1, …, L_{d−k}` on `X` and `M_1, …, M_k` on `Y`, define the *mixed degree*

```text
deg(f; L_1, …, L_{d−k} | M_1, …, M_k) = (π_1^*L_1 ⋯ π_1^*L_{d−k} · π_2^*M_1 ⋯ π_2^*M_k)_{Γ_f},
```

and `deg_k(f; L, M)` with all `L_i = L` and all `M_j = M`. For a self-map put `deg_{k,ω}(f) = deg_k(f; ω, ω)` (dang2020 lines 21–25; dangfavre2021 §1.3, lines 436–443; dinhsibony2005 lines 61–63; russakovskiishiffman1997 lines 499–505). In `Suggested.lean` the degree with all `L_i` equal to a real class `ω` and all `M_j` equal to a real class `η` is `mixedDegree K f ω η p q`, with `p = d − k` and `q = k`: the real intersection number on `graph f`, regarded as a `K`-scheme through `π_1`, of `p` copies of `π_1^*ω` and `q` copies of `π_2^*η`, defined for every rational map. Prove:

- *Model independence.* Let `Γ'` be an integral projective `K`-scheme of dimension `d` with morphisms `q_1 : Γ' → X` and `q_2 : Γ' → Y`. Suppose `q_1` is generically finite and surjective of generic degree `e`, and the rational map of `q_2` is `f ∘ q_1`. Then `(q_1^*L_1 ⋯ q_2^*M_k)_{Γ'} = e·deg(f; L | M)`. The proof factors `(q_1, q_2)` through `Γ_f` and applies the projection formula. In particular, the normalization of `Γ_f` and every proper birational model of `Γ_f` compute the same numbers (dangfavre2021 lines 442–443).
- *Product formula.* `deg(f; L | M) = (pr_1^*L_1 ⋯ pr_2^*M_k · Γ_f)` on `X ×_K Y`.
- *Pullback of cycles.* For line bundles `M_1, …, M_k` on `Y` put `f^*(M_1 ⋯ M_k) = π_{1*}(c_1(π_2^*M_1) ∩ ⋯ ∩ c_1(π_2^*M_k) ∩ [Γ_f]) ∈ CH_{d−k}(X)`. For line bundles `L_1, …, L_{d−k}` on `X`, `deg(f; L | M) = deg(c_1(L_1) ∩ ⋯ ∩ c_1(L_{d−k}) ∩ f^*(M_1 ⋯ M_k))`, by the projection formula of SchemeAndStackFoundations §5.3 and §2.2 here (dangfavre2021 footnote 4, lines 452–453; fulton1998 Theorem 1.4 and Proposition 2.5 for proper pushforward of cycles and the first Chern class operation with its projection formula, cited by locator).
- *Pullback of cycles with real coefficients.* For a proper `K`-scheme `T` put `CH_*(T)_ℝ = CH_*(T) ⊗_ℤ ℝ`. Since `c_1(L ⊗ M) ∩ α = c_1(L) ∩ α + c_1(M) ∩ α` (SchemeAndStackFoundations §5.3), `L ↦ c_1(L) ∩ −` is a homomorphism from `Pic(T)` to the endomorphisms of `CH_*(T)`; it extends `ℝ`-linearly to an action of `Pic(T) ⊗ ℝ` on `CH_*(T)_ℝ`, and proper pushforward and the degree of zero-cycles extend `ℝ`-linearly. For real classes `M_j` on `Y` define `f^*(M_1 ⋯ M_k) ∈ CH_{d−k}(X)_ℝ` by the same formula, on `T = Γ_f` and pushed forward to `X`. It is multilinear and symmetric, and for line bundles it is the image of the integral cycle. For real classes `L_i` and `M_j` the degree formula holds with the extended degree on `CH_0(X)_ℝ`: expand both sides multilinearly, and apply the integral formula, with commutativity of first Chern classes, to each term. The integral Chow group cannot carry it, since a zero-cycle with integer coefficients has integer degree while `deg(f; L | M)` can be irrational.
- The mixed degree is multilinear in the `L_i` and the `M_j`, and symmetric within each group.

*Needs:* §§1.2, 2.2, 2.3; CyclotomicClassGroupsAndStickelberger §4.3; SchemeAndStackFoundations §§5.2–5.3.

**Checks.**

- `deg_k(id_X; L, M) = (L^{d−k} · M^k)_X`, since `Γ_{id}` is the diagonal.
- Coefficients of the cycle pullback: for `X = Y = ℙ¹`, `f = id`, `k = 1` and `M = O(1)`, `f^*(M)` is the class of a point, of degree `1`. For the real class `M = √2·O(1)` it is `√2·[point] ∈ CH_0(ℙ¹)_ℝ`, of degree `√2 = deg_1(id; −, M)`; no element of `CH_0(ℙ¹) ≅ ℤ` has that degree. For `M = 0` it is `0`.
- Direction of the cycle pullback: for `f(z) = z²` on `ℙ¹`, `k = 1` and `M = O(1)`, `π_2^*M = O(2)` on `Γ_f ≅ ℙ¹`, so `f^*(M) = 2·[point]`, of degree `2 = deg_{1,H}(f) = e(f)·(M)` (§4.2). The reversed operator `π_{2*}(c_1(π_1^*M) ∩ [Γ_f])`, the pushforward of a rational point, gives `[point]`, of degree `1`.
- For `f(z) = z²` on `ℙ¹` and `H = O(1)`: `deg_{0,H} = 1` and `deg_{1,H} = 2`. The model `Γ' = ℙ¹` with `q_1 = id` and `q_2 = f` gives the same values with `e = 1`. The model `q_1 = f`, `q_2 = f ∘ f` gives `(f^*H) = 2 = 2·1` for `k = 0`, so `e = 2` multiplies.
- For the Cremona involution of `ℙ²`, the product formula computes `deg_{1,H}(σ)` as `(pr_1^*H · pr_2^*H · Γ_σ) = 2`, where `Γ_σ` is the blow-up at three points.

### 4.2 Values, integrality and positivity

Let `f : X ⤏ Y` and `L`, `M` be line bundles or real classes. Prove:

- `deg_0(f; L, M) = (L^d)_X` and `deg_d(f; L, M) = e(f)·(M^d)_Y`.
- If `f` is a morphism, `deg_k(f; L, M) = (L^{d−k} · (f^*M)^k)_X`. If `X = Y`, `ω` is a line bundle with `(ω^d) ≠ 0`, and `f^*ω ≅ qω` for an integer `q ≥ 1`, then `deg_{k,ω}(f) = q^k(ω^d)` and `e(f) = q^d`.
- `deg_k(f; L, M)` is an integer when `L` and `M` are line bundles.
- If `L` and `M` are nef, then `deg_k(f; L, M) ≥ 0`. It is monotone: if `L`, `M`, `L' − L` and `M' − M` are nef real classes, then `deg_k(f; L, M) ≤ deg_k(f; L', M')`.
- *Positivity.* If `L` and `M` are big and nef, or real polarizations, then `deg_k(f; L, M) > 0` for every `0 ≤ k ≤ d`.

The boundary values, for real classes `L` and `M`, are the acceptance statement `mixedDegree_boundary`, and positivity for real polarizations is `mixedDegree_pos`.

`deg_0` uses that `π_1` is birational; `deg_d` that `π_2` is an alteration of generic degree `e(f)`; the polarized case compares `deg_d` with `e(f)(ω^d)`. Positivity applies §3.6 on `Γ_f` to the nef classes `π_1^*L` and `π_2^*M`, whose top powers are `(L^d) > 0` and `e(f)(M^d) > 0` (§3.1). Nonnegativity is §3.2 on `Γ_f`. For monotonicity write `L' = L + P` and `M' = M + Q` and expand multilinearly: every term is a mixed degree of the nef classes `L, P, M, Q`, nonnegative by §3.2, and one term is `deg_k(f; L, M)` (dangfavre2021 footnote 5, line 454, for integrality; russakovskiishiffman1997 lines 506–511 for `δ_n` as the topological degree and `δ_ℓ = (deg P)^ℓ` for morphisms).

*Needs:* §§1.1, 1.2, 2.3, 3.1, 3.2, 3.6, 4.1.

**Checks.**

- The Cremona involution of `ℙ²` has `(deg_{0,H}, deg_{1,H}, deg_{2,H}) = (1, 2, 1)`.
- The Frobenius `F` of `ℙ^d` in characteristic `p` has `F^*H ≅ pH`, so `deg_{k,H}(F) = p^k` and `e(F) = p^d`.
- Non-example: on `ℙ¹ × ℙ¹` with `f = id` and the nef, not big `ω = O(1,0)`, `deg_{1,ω}(id) = (ω²) = 0`. Bigness is needed for positivity.
- The real polarization `ω = O(1,0) + O(0,1)` on `ℙ¹ × ℙ¹`, neither summand big, has `deg_{1,ω}(id) = (ω²) = 2 > 0`.
- Non-example for monotonicity: on `ℙ¹ × ℙ¹` with `f = id`, `k = 1`, `L = M = O(1,1)` and the nef `L' = M' = 1.5·O(1,0) + 0.5·O(0,1)`, the degree drops from `2` to `2·1.5·0.5 = 1.5`. Here `L' − L = 0.5·O(1,0) − 0.5·O(0,1)` has degree `−0.5` on a ruling and is not nef.
- Monotonicity with a nef real class that is no positive combination of nef line bundles: on `E × E` with the class `A` and `I = F_1 + F_2` of the §3.1 Checks, `deg_1(id; A, A) = (A²) = 0 ≤ deg_1(id; A, A + I) = 3 ≤ deg_1(id; A + I, A + I) = 8`.

### 4.3 Invariance under normalization and extension of the field

- *Normalization.* For `ν : X̃ → X` the normalization and `f̃ = ν^{−1} ∘ f ∘ ν` (§1.4), `deg_k(f̃; ν^*L, ν^*M) = deg_k(f; L, M)`. This is model independence through the birational `Γ_{f̃} → Γ_f`. If `L` is ample, big and nef, or a real polarization, so is `ν^*L`.
- *Extension of the field.* For every field extension `K'/K`, `deg_k(f; L, M)` equals `(pr_1^*L_{K'}^{d−k} · pr_2^*M_{K'}^k · (Γ_f)_{K'})` computed over `K'` on the base-changed graph with its fundamental cycle. If `X` and `Y` are geometrically integral, it equals `deg_k(f_{K'}; L_{K'}, M_{K'})`. Both equalities are proved here, from §1.4 and the field-extension compatibility of CyclotomicClassGroupsAndStickelberger §4.3. dang2020 lines 18–20 and truong2020 §6.3, lines 1529–1533, pass to an algebraic closure by convention. The first equality holds term by term: each numerical intersection on `Γ_f` is a signed sum of dimensions `dim_K H^i(Γ_f, N)` for line bundles `N`, and Tau Ceti's `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback`, applied to the quasi-compact separated `Γ_f`, gives `dim_{K'} H^i((Γ_f)_{K'}, N_{K'}) = dim_K H^i(Γ_f, N)`; real classes `L` and `M` follow by multilinearity (§2.3).

*Needs:* §§1.4, 2.1, 2.3, 3.1, 4.1; CyclotomicClassGroupsAndStickelberger §4.3 (field extension); Tau Ceti `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback`; Mathlib `AlgebraicGeometry.GeometricallyIntegral`.

**Checks.**

- `X = ℙ¹_ℂ` over `ℝ`, `f = id`, `ω = O(1)`: `deg_{1,ω} = 2` over `ℝ`. The base change of `Γ_{id}` is two diagonals over `ℂ`, each contributing `1`.
- The cuspidal cubic `X = V(y²z − x³)` with `ω = O(1)|_X` has `ν^*ω = O(3)` on `ℙ¹`. For `f = id`, `deg_0 = 3` on both sides.
- The Cremona involution over `ℚ` and over `ℂ` both have degrees `(1, 2, 1)`.

### 4.4 Sub-multiplicativity

Let `f_1 : X_1 ⤏ X_2` and `f_2 : X_2 ⤏ X_3` be dominant, `0 ≤ k ≤ d`, and `L_j` nef line bundles or nef real classes on `X_j`. Prove

```text
(L_2^d)·deg_k(f_2 ∘ f_1; L_1, L_3) ≤ (d − k + 1)^k·deg_k(f_1; L_1, L_2)·deg_k(f_2; L_2, L_3).
```

No positivity of `L_2` is assumed: §3.6 needs none of `B`, and the route divides only by `e(f_1)`. This multiplied form is the acceptance statement `mixedDegree_comp_le`, in which `f_2 ∘ f_1` is Mathlib's `f₁.comp f₂`. When `L_2` is big and nef or a real polarization, `(L_2^d) > 0` and it reads `deg_k(f_2 ∘ f_1; L_1, L_3) ≤ ((d − k + 1)^k/(L_2^d))·deg_k(f_1; L_1, L_2)·deg_k(f_2; L_2, L_3)`. For a self-map and a polarization `ω` this gives `deg_{k,ω}(g ∘ f) ≤ C_k(ω)·deg_{k,ω}(f)·deg_{k,ω}(g)` with `C_k(ω) = (d − k + 1)^k/(ω^d)`. No normality is assumed (dang2020 Theorem 1 (i), lines 27–30, and Theorem 5.2.1 with its proof, lines 1271–1358, for normal varieties over an algebraically closed field; dangfavre2021 Theorem 1.3, lines 448–451; truong2020 Lemma 4.5, lines 999–1003, with an unspecified constant, for correspondences between smooth projective varieties over an algebraically closed field of characteristic zero, the standing hypothesis of its §4 (line 763), and the proof of Theorem 5.3, lines 1104–1106, for the iterates of one correspondence of a smooth projective variety over any algebraically closed field; dinhsibony2005 Proposition 6, lines 245–247, over `ℂ`; silverman2014 (3), line 387, for `k = 1` on `ℙ^N`).

*Route.* Let `W = W_{f_1,f_2}` (§1.3). Apply §3.6 on `W` with `i = k`, `B = q_2^*L_2`, `A_j = q_3^*L_3` and `C_j = q_1^*L_1`; here `(B^d) = e(f_1)(L_2^d)`, by the projection formula along `q_2`, of generic degree `e(f_1)`. By model independence:

- `(A^k C^{d−k}) = deg_k(f_2 ∘ f_1; L_1, L_3)`;
- `(A^k B^{d−k}) = e(f_1)·deg_k(f_2; L_2, L_3)`;
- `(B^k C^{d−k}) = deg_k(f_1; L_1, L_2)`.

Divide by `e(f_1)`, a positive integer because `dim X_1 = dim X_2` (§1.1, finiteness). For `k = 0` and `k = d` the inequality is an equality, by §4.2 and multiplicativity of `e`.

*Needs:* §§1.1, 1.3, 3.1, 3.6, 4.1, 4.2.

**Checks.**

- `f_1 = f_2 = (z ↦ z²)` on `ℙ¹`, `d = k = 1`: `4 ≤ (1/1)·2·2 = 4`, equality.
- Cremona on `ℙ²`, `k = 1`: `deg_{1,H}(σ ∘ σ) = 1 ≤ (2/1)·2·2 = 8`.
- Morphisms of degrees `a, b` on `ℙ^d`: `(ab)^k ≤ (d − k + 1)^k a^k b^k`.
- `k = d` with `f_1 = Frobenius` and `f_2 = (z ↦ z²)` on `ℙ¹` in characteristic `p`: `2p = (1/1)·p·2`, equality.
- Nef real inputs outside the positive combinations of nef line bundles: on `E × E` with `f_1 = f_2 = id`, `k = 1`, `L_1 = L_3 = A` and `L_2 = I = F_1 + F_2` (§3.1, Checks), the left side is `(A²) = 0` and the right side `(2/(I²))·(A · I)·(I · A) = (2/2)·3·3 = 9`.
- Degenerate `L_2`: on `ℙ¹ × ℙ¹` with `f_1 = f_2 = id`, `k = 1`, the nef, not big `L_2 = O(1,0)` and `L_1 = L_3 = O(0,1)`, the multiplied form reads `(L_2²)·(L_1 · L_3) = 0·0 = 0 ≤ 2·(L_1 · L_2)·(L_2 · L_3) = 2·1·1 = 2`, while the divided form has the denominator `(L_2²) = 0`. With `L_3 = O(1,0)` instead, both sides of the multiplied form are `0·1 = 0` and `2·1·0 = 0`.

### 4.5 Comparison of polarizations and birational conjugacy

- *Comparison.* Let `ω, ω'` be real polarizations on `X` and `0 ≤ k ≤ d`. There is `C ≥ 1` with `C^{−1}·deg_{k,ω}(f) ≤ deg_{k,ω'}(f) ≤ C·deg_{k,ω}(f)` for every dominant `f : X ⤏ X`. One may take `C = (d − k + 1)^{2k}·max(c(ω, ω'), c(ω', ω))` with `c(ω, ω') = (ω'^{d−k}ω^k)·(ω^{d−k}ω'^k)/(ω^d)²`; it depends on `ω`, `ω'`, `d` and `k`, not on `f`. This is the acceptance statement `exists_mixedDegree_comparison`.
- *Birational conjugacy.* Let `φ : X ⤏ Y` be birational and `ω_X`, `ω_Y` real polarizations. There is `C ≥ 1` with `C^{−1}·deg_{k,ω_X}(f) ≤ deg_{k,ω_Y}(φ ∘ f ∘ φ^{−1}) ≤ C·deg_{k,ω_X}(f)` for all dominant `f : X ⤏ X`. Moreover `(φ ∘ f ∘ φ^{−1})^n = φ ∘ f^n ∘ φ^{−1}`, using §1.1 to show `φ^{−1} ∘ φ = id`. With `φ` given by a partial isomorphism over `K`, the comparison is the acceptance statement `exists_mixedDegree_birational_comparison`.

*Route.* §4.4 applied twice, once on each side, with the identity or `φ^{±1}` as the outer maps; it applies to real polarizations, which are nef real classes with positive top power. For the comparison, write `f = id ∘ f ∘ id` with the polarizations `ω'`, `ω`, `ω`, `ω'` on the four copies of `X`. This gives `deg_{k,ω'}(f) ≤ C_1·deg_{k,ω}(f)` with `C_1 = (d − k + 1)^{2k}·c(ω, ω')`, and exchanging `ω` and `ω'` gives `deg_{k,ω}(f) ≤ C_2·deg_{k,ω'}(f)` with `C_2 = (d − k + 1)^{2k}·c(ω', ω)`. For `f = id` these read `(ω'^d) ≤ C_1(ω^d)` and `(ω^d) ≤ C_2(ω'^d)`, so `C_1C_2 ≥ 1` and `C = max(C_1, C_2) ≥ 1`. The constants `deg_k(id; ω', ω) = (ω'^{d−k}ω^k)` are positive by §4.2 (dang2020 Theorem 1 (ii), lines 31–41, with the remark after it, lines 35–41, for birational conjugacy; dangfavre2021 Theorem 1.3, second item, lines 457–460, for the comparison; the estimate in the proof of dinhsibony2005 Corollaire 7, lines 260–263, for conjugacy by a birational self-map over `ℂ`).

*Needs:* §§1.1, 2.3, 4.2, 4.4; Mathlib `Scheme.PartialIso.symm`, `Scheme.RationalMap.comp_assoc`.

**Checks.**

- On `ℙ¹ × ℙ¹` with the swap `τ(x, y) = (y, x)`: `deg_{1,O(1,1)}(τ) = (O(1,1)·O(1,1)) = 2` and `deg_{1,O(2,1)}(τ) = (O(2,1)·O(1,2)) = 5`. With `ω = O(1,1)` and `ω' = O(2,1)`: `(ω·ω') = 3`, `(ω²) = 2`, `(ω'²) = 4`. So `c(ω, ω') = 9/4` and `c(ω', ω) = 9/16`, and `C = 2²·9/4 = 9`. The ratio `5/2` lies in `[1/9, 9]`.
- For `d = 1`, `deg_{1,ω}(f) = e(f)·(ω)` exactly, and conjugacy by an automorphism of `ℙ¹` preserves `e`.
- Conjugating the Cremona involution of `ℙ²` by a linear automorphism leaves `deg_{1,H} = 2`.
- Real polarizations on `E × E` (§3.1, Checks): `ω = F_1 + F_2` and `ω' = A + F_1 + F_2`, of squares `2` and `8` and product `5`, give `c(ω, ω') = 25/4`, `c(ω', ω) = 25/64` and `C = 25`. The swap `τ` of the factors exchanges `F_1` and `F_2` and fixes `Δ`; `deg_{1,ω}(τ) = 2` and `deg_{1,ω'}(τ) = (ω'·τ^*ω') = 2·2 + 3·3 − 2·√2·√2 = 9`, within the factor `25` of each other.

### Examples

`z ↦ z²` and Frobenius on `ℙ¹`; the Cremona involution of `ℙ²` with degrees `(1, 2, 1)`; the swap of `ℙ¹ × ℙ¹` for the comparison of polarizations; base change of `ℙ¹_ℂ` over `ℝ`; the cuspidal cubic for normalization.

### Dependencies

Layers 1–3; CyclotomicClassGroupsAndStickelberger §4.3; SchemeAndStackFoundations §§5.2–5.3; Mathlib `AlgebraicGeometry.GeometricallyIntegral` (§4.3), `Scheme.PartialIso.symm`, `Scheme.RationalMap.comp_assoc`; Tau Ceti `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback` (§4.3).

## Layer 5: Dynamical degrees and algebraic entropy

Throughout, `X` is a projective variety of dimension `d ≥ 0`, `f : X ⤏ X` is a dominant `K`-rational map, and `ω` is a real polarization.

### 5.1 Existence

Define `dynamicalDegree K d k f ω` as the limit of `deg_{k,ω}(f^n)^{1/n}` along `n → ∞` in the sense of Mathlib's `Filter.limUnder`, for every real class `ω`; it is `λ_k(f)`. For `0 ≤ k ≤ d` and a real polarization `ω`, prove that the sequence converges, so that `λ_k(f)` is a genuine limit. Prove that it equals `inf_{n ≥ 1} (C_k(ω)·deg_{k,ω}(f^n))^{1/n}` with `C_k(ω) = (d − k + 1)^k/(ω^d)` (dangfavre2021 lines 461–463; dang2020 lines 42–46; dinhsibony2005 Corollaire 7, lines 256–259, for convergence over `ℂ`, its infimum being written without the constant that the Checks below show is needed; silverman2014 Proposition 7, lines 383–413; truong2020 Theorem 1.1 (1), lines 143–158, for smooth `X` over an algebraically closed field and the class of a hyperplane section).

*Route.* Put `v_n = C_k(ω)·deg_{k,ω}(f^n)`. Then `v_n ≥ 0`, since `ω` is nef and `(ω^d) > 0` (§4.2). For `m, n ≥ 1`, §4.4 with `f_1 = f^n`, `f_2 = f^m` and `L_1 = L_2 = L_3 = ω`, multiplied by `(d − k + 1)^k/(ω^d)²`, gives `v_{m+n} ≤ v_m·v_n`, using `f^{m+n} = f^m ∘ f^n` (Mathlib's `Scheme.RationalMap.comp_assoc`). For `m = 0` or `n = 0` the inequality holds because `f^0 = id` has `deg_{k,ω}(id) = (ω^d)` (§4.2), so `v_0 = (d − k + 1)^k ≥ 1`. Mathlib's `Submultiplicative.tendsto_lim`, which asks only `v_n ≥ 0`, gives `v_n^{1/n} → Submultiplicative.lim`, the infimum of `v_n^{1/n}` over `n ≥ 1`. Since `C_k(ω) > 0` and `C_k(ω)^{1/n} → 1`, the limit is also `lim deg_{k,ω}(f^n)^{1/n}`. Convergence and the infimum formula, with the infimum over `n ≥ 1` written over Mathlib's positive naturals `ℕ+`, are the acceptance statement `tendsto_dynamicalDegree`.

*Needs:* §§4.2, 4.4; Mathlib `Filter.limUnder`, `Submultiplicative`, `Submultiplicative.lim`, `Submultiplicative.tendsto_lim`, `Scheme.RationalMap.comp`, `Scheme.RationalMap.comp_assoc`.

**Checks.**

- A morphism `f` of `ℙ^d` of degree `a` has `deg_{k,H}(f^n) = a^{nk}`, so `λ_k = a^k`. For `1 ≤ k ≤ d − 1` the infimum `inf_n ((d − k + 1)^k a^{nk})^{1/n} = a^k` is approached as `n → ∞` and not attained at `n = 1`, where the value is `(d − k + 1)^k a^k > a^k`. For `k = 0` and `k = d` the constant `(d − k + 1)^k` is `1`, the sequence is constantly `1` or `a^d`, and the infimum is attained at `n = 1`.
- The constant `C_k(ω)` is needed in the infimum formula: on `ℙ^d`, `d ≥ 1`, take the real polarization `ω = (1/2)·H` and `f = id`. Then `deg_{k,ω}(f^n) = (ω^d) = 2^{−d}` for every `n` and `λ_k = lim (2^{−d})^{1/n} = 1`, while the infimum without the constant is `inf_{n ≥ 1} (2^{−d})^{1/n} = 2^{−d} < 1`, attained at `n = 1`. With `C_k(ω) = (d − k + 1)^k·2^d` the terms are `((d − k + 1)^k)^{1/n}`, of infimum `1`: attained for `k = 0` and `k = d`, where `(d − k + 1)^k = 1`, and approached as `n → ∞` for `1 ≤ k ≤ d − 1`.
- For the Cremona involution of `ℙ²`, `deg_{1,H}(σ^n)` is `2` for odd `n` and `1` for even `n`, so `λ_1(σ) = 1`.
- Dimension `0`: `X = Spec L` for a finite extension `L/K`, every dominant `K`-rational self-map is a `K`-automorphism `σ` of `L`, `Γ_σ ≅ Spec L` and the only degree is `deg_{0,ω}(σ^n) = χ_K(O_{Spec L}) = [L : K]` for every real class `ω`, which is therefore a real polarization (no curves, `(ω^0) = [L : K] > 0`). Then `C_0(ω) = 1/[L : K]`, `(C_0(ω)·[L : K])^{1/n} = 1` for every `n`, `[L : K]^{1/n} → 1` and `λ_0(σ) = 1 = e(σ)`. Counting the point instead of taking `χ_K` would give `deg_{0,ω}(σ) = 1`, against `deg_0 = (ω^0)_X = [L : K]` of §4.2.
- For the Fibonacci map of §6.3, `fib(n + 2)^{1/n} → Real.goldenRatio`.

### 5.2 Properties

Prove:

- `λ_k(f) ∈ [1, ∞)`. For an ample line bundle `ω`, which exists because `X` is projective, every `deg_{k,ω}(f^n)` is a positive integer (§4.2), so its `n`-th root is at least `1`; the next item carries the bound to every real polarization.
- `λ_k(f)` does not depend on the real polarization `ω`, by §4.5.
- `λ_k(f^m) = λ_k(f)^m` for `m ≥ 1`, along the subsequence `n·m`; for `m = 0` both sides are `1`, since `f^0 = id` has `deg_{k,ω}(id) = (ω^d) > 0` (§4.2).
- `λ_0(f) = 1` and `λ_d(f) = e(f)`, by §4.2 and multiplicativity of `e`: `deg_{d,ω}(f^n) = e(f)^n·(ω^d)`.
- *Log-concavity.* `λ_k(f)² ≥ λ_{k−1}(f)·λ_{k+1}(f)` for `1 ≤ k ≤ d − 1`. This is §3.5 on `Γ_{f^n}` with `A = π_2^*ω` and `B = π_1^*ω`, followed by `n`-th roots.
- As a consequence of log-concavity and `λ_0 = 1`, `λ_k(f) ≤ λ_1(f)^k`.

The first five items are the acceptance statements `one_le_dynamicalDegree`, `dynamicalDegree_eq_of_polarizations`, `dynamicalDegree_iterate` (for every `m ≥ 0`, with `f^m` written `iterate f m`), `dynamicalDegree_zero_and_top` and `dynamicalDegree_log_concave`.

(dang2020 lines 42–46; dangfavre2021 lines 464–467; guedj2010 lines 1136–1140 and Théorème 2.4 (a), line 1180; dinhsibony2005 lines 69–70.)

*Needs:* §§1.1, 3.5, 4.2, 4.5, 5.1.

**Checks.**

- The Fibonacci map has `(λ_0, λ_1, λ_2) = (1, Real.goldenRatio, 1)` with `Real.goldenRatio² = Real.goldenRatio + 1 ≈ 2.618 ≥ 1`.
- The Frobenius of `ℙ^d` has `λ_k = p^k`, so log-concavity is an equality and `λ_d = p^d = e`. A separable-degree convention for `λ_d` would give `1`, contradicting `deg_{d,H}(F^n) = p^{nd}`.
- The Cremona involution has `λ_k = 1` for all `k`. The squaring map of `ℙ¹` has `(λ_0, λ_1) = (1, 2)`.

### 5.3 Invariance

Prove:

- *Birational conjugacy.* `λ_k(φ ∘ f ∘ φ^{−1}) = λ_k(f)` for every birational `φ : X ⤏ Y` to a projective variety `Y`, by §4.5.
- *Normalization.* `λ_k(f̃) = λ_k(f)` for the normalization lift `f̃` of §1.4. This is the previous item for the inverse of `ν`, a partial isomorphism over the dense open normal locus of `X`.
- *Extension of the field.* If `X` is geometrically integral, `λ_k(f_{K'}) = λ_k(f)` for every field extension `K'/K`. In general `λ_k(f)` is computed by the numbers of §4.3 on the base-changed graphs `(Γ_{f^n})_{K'}`.

Birational conjugacy, with `φ` a partial isomorphism over `K` and the conjugate written `φ.symm.toRationalMap.comp (f.comp φ.toRationalMap)`, is the acceptance statement `dynamicalDegree_birational_conj`. Invariance under extension of the field, for geometrically integral `X`, with `f_{K'}` given by its characterization in §1.4 and the class on `X_{K'}` the pullback of `ω`, is the acceptance statement `dynamicalDegree_baseChange`. The pullback of `ω` is again a real polarization: it is nef by AlgebraicModuliForArithmeticGeometryPartII §1.5, and its top power is `(ω^d)` by the field-extension compatibility of CyclotomicClassGroupsAndStickelberger §4.3. The route applies §4.3 to every iterate, using `(f^n)_{K'} = (f_{K'})^n` (§1.4).

(dang2020 lines 35–46; truong2020 Theorem 1.1 (2), lines 159–164, for birational invariance; truong2020 §6.3, lines 1529–1533, which defines the degrees over a field that is not algebraically closed through the lift to an algebraic closure, so that invariance under extension of the field is proved here from §4.3; dinhsibony2005 Corollaire 7, lines 256–263; dangfavre2021 lines 83–84, for invariance under birational conjugacy.)

*Needs:* §§1.4, 4.3, 4.5, 5.1; Mathlib `AlgebraicGeometry.GeometricallyIntegral`; for extension of the field, AlgebraicModuliForArithmeticGeometryPartII §1.5 and CyclotomicClassGroupsAndStickelberger §4.3.

**Checks.**

- Conjugating the Cremona involution by a linear automorphism of `ℙ²` gives `λ_1 = 1`.
- For the cuspidal cubic and `f = id`, `λ_k = 1` on `X` and on `ℙ¹`.
- For `ℙ¹_ℂ` over `ℝ` and the identity, `λ_1 = 1` over `ℝ` and over `ℂ`.
- The Fibonacci map of §6.3 over `ℚ`, on the geometrically integral `ℙ²_ℚ`, has base change to `ℂ` given by the same forms, so `deg_{1,H}(f^n) = fib(n + 2)` over both fields and `λ_1 = Real.goldenRatio` on both sides.

### 5.4 Algebraic entropy

Define `h_alg(f) = log max_{0 ≤ k ≤ d} λ_k(f)`, in `Suggested.lean` `algebraicEntropy K d f ω`. Prove:

- `h_alg(f) ≥ 0`.
- `h_alg` is invariant under birational conjugacy and normalization, and under extension of the field when `X` is geometrically integral.
- `h_alg(f^n) = n·h_alg(f)`.
- `log e(f) ≤ h_alg(f) ≤ d·log λ_1(f)`.
- By log-concavity, the indices `k` where the maximum is attained form an interval.

The third item, for every `n ≥ 0`, is the acceptance statement `algebraicEntropy_iterate`, and the fourth, which contains the first because `e(f) ≥ 1`, is `algebraicEntropy_bounds`. Invariance under extension of the field and under birational conjugacy, in the second item, follows term by term over `0 ≤ k ≤ d` from `dynamicalDegree_baseChange`, with `f_{K'}` given by its characterization in §1.4, and from `dynamicalDegree_birational_conj`.

(dinhsibony2005 Théorème 1, lines 33–37, where `lov(f) = max log λ_l` bounds the topological entropy over `ℂ`; guedj2010 Théorème 2.4, lines 1178–1181.)

*Needs:* §§5.2, 5.3; Mathlib `AlgebraicGeometry.GeometricallyIntegral`.

**Checks.**

- A morphism of `ℙ^d` of degree `a ≥ 1` has `h_alg = d·log a`, attained at `k = d`.
- The Cremona involution has `h_alg = 0`.
- The Fibonacci map has `h_alg = log Real.goldenRatio ≈ 0.4812`, attained at `k = 1` only.
- The Frobenius of `ℙ^d` has `h_alg = d·log p`.
- Extension of the field: the Frobenius `F = [x_0^p : ⋯ : x_d^p]` of `ℙ^d_{𝔽_p}` has base change to `𝔽_p(t)` given by the same forms, an `𝔽_p(t)`-morphism with `e = p^d` and `h_alg = d·log p`, as over `𝔽_p`. The absolute Frobenius of `ℙ^d_{𝔽_p(t)}` also satisfies `π ∘ Φ = F ∘ π`, since the absolute Frobenius commutes with every morphism and is `F` on `ℙ^d_{𝔽_p}`; but it sends `t` to `t^p` and is not over `𝔽_p(t)`, so the characterization of §1.4 excludes it.

### Examples

Morphisms of projective space, the Cremona involution, the Fibonacci map, Frobenius, and the squaring map of `ℙ¹`, with their dynamical degrees and entropies as in the Checks.

### Dependencies

Layers 1, 3 and 4; AlgebraicModuliForArithmeticGeometryPartII §1.5 and CyclotomicClassGroupsAndStickelberger §4.3 (extension of the field); Mathlib `Filter.limUnder`, `Submultiplicative` and its lemmas, `Scheme.RationalMap.comp`, `Scheme.RationalMap.comp_assoc` (§5.1) and `AlgebraicGeometry.GeometricallyIntegral` (§§5.3–5.4).

## Layer 6: Projective space and affine space

Throughout, `d ≥ 1`. On `ℙ⁰ = Spec K` the identity has the reduced form `(1)`, of degree `0` (§6.1, Checks).

### 6.1 Rational self-maps of projective space given by forms

Prove:

- *Forms define rational maps.* For forms `F_0, …, F_d ∈ K[x_0, …, x_d]` of a common degree `a ≥ 0`, not all zero, there is a unique `K`-rational map `[F_0 : ⋯ : F_d] : ℙ^d ⤏ ℙ^d` whose restriction to the complement of `V(F_0, …, F_d)` is the morphism given by the line bundle `O(a)` and its generating sections (stacks-constructions Lemma 13.1, tag 01NE, line 1267).
- *Every rational map is given by reduced forms.* Every `K`-rational map `f : ℙ^d ⤏ ℙ^d` is `[F_0 : ⋯ : F_d]` for forms without common factor, unique up to a common nonzero scalar. Their common degree is the *degree* `deg f`. The domain of `f` is exactly the complement of `V(F_0, …, F_d)`, which has codimension `≥ 2`.
- *Composition.* Let `f = [F]` be dominant and `g = [G]` any rational map, both by reduced forms. The tuple `G(F) = (G_0(F), …, G_d(F))` is not identically zero: otherwise the image of `f` would lie in the proper closed subset `V(G_0, …, G_d)`, against dominance. Then `g ∘ f = [G(F)/h]` with `h = gcd_i G_i(F)`, so `deg(g ∘ f) ≤ deg f·deg g`. Equality holds if `g` is a morphism, or if `f` is a morphism.
- *Iterates of morphisms.* If `V(F_0, …, F_d) = ∅`, the domain of `f = [F]` is `ℙ^d` by the item on reduced forms, and `f` is the rational map of the morphism `Scheme.RationalMap.toHom f` (Tau Ceti's `AlgebraicGeometry.Scheme.RationalMap.toHom` and `AlgebraicGeometry.Scheme.RationalMap.toRationalMap_toHom`). Conversely the rational map of a morphism has domain `ℙ^d`. So a rational map of `ℙ^d` is the rational map of a morphism exactly when its reduced forms have no common zero. Such a morphism `f = [F]` of degree `a ≥ 1` is finite and surjective, hence dominant, and its iterates in the sense of the Conventions are morphisms of degree `a^n` (silverman2014 lines 350–354, for `n ≥ 1`); they agree with its iterates as a morphism. A morphism of degree `0` is constant, not dominant, and outside the composition of rational maps. Its iterates are taken in the composition of morphisms, equivalently with Mathlib's `Scheme.RationalMap.compHom`: `f^0 = id` and `f^n = f` for `n ≥ 1`. So `deg(f^n) = (deg f)^n` for every morphism `f` and every `n ≥ 0`, with `0^0 = 1`.

*Route.* For the first item: on the affine chart `D_+(F_i) ⊆ ℙ^d`, for `F_i ≠ 0`, Mathlib's `AlgebraicGeometry.Proj.fromOfGlobalSections` applied to the ring map `y_j ↦ F_j/F_i` from `K[y_0, …, y_d]` to the degree-zero functions on `D_+(F_i)` gives a morphism to `ℙ^d`, since the irrelevant ideal is sent to an ideal containing `F_i/F_i = 1`. On `D_+(F_i) ∩ D_+(F_k)` the coordinate map `y_j ↦ F_j/F_k` of the chart of `F_k` is that of `F_i` multiplied on forms of degree `n` by `(F_i/F_k)^n`, a power of a unit there. So after restriction to the overlap (Tau Ceti's `AlgebraicGeometry.Proj.fromOfGlobalSections_naturality`) the two morphisms agree by Tau Ceti's `TauCeti.ProjectiveSpectrum.fromOfGlobalSections_eq_of_unit_rescaling`, and they glue on the complement of `V(F_0, …, F_d)`, a dense open of the irreducible `ℙ^d`. For the second: Mathlib's `Scheme.RationalMap.equivFunctionFieldOver` identifies rational maps with `K(ℙ^d)`-points of `ℙ^d_K`. Over a field these are `(K(ℙ^d)^{d+1} ∖ 0)/K(ℙ^d)^×` by stacks-constructions Lemma 13.1. Clearing denominators and dividing by the greatest common divisor (`MvPolynomial` is a unique factorization domain) gives reduced forms (silverman2014 lines 43–45, for maps given by forms of one degree without common factor; guedj2010 Exemple 2.2, lines 1145–1147; russakovskiishiffman1997 line 510). A codimension-one component of `V(F)` would give a common factor. For equality in the composition: if `g` is a morphism, some power `x_j^N` lies in the ideal `(G_0, …, G_d)` for every `j`, so a common prime factor of the `G_i(F)` divides every `F_j^N`, hence every `F_j`, which is excluded. If `f` is a morphism of degree `a ≥ 1`, then `K[x_0, …, x_d]` is finite over `K[F_0, …, F_d]`, so `f` is finite; a common prime factor `p` of the `G_i(F)` would make `f` map the hypersurface `V(p)` into `V(G)`, of codimension `≥ 2`, which a finite map cannot do.

*Needs:* Mathlib `AlgebraicGeometry.Proj`, `AlgebraicGeometry.Proj.fromOfGlobalSections`, `MvPolynomial.homogeneousSubmodule`, `MvPolynomial.gradedAlgebra`, `MvPolynomial.uniqueFactorizationMonoid`, `Scheme.RationalMap.equivFunctionFieldOver`, `Scheme.RationalMap.comp`, `Scheme.RationalMap.IsDominant`, `Scheme.RationalMap.compHom`, `AlgebraicGeometry.IsFinite`; Tau Ceti `AlgebraicGeometry.Scheme.RationalMap.toHom`, `AlgebraicGeometry.Scheme.RationalMap.toRationalMap_toHom`, `TauCeti.ProjectiveSpectrum.fromOfGlobalSections_eq_of_unit_rescaling`, `AlgebraicGeometry.Proj.fromOfGlobalSections_naturality`; SchemeAndStackFoundations §0.3; StableReduction Layer 2.

**Checks.**

- For `d = 1` the reduced forms are the coprime binary forms of ArithmeticDynamics §0.18, and the scheme maps agree with §0.26 there.
- The Cremona forms `(x_1x_2, x_0x_2, x_0x_1)` have no common factor. Their composite with themselves is `(x_0x_1x_2)·(x_0, x_1, x_2)`, so `σ ∘ σ = id` after dividing by `h = x_0x_1x_2`.
- Overlap of the Cremona charts of `F_0 = x_1x_2` and `F_1 = x_0x_2`, on `D_+(F_0) ∩ D_+(F_1) = D_+(x_0x_1x_2)`: the chart of `F_0` sends `(y_0, y_1, y_2)` to `(1, x_0/x_1, x_0/x_2)` and that of `F_1` to `(x_1/x_0, 1, x_1/x_2)`, which is `x_1/x_0` times the first, the unit `F_0/F_1`. Its inverse `x_0/x_1` would send `y_0` to `x_0/x_1 ≠ x_1/x_0`, so the direction of the rescaling matters.
- Non-example: the forms `(x_0², x_0x_1, x_0x_2)` have common factor `x_0` and define the identity, of degree `1`, not `2`.
- Non-example for composition: the constant morphism `f = [0 : 0 : 1]`, by the forms `(0, 0, 1)` of degree `0`, followed by the Cremona involution `σ = [x_1x_2 : x_0x_2 : x_0x_1]`. Substitution gives `G(F) = (0·1, 0·1, 0·0) = (0, 0, 0)`, because `[0 : 0 : 1]` is a base point of `σ`; there is no composite rational map, as the dominance hypothesis predicts. As a morphism `f` has iterates `f^n = f` for `n ≥ 1`, of degree `0`.
- For the dominant morphism `f = [x_0² : x_1² : x_2²]` and `g = σ`, `G(F) = (x_1²x_2², x_0²x_2², x_0²x_1²)` has no common factor, so `σ ∘ f` has degree `4 = 2·2`, the equality case for a morphism `f`. For `f = g = σ` the substitution has `h = x_0x_1x_2` and degree `1 < 4`.
- Non-example for `d = 0`: `ℙ⁰ = Proj K[x_0] = Spec K`. The identity `[x_0]` has the common factor `x_0`, so its reduced form is `(1)`, of degree `0`, and it is dominant. The iterates item would fail there twice: this morphism of degree `0` is dominant, and `deg(f^0) = deg(id) = 0 ≠ 1 = 0^0`. The Frobenius `[x_0^p] = [1]` also has degree `0`, not `p`. The statements of this layer need `d ≥ 1`.

### 6.2 Degrees on projective space

Let `f = [F_0 : ⋯ : F_d]` be dominant, with forms of degree `a ≥ 1` without common factor. Prove:

- `deg_{1,H}(f) = a`;
- `deg_{k+1,H}(f) ≤ a·deg_{k,H}(f)` for `0 ≤ k ≤ d − 1`, hence `deg_{k,H}(f) ≤ a^k` for `0 ≤ k ≤ d`;
- `deg_{k,H}(f) = a^k` for all `0 ≤ k ≤ d` when `f` is a morphism;
- for a morphism, `deg_{k,H}(f^n) = a^{nk}`, `λ_k(f) = a^k` and `e(f) = a^d`;
- `λ_1(f) = lim_n (deg f^n)^{1/n}`, Silverman's first dynamical degree;
- `deg_{1,H}(g ∘ f) ≤ deg_{1,H}(f)·deg_{1,H}(g)`, the constant being `1`.

*Route.* On `Γ_f ⊆ ℙ^d × ℙ^d` put `A = π_1^*H` and `B = π_2^*H`. The relations `F_i(x)y_j = F_j(x)y_i` hold on `Γ_f`. They glue the maps `y_j ↦ F_j(x)` into a nonzero section of `aA − B`, whose zero scheme is an effective Cartier divisor `E` supported in `π_1^{−1}(V(F))`. By the Cartier restriction formula and §3.2 on `E`, `(A^{d−k−1}B^k · (aA − B)) = (A^{d−k−1}B^k · E) ≥ 0`, which gives the recursion. For `k = 0`, every component of `E` maps into `V(F)`, of dimension `≤ d − 2`. The projection formula gives `(A^{d−1} · E) = 0`, so `deg_{1,H} = a·deg_{0,H} = a`. For a morphism `E` is empty and `B = aA`. The last items follow from §6.1 (russakovskiishiffman1997 Lemma 4.4, lines 516–541, with equality if and only if `codim I_P > ℓ`, and lines 506–514; Lemma 4.6, lines 582–583, over `ℂ`; guedj2010 Exemple 2.2, lines 1141–1147; silverman2014 lines 350–357 and (3), line 387).

*Needs:* §§3.2, 4.1, 4.2, 5.1, 5.2, 6.1; CyclotomicClassGroupsAndStickelberger §4.3; Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier`, `AlgebraicGeometry.Proj.twistingSheaf`, `AlgebraicGeometry.Proj.isInvertible_twistingSheaf_of_iSup_eq_top`, `AlgebraicGeometry.Proj.lineBundleClass_twistingSheaf_eq_zpow`.

**Checks.**

- For `d = 1`, `deg_{1,H}(f)` is the degree of ArithmeticDynamics §0.18, and `λ_1(f) = deg f = e(f)`.
- The Cremona involution of `ℙ²` has `deg_{2,H} = 1 < a² = 4`. Its base locus is three points, of dimension `d − 2 = 0`; Russakovskii–Shiffman's `δ_2 = a² − 3 = 1` agrees.
- The Frobenius of `ℙ^d` is a morphism of degree `p` with `deg_{k,H} = p^k`.
- Non-example: the non-reduced forms `(x_0², x_0x_1, x_0x_2)` define the identity, with `deg_{1,H} = 1 ≠ 2`. The no-common-factor hypothesis is needed.

### 6.3 Standard examples

- *The standard Cremona involution.* For `d ≥ 2` let `σ = [Π_{j≠0} x_j : ⋯ : Π_{j≠d} x_j]`, forms of degree `d` without common factor. Then `σ ∘ σ = id`, `deg_{1,H}(σ) = d`, `deg_{1,H}(σ²) = 1 < d²`, `e(σ) = 1`, `λ_k(σ) = 1` for all `k` and `h_alg(σ) = 0`. For `d = 2` the degrees are `(1, 2, 1)` (guedj2010 Exemple 2.5, lines 1272–1282, for `d = 3`; russakovskiishiffman1997 lines 542–552 for `d = 2`; truong2020 §6.4, lines 1542–1544).
- *The Fibonacci map.* `f[x : y : z] = [yz : xy : z²]` on `ℙ²`. For `n ≥ 1`, `f^n = [x^{fib(n−1)} y^{fib(n)} z^{fib(n)} : x^{fib(n)} y^{fib(n+1)} : z^{fib(n+2)}]`, by induction on `n` through the exponent matrix `[[0, 1], [1, 1]]`. These forms have no common factor, so `deg_{1,H}(f^n) = fib(n + 2)` for `n ≥ 1`. The iterate `f^0` is the identity, of degree `1 = fib 2`, so `deg_{1,H}(f^n) = fib(n + 2)` holds for every `n ≥ 0`; the coordinate formula is not used at `n = 0`. Further, `λ_1(f) = Real.goldenRatio`, `e(f) = 1` (on `z = 1` the inverse of `(x, y) ↦ (y, xy)` is `(u, v) ↦ (v/u, u)`), `λ_2(f) = 1` and `h_alg(f) = log Real.goldenRatio` (silverman2014 Example 5, lines 358–372).
- *Frobenius.* Over a field of characteristic `p`, `F = [x_0^p : ⋯ : x_d^p]` is a morphism of degree `p` with `λ_k(F) = p^k` and `λ_d(F) = e(F) = p^d`, a purely inseparable degree.

*Needs:* §§1.1, 4.2, 5.1–5.4, 6.1, 6.2; Mathlib `Nat.fib`, `Real.goldenRatio`.

**Checks.**

- Fibonacci map, `n = 0`: `f^0 = [x : y : z]`, of degree `1 = fib 2`. Substituting `n = 0` into the coordinate formula would give, with natural subtraction, `fib(0 − 1) = fib 0 = 0` and the tuple `(1, y, z)`, of coordinate degrees `0, 1, 1`. It is not homogeneous and does not define a map on `ℙ²` (the representatives `(2, 3, 1)` and `(4, 6, 2)` of one point go to `[1 : 3 : 1]` and `[1 : 6 : 2]`), which is why the formula is stated for `n ≥ 1`.
- Fibonacci map, `n = 2`: `[xyz : xy² : z³]`, degree `3 = fib 4`. For `n = 3`: `[xy²z² : x²y³ : z⁵]`, degree `5 = fib 5`. The exponent of `x` in the first coordinate at `n = 1` is `fib 0 = 0`.
- The Cremona involution of `ℙ³` has `deg_{1,H}(σ) = 3` and `deg_{1,H}(σ²) = 1`, as in Guedj's example.
- Frobenius with `p = 2`, `d = 1`: `deg_{1,H} = 2 = e`, a purely inseparable degree.

### 6.4 Polynomial self-maps of affine space

Let `F = (F_1, …, F_d)` with `F_i ∈ K[x_1, …, x_d]`, `F : 𝔸^d → 𝔸^d` dominant (the `F_i` algebraically independent over `K`), and `a = max_i deg F_i`. Prove:

- `a ≥ 1`, and the rational map `f = [x_0^a : x_0^a F_1(x/x_0) : ⋯ : x_0^a F_d(x/x_0)]` of `ℙ^d` has forms of degree `a` without common factor. Its domain contains `𝔸^d = {x_0 ≠ 0}`, and it restricts to `F` there.
- `deg_{1,H}(f) = a` and `λ_d(f) = e(f) = [K(x_1, …, x_d) : K(F_1, …, F_d)]`.
- For `G` another dominant polynomial self-map, the extension of `F ∘ G` is the composite of the extensions, the extension of `G` applied first, so `λ_1(f) = lim_n (max_i deg (F^{∘n})_i)^{1/n}`.
- If `F` is proper, it is finite (Mathlib's `AlgebraicGeometry.IsFinite.iff_isProper_and_isAffineHom`, a morphism of affine schemes being affine) and surjective.

(dangfavre2021 lines 177–180 for the setting of Theorem 2; silverman2014 Example 6, lines 373–380.)

*Needs:* §§1.1, 5.2, 6.1, 6.2; Mathlib `AlgebraicGeometry.IsFinite.iff_isProper_and_isAffineHom`, `AlgebraicGeometry.IsAffineHom`.

**Checks.**

- `F = (x², y)` on `𝔸²`: `a = 2`, `e = 2`, and `F^{∘n}` has degree `2^n`, so `λ_1 = 2` and `λ_1² = 4 ≥ λ_2 = 2`. `F` is finite. Its extension has base point `[0 : 0 : 1]`, so it is not a morphism, yet `deg_{1,H}(f^n) = 2^n`.
- The Hénon map `F = (y, x + y²)` is an automorphism with `F^{∘n}` of degree `2^n`. So `λ_1 = 2`, `λ_2 = 1` and `λ_1² > λ_2`, the hypothesis of Dang–Favre's Theorem 2.
- Silverman's `F = (y, z, x + yz)` on `𝔸³` has iterates of degrees `2, 3, 5 = fib(n + 2)`, so `λ_1 = Real.goldenRatio` and, as an automorphism, `λ_3 = 1`.
- Non-example: `F = (x, xy)` is dominant and birational but not proper (the fibre over `(0, 1)` is empty), so the finiteness item does not apply.
- Non-example for `d = 0`: the tuple `F` is empty and `𝔸⁰ = Spec K`, so `a` is a maximum over the empty set. Its junk value `0` in `ℕ` contradicts `a ≥ 1`, which is why the layer assumes `d ≥ 1`.

### Examples

The Cremona involutions of `ℙ²` and `ℙ³`, the Fibonacci map, Frobenius, `(x², y)`, the Hénon map and Silverman's affine automorphism of `𝔸³`.

### Dependencies

Layers 1, 3, 4 and 5; CyclotomicClassGroupsAndStickelberger §4.3; SchemeAndStackFoundations §0.3; StableReduction Layer 2; ArithmeticDynamics §§0.18, 0.26 (Checks); Mathlib `Proj` with `Proj.fromOfGlobalSections`, `MvPolynomial` and its unique factorization, `IsFinite.iff_isProper_and_isAffineHom`, `Nat.fib`, `Real.goldenRatio`, and `Scheme.RationalMap.equivFunctionFieldOver`, `Scheme.RationalMap.comp`, `Scheme.RationalMap.IsDominant` and `Scheme.RationalMap.compHom` (§6.1); Tau Ceti `Scheme.RationalMap.toHom` and `Scheme.RationalMap.toRationalMap_toHom`, `TauCeti.ProjectiveSpectrum.fromOfGlobalSections_eq_of_unit_rescaling` and `AlgebraicGeometry.Proj.fromOfGlobalSections_naturality` (§6.1), and the twisting sheaf `AlgebraicGeometry.Proj.twistingSheaf` with `AlgebraicGeometry.Proj.isInvertible_twistingSheaf_of_iSup_eq_top` and `AlgebraicGeometry.Proj.lineBundleClass_twistingSheaf_eq_zpow`, and `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier` (§6.2).

## Downstream consumers

- DynamicalDegreesOfRationalMaps, Part II: numerical cycle spaces `N^k(X)_ℝ` of codimension `k ≥ 2` over an arbitrary field, the operators `f^*` on all `N^k(X)_ℝ` and the spectral description of `λ_k` (dang2020 Theorem 2; truong2020 Theorem 1.1 (5)), relative dynamical degrees and the product formula (dang2020 Theorem 4; truong2020 Theorem 1.1 (4)). It starts from §§4.1–4.5 and §3.6.
- A roadmap on arithmetic degrees and canonical heights of dominant rational self-maps of `ℙ^N` (silverman2014 §§4–5), continuing ArithmeticDynamics. It needs `λ_1`, §6.2 and the sub-multiplicativity of §4.4.
- A roadmap on spectral interpretations of dynamical degrees (Dang–Favre b-classes and Theorems 1–2 of dangfavre2021). It needs `deg_{k,ω}`, §4.5 and `λ_1, λ_2` on normal projective varieties and on `ℙ^d`.
- Roadmaps on complex dynamics: the Dinh–Sibony entropy bound and Guedj's invariant measures need `h_alg` and log-concavity.

## Worked examples

| map | `d` | `deg_{k,H}(f)` | `λ_k(f)` | `e(f)` | `h_alg(f)` |
| --- | --- | --- | --- | --- | --- |
| `z ↦ z²` on `ℙ¹` | 1 | `(1, 2)` | `(1, 2)` | 2 | `log 2` |
| Cremona `σ` on `ℙ²` | 2 | `(1, 2, 1)` | `(1, 1, 1)` | 1 | 0 |
| Fibonacci `[yz : xy : z²]` | 2 | `(1, 2, 1)`; `deg_{1,H}(f^n) = fib(n + 2)` | `(1, Real.goldenRatio, 1)` | 1 | `log Real.goldenRatio` |
| Frobenius on `ℙ^d`, char `p` | `d` | `(p^k)_k` | `(p^k)_k` | `p^d` | `d·log p` |
| extension of `(x², y)` | 2 | `(1, 2, 2)` | `(1, 2, 2)` | 2 | `log 2` |

The Fibonacci map has `deg_{2,H}(f) = e(f) = 1`. The extension of `(x², y)` has `deg_{2,H} = e = 2` and `deg_{1,H}(f^n) = 2^n`.

## References

- `dang2020`: N.-B. Dang, *Degrees of iterates of rational maps on normal projective varieties*, Proc. London Math. Soc. 121 (2020); arXiv:1701.07760v2. Theorems 1–4, Proposition 3.4.1, Remark 3.4.3, Theorem 3.4.4, Theorem 5.2.1.
- `truong2020`: T. T. Truong, *Relative dynamical degrees of correspondences over a field of arbitrary characteristic*, J. reine angew. Math. 758 (2020); arXiv:1605.05049v2. Theorem 1.1, Lemma 4.5, Theorem 5.3, §§6.3–6.4.
- `dangfavre2021`: N.-B. Dang, C. Favre, *Spectral interpretations of dynamical degrees and applications*, Ann. of Math. 194 (2021); arXiv:2006.10262v2. §1.3, Theorems 1.2–1.3, Theorems 1–2.
- `dinhsibony2005`: T.-C. Dinh, N. Sibony, *Une borne supérieure pour l'entropie topologique d'une application rationnelle*, Ann. of Math. 161 (2005); arXiv:math/0303271v2. Théorème 1, Proposition 6, Corollaire 7.
- `guedj2010`: V. Guedj, *Propriétés ergodiques des applications rationnelles*, Panoramas et Synthèses 30 (2010); arXiv:math/0611302v1. §2.1, Exemples 2.2 and 2.5, Théorème 2.4.
- `russakovskiishiffman1997`: A. Russakovskii, B. Shiffman, *Value distribution for sequences of rational mappings and complex dynamics*, Indiana Univ. Math. J. 46 (1997); arXiv:math/9604204v1. §4, Lemmas 4.4 and 4.6.
- `silverman2014`: J. H. Silverman, *Dynamical degrees, arithmetic degrees, and canonical heights for dominant rational self-maps of projective space*, Ergodic Theory Dynam. Systems 34 (2014); arXiv:1111.5664v2. §1 (maps by forms without common factor), §3, Examples 5–6, Proposition 7, §§4–5.
- `cutkosky2015`: S. D. Cutkosky, *Teissier's problem on inequalities of nef divisors over an arbitrary field*, arXiv:1304.1218v1. §2, Theorem 6.1, Corollary 6.3, Remark 6.2.
- `kleiman2005`: S. L. Kleiman, *The Picard scheme*, arXiv:math/0504020v1. Appendix B, Lemma B.12, Theorem B.27.
- `stacks-varieties`, `stacks-chow`, `stacks-morphisms`, `stacks-constructions`: The Stacks Project, chapters *Varieties* (Lemma 8.6, tag 054Q; §45, tags 0BEL–0BEX), *Chow Homology* (Lemma 41.4, tag 0BFI), *Morphisms* (Lemmas 6.7, 6.8, 24.4, 26.16, 38.7; Definition 52.8; tags 056B, 0CNG, 0383, 081I, 0892, 02NY) and *Constructions* (Lemma 13.1, tag 01NE).
- `lazarsfeld2004`: R. Lazarsfeld, *Positivity in Algebraic Geometry I*, Springer (2004). Theorem 1.4.9, Corollary 1.4.10, Theorem 1.6.1, Corollary 1.6.3, Theorem 2.2.15. Cited by locator.
- `fulton1998`: W. Fulton, *Intersection Theory*, 2nd ed., Springer (1998). Theorem 1.4, Proposition 2.5. Cited by locator.
